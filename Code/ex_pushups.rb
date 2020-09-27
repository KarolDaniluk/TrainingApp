require_relative 'Excersise'
require_relative 'Series'

class Pushups < Excersise
    def initialize
        super 'Push-ups'
        @difficulty = 1
        @description = 'Classic push ups'
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


class KneePushups < Pushups
    def initialize
        super
        @name = 'Knee Push-ups'
        @difficulty = 0
        @description = 'Push ups on knees'
    end
end


class ClapPushups < Pushups
    def initialize
        super
        @name = 'Clap Push-ups'
        @difficulty = 2
        @description = 'Push ups with clap on the peak'
    end
end


class OneArmPushups < Pushups
    def initialize
        super
        @name = 'One Arm Push-ups'
        @difficulty = 3
        @description = 'Push ups with one arm only'
    end
end



# x = Pushups.new()
# x.add_series(5)
# x.add_series(6)
# x.add_series(3,2)
# x.show()


# y = KneePushups.new()
# y.add_series(6)
# y.add_series(5)
# y.add_series(3,2)
# y.show()

# z = OneArmPushups.new()
# z.show()

# zaimplementować konkretne ćwiczenia