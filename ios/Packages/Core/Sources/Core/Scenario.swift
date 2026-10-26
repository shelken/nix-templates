/// 启动时选中的命名 App 状态, 由启动参数 `-scenario <name>` 指定, 缺省为 `default`
public struct Scenario: Equatable, Sendable {
  public static let defaultName = "default"

  public let name: String

  public var isDefault: Bool { name == Self.defaultName }

  public init(name: String) {
    self.name = name
  }

  public init(arguments: [String]) {
    if let flag = arguments.firstIndex(of: "-scenario"), arguments.indices.contains(flag + 1) {
      name = arguments[flag + 1]
    } else {
      name = Self.defaultName
    }
  }
}
