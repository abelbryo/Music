// Sound chain

TriOsc chord[3];

Gain master => dac; 

for ( 0=> int i; i < chord.cap(); i++ ){
    // Use array to chuck ugen to master
    chord[i] => master; 
}


// function will make major or minor chords
fun void playChord( int root, string quality, float length ) {

    // start with a root position
    Std.mtof(root) => chord[0].freq; 

    // third determines if the chord is major or minor
    if( quality == "major" ) {
        Std.mtof( root + 4 ) => chord[1].freq; 
    }else if(quality == "minor"){
        Std.mtof(root + 3) => chord[1].freq;
    }
    // fifth
    Std.mtof( root + 7 ) => chord[2].freq;

    length::ms => now; 
}

while ( true ) {
    playChord( Math.random2(60, 72), "minor", 250 );
    playChord( Math.random2(60, 72), "major", 500 );
    playChord( Math.random2(60, 72), "minor", 250 );
}
