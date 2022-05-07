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

  it "scans sample1.txt" do
    file = "spec/samples/sample1.txt"
    expected = [
      {:line=>1, :columns=>[11]}
    ]

    expect(subject.scan(file)).to eq(expected)
  end

  it "scans sample2.txt" do
    file = "spec/samples/sample2.txt"
    expected = [
      {:line=>4, :columns=>[13]}
    ]

    expect(subject.scan(file)).to eq(expected)
  end

  it "scans sample3.txt" do
    file = "spec/samples/sample3.txt"
    expected = [
      {:line=>4, :columns=>[33]},
      {:line=>6, :columns=>[3]}
    ]

    expect(subject.scan(file)).to eq(expected)
  end

  it "scans sample4.txt" do
    file = "spec/samples/sample4.txt"
    expected = [
      {:line=>3, :columns=>[45]}
    ]
    expect(subject.scan(file)).to eq(expected)
  end

  it "scans sample5.txt" do
    file = "spec/samples/sample5.txt"
    expected = [
      {:line=>5, :columns=>[15,30]},
      {:line=>6, :columns=>[15]}
    ]
    expect(subject.scan(file)).to eq(expected)
  end
end
