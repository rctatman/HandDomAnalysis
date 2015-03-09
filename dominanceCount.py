# Takes a directory of files with frequency counts divided by right and left hand and determines which hand was used
# more. It then appends that information to the file name.?

# import some things we'll need
import glob 
import re
from os import rename, listdir

# decalre some variables for use later
root = "/home/rachael/Dropbox/Papers/pointing/corpusngt_eaf_r2_public/handednessInfo/"

# for number, find the right and left hand file
# glob the right hand and then grab the left hand
for file_path in glob.glob('{}/*right.txt'.format(root)):
    # find the matching left hand file
    right =  file_path
    left = re.sub('_right.txt',  '_left.txt',  file_path)
    
    with open(right) as f:
        rightContent = f.readlines()
    with open(left) as f:
        leftContent = f.readlines()
    
    # count tokens in each 
    rightCount = 0
    for line in rightContent:
        #gra integer from each line between tab and new line
        start=line.index("\t")
        end=line.index("\n")
        num=line[start:end]
        # add it to our count string 
        rightCount = rightCount + int(num)
    
    leftCount = 0
    for line in leftContent:
        #gra integer from each line between tab and new line
        start=line.index("\t")
        end=line.index("\n")
        num=line[start:end]
        # add it to our count string 
        leftCount = leftCount + int(num)
    
    #add informative suffixes about the most used hands to our files
    if rightCount > leftCount: 
        rename(right,  right.replace('.txt', '_rdom.txt'))
        rename(left,  left.replace('.txt', '_rdom.txt'))
    elif leftCount > rightCount: 
        rename(right,  right.replace('.txt', '_ldom.txt'))
        rename(left,  left.replace('.txt', '_ldom.txt')) 
    else: 
        rename(right,  right.replace('.txt', '_nulldom.txt'))
        rename(left,  left.replace('.txt', '_nulldom.txt')) 


