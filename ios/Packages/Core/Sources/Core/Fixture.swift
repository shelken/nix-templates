import Foundation

/// 读取随 Core 打包的 `Fixtures/<name>.json`
public enum Fixture {
  public enum Failure: Error, Equatable {
    case missing(String)
  }

  public static func load<T: Decodable>(_ name: String, as type: T.Type = T.self) throws -> T {
    guard let url = Bundle.module.url(forResource: name, withExtension: "json", subdirectory: "Fixtures")
    else { throw Failure.missing(name) }
    return try JSONDecoder().decode(T.self, from: Data(contentsOf: url))
  }
}
