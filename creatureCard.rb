require_relative './card.rb'

class CreatureCard < Card
    attr_accessor :name, :sprite, :backSprite
    
    def initialize(name, path, backSprite, health, element)
        super(name, path, backSprite)
        @health = health
        @element = element
        @cardType = CardType::CREATURE
    end

    def Play(playerDeck, opponentDeck)
        playerDeck.PutOnField(self)
    end

    def Damage(damage, element)
        @health -= damage
    end
end