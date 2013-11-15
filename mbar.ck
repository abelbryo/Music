SinOsc s => JCRev r => dac; 

0.5 => s.gain => n.gain; 

while( true ){
    Math.random2f(30, 600) => s.freq;
    0.2::second => now;
}
