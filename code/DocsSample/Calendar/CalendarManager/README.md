# CalendarManager

### 介绍

本示例的包名为 `com.sample.calendarmanager`，演示通过 `@kit.CalendarKit` 创建、配置、查询和删除日历账户。

`CalendarManager` 管理 `Calendar`，账户信息由 `CalendarAccount` 描述，提醒与颜色由 `CalendarConfig` 描述。本工程展示账户管理，不包含日程事件编辑或共享功能。

生产入口为 [EntryAbility.ets](entry/src/main/ets/entryability/EntryAbility.ets)，SDK 调用封装见 [SdkCalendarAccount.ets](entry/src/main/ets/SdkCalendarAccount.ets)。接口完整声明位于所用 SDK 的 `ets/api/@ohos.calendarManager.d.ts`。

### 效果预览

![Index](screenshots/index.png)

### 使用说明

1. 创建日历账户对象。
2. 设置日历配置信息。
3. 查询指定日历账户。
4. 查询默认日历账户。
5. 查询所有日历账户。
6. 删除指定日历账户。

### 工程目录

```text
entry/src/
|---main/
|   |---ets/
|   |   |---CalendarAccountSession.ets             // 账户所有权与异步状态
|   |   |---CalendarPermission.ets                 // 权限判定与请求代际隔离
|   |   |---SdkCalendarAccount.ets                 // Calendar SDK 适配
|   |   |---entryability/EntryAbility.ets          // Stage 应用入口
|   |   |---entrybackupability/EntryBackupAbility.ets
|   |   |---pages/Index.ets                        // 六项账户操作
|   |---resources/                                // 应用资源
|   |---module.json5
|---ohosTest/
|   |---ets/
|   |   |---test/Ability.test.ets                  // 保留的 UI 用例
|   |   |---test/CalendarManagerLogic.test.ets     // 基础业务逻辑
|   |   |---test/CalendarManagerLifecycle.test.ets // 生命周期与迟到完成
|   |   |---test/CalendarManagerErrorBoundary.test.ets // 同步异常与异步交错
|   |   |---test/CalendarManagerMatrix.test.ets    // 27个逻辑矩阵分片注册
|   |   |---test/CalendarManagerSequence*.test.ets // 三步账户操作组合
|   |   |---test/CalendarManagerRecovery*.test.ets // 同步异常与异步拒绝后的恢复
|   |   |---test/CalendarManagerPermutation*.test.ets // 权限请求完成顺序
|   |   |---test/CalendarManagerValidation*.test.ets // 权限名与授权码边界
|   |   |---test/CalendarMatrixSupport.ets         // 记录型测试端口与挂起请求清理
|   |   |---test/CalendarManagerSdk.test.ets       // 真实设备与 SDK 场景
|   |   |---test/TestSupport.ets                  // 断言实际值日志
|   |   |---test/List.test.ets                    // 全部套件注册
|   |   |---testrunner/OpenHarmonyTestRunner.ets
```

### 具体实现
* [EntryAbility.ets](entry/src/main/ets/entryability/EntryAbility.ets) 请求 READ/WRITE 两项权限，两项均授权后才初始化 `calendarMgr`；销毁时使迟到请求失效。
* [Index.ets](entry/src/main/ets/pages/Index.ets) 通过 [CalendarAccountSession.ets](entry/src/main/ets/CalendarAccountSession.ets) 调用账户业务，未授权时不访问日历管理器。
* 创建账户：调用 `createCalendar()`，未完成的重复创建请求共享同一 Promise；账户名称和显示名称为 `MyCalendar`。
* 配置账户：先按指定账户调用 `getCalendar(account)`，再设置 `enableReminder: true` 和 `color: '#aabbcc'`。
* 查询账户：分别调用 `getCalendar(account)`、`getCalendar()` 和 `getAllCalendars()`；查询结果不转移可删除句柄的所有权。
* 删除账户：只向 SDK 提交当前会话成功创建的句柄，删除失败保留所有权供重试。
* 清理会话：只清理本地状态并隔离迟到完成，不删除设备日历数据。

逻辑测试、真实 SDK 测试及执行边界见 [ohosTest.md](ohosTest.md)。

### 相关权限

[ohos.permission.READ_CALENDAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/permissions-for-all-user#ohospermissionread_calendar)

[ohos.permission.WRITE_CALENDAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/permissions-for-all-user#ohospermissionwrite_calendar)

### 依赖

无额外业务依赖。开发依赖为 `@ohos/hypium` 1.0.24 和 `@ohos/hamock` 1.0.0，见 `oh-package.json5`。

### 约束与限制

1. 本示例为普通 ArkTS Stage 工程，`runtimeOS` 为 `OpenHarmony`，声明支持 `default` 和 `tablet` 设备。
2. 当前 `compileSdkVersion`、`compatibleSdkVersion`、`targetSdkVersion` 均为字符串 `26.0.0`；本地 SDK 路径为 `E:/sdk`。设备系统需满足兼容版本并提供 CalendarData 能力，不能由编译结果推定镜像兼容。
3. 使用支持该 SDK 和 Hvigor 6.0 工程的 DevEco Studio 工具链。本轮验证的是 `entry@default` 和 `entry@ohosTest` 构建，未验证设备安装、权限弹框、UI 或真实 SDK 运行。
4. 创建、配置和查询需要用户授予 `ohos.permission.READ_CALENDAR` 与 `ohos.permission.WRITE_CALENDAR`；权限未授予或请求失效时不得访问日历服务。
5. 本地签名配置用于现有开发环境，不应随代码提交；包名和签名身份的调整需要单独确认。

### 下载

如需单独下载本工程，执行如下命令：

```bash
git init
git config core.sparsecheckout true
echo code/DocsSample/Calendar/CalendarManager > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

以上以 `master` 为下载示例；实际提交时应与已确认的 PR 目标分支一致。