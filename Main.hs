
-- Wave function     
-- g(f) = A sin(2πft)
-- where:
-- A = Amplitude 
-- f = frequency
-- t = time


sampleRate :: Float
sampleRate = 44100.0 -- Hz


amplitude :: Float
amplitude = 4096.0


wave :: Float -> Float -> [Float]
wave freq duration = map ((*amplitude) . sin . (*(2.0 * pi * freq))) time
  where time = [0.0, recip sampleRate .. duration]

