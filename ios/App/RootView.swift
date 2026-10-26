import Core
import SwiftUI

struct RootView: View {
  @Bindable var model: AppModel

  var body: some View {
    NavigationStack(path: $model.path) {
      HomeView(model: model)
        .navigationDestination(for: Route.self) { route in
          switch route {
          case .home: HomeView(model: model)
          case .settings: SettingsView()
          }
        }
    }
  }
}
