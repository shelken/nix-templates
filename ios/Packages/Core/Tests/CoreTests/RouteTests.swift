import Foundation
import Testing

@testable import Core

@Suite struct RouteTests {
  @Test func parsesKnownHosts() throws {
    #expect(Route(url: try #require(URL(string: "app://home"))) == .home)
    #expect(Route(url: try #require(URL(string: "app://settings"))) == .settings)
  }

  @Test func rejectsUnknownHost() throws {
    #expect(Route(url: try #require(URL(string: "app://nowhere"))) == nil)
  }

  @Test func rejectsURLWithoutHost() throws {
    #expect(Route(url: try #require(URL(string: "app:settings"))) == nil)
  }

  @Test func homeIsTheRootOfTheStack() {
    #expect(Route.home.stack.isEmpty)
    #expect(Route.settings.stack == [.settings])
  }
}
