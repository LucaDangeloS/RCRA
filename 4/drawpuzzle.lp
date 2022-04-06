#program display.
&display{window,caption="Einstein's puzzle",w=540,h=300,bgcolor=white}.
colorhouse(H,X,C) :- house(H),X=80+(H-1)*80,X2=X+25,at(color,C,H).
&display{
  rectangle,x=X,y=20,w=60,h=40,color=black,width=2;
  rectangle,x=X3,y=22,w=57,h=37,color=C, width=0;
  text=H,x=X2,y=32
} :- colorhouse(H,X,C), X2=X+25, X3=X+2.
&display{image=["pics/",P,".png"],x=X,y=60} :- house(H),X=94+(H-1)*80,at(person,P,H).
&display{image=["pics/",P,".png"],x=X,y=100} :- house(H),X=80+(H-1)*80,at(pet,P,H).
&display{image=["pics/",D,".png"],x=X,y=160} :- house(H),X=80+(H-1)*80,at(drink,D,H).
&display{text=T,x=X,y=250,size=15} :- house(H),X=85+(H-1)*80,at(tobaco,T,H).
