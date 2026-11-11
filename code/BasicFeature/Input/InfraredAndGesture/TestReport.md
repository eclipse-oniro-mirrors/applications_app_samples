# 会议室场景控制测试用例报告

当前工程包名为 `com.samples.infraredandgesture`。以下测试记录对应调整前的包名 `com.samples.meetingscene`；新包名尚未重新构建或执行测试。

## 一、测试环境

| 项目 | 说明                                                                         |
| --- |----------------------------------------------------------------------------|
| 设备型号 | dayu200（RK3568）真机                                                          |
| 应用包名 | com.samples.meetingscene                                                   |
| 系统 | OpenHarmony 7.1.0.22                                                       |
| SDK | `compatibleSdkVersion` / `targetSdkVersion` 均为 `26.0.0`                    |
| 测试框架 | `@ohos/hypium` + `OpenHarmonyTestRunner`（模块名 `entry_test`）                 |
| 签名 | DevEco 自动签名（debugKey），安装包与测试包同一套证书                                         |
| 权限 | ohos.permission.MANAGE_INPUT_INFRARED_EMITTER                                                           |


## 二、测试用例

### 1. 启动路由（SUB_MEETINGSCENE_UI_LAUNCHAPP_0100）

| 项目 | 内容 |
| --- | --- |
| 用例名称 | testLaunchApp0001 |
| 测试场景 | 应用启动后按设备形态进入正确首页 |
| 前置条件 | 应用已安装，设备已解锁 |
| 操作步骤 | 1. 由套件 beforeAll 启动 com.samples.meetingscene/EntryAbility，等待首页加载完成。2. 等待首页根节点出现。 |
| 预期结果 | 手机上出现中控台首页（id_console_root），平板上出现编排首页（id_orch_root），页面无白屏与闪退 |
| 实际结果 | Pass |
| 关键日志 | `MeetingScene_testLaunchApp0001 start` 与 `MeetingScene_testLaunchApp0001 end` |
| 结论 | Pass |

### 2. 二级页面跳转（SUB_MEETINGSCENE_UI_SECONDARYPAGE_0100）

| 项目 | 内容 |
| --- |  |
| 用例名称 | testSecondaryPage0001 |
| 测试场景 | 当前设备形态的二级页面可以打开并返回首页 |
| 前置条件 | 应用已启动并停留在首页 |
| 操作步骤 | 手机：1. 点击底部导航“设置”（id_nav_settings）。2. 等待发送日志设置页出现（id_settings_root）。3. 点击返回（id_settings_back）。平板：1. 点击“配置包”入口（id_index_transfer）。2. 等待配置包页出现（id_xfer_root）。3. 点击返回（id_xfer_back）。两种形态均在尾部等待首页重新出现。 |
| 预期结果 | 二级页面正常打开，返回后首页内容正常显示，各点击与等待断言均通过 |
| 实际结果 | Pass |
| 关键日志 | `MeetingScene_testSecondaryPage0001 start` 与 `MeetingScene_testSecondaryPage0001 end` |
| 结论 | Pass |

### 3. 房间管理（SUB_MEETINGSCENE_UI_ROOMMANAGEMENT_0100）

| 项目 | 内容 |
| --- | --- |
| 用例名称 | testRoomManagement0001 |
| 测试场景 | 手机打开房间配置页；平板创建新房间并出现在房间列表 |
| 前置条件 | 应用已启动，默认演示数据已导入 |
| 操作步骤 | 手机：1. 点击“房间配置”（id_nav_room_config）。2. 等待房间配置页出现（id_room_config_root）。3. 点击返回（id_room_back）。平板：1. 在新房间输入框（id_index_new_room_input）输入唯一名称（Test Room 加时间戳）。2. 点击“创建房间”（id_index_create_room）。3. 等待房间列表出现该房间名。注意：平板输入后不执行系统返回手势，避免键盘返回离开应用。两种形态尾部等待首页重新出现。 |
| 预期结果 | 手机正常打开房间配置页并返回；平板房间列表出现新创建的房间名称 |
| 实际结果 | Pass |
| 关键日志 | `MeetingScene_testRoomManagement0001 start` 与 `MeetingScene_testRoomManagement0001 end` |
| 结论 | Pass |

### 4. 场景管理（SUB_MEETINGSCENE_UI_SCENEMANAGEMENT_0100）

| 项目 | 内容 |
| --- | --- |
| 用例名称 | testSceneManagement0001 |
| 测试场景 | 手机直接打开场景编辑页；平板经房间配置页进入场景编辑页 |
| 前置条件 | 应用已启动，默认演示数据已导入（含默认房间 room-default） |
| 操作步骤 | 手机：1. 点击“场景编辑”（id_nav_scene_editor）。2. 等待场景编辑页出现（id_scene_editor_root）。3. 点击返回（id_scene_back）。平板：1. 点击默认房间入口（id_index_room_enter_room-default，若不存在则点击“Configure”文本兜底）。2. 等待房间配置页出现（id_rc_root）。3. 点击场景编辑入口（id_rc_scene_entry）。4. 等待场景编辑页出现（id_oen_root）。5. 逐级返回（id_oen_back、id_rc_back）。两种形态尾部等待首页重新出现。 |
| 预期结果 | 场景编辑页正常打开，返回路径逐级正确，各断言均通过 |
| 实际结果 | Pass |
| 关键日志 | `MeetingScene_testSceneManagement0001 start` 与 `MeetingScene_testSceneManagement0001 end` |
| 结论 | Pass |

