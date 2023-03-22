# raz abergel
# the code implement the main functionality of the program

print("Magic word: ")
mystr = input()
new_string = mystr[1:]
if len(mystr) < 3:  # if the length of the input string is less than 3 nothing will happend
    exit()

ASCII_value = sum(ord(ch) for ch in new_string)

if (ASCII_value - 846 + 10) == 20:  # if the input - 34E +Ah == 14h the the secret message will show up
    print("Good work you are getting it!")
