%Selecting the Timestamps
Time = readtable('Timestamp.csv','Range','2:102');
% Activity Selector act
% 1 - Ramp Descent 2 - Level Walking 3 - Stair Ascent 4 - No Movement 5 -
% Stair Descent 6 - Ramp Ascent 


for ActNum = 1:6
map = [5 6 13 14 0 0 0 0; 6 7 10 11 14 15 18 19; 7 8 15 16 0 0 0 0; 8 9 12 13 16 17 0 0; 9 10 17 18 0 0 0 0; 11 12 19 20 0 0 0 0];
index = 0; 
alpha = zeros(18,35);
beta = zeros(18,35); 
gamma = zeros(18,35); 

for person = (2:5)
    for trial = (1:10)
          if person == (2) && trial < (6)
          continue;
          end
          
          if person == 5 && trial > 7 
          continue;
          end
          
          
          if person == 3 && trial == 10 
          continue;
          end
          
          
          if(ActNum == 2)
          if person == 2 && trial == 8 
          continue;
          end
          if person == 2 && trial == 10
          continue;
          end
          end
          
          if(ActNum == 6)
          if person == 4 && trial == 6 
          continue;
          end
          end
          
    
          disp("person="+person);
          disp("trial="+trial);
       
         
          ActStart1 = Time((person-1)*10+trial,map(ActNum,1));
          ActStart1 = table2array (ActStart1);
          
          ActEnd1 = Time((person-1)*10+trial,map(ActNum,2));
          ActEnd1 = table2array (ActEnd1);
          
          ActStart2 = Time((person-1)*10+trial,map(ActNum,3));
          ActStart2 = table2array (ActStart2);
          
          ActEnd2 = Time((person-1)*10+trial,map(ActNum,4));
          ActEnd2 = table2array (ActEnd2);
          
          ActStart3 = 0;
          ActEnd3 = 0;
          ActStart4 = 0;
          ActEnd4 = 0;
          
         if ActEnd1<ActStart1 || ActEnd2<ActStart2 || ActEnd3<ActStart3 || ActEnd4<ActStart4
             f = msgbox("Problem at person " + person + "Trial" + trial);
             continue;
         end
             
          
          
         if ActNum == (2) || ActNum == 4
           
          ActStart3 = Time((person-1)*10+trial,map(ActNum,5));
          ActStart3 = table2array (ActStart3);
          
          ActEnd3 = Time((person-1)*10+trial,map(ActNum,6));
          ActEnd3 = table2array (ActEnd3);
        
         end
        
        if ActNum == (2)
              
          ActStart4 = Time((person-1)*10+trial,map(ActNum,7));
          ActStart4 = table2array (ActStart4);
          
          ActEnd4 = Time((person-1)*10+trial,map(ActNum,8));
          ActEnd4 = table2array (ActEnd4);
        
        end
%           disp("start time1 = "+ActStart1);
%           disp("end time1 = "+ActEnd1);
%              
%           disp("start time2 = "+ActStart2);
%           disp("end time2 = "+ActEnd2);
%           
%           disp("start time3 = "+ActStart3);
%           disp("end time3 = "+ActEnd3);
%           
%           disp("start time4 = "+ActStart4);
%           disp("end time4 = "+ActEnd4);
          
          %try
          [a,b,g] = aggFunc (person,trial,ActNum,ActStart1,ActEnd1,ActStart2,ActEnd2, ActStart3, ActEnd3, ActStart4, ActEnd4);
          index = index+1; 
         
          alpha(:,index) = a; 
          beta(:,index) = b; 
          gamma(:,index) = g; 
         % catch e
         % msgbox(e.message);
          %end
             

    end
end

header = {'C1M1','C2M1','C3M1','C1M2','C2M2','C3M2','C1M3','C2M3','C3M3','C1M4','C2M4','C3M4','C1M5','C2M5','C3M5','C1M6','C2M6','C3M6'};
alphat = transpose(alpha);
alphat = [header; num2cell(alphat)];
betat = transpose(beta);
betat = [header; num2cell(betat)];
gammat = transpose(gamma);
gammat = [header; num2cell(gammat)];
writecell(alphat,"Export/alpha" + ActNum + ".csv");
writecell(betat,"Export/beta" + ActNum + ".csv");
writecell(gammat,"Export/gamma" + ActNum + ".csv");
end