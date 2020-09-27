require_relative 'Excersise'
require_relative 'Series'

class Plank < Excersise
    def initialize
        super 'Plank'
        @difficulty = 1
        @description = 'Classic plank'
    end

    def add_series(time, weight = nil)
        super Series.new(nil, weight, time)
    end

    def add_series_text()
        puts 'Give: time, weight'
        x = gets.chomp().delete(' ').split(',').map(&:to_i)
        add_series(x[0], x[1])
        print "Added "
        print "#{x[0]} sec " unless (x[0].nil?)
        print "#{x[1]} kg " unless (x[1].nil?)
        print "\n"
    end
end


class StraightArmPlank < Plank
    def initialize
        super
        @name = 'Straight Arm Plank'
        @difficulty = 0
        @description = 'High plank with straight arms'
    end
end


class ReachPlank < Plank
    def initialize
        super
        @name = 'Reach Plank'
        @difficulty = 2
        @description = 'Plank with one hand reaching forward'
    end
end


class Planche < Plank
    def initialize
        super
        @name = 'Planche'
        @difficulty = 3
        @description = 'Plank with arms only - feet are in the air'
    end
end
