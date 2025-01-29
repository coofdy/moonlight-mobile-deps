set -e

mkdir -p xcframeworks

./SDL-xcframework.sh
./FFmpeg-xcframework.sh
./opus-xcframework.sh

7z a moonlight-apple-xcframeworks.zip ./xcframeworks/*
