# 测试用例归档

## 2026-11-20 当前批次

- 测试源码（测试目录内 .ets，含入口和公共支撑）共 53,878 物理行、42,338 非空非注释行；进一步排除纯结构行为 38,221 行。不计生成器、依赖、文档、构建产物和历史快照。
- 共 1,767 个注册用例：查询路由 393、容量快照 421、格式化 926、原存储基线 22、应用上下文 1、本地逻辑 4；没有新增界面交互用例。
- 全量 Host 验证：1,762 通过、0 失败、5 个真 SDK 用例未运行；5,479 次实际断言、1,865 次生产逻辑调用、0 次真实 SDK 调用，XTS 元数据及断言日志检查无违规。另逐一注入 5,479 个断言失败点，所有异常继续传播且 begin/end 恰好闭环一次；注入执行不重复计入上述正常断言及调用数。
- 本轮修复后构建：entry@default 与 entry@ohosTest 均成功；源码/配置哈希一致、无构建导致的新增或缺失源码。详见 [_task26/storage-build-review-final-closed.json](_task26/storage-build-review-final-closed.json)。初次测试包的 30 处 Object.is 受限标准库错误已修复；历史成功日志不代表本轮通过。
- 页面结果控制逻辑另有 9 个 Host 检查通过：六条文案/路由映射、SDK 失败、校验失败和延迟查询状态清理；详见 [_task26/storage-controller-review-final-closed.json](_task26/storage-controller-review-final-closed.json)，不计入上述 XTS 用例规模，也不代表 ArkUI 渲染通过。
- 完整 TestAbility、OpenHarmonyTestRunner、Hypium 注册及六个原按钮保持；未安装测试包或运行真机/UI 验证。
- 全部用例编号、名称、英文场景描述、源码位置及逐例 Host 状态保存在 [_task26/storage-validation-review-final-closed.json](_task26/storage-validation-review-final-closed.json) 的 catalog/results。

- 本地检视记录见 [_task26/storage-review-final-closed.json](_task26/storage-review-final-closed.json)：记录已修问题、失败日志闭环修复及未执行的设备/UI边界。现有 README_zh.md 已更新；README.md 命名约定偏差仍保留，不据此宣称完整 PR 验收通过。

### 测试场景与操作

| 分组 | 用例数 | 步骤 | 预期结果 | 当前状态 |
| --- | ---: | --- | --- | --- |
| Routing | 393 | 注入每条 SDK 路由的字节值、错误与回调次序，调用 queryStorage | 字节值及独占调用记录符合预期，错误优先和初始完成语义保持 | Host 通过 |
| Usage | 421 | 注入 total/free 容量、延迟和拒绝，调用 calculateStorageUsage/queryStorageUsage | 四字段、字节守恒、百分比容差、并发与快照隔离符合预期 | Host 通过 |
| Format | 926 | 按单位阈值、舍入 ties、精度及非法参数调用 formatStorageSize | 输出与独立 BigInt 预期相符，非法参数按顺序拒绝 | Host 通过 |
| Baseline 逻辑 | 18 | 执行原存储查询路由、计算与格式化场景 | 所有真实观测断言满足预期 | Host 通过 |
| Local | 4 | 执行容量、空快照、KiB 格式和非法容量场景 | 3072 字节/75%、零用量、1.50 KiB 及指定异常 | Host 通过 |
| 真 SDK/上下文 | 5 | 安装授权签名测试包后用 Hypium 执行 SDK 及上下文场景 | 正常容量、sandbox 空闲容量及独立完整路径目录 | 本轮未运行 |

### 本机验证命令

在工程目录执行；每次使用新的 run 名称，保留历史回执。

```bash
node _task26/ValidateStorageTests.cjs <run-name>
node _task26/BuildStorageValidation.cjs <run-name>
node _task26/ValidateStorageController.cjs <run-name>
```

Host 使用断言及 SDK 适配替身，不替代设备上的 Hypium 或实际 UI 测试。构建回执记录双目标命令、日志、产物哈希及源码保护结果；生成器默认不覆盖已有不同内容。

## 历史 Task26 归档（非当前批次结果）

- 仅部分完成：相对只读原仓，业务源码净新增302有效行/415物理行；含测试基础设施为324/475，未达到约50000有效行目标。有效行排除注释、空行和纯结构行。
- StorageQuery.test.ets现有22用例、55静态断言点，覆盖六条SDK路由、字节边界、callback次序及错误、容量计算和二进制单位格式化。
- Host执行18个调用production workflow的注入边界用例：18通过、0失败、48断言；4个真实SDK用例跳过、0次真实SDK调用，不宣称SDK或UI通过。
- 页面原按钮全部保留并继续调用production查询；SDK三版本字段为字符串26.0.0，local.properties使用E:/sdk，完整TestAbility、OpenHarmonyTestRunner和Hypium注册保留。
- main与ohosTest覆盖构建成功；完成pr-review_origin五份reference检视、修正后双目标复编成功。日志为_task26/*-group2-coverage-build-1.log及*-group2-review-build-1.log。
- 每次构建均保存before/after哈希和source快照；无缺失恢复、无构建导致的source变更，未修改共享SDK/工具或增加签名。
- 本轮未进行UI/设备实测，下表Pass/pass仅为原归档记录。Task26保持in_progress，余项为约50000有效行规模及设备验证。

## 用例表

| 测试功能                      | 预置条件                                       | 输入 | 预期输出                   | 是否自动 | 测试结果 |
|---------------------------|--------------------------------------------| ---- | -------------------------- |------| -------- |
| 拉起应用                      | 设备正常运行                                     |      | 成功拉起应用，主页元素齐备 | 否    | Pass     |
| 测试getFreeSize接口           | 使用PC/2in1设备                                     |      | getFreeSize success                  | 否    | Pass     |
| 测试getCurrentBundleStats接口           | 使用PC/2in1设备 |      | getCurrentBundleStats success                  | 否    | pass     |
| 测试getTotalSize接口  | 使用PC/2in1设备 |      | getTotalSize success                   | 否    | pass     |
| 测试getTotalSizeSync接口        | 使用PC/2in1设备                                   |      | getTotalSizeSync success                  | 否    | pass     |
| 测试storageGetFreeSize接口        | 使用PC/2in1设备                                     |      | storageGetFreeSize success                   | 否    | pass     |
| 测试getFreeSizeSync接口         | 使用PC/2in1设备                                     |      | getFreeSizeSync success                    | 否    | pass     |

