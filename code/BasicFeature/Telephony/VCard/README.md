# vCard 联系人

## 介绍

本示例是一个联系人管理场景，演示如何在 OpenHarmony 应用中使用 vCard 电子名片能力。数据源是系统联系人数据库，导入与导出走系统 vCard 接口。特性能力全部封装在可独立编译的 Library HAR 中，entry 只负责场景编排与界面展示。

用到的两个系统包：

- `@ohos.telephony.vcard`（TelephonyKit）：VCF 文件的导入与导出；
- `@ohos.contact`（ContactsKit）：联系人查询，新建，更新，删除。

具备的功能：导入 VCF，导出 VCF，联系人浏览与检索，联系人新建/编辑/删除，操作记录，偏好设置。

## 效果预览

界面分为四个页签。手机使用底部导航，平板（宽度 ≥ 600vp）自动切换为左侧导航：

- 联系人：权限状态卡片，搜索框，按首字母排序的联系人列表，点击进入详情可新建/编辑/删除。未授权时可以加载随包示例 VCF 进入演示模式。
- vCard 工具：权限与系统能力自检，选择 VCF 文件或导入示例 vCard，解析预览（版本与名片数，以及电话/邮箱/组织/地址统计），按范围与版本导出，展示导出路径、文件大小与名片数并支持另存为。
- 记录：总数，导入，导出，联系人变更，成功五项统计，支持按类型筛选与清空。
- 设置：默认 vCard 版本，默认编码，导入后返回联系人开关，历史保留条数，权限说明，沙箱文件清理与关于信息。

> 真机截图待补充（本次交付未构建运行）。

### 使用说明

1. 启动应用后进入联系人页签。已授予联系人权限时列表展示系统联系人，输入姓名/电话/邮箱片段即可检索，清空输入恢复完整列表。
2. 未授予权限时点击“加载示例联系人”，基于随包 `entry/src/main/resources/rawfile/sample_contacts.vcf` 浏览演示数据。
3. 进入 vCard 工具页签，点击“选择 VCF 文件”在系统文件选择器中选中 .vcf 文件，应用会把文件复制到沙箱并展示解析预览。
4. 点击“开始导入”调用系统接口写入联系人数据库。成功或失败都会写入操作记录，失败时按错误码给出原因与建议。
5. 在导出区域选择导出范围（全部联系人或手动选择），vCard 版本（2.1/3.0/4.0）与编码（UTF-8/GBK）后点击“开始导出”，可查看沙箱路径，文件大小与 VCF 内容预览。
6. 点击“另存为”把导出结果保存到用户选择的位置。
7. 在联系人详情页编辑姓名，电话，邮箱，公司与备注，也可以删除联系人。
8. 进入记录页签查看导入导出历史，可筛选或清空。
9. 进入设置页签调整默认版本，默认编码，自动跳转开关与历史保留条数，也可以清理沙箱中的导入导出文件。

## 工程目录

```
entry/src/main/ets/
|---entryability/
|   |---EntryAbility.ets                     // 应用入口，加载 pages/Index
|---pages/
|   |---Index.ets                            // 唯一入口页面，渲染 MainPage
|---vcard/
|   |---MainPage.ets                         // 四个页签与一多导航
|   |---ContactsHost.ets                     // 联系人列表/详情/编辑三态切换
|   |---pages/
|   |   |---ContactListPage.ets              // 联系人列表与检索
|   |   |---ContactDetailPage.ets            // 联系人详情
|   |   |---ContactEditPage.ets              // 新建与编辑联系人
|   |   |---ToolboxPage.ets                  // 导入导出工具箱
|   |   |---HistoryPage.ets                  // 操作记录
|   |   |---SettingsPage.ets                 // 设置
|   |---viewmodel/
|   |   |---ContactViewModel.ets             // 联系人加载，检索，增删改
|   |   |---ToolboxViewModel.ets             // 导入导出编排
|   |   |---HistoryViewModel.ets             // 记录统计与筛选
|   |   |---SettingsViewModel.ets            // 设置读写与清理
Library/src/main/ets/vcardmanager/
|---VCardManager.ets                        // 对外门面，entry 只调用这里
|---feature/
|   |---PermissionService.ets                // 权限声明与申请
|   |---ContactService.ets                   // 联系人查询与增删改
|   |---VCardParser.ets                      // VCF 解析预览
|   |---VCardImportService.ets               // 导入流程
|   |---VCardExportService.ets               // 导出与另存为
|   |---FileService.ets                      // 沙箱文件与清理
|   |---HistoryStore.ets                     // 记录持久化
|   |---SettingsStore.ets                    // 设置持久化
|---components/
|   |---SectionCard.ets                      // 分组卡片
|   |---InfoRow.ets                          // 字段行
|   |---ContactAvatar.ets                    // 姓名首字母头像
|   |---StatusChip.ets                       // 状态标记
|   |---EmptyState.ets                       // 空状态
|   |---FormField.ets                        // 表单输入
|---model/
|   |---ContactTypes.ets                     // 联系人模型
|   |---VCardTypes.ets                       // vCard 模型
|   |---HistoryTypes.ets                     // 记录模型
|---common/
|   |---ErrorCodeMap.ets                     // 错误码映射
|   |---VCardConstants.ets                   // 常量
|---utils/
|   |---Logger.ets                           // hilog 封装
entry/src/ohosTest/ets/test/
|---VCard.test.ets                           // UI 自动化用例
|---List.test.ets                            // 用例入口
```

