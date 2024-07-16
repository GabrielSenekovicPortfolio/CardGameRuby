require_relative './card.rb'

class Deck
    attr_accessor :selectedByOther

    def initialize(isPlayer, cardLibrary, player)
        @player = player
        @isPlayer = isPlayer
        @graveyard = Array.new(0, Card)
        @cards_active = Array.new(0, Card)
        @cards = Array.new(64, Card)
        y = @isPlayer ? Window.height - 45 : 0
        @graveyardSprite = cardLibrary.graveyardSprite.dup
        @deckSprite = cardLibrary.deckSprite.dup
        @deckSprite.add
        if @isPlayer
            @deckSprite.x = 0
            @deckSprite.y = y
            @graveyardSprite.x = Window.width - 28
            @graveyardSprite.y = y
        else
            @deckSprite.x = Window.width - 28
            @deckSprite.y = y
            @graveyardSprite.x = 0
            @graveyardSprite.y = y
            @deckSprite.rotate = 180
        end
        0.upto(64) do |i|
            @cards[i] = cardLibrary.cards.sample.dup
        end
        @hoveredCard = nil
        @cards = @cards.shuffle()
        @handMaxSize = 7
        @cards_hand = Array.new(@handMaxSize, Card)
        number = 0
        number = GetWindowSizeMultiplier(number)
        handsFullWidth = 28 * @handMaxSize
        x = Ruby2D::Window.width / 2 - handsFullWidth / 2
        0.upto(@handMaxSize - 1) do |i|
            @cards_hand[i] = @cards[i]
            @cards.delete_at(i)
            @cards_hand[i].Move(x + i * 28, y)
            if @isPlayer
                @cards_hand[i].Show()
            else
                @cards_hand[i].Hide()
            end
        end
    end
    
    def Hover(mouseX, mouseY)
        @hoveredCard = nil
        y = @isPlayer ? Window.height - 39 : 0
        @cards_hand.each_with_index do |n,i| 
            if(mouseX > @cards_hand[i].sprite.x and mouseX < @cards_hand[i].sprite.x + @cards_hand[i].sprite.width and
                mouseY > @cards_hand[i].sprite.y and mouseY < @cards_hand[i].sprite.y + @cards_hand[i].sprite.height)
                @cards_hand[i].sprite.y = y - 8
                @hoveredCard = @cards_hand[i]
            else
                @cards_hand[i].sprite.y = y
            end
        end
    end

    def Click(opponentDeck)
        if(@hoveredCard != nil and @player.actionsTaken < @player.actionsMax)
            @hoveredCard.Play(self, opponentDeck)
            @hoveredCard = nil
        end
    end
    def RightClick()
        if(@hoveredCard != nil)
            PutAtBottomOfDeck(@hoveredCard)
            PullCardFromDeck()
            AdjustHand()
            @hoveredCard = nil
        end
    end

    def AdjustHand()
        @cards_hand.each_with_index do |n,i| 
            number = 0
            number = GetWindowSizeMultiplier(number)
            handsFullWidth = 28 * @handMaxSize
            x = Ruby2D::Window.width / 2 - handsFullWidth / 2
            y = @isPlayer ? Window.height - 45 : 0
            n.Move(x + i * 28, y)
            if @isPlayer
                n.Show()
            else
                n.Hide()
            end
        end
    end

    def AdjustField()
        @cards_active.each_with_index do |n,i|
            number = 0
            number = GetWindowSizeMultiplier(number)
            handsFullWidth = 28 * @handMaxSize
            x = Ruby2D::Window.width / 2 - handsFullWidth / 2
            y = @isPlayer ? Window.height - 45 - 39 : 39
            n.Move(x + i * 28, y)
            if @isPlayer
                n.Show()
            else
                n.Hide()
            end
        end
    end

    def StartSelect(selectedByOther)
        @selectedByOther = selectedByOther
    end

    def PullCardFromDeck()
        if @cards.length() > 0
            @cards_hand << @cards[0]
            @cards.delete_at(0)
        end
        if @cards.length() == 0
            @deckSprite.remove
        end
    end

    def PutAtBottomOfDeck(card)
        if(@cards.length() == 0)
            @deckSprite.add
        end
        @cards << card
        card.sprite.remove
        @cards_hand.delete_at(@cards_hand.find_index(card))
    end

    def PutOnField(card)
        PullCardFromDeck()
        @player.UpdateActions(1)
        @cards_active << card
        @cards_hand.delete_at(@cards_hand.find_index(card))
        AdjustHand()
        AdjustField()
    end

    def PutInGraveyard(card)
        if(@graveyard.length() == 0)
            @graveyardSprite.add
        end
        @graveyard << card
        @cards_hand.delete_at(@cards_hand.find_index(card))
    end

    def ReclaimeGraveyard()
        if(@cards.length() == 0)
            @deckSprite.add
        end
        @cards.push(*@graveyard)
        @graveyardSprite.remove
        @graveyard.clear()
    end

    def ShuffleDeck()
        @cards.shuffle
    end

    def GetWindowSizeMultiplier(number)
        number = Ruby2D::Window::width / 256
    end
end