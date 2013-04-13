# piface/examples/toggle_button.rb

require 'piface'

class ToggleButton

  LOW  = 0
  HIGH = 1

  def initialize(pin_number)
    @pin_number = pin_number
    @thread = nil
  end

  def toggle
    new_state = Piface.read_output(@pin_number) ^ 1
    Piface.write(@pin_number, new_state)
  end

  def read_pin
    Piface.read(@pin_number)
  end

  def activate
    @thread = Thread.new do
      loop do
        if read_pin == LOW
          toggle
          sleep 0.1 while read_pin == LOW # wait until released
        end

        sleep 0.05
      end
    end
  end

  def deactivate
    Thread.kill(@thread) if @thread
  end
end

# button = ToggleButton.new(2)
# button.activate
