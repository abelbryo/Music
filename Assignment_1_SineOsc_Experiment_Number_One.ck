// Tue Oct 22 23:59:49 2013 
// This program will play random frequencies for 30seconds
// Half of the time will be played by a SinOsc 
// and the rest is played by a TriOsc

<<<"Assignment_1_Random_Frequencies_with_SinOsc_and_TriOsc">>>;

SinOsc s => dac;
TriOsc t => dac; 

0.5 => s.gain;
0 => t.gain; 

 now + 30::second => time length;
 now + 15::second => time halfLength;

 100 => float myFreq;

while (now < length) {
    Math.random2f(40,500) => myFreq; 
    myFreq => s.freq;
    100::ms => now;

    if (now > halfLength){
        0 => s.gain; 
        0.3 => t.gain;

        while( now < length ){
            Math.random2f(40,500) => myFreq; 
            myFreq => t.freq;
            100::ms => now;
        }
    }
}

