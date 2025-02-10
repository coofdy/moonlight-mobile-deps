set -e

mkdir -p xcframeworks

./SDL-xcframework.sh
./FFmpeg-xcframework.sh
./opus-xcframework.sh

codesign --timestamp -s "Apple Development" xcframeworks/SDL2.xcframework
codesign --timestamp -s "Apple Development" xcframeworks/FFmpeg.xcframework
codesign --timestamp -s "Apple Development" xcframeworks/opus.xcframework

7z a moonlight-apple-xcframeworks.zip ./xcframeworks/*
