// Utility functions for converting keys to midi and vice versa
// @author Abel Terefe 2013 Nov 2
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

// =============================================
// =============== Testing =====================
// =============================================

// 5-th Octave midi values
fun int getMIDIFromFifth(string key) {
    return getMIDIFromNote(key, 5);
}


["C","D","E","G","A","C","A","G","E","D","C"] @=> string notes[];

SinOsc s => dac; 

0.5 => s.gain; 

for (0 => int i; i < notes.cap(); i++){
    Std.mtof(getMIDIFromFifth(notes[i])) => s.freq;
    100::ms => now;
}

