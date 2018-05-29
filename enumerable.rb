module Enumerable


  def my_each
    ''' supports Array and Hash
    '''
    case self   #not self.class (see SO#5694333/9737101)
    when Array
      i = 0
      while i < self.size
        yield(self[i])
        i+=1
      end
    when Hash
      i = 0
      keys = self.keys
      while i < self.keys.size
        yield( keys[i], self[keys[i]] )
        i+=1
      end
    else print "Class self.class not supported"
    end
    self #we return the original array, because that is what #each does 
  end


  def my_each_with_index
    ''' supports Array
    '''
      i = 0
      while i < self.size
        yield(self[i], i)
        i+=1
      end
    end


  def my_select
    '''Returns an array containing all elements of enum 
    for which the given block returns a true value.
    '''
    selected = []
    i = 0
    while i < self.size
      selected.push(self[i]) if yield(self[i])
      i+=1
    end
    selected
  end


  def my_all?
    '''tests if all elements in the passed Array returns true when
    passed to the block.
    returns true if all are true. ...Technically not nil or false...
    '''
    self.my_each do |element|
      result = yield(element)
      if (result != nil && result != false)
        next
      else
        return false
      end
    end
    return true
  end


  def my_any?
    ''' tests if any element in an Array returns true
    with a (in the block) given condition
    '''
    self.my_each do |element|
      if yield(element)
        return true
      end
    end
    return false
  end


  def my_none?
    '''
    Passes each element of the collection to the given block.
    The method returns true if the block never returns true for all elements.
    '''
    self.my_each do |element|
      if yield(element)
        return false
      end
    end
    return true
  end


  def my_count
  	''' Returns the number of elements.
  		If an argument is given, counts the number of elements which equal obj using ==.
  		If a block is given, counts the number of elements for which the block returns a true value.
  	'''
  	count = 0

    if block_given?
      self.my_each do |elem|
        count += (yield(elem)) ? 1 : 0
      end
    else
      i = 0
      self.my_each do |elem|
        count += (elem != nil) ? 1 : 0
      end
    end
    count
  end


  def my_map
    '''Returns a new array with the results of running block once for every element in enum.
    input: a block
    output: Array, with elements that have been passed to the given block
    '''
    if block_given?
      mapped_result = []
      self.my_each do |elem|
        mapped_result.push(yield(elem))
      end
      return mapped_result
    else
      return "Supply a block please."
    end
  end


  def my_inject
    '''If you specify a block, then for each element in enum
    the block is passed an accumulator value (memo) and the element.
    If you specify a symbol instead, then each element in the collection
    will be passed to the named method of memo. 
    In either case, the result becomes the new value for memo. 
    At the end of the iteration, the final value of memo is the return value for the method.

    This version supports elements of type Integer, String
    It checks the first element in the Array for the type
    '''
    if block_given?
      memo = self[0]
      self[1..-1].my_each do |elem|
        memo = yield(memo, elem)
      end
    else
      return "pass a blok"
    end
    memo
  end

end

def multiply_els array
  array.my_inject { |m, n| m*n}
end
