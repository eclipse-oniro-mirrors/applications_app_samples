# BluetoothProfiles

演示 OpenHarmony 经典蓝牙 HFP（AG 角色）最小链路的示例工程。

工程以 `Navigation` 作为页面根容器，首页提供 Profile 目录、搜索入口与蓝牙开关概览，演示页把「读取蓝牙开关 → 查询已配对设备 → 创建 AG 实例 → 查询已连接设备 → 查询连接状态 → 订阅 / 取消订阅 → 释放」串成一条可观测链路，每一步的真实返回与错误码都写入统一日志（hilog + 页面内日志面板）。设备侧用例共 1784 条，在 API 26 真机上连续五轮跑测均 `Failure: 0`。

## 效果预览

截图为 dayu200 真机（720×1280）实拍：

| 首页 | HFP 演示页 | 调用结果 |
| --- | --- | --- |
| ![首页](screenshot/01_home.jpeg) | ![HFP 演示页](screenshot/02_hfp.jpeg) | ![调用结果](screenshot/03_hfp_result.jpeg) |
| 系统蓝牙开关与 `ACCESS_BLUETOOTH` 授权状态、1 个 Profile 入口（搜索可过滤）、9 条首页事件日志 | 七项 Profile 状态、七个操作按钮、AG 角色提示与「已配对 / 已连接」语义说明 | 创建实例后 `getConnectedDevices()` 返回 0 台，状态落「无已连接设备」，提示说明需要 HF 端（耳机 / 车机）接入后才会有设备 |

首页与演示页的日志面板展示的是同一条链路的页面内副本，hilog 侧另有完整调用记录，过滤方式见「日志方案」。

## 只保留 HFP 的 AG 角色

早期版本在 HFP 里同时提供 AG / HF 两个角色的创建对照。真机实测 HF 角色拿不到可用链路，已连同入口整条删除：

| 已删除对象 | 真机现象 | 处理 |
| --- | --- | --- |
| `hfp.createHfpHfProfile()` | 恒返回 `801`，整份 hilog 没有任何 `bt_napi_hfp_hf` 记录（同一次调用里 AG 的 `bt_napi_hfp_ag:(CreateHfpAgProfile:88)enter` 正常输出） | 删除 HF 角色，只保留 AG |

HF 的 801 成因可以定位到设备类型白名单：DevEco 自带的**商用发行版** SDK 里 `hms/ets/api/device-define/api-version/ConnectivityKit.json` 的 `createHfpAgProfile` 登记了 phone / tablet / 2in1 / tv / car / wearable 六种设备类型，而 `createHfpHfProfile` 只登记 phone 与 wearable，实测设备的 `const.product.devicetype` 为 `default`，不属于这两类。（本工程已切到 `runtimeOS: OpenHarmony`，其 SDK 的 `ets/api/device-define` 只有 `default` / `tablet` / `2in1` / `tv` / `wearable` / `liteWearable` 六个文件、没有 `phone.json`，也没有上面那份 `api-version` 白名单；白名单结论来自商用发行版 SDK，与运行时行为一致。）以下常见怀疑也逐一排除过：① 不是导入写法——AG 与 HF 共用同一行 `import { hfp } from '@kit.ConnectivityKit'`；② 不是蓝牙开关或权限——两者在同一用例、同一进程里先后调用，前置条件完全相同；③ 不是 syscap——`@ohos.bluetooth.hfp.d.ts` 里两个角色标的都是 `SystemCapability.Communication.Bluetooth.Core`；④ 不是协议栈缺文件——设备上 `libhfp.z.so` 能扫到 `createHfpHfProfile`、`HandsFreeUnit` 等符号，但没有任何 capability / deviceType 字符串，可见那句提示并非由该库抛出。

## Profile 与演示入口

| Profile | 接口 | 示例角色 | 演示内容 |
| --- | --- | --- | --- |
| HFP | `@ohos.bluetooth.hfp` · `hfp.createHfpAgProfile()` | Audio Gateway（AG） | 以 AG 角色对外提供免提通话能力，耳机、车机作为 HF 端接入后可查询连接状态；`profileId` 为 4 |

