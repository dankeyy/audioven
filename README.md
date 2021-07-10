# Musically
This is a dead simple implementation of an audio maker in haskell.
What it does is basically:
take your chords ->
create a list of corresponding frequencies -> 
pass those one by one to the wave function `g(f) = A sin(2πft)` to get a list of lists, each describing a sin wave cycling some f (frequency) times over some x seconds ->
after that it's a matter of concatenating and converting it to a bytestring (easiest approach) we could then write off to some file and later play.

## prerequisites:
Make sure you have GHC for compiling & ffmpeg (ffplay) to actually play the music.

Though eventually I just embedded the shell command into the code, so just compile, run, enter notes if you want else just press Enter and it'll play either your notes or twinkle twinkle little star as default.
