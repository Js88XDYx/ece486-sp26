zeta15 = 1.5; %1.5, 5, 40
zeta5 = 5;
zeta40 = 40;

%setup for z = 1.5
p1_15 = zeta15 + sqrt(zeta15.^2 - 1)
p2_15 = zeta15 - sqrt(zeta15.^2 - 1)

if abs(p1_15) < abs(p2_15)
    pmin_15 = p1_15
else
    pmin_15 = p2_15
end

h1_15 = tf([p1_15*p2_15], [1, p1_15+p2_15, p1_15*p2_15])
h2_15 = tf(pmin_15, [1, pmin_15])

%setup for z = 5
p1_5 = zeta5 + sqrt(zeta5.^2 - 1);
p2_5 = zeta5 - sqrt(zeta5.^2 - 1);

if abs(p1_5) < abs(p2_5)
    pmin_5 = p1_5;
else
    pmin_5 = p2_5;
end

h1_5 = tf([p1_5*p2_5], [1, p1_5+p2_5, p1_5*p2_5])
h2_5 = tf(pmin_5, [1, pmin_5])

%setup for z = 40
p1_40 = zeta40 + sqrt(zeta40.^2 - 1);
p2_40 = zeta40 - sqrt(zeta40.^2 - 1);

if abs(p1_40) < abs(p2_40)
    pmin_40 = p1_40;
else
    pmin_40 = p2_40;
end

h1_40 = tf([p1_40*p2_40], [1, p1_40+p2_40, p1_40*p2_40])
h2_40 = tf(pmin_40, [1, pmin_40])


hold on
% compute step responses for all systems and add labels/legend
t = 0:0.01:1; % common time vector for step responses



actual_15 = step(h1_15);
appr_15 = step(h2_15);
actual_5 = step(h1_5);
appr_5 = step(h2_5);
actual_40 = step(h1_40);
appr_40 = step(h2_40);

hold on;
t = tiledlayout(3,1)
plot(actual_15)
plot(appr_15)

legend('Actual Response', 'Approximate Response');
%xlim([0, 1])
%ylim([0,2])
xlabel('Time (s)');
ylabel('Response');
title(sprintf('Actual and Approximated Step Responses for %s = %.1f', '\zeta', zeta15));
grid on;
nexttile

plot(actual_5)
plot(appr_5)

legend('Actual Response', 'Approximate Response');
%xlim([0, 1])
%ylim([0,2])
xlabel('Time (s)');
ylabel('Response');
title(sprintf('Actual and Approximated Step Responses for %s = %.1f', '\zeta', zeta5));
grid on;
nexttile
plot(actual_40)
plot(appr_40)

legend('Actual Response', 'Approximate Response');
%xlim([0, 1])
%ylim([0,2])
xlabel('Time (s)');
ylabel('Response');
title(sprintf('Actual and Approximated Step Responses for %s = %.1f', '\zeta', zeta40));
grid on;
hold off;

