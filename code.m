% Read the WiFi Explorer CSV data
filename = 'wifiexplorer.csv';
data = readtable(filename);

% Extract encryption, signal strength, channel usage, band, mode, max rate, and generation columns
encryption = data.Security;
signal_strength = data.Signal___;
channel_usage = data.Channel;
band = data.Band;
mode = data.Mode;
max_rate = data.MaxRate_Mbps_;
generation = data.Generation;

% Count the number of networks using each channel
unique_channels = unique(channel_usage);
channel_counts = arrayfun(@(x) sum(channel_usage == unique_channels(x)), 1:length(unique_channels));

% Plot the number of networks using each channel
figure;
bar(unique_channels, channel_counts);
xlabel('Channel');
ylabel('Number of Networks');
title('Channel Usage Distribution');

% Plot signal strength distribution for each encryption type
unique_encryption = unique(encryption);
figure;
hold on;
for i = 1:length(unique_encryption)
    type = unique_encryption{i};
    signals = signal_strength(strcmp(encryption, type));
    histogram(signals, 'DisplayName', type);
end
xlabel('Signal Strength (dBm)');
ylabel('Number of Networks');
title('Signal Strength Distribution for Each Encryption Type');
legend('Location', 'best');
hold off;

% Calculate the percentage of networks using each encryption type
encryption_counts = arrayfun(@(x) sum(strcmp(encryption, unique_encryption{x})), 1:length(unique_encryption));
encryption_percentages = (encryption_counts / sum(encryption_counts)) * 100;

% Calculate the average signal strength per encryption type
avg_signal_strength = arrayfun(@(x) mean(signal_strength(strcmp(encryption, unique_encryption{x}))), 1:length(unique_encryption));

% Display the results in a table
T = table(unique_encryption, encryption_counts', encryption_percentages', avg_signal_strength');
T.Properties.VariableNames = {'Encryption_Type', 'Count', 'Percentage', 'Avg_Signal_Strength'};
disp(T);

% Plot a pie chart for the percentage of networks using each encryption type
figure;
pie(encryption_percentages, unique_encryption);
title('Proportion of Networks with Different Encryption Types');

% Calculate the distribution of bands
unique_bands = unique(band);
band_counts = arrayfun(@(x) sum(strcmp(band, unique_bands{x})), 1:length(unique_bands));
band_percentages = (band_counts / sum(band_counts)) * 100;

% Plot a pie chart for the percentage of networks using each band
figure;
pie(band_percentages, unique_bands);
title('Proportion of Networks with Different Bands');

% Calculate the distribution of modes
unique_modes = unique(mode);
mode_counts = arrayfun(@(x) sum(strcmp(mode, unique_modes{x})), 1:length(unique_modes));
mode_percentages = (mode_counts / sum(mode_counts)) * 100;

% Plot a pie chart for the percentage of networks using each mode
figure;
pie(mode_percentages, unique_modes);
title('Proportion of Networks with Different Modes');

% Calculate the distribution of generations
unique_generations = unique(generation);
generation_counts = arrayfun(@(x) sum(strcmp(generation, unique_generations(x))), 1:length(unique_generations));
generation_percentages = (generation_counts / sum(generation_counts)) * 100;

% Plot a bar chart for the percentage of networks in each generation
figure;
bar(categorical(unique_generations), generation_percentages);
xlabel('Generation');
ylabel('Percentage of Networks');
title('Proportion of Networks by Generation');

% Plot the distribution of Max Rates
figure;
histogram(max_rate, 'BinMethod', 'fd');
xlabel('Max Rate (Mbps)');
ylabel('Number of Networks');
title('Distribution of Max Rates');

% Display the results in a table for Bands, Modes, and Generations
T_band = table(unique_bands, band_counts', band_percentages');
T_band.Properties.VariableNames = {'Band', 'Count', 'Percentage'};
disp(T_band);

T_mode = table(unique_modes, mode_counts', mode_percentages');
T_mode.Properties.VariableNames = {'Mode', 'Count', 'Percentage'};
disp(T_mode);

T_generation = table(unique_generations, generation_counts', generation_percentages');
T_generation.Properties.VariableNames = {'Generation', 'Count', 'Percentage'};
disp(T_generation);
