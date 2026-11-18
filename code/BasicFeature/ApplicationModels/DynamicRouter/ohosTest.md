# DynamicRouter 测试用例归档

## 用例表

| 测试功能           | 预置条件     | 输入        | 预期输出         |是否自动|测试结果|
|----------------|----------|-----------|--------------|--------------------------------|--------------------------------|
| 拉起应用           | 	设备正常运行  | 		        | 成功拉起应用       |是|Pass|
| 从首页跳转到harA页面   | 	  进入首页  |  点击ToHarA | 成功跳转到harA页面         |是|Pass|
| 从harA跳转到harB页面 | 进入HarA页面 | 点击ToHarB  | 成功跳转跳转到harB页面 |是|Pass|
| 从harB跳转到首页     | 进入HarB页面 | 点击ToIndex | 成功跳转到首页       |是|Pass|

## 自动化测试

本工程在 `entry/src/ohosTest/ets/test` 下提供基于 Hypium 的自动化用例，共 806 条、29 个套件：
753 条覆盖通用系统 API，53 条覆盖动态路由自身能力（含 Ability 冒烟 3 条）。

### 动态路由专属套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| DynRouterStackMatrix | `NavPathStack` 页面栈：入栈、下标、参数、弹出、移除、替换、动效开关 | 24 |
| DynRouterModuleMatrix | `RouterModule` 注册/获取页面栈、未注册路由返回 undefined、按名字弹栈 | 8 |
| DynRouterUrlMatrix | HAR 页面动态路由 URL 的分段约定（模块名、页面路径、路由名与 builder 名） | 18 |

### 通用系统 API 套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| SampleWantMatrix、SampleWantFlagMatrix* | Want 字段与 WantFlag 组合 | 60 |
| SampleWantUriMatrix* | URI 解析、拼接、协议与参数矩阵 | 288 |
| SampleBundleFlagMatrix*、SampleBundleFlagAsyncMatrix* | BundleFlag 同步与异步组合 | 254 |
| SampleBundleInfoMatrix、SampleModuleConfigMatrix、SampleAbilityInfoMatrix | BundleInfo、模块配置、AbilityInfo 字段 | 66 |
| SamplePermissionMatrix、SampleDeviceMatrix、SampleProcessMatrix | 权限、设备信息、进程信息 | 68 |
| SampleCapabilityMatrix、SampleResourceMatrix | SysCap 能力与资源读取 | 17 |

### 执行方式

1. 用例源码随工程提交，无需额外生成步骤。

2. 编译测试包（命令行）：

   ```shell
   hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap
   ```

3. 将构建产物安装到设备后，通过 `aa test` 以 OpenHarmonyTestRunner 执行 `entry_test` 模块
   中的用例；如需只跑单个套件，可通过 class 参数指定套件名。

### 断言约定

- 每条用例至少 3 个 `expect` 断言，断言真实 API 返回值；
- 日志统一使用 hilog，DOMAIN 为 `0xF811`，TAG 为 `[Sample_DynamicRouter]`；
- `NavPathStack` 未挂载 `Navigation` 组件时，`getPathStack`、`getParent`、`popToName` 等接口
  与有 UI 时行为不同，用例只覆盖验证可用的接口。