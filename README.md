# TempConverter

A simple, native macOS app for quick temperature conversions between Celsius and Fahrenheit.

![macOS](https://img.shields.io/badge/macOS-14.0+-blue)
![Swift](https://img.shields.io/badge/Swift-5.9-orange)

## Features

- **Bidirectional conversion** - Type in either field, the other updates instantly
- **Lightweight** - Native SwiftUI, minimal footprint
- **Quick reference** - Common temperatures shown at bottom (0°C, 20°C, 37°C body temp, 100°C)

## Installation

### Build from source

```bash
git clone https://github.com/bhengen/TempConverter.git
cd TempConverter
swift build -c release
```

Then create the app bundle:

```bash
mkdir -p TempConverter.app/Contents/MacOS
cp .build/release/TempConverter TempConverter.app/Contents/MacOS/
cp -r Resources/AppIcon.iconset TempConverter.app/Contents/Resources/
iconutil -c icns TempConverter.app/Contents/Resources/AppIcon.iconset -o TempConverter.app/Contents/Resources/AppIcon.icns
```

Or simply run:
```bash
swift run
```

## Usage

1. Click in either the Celsius or Fahrenheit field
2. Type a number
3. The other field updates automatically

## Requirements

- macOS 14.0 (Sonoma) or later

## License

MIT
