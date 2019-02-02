
class Item
  def initialize name, whole = true, pricing = lambda {|q| yield q}
    raise ArgumentError, 'name must be string'    if !name.is_a?    String
    raise ArgumentError, 'pricing must be proc'   if !pricing.is_a? Proc
    raise ArgumentError, 'whole? must be boolean' if !whole.is_a?   Boolean
    @name, @whole, @pricing = name, whole, pricing
  end
  def get_price quantity
    @pricing[quantity]
  end
  def change_pricing pricing = lambda {|q| yield q}
    raise ArgumentError, 'pricing must be proc'   if !pricing.is_a? Proc
    @pricing = pricing
  end
end
