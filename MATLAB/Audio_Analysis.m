addpath('C:\Users\ashay\Documents\UMFrost\Thesis\MATLAB');

inDir = fullfile('/Users', 'ashay', 'Documents',...
    'UMFrost', 'Thesis', 'MATLAB', 'Audio');
outDir = fullfile('/Users', 'ashay', 'Documents',...
    'UMFrost', 'Thesis', 'MATLAB', 'Spectrograms');

% Parameters for spectrogram computation
window = hann(512);
overlap = 256;
nfft = 2048;

% Get a list of all WAV files in the directory
wavFiles = dir(fullfile(inDir, '*.wav'));

for i = 1:length(wavFiles)
    % Construct the full file path
    filePath = fullfile(inDir, wavFiles(i).name);

    % Load the audio file
    [y, Fs] = audioread(filePath);

    % Compute the spectrogram

    [~, F, T, P] = spectrogram(y(:,1), window, overlap, nfft, Fs, 'yaxis');

    % Plot the spectrogram
    figure;
    surf(T, F, 10*log10(P), 'edgecolor', 'none');
    axis xy; axis tight;
    view(0, 90);
    colormap("default");
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['Spectrogram of ', wavFiles(i).name]);

    % Save spectrograms
    spectrogramFileName = fullfile(outDir, sprintf('spectrogram_%s.png', strrep(wavFiles(i).name, '.', '_')));
    saveas(gcf, spectrogramFileName);

    % Compute the absolute FFT
    Y = abs(fft(y(:,1), nfft));
    f = Fs*(0:(nfft/2))/nfft;

    % Plot and save the absolute FFT
    figure;
    plot(f, 20*log10(Y(1:nfft/2+1)));
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    title(['Absolute FFT of ', wavFiles(i).name]);

    % Save plots
    fftFileName = fullfile(outDir, sprintf('fft_%s.png', strrep(wavFiles(i).name, '.', '_')));
    saveas(gcf, fftFileName);
end



