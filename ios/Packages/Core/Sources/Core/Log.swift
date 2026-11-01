import Foundation
import os

/// DEBUG 下额外写 stderr, `just console` 才能在终端看到; stderr 无缓冲, stdout 重定向后会被缓冲而延迟
public enum Log {
  private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "Core", category: "app")

  public static func info(_ message: String) {
    logger.info("\(message, privacy: .public)")
    #if DEBUG
      FileHandle.standardError.write(Data((message + "\n").utf8))
    #endif
  }
}
