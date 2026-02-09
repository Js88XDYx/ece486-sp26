zeta = 1.5;

p1 = zeta + sqrt(zeta^2 - 1)
p2 = zeta - sqrt(zeta^2 - 1)

if abs(p1) < abs(p2)
    pmin = p1
else
    pmin = p2
end

actual = tf([p1*p2],[1, p1+p2, p1*p2])
approx = tf([pmin], [1, pmin])

hold on
plot(step(actual))
plot(step(approx),'--')
legend('Actual Response', 'Approximate Response');
title('Step Response Comparison');
xlabel('Time (s)');
ylabel('Response');
grid on;
