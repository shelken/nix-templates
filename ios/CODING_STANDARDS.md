# 编码规范

日常编码、提交与验证的项目约定

## 编码与提交

- 注释与文档使用中文
- commit 前先 `git add`，然后运行一次 pre-commit
- 优先使用 Conventional Commits 格式提交，标题英文，正文中文

## 代码

- Swift 6 语言模式；UI 状态用 `@Observable` 加 `@MainActor`
- 测试用 Swift Testing
- 与 UI 无关的逻辑放 `Packages/Core`，`App/` 只放 UI 与装配
- 每个需要点击或断言的元素加 `accessibilityIdentifier`，命名 `<screen>.<element>`，如 `home.title`
- 测试数据做成 Scenario 加 Fixture，不在代码里硬编码

## 验证

- 改 `Packages/Core`：`just test`
- 改 `App/` 或 `project.yml`：`just build`
- 改 UI：`just run <scenario>` 后在真机上用 `ui-verify` 核对
- 不手改 `.xcodeproj`，它由 `project.yml` 生成；改 `project.yml` 后 `just build` 会重新生成

## 工具

- 构建、测试、真机操作只经 `just`，不直接调 `xcodebuild`、`xcodegen`
- 缺失的 CLI 用 `mise` 安装

## 放置约定

- 项目级 skill 放仓库根 `.agents/skills/`
- Fixture JSON 放 `Packages/Core/Sources/Core/Fixtures/`，文件名 `<模型>.<scenario>.json`
