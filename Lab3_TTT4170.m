clc;
clear all;
close all;

Erlend_test_1 = matfile("Erlend_Test1.mat");
Erlend_test_2 = matfile("Erlend_Test2.mat");
Emil_test_1 = matfile("Emil_Test1.mat");
Emil_test_2 = matfile("Emil_Test2.mat");

x = linspace(-20, 20);
y = x;

Erl_perceived_1 = Erlend_test_1.responseval;
Erl_presented_1 = -Erlend_test_1.anglevec;
Emi_perceived_1 = Emil_test_1.responseval;
Emi_presented_1 = -Emil_test_1.anglevec;

P_Erlend = polyfit(Erl_presented_1, Erl_perceived_1, 1);
P_Emil = polyfit(Emi_presented_1, Emi_perceived_1, 1);


figure(5)
subplot(1,2,1);
plot(Erl_presented_1, Erl_perceived_1, ".", Color="blue",MarkerSize=15)
hold on
plot(x,y,"--" ,color="Black")
plot(x, P_Erlend(1)*x + P_Erlend(2), color="Red");
hold off
grid on
xlabel("Presented Angle [deg]"),ylabel("Perceived Angle [deg]"), title("Perceived vs. Presented angle for the Intensity Stereo test")
xlim([-18 18]), ylim([-20 22]);
legend("Erlend","Fitted Line", "Ideal Line", "location", "best");
set(gcf,'units','centimeters','position',[3,1,29.7,11.0]);
set(gca,'fontsize',12,'fontweight','bold');

angle_deviation_Erlend = Erl_perceived_1 - Erl_presented_1;
angle_deviation_Emil = Emi_perceived_1 - Emi_presented_1;

std_Erlend = std(angle_deviation_Erlend);
std_Emil = std(angle_deviation_Emil);
mean_Erlend = mean(angle_deviation_Erlend);
mean_Emil = mean(angle_deviation_Emil);


figure(5);
subplot(1,2,2);
plot(Emi_presented_1, Emi_perceived_1, ".", Color="red", MarkerSize=15)
hold on
plot(x,y,"--" ,color="Black")
plot(x, P_Emil(1)*x + P_Emil(2), color="Red");
hold off
grid on
xlabel("Presented Angle [deg]"),ylabel("Perceived Angle [deg]"), title("Perceived vs. Presented angle for the Intensity Stereo test")
xlim([-18 18]), ylim([-20 22]);
legend("Emil","Fitted Line", "Ideal Line", "location", "best");
set(gcf,'units','centimeters','position',[3,1,29.7,11.0]);
set(gca,'fontsize',12,'fontweight','bold');
exportgraphics(figure(5), ['Perceived_vs_Presented_angle.png'],'Resolution',450)

%plot(Erlend_Test1.mat)


