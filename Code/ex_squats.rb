require_relative 'Excersise'
require_relative 'Series'

class Squats < Excersise
    def initialize
        super 'Squats'
        @difficulty = 1
        @description = 'Classic squats'
    end

    def add_series(reps, weight = nil)
        super Series.new(reps, weight, nil)
    end

    def add_series_text()
        puts 'Give: reps, weight'
        x = gets.chomp().delete(' ').split(',').map(&:to_i)
        add_series(x[0], x[1])
        print "Added "
        print "#{x[0]} reps " unless (x[0].nil?)
        print "#{x[1]} kg " unless (x[1].nil?)
        print "\n"
    end
end


class BoxSquats < Squats
    def initialize
        super
        @name = 'Box Squats'
        @difficulty = 0
        @description = 'Sit on a box and stand up'
    end
end


class OneLegSquatsBack < Squats
    def initialize
        super
        @name = 'One Leg Squats Back'
        @difficulty = 2
        @description = 'Squats with one leg to the back'
    end
end


class OneLegSquatsFront < Squats
    def initialize
        super
        @name = 'One Leg Squats Front'
        @difficulty = 3
        @description = 'Squats with one leg to the front'
    end
end
