% 100 various values of n

nSize = zeros(100,1); % row vector of various values of n
tEnd = zeros(100,1); % row vector of time for each value of n
ApproxPi = zeros(100,1); % row vector of approximate pi values for each value of n
AbsErr = zeros(100,1); % row vector of absolute error values for each value of n

for i = 1:100
    n = randi(10000,1); % 100 randomized values of n from 1 to 10000)
    nSize(i) = n; % documents each size n to corresponding vector
    tic; 
    ApproxPi(i) = MontePi(n); % documents approximate pi values to corresponding vector
    AbsErr(i) = abs(pi - ApproxPi(i)); % documents absolute error values to corresponding vector
    tEnd(i) = toc; % documents how long the function MontePi takes to run to corresponding vector
end

% plots execution times against size n
nexttile
plot(nSize,tEnd, "o")
title("Time Plot")

% plots resulting absolute errors against size n
nexttile
plot(nSize,AbsErr, "o")
title("Absolute Error Plot")

%% 

% User inputs a value for n that will be fixed
value_n = input("Give me a value for size n: ");

% Fixed 1 unit square grid for video
figure;
hold('on');
axis([0,1,0,1])
axis('square');

% Begin graphical display of plotting
video = VideoWriter('MontePiPlots.avi');
open(video);
for i = 1:value_n
    xtrials = rand(1);
    ytrials = rand(1);
    distance = sqrt(xtrials.^2+ytrials.^2);
    if distance <= 1 % inside circle, green dot plotted
        scatter(xtrials,ytrials,'green','filled');
        drawnow;
        writeVideo(video,getframe(gcf));
    else % outside circle, red dot plotted
        scatter(xtrials,ytrials,'red','filled');
        drawnow;
        writeVideo(video,getframe(gcf));
    end
end

% displays the approximate value of pi at the bottom left corner
text(0.1, 0.1, "Approximate Value: " + string(MontePi(value_n)), "FontSize", 10)
hold('off');
close(video);


    