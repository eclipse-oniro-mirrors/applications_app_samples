# SystemConfig 测试用例归档

## 验证范围

SystemConfig 示例聚焦设备管理层三类能力：定制配置（渠道号获取与状态模型）、情景模式（免打扰与通知状态查询）、设置信息（PIN/NFC/双击设置页打开），并配套 TraceService（hiTraceMeter）、EventService（hiAppEvent）与大量工具、校验、网络权限、设备存储类基础能力。

运行时 ohosTest 覆盖服务层与数据模型的状态流转、工具类计算与格式化的正确性、网络与权限接口的返回契约、页面导航与多服务集成场景，以及校验规则的合法/边界/非法输入。凡依赖具体系统后端（如通知管理 SA）或特定权限的行为，用例采用「成功/失败两分支均确定」的断言方式，不宣称系统必然返回 SUCCESS。

- 测试模块：`entry/src/ohosTest`，测试框架 `@ohos/hypium`，用例以 `describe`/`it`/`expect` 组织。
- 套件与用例规模：**54 个测试文件 / 54 个 describe 套件 / 627 条用例**，覆盖 9 个类别（定制配置、设备与存储、集成组合、情景模式、网络与权限、服务层、设置信息、工具类、校验）。
- 日志：DOMAIN `0xF811`，TAG `[Sample_SystemConfig]`。

## 命名与编号规范

| 项目 | 规则 | 示例 |
| --- | --- | --- |
| `it()` / `@tc.name` | `test<Feature><NNNN>`，后四位从 `0001` 起每条自增 1 | `testUtilsMathUtils0001` |
| `@tc.number` | `SUB_<MODULE>_<SEQ>`，后四位从 `0100` 起每条自增 100，文件内连续、全局唯一 | `SUB_UTILS_MATH_UTILS_0100` |
| 元数据 | 每条用例前含 `@tc.number/@tc.name/@tc.desc/@tc.size/@tc.type/@tc.level` 完整注释块 | — |
| 取值 | `MediumTest` / `Function` / `Level 0`（核心路径）或 `Level 1`（边界、异常、高级场景） | — |

## 测试套件概览

| 测试文件 | 套件名称 | 用例数 | 测试类型 |
|---|---|---:|---|
| ChannelConfigModel.test.ets | ChannelConfigModelTest | 10 | 数据模型测试 |
| ChannelConfigModelExtended.test.ets | ChannelConfigModelExtendedTest | 10 | 模型扩展测试 |
| CustomConfigGetChannelId.test.ets | CustomConfigGetChannelIdTest | 5 | 接口功能测试 |
| CustomConfigPageUI.test.ets | CustomConfigPageUITest | 4 | UI 交互测试 |
| DeviceFileUtils.test.ets | FileUtilsTest | 11 | 工具功能测试 |
| DevicePreferenceUtils.test.ets | PreferenceUtilsTest | 13 | 工具功能测试 |
| DeviceStorageUtils.test.ets | StorageUtilsTest | 11 | 存储工具测试 |
| DeviceUtils.test.ets | DeviceUtilsTest | 9 | 设备信息测试 |
| ErrorHandlingCombination.test.ets | ErrorHandlingCombinationTest | 6 | 异常组合测试 |
| HomeNavigationUI.test.ets | HomeNavigationUITest | 4 | UI 交互测试 |
| MultiServiceIntegration.test.ets | MultiServiceIntegrationTest | 4 | 集成测试 |
| MultiServiceIntegrationExtended.test.ets | IntegrationExtendedTest | 10 | 集成扩展测试 |
| DoNotDisturbModel.test.ets | DoNotDisturbModelTest | 10 | 数据模型测试 |
| DoNotDisturbModelExtended.test.ets | DoNotDisturbModelExtendedTest | 10 | 模型扩展测试 |
| IntelligentSceneDnd.test.ets | IntelligentSceneDndTest | 5 | 接口功能测试 |
| IntelligentScenePageUI.test.ets | IntelligentScenePageUITest | 1 | UI 交互测试 |
| EncryptionUtils.test.ets | EncryptionUtilsTest | 12 | 加密工具测试 |
| HttpUtils.test.ets | HttpUtilsTest | 35 | 网络请求测试 |
| NetworkUtils.test.ets | NetworkUtilsTest | 42 | 网络状态测试 |
| PermissionUtils.test.ets | PermissionUtilsTest | 34 | 权限测试 |
| CustomConfigService.test.ets | CustomConfigServiceTest | 6 | 服务功能测试 |
| CustomConfigServiceExtended.test.ets | CustomConfigServiceExtendedTest | 15 | 服务扩展测试 |
| EventService.test.ets | EventServiceTest | 6 | 服务功能测试 |
| EventServiceExtended.test.ets | EventServiceExtendedTest | 21 | 服务扩展测试 |
| HistoryClearTest.test.ets | HistoryClearTest | 5 | 服务功能测试 |
| IntelligentSceneService.test.ets | IntelligentSceneServiceTest | 15 | 服务功能测试 |
| IntelligentSceneServiceExtended.test.ets | IntelligentSceneServiceExtendedTest | 5 | 服务扩展测试 |
| SettingsLiteService.test.ets | SettingsLiteServiceTest | 14 | 服务功能测试 |
| SettingsLiteServiceExtended.test.ets | SettingsLiteServiceExtendedTest | 16 | 服务扩展测试 |
| SettingsLiteServiceOperation.test.ets | SettingsLiteServiceOperationTest | 7 | 服务操作测试 |
| TraceService.test.ets | TraceServiceTest | 5 | 服务功能测试 |
| TraceServiceExtended.test.ets | TraceServiceExtendedTest | 10 | 服务扩展测试 |
| SettingsItemModel.test.ets | SettingsItemModelTest | 10 | 数据模型测试 |
| SettingsItemModelExtended.test.ets | SettingsItemModelExtendedTest | 9 | 模型扩展测试 |
| SettingsLiteDoubleClick.test.ets | SettingsLiteDoubleClickTest | 3 | 设置操作测试 |
| SettingsLiteNfcSetting.test.ets | SettingsLiteNfcSettingTest | 3 | 设置操作测试 |
| SettingsLitePageUI.test.ets | SettingsLitePageUITest | 3 | UI 交互测试 |
| SettingsLitePinSetting.test.ets | SettingsLitePinSettingTest | 3 | 设置操作测试 |
| UtilsBoundaryValue.test.ets | BoundaryValueTest | 25 | 边界值测试 |
| UtilsCommonUtils.test.ets | UtilsCommonUtilsTest | 10 | 工具功能测试 |
| UtilsConstants.test.ets | ConstantsTest | 15 | 常量验证测试 |
| UtilsDateUtils.test.ets | UtilsDateUtilsTest | 11 | 工具功能测试 |
| UtilsFormatUtils.test.ets | UtilsFormatUtilsTest | 11 | 工具功能测试 |
| UtilsLogger.test.ets | LoggerTest | 15 | 日志工具测试 |
| UtilsMathUtils.test.ets | UtilsMathUtilsTest | 13 | 工具功能测试 |
| UtilsRandomUtils.test.ets | RandomUtilsTest | 18 | 随机数测试 |
| UtilsStringUtils.test.ets | UtilsStringUtilsTest | 13 | 工具功能测试 |
| UtilsTypeUtils.test.ets | UtilsTypeUtilsTest | 14 | 工具功能测试 |
| ValidationChannelId.test.ets | ValidateChannelIdTest | 7 | 校验测试 |
| ValidationClipboardUtils.test.ets | ClipboardUtilsTest | 17 | 剪贴板测试 |
| ValidationDeviceId.test.ets | ValidateDeviceIdTest | 8 | 校验测试 |
| ValidationFormValidator.test.ets | FormValidatorTest | 17 | 校验测试 |
| ValidationUtilsComprehensive.test.ets | ValidationUtilsComprehensiveTest | 15 | 综合校验测试 |
| ValidationUtilsMethods.test.ets | ValidationUtilsMethodsTest | 16 | 校验测试 |
| **合计** | **54 个测试文件（54 个 describe）** | **627** | - |

## ChannelConfigModelTest XTS 用例

分类：定制配置。测试文件：`entry/src/ohosTest/ets/test/CustomConfig/ChannelConfigModel.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testChannelConfigModel0001 | 正向用例：默认构造后各字段为初始值 | 默认构造后各字段为初始值 | 通过 |
| testChannelConfigModel0002 | 正向用例：调用 markSuccess 后状态变为 SUCCESS，渠道号更新，获取次数加一 | 调用 markSuccess 后状态变为 SUCCESS，渠道号更新，获取次数加一 | 通过 |
| testChannelConfigModel0003 | 正向用例：调用 markFailed 后状态变为 FAILED，错误信息正确记录 | 调用 markFailed 后状态变为 FAILED，错误信息正确记录 | 通过 |
| testChannelConfigModel0004 | 正向用例：调用 markLoading 后状态变为 LOADING，错误信息清空 | 调用 markLoading 后状态变为 LOADING，错误信息清空 | 通过 |
| testChannelConfigModel0005 | 正向用例：markSuccess 后 isSuccess 返回 true，其他状态返回 false | markSuccess 后 isSuccess 返回 true，其他状态返回 false | 通过 |
| testChannelConfigModel0006 | 正向用例：reset 后所有字段恢复为初始值 | reset 后所有字段恢复为初始值 | 通过 |
| testChannelConfigModel0007 | 正向用例：toJSON 返回包含全部字段的对象 | toJSON 返回包含全部字段的对象 | 通过 |
| testChannelConfigModel0008 | 正向用例：toString 返回包含模型信息的非空字符串 | toString 返回包含模型信息的非空字符串 | 通过 |
| testChannelConfigModel0009 | 正向用例：多次 markSuccess 和 markFailed 后 fetchCount 累加正确 | 多次 markSuccess 和 markFailed 后 fetchCount 累加正确 | 通过 |
| testChannelConfigModel0010 | 边界用例：未获取过时间差返回 -1，markSuccess 后状态与渠道号同步更新且时间差落在调用区间内 | 未获取过时间差返回 -1，markSuccess 后状态与渠道号同步更新且时间差落在调用区间内 | 通过 |

## ChannelConfigModelExtendedTest XTS 用例

分类：定制配置。测试文件：`entry/src/ohosTest/ets/test/CustomConfig/ChannelConfigModelExtended.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testChannelConfigModelExtended0001 | 正向: UNINITIALIZED → LOADING → SUCCESS 完整流转 | UNINITIALIZED → LOADING → SUCCESS 完整流转 | 通过 |
| testChannelConfigModelExtended0002 | 正向: UNINITIALIZED → LOADING → FAILED → reset 异常流转 | UNINITIALIZED → LOADING → FAILED → reset 异常流转 | 通过 |
| testChannelConfigModelExtended0003 | 正向: toJSON 序列化后字段完整且值一致 | toJSON 序列化后字段完整且值一致 | 通过 |
| testChannelConfigModelExtended0004 | 正向: 多次 markSuccess 后 fetchCount 累加 | 多次 markSuccess 后 fetchCount 累加 | 通过 |
| testChannelConfigModelExtended0005 | 正向: 未获取返回 -1，获取后返回非负时间差 | 未获取返回 -1，获取后返回非负时间差 | 通过 |
| testChannelConfigModelExtended0006 | 边界: reset 后 getTimeSinceLastFetch 恢复为 -1 | reset 后 getTimeSinceLastFetch 恢复为 -1 | 通过 |
| testChannelConfigModelExtended0007 | 正向: toString 输出包含关键字段 | toString 输出包含关键字段 | 通过 |
| testChannelConfigModelExtended0008 | 边界: SUCCESS 状态但 channelId 为空时 isSuccess 返回 false | SUCCESS 状态但 channelId 为空时 isSuccess 返回 false | 通过 |
| testChannelConfigModelExtended0009 | 正向: markLoading 清除之前的错误信息 | markLoading 清除之前的错误信息 | 通过 |
| testChannelConfigModelExtended0010 | 正向: 默认构造后所有查询方法返回正确初始值 | 默认构造后所有查询方法返回正确初始值 | 通过 |

## CustomConfigGetChannelIdTest XTS 用例

分类：定制配置。测试文件：`entry/src/ohosTest/ets/test/CustomConfig/CustomConfigGetChannelId.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testCustomConfigGetChannelId0001 | 正向用例：获取渠道号后返回值、状态和模型保持一致 | 获取渠道号后返回值、状态和模型保持一致 | 通过 |
| testCustomConfigGetChannelId0002 | 正向用例：按设备实际渠道号核对成功或失败模型 | 按设备实际渠道号核对成功或失败模型 | 通过 |
| testCustomConfigGetChannelId0003 | 正向用例：多次调用 getChannelId 返回一致结果 | 多次调用 getChannelId 返回一致结果 | 通过 |
| testCustomConfigGetChannelId0004 | 反向用例：重置后清空模型并在重新初始化后一致获取 | 重置后清空模型并在重新初始化后一致获取 | 通过 |
| testCustomConfigGetChannelId0005 | 反向用例：未初始化服务获取渠道号后模型一致且初始化标志不变 | 未初始化服务获取渠道号后模型一致且初始化标志不变 | 通过 |

## CustomConfigPageUITest XTS 用例

分类：定制配置。测试文件：`entry/src/ohosTest/ets/test/CustomConfig/CustomConfigPageUI.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testCustomConfigPageUI0001 | Verify initial custom config values actions and initialization log. | Verify initial custom config values actions and initialization log. | 通过 |
| testCustomConfigPageUI0002 | Verify channel status badge and result log both match the detail model. | Verify channel status badge and result log both match the detail model. | 通过 |
| testCustomConfigPageUI0003 | Verify detail JSON channel and status match page results. | Verify detail JSON channel and status match page results. | 通过 |
| testCustomConfigPageUI0004 | Verify reset clears prior channel details and operation logs. | Verify reset clears prior channel details and operation logs. | 通过 |

