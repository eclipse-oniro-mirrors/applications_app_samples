# 应用接续（AppContinuation）

## 介绍

本示例面向 OpenHarmony API 26，演示 `continueManager` 监听注册/注销、UIAbility 普通接续与快速拉起接续，以及文本、笔记、阅读进度和表单草稿恢复。业务状态、系统快速结果、窗口加载和实际控件定位分别记录，不能以页面出现或接口同步返回代替恢复成功。

首页的协议、准入、冲突与场景目录是**本示例的教学模型和策略**，不是平台对所有设备组合的能力承诺；真实跨设备能力需通过获得授权的系统接续入口验证。

## 功能与交互

| 页面 / 区域 | 操作 | 可观察结果 |
|---|---|---|
| 工作台 | 检查环境；主动申请分布式权限；注册 `on` / 注销 `off` | 分开显示同步返回、异步通知和超时；失败不冒充成功 |
| 文本 | 编辑、选择、保存、另存新文档、清空 | 本机持久化、文档身份与修订；接续目标文本及选择区恢复 |
| 笔记 | 编辑标题/正文、保存/放弃、恢复历史 | 保留未保存状态与保存基线；历史恢复产生新修订 |
| 阅读 | 切换章节/段落，添加或删除书签，保存进度 | 只传书籍标识和位置，不传书籍文件；本地随包内容用于展示 |
| 表单 | 分步填写、校验、保存草稿、确认完成 | 字段及步骤恢复；仅本地示例，不向服务器提交 |
| 备份与恢复 | 生成/复制备份；粘贴完整文本；选择场景；校验预览；确认恢复 | 预览不写盘；未选场景和草稿保留；失败补偿或冻结后续写入 |
| 记录 / 调用详情 | 查看事实、建议、脱敏平台字段和事件；主动复制摘要 | 不自动重试，不把诊断界面当作第二个运行时 |

正常启动不自动执行 SDK 探测，不自动读取剪贴板，不自动发起跨设备接续。注销第三个参数使用独立完成回调，保留注销等待和迟到回调隔离。

## 实现结构

- [EntryAbility.ets](entry/src/main/ets/entryability/EntryAbility.ets)：Ability 生命周期、系统启动原因枚举、固定页面路由和窗口代次隔离。
- [LearningController.ets](entry/src/main/ets/learning/LearningController.ets)：Ability 作用域状态机，候选校验、冲突选择、阶段超时、原子持久化、页面定位回执。
- [ContinueClient.ets](entry/src/main/ets/learning/ContinueClient.ets)：SDK 调用边界、独立注销代次、结果脱敏。
- [LearningPorts.ets](entry/src/main/ets/learning/LearningPorts.ets)：可注入的时钟、存储、权限和原生接续接口。
- [SceneWorkbench.ets](entry/src/main/ets/learning/scene/SceneWorkbench.ets)：三场景工作区、历史、写入补偿和冻结。
- [SceneWorkspaceBackupModel.ets](entry/src/main/ets/learning/scene/SceneWorkspaceBackupModel.ets)：沿用既有工作区协议的备份计划与范围选择，不建立第二套存储格式。
- [SceneWorkspaceBackup.ets](entry/src/main/ets/components/SceneWorkspaceBackup.ets)：正式备份组件，也供隔离 UI 用例使用。
- [LocaleStrings.ets](entry/src/main/ets/common/LocaleStrings.ets)：兼容现有 `string` API 的资源解析；默认英文和 `zh_CN` 中文。无 Context 的模型调用使用英文兜底。字符串语言在 Ability 创建前绑定；切换系统语言后请重启 Ability，避免在途状态及历史混用不同语言。
- [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets)：26 个 ohosTest 测试文件的入口；逐例说明见 [ohosTest.md](ohosTest.md)。

## 运行前提

1. 工程配置保留 SDK `26.0.0`，`runtimeOS` 为 `OpenHarmony`，`deviceTypes` 为 `default`。使用匹配 API 26 的 DevEco Studio / SDK / Hvigor 工具链。
2. 工程保留当前 `modelVersion`，不以参考示例的版本号代替工具链适配结论。
3. 运行前由开发者配置自己的调试签名。工程未提供可共享的证书、口令或设备签名材料。
4. 跨设备接续需要兼容的两台设备、相同应用与接续类型、网络/账号或互信条件，以及可用的系统接续入口。设备能力和部署成功不等于跨设备流程已验证。
5. 分布式数据同步权限 `ohos.permission.DISTRIBUTED_DATASYNC` 在用户主动操作时申请。单纯授权成功不证明对端在线或系统入口可用。

## 操作步骤

1. 启动应用，进入工作台。先编辑并保存一段文本，记录文档/修订与选择区。
2. 在需要时主动检查环境、申请权限和注册监听；观察记录中的调用及回调事实。
3. 通过设备系统提供的接续入口发起操作。在目标端观察快速结果、数据、窗口和实际业务定位是否分别到达。
4. 存在本机未保存内容或文档冲突时，明确选择接受接续版本或保留本机。未满足全部门控前不得覆盖原文。
5. 在笔记、阅读、表单页面继续操作，再从系统入口发起新的接续，检查不是只展示一次恢复截图。
6. 本地备份操作先生成副本；导入先预览差异，再确认恢复。预览/取消不得写入业务存储，未选场景保持不变。

## 数据与隐私

- 持久化键、接续命名空间、文档标识、规则编号和控件稳定 ID 保持兼容。中文业务样例、分支触发值和已有序列化枚举不能当作界面标签随意翻译。
- 业务备份是**未加密**文本，可能含笔记、姓名、电话号码、地址和历史版本。复制须确认，仅设置 `LOCALDEVICE` 分享范围；请自行妥善保管并清除副本。
- 诊断复制与普通日志不应包含业务正文或设备敏感标识；原生错误文本在展示前脱敏。

## 验证状态

这批修改仅进行文件、JSON、资源引用和差异等静态检查。**这批修改未编译、未构建、未运行 ohosTest，未进行真机或双设备验证**；遵从用户禁止要求，后续不执行编译/构建检查。当前不提供伪造截图、PASS、覆盖率或设备验证声明。437 个带真实 `@tc.number` 的用例定义均列为“待运行”，见 [ohosTest.md](ohosTest.md)。

## 下载位置

最终仓库目录为 `code/BasicFeature/Ability/AppContinuation`。如需只取此示例，可由使用者自行执行以下命令；本次修复未执行 git 提交或访问远端：

```bash
git init
git sparse-checkout init --no-cone
git sparse-checkout set code/BasicFeature/Ability/AppContinuation
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

## 相关资料

- [continueManager API](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-continueManager.md)
- [测试用例说明](ohosTest.md)
