# AbilityStartMode 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|设备正常运行|		|成功拉起应用|Pass|
|首页食物列表|进入首页|     |首页列表正常展示|Pass|
|进入详情页|食物列表正常展示|点击“番茄”|进入番茄详情页|Pass|
|水果具体数据|进入水果香详情页|左滑水果详细参数列表|从右侧滑入水果卡路里详情|Pass|
|详情页的其他食物列表|进入水果详情页|下滑列表，点击其他食物中的“黄瓜”|进入黄瓜的详情页|Pass|

## 自动化测试

本工程在 `entry/src/ohosTest/ets/test` 下提供基于 Hypium 的自动化用例，共 923 条、33 个套件：
847 条覆盖通用系统 API，76 条覆盖 Ability 启动模式等专属能力（含 Ability 冒烟 3 条）。

### 启动模式专属套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| StartModeWantParamMatrix | Want 参数在启动流程中的传递与校验 | 20 |
| StartModeEmitterMatrix | `emitter` 事件注册、发送、取消与一次性监听 | 20 |
| StartModeLaunchTypeMatrix | singleton/multiton/specified 启动模式字段 | 12 |
| StartModeAbilitySkillMatrix | Ability 的 skills（action/entities/uris）配置 | 8 |
| StartModeDelegatorMatrix | `abilityDelegatorRegistry` 取 Ability 与上下文 | 7 |
| StartModeCategoryMatrix | 应用与 Ability 分类字段 | 6 |
| Ability（ActsAbilityTest） | 应用上下文、BundleInfo、模块信息的启动冒烟 | 3 |

### 通用系统 API 套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| SampleWantMatrix、SampleWantFlagMatrix* | Want 字段与 WantFlag 组合 | 96 |
| SampleWantUriMatrix* | URI 解析、拼接、协议与参数矩阵 | 288 |
| SampleBundleFlagMatrix*、SampleBundleFlagAsyncMatrix* | BundleFlag 同步与异步组合 | 254 |
| SampleBundleInfoMatrix、SampleModuleConfigMatrix、SampleAbilityInfoMatrix | BundleInfo、模块配置、AbilityInfo 字段 | 105 |
| SamplePermissionMatrix、SampleDeviceMatrix、SampleProcessMatrix | 权限、设备信息、进程信息 | 68 |
| SampleCapabilityMatrix、SampleResourceMatrix | SysCap 能力与资源读取 | 36 |

### 执行方式

1. 用例源码随工程提交，无需额外生成步骤。

2. 编译测试包（命令行）：

   ```shell
   hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap
   ```

3. 将构建产物安装到设备后，通过 测试框架命令 以 OpenHarmonyTestRunner 执行 `entry_test` 模块
   中的用例；如需只跑单个套件，可通过 class 参数指定套件名。

### 断言约定

- 每条用例至少 3 个 `expect` 断言，断言真实 API 返回值；
- 日志统一使用 hilog，DOMAIN 为 `0xF811`，TAG 为 `[Sample_AbilityStartMode]`。