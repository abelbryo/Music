// 
// Stereo playback with sound buffer
// Example

SndBuf2 mySound => dac; 

me.dir() + "/audio/stereo_fx_01.wav" => string filename; 

filename => mySound.read; 


while (true) {
    Math.random2f(.6, 1.0) => mySound.gain; 
    Math.random2f(.5, 1.8) => mySound.rate; 

    0 => mySound.pos; 
    5::second => now;
}
