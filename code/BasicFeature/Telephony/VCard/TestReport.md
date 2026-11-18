# vCard 联系人测试报告

## 测试环境

| 项目 | 说明                                                         |
| --- |------------------------------------------------------------|
| 设备型号 | dayu200（RK3568）真机                                                    |
| 应用包名 | com.samples.vcard                                          |
| 系统 | OpenHarmony 7.1.0.22                                       |
| SDK | `compatibleSdkVersion` / `targetSdkVersion` 均为 `26.0.0`    |
| 测试框架 | `@ohos/hypium` + `OpenHarmonyTestRunner`（模块名 `entry_test`） |
| 签名 | DevEco 自动签名（debugKey），安装包与测试包同一套证书                         |
| 权限 | ohos.permission.READ_CONTACTS，ohos.permission.WRITE_CONTACTS                             |

## 测试场景

| 用例编号 | 前置条件 | 操作步骤 | 预期结果 | 实际结果 |
| --- | --- | --- | --- |------|
| VCard_BrowseSearch_001 | 已授予 READ_CONTACTS，系统存在联系人 | 启动应用，进入联系人页签，输入姓名片段，清空输入 | 列表按首字母排序显示联系人，检索实时过滤，清空后恢复完整列表 | Pass |
| VCard_Permission_001 | 未授予联系人权限 | 进入联系人页签，点击“申请权限”，在系统弹窗中允许 | 弹出权限申请框，授予后列表加载系统联系人，未授予时展示权限说明与示例数据入口 | Pass |
| VCard_ImportPreview_001 | 无 | 进入 vCard 工具页签，点击“选择 VCF 文件”选中 .vcf，或点击“导入示例 vCard” | 文件复制到沙箱，展示文件名，大小，vCard 版本，名片数与电话/邮箱/组织/地址统计 | Pass |
| VCard_Import_001 | 已有解析预览结果，已授予 READ_CONTACTS 与 WRITE_CONTACTS | 点击“开始导入” | 调用 vcard.importVCard 成功，提示导入完成并写入操作记录；未授权时展示错误码 201 的原因与建议 | Pass |
| VCard_Export_001 | 已授予 READ_CONTACTS | 进入工具箱，选择导出范围与 vCard 3.0，点击“开始导出” | 调用 vcard.exportVCard 生成 VCF，展示沙箱路径，文件大小与名片数，并可点击“另存为” | Pass |
| VCard_ExportSave_001 | 已有导出结果 | 点击“另存为”，在系统保存器中选择位置并确认 | 文件写入所选位置，提示已保存；取消时提示已取消保存 | Pass |
| VCard_ContactEdit_001 | 已授予 READ_CONTACTS 与 WRITE_CONTACTS | 新建联系人并保存，进入详情修改公司后保存，再确认删除 | 分别调用 contact.addContact，contact.updateContact，contact.deleteContact，列表与详情同步刷新并写入记录 | Pass |
| VCard_History_001 | 已执行至少一次导入与一次导出 | 进入记录页签，查看统计，切换“导入”筛选，点击清空并确认 | 统计数字与列表一致，筛选只保留导入记录，清空后列表与统计归零 | Pass |
| VCard_Settings_001 | 无 | 进入设置页签，切换默认版本为 3.0，关闭自动跳转，退出应用后重新进入 | 设置通过 preferences 持久化，重新进入后保持上次选择，导出卡片默认使用 3.0 | Pass |
| VCard_CleanSandbox_001 | 沙箱内存在导入缓存或导出结果 | 进入设置页签，点击“清理沙箱 vCard 文件” | 删除导入缓存与导出结果，提示已清理的文件数量；无文件时提示无需清理 | Pass |

## 自动化用例清单

UI 自动化用例位于 `entry/src/ohosTest/ets/test/VCard.test.ets`，由 `entry/src/ohosTest/ets/test/List.test.ets` 注册，基于 Hypium 与 TestKit Driver 编写，DOMAIN 为 0xF811，日志前缀为 `[Sample_VCard]`。

| 用例名称 | 覆盖场景 |
| --- | --- |
| VCard_MainTabs_001 | 校验首页品牌区，依次切换联系人，工具箱，记录，设置四个页签 |
| VCard_ContactsPermission_001 | 校验联系人页可进入，检索区存在，权限申请入口与联系人列表至少存在其一 |
| VCard_ToolboxPreview_001 | 校验选文件，示例导入，导出三个入口，示例导入后出现解析预览面板 |
| VCard_HistoryPage_001 | 校验记录页根节点与全部，导入两个筛选项 |
| VCard_SettingsPage_001 | 校验三个默认版本选项与自动跳转开关，点击 3.0 后仍存在 |
