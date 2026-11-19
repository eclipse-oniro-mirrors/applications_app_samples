# Sensor capi hap测试用例归档

## 测试说明

本文依据本工程 `entry/src/ohosTest` 中已产出的测试代码和 2026 年 11 月 17 日的完整复测日志更新。保留原用例表的六列结构，UI 用例逐项列出，Native 参数化用例按功能和异常分支归档；表格行数不代表实际用例数量。

测试使用 `@ohos/hypium` 的 `describe/it/expect` 组织和断言。UI 用例通过 `@ohos.UiTest` 操作应用，使用异步等待确认页面和结果；Native 用例通过 `libsensor_test.so` 执行场景，测试桥接代码包含本工程的 C++ 实现，并 Mock 传感器接口、资源对象和等待过程。

UI 公共前置处理会唤醒屏幕、处理无凭据锁屏、启动 EntryAbility，等待两个操作按钮连续可见，并通过一次枚举操作使初始为空的结果文本可被定位。凭据锁屏需要事先解锁。结果显示在 `sensorCapiResult` 文本组件中，原表中的“弹出提示框”据此修正。

## 本次提交范围与运行前置条件

本次仅提交 `entry/src/ohosTest` 中的测试源码、非配置资源及本文档。工程配置、测试模块配置、`CMakeLists.txt` 和 `src/main` 业务代码改动需单独准备。Native 用例依赖 `libsensor_test.so`；测试桥接代码会包含 `entry/src/main/cpp/oh_sensor_capi.cpp`，运行前需在本地配置该测试库及其依赖，并准备匹配的模块、页面、资源和构建配置。

