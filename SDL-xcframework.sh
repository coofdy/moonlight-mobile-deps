set -e

# Build iOS and iOS simulator builds
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Framework' -configuration Release -sdk macosx
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Framework-iOS' -configuration Release -sdk iphoneos build
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Framework-iOS' -configuration Release -sdk iphonesimulator build
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Framework-tvOS' -configuration Release -sdk appletvos build
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Framework-tvOS' -configuration Release -sdk appletvsimulator build

rm -rf xcframeworks/SDL2.xcframework
xcodebuild -create-xcframework \
    -framework SDL/Xcode/SDL/build/Release-iphoneos/SDL2.framework \
    -framework SDL/Xcode/SDL/build/Release-iphonesimulator/SDL2.framework \
    -framework SDL/Xcode/SDL/build/Release-appletvos/SDL2.framework \
    -framework SDL/Xcode/SDL/build/Release-appletvsimulator/SDL2.framework \
    -framework SDL/Xcode/SDL/build/Release/SDL2.framework \
    -output xcframeworks/SDL2.xcframework

