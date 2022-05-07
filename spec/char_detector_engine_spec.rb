RSpec.describe CharDetector::Engine do
  it "#scan" do
    expect(subject).to respond_to(:scan)
  end

  it "scans sample0.txt and gets empty array" do
    filepath = "spec/samples/sample0.txt"
    expected = []

    expect(subject.scan(filepath)).to eq(expected)
  end

  it "scans sample1.txt" do
    filepath = "spec/samples/sample1.txt"
    expected = [
      {:filepath=>"spec/samples/sample1.txt", :line=>1, :columns=>[11], :content=>"newer text"}
    ]

    expect(subject.scan(filepath)).to eq(expected)
  end

  it "scans sample2.txt" do
    filepath = "spec/samples/sample2.txt"
    expected = [
      {:filepath=>"spec/samples/sample2.txt", :line=>4, :columns=>[13], :content=>"newer text"}
    ]

    expect(subject.scan(filepath)).to eq(expected)
  end

  it "scans sample3.txt" do
    filepath = "spec/samples/sample3.txt"
    expected = [
      {:filepath=>"spec/samples/sample3.txt", :line=>4, :columns=>[33], :content=>"搞不明白, 为什么utf-8编码的文件里会包含ASCII编码的 \u0000(NUL)"},
      {:filepath=>"spec/samples/sample3.txt", :line=>6, :columns=>[3],  :content=>"1 \b(BS)"}
    ]

    expect(subject.scan(filepath)).to eq(expected)
  end

  it "scans sample4.txt" do
    filepath = "spec/samples/sample4.txt"
    expected = [
      {:filepath=>"spec/samples/sample4.txt", :line=>3, :columns=>[45], :content=>"'ticket_reports_new_group',      # 工单报表-\b客服组"}
    ]
    expect(subject.scan(filepath)).to eq(expected)
  end

  it "scans sample5.txt" do
    filepath = "spec/samples/sample5.txt"
    expected = [
      {:filepath=>"spec/samples/sample5.txt", :line=>5, :columns=>[15,30], :content=>"|Contact| Y | \estring | 模式，参见\b下面的`模式列表` |"},
      {:filepath=>"spec/samples/sample5.txt", :line=>6, :columns=>[15], :content=>"|Number | N | \estring | 号码 |"}
    ]
    expect(subject.scan(filepath)).to eq(expected)
  end
end
