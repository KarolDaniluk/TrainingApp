require 'singleton'
require_relative 'ex_pushups'
require_relative 'ex_pullups'
require_relative 'ex_squats'
require_relative 'ex_burpees'
require_relative 'ex_plank'


module IAbstractFactory
    def show()
        puts 'Abstract factory'
    end

    def get_pushups()
        Pushups.new()
    end

    def get_pullups()
        Pullups.new()
    end

    def get_plank()
        Plank.new()
    end

    def get_burpees()
        Burpees.new()
    end

    def get_squats()
        Squats.new()
    end
end


class ExcersisesList
    def self.get_pushups(level = 1)
        get_factory(level).get_pushups()
    end

    def self.get_pullups(level = 1)
        get_factory(level).get_pullups()
    end

    def self.get_plank(level = 1)
        get_factory(level).get_plank()
    end

    def self.get_burpees(level = 1)
        get_factory(level).get_burpees()
    end

    def self.get_squats(level = 1)
        get_factory(level).get_squats()
    end

    private

    def self.get_factory(exp_level = 1)
        case exp_level
        when 0
            BeginnerFactory.instance()
        when 1
            IntermidiateFactory.instance()
        when 2
            AdvancedFactory.instance()
        when 3
            ProfessionalFactory.instance()
        else
            puts 'Unknown experience level. Returning classig excersise'
            IntermidiateFactory.instance()
        end
    end
end


class BeginnerFactory
    include Singleton
    include IAbstractFactory

    def info()
        puts 'Beginner factory'
    end

    def get_pushups()
        KneePushups.new()
    end

    def get_pullups()
        AustralianPullups.new()
    end

    def get_plank()
        StraightArmPlank.new()
    end

    def get_burpees()
        SimpleBurpees.new()
    end

    def get_squats()
        BoxSquats.new()
    end
end


class IntermidiateFactory
    include Singleton
    include IAbstractFactory

    def info()
        puts 'Intermidiate factory'
    end

    def get_pushups()
        Pushups.new()
    end

    def get_pullups()
        Pullups.new()
    end

    def get_plank()
        Plank.new()
    end

    def get_burpees()
        Burpees.new()
    end

    def get_squats()
        Squats.new()
    end
end


class AdvancedFactory
    include Singleton
    include IAbstractFactory

    def info()
        puts 'Advanced factory'
    end

    def get_pushups()
        ClapPushups.new()
    end

    def get_pullups()
        MuscleUps.new()
    end

    def get_plank()
        ReachPlank.new()
    end

    def get_burpees()
        BoxJumpBurpees.new()
    end

    def get_squats()
        OneLegSquatsBack.new()
    end
end


class ProfessionalFactory
    include Singleton
    include IAbstractFactory

    def info()
        puts 'Professional factory'
    end

    def get_pushups()
        OneArmPushups.new()
    end

    def get_pullups()
        OneArmPullups.new()
    end

    def get_plank()
        Planche.new()
    end

    def get_burpees()
        BackflipBurpees.new()
    end

    def get_squats()
        OneLegSquatsFront.new()
    end
end