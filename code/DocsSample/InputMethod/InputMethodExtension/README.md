# InputMethodExtension

演示 IME Kit 的**输入法扩展**能力，工程围绕三条真实链路组织三个演示页：

- **扩展信息**：ArkUI 编辑框拉起输入法时通过 `EditorAttribute.extraConfig` 携带 `InputMethodExtraConfig`
  （`customSettings` 只接受 number/string/boolean，总长 ≤ 32KB）。UIAbility 拿不到"被拉起"那一刻，
  因此用与 `EditorAttribute` 结构相同的打桩对象复现读取路径，额度校验（32768 / 32769）按 UTF-8 实测字节数断言。
- **输入法列表**：系统声明式组件 `InputMethodListDialog`，调用方只提供 `PatternOptions`（图标 + 回调），
  列表内容由系统按已安装输入法填充。
- **面板与模式**：`PanelType` / `PanelFlag` 枚举、`getInputMethodAbility().createPanel()` 的真实返回、
  `destroyPanel()`，以及一个不依赖系统面板的软键盘预览（同一套 `KeyboardModel` 纯函数驱动）。

工程同时注册了一个 `type: "inputMethod"` 的扩展（`InputMethodService`），实现
`InputMethodExtensionAbility` 的 `on('inputStart')` / `on('inputStop')`：前者把 `InputClient` 交给
`KeyboardBridge` 并 `createPanel → resize → setUiContent(KeyboardPage)`，后者销毁面板。
这条链路只有在本应用被启用为输入法、且真实编辑框聚焦时才会被系统拉起。

## 效果预览

截图为 dayu200 真机（720×1280）实拍：

| 首页 | 扩展信息 |
| --- | --- |
| ![首页](screenshot/01_home.jpeg) | ![扩展信息](screenshot/02_extra_config.jpeg) |
| 系统能力已声明、3 个演示入口共 11 个接口、搜索过滤与首页日志 | 4 个键 / 125 字节、压线 32768、越界 32769（401）、JSON 往返 |

| 输入法列表 | 面板与模式 |
| --- | --- |
| ![输入法列表](screenshot/03_input_method_list.jpeg) | ![面板与模式](screenshot/04_panel.jpeg) |
| 两个模式项（中文输入 / 英文输入）、默认选中第 1 项、重置选择 | 面板枚举对照、扩展注册检查、`createPanel` 实测、软键盘预览与候选 |

输入法列表点「打开输入法列表」后弹出的是**系统**输入法列表（系统渲染的独立弹窗，不在应用窗口内），
页面如实记录弹出的内容与回调行为，实测表现见 [ohosTest.md](ohosTest.md)。

## 演示入口与覆盖接口

| 演示页 | 覆盖接口 | 演示内容 |
| --- | --- | --- |
| 扩展信息 | `InputMethodExtraConfig`、`customSettings`、`CustomValueType`、`EditorAttribute.extraConfig` | 构造 4 个键（string/number/boolean）并量出 125 字节；压线 32768 与越界 32769（401）；JSON 往返；打桩对象读回排序结果；空扩展读回 0 项 |
| 输入法列表 | `InputMethodListDialog`、`PatternOptions`、`Pattern` | 两个模式项（中文/英文）装配进对话框，记录对话框打开与 `action` 回调的真实行为 |
| 面板与模式 | `PanelType`、`PanelFlag`、`getInputMethodAbility`、`createPanel`、`destroyPanel` | 枚举对照、扩展注册检查、四种类型×状态组合逐一调 `createPanel` 并立即销毁、软键盘预览与候选 |

扩展侧（编译进包、由系统在启用后拉起）：

| 文件 | 内容 |
| --- | --- |
| `inputmethodextensionability/InputMethodService.ets` | `InputMethodExtensionAbility`：`onCreate` 注册 `inputStart`/`inputStop`，`inputStart` 建面板，`inputStop` 销毁 |
| `inputmethodextensionability/pages/KeyboardPage.ets` | 面板页：按键经 `applyKey` 改本地缓冲，有 `InputClient` 时走 `insertText` / `deleteBackward` |
| `utils/KeyboardBridge.ets` | `InputClient` 持有与上屏封装（`insertText`、`deleteBackward`） |
| `utils/PanelController.ets` | `createPanel → resize → setUiContent('inputmethodextensionability/pages/KeyboardPage')` 与 `destroyPanel` |

