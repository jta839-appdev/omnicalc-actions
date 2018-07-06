class ImageTagController < ApplicationController
  def image_tag
    input = {
      image: params.fetch("image_url")
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @original_image_url = params.fetch("image_url")
    
    
    @client = Algorithmia.client('simlJ9wx/oSafNDCInWjiABaNYH1')
    @algo = @client.algo('deeplearning/IllustrationTagger/0.4.0')
    @result = @algo.pipe(input).result
    
    @tag_hashes = @result.dig("general")

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("image_tag/image_tag.html.erb")
  end
end
