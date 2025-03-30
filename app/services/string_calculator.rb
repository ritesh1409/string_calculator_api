class StringCalculator
  def self.add(numbers)
    parsed_numbers = StringCalculatorParser.new(numbers).parse
    validate_numbers(parsed_numbers)

    parsed_numbers.reject { |n| n > 1000 }.sum
  end

  private

  def self.validate_numbers(numbers)
    negatives = numbers.select { |n| n.negative? }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
