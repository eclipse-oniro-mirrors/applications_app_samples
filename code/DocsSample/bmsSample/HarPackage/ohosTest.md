# HAR 测试用例归档

## 功能用例表

| 测试功能       | 预置条件       | 输入    | 预期输出    |测试结果|
|------------|------------|-------|---------|--------------------------------|
| 工程编译       | 	编译正常，构建正常 | 	无	         | 成功安装运行  |Pass|
| 点击按钮button | 	安装运行      | 	点击按钮button	         | 文本信息有变化 |Pass|
| 点击按钮native_add | 	安装运行      | 	点击按钮native_add	         | 文本信息有变化 |Pass|

## ohosTest 自动化用例

`entry/src/ohosTest` 下共 **25 个测试套件 / 1396 个用例 / 约 4.8 万行**，全部基于 Hypium 编写，覆盖 HAR 包的对外契约、资源、包信息、上下文、窗口与生命周期。

| 测试套件 | 用例数 | 覆盖内容 |
|------|------:|------|
| HarApiSmoke | 4 | HAR 导出函数、包身份、字符串资源、图标资源、页面点击冒烟 |
| NativeAddBasicMatrix / BoundaryMatrix / FractionMatrix / NegativeMatrix / PrecisionMatrix / SeriesMatrix | 301 | `nativeAdd` 的整数、边界、小数、负数、精度、连续累加契约 |
| NativeAddPerturbationMatrix | 127 | 交换律、结合律、逆运算、奇偶与取模等代数性质 |
| HarStringContractMatrix / HarStringUnicodeMatrix | 182 | HAR 字符串返回值与 UTF-16/Unicode 编解码契约 |
| HarStringResourceMatrix / HarColorResourceMatrix / HarFloatResourceMatrix / HarMediaResourceMatrix | 194 | 字符串、颜色、浮点、图片资源的名称/ID 读取与深浅色覆盖 |
| BundleIdentityMatrix / BundleModuleMatrix / BundleAbilityMatrix / BundleBackupMatrix / BundleInvariantMatrix | 263 | bundleInfo、模块、Ability、备份扩展与包信息不变式 |
| ContextMatrix / FileIoMatrix | 186 | Context 目录契约与文件读写、追加、重命名、复制、目录操作 |
| AbilityLifecycleMatrix / WindowMatrix / IndexUiMatrix | 49 | Ability 生命周期回调、窗口属性、避让区、屏幕信息、页面交互 |
| IntegrationChainMatrix | 90 | 上下文、包信息、模块、资源与 HAR 函数的跨模块链路校验 |
| 合计 | 1396 |  |



  可直接在 DevEco Studio 中右键 `entry/src/ohosTest` 运行测试。
