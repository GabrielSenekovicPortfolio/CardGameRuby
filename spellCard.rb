require_relative './card.rb'
require_relative './cardTypes.rb'
require_relative './element.rb'

class SpellCard < Card
    def initialize(name, path, backSprite, damage, element)
        super(name, path, backSprite)
        @damage = damage
        @element = element
        @cardType = CardType::SPELL
    end
    def Play(playerDeck, opponentDeck)
        opponentDeck.StartSelect(true)
    end
end