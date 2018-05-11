f = figure;
tabgp = uitabgroup(f,'units','normalized','Position',[.01 .01 .99 .7]);
tab1 = uitab(tabgp,'Title','EMD');
axes('parent',tab1);surf(peaks);
tab2 = uitab(tabgp,'Title','DFA');

