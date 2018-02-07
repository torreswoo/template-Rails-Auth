class ProjectPresenter < SimpleDelegator
  include ApplicationHelper
  include ActionView::Helpers::DateHelper

  def model
    __getobj__
  end


  def owner_fmt
    if model.owner.first.nil?
      return '-'
    end
    "<span data-toggle='tooltip' data-html='true' title='#{model.owner.first.split('/')[1].strip}'>#{model.owner.first.split('/')[0].strip}</span>".html_safe
  end

  def audit_modified_fmt
    modified_time = time_ago_in_words(model.updated_at)
    modified_user = model.audits.last.nil? ? '-' : ' by ' + User.find(model.audits.last.user_id).username

    modified_detail = modified_time + modified_user
  end
end