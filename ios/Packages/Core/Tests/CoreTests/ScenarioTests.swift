import Testing

@testable import Core

@Suite struct ScenarioTests {
  @Test func readsNameFollowingFlag() {
    let scenario = Scenario(arguments: ["/path/App", "-scenario", "empty", "-other", "x"])
    #expect(scenario == Scenario(name: "empty"))
  }

  @Test func fallsBackToDefaultWhenFlagAbsent() {
    #expect(Scenario(arguments: ["/path/App"]).isDefault)
  }

  @Test func fallsBackToDefaultWhenFlagHasNoValue() {
    #expect(Scenario(arguments: ["/path/App", "-scenario"]).isDefault)
  }
}
