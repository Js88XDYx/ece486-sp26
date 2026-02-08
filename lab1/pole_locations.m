z = 0:0.1:1.1;

poles = z + sqrt(z.^2 - 1)
polesneg = z - sqrt(z.^2 - 1)

hold on
plot(real(poles), imag(poles), 'x')
text(real(poles)+0.02, imag(poles), arrayfun(@(v) sprintf('ζ = %.2g',v), z, 'UniformOutput', false))
xlabel('Real')
ylabel('Imaginary')
axis equal
grid on
title('Poles on Complex Plane (labels show corresponding \zeta)')

plot(real(polesneg), imag(polesneg), 'o')
text(real(polesneg)+0.02, imag(polesneg), arrayfun(@(v) sprintf('ζ = %.2g',v), z, 'UniformOutput', false))
