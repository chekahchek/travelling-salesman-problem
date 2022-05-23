function Branch_and_Bound(M)

%The matrix M below is the distance matrix for NUS. Copy it and paste it as an input
%argument 

% M = [inf 2.6 2.35 .75 1 2.3 1.9; 
% 2.3 inf 1.1 2 1.8 0.4 0.6; 
% 2.5 1 inf 2.2 2 0.6 1.4;
% 0.75 2.5 1.6 inf 1.7 1.65 2.6;
% 0.55 1.65 2.1 2.5 inf 1.8 0.9;
% 2.3 0.3 0.6 1.65 1.9 inf 1.3;
% 1.1 0.75 1.5 2.9 0.6 1.5 inf]; 

[row, col] = size(M);
rowmin = min(M,[],2); %finding out the row min in the form of vector

for r = 1:length(rowmin) %looping thru the vector to get rid of inf
    if rowmin(r) == inf 
        rowmin(r) = 0;
    end
end

oldcost = sum(rowmin); %summing the processed rowmin to get the cost

for k=1:row   %reducing the distance matrix
    rowmin = min(M(k,:));
    if rowmin == inf || rowmin == 0
    else    
        M(k,:) = M(k,:) - rowmin;    
    end
end

colmin = min(M,[],1);  %finding out the column min in the form of vector
for r = 1:length(colmin) %processing the vector to get rid of inf
    if colmin(r) == inf 
        colmin(r) = 0;
    end
end
    
oldcost = oldcost + sum(colmin); %finding the lower bound solution
    
for z=1:col %reducing the distance matrix
    colmin = min(M(:,z));
    if colmin == inf || colmin == 0
    else 
        M(:,z) = M(:,z) - colmin;
	end
end   

    
%*************************************After reducing distance matrix*******

newcost = 99999; %set an arbitary high value of additional cost first to be replaced later
minmatrix = [];
route = ones(row,2); 
for i=1:row
    if isempty(minmatrix) ~= 1
        M = minmatrix; 
    end
if newcost ~= 99999 
   oldcost = newcost; %after getting the lowest distance from the parent node, this is to add on the additional
                      %from the child nodes
   newcost = 99999;
end

for j = 1:col
    M_red = M;
    
    if M_red(i,j) ~= inf 
    cost_red = M_red(i,j) + oldcost; 

    M_red(i,:) = inf;
    M_red(:,j) = inf;
    M_red(j,i) = inf;

    rowmin = min(M_red,[],2);
    for r = 1:length(rowmin)
        if rowmin(r) == inf 
            rowmin(r) = 0;
        end
    end
    
    cost_red = cost_red + sum(rowmin);
    for k=1:row
            rowmin = min(M_red(k,:));
        if rowmin == inf || rowmin == 0
        else    
            M_red(k,:) = M_red(k,:) - rowmin;
        end
    end

    colmin = min(M_red,[],1);
    for r = 1:length(colmin)
        if colmin(r) == inf 
            colmin(r) = 0;
        end
    end
    cost_red = cost_red + sum(colmin); %sum of the min of each col

    for z=1:col
        colmin = min(M_red(:,z));
        if colmin == inf || colmin == 0
        else 
            M_red(:,z) = M_red(:,z) - colmin;
        end
    end
    
    if cost_red < newcost
       newcost = cost_red;
       minmatrix = M_red;
       route(i,:) =[i j];  
    end
    end
end


end
disp(newcost)
disp(route)
end