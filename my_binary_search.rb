
class Array

  def my_binary_search element, range = (0..(self.length - 1))

    return nil if range.size == 1

    left, right, = range.begin, range.end
    mid = ( (right - left) / 2 + left )

    case element <=> self[mid]
    when -1
      my_binary_search element, left..(mid - 1)
    when 0
      puts 'ladies and gentlemen, we got em'
      mid
    when 1
      my_binary_search element, (mid + 1)..right
    else
      puts "goodness me, something's gone terribly wrong!"
      nil
    end

  end

end

data = Array.new 100 do |param|
  Random.rand 1000
end
data.sort!

index_to_find = Random.rand data.length
# element_to_find = data[index_to_find]
element_to_find = Random.rand 1000

puts data.my_binary_search element_to_find
