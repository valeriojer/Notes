 1 #!/usr/bin/env python3
  2 def invert(l):
  3     '''Inverts the given list
  4     Args:
  5         l (list): list of strings representing integers in the range [0-255]
  6     Returns:
  7         None
  8     '''
  9     counter = 0
 10     for pixel in l:
 11         l[counter] = str(255 -int(pixel))
 12         counter += 1
 13     return
 14 def inverted(l):
 15     '''Returns a new list that is the given list inverted
 16     Args:
 17         l (list): list of strings representing integers in the range [0-255]
 18     Returns:
 19         list: new list that is the given list inverted
 20     '''
 21     
 22     newlst = []
 23     counter = 0
 24     for pixel in l:
 25         newlst.append(l[counter])
 26         counter += 1
 27     invert(newlst)
 28     return newlst
 29 
 30 
 31 if __name__ == '__main__':
 32     pass



 #!/usr/bin/env python3
  2 
  3 def steg_encode_char(char, cover):
  4     '''LSB encodes a character
  5     Args:
  6         char (str): a single character string
  7         cover (list): list of 8 strings representing integers in the range [0-255]
  8     Returns:
  9         None
 10     '''
 11     pass
 12     msgbin = format(ord(char), '0>8b')
 13     #coverbin = format(int(cover[0]),'0>8b')
 14     #coverbinl= list(coverbin)
 15     for i in range(0,8):
 16         coverbinl = list(format(int(cover[i]), '0>8b'))
 17         coverbinl[-1] = msgbin[i]
 18         cover[i] = str(int(''.join(coverbinl), base = 2))
 19 
 20 def steg_decode_char(stego):
 21     '''LSB decodes a character
 22     Args:
 23         stego (list): list of 8 strings representing integers in the range [0-255]
 24     Returns:
 25         str: character that was decoded
 26     '''
 27     pass
 28     msgbits = []
 29     for bits in stego:
 30         msgbits.append(bin(int(bits))[-1])
 31     return chr(int(''.join(msgbits),base=2))
 32 
 33 
 34 if __name__ == '__main__':
 35     pass
~    


Challenge: Using the file school_prompt.txt, if the character ‘p’ is in a word, then add the word to a list called p_words.

   with open('school_prompt.txt', 'r') as fp:
    words = fp.read().split()
    p_words = []
    for word in words:
            if 'p' in word:
                p_words.append(word)
  PRACTICE EXAM
  1 #!/usr/bin/env python3
  2 
  3 def q1(floatstr):
  4     '''
  5     TLO: 112-SCRPY002, LSA 3,4
  6     Given the floatstr, which is a comma separated string of
  7     floats, return a list with each of the floats in the 
  8     argument as elements in the list.
  9     '''
 10     pass
 11     floatstr = floatstr.split(',')
 12     for f in range(0,len(floatstr)):
 13         floatstr[f] = float(floatstr[f])
 14     return floatstr
 15 def q2(*args):
 16     '''
 17     TLO: 112-SCRPY006, LSA 3
 18     TLO: 112-SCRPY007, LSA 4
 19     Given the variable length argument list, return the average
 20     of all the arguments as a float
 21     '''
 22     return (sum(args) / len(args))
 23     pass
 24 
 25 def q3(lst,n):
 26     '''
 27     TLO: 112-SCRPY004, LSA 3
 28     Given a list (lst) and a number of items (n), return a new 
 29     list containing the last n entries in lst.
 30     '''
 31     newlst = []
 32     while n > 0:
 33         newlst.append(lst[-1*n])
 34         n -= 1
 35     return newlst
 36     pass
 37 
 38 def q4(strng):
 39     '''
 40     TLO: 112-SCRPY004, LSA 1,2
 41     TLO: 112-SCRPY006, LSA 3
 42     Given an input string, return a list containing the ordinal numbers of 
 43     each character in the string in the order found in the input string.
 44     '''
 45     new = []
 46     for s in strng:
 47         n = ord(s)
 48         new.append(n)
 49     return new
 50     pass
 51 
 52 def q5(strng):
 53     '''
 54     TLO: 112-SCRPY002, LSA 1,3
 55     TLO: 112-SCRPY004, LSA 2
 56     Given an input string, return a tuple with each element in the tuple
 57     containing a single word from the input string in order.
 58     '''
 59     strng = strng.split()
 60     strng = tuple(strng)
 61     return strng
 62     pass
 63 
 64 def q6(catalog, order):
 65     '''
 66     TLO: 112-SCRPY007, LSA 2
 67     Given a dictionary (catalog) whose keys are product names and values are product
 68     prices per unit and a list of tuples (order) of product names and quantities,
 69     compute and return the total value of the order.
 70 
 71     Example catalog:
 72     {
 73         'AMD Ryzen 5 5600X': 289.99,
 74         'Intel Core i9-9900K': 363.50,
 75         'AMD Ryzen 9 5900X': 569.99
 76     }
 77 
 78     Example order:
 79     [
 80         ('AMD Ryzen 5 5600X', 5), 
 81         ('Intel Core i9-9900K', 3)
 82     ]
 83 
 84     Example result:
 85     2540.45 
 86 
 87     How the above result was computed:
 88     (289.99 * 5) + (363.50 * 3)
 89     '''
 90     total = 0
 91     print(catalog)
 92     print(order)
 93     numofitems = (len(order))
 94     print(numofitems)
 95     for n in range(0,numofitems):
 96         #grabs the tuple of the order of n 
 97         orde = order[n]
 98         print (orde)
 99         #grabs the name of the item
