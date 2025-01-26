#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg is not installed. Please install it and try again."
    exit 1
fi

# Set the directory containing the WAV files
TARGET_DIR="."

# Find and process all .wav files in the directory
for file in "$TARGET_DIR"/*.wav; do
    # Check if the file exists
    if [[ -f "$file" ]]; then
        echo "Upsampling $file from 22 kHz to 24 kHz..."

        # Temporary file to hold the converted audio
        temp_file="${file%.wav}_temp.wav"

        # Convert the audio file to 24 kHz
        # ffmpeg -i "$file" -ar 24000 -y "$temp_file"
        # ffmpeg -i input.wav -ar 24000 -ac 1 -c:a pcm_s16le output.wav
        ffmpeg -i "$file" -ar 24000 -ac 1 -c:a pcm_s16le "$temp_file"


        # Replace the original file with the converted file
        mv "$temp_file" "$file"

        echo "Processed $file successfully."
    else
        echo "No .wav files found in the directory."
    fi
done

echo "Upsampling completed for all files."
