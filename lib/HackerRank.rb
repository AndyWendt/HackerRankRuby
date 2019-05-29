require "HackerRank/version"

module HackerRank
  class Error < StandardError; end
  # Your code goes here...
  def scoring(array)
    array.each do |user|
      user.update_score unless user.is_admin?
    end
  end
end
