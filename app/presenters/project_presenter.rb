class ProjectPresenter < SimpleDelegator
  include ApplicationHelper

  def model
    __getobj__
  end


end