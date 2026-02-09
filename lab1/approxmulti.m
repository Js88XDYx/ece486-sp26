% generated based on approx2.m 2026-02-09 15:18 using Claude Sonnet 4.5
% Note: the values are so different that you can't really see what's 
% going on between the three, so this isn't really useful. 


zeta_values = [1.5, 5, 40];
figure;
hold on;

for i = 1:length(zeta_values)
    zeta = zeta_values(i);
    p1 = zeta + sqrt(zeta^2 - 1);
    p2 = zeta - sqrt(zeta^2 - 1);
    if abs(p1) < abs(p2)
        pmin = p1;
    else
        pmin = p2;
    end
    actual = tf([p1*p2],[1, p1+p2, p1*p2]);
    approx = tf([pmin], [1, pmin]);
    
    plot(step(actual), 'DisplayName', sprintf('Actual, \\zeta = %.1f', zeta));
    plot(step(approx), '--', 'DisplayName', sprintf('Approx, \\zeta = %.1f', zeta));
end

legend('Location', 'best');
title('Step Response Comparison for Multiple \zeta Values');
xlabel('Time (s)');
ylabel('Response');
grid on;
hold off;