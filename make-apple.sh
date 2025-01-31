set -e

rm -rf build
rm -rf output
rm -rf xcframeworks
mkdir -p build

export OS_MIN=12.0
export OPUS_VERSION=1.5.2

git submodule update --init --recursive
curl -LO "https://downloads.xiph.org/releases/opus/opus-$OPUS_VERSION.tar.gz"

./build-apple.sh
./archive-apple.sh
./xcframeworks-apple.sh
