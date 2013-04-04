# Ruby Bindings for [pfio.c](https://github.com/thomasmacpherson/piface/tree/master/c)

The [pfio C Library](https://github.com/thomasmacpherson/piface/blob/master/c/) is used to control the [Pi-Face Digital Interface](http://pi.cs.man.ac.uk/interface.htm) for [Raspberry Pi](http://www.raspberrypi.org/). This gem uses the [Ruby-FFI](https://github.com/ffi/ffi) gem to bind the C functions to ruby.

## !! Project is currently in ALPHA (Things may change)
Ruby method names, as well as other aspects, may change until version 1.0 is released.

## Basic Usage

The PiFace has 8 inputs and 8 outputs. Both the inputs and outputs are linked to connectors 1-8 respectfully.

Note: The pfio C library will set all outputs to LOW (zero) when first initialized.

### Using Outputs
Writing to outputs 1 to 8 with all turn on the LEDs. Write to outputs using Piface::LOW (or 0) for off/disable and Piface::HIGH (or 1) for on/enable.

Please note that the PiFace outputs are all open-collectors (meaning that they do not output any voltage). Please read the [PiFace Manual](http://www.farnell.com/datasheets/1684425.pdf) for more information.

```ruby
require 'piface'

# Enable output 4
Piface.write 4, 1

sleep 1 # wait one second

# Disable output 4
Piface.write 4, 0
```

### Using Relays
Write to outputs 1 and 2 to control the relays (if jumpers JP5 and JP6 are enabled on the PiFace).
```ruby
require 'piface'

# Turn on the first relay
Piface.write 1, 1

sleep 1 # wait one second

# Turn off first relay
Piface.write 1, 0
```

### Using Classes
Sometimes it's nice to represent an output using a class. One common example is when you want to track the current state of the output.
```ruby
require 'piface'

# Relay class implementing toggle functionality
class Relay
  def initialize(relay_number)
    @relay_number = relay_number
    @state = 0
  end

  def turn_on
    Piface.write @relay_number, 1
    @state = 1
  end

  def turn_off
    Piface.write @relay_number, 0
    @state = 0
  end

  def toggle
    @state == 1 ? turn_off : turn_on
  end
end

relay1 = Relay.new(1)

# Turn the relay on and off 3 times
6.times do
  relay1.toggle
  sleep 1 # wait one second
end
```

### Using Inputs
The PiFace uses digital inputs. Reading the value with return either a 0 or 1. Since the PiFace uses pull-up resistors for inputs, by default they will read 1. This means to check for input (such as button presses), you must compare the read input value with 0 for on.
```ruby
require 'piface'

# Read value from input 6 (without active input)
Piface.read 6
# => 1

# Read value from input 6 (with active input)
Piface.read 6
# => 0
```

### Using Buttons
The PiFace has 4 built-in buttons that correspond to inputs 1 to 4.
```ruby
require 'piface'

# Listen for button 4 press
loop do
  # Check if the button has been pressed
  if (Piface.read(4) == Piface::LOW)
    puts "Button 4 pressed"
  end
  sleep 0.1 # sleep to be kind to the CPU
end
```

## Additional Resources
* [The PiFace Digital PDF Manual](http://www.farnell.com/datasheets/1684425.pdf)
* [pfio C Library](https://github.com/thomasmacpherson/piface/blob/master/c/)
* [WiriingPi Library](https://github.com/WiringPi/WiringPi)

## Installation

First install the pfio C Library

[https://github.com/thomasmacpherson/piface](https://github.com/thomasmacpherson/piface)

Enable RaspberryPi's SPI module

    $ gpio load spi

Add this line to your application's Gemfile:

    gem 'piface'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install piface


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
