SndBuf click => dac; 

me.dir() + "/audio/stereo_fx_01.wav" => click.read;

click.samples() => click.pos;

fun void granularize( int steps ){
    click.samples() / steps => int grain; 

    Math.random2(0, click.samples()-grain) => click.pos; 

    grain::samp => now; 

}


while( true ){
    granularize(70); 
}
