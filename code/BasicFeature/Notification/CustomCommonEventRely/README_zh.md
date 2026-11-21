# 应用外发布自定义公共事件

### 介绍

本示例是[事件的订阅和发布](../CustomCommonEvent)的配套应用，作为宿主应用之外的发布方，演示如何通过服务卡片和页面发布自定义公共事件，并观察事件的发布结果。主要功能如下：

1. 首页启动后自动订阅自定义公共事件 `Acts_CommonEvent_Test`，展示订阅状态、接收数量、最近一次事件数据与来源，以及按到达顺序排列的接收记录（最多保留 20 条）；
2. 点击首页“发布事件”按钮，以页面身份发布自定义公共事件，事件数据为 `OutApp`，并通过事件 `code` 字段携带来源标识 `1002`；
3. 在桌面添加本应用的服务卡片 `publishCard`，点击卡片按钮后由 [FormExtensionAbility](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-form-kit/js-apis-app-form-formExtensionAbility.md) 发布自定义公共事件，事件数据为 `OutApp`，来源标识为 `1001`，同时卡片上的发布次数递增；
4. 首页依据事件 `code` 字段区分事件来自卡片、本应用页面或外部应用，并在状态区域与记录列表中展示来源。

本示例使用 [commonEventManager](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-commonEventManager.md) 完成事件的订阅与发布，使用 [formProvider](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-form-kit/js-apis-app-form-formProvider.md)、[formBindingData](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-form-kit/js-apis-app-form-formBindingData.md) 完成卡片数据的构建与刷新，使用 [preferences](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) 保存接收记录，使用 [hilog](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) 输出日志。

### 效果预览

| 首页 | 服务卡片 |
|--------------------------------|--------------------------------|
| 展示事件名称、发布方、卡片名称、所需权限、订阅状态、接收数量、最近数据与来源以及接收记录列表 | 展示卡片标题、发布次数与发布按钮，点击按钮发布自定义公共事件 |

使用说明：

