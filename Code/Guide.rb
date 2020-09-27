#require 'singleton'
require_relative 'Training'
#require_relative 'Excersise'
#require_relative 'Series'
require_relative 'RecordsDetector'
require_relative 'ExcersiseFactory'
require_relative 'Adapter'

class TrainingGuide

    attr_reader :training, :detector

    def initialize(user)
        @user = user
    end

    def start()
        @detector = RecordsDetector.new(@user)
        @training = Training.new()
        adding_excersises()
    end

    def adding_excersises()
        key = ''
        while key != '0'
            puts '0. Finish workout'
            puts '1. Add Pushups'
            puts '2. Add Burpees'
            puts '3. Add Pullups'
            puts '4. Add Plank'
            puts '5. Add Squats'
            key = gets().chomp
            add_excersise(key)
        end
    end

    def adding_series()
        key = ''
        while key != '0'
            puts '0. Finish excersise'
            puts '1. Add series'
            puts '2. Remove last series'
            puts '3. Change difficulty'
            key = gets().chomp
            add_series(key)
        end
    end

    private

    def add_excersise(key)
        case key
        when '0'
            puts 'Workout has finished'
            @training
        when '1'
            @current_excersise = ExcersisesList.get_pushups(@user.experience)
            puts "Adding #{@current_excersise.name}"
            adding_series()
        when '2'
            @current_excersise = ExcersisesList.get_burpees(@user.experience)
            puts "Adding #{@current_excersise.name}"
            adding_series()
        when '3'
            @current_excersise = ExcersisesList.get_pullups(@user.experience)
            puts "Adding #{@current_excersise.name}"
            adding_series()
        when '4'
            @current_excersise = ExcersisesList.get_plank(@user.experience)
            puts "Adding #{@current_excersise.name}"
            adding_series()
        when '5'
            @current_excersise = ExcersisesList.get_squats(@user.experience)
            puts "Adding #{@current_excersise.name}"
            adding_series()
        else
            puts 'Unrecognized input. Try again or finish workout'
        end
    end
    
    def add_series(key)
        case key
        when '0'
            @training.add_excersise @current_excersise
            detector.update(@current_excersise)
            puts "Excersise #{@current_excersise.name} has finished"
        when '1'
            @current_excersise.add_series_text()
            @current_excersise.show()
        when '2'
            @current_excersise.del_series()
            @current_excersise.show()
        when '3'
            change_difficulty()
        else
            puts 'Unrecognized input. Try again or finish excersise'
        end
    end

    def change_difficulty()
        puts 'Podaj poziom'
        level = gets.chomp.to_i
        @current_excersise = Adapter.change_difficulty(@current_excersise, level)
        puts "Changed to #{@current_excersise.name}"
    end

end

