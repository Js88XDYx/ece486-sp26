% generated 2026-02-09 15:18 using Claude Sonnet 4.5
% Prompt: Read these values and write matlab code that 
% finds the percent error for each [accompanied by image of
% table from lab report]


% Percent Error Analysis for Theoretical and Experimental Results
% Table 1: Theoretical and Experimental Results

% Define the zeta values
zeta = [2.0; 1.5; 1.0; 0.8; 0.7; 0.5; 0.3; 0.2];

% M_p (%) values
Mp_theory = [0; 0; 0; 1.52; 4.6; 16.3; 37.2; 52.7];
Mp_experiment = [0; 0; 0; 0.488; 3.71; 15.2; 35.2; 50.8];

% t_r (s) values
tr_theory = [8.2; 5.85; 3.35; 2.5; 2.16; 1.63; 1.3; 1.21];
tr_experiment = [8.68; 6.14; 3.54; 2.52; 2.14; 1.64; 1.3; 1.2];

% t_s (s) values
ts_theory = [11.6; 8.3; 5.0; 3.68; 3.02; 6.28; 10.14; 15.08];
ts_experiment = [14.68; 10.98; 7.16; 5.5; 4.96; 7.28; 10.12; 16];

% Calculate percent errors
% Percent Error = |Theory - Experiment| / Theory * 100
% Note: For Mp where theory = 0, percent error is undefined/infinite

% M_p percent error (skip zeros to avoid division by zero)
Mp_percent_error = zeros(size(Mp_theory));
for i = 1:length(Mp_theory)
    if Mp_theory(i) ~= 0
        Mp_percent_error(i) = abs(Mp_theory(i) - Mp_experiment(i)) / Mp_theory(i) * 100;
    else
        Mp_percent_error(i) = NaN; % Not applicable when theory = 0
    end
end

% t_r percent error
tr_percent_error = abs(tr_theory - tr_experiment) ./ tr_theory * 100;

% t_s percent error
ts_percent_error = abs(ts_theory - ts_experiment) ./ ts_theory * 100;

% Display results
fprintf('Percent Error Analysis\n');
fprintf('======================\n\n');

fprintf('%-8s %-15s %-15s %-15s\n', 'zeta', 'M_p Error (%)', 't_r Error (%)', 't_s Error (%)');
fprintf('%-8s %-15s %-15s %-15s\n', '----', '-------------', '-------------', '-------------');

for i = 1:length(zeta)
    if isnan(Mp_percent_error(i))
        fprintf('%-8.1f %-15s %-15.2f %-15.2f\n', zeta(i), 'N/A', tr_percent_error(i), ts_percent_error(i));
    else
        fprintf('%-8.1f %-15.2f %-15.2f %-15.2f\n', zeta(i), Mp_percent_error(i), tr_percent_error(i), ts_percent_error(i));
    end
end

% Calculate average percent errors (excluding NaN values)
avg_Mp_error = mean(Mp_percent_error(~isnan(Mp_percent_error)));
avg_tr_error = mean(tr_percent_error);
avg_ts_error = mean(ts_percent_error);

fprintf('\n');
fprintf('Average Percent Errors:\n');
fprintf('  M_p: %.2f%%\n', avg_Mp_error);
fprintf('  t_r: %.2f%%\n', avg_tr_error);
fprintf('  t_s: %.2f%%\n', avg_ts_error);

% Create a summary table
fprintf('\n\nDetailed Results Table:\n');
fprintf('%-8s | %-12s | %-12s | %-15s | %-12s | %-12s | %-15s | %-12s | %-12s | %-15s\n', ...
    'zeta', 'M_p Theory', 'M_p Exp', 'M_p Error (%)', 't_r Theory', 't_r Exp', 't_r Error (%)', 't_s Theory', 't_s Exp', 't_s Error (%)');
fprintf('%s\n', repmat('-', 1, 160));

for i = 1:length(zeta)
    if isnan(Mp_percent_error(i))
        fprintf('%-8.1f | %-12.2f | %-12.3f | %-15s | %-12.2f | %-12.2f | %-15.2f | %-12.2f | %-12.2f | %-15.2f\n', ...
            zeta(i), Mp_theory(i), Mp_experiment(i), 'N/A', tr_theory(i), tr_experiment(i), tr_percent_error(i), ...
            ts_theory(i), ts_experiment(i), ts_percent_error(i));
    else
        fprintf('%-8.1f | %-12.2f | %-12.3f | %-15.2f | %-12.2f | %-12.2f | %-15.2f | %-12.2f | %-12.2f | %-15.2f\n', ...
            zeta(i), Mp_theory(i), Mp_experiment(i), Mp_percent_error(i), tr_theory(i), tr_experiment(i), tr_percent_error(i), ...
            ts_theory(i), ts_experiment(i), ts_percent_error(i));
    end
end