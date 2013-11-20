fiber = Fiber.new do
  p "Hello, Fiber"

  Fiber.yield

  p "Hello, Fiber (2nd)"
end

p "before fiber.resume (1st)"
fiber.resume
# => "Hello, Fiber"

p "before fiber.resume (2nd)"
fiber.resume
# => "Hello, Fiber (2nd)"

p "before fiber.resume (3rd)"
fiber.resume
# => dead fiber called (FiberError)