class VersionsController < ApplicationController
  def create
    if create_version
      flash[:notice] = "Successfully Created!"
      redirect_to edit_form_path(params[:form_id])
    else
      flash[:error] = "Something went wrong"
      redirect_to form_path(params[:form_id])
    end
  end

  def destroy
    @form = Form.find(params[:form_id])
    
    if @form.latest.destroy
      redirect_to form_path(@form)
    else
      redirect_to edit_form_path(@form)
    end
  end

  private

  def create_version
    FormVersionService.call(params[:form_id])
  end
end