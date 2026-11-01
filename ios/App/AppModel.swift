import Core
import Foundation
import Observation

@MainActor @Observable
final class AppModel {
  let scenario: Scenario
  let content: HomeContent
  var path: [Route] = []

  init(arguments: [String] = ProcessInfo.processInfo.arguments) {
    #if DEBUG
      scenario = Scenario(arguments: arguments)
    #else
      scenario = Scenario(name: Scenario.defaultName)
    #endif
    do {
      content = try HomeContent.load(for: scenario)
    } catch {
      fatalError("Scenario \(scenario.name) 加载失败: \(error)")
    }
    Log.info("launch scenario=\(scenario.name)")
  }

  func open(_ url: URL) {
    guard let route = Route(url: url) else {
      Log.info("忽略未知 URL: \(url)")
      return
    }
    path = route.stack
  }
}
