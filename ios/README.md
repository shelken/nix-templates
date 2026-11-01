# iOS App Template

SwiftUI（iOS 27、Swift 6）真机开发模板。 ** init 后自行修改本 README，清理和项目无关的内容 **

## 前置

- 本机 Xcode，并在 Xcode → Settings → Accounts 登录 Apple ID（免费账号可用）
- `just`（系统自带）、真机已开启开发者模式并信任本机
- 免费账号每台手机最多同时装 3 个 App，每个新项目占一个名额，不用的及时卸载
- 免费账号证书 7 天过期，每 7 天最多注册 10 个 App ID（每个 extension 单独占一个）
- `prek`（系统提供）；Xcode 27、Swift 6.4 工具链
- `ui-verify` 依赖全局的 `iphone` CLI 与 `iphone-use-best-practice` skill，模板不提供，换机器后需自行装好
- 想脱离 Xcode 账号安装：`just ipa` 产出未签名 ipa，再用 Plume / go-ios 等工具签名安装

## 开始

```bash
nix flake init -t github:shelken/nix-templates#ios
mise trust && mise install && mise run setup
just init <Name>              # 大驼峰，bundle id 自动为 space.ooooo.<name 小写>
just test
just run
```

`just init` 只能执行一次，执行后会从 `justfile` 删除自身。随后更新 `AGENTS.md` 标题和本 README。

## 结构

- `App/`: SwiftUI App target
- `Packages/Core/`: 本地 SPM 包，逻辑与 Fixture
- `project.yml`: xcodegen 配置
- `.agents/skills/`: `ios-build`、`ui-verify`、`add-scenario`

## 命令

见 `AGENTS.md`。
