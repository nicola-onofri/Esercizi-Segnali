function x = integral(x,dt)
  % INTEGRAL calcolo dell'integrale di un segnale con il metodo dei
  % rettangoli
  % x = il segnale di cui si vuole calcolare l'integrale
  % dt = il passo temporale
  
  x = sum(x)*dt;
end 
