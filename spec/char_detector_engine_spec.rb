RSpec.describe CharDetector::Engine do
  it "#scan" do
    expect(subject).to respond_to(:scan)
  end

  it "scans sample0.txt and matches empty array" do
    filepath = "spec/samples/sample0.txt"
    expect(subject.scan(filepath)).to eq([])
  end

  it "scans sample3.txt and matches" do
    filepath = "spec/samples/sample3.txt"
    expected = [
      {:filepath=>"spec/samples/sample3.txt", :line=>4, :column=>33, :content=>"搞不明白, 为什么utf-8编码的文件里会包含ASCII编码的 \u0000(NUL)"},
      {:filepath=>"spec/samples/sample3.txt", :line=>6, :column=>3,  :content=>"1 \b(BS)"}
    ]
    expect(subject.scan(filepath)).to eq(expected)
  end

  it "scans sample4.txt and matches" do
    filepath = "spec/samples/sample4.txt"
    expected = [
      {:filepath=>"spec/samples/sample4.txt", :line=>3, :column=>41, :content=>"'ticket_reports_new_group',      # 工单报表-\b客服组"}
    ]
    expect(subject.scan(filepath)).to eq(expected)
  end
end
