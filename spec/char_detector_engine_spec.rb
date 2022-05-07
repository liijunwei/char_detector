require "char_detector"

RSpec.describe CharDetector::Engine do
  subject { described_class.new(file: file) }
  let(:file) { "foobar" }

  it "#scan" do
    expect(subject).to respond_to(:scan)
  end

  context "when scan a normal file" do
    let(:file) { "spec/samples/sample0.txt" }

    it "gets empty array" do
      expected = []

      expect(subject.scan(file)).to eq(expected)
    end
  end

  context "when scan a file with one target char exists at line ending(1)" do
    let(:file) { "spec/samples/sample1.txt" }

    it "gets expected array" do
      expected = [
        {:line=>1, :columns=>[11]}
      ]

      expect(subject.scan(file)).to eq(expected)
    end
  end


  context "when scan a file with one target char exists at line ending(2)" do
    let(:file) { "spec/samples/sample2.txt" }

    it "gets expected array" do
      expected = [
        {:line=>4, :columns=>[13]}
      ]

      expect(subject.scan(file)).to eq(expected)
    end
  end

  context "when scan a file with two target chars exists in middle of line" do
    let(:file) { "spec/samples/sample3.txt" }

    it "gets expected array" do
      expected = [
        {:line=>4, :columns=>[33]},
        {:line=>6, :columns=>[3]}
      ]

      expect(subject.scan(file)).to eq(expected)
    end
  end

  context "when scan a file with one target char exists in middle of line" do
    let(:file) { "spec/samples/sample4.txt" }

    it "gets expected array" do
      expected = [
        {:line=>3, :columns=>[45]}
      ]

      expect(subject.scan(file)).to eq(expected)
    end
  end

  context "when scan a file with three target char exists in middle of line" do
    let(:file) { "spec/samples/sample5.txt" }

    it "gets expected array" do
      expected = [
        {:line=>5, :columns=>[15,30]},
        {:line=>6, :columns=>[15]}
      ]

      expect(subject.scan(file)).to eq(expected)
    end
  end
end
