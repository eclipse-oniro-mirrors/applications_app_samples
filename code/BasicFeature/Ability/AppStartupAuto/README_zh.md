# 开机自启状态查询（AppStartupAuto）

[English](README.md) | [测试说明](ohosTest.md)

## 介绍

本示例使用 Stage 模型和 ArkTS 展示 `autoStartupManager.isAutoStartupSupported()` 与 `autoStartupManager.getAutoStartupStatusForSelf()`：查询设备是否支持开机自启，以及**本应用**当前的开机自启状态。能力检测为 `false` 不等于本应用状态为关闭；失败、超时与不支持分别展示。

示例不申请额外权限、不直接修改自启开关、不跳转到未经验证的系统设置入口，也不宣称查询结果能证明实际开机拉起。权限/设备规则目录只作排查参考，不替代实际 API 返回。

## 效果预览

本次未运行应用或拍摄截图，**暂不提供效果截图**。实际界面需在匹配 SDK 和设备上验证。

| 页面 | 内容与操作 |
|---|---|
| 首页 | 状态、支持情况、最近查询时间；刷新、设备设置指引、查询记录与调用详情 |
| 手动设置回访 | 成功查询后显式开始；手动离开应用设置，返回后关联查询并比较前后样本 |
| 查询历史 | 结果/来源/时间筛选、样本详情、前后比较、脱敏导出、读取/保存重试 |
| 独立 API 诊断 | 分别检测设备能力和查询本应用状态，展示各自阶段、错误码与耗时 |
| 故障与归档 | 展开故障目录、处置顺序、证据链和保留策略参考 |
| 本机查询证据归档 | 手动保存、显式启停自动归档、筛选、分页、脱敏复制、清理预览和确认 |

## 使用说明

1. 使用支持本工程 SDK 配置的 DevEco Studio 打开工程。SDK 配置保持 `26.0.0`，不要仅为消除提示而降级 SDK 或修改 `modelVersion`。
2. 使用自己的调试签名部署到支持的 OpenHarmony 标准设备（模块声明 `default`）。本仓库不提供证书、密码或签名私钥。当前产品引用 `default` 签名配置，部署前须在 IDE 配置自己的签名。
3. 首次进入观察能力与状态；点击刷新重查。查询等待超时不表示原生请求已取消，原请求结束前不会并发重试。
4. 如需修改设置，先获得十分钟内的成功样本，再显式开始手动设置回访；自行离开到系统设置操作后返回。前后台事件只能证明离开/返回，不能证明用户进入设置或修改了开关。
5. 在历史页选择来源、结果和时间范围。导出当前范围与全量导出是不同入口；清空历史需确认，且不删除独立归档。
6. 归档默认不自动采集；启用自动归档前阅读隐私说明并确认。只有成功提交的数据承诺重启恢复；读取失败时暂停写入，不覆盖原库。容量满或写入失败后可预览清理、重试读取/保存。
7. 界面资源提供默认英文及 `zh_CN` 中文。切换系统语言后重新进入/重启示例，核验标签、动态提示和既有历史的显示；历史标识与展示文本分离。

## 工程目录

```text
AppScope/                         应用标识和应用级资源
entry/src/main/ets/
  entryability/EntryAbility.ets    生命周期、私有存储挂接
  autostart/                      查询、历史、回访、归档与规则
    archive/                      私有 RDB、事务归档、清理预览
    diagnostics/                  独立 API 诊断与参考目录
    history/                      历史筛选、比较与导出展示模型
    revisit/                      手动设置指引与回访状态机
  components/                     查询详情、记录弹层、归档面板
  pages/                          首页、历史、指引、诊断、故障页
entry/src/main/resources/         英文与中文等资源
entry/src/ohosTest/ets/
  test/                           逻辑、原生 RDB、组件集成用例
  support/                        受控时钟/API、清理与日志封装
  testability/                    测试 Ability
  testpages/                      归档 UI 测试宿主
  testrunner/                     Hypium 入口及独立 API 探针
```

## 具体实现

- [AutoStartupRuntime](entry/src/main/ets/autostart/AutoStartupRuntime.ets) 隔离平台 API 与时钟，`SharedAutoStartupApi` 在正常查询和独立诊断之间共用原生单飞位置。
- [AutoStartupService](entry/src/main/ets/autostart/AutoStartupService.ets) 管理查询阶段、超时、前后台刷新、历史保存链和回访关联；销毁/超时不伪造原生取消。
- [AutoStartupHistory](entry/src/main/ets/autostart/AutoStartupHistory.ets) 校验并恢复 schema-1 历史，保留最近 20 条且最长 30 天，导出时掩码敏感内容。
- [AutoStartupTypes](entry/src/main/ets/autostart/AutoStartupTypes.ets) 的刷新来源使用 `initial/manual/foreground/settings`。解析继续接受历史中文来源并规范化；字段名、schema、记录 ID、回访 ID、归档 ID 不变。
- [RevisitTracker](entry/src/main/ets/autostart/revisit/RevisitTracker.ets) 以明确的 session/query 关联记录离开、返回、回查；回访最多保留 10 轮、30 天，每轮最多 5 次回查证据。
- [StartupArchive](entry/src/main/ets/autostart/archive/StartupArchive.ets) 只展示已提交归档，最多 500 条、1 MiB；排队采集有界，容量或存储故障会暂停。长期归档不保存原始平台错误说明。
- [StartupArchiveRdbStorage](entry/src/main/ets/autostart/archive/StartupArchiveRdbStorage.ets) 使用私有 RDB 与版本检查，失败时不把内存状态伪装为已提交。
- 日志统一使用 `DOMAIN = 0xF811`、`TAG = [Sample_AppStartupAuto]`；日志不记录私有历史或原始错误载荷。

## 相关权限与依赖

- 主模块未声明额外 `requestPermissions`；系统设置由用户手动操作。
- 运行时使用系统 AbilityKit、ArkUI、ArkData、BasicServicesKit、PerformanceAnalysisKit。
- 自动化测试依赖 `@ohos/hypium` 与 TestKit；原生 RDB / UiTest 用例必须在测试设备执行。

## 约束与限制

1. 本次仅修改文件并做文本/JSON/资源引用核对；按用户要求未编译、未构建、未运行测试。不得把本说明理解为设备适配或测试通过证明。
2. SDK `26.0.0` 与现有 `modelVersion` 保留；完整部署签名、平台 API 支持范围及实际设备行为须由集成方核验。
3. 查询的是本应用状态，不支持任意其他应用开关管理，不证明真实重启后被拉起。
4. 规则目录中的版本、权限和设备建议为示例数据，不代表本机实时授权、通知发送或系统设置能力。
5. 对未完成的原生调用使用等待和隔离，不承诺立即取消；进程退出前未成功提交的数据不承诺恢复。
6. 手动测试步骤、现有用例入口及未执行状态见 [ohosTest.md](ohosTest.md)。

## 下载

最终仓库目录为 `code/BasicFeature/Ability/AppStartupAuto`。在空目录执行：

```shell
git init
git config core.sparsecheckout true
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
echo code/BasicFeature/Ability/AppStartupAuto/ > .git/info/sparse-checkout
git pull origin master
```

若变更尚未合入 `master`，请使用包含本示例的实际评审分支，不要将下载失败解释为本地构建结果。
