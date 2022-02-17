clc
clear 
close all

y0=[10 1e-16 0 0 0 0]; % p q r phi theta psi INITIAL CONDITIONS
% NOTE: Dzhanibekov effect occurs because of really little perturbations in
% the other angular velocities (in the body frame)
dt=1e-2; % time step
n=2e3; % number of iterations
y=zeros(6, n+1); % preallocating for improving performance
y(:,1)=y0; % initial conditions
t=0;
%% RUNGE KUTTA 4 SOLVER
for i=1:n
    c1=rot_dynamics(t, y(:, i));
    c2=rot_dynamics(t, y(:, i)+dt*c1/2);
    c3=rot_dynamics(t, y(:, i)+dt*c2/2);
    c4=rot_dynamics(t, y(:, i)+dt*c3);
    y(:, i+1)=y(:, i)+dt/6*(c1+2*c2+2*c3+c4);
    disp(y(:, i+1)')
end

%% PLOT SIMULATION
f1=figure('Renderer', 'painters', 'Position', [100 120 1020 420]);
title('Intermediate axis theorem simulation')
subplot(2,4,1:4)
plot(y(1:3, :)')
legend('p','q','r')
xlim([0 n])

subplot(2,4,5:8)
plot(rad2deg(wrapTo2Pi(y(4:6, :)')))
legend('phi','theta','psi')
xlim([0 n])

f2=figure('Renderer', 'painters', 'Position', [305 96 548 475]);
O = zeros(3);
ijk = eye(3);
for i=1:5:n
    ijk = RBI(y(4, i),y(5, i),y(6, i))*eye(3);
    quiver3(O(1,1), O(1,2), O(1,3), ijk(1,1), ijk(1,2), ijk(1,3), 'r', 'LineWidth', 2)
    hold on
    quiver3(O(2,1), O(2,2), O(2,3), ijk(2,1), ijk(2,2), ijk(2,3), 'g', 'LineWidth', 2)
    quiver3(O(3,1), O(3,2), O(3,3), ijk(3,1), ijk(3,2), ijk(3,3), 'b', 'LineWidth', 2)
    plot3([-1 1], [0 0], [0 0], 'k--')
    plot3([0 0], [-1 1], [0 0], 'k--')
    plot3([0 0], [0 0], [-1 1], 'k--')
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    axis equal
    axis square
    xlim([-1 1])
    ylim([-1 1])
    zlim([-1 1])
    title('Intermediate Axis Theorem 3D simulation')
    drawnow
    hold off
    disp(i)
    frame = getframe(gcf);
    img =  frame2im(frame);
    [img,cmap] = rgb2ind(img,256);
    if i == 1
        imwrite(img,cmap,'animation.gif','gif','LoopCount',Inf,'DelayTime',1e-2);
    else
        imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',1e-2);
    end
end
close(myVideo)