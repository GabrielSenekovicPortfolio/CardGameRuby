require 'ruby2d'

class Input

    @w_pressed = false;
    @a_pressed = false;
    @s_pressed = false;
    @d_pressed = false;
    
    @enter_pressed = false;

    @esc_pressed = false;

    @mouse_x = 0;
    @mouse_y = 0;

    @mouse_leftClick = false
    @mouse_rightClick = false

    attr_accessor :w_pressed,:a_pressed,:s_pressed,:d_pressed, 
    :esc_pressed, :enter_pressed,
    :mouse_x, :mouse_y, :mouse_leftClick, :mouse_rightClick
end

on :key_down do |event|
    if event.key == 'w'
        $input.w_pressed = true;
    elsif event.key == 'a'
        $input.a_pressed = true;
    elsif event.key == 's'
        $input.s_pressed = true;
    elsif event.key == 'd'
        $input.d_pressed = true;
    elsif event.key == 'escape'
        $input.esc_pressed = true;
    elsif event.key == 'enter'
        $input.enter_pressed = true;
    end
end

on :key_up do |event|
    if event.key == 'w'
        $input.w_pressed = false;
    elsif event.key == 'a'
        $input.a_pressed = false;
    elsif event.key == 's'
        $input.s_pressed = false;
    elsif event.key == 'd'
        $input.d_pressed = false;
    elsif event.key == 'escape'
        $input.esc_pressed = false;
    elsif event.key == 'enter'
        $input.enter_pressed = false;
    end
end

on :mouse_move do |event|
    $input.mouse_x = event.x;
    $input.mouse_y = event.y;
end

on :mouse_down do |event|
    case event.button
        when :left
            $input.mouse_leftClick = true
        when :middle
        when :right
            $input.mouse_rightClick = true
    end
end

on :mouse_up do |event|
    case event.button
        when :left
            $input.mouse_leftClick = false
        when :middle
        when :right
            $input.mouse_rightClick = false
    end
end