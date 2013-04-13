# piface/examples/relay.rb

require 'piface'

class Relay
  def initialize(relay_number)
    @relay_number = relay_number
  end

  def turn_on
    Piface.write @relay_number, 1
  end

  def turn_off
    Piface.write @relay_number, 0
  end

  def state
    Piface.read_output(@relay_number)
  end

  def toggle
    new_state = state ^ 1
    Piface.write @relay_number, new_state
  end
end

relay2 = Relay.new(2)
relay2.toggle # toggle the light without using a stored state