## FileUtilsTest XTS 用例

分类：设备与存储。测试文件：`entry/src/ohosTest/ets/test/Device/DeviceFileUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testDeviceFileUtils0001 | 正向: 从文件名提取扩展名（小写） | 从文件名提取扩展名（小写） | 通过 |
| testDeviceFileUtils0002 | 正向: 从路径中提取文件名 | 从路径中提取文件名 | 通过 |
| testDeviceFileUtils0003 | 正向: 各数量级文件大小格式化正确 | 各数量级文件大小格式化正确 | 通过 |
| testDeviceFileUtils0004 | 正向: isImageFile 识别图片扩展名 | isImageFile 识别图片扩展名 | 通过 |
| testDeviceFileUtils0005 | 正向: isDocumentFile 识别文档扩展名 | isDocumentFile 识别文档扩展名 | 通过 |
| testDeviceFileUtils0006 | 正向: isAudioFile 识别音频扩展名 | isAudioFile 识别音频扩展名 | 通过 |
| testDeviceFileUtils0007 | 正向: isVideoFile 识别视频扩展名 | isVideoFile 识别视频扩展名 | 通过 |
| testDeviceFileUtils0008 | 正向: 已知扩展名返回正确 MIME 类型 | 已知扩展名返回正确 MIME 类型 | 通过 |
| testDeviceFileUtils0009 | 正向: 清理非法字符并保留安全文件名 | 清理非法字符并保留安全文件名 | 通过 |
| testDeviceFileUtils0010 | 正向: 生成临时文件名包含前缀和 .tmp 后缀 | 生成临时文件名包含前缀和 .tmp 后缀 | 通过 |
| testDeviceFileUtils0011 | 正向: 各类型扩展名返回正确的中文描述 | 各类型扩展名返回正确的中文描述 | 通过 |

## PreferenceUtilsTest XTS 用例

分类：设备与存储。测试文件：`entry/src/ohosTest/ets/test/Device/DevicePreferenceUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testDevicePreferenceUtils0001 | 正向: 构造后 getStoreName 返回正确名称 | 构造后 getStoreName 返回正确名称 | 通过 |
| testDevicePreferenceUtils0002 | 正向: set 后 get 返回正确值 | set 后 get 返回正确值 | 通过 |
| testDevicePreferenceUtils0003 | 边界: 获取不存在的键返回 null | 获取不存在的键返回 null | 通过 |
| testDevicePreferenceUtils0004 | 正向: 键存在返回值，不存在返回默认值 | 键存在返回值，不存在返回默认值 | 通过 |
| testDevicePreferenceUtils0005 | 正向: remove 后键不存在 | remove 后键不存在 | 通过 |
| testDevicePreferenceUtils0006 | 正向: clear 后所有数据清空 | clear 后所有数据清空 | 通过 |
| testDevicePreferenceUtils0007 | 正向: keys 返回所有键，getAll 返回副本 | keys 返回所有键，getAll 返回副本 | 通过 |
| testDevicePreferenceUtils0008 | 正向: 重复 set 同一键覆盖旧值 | 重复 set 同一键覆盖旧值 | 通过 |
| testDevicePreferenceUtils0009 | 正向: set/remove 触发 onChanged 回调 | set/remove 触发 onChanged 回调 | 通过 |
| testDevicePreferenceUtils0010 | 正向: clear 触发 onCleared 回调 | clear 触发 onCleared 回调 | 通过 |
| testDevicePreferenceUtils0011 | 正向: 移除监听器后不再收到回调 | 移除监听器后不再收到回调 | 通过 |
| testDevicePreferenceUtils0012 | 边界: 重复添加同一监听器只注册一次 | 重复添加同一监听器只注册一次 | 通过 |
| testDevicePreferenceUtils0013 | 正向: destroy 后数据清空、get 返回 null | destroy 后数据清空、get 返回 null | 通过 |

## StorageUtilsTest XTS 用例

分类：设备与存储。测试文件：`entry/src/ohosTest/ets/test/Device/DeviceStorageUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testDeviceStorageUtils0001 | 正向: 各数量级字节数格式化为可读字符串 | 各数量级字节数格式化为可读字符串 | 通过 |
| testDeviceStorageUtils0002 | 正向: 解析各存储单位字符串为字节数 | 解析各存储单位字符串为字节数 | 通过 |
| testDeviceStorageUtils0003 | 正向: 简写单位 K/M/G/T 也能正确解析 | 简写单位 K/M/G/T 也能正确解析 | 通过 |
| testDeviceStorageUtils0004 | 正向: 计算可用空间百分比 | 计算可用空间百分比 | 通过 |
| testDeviceStorageUtils0005 | 边界: isStorageLow 基于可用/总量比例判定，非法输入返回 false | isStorageLow 基于可用/总量比例判定，非法输入返回 false | 通过 |
| testDeviceStorageUtils0006 | 正向: 各比例对应正确的存储级别 | 各比例对应正确的存储级别 | 通过 |
| testDeviceStorageUtils0007 | 正向: estimateFreeSpace 返回总容量的 35% | estimateFreeSpace 返回总容量的 35% | 通过 |
| testDeviceStorageUtils0008 | 正向: 计算使用百分比 | 计算使用百分比 | 通过 |
| testDeviceStorageUtils0009 | 正向: getStorageSummary 返回包含关键信息的摘要 | getStorageSummary 返回包含关键信息的摘要 | 通过 |
| testDeviceStorageUtils0010 | 边界: 零总容量时摘要不崩溃 | 零总容量时摘要不崩溃 | 通过 |
| testDeviceStorageUtils0011 | 正向: format 后 parse 能还原原始字节数 | format 后 parse 能还原原始字节数 | 通过 |

## DeviceUtilsTest XTS 用例

分类：设备与存储。测试文件：`entry/src/ohosTest/ets/test/Device/DeviceUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testDeviceUtils0001 | 正向: 返回非空字符串 | 返回非空字符串 | 通过 |
| testDeviceUtils0002 | 正向: 屏幕尺寸为正数 | 屏幕尺寸为正数 | 通过 |
| testDeviceUtils0003 | 正向: 设置屏幕尺寸后可获取 | 设置屏幕尺寸后可获取 | 通过 |
| testDeviceUtils0004 | 正向: 默认尺寸下为竖屏 | 默认尺寸下为竖屏 | 通过 |
| testDeviceUtils0005 | 正向: 返回非空字符串 | 返回非空字符串 | 通过 |
| testDeviceUtils0006 | 正向: 返回非空字符串 | 返回非空字符串 | 通过 |
| testDeviceUtils0007 | 正向: 返回正整数 | 返回正整数 | 通过 |
| testDeviceUtils0008 | 正向: 返回非空字符串 | 返回非空字符串 | 通过 |
| testDeviceUtils0009 | 正向: 清除缓存后重新获取设备类型 | 清除缓存后重新获取设备类型 | 通过 |

## ErrorHandlingCombinationTest XTS 用例

分类：集成组合。测试文件：`entry/src/ohosTest/ets/test/Integration/ErrorHandlingCombination.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testErrorHandlingCombination0001 | 反向: 未初始化服务调用 getChannelId 不抛异常 | 未初始化服务调用 getChannelId 不抛异常 | 通过 |
| testErrorHandlingCombination0002 | 反向: 多次销毁不抛异常且每次均重建渠道模型为初始状态 | 多次销毁不抛异常且每次均重建渠道模型为初始状态 | 通过 |
| testErrorHandlingCombination0003 | 反向: 未初始化 EventService 上报事件不抛异常且事件正确写入历史与统计 | 未初始化 EventService 上报事件不抛异常且事件正确写入历史与统计 | 通过 |
| testErrorHandlingCombination0004 | 反向: 禁用追踪后操作不报错 | 禁用追踪后操作不报错 | 通过 |
| testErrorHandlingCombination0005 | 反向: 销毁后重置可重新初始化 | 销毁后重置可重新初始化 | 通过 |
| testErrorHandlingCombination0006 | 反向: 获取渠道号后检查状态一致性 | 获取渠道号后检查状态一致性 | 通过 |

## HomeNavigationUITest XTS 用例

分类：集成组合。测试文件：`entry/src/ohosTest/ets/test/Integration/HomeNavigationUI.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testHomeNavigationUI0001 | Verify home application information and three feature entries. | Verify home application information and three feature entries. | 通过 |
| testHomeNavigationUI0002 | Verify custom config navigation and home restoration. | Verify custom config navigation and home restoration. | 通过 |
| testHomeNavigationUI0003 | Verify intelligent scene navigation and home restoration. | Verify intelligent scene navigation and home restoration. | 通过 |
| testHomeNavigationUI0004 | Verify settings lite navigation and home restoration. | Verify settings lite navigation and home restoration. | 通过 |

## MultiServiceIntegrationTest XTS 用例

分类：集成组合。测试文件：`entry/src/ohosTest/ets/test/Integration/MultiServiceIntegration.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testMultiServiceIntegration0001 | 正向: 三个服务均可初始化 | 三个服务均可初始化 | 通过 |
| testMultiServiceIntegration0002 | 正向: 获取渠道号 + 追踪 + 事件上报 | 获取渠道号 + 追踪 + 事件上报 | 通过 |
| testMultiServiceIntegration0003 | 正向: 按顺序销毁服务不影响其他服务 | 按顺序销毁服务不影响其他服务 | 通过 |
| testMultiServiceIntegration0004 | 正向: 多个追踪并行，计数正确 | 多个追踪并行，计数正确 | 通过 |

## IntegrationExtendedTest XTS 用例

分类：集成组合。测试文件：`entry/src/ohosTest/ets/test/Integration/MultiServiceIntegrationExtended.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testMultiServiceIntegrationExtended0001 | 正向: EventService 上报事件后历史计数增加 | EventService 上报事件后历史计数增加 | 通过 |
| testMultiServiceIntegrationExtended0002 | 正向: 追踪完成后上报事件，两者互不干扰 | 追踪完成后上报事件，两者互不干扰 | 通过 |
| testMultiServiceIntegrationExtended0003 | 正向: 多个 EventService 实例历史互不影响 | 多个 EventService 实例历史互不影响 | 通过 |
| testMultiServiceIntegrationExtended0004 | 边界: 先追踪后初始化服务，追踪仍生效 | 先追踪后初始化服务，追踪仍生效 | 通过 |
| testMultiServiceIntegrationExtended0005 | 正向: CustomConfigService 状态变更后上报事件 | CustomConfigService 状态变更后上报事件 | 通过 |
| testMultiServiceIntegrationExtended0006 | 正向: 多次 start/finish 循环，计数始终正确 | 多次 start/finish 循环，计数始终正确 | 通过 |
| testMultiServiceIntegrationExtended0007 | 正向: 清空历史后重新上报，计数从 0 开始 | 清空历史后重新上报，计数从 0 开始 | 通过 |
| testMultiServiceIntegrationExtended0008 | 边界: 销毁后调用查询方法不崩溃 | 销毁后调用查询方法不崩溃 | 通过 |
| testMultiServiceIntegrationExtended0009 | 正向: 并行追踪多个不同 TraceName，计数独立累加 | 并行追踪多个不同 TraceName，计数独立累加 | 通过 |
| testMultiServiceIntegrationExtended0010 | 综合: 三服务协同操作，各自状态正确 | 三服务协同操作，各自状态正确 | 通过 |

## DoNotDisturbModelTest XTS 用例

