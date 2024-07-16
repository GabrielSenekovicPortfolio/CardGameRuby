require 'ruby2d'
require_relative './player.rb'

class NPC < Player
    def MakeDecision(opponentDeck)

    end

    def AssessOpponentsActiveBoard(strategy)
        strategy = 'normal'

        #if opponent looks strong, or like they will use a big attack, defend
        #if opponent looks weak, or just used a big attack, attack
        #if low on health, try to heal
        #maybe each card in my hand has its own "when good" use case that shoul be checked against the opponent
    end
end