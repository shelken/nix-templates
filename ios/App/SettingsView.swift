import SwiftUI

struct SettingsView: View {
  var body: some View {
    Form {
      Text("Settings")
        .accessibilityIdentifier("settings.title")
    }
    .navigationTitle("Settings")
  }
}
