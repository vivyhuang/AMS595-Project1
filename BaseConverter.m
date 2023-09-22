prompt1 = "Choose an integer, n, between 2 and 10, inclusive. ";
prompt2 = "Choose a number in base-n. ";
prompt3 = "Choose another integer, m, between 2 and 10, inclusive. ";

% User inputs are stored in the variables. %

n = input(prompt1);
number = input(prompt2);
m = input(prompt3);

NumArray = num2str(number); 

if n>=2 && n<=10 % If n is not in the parameter, it displays an error.
    if m>=2 && m<=10 % If m is not in the parameter, it displays an error.
        for i = 1:length(NumArray)
            % The user inputted number was turned into a string to test that each
            % digit in the number is less than  n. This makes sure that the user
            % inputted number is in base-n. If any digit is greater than or equal n, 
            % it displays an error.
            if str2num(NumArray(i)) >= n
                disp("Error: Number is not in base-" + n + ".");
                break;
            end
        end
        converted = dec2base(base2dec(NumArray,n),m); % This converts the number in base-n to base-m.
        % Displays user inputs and the converted number
        disp("Input 1: " + n);
        disp("Input 2: " + number);
        disp("Input 3: " + m);
        disp("Output: Your number in base " + m + " is: " + converted);
    else
        disp("Error: m is not between 2 and 10, inclusive.");
    end
else
    disp("Error: n is not between 2 and 10, inclusive.");
end