去订阅重试用例依赖业务实现具备第 1 次去订阅失败后保留订阅对象、重试成功后再销毁对象的行为。相关业务修复不包含在本次测试提交中，也不能通过修改断言规避。文中 2026 年 11 月 17 日的通过记录来自本地完整业务实现及配置下的既有复测日志；仅检出本次测试提交不足以重现该结果。

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与页面结构（Ability 0001） | 应用和测试包已安装，设备可解锁，公共前置处理完成 | 启动 EntryAbility，读取页面快照和组件 ID | getSensorInfos、subscriber 按钮文案正确；结果组件恰好 1 个；目标组件 ID 唯一 | 是 | Pass |
| 获取所有传感器信息（Sample 0001） | 成功拉起应用，页面稳定 | 点击 getSensorInfos 按钮 | 结果文本为 getSensorInfos:success，两个按钮文案保持不变 | 是 | Pass |
| 订阅与去订阅入口（Sample 0002） | 成功拉起应用，页面稳定 | 点击 subscriber 按钮 | Native 封装调用返回后，结果文本为 subscriber:success，按钮文案保持不变 | 是 | Pass |
| 枚举与订阅交替操作（Sample 0003） | 成功拉起应用，页面稳定 | 依次执行 getSensorInfos、subscriber、getSensorInfos | 3 次操作记录均符合预期，最后结果为 getSensorInfos:success | 是 | Pass |
| 重复订阅后再次枚举（Sample 0004） | 成功拉起应用，页面稳定 | 依次执行 subscriber、subscriber、getSensorInfos | 3 次操作均显示对应结果，重复操作后仍可执行枚举 | 是 | Pass |
| 枚举按钮坐标触控（Sample 0005） | 成功拉起应用，按钮边界有效 | 点击 getSensorInfos 按钮中心坐标 | 结果文本为 getSensorInfos:success | 是 | Pass |
| 订阅按钮坐标触控（Sample 0006） | 成功拉起应用，按钮边界有效 | 点击 subscriber 按钮中心坐标 | 结果文本为 subscriber:success | 是 | Pass |
| 结果只读与页面布局（Sample 0007） | 成功拉起应用，页面稳定 | 检查结果组件类型、按钮边界、纵向顺序与数量 | 结果为只读文本，位于操作区上方；按钮顺序和边界符合断言，按钮数量为 2 | 是 | Pass |
| 前后台切换保留结果（Sample 0008） | 已执行 getSensorInfos 并显示结果 | 将应用切到后台，再恢复前台 | 页面结构有效，结果仍为 getSensorInfos:success | 是 | Pass |
| Native 枚举正常与数量边界 | Native Mock 场景可执行 | 注入 0、1、2、3、32、63、64 个传感器及已生成的正常组合 | 枚举调用顺序和信息日志符合场景预期，已创建资源被释放 | 是 | Pass |
| Native 名称长度边界 | Native Mock 场景可执行 | 注入名称长度 1、2、31、62、63 的场景 | 名称及相关信息输出符合预期，无资源残留和违规访问 | 是 | Pass |
| Native 获取数量失败 | Native Mock 场景可执行 | 在 count 阶段分别注入 201、401、14500101 | 记录获取数量失败，后续获取流程停止，无资源残留 | 是 | Pass |
| Native 信息对象创建及列表获取失败 | Native Mock 场景可执行 | 注入 createInfos 创建失败，或 infos 阶段错误 | 调用轨迹和错误日志符合对应断言；已获得的资源按路径释放 | 是 | Pass |
| Native 信息字段读取失败 | Native Mock 场景可执行 | 在 name、vendor、infoType、resolution、minimum、maximum 等阶段按已有场景注入故障 | 在对应故障位置停止，输出匹配的错误和已完成的信息，释放信息对象 | 是 | Pass |
| Native 订阅对象创建失败 | Native Mock 场景可执行 | 分别使 createSubscriber、createId、createAttribute 创建失败 | 停止后续订阅步骤，释放当前路径已创建的对象 | 是 | Pass |
| Native 回调及订阅参数配置失败 | Native Mock 场景可执行 | 在 setCallback、setType、setInterval 阶段注入 201、401、14500101 | 记录对应错误，不继续订阅，资源释放和调用顺序符合预期 | 是 | Pass |
| Native 订阅接口失败 | Native Mock 场景可执行 | 在 subscribe 阶段注入 201、401、14500101 | 订阅失败日志正确，无活动订阅和资源残留 | 是 | Pass |
| Native 正常订阅生命周期 | Native Mock 场景可执行 | 执行创建对象、设置回调、设置类型与间隔、订阅、回调、去订阅流程 | 配置类型为 1、采样间隔为 200000000；记录逻辑等待 1000 ms；完成去订阅后释放对象 | 是 | Pass |
| Native 去订阅失败后重试 | Native Mock 场景可执行 | unsubscribe 第 1 次分别返回 201、401、14500101，后续重试成功 | 轨迹包含两次去订阅调用，保留第 1 次错误并记录最终成功；确认取消后再销毁对象，资源和活动订阅均归零 | 是 | Pass |
| Native 订阅期间收到空事件或空数据 | Native Mock 场景可执行 | 在订阅回调中传入空事件、空数据 | 回调记录对应错误并停止无效数据处理；订阅流程仍完成去订阅及资源清理 | 是 | Pass |
| Native 订阅期间事件读取失败 | Native Mock 场景可执行 | 在 timestamp、eventType、accuracy、data 阶段分别注入已生成的错误场景 | 回调停止后续字段读取，错误内容匹配；去订阅和清理仍完成 | 是 | Pass |
| Native 订阅回调数据组合 | Native Mock 场景可执行 | 使用已生成的数据长度、精度、事件类型和 seed 组合 | 回调次数、数据日志、订阅配置、等待记录和清理结果均匹配预期 | 是 | Pass |
| Native 独立回调空值处理 | Native Mock 场景可执行 | 直接调用回调，分别传入空事件和空数据 | 记录对应错误，不继续读取无效事件或数据 | 是 | Pass |
| Native 独立回调字段读取失败 | Native Mock 场景可执行 | timestamp、eventType、accuracy、data 分别注入 201、401、14500101 | 错误日志与短路调用轨迹符合预期，不执行故障之后的读取步骤 | 是 | Pass |
| Native 独立回调数据长度边界 | Native Mock 场景可执行 | 数据长度取 0、1、2、3、4、8、16、32、64 的已有场景 | 按有效长度处理数据，输出内容及调用轨迹符合预期，无违规访问 | 是 | Pass |
| Native 独立回调精度与类型组合 | Native Mock 场景可执行 | 精度取 0、1、2、3，事件类型包含 1、2、5、6、8、10，按源码已有组合执行 | 时间戳、类型、精度及各数据项的输出符合对应场景断言 | 是 | Pass |

Native 表中的取值表示已有用例覆盖的取值集合，不表示所有取值的笛卡尔积均已覆盖。各场景同时核对 `trace`、`errors`、`messages`、`liveResources`、`activeSubscriptions`、`violations`、`waitMs`、`configuredType`、`configuredInterval` 和 `callbacks`；具体期望值以各用例的断言为准。

