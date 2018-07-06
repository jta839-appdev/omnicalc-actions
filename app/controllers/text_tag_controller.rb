class TextTagController < ApplicationController
  def text_tag
    @text = params.fetch("text")

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @input = @text
    @client = Algorithmia.client('simlJ9wx/oSafNDCInWjiABaNYH1')
    @algo = @client.algo('nlp/AutoTag/1.0.1')
    @result = @algo.pipe(@input).result

    @tags = @result

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("text_tag/text_tag.html.erb")
  end
end
