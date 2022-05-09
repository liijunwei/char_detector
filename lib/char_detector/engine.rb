class CharDetector::Engine
  def initialize(file:)
    @file = file
  end

  attr_reader :file

  def scan
    matches = []

    File.readlines(file).each_with_index do |line, index|
      scanned = trim_newline(line).scan(/\p{Cntrl}/)
      scanned -= trim_newline(line).scan(/\p{Space}/)

      next if scanned.empty?

      hash = {}
      hash[:line]    = index + 1
      hash[:columns] = scanned.map { |e| line.index(e)+1 }

      matches << hash
    end

    return matches
  end

  def trim_newline(line)
    if line.end_with?("\n")
      line[0..-2]
    else
      line
    end
  end
end
