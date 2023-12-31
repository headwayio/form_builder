class FormsController < ApplicationController
  before_action :set_form, except: [:index]
  
  def index
  end

  def show
    @version = Version.find_by(id: params[:version]) || @form.latest
  end

  def new
  end

  def create
    @form = Form.create(form_parameters)
    if @form
      redirect_to form_path(@form)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @form.update(form_parameters)
      redirect_to form_path(@form)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_form
    @form ||= Form.find_by(id: params[:id]) || Form.new
  end 

  def form_parameters
    params.require(:form).permit(
                            :name, 
                            versions_attributes: [
                              :id,
                              :name,
                              :_destroy,
                              sections_attributes: [
                                :id,
                                :name,
                                questions_attributes: [
                                  *question_attributes,
                                  options: [],
                                  columns: [],
                                  children_attributes: [
                                    *question_attributes
                                  ]
                                ]
                              ]
                            ], 
                            
                          )
  end

  def question_attributes
    %i(id _destroy text input_type required)
  end
end