分类：情景模式。测试文件：`entry/src/ohosTest/ets/test/IntelligentScene/DoNotDisturbModel.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testDoNotDisturbModel0001 | 正向用例：默认构造后各字段为初始值 | 默认构造后各字段为初始值 | 通过 |
| testDoNotDisturbModel0002 | 正向用例：调用 markSuccess 后状态变为 SUCCESS，查询次数加一 | 调用 markSuccess 后状态变为 SUCCESS，查询次数加一 | 通过 |
| testDoNotDisturbModel0003 | 正向用例：调用 markFailed 后状态变为 FAILED，错误信息正确记录 | 调用 markFailed 后状态变为 FAILED，错误信息正确记录 | 通过 |
| testDoNotDisturbModel0004 | 正向用例：调用 markQuerying 后状态变为 QUERYING，错误信息清空 | 调用 markQuerying 后状态变为 QUERYING，错误信息清空 | 通过 |
| testDoNotDisturbModel0005 | 正向用例：调用 updateDndState 更新免打扰启用状态和时间戳 | 调用 updateDndState 更新免打扰启用状态和时间戳 | 通过 |
| testDoNotDisturbModel0006 | 正向用例：调用 updateNotifyState 更新通知允许状态和时间戳 | 调用 updateNotifyState 更新通知允许状态和时间戳 | 通过 |
| testDoNotDisturbModel0007 | 正向用例：isDndActive 仅在 SUCCESS 且免打扰启用时返回 true | isDndActive 仅在 SUCCESS 且免打扰启用时返回 true | 通过 |
| testDoNotDisturbModel0008 | 正向用例：canNotify 仅在 SUCCESS 且通知允许时返回 true | canNotify 仅在 SUCCESS 且通知允许时返回 true | 通过 |
| testDoNotDisturbModel0009 | 正向用例：reset 后所有字段恢复为初始值 | reset 后所有字段恢复为初始值 | 通过 |
| testDoNotDisturbModel0010 | 正向用例：toJSON 返回包含全部字段的对象 | toJSON 返回包含全部字段的对象 | 通过 |

## DoNotDisturbModelExtendedTest XTS 用例

分类：情景模式。测试文件：`entry/src/ohosTest/ets/test/IntelligentScene/DoNotDisturbModelExtended.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testDoNotDisturbModelExtended0001 | 正向: 各状态下 isReady 仅 SUCCESS 返回 true | 各状态下 isReady 仅 SUCCESS 返回 true | 通过 |
| testDoNotDisturbModelExtended0002 | 正向: 未查询返回 -1，查询后返回非负时间差 | 未查询返回 -1，查询后返回非负时间差 | 通过 |
| testDoNotDisturbModelExtended0003 | 边界: reset 后 getTimeSinceLastQuery 恢复为 -1 | reset 后 getTimeSinceLastQuery 恢复为 -1 | 通过 |
| testDoNotDisturbModelExtended0004 | 正向: toString 输出包含关键字段 | toString 输出包含关键字段 | 通过 |
| testDoNotDisturbModelExtended0005 | 正向: IDLE → QUERYING → SUCCESS → reset → IDLE 完整流转 | IDLE → QUERYING → SUCCESS → reset → IDLE 完整流转 | 通过 |
| testDoNotDisturbModelExtended0006 | 正向: IDLE → QUERYING → FAILED → reset → IDLE 异常流转 | IDLE → QUERYING → FAILED → reset → IDLE 异常流转 | 通过 |
| testDoNotDisturbModelExtended0007 | 正向: toJSON 序列化后字段完整且值一致 | toJSON 序列化后字段完整且值一致 | 通过 |
| testDoNotDisturbModelExtended0008 | 正向: 多次 markFailed 后 queryCount 累加 | 多次 markFailed 后 queryCount 累加 | 通过 |
| testDoNotDisturbModelExtended0009 | 正向: markSuccess 后通过 updateDndState/updateNotifyState 单独更新 | markSuccess 后通过 updateDndState/updateNotifyState 单独更新 | 通过 |
| testDoNotDisturbModelExtended0010 | 正向: 带参数构造后状态和查询方法正确 | 带参数构造后状态和查询方法正确 | 通过 |

## IntelligentSceneDndTest XTS 用例

分类：情景模式。测试文件：`entry/src/ohosTest/ets/test/IntelligentScene/IntelligentSceneDnd.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testIntelligentSceneDnd0001 | Query DND enabled state once and verify model bookkeeping. | Query DND enabled state once and verify model bookkeeping. | 通过 |
| testIntelligentSceneDnd0002 | Query notify allowed state and verify DND field is untouched. | Query notify allowed state and verify DND field is untouched. | 通过 |
| testIntelligentSceneDnd0003 | Query all DND states once and verify the returned live model counts. | Query all DND states once and verify the returned live model counts. | 通过 |
| testIntelligentSceneDnd0004 | Reset and re-initialize the service, then verify field defaults and model instance replacement. | Reset and re-initialize the service, then verify field defaults and model instance replacement. | 通过 |
| testIntelligentSceneDnd0005 | Query DND state without initializing and verify service stays uninitialized. | Query DND state without initializing and verify service stays uninitialized. | 通过 |

## IntelligentScenePageUITest XTS 用例

分类：情景模式。测试文件：`entry/src/ohosTest/ets/test/IntelligentScene/IntelligentScenePageUI.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testIntelligentScenePageUI0001 | Verify initial scene values and initialization log. | Verify initial scene values and initialization log. | 通过 |

## EncryptionUtilsTest XTS 用例

分类：网络与权限。测试文件：`entry/src/ohosTest/ets/test/Network/EncryptionUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testEncryptionUtils0001 | 正向: Base64 编码后解码还原 | Base64 编码后解码还原 | 通过 |
| testEncryptionUtils0002 | 正向: 空字符串编解码 | 空字符串编解码 | 通过 |
| testEncryptionUtils0003 | 正向: MD5 哈希返回 32 位十六进制 | MD5 哈希返回 32 位十六进制 | 通过 |
| testEncryptionUtils0004 | 正向: 相同输入 MD5 一致 | 相同输入 MD5 一致 | 通过 |
| testEncryptionUtils0005 | 正向: SHA-256 哈希返回 64 位十六进制 | SHA-256 哈希返回 64 位十六进制 | 通过 |
| testEncryptionUtils0006 | 正向: 凯撒加密后解密还原 | 凯撒加密后解密还原 | 通过 |
| testEncryptionUtils0007 | 正向: 生成指定长度 Nonce | 生成指定长度 Nonce | 通过 |
| testEncryptionUtils0008 | 正向: 生成 64 位 Token | 生成 64 位 Token | 通过 |
| testEncryptionUtils0009 | 正向: 十六进制转字节再转回 | 十六进制转字节再转回 | 通过 |
| testEncryptionUtils0010 | 正向: 不同输入产生不同 MD5 | 不同输入产生不同 MD5 | 通过 |
| testEncryptionUtils0011 | 正向: MD5 结果匹配标准测试向量（真实算法校验） | MD5 结果匹配标准测试向量（真实算法校验） | 通过 |
| testEncryptionUtils0012 | 正向: SHA-256 结果匹配标准测试向量（真实算法校验） | SHA-256 结果匹配标准测试向量（真实算法校验） | 通过 |

## HttpUtilsTest XTS 用例

分类：网络与权限。测试文件：`entry/src/ohosTest/ets/test/Network/HttpUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testHttpUtils0001 | 正向: URL 构建 - 无参数时返回 base URL | URL 构建 - 无参数时返回 base URL | 通过 |
| testHttpUtils0002 | 正向: URL 构建 - 单参数拼接 | URL 构建 - 单参数拼接 | 通过 |
| testHttpUtils0003 | 正向: URL 构建 - 多参数拼接 | URL 构建 - 多参数拼接 | 通过 |
| testHttpUtils0004 | 正向: URL 构建 - base 已有问号时使用 & 连接 | URL 构建 - base 已有问号时使用 & 连接 | 通过 |
| testHttpUtils0005 | 正向: URL 构建 - 特殊字符 URL 编码 | URL 构建 - 特殊字符 URL 编码 | 通过 |
| testHttpUtils0006 | 正向: 解析查询串 - 标准格式 | 解析查询串 - 标准格式 | 通过 |
| testHttpUtils0007 | 正向: 解析查询串 - 无前缀 ? | 解析查询串 - 无前缀 ? | 通过 |
| testHttpUtils0008 | 正向: 解析查询串 - 空值处理 | 解析查询串 - 空值处理 | 通过 |
| testHttpUtils0009 | 正向: 解析查询串 - 仅键无等号 | 解析查询串 - 仅键无等号 | 通过 |
| testHttpUtils0010 | 正向: 解析查询串 - URL 编码解码 | 解析查询串 - URL 编码解码 | 通过 |
| testHttpUtils0011 | 边界: 解析空查询串 | 解析空查询串 | 通过 |
| testHttpUtils0012 | 正向: 默认配置 - 结构完整性 | 默认配置 - 结构完整性 | 通过 |
| testHttpUtils0013 | 正向: 默认配置 - Content-Type 正确 | 默认配置 - Content-Type 正确 | 通过 |
| testHttpUtils0014 | 正向: 默认配置 - 超时值等于常量 | 默认配置 - 超时值等于常量 | 通过 |
| testHttpUtils0015 | 正向: 默认配置 - User-Agent 设置 | 默认配置 - User-Agent 设置 | 通过 |
| testHttpUtils0016 | 正向: 成功状态 - 200 OK | 成功状态 - 200 OK | 通过 |
| testHttpUtils0017 | 正向: 成功状态 - 2xx 范围 | 成功状态 - 2xx 范围 | 通过 |
| testHttpUtils0018 | 边界: 成功状态 - 300 边界 | 成功状态 - 300 边界 | 通过 |
| testHttpUtils0019 | 边界: 成功状态 - 199 边界 | 成功状态 - 199 边界 | 通过 |
| testHttpUtils0020 | 正向: 客户端错误 - 4xx 范围 | 客户端错误 - 4xx 范围 | 通过 |
| testHttpUtils0021 | 正向: 客户端错误 - 4xx 上界 | 客户端错误 - 4xx 上界 | 通过 |
| testHttpUtils0022 | 边界: 客户端错误 - 399 下界 | 客户端错误 - 399 下界 | 通过 |
| testHttpUtils0023 | 边界: 客户端错误 - 500 上界 | 客户端错误 - 500 上界 | 通过 |
| testHttpUtils0024 | 正向: 服务器错误 - 5xx 范围 | 服务器错误 - 5xx 范围 | 通过 |
| testHttpUtils0025 | 正向: 服务器错误 - 5xx 上界 | 服务器错误 - 5xx 上界 | 通过 |
| testHttpUtils0026 | 边界: 服务器错误 - 499 下界 | 服务器错误 - 499 下界 | 通过 |
| testHttpUtils0027 | 边界: 服务器错误 - 600 上界 | 服务器错误 - 600 上界 | 通过 |
| testHttpUtils0028 | 正向: 状态文本 - 已知状态 200 | 状态文本 - 已知状态 200 | 通过 |
| testHttpUtils0029 | 正向: 状态文本 - 已知状态 3xx/4xx | 状态文本 - 已知状态 3xx/4xx | 通过 |
| testHttpUtils0030 | 正向: 状态文本 - 已知状态 4xx/5xx | 状态文本 - 已知状态 4xx/5xx | 通过 |
| testHttpUtils0031 | 正向: 状态文本 - 已知状态 5xx | 状态文本 - 已知状态 5xx | 通过 |
| testHttpUtils0032 | 边界: 状态文本 - 未知状态 | 状态文本 - 未知状态 | 通过 |
| testHttpUtils0033 | 正向: HTTP 方法枚举值验证 | HTTP 方法枚举值验证 | 通过 |
| testHttpUtils0034 | 正向: URL 构建后解析往返一致性 | URL 构建后解析往返一致性 | 通过 |
| testHttpUtils0035 | 正向: 状态码判断全覆盖 | 状态码判断全覆盖 | 通过 |

## NetworkUtilsTest XTS 用例

