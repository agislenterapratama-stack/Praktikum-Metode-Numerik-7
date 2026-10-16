% =========================================================================
% TUGAS SISTEM PERSAMAAN NON-LINEAR (METODE NUMERIK)
% File: Tugas_SPNL.m
% Deskripsi: Penyelesaian Persamaan Non-Linear Menggunakan Grafik Tunggal/Ganda,
%            Metode Biseksi, dan Metode Regula-Falsi.
% =========================================================================

clc; clear; close all;

% =========================================================================
% BAGIAN 1: DEFINISI FUNGSI METODE NUMERIK (BISEKSI & REGULA-FALSI)
% =========================================================================

function c = Biseksi(f, a, b, n, tol)
    fa = f(a); fb = f(b);
    if fa * fb > 0
        error('Warning: f(a) dan f(b) memiliki tanda yang sama.');
    endif
    fprintf('Iter\t    a\t\t    b\t\t   fa\t\t   fb\t\t    c\t\t   fc\n');
    fprintf('-----------------------------------------------------------------------------------\n');
    for i = 1:n
        c = (a + b) / 2;
        fc = f(c);
        fprintf('%2d\t%9.6f\t%9.6f\t%9.6f\t%9.6f\t%9.6f\t%9.6f\n', i, a, b, fa, fb, c, fc);
        if abs(fc) <= tol || abs(b - a) <= tol
            break;
        endif
        if fa * fc == 0
            break;
        elseif fa * fc < 0
            b = c; fb = fc;
        else
            a = c; fa = fc;
        endif
    endfor
endfunction

function c = RegulaFalsi(f, a, b, n, tol)
    fa = f(a); fb = f(b);
    if fa * fb > 0
        error('Warning: f(a) dan f(b) memiliki tanda yang sama.');
    endif
    fprintf('Iter\t    a\t\t    b\t\t   fa\t\t   fb\t\t    c\t\t   fc\n');
    fprintf('-----------------------------------------------------------------------------------\n');
    for i = 1:n
        c = (a * fb - b * fa) / (fb - fa);
        fc = f(c);
        fprintf('%2d\t%9.6f\t%9.6f\t%9.6f\t%9.6f\t%9.6f\t%9.6f\n', i, a, b, fa, fb, c, fc);
        if abs(fc) <= tol || abs(b - a) <= tol
            break;
        endif
        if fa * fc == 0
            break;
        elseif fa * fc < 0
            b = c; fb = fc;
        else
            a = c; fa = fc;
        endif
    endfor
endfunction

% PARAMETER UMUM ITERASI
n_max = 20;
toleransi = 0.0001;

% =========================================================================
% BAGIAN 2: PERSAMAAN 1 -> y = 3x^3 - 5x^2 + 4x - 7, y = 1 => 3x^3 - 5x^2 + 4x - 8 = 0
% =========================================================================
fprintf('\n===================================================================\n');
fprintf('  PERSAMAAN 1: f(x) = 3x^3 - 5x^2 + 4x - 8 = 0\n');
fprintf('===================================================================\n');

f1 = @(x) 3*x.^3 - 5*x.^2 + 4*x - 8;
f1_a = @(x) 3*x.^3 - 5*x.^2;
f1_b = @(x) -4*x + 8;

% Plot Grafik Persamaan 1
figure('Name', 'Persamaan 1');
subplot(1, 2, 1);
x1 = linspace(0, 3, 200);
plot(x1, f1(x1), 'b-', 'LineWidth', 1.5); hold on;
line([0, 3], [0, 0], 'Color', 'r', 'LineStyle', '--');
grid on; title('Grafik Tunggal: y = 3x^3-5x^2+4x-8'); xlabel('x'); ylabel('y');

subplot(1, 2, 2);
plot(x1, f1_a(x1), 'b-', 'LineWidth', 1.5); hold on;
plot(x1, f1_b(x1), 'g-', 'LineWidth', 1.5);
grid on; title('Grafik Ganda: y1 = 3x^3-5x^2 vs y2 = -4x+8'); xlabel('x'); ylabel('y');
legend('y1', 'y2');

