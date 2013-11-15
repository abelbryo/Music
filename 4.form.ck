SndBuf click => dac; 
SndBuf kick => dac; 

me.dir() + "/audio/kick_01.wav" => kick.read; 
me.dir() + "/audio/snare_03.wav" => click.read; 

kick.samples() => kick.pos; 
click.samples() => click.pos; 

[1,0,0,0,1,0,0,0] @=> int kick_ptrn_1[]; 
[0,0,1,0,0,0,1,0] @=> int kick_ptrn_2[];
[1,0,1,0,1,0,1,0] @=> int click_ptrn_1[]; 
[1,1,1,1,1,1,1,1] @=> int click_ptrn_2[];

fun void section(int kArr[], int cArr[], float beattime) {
    for(0=> int i; i < kArr.cap(); i++){

        if( kArr[i] == 1 ){
            0=> kick.pos;
        }

        if( cArr[i] == 1) {
            0 => click.pos;
        }

        beattime::second => now; 
    }
}

while( true ) {
    // Procedural :: ABA form
    section( kick_ptrn_1, click_ptrn_1, 0.2 );
    section( kick_ptrn_2, click_ptrn_2, 0.2 );
    section( kick_ptrn_1, click_ptrn_2, 0.2 );
}