**未覆盖的接口**：

- `InputMethodExtensionAbility` 的**真实输入链路**：需要本应用先在「设置 → 输入法」里启用，并聚焦真实编辑框，
  系统才会拉起扩展；示例不自动改系统输入法设置。
- `inputMethodEngine` 的输入回调（`insertText`、`deleteBackward` 作用于真实编辑框）：同上，
  自动化环境拿不到真实 `InputClient` 连接，页面只做本地缓冲的键盘预览。

## 目录结构

```
InputMethodExtension
├── AppScope
├── entry/src/main
│   ├── ets
│   │   ├── common
│   │   │   ├── AppConstants.ets         32KB 额度、键名、日志 domain/tag、超时
│   │   │   ├── L10n.ets                 按资源名取本地化文案（model / utils 层共用）
│   │   │   └── Theme.ets                颜色、间距、圆角、字号常量
│   │   ├── model
│   │   │   ├── ExtraConfigModel.ets     ConfigEntry / customSettings 构造 / UTF-8 字节数 / 打桩 EditorAttribute
│   │   │   ├── KeyboardModel.ets        键盘行列、功能键、applyKey、码点计数与代理对删除、候选（纯函数）
│   │   │   ├── CallOutcome.ets          调用结果三态与 401/501/801/12800004/12800013 分类
│   │   │   ├── FeatureCatalog.ets       首页目录、搜索过滤、未覆盖接口清单
│   │   │   └── LogStore.ets             日志条目、容量裁剪、过滤、计数（纯函数）
│   │   ├── utils
│   │   │   ├── ExtraConfigSession.ets   默认键值、压线、越界、JSON 往返的本地会话
│   │   │   ├── InputMethodListSession.ets  模式项规格、下标收敛、越界判定、回调文案
│   │   │   ├── PanelProbe.ets           createPanel 负向/实测封装（含超时与立即销毁）
│   │   │   ├── PanelController.ets      扩展进程内的面板生命周期
│   │   │   ├── KeyboardBridge.ets       InputClient 持有与上屏
│   │   │   ├── AsyncUtil.ets            带超时的 Promise 竞速
│   │   │   ├── ErrorUtil.ets            错误码分类提示、异常对象取码
│   │   │   ├── FormatUtil.ets           时长/文本格式化
│   │   │   └── Logger.ets               hilog 封装 + AppStorage 共享日志
│   │   ├── components                   三个演示页、KeyboardPanel、OutcomeView、ResultList、LogPanel、CommonWidgets
│   │   ├── pages/Index.ets              Navigation 外壳与首页
│   │   ├── pages/demos                  ExtraConfigDemo / InputMethodListDemo / PanelDemo
│   │   ├── inputmethodextensionability  InputMethodService + pages/KeyboardPage
│   │   ├── entryability                 EntryAbility
│   │   └── entrybackupability           EntryBackupAbility
│   └── resources
│       ├── base/element/string.json     界面文案（中文基线）
│       └── base/profile/main_pages.json 含 inputmethodextensionability/pages/KeyboardPage
├── entry/src/ohosTest/ets/test          23 个测试文件（28 个 describe 套件 / 411 条用例）+ List.test.ets 注册表
├── screenshot                           效果预览截图（真机 720×1280）
├── README.md
└── ohosTest.md                          用例清单、覆盖矩阵、执行步骤与实测结果
```

## 编译与运行

### 获取代码

整仓体积较大，只需要本示例时可以用稀疏检出：

```bash
git clone --filter=blob:none --no-checkout https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout init --cone
git sparse-checkout set code/DocsSample/InputMethod/InputMethodExtension
git checkout master
```

### 构建

用 DevEco Studio 打开本工程，`Build → Build Hap(s)/APP(s) → Build Hap(s)`；命令行等价写法：

```bash
hvigorw --mode module -p module=entry@default -p product=default assembleHap
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap
```

`hvigorw` 用 DevEco Studio 自带的那份（`$DEVECO_SDK_HOME/tools/hvigor/bin`），或在 IDE 的终端里执行。
判定构建成功看输出里的 `BUILD SUCCESSFUL`，不看 exit code（签名 WARN 走 stderr）。

