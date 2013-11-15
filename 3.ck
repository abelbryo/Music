// Sound File Setup
SndBuf mySound => Pan2 p => dac; 

// get the current directory of this source code 
me.dir() => string path;

<<< path >>>;

// Define the filename
// The sound file relative to this source file
"/audio/snare_01.wav" => string filename; 

path + filename => filename;

<<< filename >>>; 

// Open up a soundfile
filename => mySound.read;


while ( true) {

    Math.random2f(0.5, 1.8) => mySound.rate; 
    Math.random2f(0.1,1) => mySound.gain;
    Math.random2f(-1.0, 1.0) => p.pan;


    // simple control
    0  => mySound.pos; // sets playhead position
    0.1::second => now;
}


