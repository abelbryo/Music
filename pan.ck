SinOsc s => Pan2 p => dac;

1.0 => float left;

0 => int flag;

36 => int midi_val;

while( true ){
// if (midi_val == 96){
//     36 => midi_val; 
// }

// midi_val++;


//  while ( left > -1.0 ){
// Std.mtof(midi_val) => s.freq;
//      left - 0.05 => left; 
//      left => p.pan;
//      10::ms => now;
//  }

//  while ( left < 1.0 ){
// Std.mtof(midi_val) => s.freq;
//      left + 0.05 => left; 
//      left => p.pan;
//      10::ms => now;

//  }

    Math.sin(now / 1::second * 2 * pi) => p.pan;
    10::ms => now;


}












