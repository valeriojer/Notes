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
  
  # listslicing
  mylist[0:10] #provid it with nothing and itll go to the end
    [start,stop,step]     inversing [::-1]
  
  # listcomprephtion
    fails = [i for i in grades if i < 70]
                 
    fails = [item for item in list conditional]
                                      
  
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
  def makepancake(*args):
    #code block
  
  *args takes all given 
  
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
  
# Bin
  ord()
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
  
# FileIO
  fp = open('myfile.txt')
  fp = close()
  
  with open('myfile.txt', 'r') as fp:
    print(fp.read(*wordcount*)*[:50]*)
    print(fp.readlines()*[2]*)
  
  
  with open('myfile.txt', 'w') as fp:
    fp.write('write here')
    lines = ['He', 'll', 'o', 'World']
    fp.writelines(lines)
   
    #copying a file under a new name
  
  with open('myfile.txt', 'r') as fp0:
    with open('NEWfile.txt', 'w') as fp1:
      fp1.write(fp0.read())  
# Sets
  not orgizaned 
  can only read not change
  cant have more than one
  s = {1,2,3,4,5}
  3 in s 
    true
  9 in s
    false
  s.add()
  s.discard()
  s.union(s1)
  s.difference(s1)
  s.intersection(s1)
  
# Dict
  Dict = {'E-1':'PVT', 'E-2':'PFC', 'E-3':'LCPL'}
  
  for i in Dict
  e-1
  e-2
  e-3
  for i in Dict
    print(Dict[i])
  pvt
  pfc
  lcp
  
  #Counts all the letters in a str
  myDict = {}
  for i in myStr:
    if i in myDict:
        myDict[i] += 1
    else:
        myDict[i] = 1
# lambda
  y = lambda x: x + 100
  print(y(50))
    150
  
  
  
  
  
  
  
  
  
## Notes
  .isnumeric() gives back a bool if its a number
