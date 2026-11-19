# 事件的订阅和发布

### 介绍

本示例主要展示了公共事件相关的功能，实现了一个检测用户部分行为的应用。具体而言实现了如下几点功能：

1.通过订阅系统公共事件，实现对用户操作行为（亮灭屏、锁屏和解锁屏幕、断联网）的监测；

2.通过在用户主动停止监测行为时发布自定义有序公共事件，实现对用户主动触发监听行为的持久化记录；

3.通过在用户设置对某一事件的监听状态时发布粘性事件，记录下本次应用运行期间允许监听的事件列表，同时在应用退出时将临时允许的修改为不允许；

4.打开自定义订阅事件页面需先安装[CardEvent](lib/CardEvent-1.0.0.hap)应用，通过订阅指定应用事件，实现用户对指定卡片发送事件的监听。

### 效果预览

##### 订阅系统公共事件，主动停止监听行为及对某一事件的监听状态时发布粘性事件

| 主页                                 | 监控页面                           | 设置页面                               | 自定义订阅事件页面                  |
| ------------------------------------ | ---------------------------------- | -------------------------------------- | ----------------------------------- |
| <img src="screenshots/launch.jpg" /> | <img src="screenshots/main.jpg" /> | <img src="screenshots/settings.jpg" /> | <img src="screenshots/event.jpg" /> |

说明：以上截图为中文系统界面，英文界面由 en 资源目录提供，截图保持不变。

使用说明：

1.安装编译生成的hap包，依赖包hap，桌面上显示应用图标如下，点击图标即可进入应用。

<img src="screenshots/icon.png" style="zoom:80%;" />

<img src="screenshots/relyicon.png" style="zoom:80%;" />

2.进入应用显示菜单页，可选择“进入”，“历史”，“设置”及“关于”几个选项。

3.点击“进入”后跳转至主页面，点击主页面“开始监控”按钮，将开始监听系统公共事件，并进行计时，此时按钮内容变更为“停止监听”；点击停止监听按钮，页面上将显示本次监听时长及监听期间收到的干扰信息汇总，并在页面右下角显示“查看详情”按钮，点击按钮将跳转至详情页，显示监听期间收到的干扰信息，应用当前仅监听了亮灭屏、锁屏和解锁屏幕、断联网等用户可操作的系统公共事件，后续可根据需求快速扩展。

4.返回至应用菜单页面，点击“历史”可查看用户操作监听的历史记录，当前支持每次运行期间最多存储10条历史记录，超过10条后将删除历史数据。

5.返回至应用菜单页面，点击“设置”可进行具体系统事件的监听配置，应用提供了“一直”、“仅本次”及“从不”三个选项，其中“仅本次”选项是指本次应用运行期间将监听特定系统公共事件，应用退出后该选项将自动调整为“从不”。

6.在设置页面，点击“自定义事件定向订阅”进入订阅页面，

- 点击”订阅“按钮进行订阅事件，同时订阅指定本应用事件和订阅非指定应用事件。

- 点击应用内卡片发送事件或点击应用外卡片发送事件。

- 点击应用内卡片发送事件后，指定应用事件和非指定应用事件均会接收到卡片所发送的事件 ；点击应用外卡片发送事件后，非指定应用事件会被接收，指定应用事件不会被接收。

- 点击”取消订阅“ 页面中会提示当前事件取消订阅。

7.返回至应用菜单页面，点击“关于”可查看应用版本信息及本示例的说明。

### 工程目录

**CustomCommonEvent**

```
entry/src/main/ets/
|---Application
|   |---MyAbilityStage.ts                    
|---component
|   |---Header.ets                           // 头部组件
|---entryformability
|   |---EntryFormAbility.ts                  // 卡片提供方  
|---feature
|   |---CardEventFeature.ts                  // 卡片事件提示判定
|   |---HistoryFeature.ts                    
|   |---LaunchFeature.ts                    
|   |---MainFeature.ts                    
|   |---SettingFeature.ts                    
|---LauncherAbility 
|   |---LauncherAbility.ts
|---MainAbility
|   |---MainAbility.ts
|---module
|   |---Consts.ts                            // 数据定义
|   |---Logger.ts                            // 日志打印  
|   |---SurveillanceEventsManager.ts         // 公共事件模块
|   |---Utils.ts                        
|---pages
|   |---About.ets                            // 关于页面
|   |---Detail.ets                           // 详情页面
|   |---History.ets                          // 历史页面
|   |---jumpToCommonEvent.ets                // 自定义订阅事件页面
|   |---Launch.ets                           // 发起页面
|   |---Main.ets                             // 进入页面
|   |---Setting.ets                          // 设置页面
|---publishcard
|   |---pages
|   |	|---PublishCard.ets              	 // 卡片页面
```

**CustomCommonEventRely**

```
entry/src/main/ets/
|---entryformability
|   |---EntryFormAbility.ts					// 发布事件
|---pages
|   |---Index.ets
|---widget
|   |---pages
|   |	|---PublishCard.ets 				// 发布事件的卡片
```



**资源文件**

```
entry/src/main/resources/
|---base                                     // 默认资源（中文）
|   |---element
|   |   |---string.json                      // 字符资源
|   |   |---color.json                       // 颜色资源
|   |   |---float.json                       // 尺寸资源
|   |---media                                // 应用图标
|   |---profile                              // 页面与卡片配置
|   |---rawfile                              // 背景、按钮及标题图片
|---zh                                       // 中文资源
|   |---element
|   |   |---string.json
|---en                                       // 英文资源
|   |---element
|   |   |---string.json
```

### 具体实现