## 用例文件与数量

以下路径均相对于本工程根目录 `SensorCapiSamples`；测试文件位于 `entry/src/ohosTest/ets/test`，统一由 `List.test.ets` 注册。

| 测试文件 | 测试范围 | 用例数 | 通过数 |
| --- | --- | --- | --- |
| Ability.test.ets | EntryAbility 启动与页面结构 | 1 | 1 |
| SensorCapiSample.test.ets | 页面操作、坐标触控、布局及前后台恢复 | 8 | 8 |
| Native/SensorEnumerationPart01.test.ets 至 SensorEnumerationPart20.test.ets | 传感器枚举、字段读取、边界及失败清理 | 328 | 328 |
| Native/SensorEventPart01.test.ets 至 SensorEventPart14.test.ets | 独立事件回调、空值、读取失败和数据组合 | 226 | 226 |
| Native/SensorSubscriptionPart01.test.ets 至 SensorSubscriptionPart44.test.ets | 订阅配置、回调、去订阅重试和资源生命周期 | 623 | 623 |
| 合计 | 9 个 UI/Ability 用例，1177 个 Native 用例 | 1186 | 1186 |

用例表中的 Ability 0001 对应 `testSensorAbilityTest0001`；Sample 0001～0008 对应 `testSensorCapiSampleTest0001`～`testSensorCapiSampleTest0008`。去订阅重试的三个用例位于 `Native/SensorSubscriptionPart03.test.ets`，当前用例名称尾号为 0001、0002、0003（`@tc.number` 尾号为 0100、0200、0300）。

`Shared/SharedDriver.ets` 提供设备与页面准备、UI 操作串行化、结果等待和页面断言；`Shared/NativeFixture.ets` 提供 Native 场景调用和观察结果解析；`entry/src/ohosTest/cpp/sensor_test_bridge.cpp` 提供 Mock、故障注入及调用和资源记录。

## 测试结果与范围

本次文档引用的完整复测日期为 2026 年 11 月 17 日。结果来自工程内已有的 `entry/build/default/outputs/ohosTest/runtime-fix/hypium-final.log`，逐用例记录共 1186 条通过结果，用例名称无重复，并与末尾汇总一致：

```text
Tests run: 1186, Failure: 0, Error: 0, Pass: 1186, Ignore: 0
TestFinished-ResultCode: 0
```

所有用例表中的 Pass 均指上述复测。此次提交修正了用例元数据和注释格式，并同步归档文档，未重新执行测试。历史日志保留修正前的名称：Ability/UI 名称尾号 0100、0200 等分别对应当前 0001、0002 等；Native 名称尾号同样按文件内位置从步长 100 改为连续序号。以上 Pass 为原始日志的历史结果，不代表修正后已重新复测。UI 用例的公共前置处理已在从熄屏锁屏状态开始的完整复测中通过；凭据锁屏仍需事先解锁。

UI 的 success 文本表示页面调用 Native 封装后正常返回，仅能证明该入口和页面结果更新符合断言，不能据此认定设备实际具备传感器、订阅服务成功或物理测量数据正确。1177 个 Native 用例验证的是本工程 C++ 业务逻辑在 Mock 场景下的行为，逻辑等待由测试桥接记录，不作为真实采样耗时结论。

另有针对持续去订阅失败的独立 Native 探针回归，未注册为本表的 Hypium 用例，未计入 1186 个用例统计。本文中的去订阅重试行仅描述已注册用例的“第 1 次失败、重试成功”路径。

## 门禁修复补充校验

2026 年 11 月 17 日，使用 SDK Native 工具链编译修复后的测试桥接代码，
并在主机环境回放现有 1177 个 Native Mock 场景。修复前后观察结果一致，
从用例中提取的 10192 项期望值全部匹配。另校验持续去订阅失败时的资源保留、
阻止重复订阅、恢复清理、输入边界及不支持的日志格式拒绝。

本轮还完成了 AArch64 测试库链接检查，未重新构建完整 HAP 或执行设备端 UI/Hypium 测试，
因此上述主机校验不更新表格中的设备复测记录。校验包含的业务实现仍为本地版本，
相关业务代码和构建配置继续单独准备。
