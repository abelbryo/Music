SinOsc foo => dac;

Math.srandom(83); // play the same random notes

while (true) {
    Math.random2f(30,1000)  => foo.freq;
    .2::second=> now;
}
