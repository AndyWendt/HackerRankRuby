RSpec.describe HackerRank do
  it "has a version number" do
    expect(HackerRank::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  it "correctly identifies classes" do
    [
        ["Hacker", "It's a Hacker!"],
        ["Submission", "It's a Submission!"],
        ["TestCase", "It's a TestCase!"],
        ["Contest", "It's a Contest!"],
        ["Foo", "It's an unknown model"],
        ["Bar", "It's an unknown model"],
    ].each do |input, expected|
      save_stdout = $stdout
      $stdout = StringIO.new
      HackerRank.identify_class(input)
      expect($stdout.string.strip).to eq(expected)
      $stdout = save_stdout
    end
  end
end
