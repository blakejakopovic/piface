require "piface/version"
require "piface/native"

module PiFace
  def self.init
    Native.pfio_init
  end

  def self.deinit
    Native.pfio_init
  end

  def self.read(pin_number)
    Native.pfio_digital_read(pin_number)
  end

  def self.write(pin_number, value)
    Native.pfio_digital_write(pin_number, value)
  end
end

at_exit { PiFace.deinit }
PiFace.init
