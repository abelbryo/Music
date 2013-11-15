// This program will play for 30 sec
// It tries to sound like a Techno music :) Enjoy!
// Sun Nov 10 19:49:20 EET 2013

["hihat_02", "snare_01", "kick_02", "stereo_fx_01"] @=> string kit[];

[50, 52, 53, 55, 57, 59, 60, 62] @=> int midi[];

SndBuf2 snd[kit.cap()]; // Sound Buffer array
// By Default it assumes soundbuf is stereophonic

0 => int measure; 
0 => int counter;

Gain master => dac;
SawOsc s => master;
0.0 => s.gain;


0.9 => master.gain;

for(0 => int i; i < kit.cap(); i++){
    me.dir() + "/audio/" + kit[i] + ".wav" => kit[i];

    kit[i] => snd[i].read;             // Read the files
    snd[i] => master;                  // Chuck the soundbufs to the dac via the master Gain
    snd[i].samples() => snd[i].pos;    // don't play them yet.
}


now => time cur_t; 

cur_t + 30::second => time end_time;
cur_t + 24::second => time start_fade_time;

0.9 => float g;

while ( now < end_time){

    if ( now >= start_fade_time ){
        <<<"Fading out --- gain is ", g >>>;
        g - 0.09 => g;
        g => master.gain; 
    }

    counter % 8 => measure;

    <<< counter, " - " , measure >>>; 

    if (measure == 0) {
        0 => snd[3].pos;
    }

    if ( measure == 2 || measure == 6 ){
        0 => snd[1].pos; 

        for(0 => int j; j < midi.cap(); j++){

            Std.mtof(midi[ Math.random2(0, midi.cap()-1)  ]) => s.freq;
            0.04 => s.gain;

            if ( j == 4  ) {
                0 => snd[0].pos;  
                -1.0 => snd[3].rate; // reverses the stereofx soundbuf here.
                snd[3].samples() => snd[3].pos;

            } else {
                0 => snd[1].pos;
                Math.random2f(0.2, 1.8) => snd[1].rate;
            }

            Math.random2f(0.1, 0.2) => snd[0].gain;
            100::ms => now;
        }

        0 => s.gain; // Turn off s here.
    }

    0 => snd[2].pos;  // Play the kick
    1 => snd[2].rate;

    400::ms => now;

    counter++;

}


