SndBuf snare => dac; 

string snare_samples[3];

me.dir() + "/audio/snare_01.wav" => snare_samples[0];
me.dir() + "/audio/snare_02.wav" => snare_samples[1];
me.dir() + "/audio/snare_03.wav" => snare_samples[2];

// How many samples

<<< snare_samples.cap() >>>;


while ( true ) {
    Math.random2(0, snare_samples.cap() - 1) => int which;

    snare_samples[which] => snare.read;

    250::ms => now; 

}