分类：网络与权限。测试文件：`entry/src/ohosTest/ets/test/Network/NetworkUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testNetworkUtils0001 | 正向: 类型标签 - WIFI 返回 "Wi-Fi" | 类型标签 - WIFI 返回 "Wi-Fi" | 通过 |
| testNetworkUtils0002 | 正向: 类型标签 - CELLULAR 返回 "蜂窝网络" | 类型标签 - CELLULAR 返回 "蜂窝网络" | 通过 |
| testNetworkUtils0003 | 正向: 类型标签 - ETHERNET 返回 "以太网" | 类型标签 - ETHERNET 返回 "以太网" | 通过 |
| testNetworkUtils0004 | 正向: 类型标签 - BLUETOOTH 返回 "蓝牙" | 类型标签 - BLUETOOTH 返回 "蓝牙" | 通过 |
| testNetworkUtils0005 | 正向: 类型标签 - UNKNOWN 返回 "未知网络" | 类型标签 - UNKNOWN 返回 "未知网络" | 通过 |
| testNetworkUtils0006 | 正向: 状态标签 - CONNECTED 返回 "已连接" | 状态标签 - CONNECTED 返回 "已连接" | 通过 |
| testNetworkUtils0007 | 正向: 状态标签 - DISCONNECTED 返回 "已断开" | 状态标签 - DISCONNECTED 返回 "已断开" | 通过 |
| testNetworkUtils0008 | 正向: 状态标签 - CONNECTING 返回 "连接中" | 状态标签 - CONNECTING 返回 "连接中" | 通过 |
| testNetworkUtils0009 | 正向: 状态标签 - SUSPENDED 返回 "已暂停" | 状态标签 - SUSPENDED 返回 "已暂停" | 通过 |
| testNetworkUtils0010 | 正向: 连接判断 - CONNECTED 返回 true | 连接判断 - CONNECTED 返回 true | 通过 |
| testNetworkUtils0011 | 正向: 连接判断 - DISCONNECTED 返回 false | 连接判断 - DISCONNECTED 返回 false | 通过 |
| testNetworkUtils0012 | 正向: 连接判断 - CONNECTING 返回 false | 连接判断 - CONNECTING 返回 false | 通过 |
| testNetworkUtils0013 | 正向: 可用性 - CONNECTED 返回 true | 可用性 - CONNECTED 返回 true | 通过 |
| testNetworkUtils0014 | 正向: 可用性 - CONNECTING 返回 true | 可用性 - CONNECTING 返回 true | 通过 |
| testNetworkUtils0015 | 正向: 可用性 - DISCONNECTED 返回 false | 可用性 - DISCONNECTED 返回 false | 通过 |
| testNetworkUtils0016 | 正向: 可用性 - SUSPENDED 返回 false | 可用性 - SUSPENDED 返回 false | 通过 |
| testNetworkUtils0017 | 正向: 高带宽 - WIFI 返回 true | 高带宽 - WIFI 返回 true | 通过 |
| testNetworkUtils0018 | 正向: 高带宽 - ETHERNET 返回 true | 高带宽 - ETHERNET 返回 true | 通过 |
| testNetworkUtils0019 | 正向: 高带宽 - CELLULAR 返回 false | 高带宽 - CELLULAR 返回 false | 通过 |
| testNetworkUtils0020 | 正向: 高带宽 - BLUETOOTH 返回 false | 高带宽 - BLUETOOTH 返回 false | 通过 |
| testNetworkUtils0021 | 正向: 信号等级 - 极好 (rssi >= -50) | 信号等级 - 极好 (rssi >= -50) | 通过 |
| testNetworkUtils0022 | 正向: 信号等级 - 好 (-60 <= rssi < -50) | 信号等级 - 好 (-60 <= rssi < -50) | 通过 |
| testNetworkUtils0023 | 正向: 信号等级 - 一般 (-70 <= rssi < -60) | 信号等级 - 一般 (-70 <= rssi < -60) | 通过 |
| testNetworkUtils0024 | 正向: 信号等级 - 差 (-80 <= rssi < -70) | 信号等级 - 差 (-80 <= rssi < -70) | 通过 |
| testNetworkUtils0025 | 正向: 信号等级 - 无信号 (rssi < -80) | 信号等级 - 无信号 (rssi < -80) | 通过 |
| testNetworkUtils0026 | 边界: 信号等级 - 临界值测试 | 信号等级 - 临界值测试 | 通过 |
| testNetworkUtils0027 | 正向: 延迟估算 - WIFI 返回 20ms | 延迟估算 - WIFI 返回 20ms | 通过 |
| testNetworkUtils0028 | 正向: 延迟估算 - ETHERNET 返回 5ms | 延迟估算 - ETHERNET 返回 5ms | 通过 |
| testNetworkUtils0029 | 正向: 延迟估算 - CELLULAR 返回 100ms | 延迟估算 - CELLULAR 返回 100ms | 通过 |
| testNetworkUtils0030 | 正向: 延迟估算 - BLUETOOTH 返回 150ms | 延迟估算 - BLUETOOTH 返回 150ms | 通过 |
| testNetworkUtils0031 | 正向: 延迟估算 - UNKNOWN 返回 200ms | 延迟估算 - UNKNOWN 返回 200ms | 通过 |
| testNetworkUtils0032 | 正向: 延迟估算 - 延迟递增顺序验证 | 延迟估算 - 延迟递增顺序验证 | 通过 |
| testNetworkUtils0033 | 正向: 带宽描述 - ETHERNET 返回 "千兆级带宽" | 带宽描述 - ETHERNET 返回 "千兆级带宽" | 通过 |
| testNetworkUtils0034 | 正向: 带宽描述 - WIFI 返回 "百兆级带宽" | 带宽描述 - WIFI 返回 "百兆级带宽" | 通过 |
| testNetworkUtils0035 | 正向: 带宽描述 - CELLULAR 返回 "移动网络带宽" | 带宽描述 - CELLULAR 返回 "移动网络带宽" | 通过 |
| testNetworkUtils0036 | 正向: 带宽描述 - BLUETOOTH 返回 "低功耗窄带" | 带宽描述 - BLUETOOTH 返回 "低功耗窄带" | 通过 |
| testNetworkUtils0037 | 正向: 带宽描述 - UNKNOWN 返回 "未知带宽" | 带宽描述 - UNKNOWN 返回 "未知带宽" | 通过 |
| testNetworkUtils0038 | 正向: 网络类型枚举值验证 | 网络类型枚举值验证 | 通过 |
| testNetworkUtils0039 | 正向: 网络状态枚举值验证 | 网络状态枚举值验证 | 通过 |
| testNetworkUtils0040 | 正向: 高带宽网络延迟较低综合验证 | 高带宽网络延迟较低综合验证 | 通过 |
| testNetworkUtils0041 | 正向: 信号等级递减顺序验证 | 信号等级递减顺序验证 | 通过 |
| testNetworkUtils0042 | 正向: 状态判断一致性验证 | 状态判断一致性验证 | 通过 |

## PermissionUtilsTest XTS 用例

分类：网络与权限。测试文件：`entry/src/ohosTest/ets/test/Network/PermissionUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testPermissionUtils0001 | 正向: 未登记权限默认返回 NOT_DETERMINED | 未登记权限默认返回 NOT_DETERMINED | 通过 |
| testPermissionUtils0002 | 正向: 权限检查 - 未决定状态为默认 | 权限检查 - 未决定状态为默认 | 通过 |
| testPermissionUtils0003 | 正向: 模拟权限工具的 DND 权限默认未登记 | 模拟权限工具的 DND 权限默认未登记 | 通过 |
| testPermissionUtils0004 | 正向: 判断已授予 - GRANTED 返回 true | 判断已授予 - GRANTED 返回 true | 通过 |
| testPermissionUtils0005 | 正向: 判断已授予 - DENIED 返回 false | 判断已授予 - DENIED 返回 false | 通过 |
| testPermissionUtils0006 | 正向: 判断已授予 - NOT_DETERMINED 返回 false | 判断已授予 - NOT_DETERMINED 返回 false | 通过 |
| testPermissionUtils0007 | 正向: 判断受限 - RESTRICTED 返回 true | 判断受限 - RESTRICTED 返回 true | 通过 |
| testPermissionUtils0008 | 正向: 判断受限 - GRANTED 返回 false | 判断受限 - GRANTED 返回 false | 通过 |
| testPermissionUtils0009 | 正向: 判断受限 - 其他状态返回 false | 判断受限 - 其他状态返回 false | 通过 |
| testPermissionUtils0010 | 正向: 获取标签 - DND 权限返回中文描述 | 获取标签 - DND 权限返回中文描述 | 通过 |
| testPermissionUtils0011 | 正向: 获取标签 - INTERNET 权限返回中文描述 | 获取标签 - INTERNET 权限返回中文描述 | 通过 |
| testPermissionUtils0012 | 正向: 获取标签 - 位置权限返回中文描述 | 获取标签 - 位置权限返回中文描述 | 通过 |
| testPermissionUtils0013 | 边界: 获取标签 - 未知权限返回原值 | 获取标签 - 未知权限返回原值 | 通过 |
| testPermissionUtils0014 | 正向: 状态标签 - GRANTED 返回 "已授予" | 状态标签 - GRANTED 返回 "已授予" | 通过 |
| testPermissionUtils0015 | 正向: 状态标签 - DENIED 返回 "已拒绝" | 状态标签 - DENIED 返回 "已拒绝" | 通过 |
| testPermissionUtils0016 | 正向: 状态标签 - NOT_DETERMINED  "未决定" | 状态标签 - NOT_DETERMINED  "未决定" | 通过 |
| testPermissionUtils0017 | 正向: 状态标签 - RESTRICTED 返回 "受限" | 状态标签 - RESTRICTED 返回 "受限" | 通过 |
| testPermissionUtils0018 | 正向: 必要权限列表 - 包含 DND 权限 | 必要权限列表 - 包含 DND 权限 | 通过 |
| testPermissionUtils0019 | 正向: 必要权限列表 - 每次调用返回独立副本 | 必要权限列表 - 每次调用返回独立副本 | 通过 |
| testPermissionUtils0020 | 正向: 所有已知权限 - 返回完整列表 | 所有已知权限 - 返回完整列表 | 通过 |
| testPermissionUtils0021 | 正向: 所有已知权限 - 包含常见权限 | 所有已知权限 - 包含常见权限 | 通过 |
| testPermissionUtils0022 | 正向: 所有已知权限 - 前缀统一且均有中文标签 | 所有已知权限 - 前缀统一且均有中文标签 | 通过 |
| testPermissionUtils0023 | 边界: 格式化 - 空列表返回 "无权限" | 格式化 - 空列表返回 "无权限" | 通过 |
| testPermissionUtils0024 | 正向: 格式化 - 单权限返回中文标签 | 格式化 - 单权限返回中文标签 | 通过 |
| testPermissionUtils0025 | 正向: 格式化 - 多权限顿号分隔 | 格式化 - 多权限顿号分隔 | 通过 |
| testPermissionUtils0026 | 正向: 格式化 - 三个权限正确分隔 | 格式化 - 三个权限正确分隔 | 通过 |
| testPermissionUtils0027 | 边界: 格式化 - 未知权限返回原值 | 格式化 - 未知权限返回原值 | 通过 |
| testPermissionUtils0028 | 正向: 权限状态枚举值验证 | 权限状态枚举值验证 | 通过 |
| testPermissionUtils0029 | 正向: 权限状态枚举唯一性 | 权限状态枚举唯一性 | 通过 |
| testPermissionUtils0030 | 正向: 权限状态一致性 - GRANTED 与 isGranted 匹配 | 权限状态一致性 - GRANTED 与 isGranted 匹配 | 通过 |
| testPermissionUtils0031 | 正向: 权限状态一致性 - RESTRICTED 与 isRestricted 匹配 | 权限状态一致性 - RESTRICTED 与 isRestricted 匹配 | 通过 |
| testPermissionUtils0032 | 正向: 权限标签映射 - 已知权限都有中文标签 | 权限标签映射 - 已知权限都有中文标签 | 通过 |
| testPermissionUtils0033 | 正向: 各状态标签完整性验证 | 各状态标签完整性验证 | 通过 |
| testPermissionUtils0034 | 正向: 必要权限在已知权限列表中 | 必要权限在已知权限列表中 | 通过 |

## CustomConfigServiceTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/CustomConfigService.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testCustomConfigService0001 | 正向: 初始化后 isServiceInitialized 返回 true | 初始化后 isServiceInitialized 返回 true | 通过 |
| testCustomConfigService0002 | 正向: 连续获取渠道号时返回值与模型一致 | 连续获取渠道号时返回值与模型一致 | 通过 |
| testCustomConfigService0003 | 正向: 获取渠道号后模型与当前状态一致 | 获取渠道号后模型与当前状态一致 | 通过 |
| testCustomConfigService0004 | 正向: 初始化后当前状态精确为 UNINITIALIZED | 初始化后当前状态精确为 UNINITIALIZED | 通过 |
| testCustomConfigService0005 | 正向: 重置后状态回到未初始化 | 重置后状态回到未初始化 | 通过 |
| testCustomConfigService0006 | 正向: 多次调用 getChannelId 返回一致结果 | 多次调用 getChannelId 返回一致结果 | 通过 |

## CustomConfigServiceExtendedTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/CustomConfigServiceExtended.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testCustomConfigServiceExtended0001 | 正向: 多次顺序调用 getChannelId 结果一致 | 多次顺序调用 getChannelId 结果一致 | 通过 |
| testCustomConfigServiceExtended0002 | 正向: 多次顺序调用后模型状态正确 | 多次顺序调用后模型状态正确 | 通过 |
| testCustomConfigServiceExtended0003 | 正向: 获取渠道号后状态与设备结果一致 | 获取渠道号后状态与设备结果一致 | 通过 |
| testCustomConfigServiceExtended0004 | 边界: 重置后状态回到 UNINITIALIZED | 重置后状态回到 UNINITIALIZED | 通过 |
| testCustomConfigServiceExtended0005 | 边界: 未初始化直接获取渠道号 | 未初始化直接获取渠道号 | 通过 |
| testCustomConfigServiceExtended0006 | 边界: 销毁后重新初始化 | 销毁后重新初始化 | 通过 |
| testCustomConfigServiceExtended0007 | 边界: 多次销毁不报错 | 多次销毁不报错 | 通过 |
| testCustomConfigServiceExtended0008 | 边界: 获取渠道号后立即重置 | 获取渠道号后立即重置 | 通过 |
| testCustomConfigServiceExtended0009 | 边界: 重置后获取模型 | 重置后获取模型 | 通过 |
| testCustomConfigServiceExtended0010 | 边界: 模型引用一致性 | 模型引用一致性 | 通过 |
| testCustomConfigServiceExtended0011 | 边界: 大量调用后内存稳定 | 大量调用后内存稳定 | 通过 |
| testCustomConfigServiceExtended0012 | 边界: 反复初始化/销毁 | 反复初始化/销毁 | 通过 |
| testCustomConfigServiceExtended0013 | 综合: 初始化 → 获取 → 重置 → 重新获取 | 初始化 → 获取 → 重置 → 重新获取 | 通过 |
| testCustomConfigServiceExtended0014 | 综合: 获取 → 销毁 → 重新初始化 | 获取 → 销毁 → 重新初始化 | 通过 |
| testCustomConfigServiceExtended0015 | 综合: 多次获取后重置 | 多次获取后重置 | 通过 |

## EventServiceTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/EventService.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testEventService0001 | 正向: 初始化返回 true | 初始化返回 true | 通过 |
| testEventService0002 | 正向: 上报事件后历史记录增加 | 上报事件后历史记录增加 | 通过 |
| testEventService0003 | 正向: 统计信息返回正确 | 统计信息返回正确 | 通过 |
| testEventService0004 | 正向: 清除历史后记录为空 | 清除历史后记录为空 | 通过 |
| testEventService0005 | 正向: 上报错误事件 | 上报错误事件 | 通过 |
| testEventService0006 | 正向: 销毁后状态重置 | 销毁后状态重置 | 通过 |

## EventServiceExtendedTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/EventServiceExtended.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testEventServiceExtended0001 | 正向: 上报免打扰状态变更(dnd=true, notify=true)后历史记录正确 | 上报免打扰状态变更(dnd=true, notify=true)后历史记录正确 | 通过 |
| testEventServiceExtended0002 | 正向: 上报免打扰状态变更(dnd=false, notify=false)数据字段正确 | 上报免打扰状态变更(dnd=false, notify=false)数据字段正确 | 通过 |
| testEventServiceExtended0003 | 正向: 上报打开 PIN 设置页面成功事件 | 上报打开 PIN 设置页面成功事件 | 通过 |
| testEventServiceExtended0004 | 正向: 上报打开 NFC 设置页面失败事件 | 上报打开 NFC 设置页面失败事件 | 通过 |
| testEventServiceExtended0005 | 正向: 上报双击查询事件后记录正确 | 上报双击查询事件后记录正确 | 通过 |
| testEventServiceExtended0006 | 正向: 上报服务初始化事件后记录正确 | 上报服务初始化事件后记录正确 | 通过 |
| testEventServiceExtended0007 | 正向: 添加监听器后上报事件触发回调 | 添加监听器后上报事件触发回调 | 通过 |
| testEventServiceExtended0008 | 正向: 移除监听器后上报事件不再触发回调 | 移除监听器后上报事件不再触发回调 | 通过 |
| testEventServiceExtended0009 | 正向: 重复添加同一监听器，每次上报触发多次回调 | 重复添加同一监听器，每次上报触发多次回调 | 通过 |
| testEventServiceExtended0010 | 边界: 移除未添加的监听器不报错 | 移除未添加的监听器不报错 | 通过 |
| testEventServiceExtended0011 | 正向: 按事件类型过滤历史记录 | 按事件类型过滤历史记录 | 通过 |
| testEventServiceExtended0012 | 正向: 按时间范围过滤历史记录 | 按时间范围过滤历史记录 | 通过 |
| testEventServiceExtended0013 | 正向: 按最大数量过滤返回最新 N 条 | 按最大数量过滤返回最新 N 条 | 通过 |
| testEventServiceExtended0014 | 边界: 空过滤器返回全部历史 | 空过滤器返回全部历史 | 通过 |
| testEventServiceExtended0015 | 边界: 上报事件超过 MAX_LOG_ENTRIES(200) 后历史被裁剪 | 上报事件超过 MAX_LOG_ENTRIES(200) 后历史被裁剪 | 通过 |
| testEventServiceExtended0016 | 边界: 未初始化直接上报事件仍记录到历史 | 未初始化直接上报事件仍记录到历史 | 通过 |
| testEventServiceExtended0017 | 正向: 多种类型事件上报后统计按类型分组 | 多种类型事件上报后统计按类型分组 | 通过 |
| testEventServiceExtended0018 | 边界: 监听器回调抛异常不影响其他监听器和历史记录 | 监听器回调抛异常不影响其他监听器和历史记录 | 通过 |
| testEventServiceExtended0019 | 正向: destroy 后监听器被清除，重新初始化后无旧监听器 | destroy 后监听器被清除，重新初始化后无旧监听器 | 通过 |
| testEventServiceExtended0020 | 边界: 无事件时统计信息返回零值 | 无事件时统计信息返回零值 | 通过 |
| testEventServiceExtended0021 | 正向: hiAppEvent 上报计数器返回契约与不变量 | hiAppEvent 上报计数器返回契约与不变量 | 通过 |

## HistoryClearTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/HistoryClearTest.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testHistoryClearTest0001 | 正向: 空历史记录清除不报错 | 空历史记录清除不报错 | 通过 |
| testHistoryClearTest0002 | 正向: 上报后清除，记录归零 | 上报后清除，记录归零 | 通过 |
| testHistoryClearTest0003 | 正向: 清除后继续上报正常记录 | 清除后继续上报正常记录 | 通过 |
| testHistoryClearTest0004 | 正向: 销毁后历史清空 | 销毁后历史清空 | 通过 |
| testHistoryClearTest0005 | 正向: 清除后统计信息归零 | 清除后统计信息归零 | 通过 |

## IntelligentSceneServiceTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/IntelligentSceneService.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testIntelligentSceneService0001 | 正向: initialize 后 isServiceInitialized 返回 true | initialize 后 isServiceInitialized 返回 true | 通过 |
| testIntelligentSceneService0002 | 正向: reset 后 isServiceInitialized 回到 false | reset 后 isServiceInitialized 回到 false | 通过 |
| testIntelligentSceneService0003 | 正向: destroy 后状态完全重置 | destroy 后状态完全重置 | 通过 |
| testIntelligentSceneService0004 | 正向: initialize 重建免打扰模型并回到初始值 | initialize 重建免打扰模型并回到初始值 | 通过 |
| testIntelligentSceneService0005 | 正向: 初始化后 getCurrentStatus 返回 IDLE | 初始化后 getCurrentStatus 返回 IDLE | 通过 |
| testIntelligentSceneService0006 | 正向: markQuerying 将状态设为 QUERYING | markQuerying 将状态设为 QUERYING | 通过 |
| testIntelligentSceneService0007 | 正向: markSuccess 更新状态和数据 | markSuccess 更新状态和数据 | 通过 |
| testIntelligentSceneService0008 | 反向: markFailed 记录错误信息 | markFailed 记录错误信息 | 通过 |
| testIntelligentSceneService0009 | 正向: reset 后模型回到初始状态 | reset 后模型回到初始状态 | 通过 |
| testIntelligentSceneService0010 | 正向: isDndActive 仅在 SUCCESS 且 dndEnabled 时返回 true | isDndActive 仅在 SUCCESS 且 dndEnabled 时返回 true | 通过 |
| testIntelligentSceneService0011 | 正向: canNotify 仅在 SUCCESS 且 notifyAllowed 时返回 true | canNotify 仅在 SUCCESS 且 notifyAllowed 时返回 true | 通过 |
| testIntelligentSceneService0012 | 正向: isReady 仅在 SUCCESS 状态时返回 true | isReady 仅在 SUCCESS 状态时返回 true | 通过 |
| testIntelligentSceneService0013 | 正向: toJSON 返回完整字段 | toJSON 返回完整字段 | 通过 |
| testIntelligentSceneService0014 | 正向: toString 返回包含关键字段的字符串 | toString 返回包含关键字段的字符串 | 通过 |
| testIntelligentSceneService0015 | 正向: 未查询返回 -1，查询后返回正值 | 未查询返回 -1，查询后返回正值 | 通过 |

## IntelligentSceneServiceExtendedTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/IntelligentSceneServiceExtended.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testIntelligentSceneServiceExtended0001 | 正向: 模拟异步查询成功流程 | 模拟异步查询成功流程 | 通过 |
| testIntelligentSceneServiceExtended0002 | 边界: 模拟异步查询失败 | 模拟异步查询失败 | 通过 |
| testIntelligentSceneServiceExtended0003 | 边界: 模型引用一致性 | 模型引用一致性 | 通过 |
| testIntelligentSceneServiceExtended0004 | 边界: 多次销毁不报错 | 多次销毁不报错 | 通过 |
| testIntelligentSceneServiceExtended0005 | 边界: 反复初始化/销毁 | 反复初始化/销毁 | 通过 |

## SettingsLiteServiceTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/SettingsLiteService.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSettingsLiteService0001 | 正向: initialize 后 isServiceInitialized 返回 true | initialize 后 isServiceInitialized 返回 true | 通过 |
| testSettingsLiteService0002 | 正向: reset 后 isServiceInitialized 回到 false | reset 后 isServiceInitialized 回到 false | 通过 |
| testSettingsLiteService0003 | 正向: destroy 后状态完全重置 | destroy 后状态完全重置 | 通过 |
| testSettingsLiteService0004 | 正向: getPinModel 返回 PIN 类型模型 | getPinModel 返回 PIN 类型模型 | 通过 |
| testSettingsLiteService0005 | 正向: getNfcModel 返回 NFC 类型模型 | getNfcModel 返回 NFC 类型模型 | 通过 |
| testSettingsLiteService0006 | 正向: getDoubleClickModel 返回双击类型模型 | getDoubleClickModel 返回双击类型模型 | 通过 |
| testSettingsLiteService0007 | 正向: getAllModels 返回 3 个模型 | getAllModels 返回 3 个模型 | 通过 |
| testSettingsLiteService0008 | 正向: markOpening 将状态设为 OPENING | markOpening 将状态设为 OPENING | 通过 |
| testSettingsLiteService0009 | 正向: markSuccess 更新状态和统计 | markSuccess 更新状态和统计 | 通过 |
| testSettingsLiteService0010 | 反向: markFailed 记录错误信息 | markFailed 记录错误信息 | 通过 |
| testSettingsLiteService0011 | 正向: reset 后模型回到初始状态 | reset 后模型回到初始状态 | 通过 |
| testSettingsLiteService0012 | 正向: toJSON 返回完整字段 | toJSON 返回完整字段 | 通过 |
| testSettingsLiteService0013 | 正向: toString 返回包含关键字段的字符串 | toString 返回包含关键字段的字符串 | 通过 |
| testSettingsLiteService0014 | 正向: updateClickResult 更新双击结果 | updateClickResult 更新双击结果 | 通过 |

## SettingsLiteServiceExtendedTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/SettingsLiteServiceExtended.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSettingsLiteServiceExtended0001 | 正向: 连续模拟打开 PIN 设置后模型状态正确 | 连续模拟打开 PIN 设置后模型状态正确 | 通过 |
| testSettingsLiteServiceExtended0002 | 正向: 连续模拟打开 NFC 设置后模型状态正确 | 连续模拟打开 NFC 设置后模型状态正确 | 通过 |
| testSettingsLiteServiceExtended0003 | 正向: 连续模拟打开双击设置后模型状态正确 | 连续模拟打开双击设置后模型状态正确 | 通过 |
| testSettingsLiteServiceExtended0004 | 正向: IDLE → OPENING → SUCCESS 完整流转 | IDLE → OPENING → SUCCESS 完整流转 | 通过 |
| testSettingsLiteServiceExtended0005 | 边界: 重置后状态回到 IDLE | 重置后状态回到 IDLE | 通过 |
| testSettingsLiteServiceExtended0006 | 边界: 未初始化直接操作模型 | 未初始化直接操作模型 | 通过 |
| testSettingsLiteServiceExtended0007 | 边界: 销毁后重新初始化 | 销毁后重新初始化 | 通过 |
| testSettingsLiteServiceExtended0008 | 边界: 多次销毁不报错 | 多次销毁不报错 | 通过 |
| testSettingsLiteServiceExtended0009 | 边界: 操作后立即重置 | 操作后立即重置 | 通过 |
| testSettingsLiteServiceExtended0010 | 边界: 重复获取 PIN 模型返回同一被操作实例 | 重复获取 PIN 模型返回同一被操作实例 | 通过 |
| testSettingsLiteServiceExtended0011 | 边界: 获取所有模型 | 获取所有模型 | 通过 |
| testSettingsLiteServiceExtended0012 | 边界: 大量操作后计数正确 | 大量操作后计数正确 | 通过 |
| testSettingsLiteServiceExtended0013 | 边界: 反复初始化/销毁 | 反复初始化/销毁 | 通过 |
| testSettingsLiteServiceExtended0014 | 综合: 初始化 → 操作 → 重置 → 重新操作 | 初始化 → 操作 → 重置 → 重新操作 | 通过 |
| testSettingsLiteServiceExtended0015 | 综合: 多次操作后重置 | 多次操作后重置 | 通过 |
| testSettingsLiteServiceExtended0016 | 综合: 操作 → 销毁 → 重新初始化 | 操作 → 销毁 → 重新初始化 | 通过 |

## SettingsLiteServiceOperationTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/SettingsLiteServiceOperation.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSettingsLiteServiceOperation0001 | Verify PIN settings Want and successful service state. | Verify PIN settings Want and successful service state. | 通过 |
| testSettingsLiteServiceOperation0002 | Verify NFC settings Want and successful service state. | Verify NFC settings Want and successful service state. | 通过 |
| testSettingsLiteServiceOperation0003 | Verify double-click settings Want and successful service state. | Verify double-click settings Want and successful service state. | 通过 |
| testSettingsLiteServiceOperation0004 | Verify PIN synchronous failure details and model isolation. | Verify PIN synchronous failure details and model isolation. | 通过 |
| testSettingsLiteServiceOperation0005 | Verify NFC synchronous failure details and model isolation. | Verify NFC synchronous failure details and model isolation. | 通过 |
| testSettingsLiteServiceOperation0006 | Verify double-click synchronous failure details and model isolation. | Verify double-click synchronous failure details and model isolation. | 通过 |
| testSettingsLiteServiceOperation0007 | Verify double-click query returns FA-only unsupported error in Stage model. | Verify double-click query returns FA-only unsupported error in Stage model. | 通过 |

## TraceServiceTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/TraceService.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testTraceService0001 | 正向: 初始化后追踪启用 | 初始化后追踪启用 | 通过 |
| testTraceService0002 | 正向: TraceName 常量取值固定且互不重复 | TraceName 常量取值固定且互不重复 | 通过 |
| testTraceService0003 | 正向: startTrace + finishTrace 计数正确 | startTrace + finishTrace 计数正确 | 通过 |
| testTraceService0004 | 正向: 禁用后 startTrace 不增加计数 | 禁用后 startTrace 不增加计数 | 通过 |
| testTraceService0005 | 正向: reset 后计数归零 | reset 后计数归零 | 通过 |

## TraceServiceExtendedTest XTS 用例

