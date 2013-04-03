require "ffi"

module Piface
  module Native
    extend FFI::Library
    ffi_lib ['libpiface', 'libpiface-1.0', 'libpiface-1.0.so.1', '/usr/local/lib/libpiface-1.0']

    attach_function :pfio_init, [], :char
    attach_function :pfio_deinit, [], :char

    attach_function :pfio_digital_read, [ :char ], :char
    attach_function :pfio_digital_write, [ :char, :char ], :void

    attach_function :pfio_read_input, [], :char
    attach_function :pfio_read_output, [], :char

    # attach_function :pfio_write_output, [ :char ], :void

    attach_function :pfio_get_pin_bit_mask, [ :char ], :char
    attach_function :pfio_get_pin_number, [ :char ], :char
  end
end
