RSpec.describe CharDetector::Engine do
  it "#scan" do
    expect(subject).to respond_to(:scan)
  end
end
