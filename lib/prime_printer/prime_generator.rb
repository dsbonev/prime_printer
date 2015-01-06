class PrimePrinter::PrimeGenerator
  def initialize
    @generator = Fiber.new do
      Fiber.yield 2
      value = 3
      loop do
        Fiber.yield value if is_prime? value
        value += 2
      end
    end
  end

  def next(count = 1)
    if count == 1
      @generator.resume
    else
      [].tap do |primes|
        count.times { primes.push @generator.resume }
      end
    end
  end

  private

  def is_prime?(n)
    Math.sqrt(n).floor.downto(2).each {|i| return false if n % i == 0}
    true
  end
end
