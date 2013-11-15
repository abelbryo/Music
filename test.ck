Event e; 

fun int hi( Event e ){
    e => now; 
    <<< "Success" >>>;
}

spork ~ hi(e);
spork ~ hi(e);
spork ~ hi(e);
spork ~ hi(e);
 
me.yield();
e.broadcast();

1::samp => now;
