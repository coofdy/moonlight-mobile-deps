set -e

# Run build-apple.sh and archive-apple.sh before this script

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

rm -rf xcframeworks/FFmpeg.xcframework
xcodebuild -create-xcframework \
    -library build/FFmpeg_macos/lib/libffmpeg.a -headers output/FFmpeg/include \
    -library build/FFmpeg_ios-simulator/lib/libffmpeg.a -headers output/FFmpeg/include \
    -library build/FFmpeg_tvos-simulator/lib/libffmpeg.a -headers output/FFmpeg/include \
    -library build/FFmpeg_ios/lib/libffmpeg.a -headers output/FFmpeg/include \
    -library build/FFmpeg_tvos/lib/libffmpeg.a -headers output/FFmpeg/include \
    -output xcframeworks/FFmpeg.xcframework

