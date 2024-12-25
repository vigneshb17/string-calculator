class StringCalculator
  def add(str)
    return 0 if str.empty?

    if str.start_with?('//')
      new_line_index = str.index("\n")
      delimiter = str[2..new_line_index-1]
      str = str[new_line_index+1..-1]
    else
      delimiter = ','
    end

    # Replace the new lines and delimiter with comma.
    str = str.gsub("\n", delimiter).gsub(delimiter, ',')

    nums_arr = str.split(',').map(&:to_i)

    # Find the negative numbers, if found then raise an error
    negative_nums_arr = nums_arr.select { |n| n < 0 }
    raise "negative numbers not allowed #{negative_nums_arr.join(', ')}" if negative_nums_arr.any?

    nums_arr.sum
  end
end