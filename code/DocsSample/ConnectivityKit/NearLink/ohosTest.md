# 星闪开源示例代码 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|	设备正常运行，已安装应用；已授权ohos.permission.ACCESS_NEARLINK权限；已开启UiTest模式（hdc shell param set persist.ace.testmode.enabled 1）；测试期间屏幕保持亮屏|	通过delegator启动EntryAbility|	成功拉起应用，当前顶部Ability名称为EntryAbility|是|Pass|
|主页加载|	应用已成功拉起|		|主页标题组件main_title_text存在，且标题文本为NearLink|是|Pass|
|主页菜单导航|	位于主页|	点击menu_ManagerPage菜单项|	跳转Manager页面，导航标题nav_title_text正常显示（文本非空）|是|Pass|
|主页菜单导航|	位于主页|	点击menu_AdvertisingPage菜单项|	跳转Advertising页面，导航标题nav_title_text正常显示（文本非空）|是|Pass|
|主页菜单导航|	位于主页|	点击menu_ScanConfigPage菜单项|	跳转Scan页面，导航标题nav_title_text正常显示（文本非空）|是|Pass|
|主页菜单导航|	位于主页，向下滑动页面|	点击menu_SsapServerPage菜单项|	跳转SSAP Server页面，导航标题nav_title_text正常显示（文本非空）|是|Pass|
|主页菜单导航|	位于主页，向下滑动页面|	点击menu_SsapClientPage菜单项|	跳转SSAP Client页面，导航标题nav_title_text正常显示（文本非空）|是|Pass|
|主页菜单导航|	位于主页，向下滑动页面|	点击menu_DataTransferPage菜单项|	跳转DataTransfer页面，导航标题nav_title_text正常显示（文本非空）|是|Pass|
|主页菜单导航|	位于主页，向下滑动页面|	点击menu_CdsmPage菜单项|	跳转CDSM页面，导航标题nav_title_text正常显示（文本非空）|是|Pass|
|返回主页功能验证|	位于Manager页面|	点击返回按钮btn_nav_back|	返回主页，主页标题main_title_text可见|是|Pass|
|Manager页面UI显示验证|	位于Manager页面|		|NearLink Status、Device Support、Local Info三个分区均正常显示|是|Pass|
|Manager页面刷新功能验证|	位于Manager页面|	点击Refresh Status按钮|	按钮处于可用状态，点击后无异常|是|Pass|
|Advertising页面初始状态验证|	位于Advertising页面|		|显示Advertising Status分区，初始状态为Stopped，Start按钮可用|是|Pass|
|Scan页面控件显示验证|	位于Scan页面|		|显示Scan Filters (Optional)分区，Filtered Scan、Full Scan按钮均存在|是|Pass|
|SSAP Server页面UI显示验证|	位于SSAP Server页面|		|显示Server Status、Advertising Control、Operations三个分区|是|Pass|
|SSAP Client页面UI显示验证|	位于SSAP Client页面|		|显示Scan Devices、Connection Management分区，Start Scan按钮存在|是|Pass|
|DataTransfer页面UI显示验证|	位于DataTransfer页面|		|显示Port Management、Advertising Control分区，Create Port按钮存在|是|Pass|
|CDSM页面UI显示验证|	位于CDSM页面|		|显示Paired Devices、CDSM Operations分区，Create CDSM Client按钮存在|是|Pass|
