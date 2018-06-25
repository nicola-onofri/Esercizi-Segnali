function x = my_integral(x,dt)
  %Il vettore x contiene già i valori del segnale per ogni istante
  %temporale, quindi per calcolare l'area sottesa dal segnale basta
  %moltiplicare il valore del segnale per l'ampiezza dello step temporale
  %dt. Metodo dei rettangoli.
  x = sum(x)*dt;
end 
