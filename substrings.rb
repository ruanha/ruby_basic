def substrings str, dict
  '''
  str: a string of text
  dict: an array of words

  match words from dict with str. count every match in str.

  return: hash of each string in dict that was found in
  dict and number of times it was found
  '''
  hash_return = {}
  dict.each do |word|
    matches = str.downcase.scan(word.downcase)
    if matches.length>0
      hash_return[word] = matches.length
    end
  end
  puts hash_return
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)