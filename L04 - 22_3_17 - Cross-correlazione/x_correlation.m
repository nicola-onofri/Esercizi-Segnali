function f = x_correlation(x, y, t, dt)
  f = zeros(size(t));
  
  %not working at the moment
  for i=1:length(t)
    y_shift = my_shift(y, t, tau);
    %fancy debugging! - it may take a lot of time to plot every shifted func
    %plot(t, y_shift,'color', rand(1,3),'LineWidth', 1.5);
    f(tau) = my_scalarProduct(my_shift(y, t, tau), conj(x), dt);
  end
end
