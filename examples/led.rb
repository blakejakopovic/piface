# piface/examples/led.rb

require 'piface'

class LED
  def initialize(pin_number)
    @pin_number = pin_number
  end

  def turn_on
    Piface.write @pin_number, 1
  end

  def turn_off
    Piface.write @pin_number, 0
  end

  def state
    Piface.read_output(@pin_number)
  end

  def toggle
    new_state = state ^ 1
    Piface.write @pin_number, new_state
  end

  def blink(times = 1)
    0.upto(times * 2) do
      toggle
      sleep 0.25
    end
  end
end
