class Api::V1::NotesController < ApplicationController
  before_action :current_record, only: %i[show update destroy]

  def index
    head :ok
  end

  def show
    render json: NotesRepresenter.prepare(current_record)
  end

  def create
    note = Note.create!(note_params)
    render json: NotesRepresenter.prepare(note), status: :created
  end

  def update
    current_record.update!(note_params)
    render json: NotesRepresenter.prepare(current_record), status: :ok
  end

  def destroy
    current_record.destroy
    head :no_content
  end

  private

  def current_record
    @current_record ||= Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
