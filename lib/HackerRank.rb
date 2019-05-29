require "HackerRank/version"

module HackerRank
  class Error < StandardError; end

  def scoring(array)
    array.each do |user|
      user.update_score unless user.is_admin?
    end
  end

  def self.identify_class(obj)
    case obj.class.name
    # if Hacker, output "It's a Hacker!"
    when "Hacker"
      puts "It's a Hacker!"

    # if Submission, output "It's a Submission!"
    when "Submission"
      puts "It's a Submission!"

    # if TestCase, output "It's a TestCase!"
    when "TestCase"
      puts "It's a TestCase!"

    # if Contest, output "It's a Contest!"
    when "Contest"
      puts "It's a Contest!"

    # for any other object, output "It's an unknown model"
    else
      puts "It's an unknown model"
    end
  end

  def self.transcode(string)
    string.encode!(Encoding::UTF_8, Encoding::ISO_8859_1)
  end
end
