clc; clear; close all;


M = 2.4;      
m = 0.6;      l = 0.5;      
g = 9.81;     
% x(1) = theta (rad)
% x(2) = theta_dot (rad/s)
% x(3) = x_cart (m)
% x(4) = x_dot_cart (m/s)
% Initial condition
x0 = [pi/4; 0; 0; 0];  
tspan = [0 10];
% Simulate nonlinear dynamics
[t, x_nl] = ode45(@(t,x) cartpole_nonlinear(t,x,M,m,l,g), tspan, x0);
theta = x_nl(:,1);     % pendulum angle
x_cart = x_nl(:,3);    % cart position
%% Plots
figure;
plot(t, theta*180/pi, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('\theta (deg)');
title('Nonlinear Pendulum Angle');
grid on;
figure;
plot(t, x_cart, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Cart Position (m)');
title('Cart Position');
grid on;
%% Animation
figure;
for k = 1:5:length(t)
    clf; hold on;
 % Track
    plot([-4 4],[0 0],'k','LineWidth',2);
% Cart
    cart_x = x_cart(k);
    rectangle('Position',[cart_x-0.3 -0.1 0.6 0.2],'FaceColor',[0.2 0.6 1]);
 % Pendulum
    px = cart_x + l*sin(theta(k));
    py = l*cos(theta(k));
    plot([cart_x px],[0 py],'k','LineWidth',2);
    plot(px,py,'ro','MarkerSize',8,'MarkerFaceColor','r');
 axis([-4 4 -0.2 1.2]);
    title(sprintf('Time = %.2f s | Theta = %.2f deg', t(k), theta(k)*180/pi));
    drawnow;
end

%% Nonlinear dynamics function
function dx = cartpole_nonlinear(~, x, M, m, l, g)
    theta     = x(1);
    theta_dot = x(2);
    x_dot     = x(4);

    % No control force (free fall)
    u = 0;

    % Common denominator
    den = M + m*sin(theta)^2;

    % Nonlinear eqns from Lagrange
    theta_ddot = (g*sin(theta) - cos(theta)*(u + m*l*theta_dot^2*sin(theta))/den) / ...
                 (l*(4/3 - m*cos(theta)^2/den));
    x_ddot = (u + m*l*(theta_dot^2*sin(theta) - theta_ddot*cos(theta))) / den;

    dx = [theta_dot;
          theta_ddot;
          x_dot;
          x_ddot];
end
