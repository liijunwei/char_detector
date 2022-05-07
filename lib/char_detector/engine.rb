class CharDetector::Engine
  def scan(filepath)
    matches = []

    File.readlines(filepath).each_with_index do |line, index|
      column = line.strip =~ /\p{Cntrl}/

      next if column.nil?

      hash = {}
      hash[:filepath] = filepath
      hash[:line]     = index + 1
      hash[:column]   = column + 1
      hash[:content]  = line.strip

      matches << hash
    end

    return matches
  end
end
