module CharDetector
  class Line
    def initialize(line_no, content)
      @line_no = line_no
      @content = content
    end

    attr_reader :line_no, :content

    def scanline
      return nil if scanned_content.empty? # TODO null object pattern?

      hash = {}
      hash[:line]    = line_no
      hash[:columns] = scanned_columns

      return hash
    end

    private

    def scanned_content
      scanned = trimmed_newline.scan(/\p{Cntrl}/)
      scanned -= trimmed_newline.scan(/\p{Space}/)

      return scanned
    end

    def scanned_columns
      return scanned_content.map { |e| content.index(e)+1 }
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
