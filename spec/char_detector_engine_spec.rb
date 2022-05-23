RSpec.describe CharDetector::Engine do
  subject { described_class.new(file: file) }
  let(:file) { "foobar" }

  it "#scan" do
    expect(subject).to respond_to(:scan)
  end

  context "when scan a normal file with horizontal-tab" do
    let(:file) { "spec/samples/sample0.txt" }

    it "gets empty array" do
      expected = []

      expect(subject.scan).to eq(expected)
    end
  end

  context "when scan a normal file containing different kinds of new line characters" do
    let(:file) { "spec/samples/sample1-newline.txt" }

    it "gets empty array" do
      expected = []

      expect(subject.scan).to eq(expected)
    end
  end

  context "when scan a file with one target char exists(0x00)" do
    let(:file) { "spec/samples/sample2.txt" }

    it "gets expected array" do
      expected = [
        {:line=>4, :columns=>[13]}
      ]

      expect(subject.scan).to eq(expected)
    end

    it "is treated as binary file since it contains null byte" do
      pending "todo"
      raise "todo"
    end
  end

  context "when scan a file with one target char exists(0x80)" do
    let(:file) { "spec/samples/sample4.txt" }

    it "gets expected array" do
      expected = [
        {:line=>3, :columns=>[45]}
      ]

      expect(subject.scan).to eq(expected)
    end

    it "is treated as normal file since it does not contain null byte" do
      pending "todo"
      raise "todo"
    end
  end

  context "when scan a file with two target chars exists(0x80/0x00)" do
    let(:file) { "spec/samples/sample3.txt" }

    it "gets expected array" do
      expected = [
        {:line=>4, :columns=>[33]},
        {:line=>6, :columns=>[3]}
      ]

      expect(subject.scan).to eq(expected)
    end
  end

  context "when scan a file with three target char exists(0x1b/0x00)" do
    let(:file) { "spec/samples/sample5.txt" }

    it "gets expected array" do
      expected = [
        {:line=>5, :columns=>[15,30]},
        {:line=>6, :columns=>[15]}
      ]

      expect(subject.scan).to eq(expected)
    end
  end
end
