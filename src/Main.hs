import Data.List.Split
import Data.Maybe
import Data.Foldable
import Text.Printf
import System.Process
import qualified Data.Map as M
import qualified Data.ByteString.Builder as BS
import qualified Data.ByteString.Lazy as BS

sampleRate :: Float
sampleRate = 44100.0 

amplitude :: Float
amplitude = 4096.0

duration :: Float
duration = 0.5

outputPath :: FilePath
outputPath = "audio.bin"

sampleNotes :: String
sampleNotes = "C-C-G-G-A-A-G--F-F-E-E-D-D-C--G-G-F-F-E-E-D--G-G-F-F-E-E-D--C-C-G-G-A-A-G--F-F-E-E-D-D-C"

-- According to the wave function-
--  g(f) = A sin(2πft)
-- where A = Amplitude, f = frequency, t = time

-- so this is the the wave w respect to time
wave :: Float -> Float -> [Float]
wave freq duration = (* amplitude) . sin . (*(2.0 * pi * freq)) <$> time
  where time = [0.0, recip sampleRate .. duration]


-- noteFreq = baseFreq * 2^(n/12)
notesToFrequencies :: M.Map String Float
notesToFrequencies = M.fromList $ ("", 0.0) : zip octaves noteFreqs
  where
    octaves = ["C", "c", "D", "d", "E", "F", "f", "G", "g", "A", "a", "B"]
    baseFreq = 261.63
    noteFreqs = [ baseFreq * (2 ** (n / 12)) | n <- [0 .. fromIntegral (length octaves)] ]


dataFrom :: String -> [Float]
dataFrom musicNotes = concatMap (`wave` duration) frequencies
  where frequencies = mapMaybe (`M.lookup` notesToFrequencies) (splitOn "-" musicNotes)


save :: String -> FilePath -> IO ()
save musicNotes pathToFile = BS.writeFile pathToFile $ BS.toLazyByteString $ foldMap BS.floatLE $ dataFrom musicNotes


main :: IO ()
main = do
  inputNotes <- getLine
  let chosenNotes = if inputNotes == "" then sampleNotes else inputNotes
  save chosenNotes outputPath
  _ <- runCommand $ printf "ffplay -autoexit -f f32le %s" outputPath
  return ()