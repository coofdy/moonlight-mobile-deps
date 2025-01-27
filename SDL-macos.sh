set -e

# Build iOS and iOS simulator builds
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Static Library' -configuration Release -sdk macosx build

# Print initial fat binary data
lipo -info SDL/Xcode/SDL/build/Release/libSDL2.a
