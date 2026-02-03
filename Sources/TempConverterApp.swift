import SwiftUI

@main
struct TempConverterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
    }
}

struct ContentView: View {
    @State private var celsius: String = ""
    @State private var fahrenheit: String = ""
    @FocusState private var focusedField: TempField?

    enum TempField: Hashable {
        case celsius, fahrenheit
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Celsius")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    TextField("0", text: $celsius)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 100)
                        .focused($focusedField, equals: .celsius)
                        .onChange(of: celsius) { _, newValue in
                            guard focusedField == .celsius else { return }
                            updateFahrenheit(from: newValue)
                        }
                }

                Text("=")
                    .font(.title2)
                    .foregroundColor(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Fahrenheit")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    TextField("32", text: $fahrenheit)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 100)
                        .focused($focusedField, equals: .fahrenheit)
                        .onChange(of: fahrenheit) { _, newValue in
                            guard focusedField == .fahrenheit else { return }
                            updateCelsius(from: newValue)
                        }
                }
            }

            // Quick reference
            HStack(spacing: 20) {
                quickRef("0°C", "32°F")
                quickRef("20°C", "68°F")
                quickRef("37°C", "98.6°F")
                quickRef("100°C", "212°F")
            }
            .font(.caption2)
            .foregroundColor(.secondary.opacity(0.7))
        }
        .padding(20)
        .frame(minWidth: 300)
    }

    func quickRef(_ c: String, _ f: String) -> some View {
        Text("\(c) = \(f)")
    }

    func updateFahrenheit(from celsiusStr: String) {
        if let c = Double(celsiusStr) {
            let f = (c * 9/5) + 32
            fahrenheit = formatTemp(f)
        } else if celsiusStr.isEmpty {
            fahrenheit = ""
        }
    }

    func updateCelsius(from fahrenheitStr: String) {
        if let f = Double(fahrenheitStr) {
            let c = (f - 32) * 5/9
            celsius = formatTemp(c)
        } else if fahrenheitStr.isEmpty {
            celsius = ""
        }
    }

    func formatTemp(_ value: Double) -> String {
        if value == value.rounded() {
            return String(format: "%.0f", value)
        } else {
            return String(format: "%.1f", value)
        }
    }
}
