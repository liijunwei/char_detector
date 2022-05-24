module CharDetector
  class Line
    def initialize(line_no, content, pattern)
      @line_no = line_no
      @content = content
      @pattern = pattern
    end

    attr_reader :line_no, :content, :pattern

    def scanline
      return nil if matched_chars.empty? # TODO null object pattern?

      hash = {}
      hash[:line]    = line_no
      hash[:columns] = scanned_columns

      return hash
    end

    private

    def matched_chars
      all_matched_chars - matched_spaces
    end

    def all_matched_chars
      trimmed_newline.scan(pattern)
    end

    def matched_spaces
      trimmed_newline.scan(/\p{Space}/)
    end

    def scanned_columns
      matched_chars.map { |e| content.index(e)+1 }
    end

    def trimmed_newline
      if content.end_with?("\n")
        content[0..-2]
      else
        content
      end
    end
  end
end
