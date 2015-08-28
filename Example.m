clear
clc
D_star=1.358;
global a;
global cp;
global num_of_cp;
a=randn(700,1);
a(391:517)=a(391:517)*sqrt(0.365);
a(518:700)=a(518:700)*sqrt(1.033);
num_of_cp=0; cp=[];
cpt_var( D_star );