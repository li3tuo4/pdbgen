#!/usr/bin/python

import sys

opcode = dict(lbm='5020',
        lbum='5022',
        )

if __name__ == '__main__':
    print opcode[sys.argv[1]]
