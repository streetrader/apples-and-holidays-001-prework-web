def apple_picker_with_select(fruit_list)
  fruit_list.select do |x|
    x == "apple"
  end
  # fruit_list will look something like: ["apple", "banana", "apple"]
  # you want to return an array that just has apples in it 
end

def apple_picker_with_collect(fruit_list)
result_of_collecting = fruit_list.collect {|x| x if x == "apple"}
    result_of_collecting.compact
end