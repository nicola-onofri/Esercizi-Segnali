a = [3:5 4:2:8 3:-1:1 2:4];
b = 5;

%for loop example
for i=1:length(a)
    if a(i) > 3
        fprintf('a di %d e'' maggiore di 3\n', i);
    end 
end