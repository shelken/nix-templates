---
name: ios-build
description: 构建失败、改 project.yml、真机装不上或启动不了时使用；先读本技能再动手
---

# ios-build

所有命令经 `just`，命令表在 `AGENTS.md`。

## 构建失败

1. `just errors` 取结构化错误，按文件与行号修复。
2. `just build` 重试，直到退出码为 0。

`just errors` 读的是上一次 `just build` 的结果，所以修复后必须重跑 `just build` 才算完成。

## 改 project.yml

改完 `just build`（内含 `just gen`）。`.xcodeproj` 由 `project.yml` 生成，手改会在下次生成时丢失。

## 命令找不到或缺环境

- `xcodegen` / `xcbeautify` 找不到：`mise install`。
- 提示找不到 Team ID：请用户在 Xcode → Settings → Accounts 登录 Apple ID。
- 提示多个 Team ID 或多台真机：用同名环境变量指定，如 `DEVICE=<名称或 UDID> just run`；`just devices` 查设备。

## 真机装不上或启动不了

先读 `just run` 的原始报错再判断：

- 设备 `unavailable`：请用户接线并解锁，`just devices` 确认变为 `connected`。
- `No Accounts` 或 `No profiles for ...`：Xcode 的 Apple ID 登录已失效（Team ID 是缓存，仍能被探测到）。请用户在 Xcode → Settings → Accounts 重新登录，然后重跑。
- `maximum number of installed apps using a free developer profile`：免费账号每台手机最多同时装 3 个 App，报错里列出了占用者。请用户选一个卸载，不要自行卸载。
- 其他签名错误：同样请用户确认 Apple ID 登录有效。
- 启动时信任开发者证书、开启开发者模式属于手机上的操作，交给用户。