模块只提供一个创建入口，其余能力（`getConnectedDevices`、`getConnectionState`、`on/off('connectionStateChange')`）全部来自 `baseProfile.BaseProfile`，因此 `utils/ProfileLike.ets` 把会话需要的最小方法集抽成接口，业务侧只面向 `ProfileLike` 编程：

- `ProfileFactory = () => ProfileLike`：延迟创建，页面点「创建实例」时才真正产生实例；
- `ProfileSession` 只持有 `ProfileLike`，用例可以注入 `support/ProfileStub.ets` 的桩实例，覆盖成功、空列表、抛异常三条分支，不需要真实蓝牙；
- `isProfileLike()` 用来校验桩实例与真实实例的形状一致。

`utils/ProfileFeature.ets` 另外提供一次性的 AG 角色探测 `probeHfpAg()`：创建实例后用 `getConnectedDevices()` 验证实例是否真的可用，结论落在 `HfpAgResult`，与 `ProfileSession` 的会话状态互不影响。创建失败时 `reason()` 会补一句成因：AG 入口在六种设备类型上都有实现，这里的 801 一般是蓝牙服务尚未就绪。

## 目录结构

```
BluetoothProfiles
├── AppScope
├── entry/src/main
│   ├── ets
│   │   ├── common
│   │   │   ├── AppConstants.ets          AppStorage key、路由 key、日志容量、hilog domain/tag、权限名
│   │   │   ├── StringResource.ets        资源管理器绑定与 string.json 取值封装（text）
│   │   │   └── Theme.ets                 颜色、间距、圆角、字号常量
│   │   ├── model
│   │   │   ├── ProfileCatalog.ets        HFP（AG）元数据、搜索过滤
│   │   │   ├── ProfileState.ets          探测状态、错误码分类、连接态/断开原因/蓝牙开关文案
│   │   │   ├── ProfileSnapshot.ets       会话快照（with* 链式更新，不就地修改）
│   │   │   ├── DeviceAddress.ets         地址校验与脱敏
│   │   │   └── LogStore.ets              日志条目、追加/查询/计数/清空（纯函数，返回新数组）
│   │   ├── utils
│   │   │   ├── ProfileLike.ets           会话需要的最小 Profile 形状与工厂类型
│   │   │   ├── ProfileFactory.ets        AG 创建入口、工厂、创建函数名、形状校验
│   │   │   ├── ProfileSession.ets        创建 → 查设备 → 查状态 → 订阅 → 释放（依赖注入）
│   │   │   ├── ProfileFeature.ets        AG 角色探测（创建 + 已连接设备计数）
│   │   │   ├── BluetoothAccess.ets       蓝牙开关、已配对设备、远端设备名、stateChange 订阅
│   │   │   ├── PermissionUtil.ets        ACCESS_BLUETOOTH 查询与申请
│   │   │   ├── ErrorUtil.ets             错误码提示、异常对象错误码提取、格式化描述
│   │   │   ├── FormatUtil.ets            pad2、时间/日期/时长格式化、中间截断
│   │   │   └── Logger.ets                hilog 封装 + AppStorage 中央日志
│   │   ├── components
│   │   │   ├── CommonWidgets.ets         卡片、按钮、标签、状态胶囊等通用控件
│   │   │   ├── ProfileDemoPage.ets       HFP 演示页的操作骨架
│   │   │   └── LogPanel.ets              按 source 过滤的日志面板
│   │   ├── pages/Index.ets               Navigation 外壳与首页（搜索、Profile 卡片、蓝牙概览、日志）
│   │   ├── pages/demos/HfpDemo.ets       AG 演示页
│   │   ├── entryability                  EntryAbility
│   │   └── entrybackupability            EntryBackupAbility
│   └── resources                         string.json（141 条文案）、颜色、主题、页面配置
├── entry/src/ohosTest/ets
│   ├── util/TestTick.ets                 用例之间让出主线程的节拍器
│   ├── test/support/ProfileStub.ets      可注入的桩实例与计数工厂
│   └── test                             43 个用例文件 + List.test.ets（1784 条用例）
├── screenshot                            效果预览截图（真机 720×1280）
├── ohosTest.md                           测试环境、步骤、套件清单与实测结果
└── README.md
```

