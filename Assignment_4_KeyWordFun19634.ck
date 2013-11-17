// Assignment 4 Functions
// -------------------------------------------------------------

/**
 * A function that converts midi number to piano key.
 * Doesn't show the octave. Simply prints out the key.
 * @param midiNumber: int, ranges from 0 to 127 inclusive
 * @return key: string 
 */
fun string getNoteFromMIDI(int midiNumber) {
    if (midiNumber < 0 || midiNumber > 127)
        return "ERROR! Paramerter is outside legal limit.";
    ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"] @=> string note[];
    return note[midiNumber % 12];
}

/**
 * Converts a key value at a given octave to some midi number.
 * @param key: string, a paino key value such as 'C' or 'D#'
 * @param oct: int, the octave number from 0 to 10 
 * @return midiNumber: int, the corresponding midiNumber
 */
fun int getMIDIFromNote(string key, int oct){
    if (oct < 0 || oct > 10) 
        return -1;

    int note[12];
    0 => note["C"];
    1 => note["C#"];
    2 => note["D"];
    3 => note["D#"];
    4 => note["E"];
    5 => note["F"];
    6 => note["F#"];
    7 => note["G"];
    8 => note["G#"];
    9 => note["A"];
    10=> note["A#"];
    11=> note["B"];

    return note[key] + ( oct * 12) ;
}

/**
 * Converts paino key at a given octave to frequency
 * @param key: string, a paino key value such as 'C' or 'D#'
 * @param oct: int, the octave number from 0 to 10 
 * @return frequency: float, the frequency of the given key
 */
fun float keyToFrequency(string key, int oct) {
   return Std.mtof(getMIDIFromNote(key, oct)); 
}


// 5-th Octave midi values
fun int getMIDIFromFifthOctave(string key) {
    return getMIDIFromNote(key, 5);
}

//// ===========================
//// Assignment implementation
//// ===========================

Gain master => dac; 
0.9 => master.gain;

SinOsc s => master; 
SndBuf hihat => master; 


me.dir() + "/audio/hihat_01.wav" => hihat.read; 
hihat.samples() => hihat.pos; 

[51, 53, 55, 56, 58, 60, 61, 63] @=> int eb_scale[];

[ 1, 0, 1, 0, 1, 0, 1, 0 ] @=> int hihat_pat[];


// Beat pattern player
fun void section( int hPat[], int sPat[], float beattime ){
    for( 0 => int i; i < hPat.cap(); i++) {
        if (hPat[i] == 1) {
            0 => hihat.pos; 
        }
        Std.mtof(sPat[i]) * 2 => s.freq;
        <<< getNoteFromMIDI(sPat[i] + 12)  >>>;
        beattime::second => now;
    }
}

// MAIN 
fun void main( int hPat[], int sPat[], float beattime, time stop_time ){

    while (now < stop_time){
        section(hPat, sPat, beattime);
    }
}

// Calling the main
main(hihat_pat, eb_scale, 0.6, now + 30::second);





