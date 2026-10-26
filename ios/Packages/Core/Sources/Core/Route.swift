import Foundation

/// App 内的目的地, 由 deep link `<scheme>://<host>` 的 host 决定
public enum Route: Hashable, Sendable {
  case home
  case settings

  public init?(url: URL) {
    switch url.host() {
    case "home": self = .home
    case "settings": self = .settings
    default: return nil
    }
  }

  /// 导航栈在根页面 (home) 之上需要压入的页面
  public var stack: [Route] {
    self == .home ? [] : [self]
  }
}
