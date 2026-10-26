/// Home 页展示的内容; default Scenario 用 `placeholder`, 其余 Scenario 读 `home.<name>.json`
public struct HomeContent: Codable, Equatable, Sendable {
  public var title: String
  public var items: [String]

  public static let placeholder = HomeContent(title: "Hello", items: ["First", "Second"])

  public init(title: String, items: [String]) {
    self.title = title
    self.items = items
  }

  public static func load(for scenario: Scenario) throws -> HomeContent {
    scenario.isDefault ? placeholder : try Fixture.load("home.\(scenario.name)")
  }
}
