require "piface/version"
require "piface/native"

module Piface
  LOW  = 0
  HIGH = 1

  def self.read(pin_number)
    Native.pfio_digital_read(pin_number)
  end

  def self.write(pin_number, value)
    Native.pfio_digital_write(pin_number, value)
  end

  def self.read_input(pin_number)
    current_state = Native.pfio_read_input
    pin_state(current_state, pin_number)
  end

  def self.read_output(pin_number)
    current_state = Native.pfio_read_output
    pin_state(current_state, pin_number)
  end

  private
  def self.init
    Native.pfio_init
  end

  def self.deinit
    Native.pfio_init
  end

  def self.pin_number_to_flag(pin_number)
    2**(pin_number - 1)
  end

  def self.flag_active?(mask, pin_number)
    mask & pin_number_to_flag(pin_number) > 0
  end

  def self.pin_state(mask, pin_number)
    flag_active?(mask, pin_number) ? HIGH : LOW
  end
end

at_exit { Piface.deinit }
Piface.init