`runtimeOS` 为 `OpenHarmony`，hvigor 走的是旧版 SDK 管理模式：需要本机在 `SDK Manager → OpenHarmony SDK`
里装好 API 26.0.0 一整套，并让它能找到该 SDK 根目录（IDE 里自动识别；命令行设在 `local.properties` 的
`sdk.dir` 或环境变量 `OHOS_BASE_SDK_HOME`，默认位置是 `%LOCALAPPDATA%\OpenHarmony\Sdk`）。缺了会先报
`00303208 Unable to find 'sdk.dir' ...`，指到 DevEco 自带的商用发行版 SDK 则报
`The SDK management mode has changed`——那份是新管理模式，不能拿来编 OpenHarmony 形态。

### 签名

示例仓库不带签名材料，`build-profile.json5` 里也不声明 `signingConfigs`。第一次运行前在
`File → Project Structure → Signing Configs` 勾选 `Automatically generate signature`，IDE 会把本机
签名写进 `build-profile.json5` 的 `signingConfigs` 与 `products[0].signingConfig`；这两个字段属于本机
环境，提交前请还原。

两个容易踩的点：

1. **IDE 只写 `signingConfigs`，不会自动加到 `products[0]`**。缺 `"signingConfig": "default"` 时
   hvigor 照常 `BUILD SUCCESSFUL`、只打一条 `WARN: No signingConfig found for product default`，
   产物仍是 `-unsigned.hap`，很容易误以为已经签了。
2. **换签名后不能直接 `install -r`**：设备上旧包是另一套证书时会报
   `9568332 install sign info inconsistent`，需先卸载本应用再装。

真机命令（单设备）：

```bash
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap

# 日志：domain 0xF811，tag InputMethodExt
hdc shell hilog -x -T InputMethodExt
```

运行测试：在 DevEco Studio 中右键 `entry/src/ohosTest` 选择运行，即执行 `testsuite()` 里登记的全部 411 条
（连跑两轮均 411/411，见 [ohosTest.md](ohosTest.md)）；只跑 UI 冒烟或某个套件时，在对应测试文件的
`describe` 旁点运行。运行配置里不要勾选「安装选项 → 仅测试包」，原因见「已知问题与注意点」第 2 条。
启动 UI：在设备桌面点击本应用图标。

权限：本示例不申请任何权限。系统能力依赖 `SystemCapability.MiscServices.InputMethodFramework`。

## 测试

`entry/src/ohosTest` 共 411 条用例（23 个测试文件 / 28 个 `describe` 套件），编号前缀 `SUB_INPUT_METHOD_`。
用例按“真实代码路径 + 维度矩阵 + 设备真调用 + 空状态 + 页面冒烟”分层，全部 `import` `main/ets` 下的
正式函数，不在用例里重写业务规则；每条用例至少 3 处硬断言，会写共享状态的套件用 `beforeEach` /
`afterEach` 清场。

用例清单、覆盖矩阵、执行步骤与两轮实测结果见 [ohosTest.md](ohosTest.md)。

## 约束与限制

**运行环境**

- 需要支持 IME Kit 的 OpenHarmony 设备，系统能力依赖
  `SystemCapability.MiscServices.InputMethodFramework`；本示例实测于 dayu200（RK3568）/ OpenHarmony 7.1.0.22。
- `compatibleSdkVersion` / `targetSdkVersion` 均为 `26.0.0`；`InputMethodExtraConfig` 自 API 22 引入，
  `InputMethodListDialog` 自 API 11 引入（phone 12+）。低版本设备上对应演示页会返回 801。
- 本示例不申请任何权限。

**功能边界**

- `InputMethodExtensionAbility` 的**真实输入链路**需要本应用先在「设置 → 输入法」里启用、并聚焦真实编辑框，
  系统才会拉起扩展；示例不自动改系统输入法设置，自动化环境也拿不到真实 `InputClient`。
- `inputMethodEngine` 的输入回调（`insertText`、`deleteBackward` 作用于真实编辑框）同理，页面只做本地缓冲的
  键盘预览，不冒充"已上屏"。