分类：服务层。测试文件：`entry/src/ohosTest/ets/test/Service/TraceServiceExtended.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testTraceServiceExtended0001 | 正向: traceSync 包裹同步操作返回结果且计数正确 | traceSync 包裹同步操作返回结果且计数正确 | 通过 |
| testTraceServiceExtended0002 | 边界: traceSync 内操作抛异常后计数仍归零且异常传播 | traceSync 内操作抛异常后计数仍归零且异常传播 | 通过 |
| testTraceServiceExtended0003 | 正向: traceAsync 包裹异步操作返回结果且计数正确 | traceAsync 包裹异步操作返回结果且计数正确 | 通过 |
| testTraceServiceExtended0004 | 边界: traceAsync 内操作抛异常后计数归零且异常传播 | traceAsync 内操作抛异常后计数归零且异常传播 | 通过 |
| testTraceServiceExtended0005 | 边界: 禁用时 finishTrace 不将计数减到负数 | 禁用时 finishTrace 不将计数减到负数 | 通过 |
| testTraceServiceExtended0006 | 正向: initialize(false) 后追踪服务处于禁用状态 | initialize(false) 后追踪服务处于禁用状态 | 通过 |
| testTraceServiceExtended0007 | 正向: startTrace 带 processStage 参数正常增加计数 | startTrace 带 processStage 参数正常增加计数 | 通过 |
| testTraceServiceExtended0008 | 正向: finishTrace 按 taskId 精确配对结束，未知 taskId 不影响计数 | finishTrace 按 taskId 精确配对结束，未知 taskId 不影响计数 | 通过 |
| testTraceServiceExtended0009 | 正向: init → start → finish → reset → destroy 完整流程 | init → start → finish → reset → destroy 完整流程 | 通过 |
| testTraceServiceExtended0010 | 正向: TraceName 按业务模块前缀分组 | TraceName 按业务模块前缀分组 | 通过 |

## SettingsItemModelTest XTS 用例

分类：设置信息。测试文件：`entry/src/ohosTest/ets/test/SettingsLite/SettingsItemModel.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSettingsItemModel0001 | 正向用例：默认构造后各字段为初始值 | 默认构造后各字段为初始值 | 通过 |
| testSettingsItemModel0002 | 正向用例：参数构造后各字段与传入值一致 | 参数构造后各字段与传入值一致 | 通过 |
| testSettingsItemModel0003 | 正向用例：调用 markOpening 后状态变为 OPENING，错误信息清空 | 调用 markOpening 后状态变为 OPENING，错误信息清空 | 通过 |
| testSettingsItemModel0004 | 正向用例：调用 markQuerying 后状态变为 QUERYING | 调用 markQuerying 后状态变为 QUERYING | 通过 |
| testSettingsItemModel0005 | 正向用例：调用 markSuccess 后状态变为 SUCCESS，操作次数加一 | 调用 markSuccess 后状态变为 SUCCESS，操作次数加一 | 通过 |
| testSettingsItemModel0006 | 正向用例：调用 markFailed 后状态变为 FAILED，错误信息正确记录 | 调用 markFailed 后状态变为 FAILED，错误信息正确记录 | 通过 |
| testSettingsItemModel0007 | 正向用例：调用 updateClickResult 更新双击回调结果和时间戳 | 调用 updateClickResult 更新双击回调结果和时间戳 | 通过 |
| testSettingsItemModel0008 | 正向用例：各状态下 getStatusDescription 返回正确的中文描述 | 各状态下 getStatusDescription 返回正确的中文描述 | 通过 |
| testSettingsItemModel0009 | 正向用例：各类型下 getTypeName 返回正确的中文名称 | 各类型下 getTypeName 返回正确的中文名称 | 通过 |
| testSettingsItemModel0010 | 正向用例：reset 后操作相关字段恢复为初始值，类型和标题保持不变 | reset 后操作相关字段恢复为初始值，类型和标题保持不变 | 通过 |

## SettingsItemModelExtendedTest XTS 用例

分类：设置信息。测试文件：`entry/src/ohosTest/ets/test/SettingsLite/SettingsItemModelExtended.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSettingsItemModelExtended0001 | 正向: toJSON 序列化后字段完整且值一致 | toJSON 序列化后字段完整且值一致 | 通过 |
| testSettingsItemModelExtended0002 | 正向: 失败状态下 toJSON 包含错误信息 | 失败状态下 toJSON 包含错误信息 | 通过 |
| testSettingsItemModelExtended0003 | 正向: toString 输出包含关键信息 | toString 输出包含关键信息 | 通过 |
| testSettingsItemModelExtended0004 | 正向: 三种类型均返回正确中文名称 | 三种类型均返回正确中文名称 | 通过 |
| testSettingsItemModelExtended0005 | 正向: IDLE → OPENING → SUCCESS → reset → IDLE 完整流转 | IDLE → OPENING → SUCCESS → reset → IDLE 完整流转 | 通过 |
| testSettingsItemModelExtended0006 | 正向: IDLE → QUERYING → SUCCESS 双击查询流转 | IDLE → QUERYING → SUCCESS 双击查询流转 | 通过 |
| testSettingsItemModelExtended0007 | 正向: 多次 markSuccess 后 operationCount 累加 | 多次 markSuccess 后 operationCount 累加 | 通过 |
| testSettingsItemModelExtended0008 | 正向: 各状态下 getStatusDescription 返回正确描述 | 各状态下 getStatusDescription 返回正确描述 | 通过 |
| testSettingsItemModelExtended0009 | 正向: reset 后所有字段恢复初始值 | reset 后所有字段恢复初始值 | 通过 |

## SettingsLiteDoubleClickTest XTS 用例

分类：设置信息。测试文件：`entry/src/ohosTest/ets/test/SettingsLite/SettingsLiteDoubleClick.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSettingsLiteDoubleClick0001 | 正向用例：获取双击模型，验证类型为 DOUBLE_CLICK_SETTING | 获取双击模型，验证类型为 DOUBLE_CLICK_SETTING | 通过 |
| testSettingsLiteDoubleClick0002 | 正向用例：markOpening 后状态变为 OPENING | markOpening 后状态变为 OPENING | 通过 |
| testSettingsLiteDoubleClick0003 | 正向用例：updateClickResult 更新双击结果 | updateClickResult 更新双击结果 | 通过 |

## SettingsLiteNfcSettingTest XTS 用例

分类：设置信息。测试文件：`entry/src/ohosTest/ets/test/SettingsLite/SettingsLiteNfcSetting.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSettingsLiteNfcSetting0001 | 正向用例：获取 NFC 模型，验证类型为 NFC_SETTING | 获取 NFC 模型，验证类型为 NFC_SETTING | 通过 |
| testSettingsLiteNfcSetting0002 | 正向用例：NFC 模型的 getTypeName 返回非空字符串 | NFC 模型的 getTypeName 返回非空字符串 | 通过 |
| testSettingsLiteNfcSetting0003 | 正向用例：getAllModels 返回 3 个模型 | getAllModels 返回 3 个模型 | 通过 |

## SettingsLitePageUITest XTS 用例

分类：设置信息。测试文件：`entry/src/ohosTest/ets/test/SettingsLite/SettingsLitePageUI.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSettingsLitePageUI0001 | Verify initial setting cards statuses result and detail models. | Verify initial setting cards statuses result and detail models. | 通过 |
| testSettingsLitePageUI0002 | Verify double click query reports FA-only unsupported error in Stage model. | Verify double click query reports FA-only unsupported error in Stage model. | 通过 |
| testSettingsLitePageUI0003 | Verify reset restores all states result details and logs. | Verify reset restores all states result details and logs. | 通过 |

## SettingsLitePinSettingTest XTS 用例

