set -e

# Run FFmpeg.sh for each combination of target and architecture before this script

mkdir -p build/FFmpeg_macos/lib
mkdir -p build/FFmpeg_ios-simulator/lib
mkdir -p build/FFmpeg_tvos-simulator/lib
mkdir -p build/FFmpeg_ios/lib
mkdir -p build/FFmpeg_tvos/lib

libtool -static -o build/FFmpeg_macos/lib/libffmpeg.a build/FFmpeg_macos_*/lib/lib*.a
libtool -static -o build/FFmpeg_ios-simulator/lib/libffmpeg.a build/FFmpeg_ios-simulator_*/lib/lib*.a
libtool -static -o build/FFmpeg_tvos-simulator/lib/libffmpeg.a build/FFmpeg_tvos-simulator_*/lib/lib*.a
libtool -static -o build/FFmpeg_ios/lib/libffmpeg.a build/FFmpeg_ios_arm64/lib/lib*.a
libtool -static -o build/FFmpeg_tvos/lib/libffmpeg.a build/FFmpeg_tvos_arm64/lib/lib*.a

rm -rf build/xcframeworks/FFmpeg.xcframework
xcodebuild -create-xcframework \
    -library build/FFmpeg_macos/lib/libffmpeg.a -headers build/FFmpeg_macos_arm64/include \
    -library build/FFmpeg_ios-simulator/lib/libffmpeg.a -headers build/FFmpeg_ios-simulator_arm64/include \
    -library build/FFmpeg_tvos-simulator/lib/libffmpeg.a -headers build/FFmpeg_tvos-simulator_arm64/include \
    -library build/FFmpeg_ios/lib/libffmpeg.a -headers build/FFmpeg_ios_arm64/include \
    -library build/FFmpeg_tvos/lib/libffmpeg.a -headers build/FFmpeg_tvos_arm64/include \
    -output build/xcframeworks/FFmpeg.xcframework

