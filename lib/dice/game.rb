require_relative 'data_manager'
require_relative 'auth'
require_relative 'dice'
require_relative 'rules'

module Dice
	class Game

		include DataManager
		include Auth

		attr_reader :players

		def initialize dice_number
			@rules = Rules.new dice_number
			@players = []
		end

		def run bet, stake
			@rules.bet = bet
			res = Array.new()
			res[0] = @rules.roll_dice

			if res[0] == @rules.bet
				@rules.count stake, @current_player
				res[1] = "Вы выиграли! Поздравляем!"
				res[0] = "Ваша ставка: #{@rules.bet}. Результат: #{res[0]}."
				res
			else
				@rules.count stake, @current_player
				res[1] = "Вы проиграли, но не расстраивайтесь. Попробуйте снова!"
				res[0] = "Ваша ставка: #{@rules.bet}. Результат: #{res[0]}."
				res
			end
		end

	end
end