分类：设置信息。测试文件：`entry/src/ohosTest/ets/test/SettingsLite/SettingsLitePinSetting.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSettingsLitePinSetting0001 | 正向用例：初始化服务后状态为已初始化 | 初始化服务后状态为已初始化 | 通过 |
| testSettingsLitePinSetting0002 | 正向用例：获取 PIN 模型，验证类型和初始状态 | 获取 PIN 模型，验证类型和初始状态 | 通过 |
| testSettingsLitePinSetting0003 | 反向用例：重置服务后状态为未初始化 | 重置服务后状态为未初始化 | 通过 |

## BoundaryValueTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsBoundaryValue.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsBoundaryValue0001 | 边界: parse 无效日期字符串返回 NaN 或 -1 | parse 无效日期字符串返回 NaN 或 -1 | 通过 |
| testUtilsBoundaryValue0002 | 边界: addDays/addHours/addMinutes 传入负数 | addDays/addHours/addMinutes 传入负数 | 通过 |
| testUtilsBoundaryValue0003 | 边界: 闰年/平年判断 | 闰年/平年判断 | 通过 |
| testUtilsBoundaryValue0004 | 边界: daysBetween 相同时间戳返回 0 | daysBetween 相同时间戳返回 0 | 通过 |
| testUtilsBoundaryValue0005 | 边界: 各月份天数及闰年二月 | 各月份天数及闰年二月 | 通过 |
| testUtilsBoundaryValue0006 | 边界: lerp t=0/t=1/t 超出范围 | lerp t=0/t=1/t 超出范围 | 通过 |
| testUtilsBoundaryValue0007 | 边界: inverseLerp a==b 时避免除零 | inverseLerp a==b 时避免除零 | 通过 |
| testUtilsBoundaryValue0008 | 边界: median 空数组/单元素/偶数个元素 | median 空数组/单元素/偶数个元素 | 通过 |
| testUtilsBoundaryValue0009 | 边界: percentage total=0 时避免除零 | percentage total=0 时避免除零 | 通过 |
| testUtilsBoundaryValue0010 | 边界: square 负数、0、极大值 | square 负数、0、极大值 | 通过 |
| testUtilsBoundaryValue0011 | 边界: 角度弧度转换特殊值 | 角度弧度转换特殊值 | 通过 |
| testUtilsBoundaryValue0012 | 边界: max/min 单元素数组 | max/min 单元素数组 | 通过 |
| testUtilsBoundaryValue0013 | 边界: capitalize 单字符、空字符串 | capitalize 单字符、空字符串 | 通过 |
| testUtilsBoundaryValue0014 | 边界: toKebabCase/toPascalCase 空字符串和单单词 | toKebabCase/toPascalCase 空字符串和单单词 | 通过 |
| testUtilsBoundaryValue0015 | 边界: countOccurrences 空字符串、无匹配 | countOccurrences 空字符串、无匹配 | 通过 |
| testUtilsBoundaryValue0016 | 边界: isBlank/isNotBlank null/undefined/空串/纯空白 | isBlank/isNotBlank null/undefined/空串/纯空白 | 通过 |
| testUtilsBoundaryValue0017 | 边界: hashCode/checksum 空字符串 | hashCode/checksum 空字符串 | 通过 |
| testUtilsBoundaryValue0018 | 边界: substring 各种边界参数 | substring 各种边界参数 | 通过 |
| testUtilsBoundaryValue0019 | 边界: formatBytes NaN/Infinity/极大值 | formatBytes NaN/Infinity/极大值 | 通过 |
| testUtilsBoundaryValue0020 | 边界: formatDuration 0/负数/极大值 | formatDuration 0/负数/极大值 | 通过 |
| testUtilsBoundaryValue0021 | 边界: formatNumber NaN/Infinity | formatNumber NaN/Infinity | 通过 |
| testUtilsBoundaryValue0022 | 边界: padStart/padEnd 长度已达标或目标长度为0 | padStart/padEnd 长度已达标或目标长度为0 | 通过 |
| testUtilsBoundaryValue0023 | 边界: truncate maxLen 极小值 | truncate maxLen 极小值 | 通过 |
| testUtilsBoundaryValue0024 | 边界: formatPercentage 负数、超过100的值 | formatPercentage 负数、超过100的值 | 通过 |
| testUtilsBoundaryValue0025 | 边界: maskPhone 过短号码 | maskPhone 过短号码 | 通过 |

## UtilsCommonUtilsTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsCommonUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsCommonUtils0001 | 正向: ID唯一性 | ID唯一性 | 通过 |
| testUtilsCommonUtils0002 | 正向: ID格式（类UUID格式含连字符） | ID格式（类UUID格式含连字符） | 通过 |
| testUtilsCommonUtils0003 | 正向: 空字符串判断 | 空字符串判断 | 通过 |
| testUtilsCommonUtils0004 | 正向: 非空字符串判断 | 非空字符串判断 | 通过 |
| testUtilsCommonUtils0005 | 正向: 对象深拷贝 | 对象深拷贝 | 通过 |
| testUtilsCommonUtils0006 | 正向: 数组深拷贝 | 数组深拷贝 | 通过 |
| testUtilsCommonUtils0007 | 正向: 合法JSON解析 | 合法JSON解析 | 通过 |
| testUtilsCommonUtils0008 | 反向: 非法JSON解析返回null | 非法JSON解析返回null | 通过 |
| testUtilsCommonUtils0009 | 正向: 重试成功（首次即成功） | 重试成功（首次即成功） | 通过 |
| testUtilsCommonUtils0010 | 边界: ID非空检查 | ID非空检查 | 通过 |

## ConstantsTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsConstants.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsConstants0001 | 正向: API 版本号各字段值正确 | API 版本号各字段值正确 | 通过 |
| testUtilsConstants0002 | 正向: 各默认值常量符合预期 | 各默认值常量符合预期 | 通过 |
| testUtilsConstants0003 | 正向: 时间单位常量换算正确 | 时间单位常量换算正确 | 通过 |
| testUtilsConstants0004 | 正向: 字节单位常量换算正确 | 字节单位常量换算正确 | 通过 |
| testUtilsConstants0005 | 正向: 空字符串相关常量值正确 | 空字符串相关常量值正确 | 通过 |
| testUtilsConstants0006 | 正向: 正则表达式字符串非空且可构造 | 正则表达式字符串非空且可构造 | 通过 |
| testUtilsConstants0007 | 正向: isValidEmail 验证合法/非法邮箱 | isValidEmail 验证合法/非法邮箱 | 通过 |
| testUtilsConstants0008 | 正向: isValidPhone 验证合法/非法手机号 | isValidPhone 验证合法/非法手机号 | 通过 |
| testUtilsConstants0009 | 正向: isValidUrl 验证合法/非法 URL | isValidUrl 验证合法/非法 URL | 通过 |
| testUtilsConstants0010 | 正向: getVersionInfo 返回完整版本信息 | getVersionInfo 返回完整版本信息 | 通过 |
| testUtilsConstants0011 | 正向: initialize 调用不抛异常 | initialize 调用不抛异常 | 通过 |
| testUtilsConstants0012 | Verify exact page color constants used by the sample pages. | Verify exact page color constants used by the sample pages. | 通过 |
| testUtilsConstants0013 | Verify exact font and component dimensions used by the sample pages. | Verify exact font and component dimensions used by the sample pages. | 通过 |
| testUtilsConstants0014 | Verify exact item, section and page spacing constants. | Verify exact item, section and page spacing constants. | 通过 |
| testUtilsConstants0015 | Verify exact bold, normal and medium font weight constants. | Verify exact bold, normal and medium font weight constants. | 通过 |

## UtilsDateUtilsTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsDateUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsDateUtils0001 | 正向: now返回数字 | now返回数字 | 通过 |
| testUtilsDateUtils0002 | 正向: 日期格式化 | 日期格式化 | 通过 |
| testUtilsDateUtils0003 | 正向: 增加天数 | 增加天数 | 通过 |
| testUtilsDateUtils0004 | 正向: 增加小时 | 增加小时 | 通过 |
| testUtilsDateUtils0005 | 正向: 增加分钟 | 增加分钟 | 通过 |
| testUtilsDateUtils0006 | 正向: 判断今天 | 判断今天 | 通过 |
| testUtilsDateUtils0007 | 正向: 判断昨天 | 判断昨天 | 通过 |
| testUtilsDateUtils0008 | 正向: 刚刚 | 刚刚 | 通过 |
| testUtilsDateUtils0009 | 正向: 分钟前 | 分钟前 | 通过 |
| testUtilsDateUtils0010 | 正向: 解析合法日期 | 解析合法日期 | 通过 |
| testUtilsDateUtils0011 | 边界: 零时间戳 | 零时间戳 | 通过 |

## UtilsFormatUtilsTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsFormatUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsFormatUtils0001 | 正向: 0字节 | 0字节 | 通过 |
| testUtilsFormatUtils0002 | 正向: KB格式 | KB格式 | 通过 |
| testUtilsFormatUtils0003 | 正向: MB格式 | MB格式 | 通过 |
| testUtilsFormatUtils0004 | 正向: GB格式 | GB格式 | 通过 |
| testUtilsFormatUtils0005 | 正向: 时长格式化 | 时长格式化 | 通过 |
| testUtilsFormatUtils0006 | 正向: 数字格式化 | 数字格式化 | 通过 |
| testUtilsFormatUtils0007 | 正向: 前填充 | 前填充 | 通过 |
| testUtilsFormatUtils0008 | 正向: 短字符串不截断 | 短字符串不截断 | 通过 |
| testUtilsFormatUtils0009 | 正向: 长字符串截断 | 长字符串截断 | 通过 |
| testUtilsFormatUtils0010 | 正向: 百分比格式化 | 百分比格式化 | 通过 |
| testUtilsFormatUtils0011 | 边界: 负数处理 | 负数处理 | 通过 |

## LoggerTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsLogger.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsLogger0001 | 正向: setLevel 后 getLevel 返回正确值 | setLevel 后 getLevel 返回正确值 | 通过 |
| testUtilsLogger0002 | 正向: debug() 记录日志到缓冲区 | debug() 记录日志到缓冲区 | 通过 |
| testUtilsLogger0003 | 正向: info() 记录日志到缓冲区 | info() 记录日志到缓冲区 | 通过 |
| testUtilsLogger0004 | 正向: warn() 记录日志到缓冲区 | warn() 记录日志到缓冲区 | 通过 |
| testUtilsLogger0005 | 正向: error() 记录日志到缓冲区 | error() 记录日志到缓冲区 | 通过 |
| testUtilsLogger0006 | 正向: fatal() 记录日志到缓冲区 | fatal() 记录日志到缓冲区 | 通过 |
| testUtilsLogger0007 | 正向: 低于当前级别的日志不被记录 | 低于当前级别的日志不被记录 | 通过 |
| testUtilsLogger0008 | 正向: getBufferSize 反映已记录的日志条数 | getBufferSize 反映已记录的日志条数 | 通过 |
| testUtilsLogger0009 | 正向: clear 后缓冲区归零 | clear 后缓冲区归零 | 通过 |
| testUtilsLogger0010 | 正向: getHistoryByLevel 只返回指定级别的日志 | getHistoryByLevel 只返回指定级别的日志 | 通过 |
| testUtilsLogger0011 | 正向: 添加/移除监听器功能正常 | 添加/移除监听器功能正常 | 通过 |
| testUtilsLogger0012 | 边界: 重复添加同一监听器只注册一次 | 重复添加同一监听器只注册一次 | 通过 |
| testUtilsLogger0013 | 正向: 各日志级别对应正确的中文标签 | 各日志级别对应正确的中文标签 | 通过 |
| testUtilsLogger0014 | 正向: formatEntry 返回包含时间/级别/标签/消息的字符串 | formatEntry 返回包含时间/级别/标签/消息的字符串 | 通过 |
| testUtilsLogger0015 | 正向: 不传 tag 时使用默认标签 | 不传 tag 时使用默认标签 | 通过 |

## UtilsMathUtilsTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsMathUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsMathUtils0001 | 正向: 范围内值不变 | 范围内值不变 | 通过 |
| testUtilsMathUtils0002 | 正向: 低于最小值取最小 | 低于最小值取最小 | 通过 |
| testUtilsMathUtils0003 | 正向: 超过最大值取最大 | 超过最大值取最大 | 通过 |
| testUtilsMathUtils0004 | 正向: 线性插值中点 | 线性插值中点 | 通过 |
| testUtilsMathUtils0005 | 正向: 四舍五入 | 四舍五入 | 通过 |
| testUtilsMathUtils0006 | 正向: 随机整数范围 | 随机整数范围 | 通过 |
| testUtilsMathUtils0007 | 正向: 范围内返回true | 范围内返回true | 通过 |
| testUtilsMathUtils0008 | 正向: 范围外返回false | 范围外返回false | 通过 |
| testUtilsMathUtils0009 | 正向: 平均值计算 | 平均值计算 | 通过 |
| testUtilsMathUtils0010 | 正向: 求和计算 | 求和计算 | 通过 |
| testUtilsMathUtils0011 | 正向: 百分比计算 | 百分比计算 | 通过 |
| testUtilsMathUtils0012 | 边界: 最小等于最大 | 最小等于最大 | 通过 |
| testUtilsMathUtils0013 | 边界: 空数组平均值 | 空数组平均值 | 通过 |

## RandomUtilsTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsRandomUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsRandomUtils0001 | 正向: nextInt 返回值在 [min, max) 范围内 | nextInt 返回值在 [min, max) 范围内 | 通过 |
| testUtilsRandomUtils0002 | 边界: min >= max 时返回 min | min >= max 时返回 min | 通过 |
| testUtilsRandomUtils0003 | 正向: nextFloat 返回值在 [min, max] 范围内 | nextFloat 返回值在 [min, max] 范围内 | 通过 |
| testUtilsRandomUtils0004 | 边界: min > max 时自动交换 | min > max 时自动交换 | 通过 |
| testUtilsRandomUtils0005 | 正向: nextBoolean 50 次采样同时出现 true 与 false | nextBoolean 50 次采样同时出现 true 与 false | 通过 |
| testUtilsRandomUtils0006 | 正向: nextString 返回指定长度的字符串 | nextString 返回指定长度的字符串 | 通过 |
| testUtilsRandomUtils0007 | 正向: 自定义字符集生成字符串仅包含指定字符 | 自定义字符集生成字符串仅包含指定字符 | 通过 |
| testUtilsRandomUtils0008 | 正向: nextHex 返回指定长度的十六进制字符串 | nextHex 返回指定长度的十六进制字符串 | 通过 |
| testUtilsRandomUtils0009 | 正向: nextUuid 返回符合 v4 格式的 UUID | nextUuid 返回符合 v4 格式的 UUID | 通过 |
| testUtilsRandomUtils0010 | 正向: 多次生成的 UUID 互不相同 | 多次生成的 UUID 互不相同 | 通过 |
| testUtilsRandomUtils0011 | 正向: nextColor 返回 #RRGGBB 格式 | nextColor 返回 #RRGGBB 格式 | 通过 |
| testUtilsRandomUtils0012 | 正向: 从非空数组中选取元素存在于原数组 | 从非空数组中选取元素存在于原数组 | 通过 |
| testUtilsRandomUtils0013 | 正向: shuffle 返回等长数组且不修改原数组 | shuffle 返回等长数组且不修改原数组 | 通过 |
| testUtilsRandomUtils0014 | 正向: nextInRange 返回值为 min + n*step 之一 | nextInRange 返回值为 min + n*step 之一 | 通过 |
| testUtilsRandomUtils0015 | 边界: step <= 0 或 min > max 时返回 min | step <= 0 或 min > max 时返回 min | 通过 |
| testUtilsRandomUtils0016 | 正向: weightedRandom 返回值在候选列表中 | weightedRandom 返回值在候选列表中 | 通过 |
| testUtilsRandomUtils0017 | 边界: items 与 weights 长度不一致返回 undefined | items 与 weights 长度不一致返回 undefined | 通过 |
| testUtilsRandomUtils0018 | 边界: 全零权重时仍返回候选之一 | 全零权重时仍返回候选之一 | 通过 |

## UtilsStringUtilsTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsStringUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsStringUtils0001 | 正向: 首字母大写 | 首字母大写 | 通过 |
| testUtilsStringUtils0002 | 正向: 驼峰转换 | 驼峰转换 | 通过 |
| testUtilsStringUtils0003 | 正向: 蛇形转换 | 蛇形转换 | 通过 |
| testUtilsStringUtils0004 | 正向: 包含检查 | 包含检查 | 通过 |
| testUtilsStringUtils0005 | 正向: 前缀检查 | 前缀检查 | 通过 |
| testUtilsStringUtils0006 | 正向: 后缀检查 | 后缀检查 | 通过 |
| testUtilsStringUtils0007 | 正向: 重复字符串 | 重复字符串 | 通过 |
| testUtilsStringUtils0008 | 正向: 反转字符串 | 反转字符串 | 通过 |
| testUtilsStringUtils0009 | 正向: 移除空白 | 移除空白 | 通过 |
| testUtilsStringUtils0010 | 正向: 随机字符串长度 | 随机字符串长度 | 通过 |
| testUtilsStringUtils0011 | 正向: 哈希值一致性 | 哈希值一致性 | 通过 |
| testUtilsStringUtils0012 | 边界: 空字符串 | 空字符串 | 通过 |
| testUtilsStringUtils0013 | 边界: 零次重复 | 零次重复 | 通过 |

## UtilsTypeUtilsTest XTS 用例

分类：工具类。测试文件：`entry/src/ohosTest/ets/test/Utils/UtilsTypeUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUtilsTypeUtils0001 | 正向: 字符串判断 | 字符串判断 | 通过 |
| testUtilsTypeUtils0002 | 正向: 数字判断 | 数字判断 | 通过 |
| testUtilsTypeUtils0003 | 正向: 布尔判断 | 布尔判断 | 通过 |
| testUtilsTypeUtils0004 | 正向: 对象判断 | 对象判断 | 通过 |
| testUtilsTypeUtils0005 | 正向: 数组判断 | 数组判断 | 通过 |
| testUtilsTypeUtils0006 | 正向: null判断 | null判断 | 通过 |
| testUtilsTypeUtils0007 | 正向: undefined判断 | undefined判断 | 通过 |
| testUtilsTypeUtils0008 | 正向: 空字符串 | 空字符串 | 通过 |
| testUtilsTypeUtils0009 | 正向: 空对象 | 空对象 | 通过 |
| testUtilsTypeUtils0010 | 正向: 空数组 | 空数组 | 通过 |
| testUtilsTypeUtils0011 | 正向: 转字符串 | 转字符串 | 通过 |
| testUtilsTypeUtils0012 | 正向: 转数字 | 转数字 | 通过 |
| testUtilsTypeUtils0013 | 正向: 转布尔 | 转布尔 | 通过 |
| testUtilsTypeUtils0014 | 正向: 获取类型 | 获取类型 | 通过 |

## ValidateChannelIdTest XTS 用例