`entry/src/test` 目前为空：纯逻辑（目录元数据、状态映射、地址脱敏、日志、格式化、快照）已在设备侧用例中直接断言，不再重复维护一套本地单测。

## 会话链路

`ProfileSession` 把官方文档中分散的接口按调用顺序串起来，所有对外方法都不抛异常，异常一律折算为状态 + 错误码写入快照，页面只负责渲染。

| 会话方法 | 对应系统接口 | 说明 |
| --- | --- | --- |
| `ensureProfile()` | `hfp.createHfpAgProfile()` | 已创建时直接返回当前快照 |
| `refreshDevices()` | `BaseProfile.getConnectedDevices()` | 0 台设备时状态为 `NO_DEVICE`，不算失败 |
| `refreshState(deviceId)` | `BaseProfile.getConnectionState(deviceId)` | 先本地校验 `AA:BB:CC:DD:EE:FF` 形式，非法时直接返回 401 语义 |
| `subscribe()` / `unsubscribe()` | `on('connectionStateChange')` / `off(...)` | 按钮按当前订阅状态在「订阅状态变化 / 取消订阅」之间切换 |
| `release()` | `off(...)` + 丢弃实例引用 | 页面 `aboutToDisappear` 调用，防止回调打到已销毁页面 |

演示页另外单独调用 `access.getState()`、`connection.getPairedDevices()`、`connection.getRemoteDeviceName()` 与 `access.on('stateChange')`，用来把「开关未开」「无已配对设备」这类前置问题与 Profile 自身错误区分开。

## 状态与错误码映射

`ProbeStatus` 共 9 个取值：`IDLE`、`READY`、`NO_DEVICE`、`PERMISSION_DENIED`、`CAPABILITY_UNSUPPORTED`、`BLUETOOTH_DISABLED`、`SERVICE_STOPPED`、`PROFILE_UNSUPPORTED`、`FAILED`。`READY` 与 `NO_DEVICE` 都表示实例可用（`isReadyStatus`），只是后者没有对端设备接入。

| 错误码 | 含义 | 映射状态 |
| --- | --- | --- |
| 201 | 缺少 `ACCESS_BLUETOOTH` 授权 | `PERMISSION_DENIED` |
| 401 | 入参无效；`getConnectedDevices()` 在未授予 `ACCESS_BLUETOOTH` 时也会抛 401 | `FAILED` |
| 801 | 设备/镜像未支持该 Profile 能力 | `CAPABILITY_UNSUPPORTED` |
| 2900001 | 蓝牙服务已停止 | `SERVICE_STOPPED` |
| 2900003 | 蓝牙未开启 | `BLUETOOTH_DISABLED` |
| 2900004 | 系统未编译该 Profile | `PROFILE_UNSUPPORTED` |
| 2900099 | 蓝牙服务内部操作失败 | `FAILED` |

需要注意：部分系统接口抛出的异常对象只有 `message`（形如 `BussinessError 201: Permission denied.`），没有数值型 `code`。`ErrorUtil.codeOfThrown()` 在取不到 `code` 时会从 `message` 中提取第一段不少于 3 位的数字，避免把「权限被拒 / 能力不支持」误判为成功。这类判断不能省，否则页面会把失败显示成成功。

## 文案资源化

用户可见文案全部落在 `entry/src/main/resources/base/element/string.json`（141 条），代码里不再出现中文字面量：