### 5. 首页设备控件区（SUB_MEETINGSCENE_UI_CONSOLEWIDGETS_0100）

| 项目 | 内容 |
| --- | --- |
| 用例名称 | testConsoleWidgets0001 |
| 测试场景 | 首页设备卡片区域按设备形态正确渲染 |
| 前置条件 | 应用已启动并停留在首页 |
| 操作步骤 | 手机：1. 等待设备标题出现（id_console_devices_title）。2. 等待设备列表根出现（id_console_device_list）。平板：1. 等待编排标题出现（id_index_title）。2. 等待房间区块出现（id_index_rooms_section）。本用例不执行页面跳转。 |
| 预期结果 | 手机显示设备卡片区域，平板显示房间与设备汇总区块，标题与列表根均出现 |
| 实际结果 | Pass |
| 关键日志 | `MeetingScene_testConsoleWidgets0001 start` 与 `MeetingScene_testConsoleWidgets0001 end` |
| 结论 | Pass |

### 6. 发送日志页（SUB_MEETINGSCENE_UI_SENDLOGS_0100）

| 项目 | 内容 |
| --- | --- |
| 用例名称 | testSendLogsPage0001 |
| 测试场景 | 手机发送日志页展示日志面板（空态或列表二选一必现）；平板无该页时首页保持稳定 |
| 前置条件 | 应用已启动并停留在首页 |
| 操作步骤 | 手机：1. 点击“设置”（id_nav_settings）。2. 等待设置页出现（id_settings_root）。3. 等待日志区块出现（id_send_logs_section）。4. 等待日志面板出现（id_send_log_panel）。5. 校验空态提示（id_log_empty）与日志列表（id_log_list）二者必现其一。6. 点击返回（id_settings_back），等待首页重新出现。平板：平板无发送日志页，校验编排首页标题（id_index_title）与提示行（id_index_notice_row）稳定显示。 |
| 预期结果 | 手机日志面板正常渲染且空态/列表必现其一；平板首页显示稳定 |
| 实际结果 | Pass |
| 关键日志 | `MeetingScene_testSendLogsPage0001 start` 与 `MeetingScene_testSendLogsPage0001 end` |
| 结论 | Pass |

### 7. 配置包导出入口（SUB_MEETINGSCENE_UI_CONFIGEXPORT_0100）

| 项目 | 内容 |
| --- | --- |
| 用例名称 | testConfigExport0001 |
| 测试场景 | 平板配置包页展示导出区块与导出按钮入口；手机端验证中控台导航栏存在 |
| 前置条件 | 应用已启动并停留在首页 |
| 操作步骤 | 平板：1. 点击“配置包”入口（id_index_transfer）。2. 等待配置包页出现（id_xfer_root）。3. 等待导出区块出现（id_xfer_export_section）。4. 校验导出按钮存在（id_xfer_export_button，仅存在性断言，不点击触发真实导出）。5. 点击返回（id_xfer_back），等待首页重新出现。手机：配置包页为平板专属，校验中控台底部导航（id_console_nav）存在。 |
| 预期结果 | 平板配置包页导出区块与导出按钮均出现；手机中控台导航栏正常 |
| 实际结果 | Pass |
| 关键日志 | `MeetingScene_testConfigExport0001 start` 与 `MeetingScene_testConfigExport0001 end` |
| 结论 | Pass |

### 8. 场景编辑步骤列表（SUB_MEETINGSCENE_UI_SCENEEDITORSTEPS_0100）

| 项目 | 内容 |
| --- | --- |
| 用例名称 | testSceneEditorSteps0001 |
| 测试场景 | 两种设备形态打开场景编辑页后步骤列表区域存在 |
| 前置条件 | 应用已启动，默认演示数据已导入（含默认房间 room-default） |
| 操作步骤 | 手机：1. 点击“场景编辑”（id_nav_scene_editor）。2. 等待场景编辑页出现（id_scene_editor_root）。3. 等待步骤列表出现（id_steps_section）。4. 点击返回（id_scene_back），等待首页重新出现。平板：1. 点击默认房间入口（id_index_room_enter_room-default，若不存在则点击“Configure”文本兜底）。2. 等待房间配置页出现（id_rc_root）。3. 点击场景编辑入口（id_rc_scene_entry）。4. 等待场景编辑页出现（id_oen_root）。5. 等待步骤列表出现（id_oen_steps_section）。6. 逐级返回（id_oen_back、id_rc_back），等待首页重新出现。 |
| 预期结果 | 场景编辑页步骤列表区域正常出现，返回路径正确 |
| 实际结果 | Pass |
| 关键日志 | `MeetingScene_testSceneEditorSteps0001 start` 与 `MeetingScene_testSceneEditorSteps0001 end` |
| 结论 | Pass |

## 三、补充场景

以下场景依赖真实红外硬件：

| 场景 | 操作步骤 | 预期结果 | 实际结果 |
| --- | --- | --- | --- |
| 场景执行 | 在中控台点击“开会”场景 | 设备依次收到红外指令，进度面板显示成功或失败原因 | Pass |
| 配置导出 | 平板上勾选房间并点击导出按钮，生成 JSON 配置包 | 生成 JSON 配置包并显示导出路径 | Pass |
| 配置导入 | 导入上一步导出的配置包 | 房间与场景恢复，重复项按规则合并或备份 | Pass |
