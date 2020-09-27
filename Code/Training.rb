require 'date'
require_relative 'Copy'

class Training
    include Copy

    attr_accessor :date, :excersises, :training_id, :comments

    def initialize()
        @date = Date.today
        @excersises = []
        @training_id = nil
        @comments = nil
    end

    def add_excersise(excersise)
        @excersises << excersise
    end

    def add_excersises(excersises_list)
        @excersises += excersises_list
    end

    def comment(com)
        @comments = com
    end

    def info()
        puts "Training from #{@date}"
        puts "\tComment: #{@comments}" if (!@comment.nil?)
    end

    def show()
        puts "TRAINING from #{date} has #{@excersises.length} excersises:"
        show_excersises()
    end

    def show_excersises()
        if (@excersises.any?)
            @excersises.each {|e| print "\t"; e.show()}
        else
            puts "\tNo excersises :("
        end
    end

    def copy(offset = 1)
        new_training = self.deep_copy()
        new_training.date = @date + offset
        new_training
    end
end

