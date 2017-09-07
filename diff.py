#!/usr/bin/python
"""
This code is not tested yet.
Wed Jul  8 17:34:33 AEST 2015

"""



import sys
import ppd_scan as scanA
import ppd_scan as scanB

#global input vars
fileA =sys.argv[1]
fileB =sys.argv[2]

def diff():
    """
    assume ISAs are same,
    try to diff two versions 
    of each instruction
    """
    for k,v in scanA.db:
        if v == scanB.db[k]:
            pass
        else:
            print k,'diff'
    return

def main():
    raw_modA = scanA.init(scanA.read_ppd(fileA))
    scanA.parse(raw_modA)
    raw_modB = scanA.init(scanB.read_ppd(fileB))
    scanB.parse(raw_modB)
    diff()
    return

if __name__ == '__main__':
    main()
