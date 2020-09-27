require_relative 'Guide'
require_relative 'User'
#require_relative 'Training'
#require_relative 'RecordsDetector'
#require_relative 'ExcersiseRecords'


jan = User.new('Jan', 'jan.kowalski@gmail.com', 1)
jan.show()


x = TrainingGuide.new(jan)
x.start()

jan.show_records