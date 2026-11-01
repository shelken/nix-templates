---
name: ui-verify
description: 改了 UI 后要在真机上核对界面时使用：启动 Scenario、截图、检查 accessibilityIdentifier
---

# ui-verify

在真机上核对界面。界面操作通过 `iphone-use-best-practice` skill 的 `iphone` CLI，先读它。

## 步骤

1. `just run <scenario>` 以目标 Scenario 启动；不带参数是 `default`。
2. 需要跳到具体页面时 `just open <route>`，如 `just open settings`。
3. `iphone snapshot` 读无障碍树，逐项检查本次改动涉及的 `accessibilityIdentifier` 是否存在且文案正确。
4. `iphone shot` 截图，对照设计要求逐条核对；每条给出通过或不通过。
5. 需要 App 日志时用 `just console <scenario>`，它前台运行，读完 Ctrl-C。

完成标准：设计要求的每一条都有核对结果，不通过的条目已修复并重新核对。

## 备注

- Liquid Glass 的折射与透明度以真机为准。
- 找不到元素时，先确认代码里给它加了 `<screen>.<element>` 形式的 `accessibilityIdentifier`，再怀疑工具。
