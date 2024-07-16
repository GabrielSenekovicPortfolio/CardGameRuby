require_relative './card.rb'
require_relative './spellCard.rb'
require_relative './itemCard.rb'
require_relative './creatureCard.rb'
require_relative './reactionCard.rb'
require_relative './element.rb'

class CardLibrary
    attr_accessor :cards, :deckSprite, :graveyardSprite

    def initialize
        @graveyardSprite = Sprite.new(File.join(File.dirname(__FILE__), "./Art/Card_Graveyard.png"))
        @deckSprite = Sprite.new(File.join(File.dirname(__FILE__), "./Art/Card_Deck.png"))
        @backSprite = Sprite.new(File.join(File.dirname(__FILE__), "./Art/Card_Back.png"))
        @cards = [  SpellCard.new("wind", File.join(File.dirname(__FILE__), "./Art/Card_Wind.png"),@backSprite, 1, Element::AIR),
                    SpellCard.new("fire", File.join(File.dirname(__FILE__), "./Art/Card_Fire.png"),@backSprite, 1, Element::FIRE),
                    SpellCard.new("lightning", File.join(File.dirname(__FILE__), "./Art/Card_Lightning.png"),@backSprite, 1, Element::LIGHTNING),
                    SpellCard.new("sakura", File.join(File.dirname(__FILE__), "./Art/Card_Sakura.png"),@backSprite, 1, Element::FLOWER),
                    SpellCard.new("water", File.join(File.dirname(__FILE__), "./Art/Card_Water.png"),@backSprite, 1, Element::WATER),
                    SpellCard.new("earth", File.join(File.dirname(__FILE__), "./Art/Card_Earth.png"),@backSprite, 1, Element::EARTH),
                    SpellCard.new("moon", File.join(File.dirname(__FILE__), "./Art/Card_Moon.png"),@backSprite, 1, Element::MOON),
                    CreatureCard.new("yellow rabbit", File.join(File.dirname(__FILE__), "./Art/Card_RabbitYellow.png"),@backSprite, 3, Element::MOON),
                    Card.new("crescent moon rabbit", File.join(File.dirname(__FILE__), "./Art/Card_RabbitCrescentMoon.png"),@backSprite),
                    ItemCard.new("mana potion", File.join(File.dirname(__FILE__), "./Art/Card_PotionMana.png"),@backSprite),
                    ItemCard.new("health potion", File.join(File.dirname(__FILE__), "./Art/Card_PotionHealth.png"),@backSprite),
                    ReactionCard.new("revive potion", File.join(File.dirname(__FILE__), "./Art/Card_PotionRevive.png"),@backSprite)]
        @cards.each{|n| n.sprite.remove}
        @graveyardSprite.remove
        @backSprite.remove
        @deckSprite.remove
    end
    
end