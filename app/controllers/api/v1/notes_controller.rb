class Api::V1::NotesController < ApplicationController
  def index
    head :ok
  end

  def show
    render json: NotesRepresenter.prepare(current_record)
  end

  def create
    render status: :created
  end

  def update
    head :ok
  end

  def destroy
    head :no_content
  end

  private

  def current_record
    @current_record ||= Note.find(params[:id])
  end

  def notes_params
    params.require(:note).permit(:title, :content)
  end
end
