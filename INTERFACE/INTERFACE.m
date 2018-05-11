function INTERFACE(data1,data2)
   %%  Create and then hide the GUI as it is being constructed.
   f = figure('Visible','off','Position',[100,800,1000,800]);
 
   %%  Construct the components.
   
   fpanel_Signal = uipanel('Title','Signal','FontSize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.7 0.98 0.3]);
         
   Axes_signal = axes('parent',fpanel_Signal,'Position',[0.4 0.2 0.55 0.6]);
   
   
   artefac_choice = uicontrol('parent',fpanel_Signal,'Style','popupmenu',...
          'String',{'with artefac','without artefac',},...
          'Position',[25,125,100,40],...
          'Callback',@artefac_Callback);
      
   signal_choice = uicontrol('parent',fpanel_Signal,'Style','pushbutton','String','Select Data To Plot',...
          'Position',[25,90,100,40],...
          'Callback',@signal_choice_Callback);
    
   
   fpanel_Methodes = uipanel('Title','Analysis','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.01 0.98 0.67]);
                  
         
    tabgp = uitabgroup(fpanel_Methodes,'units','normalized','Position',[.01 .01 .98 .98]);
    tab1 = uitab(tabgp,'Title','EMD');
    tab2 = uitab(tabgp,'Title','DFA');
    tab3 = uitab(tabgp,'Title','MSE');
    tab4 = uitab(tabgp,'Title','Power Analysis');
    tab5 = uitab(tabgp,'Title','DKL-DJ');

    Display_EMD_panel = uipanel('parent',tab1,'Title','Method Display','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.01 0.98 0.98]);
         
     Axes_EMD = axes('parent',Display_EMD_panel,'Position',[0.6 0.2 0.3 0.6]);
           
    Data_DFA_panel = uipanel('parent',tab2,'Title','Data','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.01 0.5 0.97]);

     Display_DFA_panel = uipanel('parent',tab2,'Title','Method Display','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.49 0.01 0.5 0.97]);
            
     Data_MSE_panel = uipanel('parent',tab3,'Title','Data','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.01 0.5 0.97]);

     Display_MSE_panel = uipanel('parent',tab3,'Title','Method Display','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.49 0.01 0.5 0.97]);
     Data_Power_Analysis_panel = uipanel('parent',tab4,'Title','Data','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.01 0.5 0.97]);

     Display_Power_Analysis_panel = uipanel('parent',tab4,'Title','Method Display','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.49 0.01 0.5 0.97]);         

     Data_Div_panel = uipanel('parent',tab5,'Title','Data','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.01 0.01 0.5 0.97]);

     Display_Div_panel = uipanel('parent',tab5,'Title','Method Display','Fontsize',12,...
             'BackgroundColor','white',...
             'Position',[0.49 0.01 0.5 0.97]); 

%% Global display option

    % Assign the GUI a name to appear in the window title.
    f.Name = 'Simple GUI';
    % Move the GUI to the center of the screen.
    movegui(f,'center')
    % Make the GUI visible.
    f.Visible = 'on';
    
    plot(Axes_signal,data1);
    plot(Axes_EMD,data2);
   
%% Callbacks
 
%     Callbacks for INTERFACE. These callbacks automatically
%     have access to component handles and initialized data 
%     because they are nested at a lower level.
%  
%     Pop-up menu callback. Read the pop-up menu Value property
%     to determine if the plot is with or without artefac.
   
      function artefac_Callback(source,eventdata) 
         % Determine the selected data set.
         str = source.String;
         val = source.Value;
         % Set current data to the selected data set.
         switch str{val}
         case 'with artefac' % User selects Peaks.
            plot(current_data);
         case 'without artefac' % User selects Membrane.
            Tfilt = Filtre_Tarvainen(current_data,0.1);
         end
      end
  
   % Push button callbacks. 
 
   function signal_choice_Callback(source,eventdata,handles) 
   % Choose the current data to display in the axes
   
       [filename, pathname] = uigetfile('*.mat', 'Select a MATLAB code file');
       if isequal(filename,0)
       disp('User selected Cancel')
       else
       disp(['User selected ', fullfile(filename)])
       load(filename);
       end
       
   end

end 