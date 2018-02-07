function UIPermission(){

  var env = {};

  var
    $list_user_access = $('#user-access-list'),
    $input_user_access = $('div[name=user-access-input]'),
    $item_user_access = $('div[name=user-access-item]');


  function permissionAddApi(){

    var $input = $(this).parent('div[name=user-access-input]');

    // ajax - POST
    var data = {
      username: $input.find('#select2-input-username-container')[0].innerText.split('/')[0].trim(),
      role: $input.find('select[name=input-role]').val(),
      project_id: document.location.pathname.split("/")[2],
      control: 'ADD'
    };

    $.ajax({
      type: 'POST',
      url: '/projects/permission',
      data: data,
      dataType: 'json',
      success: callbackPermissionAddApi(data, $input)
    });

  }

  function callbackPermissionAddApi(data, $input){

    // get data
    var $select2_input = $('#select2-input-username-container')[0].innerText.split('/');
    var template_data = {
      username:        $select2_input[0].trim(),
      email:        $select2_input[1].trim(),

      role: (data.role == 'ROLE_ADMIN') ? 'Admin' : ((data.role == 'ROLE_OWNER') ? 'Owner' : 'Planner'),
      icon: (data.role == 'ROLE_ADMIN') ? 'fa-users' : ((data.role == 'ROLE_OWNER') ? 'fa-user-circle' : 'fa-user-o'),
      icon_delete_permission: (data.role == 'ROLE_ADMIN') ? 'fa-check-circle-o' : '-',
      icon_update_permission: (data.role == 'ROLE_ADMIN' || data.role == 'ROLE_OWNER') ? 'fa-check-circle-o' : '-',
      icon_create_permission: (data.role == 'ROLE_ADMIN' || data.role == 'ROLE_OWNER' || data.role == 'ROLE_PLANNER') ? 'fa-check-circle-o' : '-'
    };

    // add template UI
    var $template_item = $('#template-user-access-item');
    var html = Mustache.render($template_item.html(), template_data);
    $list_user_access.append(html);

    // add remove event
    var item_id = '#user-access-item-' + template_data.username;
    $(item_id).on('click', 'div[name=item-btn-remove]', permissionRemoveApi);

    // noty
    new Noty({
      type: 'success',
      layout: 'topRight',
      text: template_data.username + '님 권한이 추가 되었습니다.'
    }).show().setTimeout(3500);

    // set defalut
    $input.find('input[name=input-username]').val(null);
    $input.find('select[name=input-role]').val('ROLE_NULL')

  }

  function isDuplicateUsername(input_username){

    var $items = $('#user-access-list').find('div[name=user-access-item]');

    for(var i=0 ; i < $items.length ; i++){
      if ($($items[i]).data('username') == input_username) {

        // noty
        new Noty({
          type: 'error',
          layout: 'topRight',
          text: 'WARN: ' + input_username + '님 권한이 이미 부여되어있습니다.'
        }).show().setTimeout(5500);

        return true;
      }
    }
    return false;
  }

  function permissionRemoveApi(){

    var $item = $(this).parent('div[name=user-access-item]');

    // ajax - POST
    var data = {
      username: $item.data('username'),
      role: ($item.data('role') == 'Admin') ? 'ROLE_ADMIN' : (($item.data('role') == 'Owner') ? 'ROLE_OWNER' : 'ROLE_PLANNER'),
      user_name: $item.data('user-name'),
      project_id: document.location.pathname.split("/")[2],
      control: 'REMOVE'
    };

    $.ajax({
      type: 'POST',
      url: '/projects/permission',
      data: data,
      dataType: 'json',
      success: callbackPermissionRemoveApi(data, $item)
    });

  }

  function callbackPermissionRemoveApi(data, $item){

    // remove UI
    $item.remove();

    // noty
    new Noty({
      type: 'error',
      layout: 'topRight',
      text: data.username + '님 권한이 삭제 되었습니다.'
    }).show().setTimeout(3500);

  }

  return {
    init: function () {

      // EVENT
      $input_user_access.on('click', 'button[name=input-add-btn]', permissionAddApi);
      $item_user_access.on('click', 'div[name=item-btn-remove]', permissionRemoveApi);

    }
  }
}