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
           check = list(word)
           for letter in check:
               if 'p' in word:
                   p_words.append(word)
                   break
