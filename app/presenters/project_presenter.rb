class ProjectPresenter < SimpleDelegator
  include ApplicationHelper

  def model
    __getobj__
  end


  def owner_fmt
    if model.owner.first.nil?
      return '-'
    end
    "<span data-toggle='tooltip' data-html='true' title='#{model.owner.first.split('/')[1].strip}'>#{model.owner.first.split('/')[0].strip}</span>".html_safe
  end
end