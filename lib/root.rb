require 'erb'
require_relative '../lib/dice'

module App

  class Root

    def call env
      request = Rack::Request.new(env)
      @body = ""

      if request.params["action"] == "login" && request.params["username"] && request.params["dicenum"]
        @player_name = request.params["username"]
        @dice_num = request.params["dicenum"]
        @game = Dice::Game.new request.params["dicenum"].to_i
        @player = Player.new request.params["username"].to_s

        @game.login! @player
        @credit = @player.credit

        @body = ERB.new(File.read('data/bet.rhtml')).result(binding)

      elsif request.params["action"] == "run" && request.params["bet"] && request.params["stake"]
        @bet = request.params["bet"].to_i
        @stake = request.params["stake"].to_i

        result = @game.run @bet, @stake
        message = result[0] + "<br />" + result[1]

        @credit = @player.credit

        @body = ERB.new(File.read('data/bet.rhtml')).result(binding)

      elsif request.params["action"] == "logout"
        @game.logout! @player

        @body = ERB.new(File.read('data/login.rhtml')).result(binding)
      else
        @body = ERB.new(File.read('data/login.rhtml')).result(binding)
      end

      [ 200, headers, [@body] ]
    end


    private

    def headers
      {
        'Content-Type' => 'text/html'
      }
    end

  end
end
