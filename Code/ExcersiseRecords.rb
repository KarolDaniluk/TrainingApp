require 'singleton'

class SimpleRecord
    attr_accessor :name, :value, :date
    def initialize(name, value = 0, date = 0)
        date = Date.today() if (date == 0)
        @name = name
        @value = value
        @date = date
    end

    def show()
        puts "#{@name}: #{@value} on #{@date}"
    end
end


module IExcersiseUpdater
    def get_record(excersise)
        raise NotImplementedError
    end
end


class BurpeesUpdater
    include Singleton
    include IExcersiseUpdater
    
    def get_record(excersise)
        record = ExcersiseRecord.new
        record.set_reps(excersise)
        record.set_time(excersise)
        record
    end
end


class PlankUpdater
    include Singleton
    include IExcersiseUpdater

    def get_record(excersise)
        record = ExcersiseRecord.new
        record.set_time(excersise)
        record.set_weight(excersise)
        record
    end
end


class PullupsUpdater
    include Singleton
    include IExcersiseUpdater

    def get_record(excersise)
        record = ExcersiseRecord.new
        record.set_reps(excersise)
        record.set_weight(excersise)
        record
    end
end


class PushupsUpdater
    include Singleton
    include IExcersiseUpdater

    def get_record(excersise)
        record = ExcersiseRecord.new
        record.set_reps(excersise)
        record.set_weight(excersise)
        record
    end
end


class SquatsUpdater
    include Singleton
    include IExcersiseUpdater

    def get_record(excersise)
        record = ExcersiseRecord.new
        record.set_reps(excersise)
        record.set_weight(excersise)
        record
    end
end


class ExcersiseRecord
    attr_accessor :records

    def initialize()
        @records = Hash.new()
    end

    def show()
        @records.each do |key, record|
            record.show() unless (record.value == 0)
        end
    end

    def set_reps(excersise)
        reps = excersise.get_reps()
        @records['Max reps'] = SimpleRecord.new('Max reps', reps.max)
        @records['Sum reps'] = SimpleRecord.new('Sum reps', reps.sum)
    end

    def set_weight(excersise)
        weights = excersise.get_weights()
        @records['Max weight'] = SimpleRecord.new('Max weight', weights.max)
        @records['Sum weight'] = SimpleRecord.new('Sum weight', weights.sum)
    end

    def set_time(excersise)
        times = excersise.get_times()
        @records['Max time'] = SimpleRecord.new('Max time', times.max)
        @records['Sum time'] = SimpleRecord.new('Sum time', times.sum)
    end

    def update(new_record, user_notes = nil, excersise_name = nil)
        new_record.records.each do |k, r|
            if (r.value > @records[k].value)
                @records[k] = r
                user_notes.push "#{r.value} #{r.name.downcase} in excersise #{excersise_name}" unless (user_notes.nil?)
            end
        end
    end
end


