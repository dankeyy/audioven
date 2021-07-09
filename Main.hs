
import qualified Data.Map as M
import Data.List.Split

sampleRate :: Float
sampleRate = 44100.0 -- Hz


amplitude :: Float
amplitude = 4096.0


-- According to the wave function-
--  g(f) = A sin(2πft)
-- where A = Amplitude, f = frequency, t = time

-- so this is the the wave as a function of time
wave :: Float -> Float -> [Float]
wave freq duration = (*amplitude) . sin . (*(2.0 * pi * freq)) <$> time
  where time = [0.0, recip sampleRate .. duration]


-- noteFreq = baseFreq * 2^(n/12)
notes :: M.Map String Float
notes = M.fromList $ ("", 0.0) : zip octaves noteFreqs
  where
    octaves = ["C", "c", "D", "d", "E", "F", "f", "G", "g", "A", "a", "B"]
    baseFreq = 261.63
    noteFreqs = [ baseFreq * (2 ** (n / 12)) | n <- [0 .. fromIntegral (length octaves)] ]






play :: IO ()
play = print $ take 2 $ wave 440 1