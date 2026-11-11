# 快捷方式（Shortcut）

[English](<README.md>) · [测试用例与验证状态](<ohosTest.md>)

## 介绍

本示例使用 OpenHarmony Stage 模型和 ArkUI，展示静态桌面快捷方式的能力检测、查询和显隐设置，并提供便签、按日期管理的待办、收藏资料三个业务入口。快捷方式配置见 [shortcuts_config.json](<entry/src/main/resources/base/profile/shortcuts_config.json>)，应用标识为 `com.example.shortcut`。

## 功能与使用

1. 安装应用后打开首页，检查设备是否支持快捷方式。支持时查询当前应用的入口；也可手动重新检测、刷新和查看调用记录。
2. 在支持快捷方式的桌面长按应用图标，选择“新建便签”“今日待办”或“收藏资料”；冷启动和热启动均经同一路由协调器校验 `sc.action/sc.version/sc.filter`。
3. 单个入口支持显示/隐藏；批量设置必须先选择入口、预览并确认。批次记录最多保留5批；执行结果区分已确认、已核对失败、未知与未执行。
4. 批次恢复不是平台原子回滚。未知结果先核对，不盲目重放；原值未知不能精确补偿；外部改动须明确选择保留或覆盖。错误读取/存档失败时禁止继续盲写。
5. 便签支持编辑草稿、版本历史、行级差异、冲突分支和回收站。回收站保留30天；永久删除不可撤销，批量操作在单个根文档中提交，不能把它改成逐条独立写入。
6. 待办支持日期切换、历史查看、完成/未完成筛选与编辑；收藏支持搜索、分类和收藏标记。规则中心展示纯本地路由、检索、筛选、到期/重复等规则，不提供系统定时提醒、跨设备同步或网络业务。

## 国际化与数据安全

- 界面文案使用默认英文与 `zh_CN` 中文资源；字符串型 API 经 [Strings.ets](<entry/src/main/ets/i18n/Strings.ets>) 解析，入口在初始化业务前绑定资源。静态规则说明采用延迟解析，避免模块加载时锁定语言。
- 已存储的便签标题、正文、待办内容、分类/筛选协议值、标签同义词、快捷方式 ID 与持久化 key 不随界面语言改写。内置中文样例用于验证中文检索，属于业务输入数据，不是界面翻译失败。
- 业务存储使用 `shortcut_business_v1/workspace`；显隐批次使用 `shortcut_visibility_batches_v1/journal`。写入结果不确定时重新读取核对，避免重复写入或覆盖未知数据。
- 统一诊断 Domain 为 `0xF811`，Tag 为 `[Sample_Shortcut]`。遥测只记录固定阶段、生成的关联号与耗时，不记录便签内容、Want、业务文档或用户输入。

## 工程结构与实现

- [EntryAbility.ets](<entry/src/main/ets/entryability/EntryAbility.ets>)：资源绑定、生命周期、冷/热启动。
- [ShortcutService.ets](<entry/src/main/ets/services/ShortcutService.ets>)：SDK调用、批次预览、核对、重试和补偿；[VisibilityBatch.ets](<entry/src/main/ets/services/VisibilityBatch.ets>)：批次事实模型与存档校验。
- [AppNavigation.ets](<entry/src/main/ets/navigation/AppNavigation.ets>)：路由、未保存编辑确认、迟到回调隔离。
- [BusinessStore.ets](<entry/src/main/ets/business/BusinessStore.ets>)：工作区、历史、回收站、持久化恢复；[BusinessStorage.ets](<entry/src/main/ets/business/BusinessStorage.ets>)：Preferences边界。
- [NoteRecyclePanel.ets](<entry/src/main/ets/components/NoteRecyclePanel.ets>)：实际回收站组件，隔离UI测试复用同一实现。
- [List.test.ets](<entry/src/ohosTest/ets/test/List.test.ets>)：设备测试入口；[CaseScope.ets](<entry/src/ohosTest/ets/support/CaseScope.ets>)：watchdog、清理、共享用例日志。

## 效果预览

本轮没有运行应用或拍摄真机截图，因此不附伪造截图或宣称效果已通过。待在目标设备补充首页、批量预览、便签回收站的中英文截图；需核对长文案换行与深色模式。

## 权限与依赖

主模块未声明 `requestPermissions`。快捷方式能力受设备、桌面和平台支持情况限制，示例会展示不支持/调用失败而不是假装成功。测试依赖 `@ohos/hypium` 1.0.25；使用 SDK 的 AbilityKit、ArkUI、ArkData、LocalizationKit、PerformanceAnalysisKit、BasicServicesKit、TestKit。

## 环境、运行和限制

- 保留工程现有 SDK `26.0.0` 与 `modelVersion: 26.0.0`，运行系统为 OpenHarmony，设备类型为 `default`。工具链兼容性由集成环境确认，不自行降级版本。
- 使用匹配 SDK26 的 DevEco Studio 打开工程、配置本地签名后部署。交付树不包含个人签名证书或密钥。
- 便签与回收站各最多50条，总历史最多100条，根文档UTF-8预算8MiB；超限明确拒绝而非静默截断用户内容。
- 按用户要求，**这批修改未执行编译、构建、类型检查、应用或设备测试**。纯文本/JSON/引用检查不代表构建或真机PASS；全部测试的待验证状态见 [ohosTest.md](<ohosTest.md>)。

## 获取示例

本地交付目录是 `xiugai/Shortcut`。合入仓库后的最终目录尚待维护者确认；不能把该本地目录当作已存在的远端路径。确认最终目录后可使用稀疏检出（以下仅示意，不在本轮执行）：

```sh
git clone --filter=blob:none --sparse https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout set <维护者确认的Shortcut目录>
```