1. 先安装宿主应用[CustomCommonEvent](../CustomCommonEvent)，并在桌面添加本应用的服务卡片；
2. 打开本应用首页，页面自动订阅 `Acts_CommonEvent_Test`，状态提示变为已订阅；
3. 点击首页“发布事件”按钮，页面接收数量加 1，最近数据为 `OutApp`，最近来源为“页面”，接收记录列表新增一条记录；
4. 点击卡片发布按钮，事件发布成功且卡片发布次数递增，宿主应用在定向订阅场景下不会收到该事件；
5. 点击“订阅事件”与“取消订阅”按钮可在两种状态间切换，取消订阅后页面不再记录新事件；
6. 点击“清空接收记录”按钮，接收数量归零并重新显示空记录提示，记录序号从 1 重新开始；
7. 退出并重新打开首页，接收记录与最近数据从 preferences 恢复，记录不会丢失。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                    // 首页入口，加载 pages/Index
|---entryformability
|   |---EntryFormAbility.ets                // 卡片生命周期，处理卡片点击事件并刷新卡片
|---feature
|   |---CommonEventPublisher.ets            // 发布数据装配、发布请求校验与参数化发布
|   |---EventRecordManager.ets              // 记录校验、容量淘汰与时间格式化
|   |---EventRecordStore.ets                // 记录序列化与基于 preferences 的持久化
|   |---FormEventService.ets                // 卡片绑定数据、卡片消息解析与发布入口
|   |---FormPublishCounter.ets              // 每张卡片的发布次数
|   |---HomeStateModel.ets                  // 首页的订阅、发布与记录状态
|   |---SubscriptionManager.ets             // 订阅、取消订阅与订阅状态
|---pages
|   |---Index.ets                           // 首页，订阅、发布、清空与记录展示
|---util
|   |---Constants.ets                       // 事件契约、来源与状态资源键、布局常量
|   |---Logger.ets                          // 日志封装，支持替换日志出口
|---widget/pages
|   |---PublishCard.ets                     // 服务卡片页面
entry/src/ohosTest/ets/
|---test
|   |---...                                 // 51 个测试套件，统一在 List.test.ets 注册
|   |---List.test.ets                       // 用例注册入口
|---util
|   |---TestHelper.ets                      // 测试日志、轮询工具与事件收集器
|---testability
|   |---TestAbility.ets                     // 测试入口 Ability
|   |---pages/Index.ets                     // 测试页面
|---testrunner
|   |---OpenHarmonyTestRunner.ets           // 测试执行器
```

测试套件清单、用例明细与执行方式见 [ohosTest.md](ohosTest.md)。

### 具体实现

* 事件契约集中在 [Constants.ets](entry/src/main/ets/util/Constants.ets)，统一定义事件名称 `Acts_CommonEvent_Test`、事件数据 `InApp` 与 `OutApp`、本应用与宿主应用的包名、卡片名称以及来源标识 `EventSource.FORM`（1001）与 `EventSource.PAGE`（1002），页面、卡片与测试用例共用同一份契约；`SourceLabel` 负责来源码到资源键的映射，`StatusLabel` 负责首页状态到资源键的映射，页面据此保持 `$r('app.string.*')` 的静态映射，不在运行时拼接资源名。

* 事件发布封装在 [CommonEventPublisher.ets](entry/src/main/ets/feature/CommonEventPublisher.ets)：
    * `buildPublishData` 通过 `CommonEventPublishData` 的 `data` 字段携带事件数据、`code` 字段携带发布来源，避免使用类型宽松的 `parameters` 字段，便于订阅方识别来源；
    * `validatePublishRequest` 拒绝空事件名、首尾带空格的事件名以及超过 64 KB 的事件数据；
    * 请求非法时 `publishWithOptions` 返回失败的 Promise，`publishWith` 则按 `PublishOptions` 组装后发布。

* 接收记录管理封装在 [EventRecordManager.ets](entry/src/main/ets/feature/EventRecordManager.ets)：
    * 每次接收事件时递增序号并记录事件数据、来源码、来源名称与接收时间；
    * 记录数量超过容量上限时丢弃最早的一条记录，默认容量为 20 条；
    * `tryAdd` 校验事件数据与来源码，并以 `AddResult` 返回拒绝原因；`add` 保持宽松语义，不拒绝任何输入；
    * `getRecords` 返回记录副本，页面替换自身状态即可触发列表刷新；接收时间由可注入的 `ClockProvider` 提供。

* 记录持久化封装在 [EventRecordStore.ets](entry/src/main/ets/feature/EventRecordStore.ets)：
    * 记录序列化为仅含 `data`、`sourceCode`、`receivedTime` 的 JSON 数组，保存在名为 `event_records` 的 preferences 中；
    * `deserialize` 跳过非法 JSON、`null` 条目、字段类型错误的条目以及未通过校验的条目，并按到达顺序重新编号。

* 首页状态封装在 [HomeStateModel.ets](entry/src/main/ets/feature/HomeStateModel.ets)：
    * `HomeStatus` 覆盖就绪、已订阅、订阅失败、已取消订阅、发布中、发布成功、发布失败、已接收与已清空九种状态；
    * `publish` 在发布过程中忽略重复请求，`handleEvent` 拒绝非法事件，`clear` 复位计数、最近数据与来源；
    * `persist` 与 `restore` 通过注入的存储保存与恢复记录，`snapshot` 以固定字段顺序返回页面展示的全部取值。

* 订阅封装在 [SubscriptionManager.ets](entry/src/main/ets/feature/SubscriptionManager.ets)：`start` 通过可注入的 `SubscriberFactory` 创建订阅者并订阅事件，`stop` 释放订阅者，状态不匹配时两次调用均被忽略。

* 卡片逻辑封装在 [FormEventService.ets](entry/src/main/ets/feature/FormEventService.ets)、[FormPublishCounter.ets](entry/src/main/ets/feature/FormPublishCounter.ets) 与 [EntryFormAbility.ets](entry/src/main/ets/entryformability/EntryFormAbility.ets)：
    * `onAddForm` 使用 `formBindingData.createFormBindingData` 返回初始发布次数 0；
    * `onFormEvent` 先用 `parseMessage` 解析卡片消息，再以来源码 1001 发布事件，发布成功后累加该卡片的计数并调用 `formProvider.updateForm` 刷新卡片；
    * 消息不可用时 `parseMessage` 回落为 `OutApp`，并给出 `empty-message`、`missing-data`、`non-string-data`、`empty-data` 或 `invalid-json` 原因；
    * `onRemoveForm` 释放被移除卡片的计数，`onAcquireFormState` 返回 `formInfo.FormState.READY`，使卡片可随时添加。

* 首页 [Index.ets](entry/src/main/ets/pages/Index.ets) 在 `aboutToAppear` 中订阅事件并恢复已保存的记录，在 `aboutToDisappear` 中保存记录并取消订阅：
    * 发布按钮在发布过程中置为不可用，避免重复点击产生并发发布；
    * 页面文案全部来自 `$r('app.string.*')` 资源，并提供中文与英文两套资源，颜色同时在 `base` 与 `dark` 目录下定义。

* 服务卡片 [PublishCard.ets](entry/src/main/ets/widget/pages/PublishCard.ets) 使用 `LocalStorage` 与 `@LocalStorageProp('publishCount')` 绑定发布次数，点击按钮通过 `postCardAction` 向卡片提供方发送消息。

### 相关权限

[ohos.permission.REQUIRE_FORM](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionrequire_form)

[ohos.permission.GET_BUNDLE_INFO_PRIVILEGED](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionget_bundle_info_privileged)

### 依赖

本示例需要与[CustomCommonEvent](../CustomCommonEvent)配合运行，由宿主应用添加本应用的服务卡片，并订阅本应用发布的 `Acts_CommonEvent_Test` 事件。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：phone、tablet；
2. 本示例为 Stage 模型，仅支持 API 26 版本 SDK，`compileSdkVersion` 与 `compatibleSdkVersion` 均为 `26.0.0`；
3. 本示例需要使用配套 SDK 26 的 DevEco Studio 或 command-line-tools 才可编译运行；
4. 本示例使用的 `ohos.permission.REQUIRE_FORM` 与 `ohos.permission.GET_BUNDLE_INFO_PRIVILEGED` 为 system_basic 级别权限，需要配置高权限签名，签名方法可参考[特殊权限配置方法](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/hapsigntool-overview.md)；
5. 本示例的事件发布能力依赖系统公共事件框架，需要在正常启动的设备上运行。

### 测试

本示例在 `entry/src/ohosTest` 下提供 51 个自动化测试套件、共 1537 条用例，覆盖事件契约、记录管理、记录持久化、事件发布、卡片服务、首页状态机、订阅管理与首页 UI。用例在 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 中注册，清单与明细见 [ohosTest.md](ohosTest.md)。

构建与执行方式如下：

```
devecocli build --modules entry@default entry@ohosTest --auto-sign
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

安装完成后在 DevEco Studio 中选择 `entry@ohosTest` 运行配置执行；应用包名、测试模块名、运行器路径与超时参数见 [ohosTest.md](ohosTest.md)。

全量 1537 条用例按 `-s class` 分 6 批执行，每批独立进程，UI 套件放在最后一批；6 批合计 1537 条用例全部通过，失败 0 条、错误 0 条，每批均为 `TestFinished-ResultCode: 0`。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Notification/CustomCommonEventRely/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
