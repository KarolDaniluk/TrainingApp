require_relative 'Excersise'
require_relative 'Series'

class Burpees < Excersise
    def initialize
        super 'Burpees'
        @difficulty = 1
        @description = 'Classic Burpee'
    end

    def add_series(reps = nil, time = nil)
        super Series.new(reps, nil, time)
    end

    def add_series_text()
        puts 'Give: reps, time'
        x = gets.chomp().delete(' ').split(',').map(&:to_i)
        add_series(x[0], x[1])
        print "Added "
        print "#{x[0]} reps " unless (x[0].nil?)
        print "#{x[1]} sec " unless (x[1].nil?)
        print "\n"
    end
end


class SimpleBurpees < Burpees
    def initialize
        super
        @name = 'Simple Burpee'
        @difficulty = 0
        @description = 'Walk Back Squat Thrust'
    end
end


class BoxJumpBurpees < Burpees
    def initialize
        super
        @name = 'Box Jump Burpee'
        @difficulty = 0
        @description = 'Burpee with jumping on the box'
    end
end


class BackflipBurpees < Burpees
    def initialize
        super
        @name = 'Backflip Burpee'
        @difficulty = 3
        @description = 'Burpee ended with a backflip'
    end
end