- `InputMethodListDialog` 仅系统应用和输入法应用可调用、`patternOptions` 仅系统预置输入法支持（d.ts 写作
  "caller must be the current inputmethod"）。本示例两者都不满足，只见系统输入法列表、不见模式项。
- 示例不做网络请求、不写数据库；三个演示页的结果全部来自本地计算或系统同步接口，可逐条复算。

## 已知问题与注意点

1. **本机 `createPanel` 未校验调用身份（实测）**：文档写的是"只能在 `InputMethodExtensionAbility` 内调用，
   否则抛 12800004"，但在 OpenHarmony 7.1.0.22 上，UIAbility 进程里四种组合都能创建成功。页面与用例按
   双分支写：成功则立即 `destroyPanel` 并如实显示「意外创建成功（销毁成功）」，失败则显示 12800004 与
   处理建议。换设备/版本时以实测为准，不把文档结论写成断言。

2. **IDE 里运行测试不要勾「安装选项 → 仅测试包」**：勾上后 IDE 会先卸载主包、部署时只下
   测试包，结果 4 条设备真调用用例与 13 条 UI 冒烟全部因 `startAbility failed`（主包不存在）失败。

3. **`List.test.ets` 必须用直接调用语句注册套件（实测）**：DevEco 运行测试前会静态扫描该文件，只认
   `xxxTest();` 这种直接调用；改成 `SUITE_MANIFEST` 数组 + `forEach` 的表驱动写法后，IDE 整包跑报
   00502002「在包中未找到任何测试用例」、单文件跑报 00502004，而同一份产物用命令行拉起测试仍能跑。

4. **`PanelFlag` 有两套声明，不可混用**：`@kit.IMEKit` 导出的来自 `@ohos.inputMethod.Panel`，成员是
   `FLAG_FIXED` / `FLAG_FLOATING` / `FLAG_CANDIDATE`；`inputMethodEngine` 命名空间内是
   `FLG_FIXED` / `FLG_FLOATING` / `FLAG_CANDIDATE`。数值相同但类型不同，`createPanel` 必须传后者，
   传前者在编译期就报 `Property 'FLAG_FIXED' does not exist`。

5. **`hapModulesInfo` 需要叠加 `GET_BUNDLE_INFO_WITH_HAP_MODULE`（实测）**：只给
   `GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY` 时 `hapModulesInfo` 为空数组，扩展列表查不到任何条目。
   `BundleInfo` 本身没有 extension 字段，必须 `info.hapModulesInfo → module.extensionAbilitiesInfo`，
   且字段名是 `extensionAbilityType`（不是 `type`）。

6. **错误提示语与状态名是两套文案**：`apiStatusName()` 给出状态名（如「输入法身份不符」），
   `apiStatusHint()` 给出处理建议（如「调用身份不符：createPanel 等接口只能在 … 内调用」），
   页面拼出的是后者，用例断言的也是后者。

7. **键盘缓冲与删除按 Unicode 码点计**：`charCount` / `appendChar` 都走码点计数，`deleteLast` 遇到代理对
   会一次删掉两个 code unit，不会留下半个 emoji。`clampSelected` 会把非法 `defaultSelected` 拉回第 0 项
   以保弹窗有选中态，而官方文档说"超出范围时不选中任何项"，两者语义不同，属本示例的演示取舍。

8. **`ForEach` 的 key 必须带上行内容，不能只用下标**：键盘三行在两种模式下下标都是 0/1/2，早期用
   `row-${index}` 做 key，切到「数字与符号」后 ForEach 认为子组件没变、直接复用旧行，结果模式文案与
   功能键都更新了、三行字符键却还是字母。现改为按行内 `label` 拼 key。

9. **UiTest 单条用例只有 5000ms 预算（实测）**：当前 hypium 的 `it()` 只有三个入参，没有单条超时参数。
   本机实测一次 `inputText` 约 2.2s、一次 `Component.click()` 约 0.7s、一次 `waitForComponent` 命中约
   0.4s，因此一条用例最多只放"一次输入 + 一次点击 + 一次等待"。软键盘弹着时对卡片 `click()` 会卡到超时
   （要先 `pressBack` 收键盘），`Driver.swipe()` 在本机会直接卡死。

