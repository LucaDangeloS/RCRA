#!/bin/python3
import sys
import pygame
import time

winsize=700
delay=300

def blocknum(c):
    return ord(c)-ord('a')

def printgrid(grid):
    for line in grid:
        for c in line:
            print(c,end="")
        print()

# Checking arguments
if len(sys.argv)!=3 and len(sys.argv)!=4:
    print("python showunblock.py <instanceFile> <actionsFile> <delayMilisecs>")
    exit(0)

if len(sys.argv)==4:
    delay=int(sys.argv[3])

colors=['blue','green','yellow','orange','cyan','purple','violet','pink','darkgray','darkgreen','brown','gold','magenta']

#### Reading grid from input file
nblocks=0

grid=[]
file1 = open(sys.argv[1],'r')
Lines=file1.readlines()
dd = 2 if Lines[-1]=='\n' else 1
for line in Lines[:-dd]:
    for c in line[:-1]:
        if (c>='a' and c<='z' and nblocks<=blocknum(c)):
            nblocks=blocknum(c)+1
blocks=[0 for i in range(nblocks)]
vertical=[False for i in range(nblocks)]
for line in Lines[:-dd]:
    list=[]
    for c in line[:-1]:
        list.append(c)
    grid.append(list)
n=len(grid[0])
m=len(grid)
file1.close()

for i in range(m):
    for j in range(n):
        if grid[i][j]>='a' and grid[i][j]<='z':
            k=blocknum(grid[i][j])
            if blocks[k]==0:
                vertical[k]=(j==n-1 or grid[i][j+1]!=grid[i][j])
                blocks[k]=[i,j]

nblocks=len(blocks)
blocksize = []
for b in range(nblocks):
    if vertical[b]:
        i=blocks[b][0]; j=blocks[b][1];
        while i<m and blocknum(grid[i][j])==b:
            i=i+1
        blocksize.append(i-blocks[b][0])
    else:
        i=blocks[b][0]; j=blocks[b][1];
        while j<n and blocknum(grid[i][j])==b:
            j=j+1
        blocksize.append(j-blocks[b][1])

goalblock=blocknum(Lines[-dd][0])
colors[goalblock]='red'
#### Reading sequence of actions from standard input
file1 = open(sys.argv[2],'r')
moves=[]
Lines=file1.readlines()
for line in Lines:
    line=line.rstrip() # remove newline at the end
    if line[2:6]=='move':
        s = line.split("("); s = s[1].split(","); x=blocknum(s[0])
        s = s[1].split(")"); y=int(s[0])
        moves.append((x,y))
file1.close()


# Visualization

if n<=20:
    sqsize=60; winsize=n*sqsize
else:
    winsize=750; sqsize=winsize/n            
#bgcolor=(110,70,30)
bgcolor=(60,40,10)

def makemove(move):
    b=move[0]
    inc=move[1]
    i=blocks[b][0]; j=blocks[b][1]
    if vertical[b]:
        blocks[b][0]+=inc
    else:
        blocks[b][1]+=inc

#print(blocks)

pygame.init()
screen = pygame.display.set_mode([n*sqsize,m*sqsize])
screen.fill(bgcolor)
pygame.display.set_caption('Unblock simulator')
def drawsquare(i,j,color,width):
    color=pygame.Color(color)
    pygame.draw.rect(screen,color,[j*sqsize,i*sqsize,sqsize,sqsize],0)

def drawblock(b,x,y,color):
    if vertical[b]:
        pygame.draw.rect(screen,color,[x,y,sqsize,blocksize[b]*sqsize],0)
    else:
        pygame.draw.rect(screen,color,[x,y,blocksize[b]*sqsize,sqsize],0)

def drawgrid():
    for b in range(nblocks):
        drawblock(b,blocks[b][1]*sqsize,blocks[b][0]*sqsize,colors[b])

drawgrid()
for move in moves:
    makemove(move)
    screen.fill(bgcolor)
    drawgrid()
    pygame.display.flip()
    pygame.event.pump()
    pygame.time.wait(delay)

done=False
while not done:
    for evento in pygame.event.get():
        if evento.type == pygame.QUIT:
            done = True
pygame.quit()