- `common/StringResource.ets` 提供 `text(name, first?, second?, third?)`，最多三个 `%s`/`%d` 占位参数；未绑定资源管理器时原样返回资源名称，因此纯逻辑用例在未初始化 Ability 时也能跑。
- 绑定时机：`EntryAbility.onCreate()` 里 `bindResourceManager(this.context.resourceManager)`（首个界面加载前）；ohosTest 进程在 `BluetoothProfiles.test.ets` 入口绑定一次，后续所有套件的 `text()` 才取得到本地化文本。
- 模型层只产出资源键（如 `ProfileSnapshot.describe()` 返回 `text('snapshot_describe', ...)`），展示层直接渲染，页面不再拼接文案。
- 需要按「当前资源」解析的常量写成函数（`defaultNavTitle()`、`appSubtitle()`），不要用模块级常量缓存——常量在资源管理器绑定之前就已求值，会永远返回资源名称。
- 带占位参数的键与调用点的参数个数、顺序一一对应，`string.json` 的取值与硬编码时期逐字一致，因此既有文案断言无需改动。

## 日志方案

- hilog：domain `0xF811`，tag `BluetoothProfiles`，格式 `[source][LEVEL] tag: detail`，参数统一 `%{public}s`。
- 日志内容一律英文（`source`、`tag`、`detail` 都不含中文），便于跨语言检索与问题上报；面向用户的文案只出现在界面与日志面板的文案字段里。
- `Logger.debug/info/warn/error(source, tag, detail)`：始终写 hilog，同时以新数组整体替换写入 `AppStorage('appLogs')`，容量 200。
- 页面内 `LogPanel` 按 `source` 过滤展示最近 20 条，首页展示全部最近 30 条，支持一键清空；WARN 橙色、ERROR 红色标注。
- `source` 取值：`Index`、`HFP`、`BluetoothAccess`、`PermissionUtil`、`ProfileFeature`、`Ability`、`Backup`。
- `queryLogs(logs, source, minLevel, keyword, limit)` 支持来源、最低级别、关键字（匹配 detail 与 tag）与条数过滤，`LogPanel` 即基于它渲染。
- `Logger.count(source, tag)` 按「来源 + 标签」两项计数：两个条件同时命中才计入，避免只按 tag 统计时把别的来源也算进去。
- 页面不自行拼接错误文案，统一走 `ErrorUtil.describeThrown()`：先给「动作 + 错误码 + 原始描述」，再给这一码的处理建议。

## 约束与限制

**运行环境**

- 工程配置：`modelVersion 26.0.0`、`compileSdkVersion 26.0.0`、`targetSdkVersion 26.0.0`、`compatibleSdkVersion 26.0.0`，`AppScope/app.json5` 含 `buildVersion`。
- `runtimeOS` 为 `OpenHarmony`，工程根 `build-profile.json5` 里没有 `arkTSVersion` 字段，属非静态工程；配套的 `compileSdkVersion` 必须显式写出，否则 hvigor 报 `00303034 Configuration Error`。
- OpenHarmony 形态走旧版 SDK 管理模式：需要本机装好 **OpenHarmony SDK**（`SDK Manager → OpenHarmony SDK`，API 26.0.0 一整套），并让它能找到 SDK 根目录——IDE 里自动识别；命令行写在 `local.properties` 的 `sdk.dir`，或设环境变量 `OHOS_BASE_SDK_HOME`。指向 DevEco Studio 自带的商用发行版 SDK 会报 `The SDK management mode has changed`。
- 可用 IDE：DevEco Studio 26.0.0.851（hvigor 6.26.8），主 target 与 ohosTest target 均已在该版本下构建通过。自 API 26 起 IDE 版本号与 API 版本号一致；低于 26.0.0 的 IDE（hvigor 仅支持 modelVersion 5.0.0–6.0.2）在 sync 阶段会报 `00303028`。
- `compatibleSdkVersion` 会随 IDE sync 被对齐到 `targetSdkVersion`；这决定能安装的最低系统版本，要在更低版本设备上验证时手动调低再构建（命令行构建不会改写该字段）。
- `module.json5` 与 `entry/src/ohosTest/module.json5` 的 `deviceTypes` 只声明 `default / tablet / 2in1`。OpenHarmony SDK 的 `ets/api/device-define` 没有 `phone`（那是商用发行版侧的类型），保留 `phone` 会让 `runtimeOS: OpenHarmony` 的构建在 `SyscapTransform` 报 `00303060`「系统能力交集为空」，hvigor 只在 debug 日志里提示 `The systemCapability set corresponding to the 'phone' is not found`。
- 当前基线设备（OpenHarmony 7.1.0.22 / API 26）：`hfp.createHfpAgProfile()` 创建成功，接上 HF 端设备（耳机/车机）后 `getConnectedDevices()` 返回 1 台、`getConnectionState()` 返回已连接、`on('connectionStateChange')` 订阅成功。HFP 属于 BR/EDR 上的 Profile，需要经典蓝牙开启，仅 BLE 模式下不可用。

