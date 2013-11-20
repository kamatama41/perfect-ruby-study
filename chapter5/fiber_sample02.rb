fiber = Fiber.new do |first|
  p first

  second = Fiber.yield("1st yield")

  p second

  third = Fiber.yield("2nd yield")

  p third
end

first = fiber.resume("1st resume")
p first

second = fiber.resume("2nd resume")
p second

third = fiber.resume("3rd resume")
p third

# => "1st resume"
# => "1st yield"
# => "2nd resume"
# => "2nd yield"
# => "3rd resume"
# => "3rd resume"