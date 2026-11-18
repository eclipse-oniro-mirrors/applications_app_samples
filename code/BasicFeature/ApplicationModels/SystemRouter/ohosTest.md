# SystemRouter 测试用例归档

## 用例表

| 测试功能           | 预置条件     | 输入        | 预期输出         |是否自动|测试结果|
|----------------|----------|-----------|--------------|--------------------------------|--------------------------------|
| 拉起应用           | 	设备正常运行  | 		        | 成功拉起应用       |是|Pass|
| 从首页跳转到harA页面   | 	  进入首页  |  点击ToHarA | 成功跳转到harA页面         |是|Pass|
| 从harA跳转到harB页面 | 进入HarA页面 | 点击ToHarB  | 成功跳转跳转到harB页面 |是|Pass|
| 从harB跳转到首页     | 进入HarB页面 | 点击ToIndex | 成功跳转到首页       |是|Pass|
| 从首页跳转到hspA页面   | 	  进入首页  |  点击ToHarA | 成功跳转到harA页面         |是|Pass|
| 从hspA跳转到hspB页面 | 进入HarA页面 | 点击ToHarB  | 成功跳转跳转到harB页面 |是|Pass|
| 从hspB跳转到首页     | 进入HarB页面 | 点击ToIndex | 成功跳转到首页       |是|Pass|

## 自动化测试

本工程在 `entry/src/ohosTest/ets/test` 下提供基于 Hypium 的自动化用例，共 822 条、29 个套件：
764 条覆盖通用系统 API，58 条覆盖系统路由自身能力。

### 系统路由专属套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| SysRouterTableMatrix | 通过 `getBundleInfoForSelf` 读取 `routerMap`：entry 合并 HAR 路由共 6 条、hspA/hspB 各 2 条、BundleInfo 汇总去重 10 条 | 20 |
| SysRouterConventionMatrix | 路由名与 `buildFunction` 的命名约定、页面源码路径规则、跨模块命名唯一性 | 10 |
| SysRouterStackMatrix | `NavPathStack` 页面栈：入栈、下标查询、参数取回、弹出、移除、替换 | 22 |
| SysRouterHspMatrix | 跨 HSP 调用 hspA 导出的 `add` 能力 | 6 |

### 通用系统 API 套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| SampleWantMatrix、SampleWantFlagMatrix* | Want 字段与 WantFlag 组合 | 60 |
| SampleWantUriMatrix* | URI 解析、拼接、协议与参数矩阵 | 288 |
| SampleBundleFlagMatrix*、SampleBundleFlagAsyncMatrix* | BundleFlag 同步与异步组合 | 254 |
| SampleBundleInfoMatrix、SampleModuleConfigMatrix、SampleAbilityInfoMatrix | BundleInfo、模块配置、AbilityInfo 字段 | 66 |
| SamplePermissionMatrix、SampleDeviceMatrix、SampleProcessMatrix | 权限、设备信息、进程信息 | 68 |
| SampleCapabilityMatrix、SampleResourceMatrix | SysCap 能力与资源读取 | 28 |

### 执行方式

1. 用例源码随工程提交，无需额外生成步骤。

2. 编译测试包（命令行）：

   ```shell
   hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap
   ```

3. 将构建产物（含 hspA/hspB 共享包）安装到设备后，通过 `aa test` 以 OpenHarmonyTestRunner
   执行 `entry_test` 模块中的用例；如需只跑单个套件，可通过 class 参数指定套件名。

### 断言约定

- 每条用例至少 3 个 `expect` 断言，断言真实 API 返回值，不做恒真断言；
- 日志统一使用 hilog，DOMAIN 为 `0xF811`，TAG 为 `[Sample_SystemRouter]`；
- 系统路由表通过 `GET_BUNDLE_INFO_WITH_HAP_MODULE | GET_BUNDLE_INFO_WITH_ROUTER_MAP` 读取，
  未带 `ROUTER_MAP` 标志时 `routerMap` 为空数组。