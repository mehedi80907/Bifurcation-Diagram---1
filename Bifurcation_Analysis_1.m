%% ============================================================
%  BIFURCATION ANALYSIS — Fixed Version
%  Equation 1: y = u + c*t
%  Equation 2: y = u*t + (1/2)*c*t^2
%  সব ৬টি Graph সঠিকভাবে আসবে
%% ============================================================

clear all;
close all;
clc;

%% রঙ define করা
c_stable   = [0.22 1.00 0.53];   % সবুজ  → stable
c_unstable = [1.00 0.30 0.43];   % লাল   → unstable
c_bif      = [1.00 0.82 0.40];   % হলুদ  → bifurcation
c_neutral  = [0.00 0.90 1.00];   % নীল   → neutral
c_param    = [0.73 0.51 1.00];   % বেগুনি → parameter space
bg         = [0.05 0.06 0.08];   % কালো background
ax_bg      = [0.08 0.09 0.12];   % axes background

%% ============================================================
%%  EQUATION 1: y = u + ct
%% ============================================================

%% Graph ① — y vs t
u = 2;
t = linspace(-3, 3, 200);

y_cpos  = u + 2    .* t;
y_czero = u + 0    .* t;
y_cneg  = u + (-2) .* t;

figure(1);
set(gcf, 'Color', bg, 'Name', 'Graph 1: y vs t [EQ1]');
axes('Color', ax_bg, 'XColor', 'w', 'YColor', 'w', ...
     'GridColor', [0.2 0.2 0.2], 'GridAlpha', 0.5);
hold on; grid on;

plot(t, y_cpos,  '-',  'Color', c_stable,   'LineWidth', 2.5);
plot(t, y_czero, '--', 'Color', c_bif,       'LineWidth', 2.5);
plot(t, y_cneg,  '-',  'Color', c_unstable,  'LineWidth', 2.5);
plot(0, u, 'o', 'Color', c_bif, 'MarkerSize', 10, 'MarkerFaceColor', c_bif);

yline(0, ':', 'Color', [0.3 0.3 0.3], 'LineWidth', 1);
xline(0, ':', 'Color', [0.3 0.3 0.3], 'LineWidth', 1);

xlabel('t  (state variable)', 'Color', 'w', 'FontSize', 12);
ylabel('y',                   'Color', 'w', 'FontSize', 12);
title({'Graph 1: y vs t  [y = u + ct,  u=2]', ...
       'c=0 te flat line = Bifurcation Point'}, ...
       'Color', 'w', 'FontSize', 13);
legend({'c = +2  (baRche)', 'c = 0  <- Bifurcation', 'c = -2  (komche)'}, ...
       'TextColor', 'w', 'Color', [0.12 0.12 0.18], ...
       'EdgeColor', [0.3 0.3 0.4], 'FontSize', 10);
hold off;


%% Graph ② — y vs c
u       = 2;
t_fixed = 1;
c_range = linspace(-4, 4, 200);
y_vc    = u + c_range .* t_fixed;

figure(2);
set(gcf, 'Color', bg, 'Name', 'Graph 2: y vs c [EQ1]');
axes('Color', ax_bg, 'XColor', 'w', 'YColor', 'w', ...
     'GridColor', [0.2 0.2 0.2], 'GridAlpha', 0.5);
hold on; grid on;

plot(c_range, y_vc, '-', 'Color', c_neutral, 'LineWidth', 2.5);
xline(0, '--', 'Color', c_bif, 'LineWidth', 2.5);
plot(0, u, 'o', 'Color', c_bif, 'MarkerSize', 10, 'MarkerFaceColor', c_bif);
yline(0, ':', 'Color', [0.3 0.3 0.3], 'LineWidth', 1);
text(0.2, 1.5, 'Bifurcation  c=0', 'Color', c_bif, 'FontSize', 10);

xlabel('c  (parameter)', 'Color', 'w', 'FontSize', 12);
ylabel('y',              'Color', 'w', 'FontSize', 12);
title({'Graph 2: y vs c  [t=1,  u=2]', ...
       'c=0 te y=u=2, slope poribOrton'}, ...
       'Color', 'w', 'FontSize', 13);
hold off;


