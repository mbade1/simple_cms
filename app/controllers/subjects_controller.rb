class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @subjects = Subject.sorted #sorted is a scope method in the model
  end

  def show
    @subject = Subject.find_by_id(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count 
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject created successfully."
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find_by_id(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully."
      redirect_to(subjects_path(@subject))
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject, #{@subject.name} destroyed successfully."
    redirect_to(subjects_path)
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end
end
