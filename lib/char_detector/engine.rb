class CharDetector::Engine
  def initialize(file: 'TODO')
    @file = file
  end

  attr_reader :file

  def scan(arg_file = 'TODO')
    matches = []

    arg_file = file

    File.readlines(arg_file).each_with_index do |line, index|
      scanned = trim_newline(line).scan(/\p{Cntrl}/)
      next if scanned.empty?

      hash = {}
      hash[:line]    = index + 1
      hash[:columns] = scanned.map { |e| line.index(e)+1 }

      matches << hash
    end

    return matches
  end

  def trim_newline(line)
    line[...-1]
  end
end