%% Graph ③ — Parameter Space EQ1
u_range    = linspace(-3, 3, 100);
c_bif_line = zeros(1, 100);

figure(3);
set(gcf, 'Color', bg, 'Name', 'Graph 3: Parameter Space [EQ1]');
axes('Color', ax_bg, 'XColor', 'w', 'YColor', 'w', ...
     'GridColor', [0.2 0.2 0.2], 'GridAlpha', 0.5);
hold on; grid on;

fill([-3 3 3 -3], [0 0 2 2],   c_stable,   'FaceAlpha', 0.2, 'EdgeColor', 'none');
fill([-3 3 3 -3], [0 0 -2 -2], c_unstable, 'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(u_range, c_bif_line, '-', 'Color', c_param, 'LineWidth', 3);

text(0,  1.2, 'c > 0  ->  y baRe',  'Color', c_stable,   'HorizontalAlignment', 'center', 'FontSize', 11);
text(0, -1.2, 'c < 0  ->  y kome',  'Color', c_unstable, 'HorizontalAlignment', 'center', 'FontSize', 11);
text(1.5, 0.2, 'c = 0  Bifurcation Line', 'Color', c_param, 'FontSize', 9);

xlabel('u  (parameter)', 'Color', 'w', 'FontSize', 12);
ylabel('c  (parameter)', 'Color', 'w', 'FontSize', 12);
title({'Graph 3: Parameter Space  [u vs c]', ...
       'Bifurcation Set = c=0 (beguni line)'}, ...
       'Color', 'w', 'FontSize', 13);
xlim([-3 3]); ylim([-2 2]);
hold off;


%% ============================================================
%%  EQUATION 2: y = ut + (1/2)ct^2
%% ============================================================

%% Graph ④ — t* vs c  (মূল Bifurcation Diagram)
u = 2;

c_neg     = linspace(-4, -0.1, 300);
c_pos     = linspace( 0.1,  4, 300);
tstar_neg = -u ./ c_neg;
tstar_pos = -u ./ c_pos;

figure(4);
set(gcf, 'Color', bg, 'Name', 'Graph 4: t* vs c [EQ2] — MAIN');
axes('Color', ax_bg, 'XColor', 'w', 'YColor', 'w', ...
     'GridColor', [0.2 0.2 0.2], 'GridAlpha', 0.5);
hold on; grid on;

plot(c_neg, tstar_neg, '-', 'Color', c_unstable, 'LineWidth', 2.5);
plot(c_pos, tstar_pos, '-', 'Color', c_stable,   'LineWidth', 2.5);
xline(0, '--', 'Color', c_bif, 'LineWidth', 2.5);
yline(0, ':',  'Color', [0.3 0.3 0.3], 'LineWidth', 1);

text(0.15, 14, 'c=0  Bifurcation!', 'Color', c_bif, 'FontSize', 10);
text(-3.8, 18, 't* -> +inf',        'Color', c_bif, 'FontSize', 11);

xlabel('c  (parameter)',       'Color', 'w', 'FontSize', 12);
ylabel('t*  (critical point)', 'Color', 'w', 'FontSize', 12);
title({'Graph 4: t* vs c  [u=2]   <- Sobcheye Guruttopurno!', ...
       'c -> 0 hole t* -> +/-inf   =   Fold Bifurcation'}, ...
       'Color', 'w', 'FontSize', 13);
legend({'c < 0  (Unstable)', 'c > 0  (Stable)'}, ...
       'TextColor', 'w', 'Color', [0.12 0.12 0.18], ...
       'EdgeColor', [0.3 0.3 0.4], 'FontSize', 10);
ylim([-20 20]);
hold off;


%% Graph ⑤ — t* vs u  (linear, c=1 fixed)
c_fixed  = 1;
u_range2 = linspace(-4, 4, 200);
tstar_u  = -u_range2 ./ c_fixed;

figure(5);
set(gcf, 'Color', bg, 'Name', 'Graph 5: t* vs u [EQ2]');
axes('Color', ax_bg, 'XColor', 'w', 'YColor', 'w', ...
     'GridColor', [0.2 0.2 0.2], 'GridAlpha', 0.5);
hold on; grid on;

plot(u_range2, tstar_u, '-', 'Color', c_stable, 'LineWidth', 2.5);
plot(0, 0, 'o', 'Color', c_bif, 'MarkerSize', 10, 'MarkerFaceColor', c_bif);
yline(0, ':', 'Color', [0.3 0.3 0.3], 'LineWidth', 1);
xline(0, ':', 'Color', [0.3 0.3 0.3], 'LineWidth', 1);

text(1.5, 2.5, 'slope = -1/c = -1', 'Color', c_neutral, 'FontSize', 10);
text(0.2, -0.6, 'u=0, t*=0',         'Color', c_bif,     'FontSize',  9);

xlabel('u  (parameter)',       'Color', 'w', 'FontSize', 12);
ylabel('t*  (critical point)', 'Color', 'w', 'FontSize', 12);
title({'Graph 5: t* vs u  [c=1 fixed]', ...
       'Shorolrekha — kono Bifurcation nei'}, ...
       'Color', 'w', 'FontSize', 13);
hold off;


%% Graph ⑥ — Parameter Space EQ2
u_range3    = linspace(-3, 3, 100);
c_bif_line3 = zeros(1, 100);

figure(6);
set(gcf, 'Color', bg, 'Name', 'Graph 6: Parameter Space [EQ2]');
axes('Color', ax_bg, 'XColor', 'w', 'YColor', 'w', ...
     'GridColor', [0.2 0.2 0.2], 'GridAlpha', 0.5);
hold on; grid on;

fill([-3 3 3 -3], [0 0 2 2],   c_stable,   'FaceAlpha', 0.2, 'EdgeColor', 'none');
fill([-3 3 3 -3], [0 0 -2 -2], c_unstable, 'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(u_range3, c_bif_line3, '-', 'Color', c_param, 'LineWidth', 3);

text(0,  1.2, 'c > 0   STABLE  (Minimum)', ...
     'Color', c_stable,   'HorizontalAlignment', 'center', 'FontSize', 11);
text(0, -1.2, 'c < 0   UNSTABLE  (Maximum)', ...
     'Color', c_unstable, 'HorizontalAlignment', 'center', 'FontSize', 11);
text(1.2, 0.18, 'Bifurcation  c=0', 'Color', c_param, 'FontSize', 9);

xlabel('u  (parameter)', 'Color', 'w', 'FontSize', 12);
ylabel('c  (parameter)', 'Color', 'w', 'FontSize', 12);
title({'Graph 6: Parameter Space  [u vs c]', ...
       'c=0 par hole Stable -> Unstable transition'}, ...
       'Color', 'w', 'FontSize', 13);
xlim([-3 3]); ylim([-2 2]);
hold off;


%% ============================================================
%%  Figure 7 — Summary: সব ৬টি একসাথে
%% ============================================================

figure(7);
set(gcf, 'Color', bg, ...
         'Name',     'Summary — All 6 Diagrams', ...
         'Position', [30 30 1400 780]);

ax_s = {'Color', ax_bg, 'XColor', 'w', 'YColor', 'w', ...
        'GridColor', [0.2 0.2 0.2], 'GridAlpha', 0.4};

subplot(2,3,1);
set(gca, ax_s{:}); hold on; grid on;
plot(t, y_cpos,  '-',  'Color', c_stable,   'LineWidth', 2);
plot(t, y_czero, '--', 'Color', c_bif,       'LineWidth', 2);
plot(t, y_cneg,  '-',  'Color', c_unstable,  'LineWidth', 2);
plot(0, u, 'o', 'Color', c_bif, 'MarkerSize', 7, 'MarkerFaceColor', c_bif);
yline(0,':','Color',[0.3 0.3 0.3]); xline(0,':','Color',[0.3 0.3 0.3]);
xlabel('t','Color','w'); ylabel('y','Color','w');
title('Graph-1: y vs t  [EQ1]','Color','w','FontSize',10);
legend({'c=+2','c=0 BIF','c=-2'},'TextColor','w','Color',[0.1 0.1 0.15],'FontSize',8);
hold off;

subplot(2,3,2);
set(gca, ax_s{:}); hold on; grid on;
plot(c_range, y_vc, '-', 'Color', c_neutral, 'LineWidth', 2);
xline(0,'--','Color',c_bif,'LineWidth',2);
plot(0, u, 'o','Color',c_bif,'MarkerSize',7,'MarkerFaceColor',c_bif);
yline(0,':','Color',[0.3 0.3 0.3]);
text(0.2,1.0,'Bif c=0','Color',c_bif,'FontSize',9);
xlabel('c','Color','w'); ylabel('y','Color','w');
title('Graph-2: y vs c  [EQ1]','Color','w','FontSize',10);
hold off;

subplot(2,3,3);
set(gca, ax_s{:}); hold on; grid on;
fill([-3 3 3 -3],[0 0 2 2],  c_stable,  'FaceAlpha',0.2,'EdgeColor','none');
fill([-3 3 3 -3],[0 0 -2 -2],c_unstable,'FaceAlpha',0.2,'EdgeColor','none');
plot(u_range, c_bif_line,'-','Color',c_param,'LineWidth',2.5);
text(0, 1.1,'c>0: baRe','Color',c_stable,  'HorizontalAlignment','center','FontSize',9);
text(0,-1.1,'c<0: kome','Color',c_unstable,'HorizontalAlignment','center','FontSize',9);
xlabel('u','Color','w'); ylabel('c','Color','w');
title('Graph-3: Param Space  [EQ1]','Color','w','FontSize',10);
xlim([-3 3]); ylim([-2 2]);
hold off;

subplot(2,3,4);
set(gca, ax_s{:}); hold on; grid on;
plot(c_neg, tstar_neg,'-','Color',c_unstable,'LineWidth',2);
plot(c_pos, tstar_pos,'-','Color',c_stable,  'LineWidth',2);
xline(0,'--','Color',c_bif,'LineWidth',2);
yline(0,':','Color',[0.3 0.3 0.3]);
text(0.15,15,'Bif c=0','Color',c_bif,'FontSize',9);
xlabel('c','Color','w'); ylabel('t*','Color','w');
title('Graph-4: t* vs c  [EQ2] <- MUL','Color','w','FontSize',10);
ylim([-20 20]);
hold off;

subplot(2,3,5);
set(gca, ax_s{:}); hold on; grid on;
plot(u_range2, tstar_u,'-','Color',c_stable,'LineWidth',2);
plot(0,0,'o','Color',c_bif,'MarkerSize',7,'MarkerFaceColor',c_bif);
yline(0,':','Color',[0.3 0.3 0.3]); xline(0,':','Color',[0.3 0.3 0.3]);
xlabel('u','Color','w'); ylabel('t*','Color','w');
title('Graph-5: t* vs u  [EQ2]','Color','w','FontSize',10);
hold off;

subplot(2,3,6);
set(gca, ax_s{:}); hold on; grid on;
fill([-3 3 3 -3],[0 0 2 2],  c_stable,  'FaceAlpha',0.2,'EdgeColor','none');
fill([-3 3 3 -3],[0 0 -2 -2],c_unstable,'FaceAlpha',0.2,'EdgeColor','none');
plot(u_range3, c_bif_line3,'-','Color',c_param,'LineWidth',2.5);
text(0, 1.1,'STABLE',  'Color',c_stable,  'HorizontalAlignment','center','FontSize',9);
text(0,-1.1,'UNSTABLE','Color',c_unstable,'HorizontalAlignment','center','FontSize',9);
xlabel('u','Color','w'); ylabel('c','Color','w');
title('Graph-6: Param Space  [EQ2]','Color','w','FontSize',10);
xlim([-3 3]); ylim([-2 2]);
hold off;

sgtitle('BIFURCATION ANALYSIS  |  EQ1: y=u+ct   EQ2: y=ut+ct^2/2', ...
        'Color','w','FontSize',13,'FontWeight','bold');

%% Done
disp('==============================================');
disp('  sob 7ti Figure sofol vabe plot hoyeche!   ');
disp('  Figure 1-3 -> EQ1: y = u + ct             ');
disp('  Figure 4-6 -> EQ2: y = ut + 1/2*c*t^2    ');
disp('  Figure 7   -> Summary (sob ekosathe)       ');
disp('==============================================');