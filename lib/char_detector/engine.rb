module CharDetector
  class Engine
    def initialize(file:)
      @file = file
    end

    attr_reader :file

    def scan
      matches = []

      File.readlines(file).each_with_index do |line, index|
        if result = Line.new(index+1, line).scanline
          matches << result
        end
      end

      return matches
    end
  end
end
