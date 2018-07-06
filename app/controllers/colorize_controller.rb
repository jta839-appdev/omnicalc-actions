class ColorizeController < ApplicationController
  def colorize
    input = {
      image: params.fetch("image_url")
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @original_image_url = params.fetch("image_url")
    
    
    @client = Algorithmia.client('simlJ9wx/oSafNDCInWjiABaNYH1')
    @algo = @client.algo('deeplearning/ColorfulImageColorization/1.1.13')
    @result = @algo.pipe(input).result
    
    @colorized_image_url = @result.dig("output").gsub("data://","https://algorithmia.com/v1/data/")

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("colorize/colorize.html.erb")
  end
end

