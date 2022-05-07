RSpec.describe CharDetector::Engine do
  it "#scan" do
    expect(subject).to respond_to(:scan)
  end

  it "scans sample0.txt and matches empty array" do
    sample = "spec/samples/sample0.txt"
    expect(subject.scan(sample)).to eq([])
  end
end
