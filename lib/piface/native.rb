require "ffi"

module PiFace
  module Native
    extend FFI::Library
    ffi_lib 'libpiface-1.0'

    attach_function :pfio_init, [], :char
    attach_function :pfio_deinit, [], :char
    attach_function :pfio_digital_read, [ :char ], :char
    attach_function :pfio_digital_write, [ :char, :char ], :void
  end
end
