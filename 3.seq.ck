// Sequncer 

SndBuf kick => dac; 
SndBuf hihat => dac; 
SndBuf snare => dac; 


me.dir() + "/audio/kick_01.wav" => kick.read; 
me.dir() + "/audio/hihat_01.wav" => hihat.read; 
me.dir() + "/audio/snare_01.wav" => snare.read; 


kick.samples() => kick.pos; 
hihat.samples() => hihat.pos; 
snare.samples() => snare.pos; 


0 => int counter; 

// infinite loop

while ( true ){
    counter % 4 => int beat; 

    if (beat == 0 || beat == 2) {
        0 => kick.pos; 
    }

    if (beat == 1 || beat == 3) {
        0 => snare.pos; 
    }

    0 => hihat.pos;

    Math.random2f(0.6, 1.8) => hihat.rate;
    0.5 => hihat.gain;

    counter ++; 

    400::ms => now;
}


 
