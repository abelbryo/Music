SinOsc s => dac; 


[60, 61, 63, 65, 67, 68, 69, 50] @=> int A[];


fun void swell(float a, float b, float g) {
    for (a => float j; j < b; g +=> j) {
        j => s.gain; 
         .01::second => now;
    }
}

fun void dieDown ( float a, float b, float g) {
    for (a => float j; j > b; g -=> j) {
        j => s.gain; 
        0.01::second => now;
    }
}


for( 0=> int i; i < A.cap(); i++ ){
    Std.mtof(A[i]) => s.freq;
    swell(0.2, 1.0, 0.01); 
    dieDown(1.0, 0.2, 0.01); // gives it a feeling of being plucked
    100::ms => now;
}

