% 参数设置
V_ref = 2.5;                   % ADC参考电压
n_bits = 32;                 % ADC位数
N = 2^n_bits;                % ADC输出代码数量
V_min = -V_ref;              % ADC最小输入电压
V_max = V_ref;               % ADC最大输入电压

% 理想ADC函数
ideal_ADC = @(V) round((N-1) * (V - V_min) / (V_max - V_min));

% 增益和失调误差设置
gain_error = 1.1;           % 增益误差系数
offset_error = 0.1;          % 失调误差(单位：V)

% 输入电压范围
V = linspace(V_min, V_max, 200);  % 从-V_ref到V_ref生成200个点

% 理想输出代码
ideal_code = ideal_ADC(V);

% 带有增益和失调误差的ADC输出
output_code = ideal_ADC(gain_error * V + offset_error);

% 绘制结果
figure;
plot(V, ideal_code, 'b-', 'LineWidth', 2); hold on;
plot(V, output_code, 'r--', 'LineWidth', 2);
grid on;
xlabel('输入电压 V (V)');
ylabel('ADC 输出代码');
title('双极性ADC 输出与输入电压的关系');
legend('理想ADC输出', '带误差的ADC输出', 'Location', 'Best');
xlim([V_min, V_max]);
ylim([0, N-1]);