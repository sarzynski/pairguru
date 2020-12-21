class TitleBracketsValidator < ActiveModel::Validator
  EMPTY_BRACKETS = %w[() [] {}].freeze
  BRACKET_SYMBOLS = {
    "(" => ")",
    "[" => "]",
    "{" => "}"
  }.freeze

  def validate(record)
    record.errors.add(:title, "title should not have empty brackets ") if contains_empty_brackets?(record.title)
    record.errors.add(:title, "title should have only closed brackets") if !contains_closed_brackets?(record.title)
  end

  def contains_empty_brackets?(title)
    EMPTY_BRACKETS.any? { |brackets| title.include?(brackets) }
  end

  def contains_closed_brackets?(title)
    opening_brackets = []
    title.each_char do |char|
      opening_brackets << char if BRACKET_SYMBOLS.key?(char)
      return false if BRACKET_SYMBOLS.key(char) && BRACKET_SYMBOLS.key(char) != opening_brackets.pop
    end
    opening_brackets.empty?
  end
end
