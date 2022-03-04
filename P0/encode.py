#!/bin/python3
import sys
# Usage: ./encode.py < hitori.txt > out.txt
if __name__ == '__main__':
    row = -1
    lp_code = ""
    
    for line in sys.stdin:
        row += 1
        for idx, digit in enumerate(line):
            if digit != "\n":
                lp_code += f"cell(c({row},{idx}),{digit}). "
        lp_code += "\n"
    lp_code += f"#const n={row}."
    print(lp_code)