class CharDetector::Engine
  def scan(filepath)
    matches = []

    File.readlines(filepath).each_with_index do |line, index|
      scanned = line.scan(/\p{Cntrl}/)
      scanned = scanned.reject { |e| line.index(e)+1 == line.length }

      next if scanned.empty?

      hash = {}
      hash[:filepath] = filepath
      hash[:line]     = index + 1
      hash[:columns]  = scanned.map { |e| line.index(e)+1 }

      matches << hash
    end

    return matches
  end
end
