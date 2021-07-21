



a = randn(10,10);

a = randi([-100,100],10,10);



%access information in a matrix

a(2,3)


a(4,:)


a(3:8,:)


a([2,5,6],:)


%take the second row and plot it
b = a(2,:);
figure;plot(b);

%swap the rows
a([2,8],:) = a([8,2],:);


%change information
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


%many others, e.g., sorting, transposing, transformations, etc...

