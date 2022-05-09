class CharDetector::Cli
  def self.execute(options={})
    new(options).run
  end

  attr_reader :options

  def initialize(options={})
    @options = options

    if options[:file] && !File.exist?(options[:file])
      warn("[fail] Can't find file: #{options[:file]}")
      exit 1
    end

    if options.empty?
      abort("[info] Pass -h for usage")
      exit 1
    end
  end

  def run
    info = {}
    info[:file]   = options[:file]
    info[:result] = CharDetector::Engine.new(file: options[:file]).scan

    unless info[:result].empty?
      if options[:pretty]
        jj info
      else
        puts info.to_json
      end
    end

    exit 0
  end
end
