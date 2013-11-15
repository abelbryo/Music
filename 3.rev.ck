SndBuf mySound => dac; 

me.dir() + "/audio/snare_01.wav" => string filename;

filename => mySound.read; 

mySound.samples() => int num;

while(true) {
    -1.0 => mySound.rate; 
    mySound.samples() => mySound.pos;

    1000::ms => now;
}
