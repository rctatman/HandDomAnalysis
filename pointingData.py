# this script takes frequency counts for the dominant and non-dominant hands, finds instaces of pointing in each and then 
# saves them to a table

# import things we'll need
import numpy
import glob
import re

# decalre some variables for use later
data = numpy.array(['pt','pt1', 'file', 'hand'])
root = "/home/rachael/Dropbox/Papers/pointing/corpusngt_eaf_r2_public/handednessInfo/"

for file_path in glob.glob('{}/*right_rdom.txt'.format(root)):
    right =  file_path
    left = re.sub('_right_',  '_left_',  file_path)
    # open right-handed files and count pointing gestures made with rigth hand
    with open(right, 'r') as searchfile:
        for line in searchfile:
            if line.startswith('pt\t'):
                start=line.index("\t") + 1
                end=line.index("\n")
                pt=line[start:end]
            if line.startswith('pt1\t'): 
                start=line.index("\t") + 1
                end=line.index("\n")
                pt1=line[start:end]
    if pt is None:
        pt = 0   
    if pt1 is None:
        pt1 = 0
    result = re.search('Info/(.*)word', right)
    name = result.group(1)
    newrow = numpy.array([pt, pt1, name,  'right'])
    data = numpy.vstack([data,  newrow])
    # open left-handed files and count pointing gestures made with left hand
    with open(left, 'r') as searchfile:
        for line in searchfile:
            if line.startswith('pt\t'):
                start=line.index("\t") + 1
                end=line.index("\n")
                pt=line[start:end]
            if line.startswith('pt1\t'): 
                start=line.index("\t") + 1
                end=line.index("\n")
                pt1=line[start:end]
    if pt is None:
        pt = 0   
    if pt1 is None:
        pt1 = 0
    result = re.search('Info/(.*)word', left)
    name = result.group(1)
    newrow = numpy.array([pt, pt1, name,  'left'])
    data = numpy.vstack([data,  newrow])
# save out new file  
numpy.savetxt("pointingDataNDG.csv", data, delimiter=",", fmt="%s")
