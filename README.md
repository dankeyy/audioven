# Audioven
This is a dead simple implementation of an audio maker in haskell. What it does is basically this:

-> Take your chords.

-> Create a list of matching frequencies.

-> Pass those one by one to the wave function `g(f) = A sin(2πft)` to get a list of lists, each outlines a sin wave cycling some f (frequency) times over some x seconds, describing a soon to be piece of our audio. 

-> Concatenate the result into a single list and convert it to a bytestring (easiest approach) we could then write off to some file and later play.

-> Profit.


## Prerequisites:
Make sure you have GHC for compiling & ffmpeg (ffplay) to actually play the audio.

Eventually I just embedded the shell command into the code, so just compile, run, enter notes if you want else just press Enter and it'll play either your notes or twinkle twinkle little star as default.
