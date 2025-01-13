% 定义参数
I = 1e-3;  % 恒流源电流 (A)
f_measure = 25;  % 测量频率 (Hz)
t = 1 / (2 * f_measure);  % 充电时间 (s)

% 定义电容范围
C_MIN = 1e-5;  % 最小电容 (10uF)
C_MAX = 1e-2;    % 最大电容 (10mF)

% 生成电容值的范围，从 C_MIN 到 C_MAX
C_values = logspace(log10(C_MIN), log10(C_MAX), 100000);  % 生成 C_MIN 到 C_MAX 的电容值

% 计算电压
V = (I ./ C_values) * t;  % 根据充电公式计算电压

% 绘制图像
figure;
semilogx(C_values * 1e9, V);  % 将电容值转换为 nF（以便于可读性）
xlabel('电容值 (nF)');
ylabel('充电后的电压 (V)');
title('恒定电流斜率测量电容');
grid on;