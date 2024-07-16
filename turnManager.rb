require 'ruby2d'

class TurnManager
    attr_accessor :currentPlayer

    def initialize(player_one, player_two)
        @player_one = player_one
        @player_two = player_two
        @currentPlayer = @player_one
        @turnCounter = 1;
        @turnCounterText = Text.new('Turn: 1', x: 0, y: 0, size: 20)
    end

    def Update
        if not @currentPlayer.ActionsLeft()
            SwapPlayer
        elsif @currentPlayer.turnEnded
            SwapPlayer
        end
    end

    def SwapPlayer
        if @currentPlayer == @player_one
            @currentPlayer = @player_two
        else
            @currentPlayer = @player_one
            @turnCounter = @turnCounter + 1
            @turnCounterText.text = 'Turn: ' + @turnCounter.to_s
        end
    end
end