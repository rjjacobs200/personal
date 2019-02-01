
include 'Random'

class Array

  def my_binary_search element, range = (0..self.length)

    front, back, mid = range.begin, range.end, (back - front) / 2 + front

    case self[mid] <=> element
    when -1
      return false if low >= mid
      return my_binary_search element, front..(mid - 1)
    when 0
      puts 'ladies and gentlemen, we got em'
      return mid
    when 1
      return false if high <= mid
      return my_binary_search element, (mid + 1)..back
    else
      puts "goodness me, something's gone terribly wrong!"
      return nil
    end

  end

end

data = Array.new 50 do |param|
  Random.rand 10000
end

puts data
