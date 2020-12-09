class UploadsController < ApplicationController
  def create
    @upload = Upload.create!(params.permit(:file))
    render json: { ret: 1,  data: { ent: Rails.application.routes.url_helpers.rails_blob_path(@upload.file, only_path: true) } }
  end
end