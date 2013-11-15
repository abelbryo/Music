Hid hi; 
HidMsg msg; 

0 => int device;

if (me.args()){
    Std.atoi(me.arg(0)) => device;
}

if (!hi.openKeyboard( device )){
    <<<" Keyboard cannot be used. " >>>;
    me.exit();
}

while( true ){
    hi => now;
    while ( hi.recv( msg ) ){
        if (msg.isButtonDown()){
            <<< msg.ascii >>>;
        }
    }

}


