class TimeBetweenController < ApplicationController
  def time_between
    @starting = Chronic.parse(params.fetch("starting_time"))
    @ending = Chronic.parse(params.fetch("ending_time"))

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds / 60.0
    @hours = @minutes / 60.0
    @days = @hours / 24.0
    @weeks = @days / 7.0
    @years = @days / 365.0

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between/time_between.html.erb")
  end
end