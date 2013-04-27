require "ffi"

module Piface
  module Native
    extend FFI::Library
    ffi_lib File.expand_path("../pfio.so", __FILE__)

    typedef :char, :pin_number
    typedef :char, :pin_value
    typedef :char, :pullup_value
    typedef :char, :bit_mask

    attach_function :pfio_init, [], :char
    attach_function :pfio_deinit, [], :char

    attach_function :pfio_digital_read, [ :pin_number ], :pin_value
    attach_function :pfio_digital_write, [ :pin_number, :pin_value ], :void

    attach_function :pfio_read_input, [], :bit_mask
    attach_function :pfio_read_output, [], :bit_mask

    # attach_function :pfio_write_output, [ :bit_mask ], :void


    attach_function :pfio_get_pin_bit_mask, [ :pin_value ], :bit_mask
    attach_function :pfio_get_pin_number, [ :bit_mask ], :pin_value
  end
end