100         item1 = orde[0]
101         #grabs cost of the item 
102         cost1 = orde[1]
103         ord1p = catalog[item1]
104         print(ord1p)
105         over1p = ord1p * cost1
106         total += over1p
107 
108 
109     return total
110     pass
111 
112 def q7(filename):
113     '''
114     TLO: 112-SCRPY005, LSA 1
115     Given a filename, open the file and return the length of the first line 
116     in the file excluding the line terminator.
117     '''
118     with open(filename, 'r') as fp:
119         line = fp.readlines()[0]
120         line = list(line)
121         num = len(line) - 1
122         return num
123     pass
124 
125 def q8(filename,lst):
126     '''
127     TLO: 112-SCRPY003, LSA 1
128     TLO: 112-SCRPY004, LSA 1,2
129     TLO: 112-SCRPY005, LSA 1
130     Given a filename and a list, write each entry from the list to the file
131     on separate lines until a case-insensitive entry of "stop" is found in 
132     the list. If "stop" is not found in the list, write the entire list to 
133     the file on separate lines.
134     '''
135 
136     with open(filename, 'w') as fp:
137         for n in lst:
138             if n is 'stop':
139                 break
140             fp.write(n + '\n')
141     pass
142 
143 def q9(miltime):
144     '''
145     TLO: 112-SCRPY003, LSA 1
146     Given the military time in the argument miltime, return a string 
147     containing the greeting of the day.
148     0300-1159 "Good Morning"
149     1200-1559 "Good Afternoon"
150     1600-2059 "Good Evening"
151     2100-0259 "Good Night"
152     '''
153     miltime = int(miltime)
154     if miltime >= 300 and miltime < 1200:
155         return 'Good Morning'
156     elif miltime >= 1200 and miltime < 1600:
157         return 'Good Afternoon'
158     elif miltime >= 1600 and miltime < 2100:
159         return 'Good Evening'
160     else:
161         return 'Good Night'
162     pass
163 
164 def q10(numlist):
165     '''
166     TLO: 112-SCRPY003, LSA 1
167     TLO: 112-SCRPY004, LSA 1
168     Given the argument numlist as a list of numbers, return True if all 
169     numbers in the list are NOT negative. If any numbers in the list are
170     negative, return False.
171     '''
172     pos = True
173     for n in numlist:
174         if n < 0:
175             pos = False
176 
177     return pos
178     pass
179 



PRACT 2
#!/usr/bin/env python3
  2 
  3 def q1(sentence):
  4     '''
  5     Given a string of multiple words separated by single spaces,
  6     return a new string with the sentence reversed. The words
  7     themselves should remain as they are. For example, given
  8     'it is accepted as a masterpiece on strategy', the returned
  9     string should be 'strategy on masterpiece a as accepted is it'.
 10     '''
 11     words = sentence.split()
 12     words_revsersed = reversed(words)
 13     return ' '.join(words_revsered)
 18     pass
 19       
 20 def q2(n):
 21     '''
 22     Given a positive integer, return its string representation with
 23     commas seperating groups of 3 digits. For example, given 65535
 24     the returned string should be '65,535'.
 25     '''
 26     return '{:,}'.format(n)
 27
 ...
 36 def q3(lst0, lst1):
 37     '''
 38     Given two lists of integers, return a sorted list that contains
 39     all integers from both lists in descending order. For example,
 40     given [3,4,9] and [8,1,5] the returned list should be [9,8,5,4,3,1].
 41     The returned list may contain duplicates.
 42     '''
 43     combined = lst0 + lst1
 44     new_list = sorted(combined)
 45     new_list = reversed(new_list)
 46     return list(new_list)
 ...
 53 def q4(s1,s2,s3):
 54     '''
 55     Given 3 scores in the range [0-100] inclusive, return 'GO' if
 56     the average score is greater than 50. Otherwise return 'NOGO'.
 57     '''
 58     s0 = s1 + s2 + s3
 59     avg = s0 / 3
 60     if avg > 50:
 61         return 'GO'
 62     else:
 63         return 'NOGO'
 64     pass
 ...
 77 def q5(integer, limit):
 67     '''
 68     Given an integer and limit, return a list of even multiples of the
 69     integer up to and including the limit. For example, if integer==3 and
 70     limit==30, the returned list should be [0,6,12,18,24,30]. Note, 0 is
 71     a multiple of any integer except 0 itself.
 72     '''

 82     multiples = []
 83     for i in range(0, limit + 1):
 84         if (i%integer == 0) and (i%2 == 0):
 85              multiples.append(i)
 86     return multiples


 74     return [i for i in range(0,limit+1, integer) if i % 2 == 0 ]
 73
 78 def q6(f0, f1):
 78     '''
 79     Given two filenames, return a list whose elements consist of line numbers
 80     for which the two files differ. The first line is considered line 0.
 81     '''
        diffs = []
        with open(f0) as fp0:
            with open(f1) as fp1:
                line0 = fp0.readlines()
                line1 = fp1.readlines()
                counter = 0
                for i in line0:
                    if i != line1[counter]:
                        diffs.append(counter)
                    counter += 1
         return diffs
       
         diffs = []
            with open(f0) as fp0:
                with open(f1) as fp1:
                    line0 = fp0.readlines()
                    line1 = fp1.readlines()
              
                    for counter,item in enumerate(line0):
                        if item != line1[counter]:
                            diffs.append(counter)





                              
 

