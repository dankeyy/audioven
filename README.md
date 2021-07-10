# Musically
This is a dead simple implementation of an audio maker in haskell.
What it does is basically:
take your chords ->
create a list of corresponding frequencies -> 
pass those one after another to the wave function `g(f) = A sin(2πft)` and get a list of lists, each describing a sin wave cycling some f (frequency) times over some x seconds ->
after that it's a matter of concatinating it and converting it to a bytestring (easiest approach) we could write off to some file and later play.

## prerequisites:
GHC for compiling & ffmpeg for using ffplay to actually play the audio.

Though eventually I just embedded the shell command into the code so just compile, run and it'll begin playing.

## TODO
For now it just plays twinkle twinkle little star so make it actually take chords from the user and not just play the sample notes.
