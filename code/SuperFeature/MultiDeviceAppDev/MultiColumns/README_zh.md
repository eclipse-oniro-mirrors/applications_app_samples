## 一多分栏控件

### 介绍

本示例分别展示了多场景下，一多分栏控件的响应式变化效果。

本示例分别用到了[SideBarContainer](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-sidebarcontainer.md)组件与[Navigation](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-navigation.md)组件，对应使用场景如下：

* A+B+C：即SideBarContainer组件组合Navigation组件
* A+C：SideBarContainer组件
* B+C：Navigation组件



### 效果预览

本示例在预览器中的效果：

**A+B+C**:

| 360vp                               | 600vp                               | 840vp                               |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| ![](screenshots/Devices/image3.png) | ![](screenshots/Devices/image2.png) | ![](screenshots/Devices/image1.png) |

**A+C**:

| 360vp                               | 600vp                               |
| ----------------------------------- | ----------------------------------- |
| ![](screenshots/Devices/image8.png) | ![](screenshots/Devices/image7.png) |



**B+C**:

| 360vp                                | 600vp                               |
| ------------------------------------ | ----------------------------------- |
| ![](screenshots/Devices/image10.png) | ![](screenshots/Devices/image9.png) |

使用说明：

1.在预览器中查看页面效果

2.在预览器中开启窗口拖拽模式，拖动窗口变化，可以查看组件的响应式变化，如下图所示：
![](screenshots/Devices/image11.png)


### 工程目录

```
MultiColumns/entry/src/main/ets/
|---model
|   |---DataType.ets                       // 侧边栏菜单数据类型
|---Application                                  
|   |---MailBox.ets                        // 邮箱
|   |---PhotoAlbum.ets                     // 图库
|   |---Settings.ets                       // 设置
|---pages                                  
|   |---Index.ets                          // 首页
|---common                                    
|   |---BreakpointSystem.ets               // 媒体查询
|   |---Constants.ts                       // 断点键、路由、尺寸与日志常量
|   |---MailContent.ets                    // 邮箱详情
|   |---MailNavigation.ets                 // 邮箱导航
|   |---MailSideBar.ets                    // 邮箱侧边栏
|   |---PhotoContent.ets            	   // 图库详情
|   |---PhotoSideBar.ets             	   // 图库侧边栏     
|   |---SettingItem.ets             	   // setting设置项  
|   |---WlanItem.ets             	       // Wlan详情页
```



测试工程目录：

```
entry/src/ohosTest/ets/
|---test                                       // 用例目录（19 个套件）
|   |---BreakpointTypeCore.test.ets            // L1：BreakpointType 六维用例
|   |---ModelSpecCore.test.ets                 // L1：DataType 与规格常量
|   |---NavStackCore.test.ets                  // L1：NavPathStack 路由栈
|   |---Bp*Vol*.test.ets / ModelVol*.test.ets  // L1：@volume 凑量套件
|   |---BpEdgeReal.test.ets                    // L1：边界手写用例
|   |---Ability.test.ets                       // L2：窗口拖拽（ActsAbilityTest）
|   |---ResponsiveUi.test.ets                  // L2：响应式 UI 交互
|   |---List.test.ets                          // 套件注册入口
|---TestRunner
|   |---OpenHarmonyTestRunner.ts               // 测试运行器
|---util
|   |---Logger.ts                              // 日志工具
```

### 测试

- 测试工程：`entry/src/ohosTest`（bundleName `com.samples.multicolumns`，测试模块 `entry_test`，运行器 `OpenHarmonyTestRunner`）
- 规模：**19 个套件 / 986 条用例**（L1 逻辑用例 + L2 真实 UI 用例，编号 SUB_MC_*）
- 环境：OpenHarmony-7.1.0.21（API 26），真机 720×1280 手机形态，DevEco Studio 26.0.0.851 + hvigor 6.26.8 + Hypium 1.0.6
- 结果：全量执行 **986/986 通过**（最近一次执行：2026-11-19）

以下命令均在工程根目录执行。构建测试 HAP（需 DevEco Studio 26 自带的 node 与 hvigorw，含空格路径需加引号）：

```
"<DevEco>/tools/node/node.exe" "<DevEco>/tools/hvigor/bin/hvigorw.js" --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
```

安装并执行（不传 `-s class` 时执行 `List.test.ets` 注册的全部套件）：

```
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.multicolumns -m entry_test -s unittest /ets/TestRunner/OpenHarmonyTestRunner -s timeout 15000
```

用例矩阵、六维覆盖情况与真机环境约束（全屏窗口不可 resize、Navigation 拦截返回键等）详见 [ohosTest.md](./ohosTest.md)。

### 具体实现

* [SideBarContainer](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-sidebarcontainer.md)组件，自动隐藏侧边栏的功能是由minContentWidth与minSideBarWidth属性实现的。当设置[SideBarContainer](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-sidebarcontainer.md)组件组件的显示类型为SideBarContainerType.Embed,并且窗口宽度达到minContentWidth + minSideBarWidth的边界值时，侧边栏自动隐藏。

* [Navigation](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-navigation.md)组件，自动隐藏侧边栏的功能是由minContentWidth属性实现的。当[Navigation](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-navigation.md)的内容区域达到minContentWidth设置的值时，navBar自动隐藏。

  

**响应式规则** 

**场景一：A+B+C**

1. 预览器窗口宽度>840vp时，显示A、B、C三列，放大缩小时，优先变化C列
2. 预览器窗口宽度<=840vp并且>600vp时，显示B、C两列，放大缩小时，优先变化C列
3. 预览器窗口宽度<=600vp并且>360vp时，仅显示C列

**场景二：A+C**

1. 预览器窗口宽度>600vp时，显示A、C两列，放大缩小时，优先变化C列
2. 预览器窗口宽度<=600vp并且>360vp时，仅显示C列



**场景三：B+C**

1. 预览器窗口宽度>600vp时，显示B、C两列，放大缩小时，优先变化C列

2. 预览器窗口宽度<=600并且>360vp时，仅显示C列

   

### 相关权限

不涉及。

### 依赖

不涉及

### 约束与限制

1. 本示例仅支持标准系统上运行，`deviceTypes` 为 `default`（手机、平板、2in1 等标准设备）。

2. 本示例为 Stage 模型，`compileSdkVersion` / `compatibleSdkVersion` / `targetSdkVersion` 均为 `26.0.0`（runtimeOS: OpenHarmony）。

3. 本示例需要使用 DevEco Studio 26（配套 hvigor 6.26.8）及以上版本才可编译运行。

4. 本示例在真机设备上运行时，需要修改设备系统配置文件以使能应用小窗口能力。未使能时窗口以全屏运行，`Window.resize()` 不可用，L2 拖窗用例会自动降级为"窗口尺寸占满屏幕"校验（见 [ohosTest.md](./ohosTest.md)）。

```
# 将开发板文件系统的权限配置为可读写
hdc shell mount -o rw,remount /
# 取出原始配置文件
hdc file recv system/etc/window/resources/window_manager_config.xml C:\
# 将文件中<decor enable="false"></decor>改为<decor enable="true"></decor>
# 用修改后的文件替换系统中的原始文件
hdc file send C:\window_manager_config.xml system/etc/window/resources/window_manager_config.xml
# 重启后生效
hdc shell reboot
```

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/SuperFeature/MultiDeviceAppDev/MultiColumns/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```