* 该示例entry部分包含如下模块：
  * 进入模块
    * 使用到应用上下文，createSubscriber方法创建订阅者，getCurrentTime获取获取自Unix纪元以来经过的时间进行对用户操作行为的监测功能页面开发。
    * 源码链接：[Consts.ts](entry/src/main/ets/module/Consts.ts)，[LaunchFeature.ts](entry/src/main/ets/feature/LaunchFeature.ts)，[LauncherAbility.ts](entry/src/main/ets/LauncherAbility/LauncherAbility.ts)，[SurveillanceEventsManager.ts](entry/src/main/ets/module/SurveillanceEventsManager.ts)
    * 参考接口：[@ohos.app.ability.common](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-common.md)，[@ohos.commonEventManager](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-commonEventManager.md)，[@ohos.data.preferences](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md)，[@ohos.commonEvent](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-commonEvent.md)，[@ohos.router](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-router.md)，[@ohos.systemDateTime](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-system-date-time.md)
  
  * 历史模块
    * 使用到应用上下文，getPreferences方法获取Preferences实例，组件Header进行历史页面开发。
    * 源码链接：[Header.ets](entry/src/main/ets/component/Header.ets)，[Consts.ts](entry/src/main/ets/module/Consts.ts),[HistoryFeature.ts](entry/src/main/ets/feature/HistoryFeature.ts)
    * 参考接口：[@ohos.app.ability.common](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-common.md)，[@ohos.data.preferences](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md)
  
  * 设置模块
    * 本模块包含五个事件，分别为记录联网事件、记录灭屏事件、记录亮屏事件、记录锁屏事件、记录解锁屏幕事件，每一个事件都可进行一直，仅本次和从不的单项选择，使用到应用上下文，CommonEvent.publish 发布公共事件，getPreferences方法获取Preferences实例进行功能页面开发。
    * 源码链接：[Header.ets](entry/src/main/ets/component/Header.ets)，[Consts.ts](entry/src/main/ets/module/Consts.ts)，[SettingFeature.ts](entry/src/main/ets/feature/SettingFeature.ts)，[SurveillanceEventsManager.ts](entry/src/main/ets/module/SurveillanceEventsManager.ts)
    * 参考接口：[@ohos.app.ability.common](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-common.md)，[@ohos.data.preferences](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md)，[@ohos.commonEvent](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-commonEvent.md),[@ohos.router](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-router.md)，[@ohos.commonEvent](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-commonEvent.md)
  
  * 关于模块
    * 该模块开发主要介绍了本示例的功能作用以及说明了什么情况下不能使用。
    * 源码链接：[Header.ets](entry/src/main/ets/component/Header.ets)，[Consts.ts](entry/src/main/ets/module/Consts.ts)
  
  - 设置中订阅事件模块
    - 本模块主要支持指定应用订阅自定义事件。subScribeInfo新增可选属性publisherBundleName,创建订阅对象时可指定PublisherBundlerName，事件发布时，获取订阅者信息，增加校验bundleName是否等于publisherBundlerName，相等则加入事件回调方，达成只接收指定发布方发布的事件的效果。
    - 源码链接：[EntryFormAbility.ts](entry/src/main/ets/entryformability/EntryFormAbility.ts)，[Main.ets](entry/src/main/ets/pages/Main.ets)，[jumpToCommonEvent.ets](entry/src/main/ets/pages/jumpToCommonEvent.ets)，[CardEventFeature.ts](entry/src/main/ets/feature/CardEventFeature.ts)，[PublishCard.ets](entry/src/main/ets/publishcard/pages/PublishCard.ets)
    - 参考接口：[@ohos.commonEventManager](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-commonEventManager.md)，[@ohos.hilog](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md)，[@ohos.app.form.formInfo](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/reference/apis-form-kit/js-apis-app-form-formInfo.md)，[@ohos.app.form.formBindingData](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/reference/apis-form-kit/js-apis-app-form-formBindingData.md)，[@ohos.app.form.FormExtensionAbility](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/reference/apis-form-kit/js-apis-app-form-formExtensionAbility.md)
  
  

### 相关权限

[ohos.permission.COMMONEVENT_STICKY](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioncommonevent_sticky)

[ohos.permission.REQUIRE_FORM](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionrequire_form)

[ohos.permission.GET_BUNDLE_INFO_PRIVILEGED](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionget_bundle_info_privileged)

### 依赖

本应用依赖[CustomCommonEventRely](../CustomCommonEventRely)应用进行运行，预编译产物见 [lib](lib) 目录（CardEvent-1.0.0.hap）。


### 约束与限制

1.本示例仅支持标准系统上运行，支持设备：RK3568。

2.本示例为Stage模型，工程配置的 compileSdkVersion、targetSdkVersion、compatibleSdkVersion 均为 26.0.0；

3.本示例使用 DevEco Studio 26.0.0.821 的命令行工具（hvigor modelVersion 26.0.0）编译运行；

4.本示例涉及[ohos.permission.REQUIRE_FORM](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionrequire_form)和[ohos.permission.GET_BUNDLE_INFO_PRIVILEGED](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionget_bundle_info_privileged)权限为system_basic级别，需要配置高权限签名；本应用还发布粘性事件，需以系统应用方式签名并安装；

5.本示例的自定义事件订阅页面需先安装 [CardEvent-1.0.0.hap](lib/CardEvent-1.0.0.hap)（或 [CustomCommonEventRely](../CustomCommonEventRely) 应用），否则订阅页面的卡片无法加载；

### 下载

如需单独下载本工程，执行如下命令：
```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Notification/CustomCommonEvent/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master

```