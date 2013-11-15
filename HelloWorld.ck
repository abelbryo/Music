<<<" Abel Beriyo - Assignment 1 ">>>;

SinOsc foo => dac; // digital to analog converter
0.5 => foo.gain;  // volume

261.63 => foo.freq; // c middle
1::second => now;
