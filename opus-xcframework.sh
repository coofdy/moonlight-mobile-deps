set -e

# Run opus-apple.sh for each combination of target and architecture before this script

mkdir -p build/opus_macos
mkdir -p build/opus_ios-simulator
mkdir -p build/opus_tvos-simulator

lipo build/opus_macos_arm64/lib/libopus.a build/opus_macos_x86_64/lib/libopus.a -create -output build/opus_macos/libopus.a
lipo build/opus_ios-simulator_arm64/lib/libopus.a build/opus_ios-simulator_x86_64/lib/libopus.a -create -output build/opus_ios-simulator/libopus.a
lipo build/opus_tvos-simulator_arm64/lib/libopus.a build/opus_tvos-simulator_x86_64/lib/libopus.a -create -output build/opus_tvos-simulator/libopus.a

rm -rf build/xcframeworks/Opus.xcframework
xcodebuild -create-xcframework \
    -library build/opus_macos/libopus.a -headers build/opus_macos_arm64/include/opus \
    -library build/opus_ios-simulator/libopus.a -headers build/opus_ios-simulator_arm64/include/opus \
    -library build/opus_tvos-simulator/libopus.a -headers build/opus_tvos-simulator_arm64/include/opus \
    -library build/opus_ios_arm64/lib/libopus.a -headers build/opus_ios_arm64/include/opus \
    -library build/opus_tvos_arm64/lib/libopus.a -headers build/opus_tvos_arm64/include/opus \
    -output build/xcframeworks/Opus.xcframework