10. **签名绑定包名与设备 UDID**：调试 profile 里写死了 `bundle-name` 与 `device-ids`，换包名或换设备
    都要重新出 profile；直接复用别的工程的 `default_*.p7b` 会在安装时报签名校验失败。

11. **`entry@ohosTest` 构建有一条 `'start_window_background' conflict` WARN**：`.test` 中间产物与主资源
    重复声明了同名颜色，属噪音，不影响 `BUILD SUCCESSFUL` 与用例执行。

12. **`deviceTypes` 只能写 OpenHarmony 支持的取值（实测）**：OpenHarmony SDK 的
    `ets/api/device-define` 只有 `default` / `tablet` / `2in1` / `tv` / `wearable` / `liteWearable`，
    **没有 `phone`**（那是商用发行版侧的类型）。`module.json5` 与 `entry/src/ohosTest/module.json5`
    里只要留了 `phone`，`runtimeOS: OpenHarmony` 的构建就会在 `*@SyscapTransform` 上报
    `00303060`「系统能力交集为空」——缺 `phone.json` 的那一项 syscap 集合为空，交集自然为空；
    hvigor 只在 debug 日志里打一行 `The systemCapability set corresponding to the 'phone' is not found`。
    本工程两个 `module.json5` 都只用 `default` / `tablet` / `2in1`，dayu200 实测可安装、411 条全绿。

13. **界面文案统一走 `resources/base/element/string.json`**：页面与组件里不再写字面量，自定义组件属性用
    `ResourceStr`；`Navigation.title` / `NavDestination.title` 只接受 `string`，用
    `CommonWidgets.ets` 里的 `textOfResource()` 取本地化文本。model / utils 层用不了 `$r()`（它要求编译期
    字面量），统一经 `common/L10n.ets` 的 `text(资源名, 参数…)` 在运行时按名取串：模块级常量只存资源名
    （如 `PatternSpec.label`、`FeatureEntry.title`），要展示时再调 `labelText()` / `titleText()`；
    资源管理器由 `EntryAbility.onCreate` 与 `InputMethodService.onCreate` 绑定，ohosTest 在第一个注册的
    套件（`InputMethodData.test.ets`）入口处绑定，未绑定前 `text()` 原样返回资源名，便于第一时间发现初始化遗漏。
    hilog 的 source / tag / detail 一律英文，便于按 `domain 0xF811` + `tag InputMethodExt` 过滤。

## 参考资料

本示例的两个主体接口以 OpenHarmony 官方文档为准，并与本地 SDK 声明逐条对照：

- `@ohos.inputMethod.ExtraConfig`（输入法扩展信息）：
  https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ime-kit/js-apis-inputmethod-extraconfig.md
- `@ohos.inputMethodList`（输入法切换列表控件）：
  https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ime-kit/js-apis-inputmethodlist.md

配套声明的本地路径（`%DEVECO_SDK_HOME%/default/openharmony/ets/api/`）：
`@ohos.inputMethod.ExtraConfig.d.ts`、`@ohos.inputMethodList.d.ets`、`@ohos.inputMethodEngine.d.ts`、
`@ohos.inputMethod.Panel.d.ts`、`@ohos.InputMethodExtensionAbility.d.ts`、`@ohos.inputMethod.d.ts`。

从在线文档核对出来的三条要点，已落到代码注释、页面文案与用例断言里：

| 要点 | 文档原文 | 本示例的处理 |
| --- | --- | --- |
| 值类型 | `CustomValueType = number \| string \| boolean` | `ExtraConfigModel` 只用这三种类型，其余类型在构造阶段就拒绝 |
| 容量 | “信息总长度不超过 32KB”，超时“超出部分不被传递” | 按 JSON 序列化后的 UTF-8 字节计；`32769` 用例报 401 是**本地**写入前拦截，不等于系统会报错 |
| 调用方限制 | inputMethodList “仅系统应用和输入法应用可调用，`patternOptions` 仅系统预置输入法支持” | 页面如实记录：本应用不满足条件，只弹列表、不渲染模式项 |

版本对照：示例 `compatibleSdkVersion` / `targetSdkVersion` 均为 `26.0.0`；
`InputMethodExtraConfig` 自 API 22 引入，`InputMethodListDialog` 自 API 11 引入（phone 12+），
两者在本示例的 SDK 里均已可用。