**功能边界**

- 首次运行必须先授予 `ACCESS_BLUETOOTH`：未授权时 `createHfpAgProfile()` 仍会返回实例，但 `getConnectedDevices()` 会抛 401（页面显示「操作失败（401）」），容易误判成接口参数写错。
- 只演示 HFP 的 AG 角色：HF 角色在本仓库基线镜像上拿不到可用链路，已连同入口整条删除，成因见「只保留 HFP 的 AG 角色」。
- 成功链路依赖真实 HF 端设备（耳机/车机）；没有对端接入时只能演示 `NO_DEVICE` 分支。
- 真实接口的返回随镜像变化，用例以 `ProbeStatus` 而不是错误码作为分支判据。
- 本示例不申请蓝牙以外的权限，不做网络请求、不写数据库。

## 编译

### 获取代码

整仓体积较大，只需要本示例时可以用稀疏检出：

```bash
git clone --filter=blob:none --no-checkout https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout init --cone
git sparse-checkout set code/BasicFeature/Connectivity/BluetoothProfiles
git checkout master
```

### 构建

用 DevEco Studio 打开工程后 `Build > Build Hap(s)/APP(s)` 即可；命令行等价写法（Windows PowerShell，路径按本机安装位置替换）：

```powershell
# 先让 hvigor 找到 OpenHarmony SDK：local.properties 的 sdk.dir，或设 OHOS_BASE_SDK_HOME
$env:PATH = "<DevEco Studio>/tools/node;" + $env:PATH

& "<DevEco Studio>/tools/hvigor/bin/hvigorw.bat" --mode module `
  -p module=entry@default -p product=default assembleHap --no-daemon

& "<DevEco Studio>/tools/hvigor/bin/hvigorw.bat" --mode module `
  -p module=entry@ohosTest -p product=default assembleHap --no-daemon
```

未配置签名时产物为 `entry-default-unsigned.hap` 与 `entry-ohosTest-unsigned.hap`；配置签名后为同目录下的 `entry-default-signed.hap` 与 `entry-ohosTest-signed.hap`。

`hvigorw` 会向 stderr 输出 WARN（如 `Function may throw exceptions`），PowerShell 下整条命令的退出码可能为 1，以输出末尾的 `BUILD SUCCESSFUL` 为准。

## 安装与签名

### 自动签名

`File > Project Structure > Signing Configs` 勾选自动生成签名后 Apply。该流程会向 AGC 申请调试证书与 Profile，而调试 Profile 必须绑定设备 UDID，因此**必须先连接真机**（`hdc list targets` 能看到设备）并登录账号，否则报 `Unable to create the profile due to a lack of a device`。

自动签名会把证书写入 `signingConfigs`，但还需要产品侧引用，`build-profile.json5` 里缺这一行时构建会打印 `No signingConfig found for product default` 并静默产出 unsigned 包：

```json5
"products": [
  {
    "name": "default",
    "signingConfig": "default",
    // ...
  }
]
```

签名后 `signed.hap` 体积略大于 unsigned 包，`SignHap` 任务耗时从毫秒级变为数秒，可据此判断是否真的签了名。`signingConfigs` 段包含本机证书路径与加密口令，不要提交到仓库。

### 安装

```powershell
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc shell aa start -a EntryAbility -b com.example.bluetoothprofiles
```

如果 `hdc list targets` 为空，确认设备已连接 USB、已开启开发者模式与 USB 调试；多设备时用 `hdc -t <connect-key> ...` 指定目标。

签名材料也有有效期：调试 Profile 里写死了绑定设备的 UDID，换设备或设备重装/升级系统后 UDID 变化，安装会报 `code:9568423 ... device is unauthorized`，重新自动签名即可，不需要改代码。

