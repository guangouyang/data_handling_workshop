



a = randn(10,10);

a = randi([-100,100],10,10);


%take the second row and plot it
b = a(2,:);figure;plot(b);

a = -a;

%change all the positive values to zero

%option one

for j = 1:10
    for k = 1:10
        if a(j,k) > 0
            a(j,k) = 0;
        end
    end
end

%option two

a(a>0) = 0;



