require 'ruby2d'
set diagnostics: true
require_relative './input.rb'
require_relative './card.rb'
require_relative './deck.rb'
require_relative './cardLibrary.rb'
require_relative './player.rb'
require_relative './turnManager.rb'

set title: "Card Game"

tick = 0
@speed = 1;
@currentDirection_X = 0;
@currentDirection_Y = 0;

$input = Input.new();

set width: 256 * 2;
set height: 192 * 2;
set fullscreen: true;

@cardLibrary = CardLibrary.new()

@player_one = Player.new(true)
@player_two = Player.new(false)

@player_one_deck = Deck.new(true, @cardLibrary, @player_one)
@player_two_deck = Deck.new(false, @cardLibrary, @player_two)

@turnManager = TurnManager.new(@player_one, @player_two)

update do

  if $input.esc_pressed
    close;
  end

  @player_one_deck.Hover($input.mouse_x, $input.mouse_y)

  if $input.enter_pressed
    @player.EndTurn()
  end

  if $input.mouse_leftClick
    @player_one_deck.Click(@player_two_deck)
    $input.mouse_leftClick = false
  end
  if $input.mouse_rightClick
    @player_one_deck.RightClick()
    $input.mouse_rightClick = false
  end
end

show