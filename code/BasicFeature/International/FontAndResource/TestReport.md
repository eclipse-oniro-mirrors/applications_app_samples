# 字体与资源管理测试报告

## 测试环境

| 项目 | 说明                                                                         |
| --- |----------------------------------------------------------------------------|
| 设备型号 | dayu200（RK3568）真机                                                          |
| 应用包名 | com.samples.fontandresource                                                |
| 系统 | OpenHarmony 7.1.0.22                                                       |
| SDK | `compatibleSdkVersion` / `targetSdkVersion` 均为 `26.0.0`                    |
| 测试框架 | `@ohos/hypium` + `OpenHarmonyTestRunner`（模块名 `entry_test`）                 |
| 签名 | DevEco 自动签名（debugKey），安装包与测试包同一套证书                                         |
| 权限 | ohos.permission.UPDATE_FONT                                                           |

> 前置条件：entry 模块声明了 system_basic 权限 ohos.permission.UPDATE_FONT，安装测试包前需确认签名配置中包含对应 ACL，否则安装会报 9568289。

## UI 自动化用例

用例文件：[entry/src/ohosTest/ets/test/FontResource.test.ets](entry/src/ohosTest/ets/test/FontResource.test.ets)

| 序号 | 用例名称 | 测试场景 | 操作步骤 | 预期结果 | 测试结果 |
| --- | --- | --- | --- | --- |------|
| 1 | testMainPage0001 | 应用启动 | 启动应用并等待首页加载 | 主页面存在，标题文本非空 | Pass |
| 2 | testTabSwitch0001 | 页面切换 | 依次切换到资源管理页和字体管理页 | 两个页面均可正常展示 | Pass |
| 3 | testPrepareFont0001 | 字体文件准备 | 点击准备字体文件按钮并等待完成 | 状态文本非空，沙箱路径以 .ttf 结尾 | Pass |
| 4 | testPreviewToggle0001 | 字体预览 | 准备字体文件后打开自定义字体预览开关 | 开关处于选中状态 | Pass |
| 5 | testConvertAll0001 | 批量资源转换 | 进入资源管理页点击批量转换 | 颜色资源出现转换详情 | Pass |
| 6 | testConvertMedia0001 | 媒体资源转换 | 进入资源管理页点击转换图片 | 页面渲染出转换后的图片 | Pass |
| 7 | testTaskPool0001 | TaskPool 往返转换 | 点击 TaskPool 按钮并等待结果 | 线程路径显示 TaskPool | Pass |
| 8 | testPreviewFlip0001 | 预览开关往返切换 | 准备字体文件后将预览开关置为开启，再连续点击两次 | 第一次点击后变为未选中，第二次点击后恢复选中 | Pass |
| 9 | testLogClear0001 | 日志清空 | 准备字体文件产生日志后，点击日志面板的“清空” | 日志列表消失并显示“暂无操作记录”，面板标题保留 | Pass |
| 10 | testWorker0001 | Worker 往返转换 | 点击 Worker 按钮，等待线程路径切换为 Worker（最长 3.5 秒） | 线程路径显示 Worker，包名非空 | Pass |
