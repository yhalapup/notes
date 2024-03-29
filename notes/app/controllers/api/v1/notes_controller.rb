class Api::V1::NotesController < ApplicationController
  before_action :current_record, only: %i[show update destroy]

  def index
    records, links, total_pages = Pagination::Handler.new(**pagination_params).execute

    render json: NotesRepresenter.for_collection.prepare(records).to_hash.merge(total_pages, links)
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

  def search
    params[:scope] = Notes::Search.new(**search_params).execute
    records, links, total_pages = Pagination::Handler.new(**pagination_after_search_params).execute

    render json: NotesRepresenter.for_collection.prepare(records).to_hash.merge(total_pages, links)
  end

  private

  def current_record
    @current_record ||= Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def pagination_params
    params.permit(:scope, :page, :path)
          .with_defaults(scope: Note, page: 1, path: request.path)
          .to_h
          .deep_symbolize_keys
  end

  def search_params
    params.permit(:query)
          .to_h
          .deep_symbolize_keys
  end

  def pagination_after_search_params
    ActionController::Parameters.new(
      pagination_params.merge!(scope: params[:scope])
    )&.permit!&.to_h&.symbolize_keys
  end
end
