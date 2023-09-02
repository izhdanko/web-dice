module Dice
	class Rules

		attr_accessor :bet

		def initialize dice_number
			@dice_number = dice_number
			@dice = Array.new (dice_number) {Dice.new(6)}
		end

		def roll_dice
			puts "Бросок кубиков."
			@result = 0
			@dice.each{ |dice| @result += dice.roll }
			puts "Фортуна выбирает #{@result}"
			@result
		end

		def winner?
			@result == @bet
		end

		def count stake, current_player
			method = if winner?
				stake *= 2
				:inc
			else
				:dec
			end

			current_player.send "#{method}_credit", stake

		end

	end
end
