# iOS App Template

让 agent 在真机上可重复地启动、导航和核对 App 的约定词汇

## Language

**Scenario**:
启动时选定的一个命名 App 状态，用来把 App 放进已知条件。
_Avoid_: mode, preset, Fixture 场景

**Fixture**:
Scenario 用来代替真实数据的本地 JSON 文件。
_Avoid_: mock, stub data

**Route**:
App 内一个可由 URL 直接到达的目的地。
_Avoid_: deep link target, page

**Core**:
与 UI 无关、可在 Mac 上直接测试的逻辑包。
_Avoid_: Domain, Shared
