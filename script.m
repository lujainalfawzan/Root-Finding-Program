syms x
%Get an equation from the user
prompt = "Enter an equation: ";
equation = input(prompt)
Function = function_handle(equation); %the origin


%Get the method from the user
prompt = "Enter the number of method desired:\n 1- Bisection method\n 2- Fixed Point method\n 3- Newton’s method  ";
method = input(prompt,"s");
%Get the stopping criterion from the user
prompt = "Enter stopping criterion : ";
stoppingCriterion = input(prompt)

%set stopping criterion to 10−5 in case it's missing
if isempty(stoppingCriterion)
    
  stoppingCriterion = 0.00001;
  
end

reError = 10000;  %randomly large relative approximate error


if method == '1' 
    
    %Get the interval from the user
    prompt = "Enter a in [a,b] : ";
    xLower = input(prompt)
    prompt = "Enter b in [a,b] : ";
    xUpper = input(prompt)
    
    oldMid = 0;
    %to check if the upper and lower bonds have different signs
    if (Function(xLower)*Function(xUpper)) < 0 
        mid=(xLower + xUpper)/2; 
        
        %to iterate through the function until the condition is satisfied
        while reError >= stoppingCriterion
            
            
            if (Function(mid)*Function(xUpper))<0
                xLower=mid;
            else
                xUpper=mid;
            end
            
            
            reError = abs((mid-oldMid));
            oldMid = mid;
            mid = (xLower+xUpper) /2;
            fprintf('\n\nthe approximated value equals %f',mid);
            fprintf('\n\nErorr %f',reError);

            
        end
        
    else
        fprintf('\n\nThere is no root on the giving interval!');
    end
    
end


if method == '2' 
    
     %Get the interval from the user
    prompt = "Enter a in [a,b] : ";
    xLower = input(prompt)
    prompt = "Enter b in [a,b] : ";
    xUpper = input(prompt)
    
    Xi = xLower; 
    g1 = Function + x; 
    g = function_handle(g1);
    Xii = g(Xi); 
    if (Function(xLower)*Function(xUpper)) < 0
        while reError >= stoppingCriterion 
            
            Xi = Xii; 
            Xii = g(Xi); 
            reError = abs((Xii-Xi));
            fprintf('\n\nthe approximated value equals %f',Xii);
            fprintf('\n\nErorr %f\n',reError);
        end 
         
    else
        fprintf('\n\nThere is no root on the giving interval!');
    end
        
end
    


if method == '3' 
    
    prompt = "Enter Initial Solution : ";
    initialSolution = input(prompt)
    
    diffEquation = diff(Function(x));
    Function2 = function_handle(diffEquation); %the dervative
    
    Xi = initialSolution; 

    while reError >= stoppingCriterion
        if(Function2(Xi) !=0)
        Xii = Xi - (Function(Xi)/Function2(Xi));
        reError = abs((Xii-Xi));
        Xi = Xii;
        
        else
        fprintf('\n\nThere is no solution');
        reError = -1;
    end
     fprintf('\n\nthe approximated value equals %f',Xii);
     fprintf('\n\nErorr %f',reError);
end
end
