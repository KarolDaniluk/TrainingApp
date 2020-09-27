require_relative 'User'
require_relative 'ExcersiseRecords'


class RecordsDetector

    attr_reader :notes

    def initialize(user)
        @user = user
    end

    def update(excersise)
        updater = get_updater(excersise)
        record = updater.get_record(excersise)
        if (@user.personal_records.has_key? excersise.name)
            @user.personal_records[excersise.name].update(record, @user.notes, excersise.name)
        else
            @user.personal_records[excersise.name] = record
            @user.notes.push "Nowe ćwiczenie #{excersise.name}!"
        end
        @user.notify_observers()
        @user.notify_me()
    end

    private

    def get_updater(excersise)
        classes = excersise.class.ancestors.to_s
        case
        when classes.include?('Burpees')
            BurpeesUpdater.instance()
        when classes.include?('Plank')
            PlankUpdater.instance()
        when classes.include?('Pullups')
            PullupsUpdater.instance()
        when classes.include?('Pushups')
            PushupsUpdater.instance()
        when classes.include?('Squats')
            SquatsUpdater.instance()
        end
    end

end