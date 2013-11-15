// RECURSIVE DRUM ROLL EXAMPLE 
SndBuf snare => dac; 

me.dir() + "/audio/snare_01.wav" => snare.read; 

snare.samples() => snare.pos; 


fun int drumRoll( int index ){
    <<< index >>>;
    if( index >= 50 ){
        // play sound for duration of index
        0 => snare.pos; 
        index::ms => now;
        return drumRoll(index - 1);
    }else if (index == 49) {
        return 49;
    }
}

while ( true ) {
    drumRoll(100);
}
