f=figure;
load('DataTest.mat');

fpanel_Signal = uipanel('Title','Signal','FontSize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.7 0.98 0.3]);
         
fpanel_Methodes = uipanel('Title','Analysis','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.01 0.98 0.67]);
                  
         
tabgp = uitabgroup(fpanel_Methodes,'units','normalized','Position',[.01 .01 .98 .98]);
tab1 = uitab(tabgp,'Title','EMD');
tab2 = uitab(tabgp,'Title','DFA');



Data_EMD_panel = uipanel('parent',tab1,'Title','Data','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.01 0.5 0.97]);

Display_EMD_panel = uipanel('parent',tab1,'Title','Method Display','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.49 0.01 0.5 0.97]);
         
         
%% Partie signal original

Display_signal=axes('parent',fpanel_Signal,'Position',[0.4 0.3 0.55 0.65]);
plot(SimonRR)