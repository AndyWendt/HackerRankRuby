RSpec.describe HackerRank do
  it "has a version number" do
    expect(HackerRank::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  it "counts a multibyte chars" do
    string = "¥1000"
    expected = 1
    result = HackerRank.count_multibyte_char(string)
    expect(result).to eq(expected)
  end

  it "transcodes a string" do
    string = "You have successfully completed the encoding challenge.".encode("iso-8859-1")

    result = HackerRank.transcode(string)
    expect(result.encoding.name).to eq('UTF-8')
    expect(result).to eq(string)
  end

  it "averages serial numbers" do
    input = '001-12.43-56.78'
    expected = '001-34.61'
    result = HackerRank.serial_average input

    expect(result).to eq(expected)
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

  it "joins strings without whitespace" do
    strings = ["Hi, \n", " Are you having fun?    "]
    expected = "Hi, Are you having fun?"
    result = HackerRank.process_text(strings)
    expect(result).to eq(expected)
  end

  it "masks an article" do
    input = [
        ["Hello World! This is crap!", ["crap"], "Hello World! This is <strike>crap</strike>!"],
    ]

    input.each do |array|
      string = array[0]
      strikes = array[1]
      expected = array[2]
      result = HackerRank.mask_article(string, strikes)
      expect(result).to eq(expected)
    end
  end

  it "strikes a given string" do
    input = {
        "Meow!" => "<strike>Meow!</strike>",
        "Foolan Barik" => "<strike>Foolan Barik</strike>",
    }

    input.each do |string, expected|
      result = HackerRank.strike(string)
      expect(result).to eq(expected)
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
