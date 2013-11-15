// Waveform
SinOsc s => dac; 

0.6 => s.gain;

100 => float startFreq;

startFreq => s.freq;

for (0  => int i; i < 5; i+1 => i) {

    <<<"Freq: ", startFreq, "Counter: ", i >>>;

    startFreq + 100 => startFreq;
    startFreq => s.freq;
    1::second => now;

}
