
2::second => dur T;
T - (now %T) => now;



// declare the object which will store the sound file, and pass it through tothe dac
SndBuf buffy => PRCRev r => dac;


   me.dir()+"estring.wav" => buffy.read; 
    buffy.freq() => float freq; 
    5 => int note; 
    

    MidiIn min;
    MidiMsg msg;
    
        [ 2, 3, 4, 5, 6, 4, 3, 2,
          1, 1, 1, 1, 1, 1, 1, 1,
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0, 0, 0, 0, 0, 0, 0,
          1, 1, 1, 1, 1, 1, 1, 1,
          2, 3, 4, 5, 6, 4, 3, 2 ] @=> int chessboard[];

    
    
    class Chessboard{
        
        fun void main_loop(){
            
            play_music("timpani.wav");
            spork ~ play_music("snare.wav");
            
            
            
        }
        
        fun void play_music(string file){
            
            0 => r.mix;
            
            me.dir()+file => buffy.read; 
            
            0.3 => buffy.gain;
            
            
            1 => buffy.rate;    
            
            .25::second => now; 
            
        }
        
    }
    
    Chessboard board;
    
    
  


while(1){
   
   print_chessboard(1);


    
    .2 => r.mix;


   1 => buffy.gain; 
   1 => buffy.rate; 
   
   me.dir()+"estring.wav" => buffy.read; 


   freq => buffy.freq;

    
   0.5::second => now;  
   
     if (note == 7 || note == 4) freq * 1.059 => freq;
   else freq * 1.122 => freq;
   
   note + 1 => note;
   if (note > 7){
       1 => note;   
   }
   
    
}


// define function call 'funk'
fun void print_chessboard( int arg )
{
    <<< "--" >>>;
    // for loop
    for( 0 => int i; i < 8 ; i++)
    {
        // debug-print value of 'foo'
        <<<chessboard[8*i], chessboard[8*i+1], chessboard[8*i+2], chessboard[8*i+3], chessboard[8*i+4], chessboard[8*i+5], chessboard[8*i+6], chessboard[8*i+7] >>>;
    }
    // insert code here
}

fun void print_chessboard(int type, int from, int to)
{
    
    
    // insert code here
}

fun void to_grid(int index)
{
    
    
}
