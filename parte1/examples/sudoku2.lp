
#program display.
#const csize=30.
&display{window,h=S,w=S,caption="sudoku"} :- S=csize*9+1.
&display{text=N,x=XC,y=YC,size=20} :- cell(X,Y,N),XC=csize*X+10,YC=csize*Y+7.
width(R,3) :- R=0..9,R\3=0.
width(R,1) :- R=0..9,R\3!=0.
&display{line,x1=X,y1=0,x2=X,y2=Y,width=W; line,x1=0,y1=X,x2=Y,y2=X,width=W} :- Y=csize*9,R=0..9,X=csize*R,width(R,W).

