clear;
close all;

dt = 0.01;
t = -10:dt:10;
Narm = 10:10:30;
X0 = 0;
T1 = 4;

%es1
%signal
p = t.*my_rect(t./4);
x1 = zeros(size(t));

for k = -5:5
  t_shift = t-k*T1;
  x1 = x1 + (t_shift).*my_rect(t_shift/4);
end

x1Approx = zeros(size(t));

for k = 1:Narm(3)
  bk = (-1)^k*(-2/(pi*k));
  x1Approx = x1Approx + bk.*sin(2*pi.*t.*(k/T1));
end

x1Approx = X0 + 2.*x1Approx;

plot(t, x1,'r','Linewidth', 1.3); hold on; 
plot(t, x1Approx, 'b','Linewidth', 1.3);

%es2
%x2 = abs(cos(2*pi.*(t/4) - pi/4));
%T2 = 2;
%
%X0 = 2/pi;
%Xpos = zeros(size(Narm(1)));
%Xneg = zeros(size(Narm(1)));
%
%for k = 1:Narm(1)
%  if (mod(k,2)==0)
%    Xpos(k) = (2*exp(-j*pi*(k/2))) / (pi*(4*k^2-1))
%  else
%    Xneg(k) = (-2*exp(-j*pi*(k/2))) / (pi*(4*k^2-1))
%  end
%end
%
%x2Approx = zeros(size(t));
%
%for k = -5:5
%  if k < 0
%    x2Approx = x2Approx + Xneg(abs(k));    
%  else if k > 0
%    x2Approx = x2Approx + Xpos(k);
%  end
%end

%x2Approx = X0 + x2Approx;
%plot(t,x2Approx);