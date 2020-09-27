require_relative 'ExcersiseFactory'
#Comment from Daria
class Adapter
    def self.change_difficulty(excersise, desired_level)
        output = self.get_new_excersise(excersise, desired_level)
        output.series = excersise.series
        output
    end

    private

    # lets say this is a bug fix
    
    def self.get_new_excersise(excersise, level)
        classes = excersise.class.ancestors.to_s
        case
        when classes.include?('Burpees')
            ExcersisesList.get_burpees(level)
        when classes.include?('Plank')
            ExcersisesList.get_plank(level)
        when classes.include?('Pullups')
            ExcersisesList.get_pullups(level)
        when classes.include?('Pushups')
            ExcersisesList.get_pushups(level)
        when classes.include?('Squats')
            ExcersisesList.get_squats(level)
        end
    end

    # dupa blada

end
