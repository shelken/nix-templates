# iOS App Template

基于 SwiftUI 的 iOS 应用项目，只在真机上开发与验证，所有操作经 `just` 完成

## 布局

- `App/`: App target，只放 UI 与装配，入口 `MainApp.swift`
- `Packages/Core/`: 本地 SPM 包，与 UI 无关的逻辑；Fixture 在 `Sources/Core/Fixtures/`
- `project.yml`: xcodegen 配置，`.xcodeproj` 由它生成且不入库
- `.agents/skills/`: 项目 skill
- `GLOSSARY.md`: Scenario / Fixture / Route / Core 的定义

## 约束

日常编码、提交与验证规范见 `CODING_STANDARDS.md`

- 构建、测试、真机操作只用 `just`，命令见下表
- Team ID 与真机默认自动探测；多个账号或多台真机时用环境变量 `DEVELOPMENT_TEAM`、`DEVICE` 指定

## 命令

| 命令 | 作用 |
|---|---|
| `just gen` | 生成 `.xcodeproj` |
| `just test` | Core 逻辑测试，在 Mac 上跑 |
| `just build` | 真机 Debug 构建 |
| `just errors` | 上次构建的结构化错误 |
| `just install` | 构建并安装到真机 |
| `just launch [scenario] [启动参数...]` | 以 Scenario 启动已安装的 App，立即返回；多出的参数透传，如 `-AppleLanguages '(ja)'` |
| `just run [scenario] [启动参数...]` | `install` 加 `launch` |
| `just console [scenario] [启动参数...]` | 同 `run`，前台回传日志，Ctrl-C 结束 |
| `just ipa` | 产出未签名 `build/<App>.ipa`，不依赖 Xcode 账号 |
| `just open <route>` | 在真机上触发 deep link |
| `just devices` | 列出设备 |
| `just fmt` | 格式化 |

## Skills

- 构建失败、改 `project.yml`、真机装不上: `ios-build`
- 改了 UI 要在真机上核对: `ui-verify`
- 新增 Scenario 或 Fixture: `add-scenario`
