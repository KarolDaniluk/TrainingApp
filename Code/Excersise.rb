class Excersise
    attr_accessor :name, :series, :excersise_id, :difficulty, :desc, :description

    def initialize(name)
        @name = name
        @description = nil
        @series = []
        @difficulty = nil
        @excersise_id = nil
    end

    def add_series(series)
        @series << series
    end

    def del_series()
        @series.pop
    end
    
    def info()
        puts @name
        puts "\t#{@description}" if (!@description.nil?)
    end

    def show()
        puts "Excersise #{@name} has #{@series.length} series:"
        show_series()
    end

    def get_reps()
        reps = [0]
        @series.each {|s| reps.push s.reps unless s.reps.nil?}
        reps
    end

    def get_times()
        times = [0]
        @series.each {|s| times.push s.time unless s.time.nil?}
        times
    end

    def get_weights()
        weights = [0]
        @series.each {|s| weights.push s.weight unless s.weight.nil?}
        weights
    end

    # def change_difficulty(desired_level)

    # end

    private

    def show_series()
        if (series.any?)
            @series.each {|s| print "\t"; s.show()}
        else
            puts "\tNo series :("
        end
    end

end

