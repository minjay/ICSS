function [] = cpt_var( D_star )
%CPT_VAR Compute the variance changepoints of a sequence a.
%  CPT_VAR(D_star) Compute the variance changepoints of a sequence a with critical value D_star.
%
%  Inputs:
%
%  D_star: critical value.
%
%  Outputs:
%
%  cp (global variable): the detected variance changepoints.
%  num_of_cp (global variable): the number of detected variance changepoints.
%
%  Examples:
%
%  D_star=1.358;
%  global a;
%  global cp;
%  global num_of_cp;
%  a=randn(700,1);
%  a(391:517)=a(391:517)*sqrt(0.365);
%  a(518:700)=a(518:700)*sqrt(1.033);
%  num_of_cp=0; cp=[];
%  cpt_var( D_star );
%
%  References:
%
%  Use of Cumulative Sums of Squares for Retrospective Detection of Changes of Variance (1994) 
%  by C Incl¨¢n, G C Tiao
%
%  Written by Minjie Fan

global a;
global cp;
global num_of_cp;
ICSS( 1,length(a),D_star );
if num_of_cp==0
    %disp('There is no evidence of variance changes in the series');
else
    cp=sort(cp);
    Elimi( D_star );
end
end

