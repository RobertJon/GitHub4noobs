%% GitHub tutorial

clear, close, 
clc

x = linspace(-5,5,100);

y1 = x.^2;
y2 = (0.2*x).^4;


figure(1), plot(x,y1,x,y2,'LineWidth',2), grid, title('GitHub tutorial'), xlabel('x'), ylabel('y')

x_grip1 = [0, 0.5, 0.5, 1.5, 0.5, 0.5, 2.5, 2.5, 0.5, 0.25];%, -0.25, -0.5, -2.5, -2.5, -0.5, -0.5, -1.5, -0.5, -0.5, 0];
x_grip = [x_grip1, -1.*flip(x_grip1)];

y_grip1 = [0, -1, -1.5, -3, -2.5, -3, -5, -6, -6, -7.5];
y_grip = [y_grip1, flip(y_grip1)];

grip = [x_grip; y_grip];

figure(2), plot(x_grip,y_grip,'b','Linewidth',3), grid, title('JAS 39 Welfare'), axis([-5 5 -10 3])

x_path = linspace(0,3,100);
y_path = 2.*x_path;
path = [x_path; y_path]; 

theta = -1*linspace(0,90,100);

for i = 1:1:length(x_path)
    
    for j = 1:1:length(grip)
        
        Rmat = [cosd(theta(i)) -sind(theta(i)); sind(theta(i)) cosd(theta(i))];
        
        grip(:,j) = (grip(:,j) + path(:,i));
        gripp(:,j) = Rmat*grip(:,j);
    end
    
    figure(3), plot(gripp(1,:),gripp(2,:),'b','LineWidth',3), grid, axis([-10 100 -10 100])
    pause(0.001)
    
    
end