## 测试

测试环境、构建与安装命令、套件清单与实测结果见 [ohosTest.md](ohosTest.md)，本节只记录分层与设计约定。

### 规模

| 项 | 数量 |
| --- | --- |
| 主代码 `.ets` | 24 个文件 / 3016 行 |
| 测试 `.ets` | 46 个文件 / 26660 行（含 `TestTick.ets` 与 `ProfileStub.ets`） |
| 工程合计 | 29676 行 |
| 用例 | 1784 条 / 43 个用例文件 / 54 个 `describe` |

入口为 `List.test.ets`，只做「导入 + 直接调用」：DevEco 运行测试时会静态扫描该文件，若引入的不是 `*.test` 模块，扫描结果会清零并报「在包中未找到任何测试用例」。

### 分层

| 层 | 文件 | 用例 | 覆盖 |
| --- | --- | --- | --- |
| 既有场景用例 | `BluetoothProfiles.test.ets`、`BluetoothProfileData.test.ets`、`BluetoothProfileDevice.test.ets` | 61 | 目录元数据与顺序、错误码分类、文案表、地址与日志与格式化、主题常量、真实枚举对齐、真实创建 AG 实例并查设备/状态/释放、权限查询、AG 角色探测 |
| 纯函数矩阵 | `ProfileState*`、`ProfileAddressMatrix`、`ProfileCatalogMatrix`、`ProfileLogStoreMatrix`、`ProfileFormatMatrix`、`ProfileSnapshotMatrix`、`ProfileViewStateMatrix`、`ProfileErrorUtilMatrix`、`ProfileConstantContract` | 405 | 9 个状态 × 文案/提示/分类/谓词、地址校验与脱敏、检索五字段匹配、日志过滤四维度、格式化边界、快照派生与视图、错误码提取、常量契约 |
| 会话状态机 | `Session*`（Create / Device / State / Subscribe / Release / Callback） | 100 | 注入桩实例后逐条验证创建幂等、设备台数、连接态、订阅计数、释放顺序、回调转发 |
| 质量轴 | `QualityInvariantMatrix`、`QualityBoundaryMatrix`、`QualitySequenceMatrix`、`QualityFeatureMatrix` | 90 | 不变量（快照不可变、计数守恒）、边界值、操作序列、AG 探测特性 |
| 交叉矩阵 | `CodeCross`、`StateCross`、`AddressCross`、`FormatCross`、`FormatTruncateCross`、`LogCross`、`CatalogCross`、`SnapshotCross`、`ViewCross`、`SessionCross`、`FeatureCross`、`ThrownTextCross` | 795 | 两个维度相乘的组合，例如「错误码 × 状态文案」「字节上限 × 文本」「地址形态 × 校验/脱敏」 |
| 调用链与立方 | `SessionChain`、`SnapshotCube`、`ContractGrid`、`AddressGrid` | 297 | 六种会话操作的两两/多步链共 57 条、9 状态 × 10 设备数的快照立方、结果文案与常量契约锁、48 种地址形态的两个视角 |
| 设备侧矩阵 | `DeviceEnumMatrix`、`DeviceAccessMatrix`、`DeviceRealSessionMatrix` | 36 | 与 `constant` / `access` / `baseProfile` 真实枚举对齐、权限查询、真实创建实例后查设备与释放 |

### 设计约定

- **表驱动**：矩阵套件由「样本表 + 断言模板」组成，样本表列出被覆盖的每个取值，新增一类输入只需加一行样本。
- **期望值来自镜像实现**：涉及长度、截断、脱敏、检索命中等可由输入推出的期望值，先在同一文件的辅助函数里按被测实现的语义算出，再写进断言，避免手写字面量算错。
- **每个用例至少三条独立断言**：分别落在分类、文案、谓词这类互不相同的投影上；不写恒真条件（例如 `length >= 0`），也不把同一表达式重复断言。
- **文案断言区分来源**：项目自身产出的文案按精确值断言；系统返回的 message 只做封闭集合与结构前缀断言，避免换系统版本就变红。
- **不做镜像自证**：不把一个类复制一份到测试里再互相比对，断言一律调用 `main/ets` 下的真实导出。

