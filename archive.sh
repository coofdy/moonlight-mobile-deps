set -e

mkdir output

mkdir output/SDL2
mkdir output/SDL2/include
mkdir output/SDL2/lib
mkdir output/SDL2/lib/iOS
mkdir output/SDL2/lib/iOS-Sim
mkdir output/SDL2/lib/tvOS
mkdir output/SDL2/lib/tvOS-Sim

cp SDL/include/*.h output/SDL2/include

cp SDL/Xcode/SDL/build/Release-iphoneos/libSDL2.a output/SDL2/lib/iOS/
cp SDL/Xcode/SDL/build/Release-iphonesimulator/libSDL2.a output/SDL2/lib/iOS-Sim/

cp SDL/Xcode/SDL/build/Release-appletvos/libSDL2.a output/SDL2/lib/tvOS/
cp SDL/Xcode/SDL/build/Release-appletvsimulator/libSDL2.a output/SDL2/lib/tvOS-Sim/

mkdir output/FFmpeg
mkdir output/FFmpeg/lib
mkdir output/FFmpeg/lib/iOS
mkdir output/FFmpeg/lib/iOS-Sim
mkdir output/FFmpeg/lib/tvOS
mkdir output/FFmpeg/lib/tvOS-Sim

cp -R build/FFmpeg_ios_arm64/include output/FFmpeg/include

lipo build/FFmpeg_ios_*/lib/libavcodec.a -create -o output/FFmpeg/lib/iOS/libavcodec.a
lipo build/FFmpeg_ios_*/lib/libavformat.a -create -o output/FFmpeg/lib/iOS/libavformat.a
lipo build/FFmpeg_ios_*/lib/libavutil.a -create -o output/FFmpeg/lib/iOS/libavutil.a

lipo build/FFmpeg_ios-simulator_*/lib/libavcodec.a -create -o output/FFmpeg/lib/iOS-Sim/libavcodec.a
lipo build/FFmpeg_ios-simulator_*/lib/libavformat.a -create -o output/FFmpeg/lib/iOS-Sim/libavformat.a
lipo build/FFmpeg_ios-simulator_*/lib/libavutil.a -create -o output/FFmpeg/lib/iOS-Sim/libavutil.a

lipo build/FFmpeg_tvos_*/lib/libavcodec.a -create -o output/FFmpeg/lib/tvOS/libavcodec.a
lipo build/FFmpeg_tvos_*/lib/libavformat.a -create -o output/FFmpeg/lib/tvOS/libavformat.a
lipo build/FFmpeg_tvos_*/lib/libavutil.a -create -o output/FFmpeg/lib/tvOS/libavutil.a

lipo build/FFmpeg_tvos-simulator_*/lib/libavcodec.a -create -o output/FFmpeg/lib/tvOS-Sim/libavcodec.a
lipo build/FFmpeg_tvos-simulator_*/lib/libavformat.a -create -o output/FFmpeg/lib/tvOS-Sim/libavformat.a
lipo build/FFmpeg_tvos-simulator_*/lib/libavutil.a -create -o output/FFmpeg/lib/tvOS-Sim/libavutil.a

lipo -info output/FFmpeg/lib/iOS/*.a
lipo -info output/FFmpeg/lib/iOS-Sim/*.a
lipo -info output/FFmpeg/lib/tvOS/*.a
lipo -info output/FFmpeg/lib/tvOS-Sim/*.a

mkdir output/opus
mkdir output/opus/lib
mkdir output/opus/lib/iOS
mkdir output/opus/lib/iOS-Sim
mkdir output/opus/lib/tvOS
mkdir output/opus/lib/tvOS-Sim

cp -R build/opus_ios_arm64/include output/opus/include

lipo build/opus_ios_*/lib/libopus.a -create -o output/opus/lib/iOS/libopus.a
lipo build/opus_ios-simulator_*/lib/libopus.a -create -o output/opus/lib/iOS-Sim/libopus.a

lipo build/opus_tvos_*/lib/libopus.a -create -o output/opus/lib/tvOS/libopus.a
lipo build/opus_tvos-simulator_*/lib/libopus.a -create -o output/opus/lib/tvOS-Sim/libopus.a

lipo -info output/opus/lib/iOS/*.a
lipo -info output/opus/lib/iOS-Sim/*.a
lipo -info output/opus/lib/tvOS/*.a
lipo -info output/opus/lib/tvOS-Sim/*.a

7z a moonlight-ios-deps.zip ./output/*