% Perhitungan Numerik
a1 = 1; b1 = 2;
fprintf('\n--- A. METODE BISEKSI (Persamaan 1) ---\n');
c1_bis = Biseksi(f1, a1, b1, n_max, toleransi);
fprintf('Akar ditemukan (Biseksi): x = %.6f\n', c1_bis);

fprintf('\n--- B. METODE REGULA-FALSI (Persamaan 1) ---\n');
c1_rf = RegulaFalsi(f1, a1, b1, n_max, toleransi);
fprintf('Akar ditemukan (Regula-Falsi): x = %.6f\n', c1_rf);


% =========================================================================
% BAGIAN 3: PERSAMAAN 2 -> y = e^x - x^2, y = 0 => e^x - x^2 = 0
% =========================================================================
fprintf('\n===================================================================\n');
fprintf('  PERSAMAAN 2: f(x) = e^x - x^2 = 0\n');
fprintf('===================================================================\n');

f2 = @(x) exp(x) - x.^2;
f2_a = @(x) exp(x);
f2_b = @(x) x.^2;

% Plot Grafik Persamaan 2
figure('Name', 'Persamaan 2');
subplot(1, 2, 1);
x2 = linspace(-2, 1, 200);
plot(x2, f2(x2), 'b-', 'LineWidth', 1.5); hold on;
line([-2, 1], [0, 0], 'Color', 'r', 'LineStyle', '--');
grid on; title('Grafik Tunggal: y = e^x - x^2'); xlabel('x'); ylabel('y');

subplot(1, 2, 2);
plot(x2, f2_a(x2), 'b-', 'LineWidth', 1.5); hold on;
plot(x2, f2_b(x2), 'g-', 'LineWidth', 1.5);
grid on; title('Grafik Ganda: y1 = e^x vs y2 = x^2'); xlabel('x'); ylabel('y');
legend('y1', 'y2');

% Perhitungan Numerik
a2 = -1; b2 = 0;
fprintf('\n--- A. METODE BISEKSI (Persamaan 2) ---\n');
c2_bis = Biseksi(f2, a2, b2, n_max, toleransi);
fprintf('Akar ditemukan (Biseksi): x = %.6f\n', c2_bis);

fprintf('\n--- B. METODE REGULA-FALSI (Persamaan 2) ---\n');
c2_rf = RegulaFalsi(f2, a2, b2, n_max, toleransi);
fprintf('Akar ditemukan (Regula-Falsi): x = %.6f\n', c2_rf);


% =========================================================================
% BAGIAN 4: PERSAMAAN 3 -> y = log10(x+2) + 2x - 3, y = 0
% =========================================================================
fprintf('\n===================================================================\n');
fprintf('  PERSAMAAN 3: f(x) = log10(x+2) + 2x - 3 = 0\n');
fprintf('===================================================================\n');

f3 = @(x) log10(x + 2) + 2*x - 3;
f3_a = @(x) log10(x + 2);
f3_b = @(x) -2*x + 3;

% Plot Grafik Persamaan 3
figure('Name', 'Persamaan 3');
subplot(1, 2, 1);
x3 = linspace(0, 2, 200);
plot(x3, f3(x3), 'b-', 'LineWidth', 1.5); hold on;
line([0, 2], [0, 0], 'Color', 'r', 'LineStyle', '--');
grid on; title('Grafik Tunggal: y = log10(x+2) + 2x - 3'); xlabel('x'); ylabel('y');

subplot(1, 2, 2);
plot(x3, f3_a(x3), 'b-', 'LineWidth', 1.5); hold on;
plot(x3, f3_b(x3), 'g-', 'LineWidth', 1.5);
grid on; title('Grafik Ganda: y1 = log10(x+2) vs y2 = -2x+3'); xlabel('x'); ylabel('y');
legend('y1', 'y2');

% Perhitungan Numerik
a3 = 1; b3 = 2;
fprintf('\n--- A. METODE BISEKSI (Persamaan 3) ---\n');
c3_bis = Biseksi(f3, a3, b3, n_max, toleransi);
fprintf('Akar ditemukan (Biseksi): x = %.6f\n', c3_bis);

fprintf('\n--- B. METODE REGULA-FALSI (Persamaan 3) ---\n');
c3_rf = RegulaFalsi(f3, a3, b3, n_max, toleransi);
fprintf('Akar ditemukan (Regula-Falsi): x = %.6f\n', c3_rf);
