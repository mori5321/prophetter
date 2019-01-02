class ImagesController < ApplicationController
  def ogp
    text = ogp_params[:text] || "Sample"
    image = ImageTextMixer.build(text).tempfile.open.read
    send_data image, type: 'image/png', disposition: 'inline'
  end

  private
    def ogp_params
      params.permit(:text)
    end
end
