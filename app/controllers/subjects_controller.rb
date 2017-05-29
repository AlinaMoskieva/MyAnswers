class SubjectsController < ApplicationController
  before_action :authorize!, except: %i(show index)

  expose :subjects, -> { Subject.all }
  expose :subject
  expose :units, -> { subject.units }

  def create
    subject.save
    respond_with subject
  end

  def update
    subject.update_attributes(subject_params)
    respond_with subject
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :course_id)
  end

  def authorize!
    authorize subject, "manage?"
  end
end
