|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|进入主页| 1.拉起资源API示例页面 |不涉及|调用getBundleInfoForSelf接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起资源API示例页面 |不涉及|调用getBundleInfoForSelfSync接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起资源API示例页面 |不涉及|调用getProfileByAbility接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起资源API示例页面 |不涉及|调用getProfileByAbilitySync接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起资源API示例页面 |不涉及|调用GetProfileByExtensionAbility接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起资源API示例页面 |不涉及|调用GetProfileByExtensionAbilitySync接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.将.abc文件放到/data/app/el1/bundle/public/com.samples.bundlemanagement/目录下<br />2.拉起资源API示例页面 |不涉及|调用verifyAbc接口成功，页面正常展示字符串文本|否|Pass|
|进入主页| 1.将.abc文件放到/data/app/el1/bundle/public/com.samples.bundlemanagement/目录下                                                                                          <br />2.拉起资源API示例页面 |不涉及|调用deleteAbc接口成功，页面正常展示字符串文本|否|Pass|
|进入主页| 1.拉起资源API示例页面 |不涉及|调用CanOpenLink接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起资源API示例页面 |不涉及|调用IsDefaultApplication接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起资源API示例页面 |不涉及|调用IsDefaultApplicationSync接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起Overlay示例页面，根据静态overlay脚本安装共享hsp包 |不涉及|调用SetOverlayEnabled接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起OverlayModuleInfo示例页面 |不涉及|调用GetOverlayModuleInfo接口成功，页面正常展示字符串文本|是|Pass|
|进入主页| 1.拉起OverlayModuleInfo示例页面 |不涉及|调用GetTargetOverlayModuleInfos接口成功，页面正常展示字符串文本|是|Pass|

## 自动化测试

本工程在 `entry/src/ohosTest/ets/test` 下提供基于 Hypium 的自动化用例，共 836 条、32 个套件：
802 条覆盖通用系统 API，34 条覆盖包管理专属能力（含 Ability 冒烟 3 条）。

### 包管理专属套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| BundleMgmtInfoByNameMatrix | 按包名查询 BundleInfo、模块与 ApplicationInfo 字段 | 11 |
| BundleMgmtProfileMatrix | 读取 Ability/ExtensionAbility 的 profile 配置 | 7 |
| BundleMgmtExtensionMatrix | ExtensionAbility 列表与类型信息 | 4 |
| BundleMgmtLaunchWantMatrix | 获取自身 launchWant 与 moduleName 对应关系 | 4 |
| BundleMgmtUidMatrix | UID、accessTokenId 与包名的交叉校验（免特权权限） | 3 |
| BundleMgmtIconMatrix | 应用图标与 label 资源 ID 校验 | 2 |

### 通用系统 API 套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| SampleWantMatrix、SampleWantFlagMatrix* | Want 字段与 WantFlag 组合 | 72 |
| SampleWantUriMatrix* | URI 解析、拼接、协议与参数矩阵 | 288 |
| SampleBundleFlagMatrix*、SampleBundleFlagAsyncMatrix* | BundleFlag 同步与异步组合 | 254 |
| SampleBundleInfoMatrix、SampleModuleConfigMatrix、SampleAbilityInfoMatrix | BundleInfo、模块配置、AbilityInfo 字段 | 79 |
| SamplePermissionMatrix、SampleDeviceMatrix、SampleProcessMatrix | 权限、设备信息、进程信息 | 68 |
| SampleCapabilityMatrix、SampleResourceMatrix | SysCap 能力与资源读取 | 41 |

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
- 日志统一使用 hilog，DOMAIN 为 `0xF811`，TAG 为 `[Sample_BundleManagement]`；
- 依赖特权权限的接口（如 `getLaunchWantForBundleSync`、`getBundleNameByUid`）在普通应用下
  会抛 201，相关用例改用免权限的等价接口验证。