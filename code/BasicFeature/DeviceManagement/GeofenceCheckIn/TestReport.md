# 地理围栏签到测试报告

## 测试环境

| 项目 | 说明                                                               |
| --- |------------------------------------------------------------------|
| 设备型号 | dayu200（RK3568）真机                                                |
| 应用包名 | com.samples.geofencecheckin                                      |
| 系统 | OpenHarmony 7.1.0.22                                             |
| SDK | `compatibleSdkVersion` / `targetSdkVersion` 均为 `26.0.0`          |
| 测试框架 | `@ohos/hypium` + `OpenHarmonyTestRunner`（模块名 `entry_test`）       |
| 签名 | DevEco 自动签名（debugKey），安装包与测试包同一套证书                               |
| 权限 | ohos.permission.APPROXIMATELY_LOCATION，ohos.permission.LOCATION，ohos.permission.LOCATION_IN_BACKGROUND |


## UI 自动化用例

用例文件：[entry/src/ohosTest/ets/test/GeofenceCheckIn.test.ets](entry/src/ohosTest/ets/test/GeofenceCheckIn.test.ets)

| 序号 | 用例名称 | 测试场景 | 操作步骤 | 预期结果 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 1 | testStartAbility0001 | 应用启动 | 启动应用并等待首页加载 | 主页面、标题、围栏状态卡片均存在，标题文本非空 | 通过 |
| 2 | testSaveConfig0001 | 保存围栏参数 | 填写经纬度（半径取默认 200），收起键盘后点击保存参数 | 页面提示文本非空，模拟进入按钮变为可用 | 通过 |
| 3 | testSimulateCheckIn0001 | 模拟进入围栏 | 保存参数后点击模拟进入 | 页面提示非空，签到记录列表出现且宽度大于 0 | 通过 |
| 4 | testSimulateCheckOut0001 | 模拟离开围栏 | 点击模拟离开 | 页面提示非空，签到记录列表仍然存在 | 通过 |
| 5 | testClearRecords0001 | 清空签到记录 | 点击签到记录区域的清空按钮 | 记录列表切换为空状态 | 通过 |
| 6 | testResponsiveLayout0001 | 手机与平板布局 | 分别在手机、平板上查看设置卡片与权限卡片 | 两张卡片均存在且宽度大于 0 | 通过 |
| 7 | testInvalidParams0001 | 非法参数校验 | 清空纬度后点击保存参数 | 页面给出参数不合法提示 | 通过 |
