Gain master => dac;

SndBuf hihat => master;
SndBuf snare => master; 
SndBuf kick => master;

0.1 => hihat.gain;

me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/kick_02.wav" => kick.read;

hihat.samples() => hihat.pos;
snare.samples() => snare.pos; 
kick.samples() => kick.pos;

0 => int counter;

while ( true ) {
    counter % 8 => int measure;

    <<< measure >>>;

    if ( measure == 0 || measure == 2){
        0 => snare.pos;
    }

    if ( measure == 1 || measure == 3 ){
        0 => kick.pos;
    }

    1.0 => hihat.rate;
    0 => hihat.pos;

    250::ms => now;

    counter++;
}




