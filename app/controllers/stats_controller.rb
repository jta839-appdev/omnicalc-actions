class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    # Median
    # ======

    @sort_num = @numbers.sort

    if @sort_num.length.odd?
      @num_key = (@sort_num.length)/2.0 - 0.5
      @median = @sort_num[@num_key]
    else
      @num_key_1 = (@sort_num.length)/2.0
      @median_1 = @sort_num[@num_key_1]
      @num_key_2 = (@sort_num.length)/2.0 - 1.0
      @median_2 = @sort_num[@num_key_2]
      @median = (@median_1 + @median_2)/2.0
    end
    
    @sum = 0
    @numbers.each do |num|
      @sum = @sum + num
    end

    @mean = @sum/@count

    # Variance
    # ========

    @variance = 0
    @numbers.each do |num|
      @variance = @variance + (num - @mean)**2
    end
    
    @variance = @variance / @count
    
    @standard_deviation = (@variance**((0.5)))
    
    # Mode
    # ====

    @loop_count = 1
    @num_counts = []
    @count_num = 0
    while @loop_count <= (@numbers.length) do
      @count_num = @numbers[@loop_count-1]
      @counter = 0
      @numbers.each do |num|
        if num == @count_num
         @counter = @counter + 1
        end
      end
      @num_counts.push(@counter)
      @loop_count = @loop_count + 1
    end
    
    @max_counts = @num_counts[0]
    @num_counts.each do |num|
      if (num > @max_counts) 
        @max_counts = num
      end
    end
  
    @loop_count = 1
    @num_counts = []
    @count_num = 0
      while @loop_count <= (@numbers.uniq.length) do
      @count_num = @numbers.uniq[@loop_count-1]
      @counter = 0
      @numbers.each do |num|
        if num == @count_num
         @counter = @counter + 1
          if @counter == @max_counts
            @mode = @count_num
          end
        end
      end
      @num_counts.push(@counter)
      @loop_count = @loop_count + 1
    end

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats/stats.html.erb")
  end
end
