# OAIDSample 测试用例

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|设备正常运行|		|成功拉起应用|Pass|
|验证授权弹窗功能|亮屏，进入首页| 点击授权弹窗上的“允许” |无异常|Pass|
|验证通过Promise方式获取OAID|亮屏，授权弹窗选择“允许”|点击“通过Promise方式获取OAID”|成功获取到OAID|Pass|
|验证通过异步callback获取OAID|亮屏，授权弹窗选择“允许”|点击“通过异步callback获取OAID”|成功获取到OAID|Pass|
|验证重置OAID|亮屏，授权弹窗选择“允许”|点击“重置OAID”|成功重置OAID|Pass|

## 自动化测试

本工程在 `entry/src/ohosTest/ets/test` 下提供基于 Hypium 的自动化用例，共 901 条、28 个套件：
892 条覆盖通用系统 API，9 条覆盖 OAID 接口能力（含 Ability UI 冒烟 2 条）。

### OAID 专属套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| OaidApiMatrix | OAID 权限声明、包信息、OAID 字符串格式与重置后的状态校验 | 7 |
| Ability（ActsAbilityTest） | 应用拉起、授权弹窗、Promise/callback 获取 OAID、重置 OAID 的 UI 冒烟 | 2 |

### 通用系统 API 套件

| 套件 | 覆盖内容 | 用例数 |
|---|---|---|
| OaidWantMatrix*、OaidWantFlagMatrix* | Want 字段与 WantFlag 组合 | 128 |
| OaidWantUriMatrix* | URI 解析、拼接、协议与参数矩阵 | 360 |
| OaidBundleFlagMatrix*、OaidBundleFlagAsyncMatrix* | BundleFlag 同步与异步组合 | 254 |
| OaidBundleInfoMatrix、OaidModuleConfigMatrix | BundleInfo 与模块配置字段 | 63 |
| OaidPermissionMatrix、OaidDeviceMatrix、OaidProcessMatrix | 权限、设备信息、进程信息 | 69 |
| OaidCapabilityMatrix、OaidResourceMatrix | SysCap 能力与资源读取 | 18 |

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
- 日志统一使用 hilog，DOMAIN 为 `0xF811`，TAG 为 `[Sample_OAID]`；
- 获取 OAID 前需在设置中将跨应用关联访问权限置为允许，否则接口返回空字符串。

