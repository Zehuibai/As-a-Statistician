OPTIONS NONUMBER NODATE PAGESIZE = MAX FORMCHAR = '|----|+|---+=|-/<>*' FORMDLIM=' ';title;
ods noproctitle;
ods listing close;
ods graphics /imagename=' unnamed-chunk-2 ' ;
ods html gpath='  ' file=' sas36d8210e11a0.html ' (no_top_matter no_bottom_matter) style=journal;
data unempl_rates;
input rate @@;
month= _N_ ;
datalines;
6.0 6.7 4.9 4.4 5.8 4.8 5.5 6.7 4.7 5.6 6.5 6.0
4.7 5.1 7.2 6.1 7.7 5.7 7.1 4.2 5.8 5.1 6.3 5.1
3.9 4.7 4.4 5.9 4.1 5.8 4.9 5.4 3.9 6.0 4.1 4.6
5.7 5.0 4.5 6.9 5.6 4.6 4.4 4.1 3.2 6.3 4.2 4.7
4.3 4.3 4.5 6.7 3.9 4.6 5.8 3.8 5.5 4.7 5.0 4.2
5.0 4.5 3.7 5.5 5.4 2.6 5.0 4.9 5.7 4.3 5.3 7.1
7.5 4.1 5.1 5.7 4.8 6.1 6.3 4.1 5.7 7.2 6.0 7.2
8.0 8.7 8.5 9.1 7.5 10.5 8.5 7.4 10.5 8.9 8.5 9.9
8.3 9.9 7.2 9.5 10.5 11.9 11.4 8.0 10.5 11.2 9.2 9.5
10.0 10.3 9.1 8.1 7.9 9.5 10.7 8.5 9.1 8.7 9.0 8.6
;
proc loess data=unempl_rates;
model rate=month/clm;
ods output OutputStatistics=results;
run;
proc print data=results;
run;
symbol1 color=black value=dot;
symbol2 color=black value=none interpol=join line=1;
symbol3 color=black value=none interpol=join line=2;
symbol4 color=black value=none interpol=join line=2;
proc gplot data=results;
by SmoothingParameter;
plot (DepVar Pred LowerCL UpperCL)*month/ overlay;
run;
