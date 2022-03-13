#!/bin/python3
# Luca D'angelo Sabin        Kevin Millán Canchapoma     Grupo: 3.1
import enum
import sys

# Aux function to find all elements in array
def findall(element, matrix):
    result = []
    for i in range(len(matrix)):
        for j in range(len(matrix[i])):
            if matrix[i][j] == element:
                result.append((i, j))
    return result

def print_matrix(matrix):
    out = ""
    for row in matrix:
        for col in row:
            out += str(col)
        out +="\n"
    return out

# returns (orientation, starting_point, length)
def get_orientation_and_length(block):
    if len(block) > 1:
        x1, y1 = block[0]
        x2 ,y2 = block[1]
        
        if x1 == x2:
            return ('h', (x1, y1), len(block))

        elif y1 == y2:
            return ('v', (x1, y1), len(block))

        else:
            raise Exception

def build_lp_string(block_list):
    str = ''
    # for block in block_list:
    return ""

if __name__ == '__main__':
    input = sys.stdin.read()
    if not input:
        exit()
    
    input_matrix = list(input.replace('\n',''))

    input_lines = [line for line in input.split('\n') if line] # Remove blank lines
    table_state = input_lines[:-1]
    goal = input_lines[-1].split('=')

    h, w = len(table_state), len(table_state[0])

    letters = [x for x in set(input_matrix) if x.isalpha()]
    letters.sort()
    
    block_positions = [findall(i, table_state) for i in letters]
    blocks = [(letters[idx], get_orientation_and_length(i)) 
                for idx, i in enumerate(block_positions)]

    print(build_lp_string(blocks))
    
    exit()
            