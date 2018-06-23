function [ lines ] = koch( n )

lines = [];
% A = [333 0];
% E = [500 288];
A = [0 0];
E = [1000 0];

line.b = A;
line.e = E;

lines = [lines line];

for i = 1 : n
    next = [];
    t = length(lines);
    for j = 1 : t
        A = lines(j).b;
        E = lines(j).e;
        % B
        B(1) = (2*A(1) + E(1))/3;
        B(2) = (2*A(2) + E(2))/3;
        
        % C
        distAE = sqrt((E(1)-A(1))^2 + (E(2)-A(2))^2);
        angAE = atan2((E(2)-A(2)) , (E(1)-A(1)));
        C(1) = B(1) + (distAE/3) * cos(angAE+(pi/3));
        C(2) = B(2) + (distAE/3) * sin(angAE+(pi/3));
        
        % D
        D(1) = (A(1) + 2*E(1))/3;
        D(2) = (A(2) + 2*E(2))/3;
        
        line1.b = A; line1.e = B;
        line2.b = B; line2.e = C;
        line3.b = C; line3.e = D;
        line4.b = D; line4.e = E;
        
        next = [next line1 line2 line3 line4];
    end
    lines = next;
end
figure
hold on
for i = 1 : length(lines)
    plot([lines(i).b(1) lines(i).e(1) ], [lines(i).b(2) lines(i).e(2)] );    
end
end

