class StringCalculatorParser
  DEFAULT_DELIMITERS = [",", "\n"].freeze

  def initialize(input)
    @input = input.strip
  end

  def parse
    return [0] if @input.empty?

    delimiters, numbers = extract_delimiters_and_numbers
    numbers.split(Regexp.union(delimiters)).map(&:to_i)
  end

  private

  def extract_delimiters_and_numbers
    if @input.start_with?("//")
      match = @input.match(%r{^//(.+)\n(.*)$})
      delimiters = extract_delimiters(match[1])
      [delimiters, match[2]]
    else
      [DEFAULT_DELIMITERS, @input]
    end
  end

  def extract_delimiters(header)
    if header.start_with?("[") # Multi-character delimiters
      header.scan(/\[(.*?)\]/).flatten
    else
      [header] # Single-character delimiter
    end
  end
end
