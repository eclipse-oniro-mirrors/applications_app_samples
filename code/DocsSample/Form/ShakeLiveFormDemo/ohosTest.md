# 抖动互动卡片 测试用例归档

用例位于 `entry/src/ohosTest`，共两个测试文件 10 条用例。编号规则：`@tc.name` 后缀四位数字按文件内顺序从 0001 起步长 1，`@tc.number` 四位数字在每个文件内从 0100 起步长 100，`@tc.desc` 为英文描述。

执行方式：DevEco Studio 中选中 entry 模块右键 `Run 'test'`，或命令行 `hvigorw --mode module -p module=entry@ohosTest -p product=default test`。

## 一、Ability.test.ets（应用信息与卡片扩展能力）

| 用例编号 | 用例名 | 预置条件 | 测试点 | 预期输出 | 测试结果 |
|:---:|---|---|---|---|:---:|
| SUB_FORM_SHAKE_0100 | testAppContext0001 | 测试进程已启动 | 应用上下文、资源管理器可用，应用名与包名一致 | 断言通过 | Pass |
| SUB_FORM_SHAKE_0200 | testBundleInfo0002 | 应用已安装 | 包名与 versionName 与 app.json5 一致 | 断言通过 | Pass |
| SUB_FORM_SHAKE_0300 | testHapModuleInfo0003 | 应用已安装 | entry 模块的打包信息 | 模块名 entry、入口 Ability 为 EntryAbility、设备类型非空 | Pass |
| SUB_FORM_SHAKE_0400 | testStartEntryAbility0004 | 应用已安装 | 入口 Ability 可被正常拉起 | startAbility 回调无错误 | Pass |

## 二、InteractionForm.test.ets（动效参数与图像分割工具）

| 用例编号 | 用例名 | 预置条件 | 测试点 | 预期输出 | 测试结果 |
|:---:|---|---|---|---|:---:|
| SUB_FORM_SHAKE_0100 | testOverflowRatioConstants0001 | 设备正常运行 | 动效超范围比例常量 | 左 0.1、上 0.15、宽 1.2、高 1.3 | Pass |
| SUB_FORM_SHAKE_0200 | testOverflowDurationConstant0002 | 设备正常运行 | 动效时长常量 | 3500ms 且大于 0 | Pass |
| SUB_FORM_SHAKE_0300 | testOverflowAreaCalculation0003 | 设备正常运行 | 200x200 卡片的动效渲染区域计算 | 左 -20、上 -30、宽 240、高 260 | Pass |
| SUB_FORM_SHAKE_0400 | testOverflowAreaScaling0004 | 设备正常运行 | 动效区域随卡片尺寸线性缩放 | 半尺寸结果的两倍等于全尺寸结果 | Pass |
| SUB_FORM_SHAKE_0500 | testSegmentationUtilSingleton0005 | 设备正常运行 | SegmentationUtil 单例 | 两次获取为同一实例 | Pass |
| SUB_FORM_SHAKE_0600 | testSegmentationWithInvalidResource0006 | 设备正常运行 | 无效资源 ID 的容错 | 返回 undefined，不抛异常 | Pass |

## 三、手工 UI 用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用 | Pass |
| 添加卡片到桌面 | 设备为手机真机，支持互动卡片 | 长按应用图标添加 2*2 卡片 | 桌面出现静态卡片 | Pass |
| 摇一摇触发互动卡片 | 卡片已添加到桌面 | 摇动设备 | 卡片切换到互动卡片页面，动效超出卡片范围播放 | Pass |
| 互动卡片退出 | 互动卡片已展示 | 等待动效结束或再次摇动 | 回到静态卡片，无残留 | Pass |
