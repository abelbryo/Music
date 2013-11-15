// Assignment D Dorian Scala
// ========================

// Sound chain 
SinOsc s => Pan2 p => dac;

0.5 => s.gain; // set volume to .5 

0 => p.pan; // set pan to 0 so volume is the same for both channel

// Array holding midi note numbers ranging two octaves 
[50, 52, 53, 55, 57, 59, 60, 62, 64, 65, 67, 69, 71, 72, 74] @=> int A[]; 


now + 30::second => time later; // Music plays for 30 seconds


Math.srandom(80); // Seed a random so the playback remains the same

while( now <= later ) {

     // pick index of the note at random from the array
     Math.random2(0, A.cap()-1) => int index;

     // convert the midi number to frequency and chuck it to our oscillator
     Std.mtof(A[index]) => s.freq;

     // play each note at a fixed time of 0.25::second
     // unfortunately this gives little taste 
     0.25::second => now; 
}

