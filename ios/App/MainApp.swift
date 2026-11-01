import SwiftUI

@main
struct MainApp: App {
  @State private var model = AppModel()

  var body: some Scene {
    WindowGroup {
      RootView(model: model)
        .onOpenURL { model.open($0) }
    }
  }
}
