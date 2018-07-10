% versione "prime armi": analizzo tutti gli istanti di tempo
% Non fare all'esame, meglio utilizzare un'implementazione vettoriale
function x = rect(t)

x = zeros(size(t));
for i=1:length(t)
   if t(i) > -1/2 && t(i) < 1/2
       x(i) = 1; 
   elseif abs(t(i)) == 1/2
       x(i) = 1/2;
%    else 
%        x(i) = 0;
   end
end
end
