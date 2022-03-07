#!/bin/python3
import sys
# Usage: ./encode.py < hitori.txt > out.txt
if __name__ == '__main__':
    row = -1
    extra_vals = ["a", "b", "c"]
    lp_code = ""

    for line in sys.stdin:
        row += 1
        for idx, digit in enumerate(line):
            if digit != "\n":
                lp_code += f"cell(c({row},{idx}),{digit}). "
        lp_code += "\n"
    lp_code += f"#const n={row+1}.\n"

    # Add extra values if grid is bigger than 8x8
    diff = (row) - 8
    if diff > 0:
        temp = "val("
        for i in range(diff):
            temp += f"{extra_vals[i]};" # val(a;b;c).
        lp_code += temp + ")."
    print(lp_code)