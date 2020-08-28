class OgpImagesController < ApplicationController
  def show
    text = ogp_params[:text]
    english_text = ogp_params[:english_text]
    image = OgpCreator.build(text, english_text).tempfile.open.read
    if ogp_params[:download].present?
      send_data image, type: 'image/png', disposition: 'attachment', filename: "youzyo_document.png"
    else
      send_data image, :type => 'image/png', :disposition => 'inline'
    end
  end

  private
  def ogp_params
    params.permit(:text, :download, :english_text)
  end
end