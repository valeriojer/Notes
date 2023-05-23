# use vim to edit and script
  .vimrc is the vim options

  chmod +x (file)
  ./(file) 
  must have 
  #!/usr/bin/python3
  muteable can change has same id

# typecast 
  c = 7.4 
  d = str(c)
  type(d)
  <class str>
  
# list
  just like arrays they use [] and can be change once set and be added onto
  
  listslicing
  mylist[0:10] #provid it with nothing and itll go to the end
    [start,stop,step]     inversing [::-1]
  
# tuple
  tuple use () instead and cannot be changed once set 
  
# Strings
  Youtuber = Hero
  
  '{}'.format(Youtuber)
  \>Hero
  f'{Youtuber}'
  \>Hero
  
  .split() #returns strings into lists #auto does white spaces
  
  #break a sting into chars by type castings into a list().
 
  ''.join(youtuber) #joins the list of youtuber onto the empty string 
  
# Funtion
  def makepancake(a,b):
    #code block
  
  return #sends output
  continue #does the next iteration
  break #stops
  
# Loops
  for item in iterable:
    do stuff
  
  while (true):
    do stuff
  
# range()
  list(range(start,end but not includeing,counting by))
  
# ord 
  decimal value of a char
  a = 97
 bin(ord(Char))
  0b110001
  
  format(ord(Char), '0>8b')
  0110001
  
  list(format(ord(Char), '0>8b'))
  
  int('01100001', 2)
  97
  
  chr(97) 
  a
  
