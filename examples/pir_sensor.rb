# piface/examples/pir_sensor.rb

require 'piface'

SENSOR_PIN = 5

puts "Waiting for motion..."
while Piface.read(SENSOR_PIN) == 1
  sleep 0.5
end

puts "MOTION DETECTED"
