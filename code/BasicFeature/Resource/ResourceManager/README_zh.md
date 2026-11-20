# 资源管理器

### 介绍

本工程使用[@ohos.app.ability.common](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-common.md)
接口中的AbilityContext类，获取资源管理器resourceManager，使用[@ohos.resourceManager.d.ts](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-localization-kit/js-apis-resource-manager.md)
中的接口，展示了格式化字符串查询、基于指定屏幕分辨率查询媒体资源、获取系统资源管理对象等基础功能，以及展示了资源静态overlay以及运行时overlay的特性功能。

### 效果预览

|主页|
|---|
|![main](sceenshots/device/Scene-directory.png)|

#### 使用说明

此界面为主页面，其中展示了资源管理API各类接口的调用以及特性Overlay场景功能。其作用有：

1、点击资源API调用示例按钮，可跳转到资源API示例页面

2、点击Overlay使用示例，可以跳转到Overlay的使用示例界面。

#### 资源API调用示例

|资源API测试|
|---|
|![main](sceenshots/device/basicResources.png)|

#### 使用说明

此页面展示了当前资源管理接口的调用以及接口对应的返回结果。

#### 静态overlay场景

|overlay场景|
|---|
|![main](sceenshots/device/overlayTest.png)|

#### 使用说明

此页面展示静态overlay功能，功能使用如下：

1、静态overlay是默认使能的，当前显示的是静态overlay中的字符串和图标。

2、点击Disable可以触发去使能，重启应用可以恢复显示应用的字符串和图标。

3、点击enable可以触发使能，重启应用可以再次显示overlay中的字符串和图标。

源码参考：[Overlay示例](entry/src/main/ets/pages/Overlay.ets)

#### 运行时overlay场景

|运行时overlay场景|
|---|
|![main](sceenshots/device/overlayRuntimeTest.png)|

#### 使用说明

此页面展示运行时overlay功能，功能使用如下：

1、点击addResource可以触发运行时overlay，此时会使用运行时overlay中的资源覆盖之前的字符串和图标。

2、点击removeResource可以触发移除运行时overlay，此时会移除运行时overlay，恢复到覆盖前的字符串和图标。

### 工程目录

```
entry/src/main/ets/
|---entryability                        // 应用入口
|---pages
|   |---Index.ets                     // 场景首页
|   |---BasicResources.ets            // 基础资源场景
|   |---Overlay.ets                   // overlay场景      
|---utils
|   |---ResourceUtils.ets             // 密度归一化、字节数格式化、Base64长度换算、复数分支等纯函数
|   |---RouteTable.ets                // 页面注册表与路由地址解析
|---service
|   |---ResourceAccessService.ets     // resourceManager 访问封装
|   |---OverlayController.ets         // overlay 按钮动作判定与状态机
libraryOverlay                        // 静态overlay模块（工程根目录）
libraryRuntimeOverlay                 // 运行时overlay模块（工程根目录）
```

### 具体实现

#### 资源API调用示例具体实现：

1、使用getContext()接口获取context对象，使用context.resourceManager获取资源管理对象，然后调用resourceManager内部的相关接口获取对应资源，例如：
* 获取字符串资源：resourceManager.getStringValue()
* 获取字符串数组资源：resourceManager.getStringArrayValue()
* 获取图片资源：resourceManager.getMediaContent()
* 获取格式化字符串资源：resourceManager.getStringSync()
* 获取指定屏幕分辨率媒体资源：resourceManager.getMediaContentBase64()

2、导包resourceManager，使用resourceManager.getSystemResourceManager()获取系统资源管理对象，然后获取系统资源。

3、页面将资源读取委托给ResourceAccessService，由该类封装resourceManager的调用；其中的密度归一化、Base64长度换算、复数分支判定和资源键清理由ResourceUtils的静态方法实现。

源码参考：[资源API调用示例](entry/src/main/ets/pages/BasicResources.ets)与[资源工具类](entry/src/main/ets/utils/ResourceUtils.ets)

#### 首页路由的具体实现：

Index.ets通过RouteTable声明的页面顺序校验和解析页面地址，未注册的地址回退到首页，并携带表中声明的resources事件名跳转到资源API示例页面。

源码参考：[首页](entry/src/main/ets/pages/Index.ets)与[路由表](entry/src/main/ets/utils/RouteTable.ets)

#### overlay场景的具体实现：

1、静态overlay主要是通过加载overlay中的资源实现资源覆盖，需要在对应的module.json中添加"targetModuleName":"entry"， 表示覆盖entry中的资源，默认使能，也可调用包管理接口进行使能和去使能。

使用步骤为：在安装完entry的hap后，需要把libraryOverlay模块生成的libraryOverlay-default-signed.hsp推送到/data/test下，使用bm install命令进行安装。

脚本语言如下：

hdc shell mount -o remount,rw /

hdc install ./entry-default-signed.hap

hdc shell mkdir /data/test

hdc file send ./libraryOverlay-default-signed.hsp /data/test

hdc shell bm install -p "/data/test/libraryOverlay-default-signed.hsp"

pause

2、运行时overlay资源加载，主要是在应用运行过程中实现资源的覆盖，需要应用主动调用资源的addResource接口实现资源的覆盖以及资源的移除，此功能不持久化。

使用步骤为: 在安装完entry的hap后，需要把libraryRuntimeOverlay模块生成的libraryRuntimeOverlay-default-signed.hsp推送到应用对应的安装目录下。

脚本语言如下：

hdc shell mount -o remount,rw /

hdc install ./entry-default-signed.hap

hdc file send ./libraryRuntimeOverlay-default-signed.hsp /data/app/el1/bundle/public/ohos.samples.resourcemanager

pause

3、页面通过OverlayController判定按钮动作、维护overlay状态迁移并选择提示文案对应的资源键，Overlay.ets只按判定结果刷新界面。

源码参考：[Overlay示例](entry/src/main/ets/pages/Overlay.ets)与[overlay控制类](entry/src/main/ets/service/OverlayController.ets)


### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本工程示例仅支持标准系统上运行。

2. 本工程仅支持API26版本SDK，SDK版本号(API Version 26.0.0)，镜像版本号(7.1.0.21)。

3. 本工程示例需要使用DevEco Studio 26及以上版本才可编译运行。

### 测试

本工程提供ohosTest自动化用例（56个测试套件、3628条用例），其中ui/下5个套件共128条为UiTest界面用例，appres/下2个套件共60条读取被测模块的真实资源。全部套件已在API 26真机上按describe分批执行通过。执行步骤与测试产物路径见[ohosTest.md](ohosTest.md)。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Resource/ResourceManager/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

