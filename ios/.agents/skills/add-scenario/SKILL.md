---
name: add-scenario
description: 新增 Scenario 或 Fixture，让 App 能以某个已知状态启动时使用
---

# add-scenario

术语见 `GLOSSARY.md`。Scenario 名就是 `-scenario` 的参数，`default` 保留给真实数据路径。

## 步骤

1. 在 `Packages/Core/Sources/Core/Fixtures/` 新增 `<模型>.<scenario>.json`，如 `home.busy.json`。
2. 字段与对应 `Codable` 模型一致；模型缺字段时先改模型。
3. 在 `Packages/Core/Tests/CoreTests/` 加一条测试：加载该 Scenario 得到预期内容。
4. `just test`。
5. `just run <scenario>`，用 `ui-verify` 确认界面呈现该状态。

完成标准：`just test` 通过，且真机上以该 Scenario 启动后界面符合预期。

## 新模型接入 Scenario

新页面的数据模型照 `HomeContent.load(for:)` 写：`default` 走真实数据路径，其余 Scenario 读 `<模型>.<scenario>.json`；Fixture 缺失时 `Fixture.load` 抛错，`AppModel` 在启动时 `fatalError`，错误会直接出现在 `just console` 里。
