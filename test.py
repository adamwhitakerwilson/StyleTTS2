import os
import soundfile as sf

data_path = "Data/LJSpeech-1.1/wavs"

for root, _, files in os.walk(data_path):
    for file in files:
        if file.endswith(".wav"):
            file_path = os.path.join(root, file)
            try:
                data, samplerate = sf.read(file_path)
                print(f"File {file_path} is valid with samplerate {samplerate}")
            except Exception as e:
                print(f"Error with file {file_path}: {e}")
