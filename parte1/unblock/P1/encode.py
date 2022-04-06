#!/bin/python3
# Luca D'angelo Sabin        Kevin Millán Canchapoma     Grupo: 3.1
import sys

H = "horizontal"
V = "vertical"

# Aux function to find all elements in array
def findall(element, matrix):
    result = []
    for i in range(len(matrix)):
        for j in range(len(matrix[i])):
            if matrix[i][j] == element:
                result.append((i, j))
    return result

# returns (orientation, starting_point, length) for a given block
def get_orientation_and_length(block):
    if len(block) > 1:
        x1, y1 = block[0]
        x2 ,y2 = block[1]
        
        if x1 == x2:
            return (H, (x1, y1), len(block))
        elif y1 == y2:
            return (V, (x1, y1), len(block))
        else:
            raise Exception

# Transforms the block info to lp language
def build_block_lp(block_info):
    letter = block_info[0]
    orientation = block_info[1][0]
    pos = block_info[1][1]
    length = block_info[1][2]
    
    lp_str = f"block({letter}, {orientation}, {length})"
    lp_str += f".\nh({lp_str}, c{pos}).\n"
    
    return lp_str

# Builds the goal string
def build_goal_lp(block, goal_pos):
    letter = block[0]
    orientation = block[1][0]
    pos = block[1][1]
    length = block[1][2]

    block_lp = f"block({letter}, {orientation}, {length})"
    
    if orientation == H:
        goal_pos_lp = f"c({pos[0]},{goal_pos})"
    else:
        goal_pos_lp = f"c({goal_pos},{pos[1]})"

    return f"goal:- h({block_lp}, {goal_pos_lp}).\n"


# Builds the final lp string
def build_lp_string(block_list, goal_block, goal_pos, h, w):
    lp_str = "#program initial.\n"
    lp_str += f"#const height={h}.\n"
    lp_str += f"#const width={w}.\n"
    for block in block_list:
        lp_str += build_block_lp(block)

    lp_str += "\n#program final.\n"
    lp_str += build_goal_lp(goal_block, goal_pos)
    
    return lp_str


if __name__ == '__main__':
    input = sys.stdin.read()
    if not input:
        exit()
    
    # Remove blank lines from matrix
    input_matrix = list(input.replace('\n',''))

    input_lines = [line for line in input.split('\n') if line] # Remove blank lines from text
    table_state = input_lines[:-1]
    goal = input_lines[-1].split('=')

    h, w = len(table_state), len(table_state[0])

    letters = [x for x in set(input_matrix) if x.isalpha()]
    letters.sort()
    
    block_positions = [findall(i, table_state) for i in letters]
    blocks = [(letters[idx], get_orientation_and_length(i)) 
                for idx, i in enumerate(block_positions)]

    goal_block = [x for x in blocks if x[0] == goal[0]][0]
    goal_pos = goal[1]

    print(build_lp_string(blocks, goal_block, goal_pos, h, w))
    
    exit()