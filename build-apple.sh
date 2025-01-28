set -e

./opus-apple.sh arm64 iphoneos ios aarch64-apple-darwin
./opus-apple.sh arm64 iphonesimulator ios-simulator aarch64-apple-darwin
./opus-apple.sh x86_64 iphonesimulator ios-simulator x86_64-apple-darwin
./opus-apple.sh arm64 appletvos tvos aarch64-apple-darwin
./opus-apple.sh arm64 appletvsimulator tvos-simulator aarch64-apple-darwin
./opus-apple.sh x86_64 appletvsimulator tvos-simulator x86_64-apple-darwin
./opus-apple.sh arm64 macosx macos aarch64-apple-darwin
./opus-apple.sh x86_64 macosx macos x86_64-apple-darwin
./FFmpeg.sh arm64 iphoneos ios
./FFmpeg.sh arm64 iphonesimulator ios-simulator
./FFmpeg.sh x86_64 iphonesimulator ios-simulator
./FFmpeg.sh arm64 appletvos tvos
./FFmpeg.sh arm64 appletvsimulator tvos-simulator
./FFmpeg.sh x86_64 appletvsimulator tvos-simulator
./FFmpeg.sh arm64 macosx macos
./FFmpeg.sh x86_64 macosx macos
./SDL-ios.sh
./SDL-tvos.sh