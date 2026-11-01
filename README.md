# nix-templates

个人 Nix flake 模板集，只保留自己在用的模板。

## 模板

| 模板 | 说明 |
| --- | --- |
| `base` | 基础开发模板（mise，不带 flake）：`AGENTS.md`、`README.md`、`mise.toml`（`mise run setup` 装 prek git hook）和 `.pre-commit-config.yaml`。 |
| `pi-extension` | pi 扩展项目模板（mise + bun，不带 flake）：`src/`、`tests/`、`justfile`（`just verify`），初始化时预装 `pi-interactive-shell`。 |
| `ios` | iOS 应用模板（SwiftUI、xcodegen、mise，不带 flake）：Core 包、真机开发命令和项目 skills。 |

## 用法

```bash
# 指定模板
nix flake init -t github:shelken/nix-templates#base
nix flake init -t github:shelken/nix-templates#pi-extension
nix flake init -t github:shelken/nix-templates#ios

# 不写 #name 时用 default（等于 base）
nix flake init -t github:shelken/nix-templates
```

`base` 初始化后：

```bash
mise trust && mise install && mise run setup
```

`pi-extension` 初始化后：

```bash
mise install && bun install
```

`ios` 初始化后（需要 Xcode 和已开启开发者模式的 iPhone）：

```bash
mise trust && mise install && mise run setup
just init <Name>
just test
just run
```

详见 [iOS 模板说明](./ios/README.md)。

## 说明

- 模板生成的项目本身不依赖 Nix（没有 flake）；仓库根目录的 flake 只提供 `templates` 输出。
- `mise`、`just`、`prek` 使用系统安装的版本，不写在根 flake 里。

## License

MIT，见 [LICENSE](./LICENSE)。
