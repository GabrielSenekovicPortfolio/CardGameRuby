require_relative './card.rb'

class ReactionCard < Card
    def initialize(name, path, backSprite)
        super(name, path, backSprite)
        @cardType = CardType::REACTION
    end

    def Play(playerDeck, opponentDeck)
        
    end
end