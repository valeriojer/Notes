
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
