class Api::V1::NotesController < ApplicationController
  def index
    head :ok
  end

  def show
    head :ok
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
end
