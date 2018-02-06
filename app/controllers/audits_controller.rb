class AuditsController < ApplicationController

  def index


    if !params[:project_id].nil?
      return @audits = Project.find(params[:project_id])
                         .audits
                         .reorder(version: :desc)
                         .order(id: :desc)
                         .paginate(:page => params[:page])
    end

    if !params[:post_id].nil?
      return @audits = Post.find(params[:post_id])
                         .audits
                         .reorder(version: :desc)
                         .order(id: :desc)
                         .paginate(:page => params[:page])
    end



    @audits = Audit
                .search("auditable_type", params[:auditable_type])
                .search("user_id", params[:user_id])
                .search(params[:f_field], params[:search])
                .order(id: :desc)
                .paginate(:page => params[:page])
  end


  private
    def audit_params
      params.require(:audits).permit(:ptype, :name, :keyname, :description, :service)
    end
end