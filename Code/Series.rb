class Series
    attr_accessor :reps, :weight, :time, :series_id
    
    def initialize(reps, weight, time, id = nil)
        @reps = reps
        @weight = weight
        @time = time
        @series_id = id
    end

    def show()
        print "#{@reps} reps | " unless (@reps.nil?)
        print "#{@weight} kg | " unless (@weight.nil?)
        print "#{@time} sec | " unless (@time.nil?)
        print "\n"
        #puts "#{@reps} reps with #{@weight} kg and #{@time} s of time"
    end
end