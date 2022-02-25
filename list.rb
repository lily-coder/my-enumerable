require_relative 'my_enumerable'

class MyList
  include MyEnumerable
  def initialize(*list)
    @list = list
  end

  def each
    @list.length.time do |index|
      yield @list[index] if block_given?
    end
  end
end

# Create our list
list = MyList.new(1, 2, 3, 4)
# <MyList: @list=[1, 2, 3, 4]>

# Test #all?
list.all? { |e| e < 5 }
# true
list.all? { |e| e > 5 }
# false

# Test #any?
list.any? { |e| e == 2 }
# true
list.any? { |e| e == 5 }
# false
