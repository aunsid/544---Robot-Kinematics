%%Invkine
a =[ 0; 0.270; 0.270; 0; 0; 0];
d =[0.290; 0; 0; 0.302; 0; 0.072];
alpha = [-pi/2;0;-pi/2;-pi/2;pi/2;-pi/2];
t= [5;6;7;2;7;8];
reachable= true;

for i=1:6
    H(:,:,i)=dhTransform(a(i),d(i),alpha(i),t(i));    
end
display(H);