分类：校验。测试文件：`entry/src/ohosTest/ets/test/Validation/ValidationChannelId.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testValidationChannelId0001 | 正向: 合法渠道号验证通过 | 合法渠道号验证通过 | 通过 |
| testValidationChannelId0002 | 正向: 单字符渠道号验证通过 | 单字符渠道号验证通过 | 通过 |
| testValidationChannelId0003 | 反向: 空字符串验证失败 | 空字符串验证失败 | 通过 |
| testValidationChannelId0004 | 反向: 纯空白字符串验证失败 | 纯空白字符串验证失败 | 通过 |
| testValidationChannelId0005 | 边界: 超长渠道号验证（超过64字符） | 超长渠道号验证（超过64字符） | 通过 |
| testValidationChannelId0006 | 边界: 恰好64字符的渠道号验证通过 | 恰好64字符的渠道号验证通过 | 通过 |
| testValidationChannelId0007 | 边界: 特殊字符渠道号验证通过（工具类不限制字符类型） | 特殊字符渠道号验证通过（工具类不限制字符类型） | 通过 |

## ClipboardUtilsTest XTS 用例

分类：校验。测试文件：`entry/src/ohosTest/ets/test/Validation/ValidationClipboardUtils.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testValidationClipboardUtils0001 | 正向: setData 后 getData 返回写入的数据 | setData 后 getData 返回写入的数据 | 通过 |
| testValidationClipboardUtils0002 | 正向: clear 后数据清空且 hasData 返回 false | clear 后数据清空且 hasData 返回 false | 通过 |
| testValidationClipboardUtils0003 | 正向: 多次 setData 后者覆盖前者 | 多次 setData 后者覆盖前者 | 通过 |
| testValidationClipboardUtils0004 | 正向: 写入 URL 自动识别为 URL 类型 | 写入 URL 自动识别为 URL 类型 | 通过 |
| testValidationClipboardUtils0005 | 正向: 写入 HTML 内容自动识别为 HTML 类型 | 写入 HTML 内容自动识别为 HTML 类型 | 通过 |
| testValidationClipboardUtils0006 | 正向: 写入 image:// 前缀自动识别为 IMAGE 类型 | 写入 image:// 前缀自动识别为 IMAGE 类型 | 通过 |
| testValidationClipboardUtils0007 | 边界: 空字符串数据类型为 UNKNOWN | 空字符串数据类型为 UNKNOWN | 通过 |
| testValidationClipboardUtils0008 | 正向: 添加监听器后 getListenerCount 递增 | 添加监听器后 getListenerCount 递增 | 通过 |
| testValidationClipboardUtils0009 | 正向: 移除监听器后 getListenerCount 递减 | 移除监听器后 getListenerCount 递减 | 通过 |
| testValidationClipboardUtils0010 | 正向: setData 时监听器收到正确回调 | setData 时监听器收到正确回调 | 通过 |
| testValidationClipboardUtils0011 | 正向: 各枚举值对应正确的中文标签 | 各枚举值对应正确的中文标签 | 通过 |
| testValidationClipboardUtils0012 | 正向: isUrl 识别合法/非法 URL | isUrl 识别合法/非法 URL | 通过 |
| testValidationClipboardUtils0013 | 正向: isHtml 识别包含 HTML 标签的字符串 | isHtml 识别包含 HTML 标签的字符串 | 通过 |
| testValidationClipboardUtils0014 | 正向: parseClipboardContent 按优先级正确识别各类型 | parseClipboardContent 按优先级正确识别各类型 | 通过 |
| testValidationClipboardUtils0015 | 正向: setData/getData/clear 均记录操作历史 | setData/getData/clear 均记录操作历史 | 通过 |
| testValidationClipboardUtils0016 | 边界: 操作历史不超过最大条数 50 | 操作历史不超过最大条数 50 | 通过 |
| testValidationClipboardUtils0017 | 边界: 新建实例初始状态无数据、无监听器、无历史 | 新建实例初始状态无数据、无监听器、无历史 | 通过 |

## ValidateDeviceIdTest XTS 用例

分类：校验。测试文件：`entry/src/ohosTest/ets/test/Validation/ValidationDeviceId.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testValidationDeviceId0001 | 正向: 合法设备号验证通过 | 合法设备号验证通过 | 通过 |
| testValidationDeviceId0002 | 正向: 纯字母数字设备号验证通过 | 纯字母数字设备号验证通过 | 通过 |
| testValidationDeviceId0003 | 反向: 空字符串验证失败 | 空字符串验证失败 | 通过 |
| testValidationDeviceId0004 | 反向: 非法格式验证（含特殊字符） | 非法格式验证（含特殊字符） | 通过 |
| testValidationDeviceId0005 | 反向: 以连字符开头的设备号验证失败 | 以连字符开头的设备号验证失败 | 通过 |
| testValidationDeviceId0006 | 边界: 边界长度测试（少于最小长度2字符） | 边界长度测试（少于最小长度2字符） | 通过 |
| testValidationDeviceId0007 | 边界: 超过最大长度128字符验证失败 | 超过最大长度128字符验证失败 | 通过 |
| testValidationDeviceId0008 | 边界: 恰好最小长度2字符验证通过 | 恰好最小长度2字符验证通过 | 通过 |

## FormValidatorTest XTS 用例

分类：校验。测试文件：`entry/src/ohosTest/ets/test/Validation/ValidationFormValidator.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testValidationFormValidator0001 | 正向: 添加规则后 getRuleCount 递增 | 添加规则后 getRuleCount 递增 | 通过 |
| testValidationFormValidator0002 | 正向: 移除规则后 getRuleCount 递减 | 移除规则后 getRuleCount 递减 | 通过 |
| testValidationFormValidator0003 | 正向: clearRules 后规则数归零 | clearRules 后规则数归零 | 通过 |
| testValidationFormValidator0004 | 正向: 必填字段为空时验证失败 | 必填字段为空时验证失败 | 通过 |
| testValidationFormValidator0005 | 正向: 必填字段有值时验证通过 | 必填字段有值时验证通过 | 通过 |
| testValidationFormValidator0006 | 正向: 字段长度小于 minLength 时验证失败 | 字段长度小于 minLength 时验证失败 | 通过 |
| testValidationFormValidator0007 | 正向: 字段长度超过 maxLength 时验证失败 | 字段长度超过 maxLength 时验证失败 | 通过 |
| testValidationFormValidator0008 | 正向: 不匹配正则时验证失败 | 不匹配正则时验证失败 | 通过 |
| testValidationFormValidator0009 | 正向: 自定义验证器返回错误时验证失败 | 自定义验证器返回错误时验证失败 | 通过 |
| testValidationFormValidator0010 | 正向: 未注册规则的字段验证直接通过 | 未注册规则的字段验证直接通过 | 通过 |
| testValidationFormValidator0011 | 正向: isEmail 验证合法/非法邮箱 | isEmail 验证合法/非法邮箱 | 通过 |
| testValidationFormValidator0012 | 正向: isPhone 验证合法/非法手机号 | isPhone 验证合法/非法手机号 | 通过 |
| testValidationFormValidator0013 | 正向: isUrl 验证合法/非法 URL | isUrl 验证合法/非法 URL | 通过 |
| testValidationFormValidator0014 | 正向: isNotEmpty 验证非空 | isNotEmpty 验证非空 | 通过 |
| testValidationFormValidator0015 | 正向: matchesPattern 验证正则匹配 | matchesPattern 验证正则匹配 | 通过 |
| testValidationFormValidator0016 | 正向: 多字段综合验证，部分失败 | 多字段综合验证，部分失败 | 通过 |
| testValidationFormValidator0017 | 边界: 纯空格作为必填字段时验证失败（trim 后为空） | 纯空格作为必填字段时验证失败（trim 后为空） | 通过 |

## ValidationUtilsComprehensiveTest XTS 用例

分类：校验。测试文件：`entry/src/ohosTest/ets/test/Validation/ValidationUtilsComprehensive.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testValidationUtilsComprehensive0001 | 正向: 合法错误码(0, 1, 99999)验证通过 | 合法错误码(0, 1, 99999)验证通过 | 通过 |
| testValidationUtilsComprehensive0002 | 反向: 负数、超大值、非整数验证失败 | 负数、超大值、非整数验证失败 | 通过 |
| testValidationUtilsComprehensive0003 | 正向: 合法历史时间戳验证通过 | 合法历史时间戳验证通过 | 通过 |
| testValidationUtilsComprehensive0004 | 反向: 负数、零、未来时间、NaN、Infinity 验证失败 | 负数、零、未来时间、NaN、Infinity 验证失败 | 通过 |
| testValidationUtilsComprehensive0005 | 正向: 长度在范围内的字符串验证通过 | 长度在范围内的字符串验证通过 | 通过 |
| testValidationUtilsComprehensive0006 | 反向: 长度低于 minLen 验证失败 | 长度低于 minLen 验证失败 | 通过 |
| testValidationUtilsComprehensive0007 | 反向: 长度超过 maxLen 验证失败 | 长度超过 maxLen 验证失败 | 通过 |
| testValidationUtilsComprehensive0008 | 正向: 范围内的数值验证通过 | 范围内的数值验证通过 | 通过 |
| testValidationUtilsComprehensive0009 | 反向: 超出范围、NaN 验证失败 | 超出范围、NaN 验证失败 | 通过 |
| testValidationUtilsComprehensive0010 | 正向: 合法枚举值验证通过 | 合法枚举值验证通过 | 通过 |
| testValidationUtilsComprehensive0011 | 反向: 非法枚举值、空值、空列表验证失败 | 非法枚举值、空值、空列表验证失败 | 通过 |
| testValidationUtilsComprehensive0012 | 正向: 满足最小长度的数组验证通过 | 满足最小长度的数组验证通过 | 通过 |
| testValidationUtilsComprehensive0013 | 反向: 数组长度不足最小要求验证失败 | 数组长度不足最小要求验证失败 | 通过 |
| testValidationUtilsComprehensive0014 | 边界: 错误码恰好为 0 和 99999 边界值 | 错误码恰好为 0 和 99999 边界值 | 通过 |
| testValidationUtilsComprehensive0015 | 边界: minLen=0 允许空字符串 | minLen=0 允许空字符串 | 通过 |

## ValidationUtilsMethodsTest XTS 用例

分类：校验。测试文件：`entry/src/ohosTest/ets/test/Validation/ValidationUtilsMethods.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testValidationUtilsMethods0001 | 正向: 正常渠道号验证通过 | 正常渠道号验证通过 | 通过 |
| testValidationUtilsMethods0002 | 边界: 渠道号恰好 64 字符验证通过 | 渠道号恰好 64 字符验证通过 | 通过 |
| testValidationUtilsMethods0003 | 边界: 渠道号超过 64 字符验证失败 | 渠道号超过 64 字符验证失败 | 通过 |
| testValidationUtilsMethods0004 | 非法: 空字符串渠道号验证失败 | 空字符串渠道号验证失败 | 通过 |
| testValidationUtilsMethods0005 | 非法: 纯空格渠道号验证失败 | 纯空格渠道号验证失败 | 通过 |
| testValidationUtilsMethods0006 | 正向: 正常设备 ID 验证通过 | 正常设备 ID 验证通过 | 通过 |
| testValidationUtilsMethods0007 | 边界: 设备 ID 恰好 2 字符验证通过 | 设备 ID 恰好 2 字符验证通过 | 通过 |
| testValidationUtilsMethods0008 | 边界: 设备 ID 仅 1 字符验证失败 | 设备 ID 仅 1 字符验证失败 | 通过 |
| testValidationUtilsMethods0009 | 边界: 设备 ID 恰好 128 字符验证通过 | 设备 ID 恰好 128 字符验证通过 | 通过 |
| testValidationUtilsMethods0010 | 边界: 设备 ID 超过 128 字符验证失败 | 设备 ID 超过 128 字符验证失败 | 通过 |
| testValidationUtilsMethods0011 | 非法: 空字符串设备 ID 验证失败 | 空字符串设备 ID 验证失败 | 通过 |
| testValidationUtilsMethods0012 | 非法: 含特殊字符的设备 ID 验证失败 | 含特殊字符的设备 ID 验证失败 | 通过 |
| testValidationUtilsMethods0013 | 非法: 以连字符开头的设备 ID 验证失败 | 以连字符开头的设备 ID 验证失败 | 通过 |
| testValidationUtilsMethods0014 | 非法: 以连字符结尾的设备 ID 验证失败 | 以连字符结尾的设备 ID 验证失败 | 通过 |
| testValidationUtilsMethods0015 | 正向: 纯数字设备 ID 验证通过 | 纯数字设备 ID 验证通过 | 通过 |
| testValidationUtilsMethods0016 | 正向: 渠道号和设备 ID 验证结果互不干扰 | 渠道号和设备 ID 验证结果互不干扰 | 通过 |

## 测试执行记录

- 执行环境：OpenHarmony 标准系统（API 26，RK3568 开发板），DevEco Studio 5.0+。
- 构建：entry main 与 `entry@ohosTest` 测试 HAP 均 `BUILD SUCCESSFUL`，main / library / ohosTest 三棵源码树通过 ArkTS 编译。
- 用例审计：`files=54, total=627`，重名、重复编号、元数据缺失、命名与编号违规、静态断言不足 3 条的用例均为 0。
- 结果判读：以 `OHOS_REPORT_RESULT` 与 `Tests run` 行为准（状态码 `1` 用例开始、`0` 通过、`-2` 断言失败、`-1` 执行异常）；`TestFinished-ResultCode: 0` 仅表示 runner 执行完毕，不代表用例全部通过。
- 合入前说明：本轮改动涉及 main 源码与库实现，历史真机基线不能直接代表本轮结果，合入前需在目标设备重新安装并执行一次全量 ohosTest 回归。

## 已知环境限制与缺陷记录

以下问题在测试侧已定位但按边界不修改业务源码，仅记录：

1. **免打扰状态查询后端缺失**：`@ohos.intelligentScene` 依赖通知管理 SA（1190），当前镜像不含该能力，查询恒返回 `35200001`，相关用例改用两分支均确定的断言方式。
2. **`ChannelConfigModel.markFailed` 不清空 `channelId`**：与 `isSuccess()` 语义在失败分支下不一致。
3. **服务 `initialize()` 会新建模型实例**：外部旧引用失效，用例改为通过 `getDoNotDisturbModel()` 取活动实例。
4. **`IntelligentSceneService.isNotifyAllowedInDoNotDisturb()`** 进入 SUCCESS 前后可能经历 QUERYING，存在二次 `markSuccess` 冗余写入。
5. **`CustomDialogController` 回调裸方法传递丢失 `this`**：确认弹窗会终止应用，该路径不纳入 UI 用例。
