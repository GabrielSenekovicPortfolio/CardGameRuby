require 'ruby2d'

class Player
    attr_accessor :actionsTaken, :actionsMax, :reactionsTaken, :reactionsMax, :turnEnded

    def initialize(isPlayer)
        @actionsTaken = 0
        @actionsMax = 1
        @reactionsTaken = 0
        @reactionsMax = 1
        @turnEnded = false
        
        @actionsLeftText = Text.new('Actions Left: 1', x: 0, y: Window::height - 100, size: 12)
        @reactionsLeftText = Text.new('Reactions Left: 1', x: 0, y: Window::height - 80, size: 12)

        if not isPlayer
            @actionsLeftText.remove
            @reactionsLeftText.remove
        end
    end

    def MovesLeft(bool)
        bool = @actionsTaken < @actionsMax or @reactionsTaken < @reactionsMax
    end

    def UpdateActions(value)
        @actionsTaken = @actionsTaken + value
        @actionsLeftText.text = 'Actions Left: ' + (@actionsMax - @actionsTaken).to_s
    end

    def UpdateReactions(value)
        @reactionsTaken = @reactionsTaken + value
        @reactionsLeftText.text = 'Reactions Left: ' + (@reactionsMax - @reactionsTaken).to_s
    end

    def EndTurn()
        @turnEnded = true
    end
end