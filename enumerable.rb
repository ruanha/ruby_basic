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


end