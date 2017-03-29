function f = x_correlation(x, y, t, dt)
  f = zeros(size(t));
  
  for i=1:length(t)
    y_shift = my_shift(y, t, abs(round(i/dt)));
    %fancy debugging! - it may take a lot of time to plot every shifted function
    %plot(t, y_shift,'color', rand(1,3),'LineWidth', 1.5);
    figure(); plot(t, y_shift, 'LineWidth', 1.5, 'r'); hold on; 
    plot(t, conj(x), 'LineWidth', 1.5);
    f(i) = my_scalarProduct(y_shift, conj(x), dt);
  end
end