## 具体实现

### Library 能力封装

- 对外门面是 `Library/src/main/ets/vcardmanager/VCardManager.ets`，页面只调用这里暴露的静态方法，不直接引用系统接口。
- VCF 导入：`Library/src/main/ets/vcardmanager/feature/VCardImportService.ets` 使用 `picker.DocumentViewPicker` 选择文件，把 URI 复制到 `context.filesDir/vcard/import`，再以沙箱完整路径调用 `vcard.importVCard`。导入前由 `Library/src/main/ets/vcardmanager/feature/VCardParser.ets` 自行解析文件，统计名片数与字段数量用于预览。
- VCF 导出：`Library/src/main/ets/vcardmanager/feature/VCardExportService.ets` 通过 `dataSharePredicates` 构造查询条件（全部联系人或 `predicates.in('id', ids)`），调用 `vcard.exportVCard` 生成 VCF，读取文本用于预览。另存为使用 `picker.DocumentViewPicker.save` 与 `fileIo.copyFile`。
- 联系人读写：`Library/src/main/ets/vcardmanager/feature/ContactService.ets` 调用 `contact.queryContacts`，`contact.addContact`，`contact.updateContact`，`contact.deleteContact`。编辑时只更新主电话与主邮箱，其余号码保留。
- 权限：`Library/src/main/ets/vcardmanager/feature/PermissionService.ets` 读取声明状态与授权状态，并通过 `abilityAccessCtrl` 申请 `ohos.permission.READ_CONTACTS` 与 `ohos.permission.WRITE_CONTACTS`。
- 持久化：`HistoryStore.ets` 与 `SettingsStore.ets` 使用 `preferences` 保存操作记录与偏好设置。`FileService.ets` 负责沙箱目录创建，文件复制与清理。
- 错误码：`Library/src/main/ets/vcardmanager/common/ErrorCodeMap.ets` 把 201，401，8300001，8300003，8300999 映射为标题，原因与处理建议。

### entry 场景实现

- `entry/src/main/ets/pages/Index.ets` 是唯一页面入口，直接渲染 `entry/src/main/ets/vcard/MainPage.ets`。
- `MainPage.ets` 使用 `Tabs` 承载四个页签。根节点通过 `onAreaChange` 判断宽度，≥ 600vp 时切换为左侧竖向导航，否则保持底部导航。
- 页面刷新由 token 驱动：`ContactsHost` 与 `HistoryPage` 接收自增的 `refreshToken` 后重新加载数据。工具箱导入成功后通过 `onOpenContacts` 回到联系人页。
- 联系人三态与增删改在 `entry/src/main/ets/vcard/pages/ContactListPage.ets`，`ContactDetailPage.ets`，`ContactEditPage.ets` 中实现，状态由 `entry/src/main/ets/vcard/viewmodel/ContactViewModel.ets` 维护。
- 导入导出界面在 `entry/src/main/ets/vcard/pages/ToolboxPage.ets`，编排逻辑在 `entry/src/main/ets/vcard/viewmodel/ToolboxViewModel.ets`。

## 相关权限

- `ohos.permission.READ_CONTACTS`：查询联系人，构建导出条件。
- `ohos.permission.WRITE_CONTACTS`：把 VCF 导入联系人数据库，新建/编辑/删除联系人。

两项都是 system_basic 级别的 user_grant 受限权限，普通签名无法获得，安装时需要配置 ACL 高权限签名。未授权时调用系统接口会返回 201。本示例会展示错误码解释，并在联系人页提供“加载示例联系人”的降级演示，示例数据来自随包 VCF，不会写入系统联系人。

## 依赖

本示例不依赖其它 Sample。`Library` 是本工程内的 HAR 模块，entry 通过 `"library": "file:../Library"` 依赖它。

## 约束与限制

- 本示例仅支持标准系统上运行，支持设备：phone，tablet。
- 本示例要求 API 23 及以上（`@ohos.telephony.vcard` 自 API 23 起公开）。targetSdkVersion 为 26.0.0，compatibleSdkVersion 为 6.1.1(24)。
- 本示例需要使用 DevEco Studio 5.0 及以上版本编译运行。
- 真实读写联系人需要 `READ_CONTACTS` 与 `WRITE_CONTACTS` 对应的 ACL 高权限签名，否则导入导出会返回 201。
- 设备需要具备 SystemCapability.Telephony.CoreService 能力，设置页会展示能力自检结果。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/VCard/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
