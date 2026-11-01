import Testing

@testable import Core

@Suite struct HomeContentTests {
  @Test func defaultScenarioUsesPlaceholder() throws {
    #expect(try HomeContent.load(for: Scenario(name: "default")) == .placeholder)
  }

  @Test func namedScenarioLoadsItsFixture() throws {
    let content = try HomeContent.load(for: Scenario(name: "empty"))
    #expect(content.items.isEmpty)
    #expect(content != .placeholder)
  }

  @Test func scenarioWithoutFixtureFailsLoudly() {
    #expect(throws: Fixture.Failure.missing("home.nope")) {
      try HomeContent.load(for: Scenario(name: "nope"))
    }
  }
}
