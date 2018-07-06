class WordCountController < ApplicationController
  def word_count
    @text = params.fetch("user_text")
    @special_word = params.fetch("user_word")

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(/\s+/, "").length


    @clean_text = @text.gsub(/[^a-z0-9\s]/i, "")
    @array_text = @clean_text.split(/\s+/)
    
    @counter = 0
    @array_text.each do |word|
      if (word.capitalize == @special_word.capitalize) 
        @counter = @counter + 1
      end
    end
    
    @occurrences = @counter

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count/word_count.html.erb")
  end
end
