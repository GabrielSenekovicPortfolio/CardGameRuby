require 'ruby2d'

class Card
    attr_accessor :name, :sprite, :backSprite

    def initialize(name, path, backSprite)
        @name = name
        @sprite = Sprite.new(path)
        @backSprite = backSprite
        @sprite.width = 28
        @sprite.height = 39
    end

    def initialize_copy(original_card)
        @name = original_card.name
        @sprite = original_card.sprite.dup
        @backSprite = original_card.backSprite.dup
        @sprite.width = 28
        @sprite.height = 39
      end

    def Play(playerDeck, opponentDeck)
        raise "This is a base card, and not an actual card"
    end

    def Move(x, y)
        @backSprite.x = x
        @sprite.x = x
        @backSprite.y = y
        @sprite.y = y
    end

    def Rotate(angle)
        @backSprite.rotate = angle
        @sprite.rotate = angle
    end

    def Hide
        @backSprite.add
        @sprite.remove
    end

    def Show
        @sprite.add
        @backSprite.remove
    end

    def Remove
        @sprite.remove
        @backSprite.remove
    end
end