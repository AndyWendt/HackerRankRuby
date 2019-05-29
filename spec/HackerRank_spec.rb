RSpec.describe HackerRank do
  it "has a version number" do
    expect(HackerRank::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  it "correctly identifies classes" do
    [
        [Hacker.new, "It's a Hacker!"],
        [Submission.new, "It's a Submission!"],
        [TestCase.new, "It's a TestCase!"],
        [Contest.new, "It's a Contest!"],
        [Foo.new, "It's an unknown model"],
        [Bar.new, "It's an unknown model"],
    ].each do |input, expected|
      save_stdout = $stdout
      $stdout = StringIO.new
      HackerRank.identify_class(input)
      expect($stdout.string.strip).to eq(expected)
      $stdout = save_stdout
    end
  end
end

class Hacker
end

class Submission
end

class TestCase
end

class Contest
end

class Foo
end

class Bar
end
