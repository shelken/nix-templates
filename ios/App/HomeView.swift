import Core
import SwiftUI

struct HomeView: View {
  let model: AppModel

  var body: some View {
    List {
      Section {
        Text(model.content.title)
          .font(.largeTitle)
          .accessibilityIdentifier("home.title")
        Text("Scenario: \(model.scenario.name)")
          .accessibilityIdentifier("home.scenario")
      }
      Section("Items") {
        ForEach(Array(model.content.items.enumerated()), id: \.offset) { index, item in
          Text(item).accessibilityIdentifier("home.item.\(index)")
        }
      }
    }
    .navigationTitle("Home")
    .safeAreaInset(edge: .bottom) {
      NavigationLink(value: Route.settings) {
        Label("Settings", systemImage: "gear")
      }
      .buttonStyle(.glass)
      .accessibilityIdentifier("home.settings")
      .padding()
    }
  }
}
