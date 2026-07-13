# pi-extension-template

Pi 扩展项目模板，项目级预装 `pi-interactive-shell`。 ** 在init后自行修改本 README, 清理和项目无关的内容 **

## 项目结构

- 独立仓库：保留模板生成的 `.pi/` 配置。
- monorepo 子包：一般删除子包内模板生成的 `.pi/`，改在 monorepo 根目录运行 `pi install -l npm:pi-interactive-shell`；如果根目录已经引入，无需重复安装。

## 开发

```bash
mise install
bun install
just verify
```
