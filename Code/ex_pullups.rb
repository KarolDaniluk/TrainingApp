require_relative 'Excersise'
require_relative 'Series'

class Pullups < Excersise
    def initialize
        super 'Pull-ups'
        @difficulty = 1
        @description = 'Classic pull ups'
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


class AustralianPullups < Pullups
    def initialize
        super
        @name = 'Australian pull-ups'
        @difficulty = 0
        @description = 'Pull ups with chest high grip and feet on the ground'
    end
end


class MuscleUps < Pullups
    def initialize
        super
        @name = 'Muscle Ups'
        @difficulty = 2
        @description = 'Pull ups to the waist line'
    end
end


class OneArmPullups < Pullups
    def initialize
        super
        @name = 'One Arm Pull-ups'
        @difficulty = 3
        @description = 'Pull ups with one arm only'
    end
end