require_relative 'core_ext/object'
require_relative 'dice/game'
require_relative 'player'

module Dice

	# VERSION = "1.0.0"

	RELEASE = "1"
	MIDDLE = "0"
	MINOR = "0"

	def self.version
		[RELEASE, MIDDLE, MINOR].join(".")
	end

end

# puts "VERSION #{Dice::VERSION}"
puts "VERSION #{Dice.version}"
puts

puts 'Добро пожаловать в игру Кости - Dice!'
puts
