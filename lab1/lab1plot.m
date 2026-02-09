lab1

zeta = [2, 1.5, 1, 0.8, 0.7, 0.5, 0.3, 0.2];

figure;
[C1_Mp, C1_tr, C1_ts] = StepResponseMetrics(y1(:,2), y1(:,1), 1, 2, zeta(1));
[C2_Mp, C2_tr, C2_ts] = StepResponseMetrics(y2(:,2), y2(:,1), 1, 2, zeta(2));
[C3_Mp, C3_tr, C3_ts] = StepResponseMetrics(y3(:,2), y3(:,1), 1, 2, zeta(3));
[C4_Mp, C4_tr, C4_ts] = StepResponseMetrics(y4(:,2), y4(:,1), 1, 2, zeta(4));
[C5_Mp, C5_tr, C5_ts] = StepResponseMetrics(y5(:,2), y5(:,1), 1, 2, zeta(5));
[C6_Mp, C6_tr, C6_ts] = StepResponseMetrics(y6(:,2), y6(:,1), 1, 2, zeta(6));
[C7_Mp, C7_tr, C7_ts] = StepResponseMetrics(y7(:,2), y7(:,1), 1, 2, zeta(7));
[C8_Mp, C8_tr, C8_ts] = StepResponseMetrics(y8(:,2), y8(:,1), 1, 2, zeta(8));

figure;
hold on
plot(y1(:,1),y1(:,2),'-')
plot(y2(:,1),y2(:,2),':')
plot(y3(:,1),y3(:,2),'-.')
plot(y4(:,1),y4(:,2),'--')
plot(y5(:,1),y5(:,2),'-')
plot(y6(:,1),y6(:,2),':')
plot(y7(:,1),y7(:,2),'-.')
plot(y8(:,1),y8(:,2),'--')
hold off
legend("\zeta = 2.0", "\zeta = 1.5", "\zeta = 1.0", "\zeta = 0.8", ...
    "\zeta = 0.7" ...
    ,"\zeta = 0.5", "\zeta = 0.3", "\zeta = 0.2")
xlabel("\tau"); ylabel("Step Response (V)"); title("Step Response of a " + ...
    "Generic 2nd Order System for Varying Damping Ratio \zeta")