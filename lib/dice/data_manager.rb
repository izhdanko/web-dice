module Dice
	module DataManager

		def find_player current_player
			@players.find{ |player| player.name == current_player.name }
		end

		def add_player! player
			@players.push(player)
			log "Добавился игрок #{player.name}."
			player
		end

		def destroy_player! current_player
			@players.delete_if{ |player| player.name == current_player.name }
		end

	end
end
