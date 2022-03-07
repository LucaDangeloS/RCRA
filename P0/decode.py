#!/bin/python3
from math import sqrt
import sys
import re

# Usage: clingo 0 hitoriKB.lp > ./decode.py > solution.txt

white = "white"
black = "black"
black_cell_format = "\(\d+,\d+\)"    # (n,n2)
white_cell_format = "\(\d+,\d+\),."  # (n,n2),n3
regex_white = f"({white})\(c({white_cell_format})"  # white(c(n,n2),n3)
regex_black = f"({black})\(c({black_cell_format})"  # black(c(n,n2))
final_regex = f"{regex_black}|{regex_white}"

def print_matrix(matrix):
    out = ""
    for row in matrix:
        for col in row:
            out += str(col)
        out +="\n"
    return out

if __name__ == '__main__':
    input = sys.stdin.read().split("Answer")
    for i in input:
        results = [tuple(i.replace('(','').replace(')','') for i in m if i) 
                    for m in re.findall(final_regex, i)]
        n = int(sqrt(len(results)))
        hitori_matrix = [[0 for _ in range(n)] for _ in range(n)]

        for i in results:
            if i[0] == black:   # ('black', 0,1)
                idx = [int(j) for j in i[1].split(',')]
                hitori_matrix[idx[0]][idx[1]] = '*'
            elif i[0] == white: # # ('white', 0,1,2)
                val = i[1].split(',')[2]
                idx = [int(j) for j in i[1].split(',')[:2]]
                hitori_matrix[idx[0]][idx[1]] = val
        print(print_matrix(hitori_matrix))

    