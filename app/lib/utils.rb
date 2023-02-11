# frozen_string_literal: true

class Utils
  def self.filter_and_group(string_list, integer)
    return {} if integer < 2

    filtered_strings = string_list.filter { |string| string.length < integer }
    count_values = (1..integer - 1).map { |value| { value => 0 } }
    initial_group_hash = count_values.reduce(:merge)
    filtered_strings.reduce(initial_group_hash) do |result, string|
      result.tap { result[string.length] += 1 }
    end
  end
end
