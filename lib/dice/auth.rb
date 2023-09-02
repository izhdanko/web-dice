module Dice
	module Auth

		def login! player
			@current_player = find_player(player) || add_player!(player)
			log "Игрок #{@current_player.name} вошёл в игру."
			@current_player
		end

		def logout! player
			destroy_player! player
			log "Игрок #{player.name} вышел из игры."
		end

	end
end