### 让出主线程

hypium 把整批用例串在同一个主线程任务里执行，`await` 一个已完成的 Promise 只产生微任务，不会把控制权交还事件循环；累计占用超过 6 s 时系统判定 `THREAD_BLOCK_6S` 并结束进程，报告里表现为 `App died`（千条级规模下实测在第 931 条左右被杀）。

`util/TestTick.ets` 用 `tick()` 解决：每 10 条用例插入一次 `setTimeout(resolve, 1)`，让主线程回到事件循环、占用计时归零；定时器延迟必须大于 0，`0 ms` 会被并进同一任务、起不到让出作用。每个 `describe` 注册一个 `beforeEachIt(async () => { await tick(); })`，整套 1784 条在一次执行里跑完约 27 s。

### 运行

在 DevEco Studio 的工程树里右键 `entry > src > ohosTest > ets > test > List.test.ets`，选择运行全部用例，设备在运行配置里选择。第一次运行前确认三个前置条件，缺一个就会失败或降级：

1. **屏幕已解锁**。锁屏时测试框架无法启动 ability，报 `10106102 The device screen is locked during the application launch`。
2. **已授予 `ACCESS_BLUETOOTH`**。未授权时 `getPairedDevices`、`createHfpAgProfile` 返回 201，用例会走错误码分支（仍然通过，但没有验证成功链路）。
3. **测试包与主包签名一致**，否则安装报签名冲突。

只跑某一组时，在运行配置里按 `describe` 名过滤。全部 54 个 `describe` 名字可以在各用例文件的 `describe('...')` 处查到。

用例遵循 XTS 编码规范：文件名大驼峰无下划线、`@tc.number` 全局唯一（形如 `SUB_BLUETOOTH_XXX_0001`）、`@tc.name` 与 `it` 名称一致、`@tc.desc` 为英文、不使用恒真断言、单行不超过 120 字符。

### 真机结果

- 测试包 `BUILD SUCCESSFUL`，主包与测试包均安装成功，`hdc install -r` 返回 `install bundle successfully`。
- 连续五轮全量：`Tests run: 1784, Failure: 0, Error: 0, Pass: 1784, Ignore: 0`（首轮重建后两轮连跑、资源文案修正后一轮、本轮 `runtimeOS` 与 domain 修正后两轮）。

## 已知限制

- **AG 的成功链路依赖真实 HF 端设备**：`getConnectedDevices()` 只有在耳机/车机真的建立了 HFP 链路时才非空。手机、平板这类同为 AG 角色的设备即使已配对、甚至连着 A2DP 也不会计入。
- **已配对设备空列表分支未覆盖**：实测设备均有已配对设备，「返回 0 个已配对设备」的分支需要一台未配对任何设备的机器。
- **真实接口分支随镜像变化**：涉及真实调用的用例以 `status === ProbeStatus.READY` 作为分支判据，而不是 `code === 0`；某些镜像上接口可能返回成功但功能缺失，只看错误码会把失败判成成功。
- **UI 层无自动化用例**：首页搜索、卡片跳转、权限弹窗、日志面板过滤依赖手工验收，未纳入 ohosTest。

## 权限

仅申请 `ohos.permission.ACCESS_BLUETOOTH`（user_grant），

- 主模块在 `entry/src/main/module.json5` 声明，`usedScene` 为 `EntryAbility`、`when: inuse`；
- 测试模块在同名 bundle 的 `entry/src/ohosTest/module.json5` 声明，`reason` 引用 `$string:reason_bluetooth`；
- 运行时通过演示页的「申请权限」按钮调用 `abilityAccessCtrl.requestPermissionsFromUser()`，首页展示 `checkBluetoothPermission()` 的查询结果，详情页在每次操作后刷新；
- 授权按 bundle 生效，主应用授予后同 bundle 的 `entry_test` 也能正常调用蓝牙接口。

不涉及网络、存储、相机等别的权限。
