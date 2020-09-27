
class User

    attr_accessor :name, :email, :personal_records, :observers, :notes
    attr_reader :experience

    def initialize(name, email, experience)
        @name = name
        @email = email
        @observers = []
        @personal_records = Hash.new()
        @notes = []
        change_experience(experience)
    end

    def change_experience(experience)
        experience = experience.to_s.downcase
        case experience
        when 'beginner', '0'
            puts 'You are a beginner'
            @experience = 0
        when 'intermidiate', '1'
            puts 'You are intermidiate'
            @experience = 1
        when 'advanced', '2'
            puts 'You are advanced!'
            @experience = 2
        when 'pro', '3'
            puts 'You are PRO!'
            @experience = 3
        end
    end

    def notify(usernname, notes)
        puts "User #{usernname} has #{notes.length} new record(s):"
        puts notes
    end

    def notify_observers()
        @observers.each do |o|
            o.notify(@name, @notes)
        end
    end

    def show()
        puts "User name: #{@name}\nemail: #{@email}\nexperience level: #{@experience}"
    end

    def notify_me()
        if (@notes.length > 0)
            puts "You have #{@notes.length} new record(s):"
            puts @notes
            @notes = []
        end
    end

    def add_observer(observer)
        @observers.push observer
    end
    
    def del_observer(observer)
        @observers.delete observer
    end

    def show_records()
        puts "#{@name.upcase} PERSONAL RECORDS:"
        @personal_records.each {|k, r| puts "- excersise #{k}:"; r.show}
    end
end

