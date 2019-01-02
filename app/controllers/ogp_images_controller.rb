class OgpImagesController < ApplicationController
  skip_before_action :authenticate!

  def ogp
    text = ogp_params[:text] || "Sample"
    date = ogp_params[:date] || Time.zone.now.to_date.strftime('%Y/%m/%d')
    image = ImageTextMixer.build(text, date).tempfile.open.read
    send_data image, type: 'image/png', disposition: 'inline'
  end

  private
    def ogp_params
      params.permit(:text)
    end
end
