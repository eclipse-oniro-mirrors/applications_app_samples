# 性能示例

### 介绍

本示例集成了条件渲染、动态加载以及HiDumper等场景来介绍如何提升应用性能。

### 效果预览
| 性能示例主页                          | 
|---------------------------------|
| ![](screenshots/device/Home.jpeg) | 

HiDumper使用说明：  
1.点击性能示例主页的**HiDumper**按钮，进入**HiDumper查看组件信息**场景页。

1.点击HiDumper查看组件信息场景页的**查看应用组件树**进入场景页。

2.点击HiDumper查看组件信息场景页的**查看if/else组件**按钮，在场景中点击**显隐切换**按钮，查看图片显示隐藏。

3.点击HiDumper查看组件信息场景页的**查看visibility属性**按钮，在场景中依次点击**Visible**、**Hidden**、**Visible**、**None**，查看图片显示和隐藏。

常规加载页面使用说明：

1.点击性能示例主页的**StaticImport**按钮，进入**常规加载入口**场景页。

2.点击常规加载入口的**点击跳转常规加载案例**按钮，进入**常规加载主页**。

3.点击常规加载主页的**pageOne**按钮，进入**常规加载子页面**。

动态加载页面使用说明：

1.点击性能示例主页的**DynamicImport**按钮，进入**动态加载入口**场景页。

2.点击动态加载入口页的**点击跳转动态加载案例**按钮，进入**动态加载主页**。

3.点击动态加载主页的**pageOne**按钮，进入**动态加载子页面**。

ifOrVisibility使用说明：

1.点击性能示例主页的**ifOrVisibility**按钮，进入**合理选择条件渲染合显隐控制**场景页，其下有四组场景，八个页面。

2.分别点击**频繁切换：显隐控制页面** ，**频繁切换：条件渲染页面** ，进入频繁切换场景，可以通过点击**Switch visible and hidden**按钮，实现组件显示与隐藏间的切换，对比完成时延。

3.分别点击**首页渲染：条件渲染页面** ，**首页渲染：显隐控制页面**，进入首页渲染场景，可以通过点击**Show the Hidden on start**按钮，可以显示首页渲染时，初始被隐藏的组件，对比首页加载渲染完成时延。

4.分别点击**部分修改：条件渲染+容器限制页面**、**部分修改：条件渲染模块**，进入部分修改场景，可以通过点击**Switch Hidden and Show**按钮，可以对长列表中Text组件做部分修改，对比完成时延。

5.分别点击**复杂子树：条件渲染+组件复用页面**、**复杂子树：条件渲染页面**，进入复杂子树场景，可以通过点击**Change FlexAlign**按钮，可以Flex组件中子组件布局方式，对比布局修改完成时延。

Grid高性能使用说明：

1.点击性能示例主页的**使用LazyFoEach,cachedCount,组件复用**按钮，进入**懒加载+cachedCount+组件复用页面**场景页。

2.点击性能示例主页的**使用columnStart**按钮，进入**使用columnStart，columnEnd页面**场景页，点击**scrollToIndex:1900**按钮，通过性能打点方式，查看滑动耗时。

3.点击性能示例主页的**使用GridLayoutOptions**按钮，进入**使用GridLayoutOptions页面**场景页，点击**scrollToIndex:1900**按钮，通过性能打点方式，查看滑动耗时。

SmartPerfEditor使用说明：

1.打开显隐切换页面，点击**显示/隐藏Image**按钮，使用DrawingDoc录制回放功能抓取绘制信息。

SmartPerfHost使用说明：  

1.点击smartPerfHost示例主页的**SmartPerfHost**按钮，进入**SmartPerfHost查看组件信息**场景页。

2.点击SmartPerfHost查看FrameTimeline优化前场景页的**FrameTimeline优化前代码**按钮进入场景页。

3.点击SmartPerfHost查看FrameTimeline优化后场景页的**FrameTimeline优化后代码**按钮进入场景页。

4.点击SmartPerfHost查看AppStartup优化前场景页的**AppStartup优化前代码**按钮进入场景页。

5.点击SmartPerfHost查看AppStartup优化前场景页的**AppStartup优化后代码**按钮进入场景页。

### 工程目录

```
features
|---/dynamicImport/src/main/ets                      // 动态加载HAR共享包
|---|---/pages    
|   |   |---DynamicContentPageOne.ets                // 动态加载子页面     
|   |   |---DynamicEntryView.ets                     // 动态加载入口页面           
|   |   |---DynaHome.ets                             // 动态加载主页
|---/grid/src/main/ets                               // grid类功能HAR共享包
|   |---/view    
|   |   |---GridView.ets                             // 场景主页面模块       
|   |   |---GridLazyForEachView.ets                  // 懒加载+cachedCount+组件复用模块
|   |   |---GridColumnStartView.ets                  // 使用columnStart，columnEnd模块     
|   |   |---GridLayoutOptionsView.ets                // 使用GridLayoutOptions模块
|---/hiDumper/src/main/ets                           // 列表类功能HAR共享包
|   |---/view    
|   |   |---ConditionView.ets                        // 显隐切换模块      
|   |   |---GridView.ets                             // 查看组件树模块
|   |   |---HidumperHomeView.ets                     // 场景主页面模块           
|   |   |---VisibilityView.ets                       // 查看Visibility属性模块
|---/ifOrVisibility/src/main/ets                     // 列表类功能HAR共享包
|   |---/util                                                              
|   |   |---/Constants.ets                           // 常量
|   |---/model                                                               
|   |   |---/SceneData.ets                           // 数据类型
|   |   |---/SceneMsg.ets                            // 本地数据
|   |---/view    
|   |   |---HidumperHomeView.ets                      // 场景主页面模块
|   |   |---/IfForStartUp    
|   |   |   |---BetterUseIf.ets                       // 首页渲染：条件渲染模块            
|   |   |   |---WorseUseVisibility.ets                // 首页渲染：显隐控制模块
|   |   |---/Reusable    
|   |   |   |---AlignContentFlex.ets                  // Text子组件           
|   |   |   |---IfWithoutReusable.ets                 // 复杂子树：条件渲染+模块
|   |   |   |---IfWithReusable.ets                    // 复杂子树：条件渲染+组件复用模块     
|   |   |   |---MockComplexReusableSubBranch.ets      // 模拟复用复杂子组件
|   |   |   |---MockComplexSubBranch.ets              // 模拟复杂子组件
|   |   |---/StackForRenderControl    
|   |   |   |---RenderControlWithoutStack.ets         // 部分修改：条件渲染+容器限制模块         
|   |   |   |---RenderControlWithStack.ets            // 部分修改：条件渲染模块
|   |   |---/VisibilityForAnimate    
|   |   |   |---BetterUseVisibility.ets               // 频繁切换：显隐控制模块           
|   |   |   |---WorseUseIf.ets                        // 频繁切换：条件渲染
|---/smartPerfEditor/src/main/ets                     // 显隐类功能HAR共享包
|   |---/view    
|   |   |---SmartPerfEditorView.ets                   // 显隐切换模块  
|---/smartPerfHost/src/main/ets                       // SmartPerfHost功能HAR共享包
|   |---/view    
|   |   |---AppStartupBeforeOptimization.ets          // 冷启动耗时优化前模块      
|   |   |---AppStartupAfterOptimization.ets           // 冷启动耗时优化后模块
|   |   |---FrameTimelineBeforeOptimization.ets       // 丢帧测试优化前模块
|   |   |---FrameTimelineAfterOptimization.ets        // 丢帧测试优化后模块
|   |   |---SmartPerfHostHomeView.ets                 // 场景主页面模块   
|---/staticImport/src/main/ets                        // 常规加载HAR共享包
|---|---/pages    
|   |   |---StaticContentPageOne.ets                  // 常规加载子页面     
|   |   |---StaticContentPageTwo.ets                  // 常规加载子页面
|   |   |---StaticEntryView.ets                       // 常规加载入口页面           
|   |   |---StaticHome.ets                            // 常规加载主页
products/phone/entry/src/main/ets
|---/entryability
|   |---EntryAbility.ts                               // 封装整个模块启用，监听Ability对应的窗口等逻辑
|---/model                                                               
|   |---/DataType.ets                                 // 数据类型
|   |---/MockData.ets                                 // 本地数据
|---pages 
|   |---/dynamicImport
|   |   |---DynamicEntryView.ets           // 动态加载入口页面
|   |   |---DynamicHome.ets                // 动态加载主页
|   |   |---DynamicContentPageOne.ets      // 动态加载内容页 
|   |---/grid
|   |   |---GridPage.ets                              // 场景主页面                 
|   |   |---GridLazyForEachPage.etss                  // 懒加载+cachedCount+组件复用页面
|   |   |---GridColumnStartPage.ets                   // 使用columnStart，columnEnd页面           
|   |   |---GridLayoutOptionsPage.ets                 // 使用GridLayoutOptions页面
|   |---/hiDumper
|   |   |---ConditionPage.ets                         // 显隐切换页面                
|   |   |---GridPage.ets                              // 查看组件树页面
|   |   |---HidumperHomePage.ets                      // 场景主页面                   
|   |   |---VisibilityPage.ets                        // 查看Visibility属性页面
|   |---/ifOrVisibility
|   |   |---IfOrVisibilityPage.ets                    // 合理选择条件渲染首页
|   |   |---AnimateBetterUseVisibility.ets            // 频繁切换：显隐控制页面            
|   |   |---AnimateWorseUseIf.ets                     // 频繁切换：条件渲染页面 
|   |   |---IfBetterWithReusable.ets                  // 首页渲染：条件渲染页面                  
|   |   |---IfWorseWithoutReusable.ets                // 首页渲染：显隐控制页面
|   |   |---RenderControlBetterWithStack.ets          // 部分修改：条件渲染+容器限制页面               
|   |   |---RenderControlWorseWithoutStack.ets        // 部分修改：条件渲染页面
|   |   |---StartBetterUseIf.ets                      // 复杂子树：条件渲染+组件复用页面               
|   |   |---StartWorseUseVisibility.ets               // 复杂子树：条件渲染页面  
|   |---/smartPerfEditor
|   |   |---SmartPerfEditorPage.ets                   // 显隐切换页面     
|   |---/smartPerfHost
|   |   |---AppStartupBeforeOptimizationPage.ets      // 冷启动耗时优化前页面                
|   |   |---AppStartupAfterOptimizationPage.ets       // 冷启动耗时优化后页面                
|   |   |---FrameTimelineBeforeOptimizationPage.ets   // 丢帧测试优化前页面
|   |   |---FrameTimelineAfterOptimizationPage.ets    // 丢帧测试优化后页面
|   |   |---SmartPerfHostPage.ets                     // 场景主页面                       
|   |---/staticImport
|   |   |---StaticEntryView.ets                       // 常规加载入口页面              
|   |   |---StaticHome.ets                            // 常规加载主页
|   |---/Index                                        // 性能示例首页                              
|---/utils
|   |---Logger.ets                                    // 封装整个日志

```

### 具体实现

* HiDumper场景模块

  * 查看组件树
    * 在页面上添加Grid，每个GridItem嵌套多个Stack，然后通过HiDumper抓取组件树信息。
    * 源码链接：[GridView.ets](feature/hiDumper/src/main/ets/view/GridView.ets)
    
  * 查看if/else组件
    * 在页面上添加**显隐切换**按钮，添加一张图片，点击按钮后通过HiDumper抓取组件树信息。
    * 源码链接：[ConditionView.ets](feature/hiDumper/src/main/ets/view/ConditionView.ets)
    
  * 查看visibility属性
    * 在页面上添加**Visible**、**Hidden**、**None**按钮，添加一张图片，点击按钮后通过HiDumper抓取组件树信息。
    * 源码链接：[VisibilityView.ets](feature/hiDumper/src/main/ets/view/VisibilityView.ets)

* Navigation常规加载页面模块

  * 在Navigation组件加载内容页时，使用`import`常规加载子页面。
  * 源码链接：[StaticHome.ets](feature/staticImport/src/main/ets/pages/StaticHome.ets)

* Navigation动态加载页面模块

  * 在Navigation组件加载内容页时，使用`await import`实现动态按需加载。
  * 源码链接：[DynamicHome.ets](feature/dynamicImport/src/main/ets/pages/DynamicHome.ets)

* IfOrVisibility四个场景，分别正反例，八个页面：
  * 针对显示和隐藏间频繁切换的场景
    * 反例：使用条件循环实现显示和隐藏间的切换； [WorseUseIf.ets](feature\ifOrVisibility\src\main\ets\view\VisibilityForAnimate\WorseUseIf.ets) 
    * 正例：使用显隐控制实现显示和隐藏间的切换； [BetterUseVisibility.ets](feature\ifOrVisibility\src\main\ets\view\VisibilityForAnimate\BetterUseVisibility.ets) 

  * 针对应用冷启动，加载绘制首页
    * 反例：对于首页初始时，不需要显示的组件，通过显隐控制进行隐藏； [WorseUseVisibility.ets](feature\ifOrVisibility\src\main\ets\view\IfForStartUp\WorseUseVisibility.ets) 
    * 正例：对于首页初始时，不需要显示的组件，通过条件渲染进行隐藏； [BetterUseIf.ets](feature\ifOrVisibility\src\main\ets\view\IfForStartUp\BetterUseIf.ets) 
  * 针对反复切换条件渲染的控制分支，但切换项仅涉及页面中少部分组件的场景
    * 反例：没有使用容器限制条件渲染组件的刷新范围； [RenderControlWithoutStack.ets](feature\ifOrVisibility\src\main\ets\view\StackForRenderControl\RenderControlWithoutStack.ets) 
    * 正例：使用容器限制条件渲染组件的刷新范围； [RenderControlWithStack.ets](feature\ifOrVisibility\src\main\ets\view\StackForRenderControl\RenderControlWithStack.ets) 

  * 针对反复切换条件渲染的控制分支，且控制分支中的每种分支内，组件子树结构都比较复杂的场景
    * 反例：没有使用组件复用实现条件渲染控制分支中的复杂子组件； [IfWithoutReusable.ets](feature\ifOrVisibility\src\main\ets\view\Reusable\IfWithoutReusable.ets) 
    * 正例：使用组件复用实现条件渲染控制分支中的复杂子组件； [IfWithReusable.ets](feature\ifOrVisibility\src\main\ets\view\Reusable\IfWithReusable.ets)
    
* 高性能Grid二个场景，三个页面：
  * 针对Grid中使用懒加载，cachedCount，组件复用的场景
    * 在页面上添加Grid，GridItem使用懒加载，设置cachedCount，同时对GridItem中的子组件使用组件复用； [GridColumnStartView.ets](feature\grid\src\main\ets\view\GridLazyForEachView.ets)

  * 针对Grid中使用scrollToIndex滑动到指定位置的场景
    * 反例：使用columnStart，columnEnd设置GridItem大小，使用scrollToIndex滑动到指定GirdItem，通过性能打点方式查看滑动耗时情况； [GridColumnStartView.ets](feature\grid\src\main\ets\view\GridColumnStartView.ets)
    * 正例：使用GridLayoutOptions设置GridItem大小，使用scrollToIndex滑动到指定GirdItem，通过性能打点方式查看滑动耗时情况； [GridLayoutOptionsView.ets](feature\grid\src\main\ets\view\GridLayoutOptionsView.ets)

* SmartPerfEditor一个场景，一个页面：
  * 针对显示图片中查看是否存在冗余绘制的场景
    * 在页面上添加显隐切换按钮，点击按钮后，显示一张图片，通过DrawingDoc录制回放功能抓取绘制信息； [SmartPerfEditorView.ets](feature\smartPerfEditor\src\main\ets\view\SmartPerfEditorView.ets)

* SmartPerfHost页面模块
  * 应用冷启动，加载绘制页面
    * 应用优化前[AppStartupBeforeOptimization.ets](feature/smartPerfEditor/src/main/ets/view/AppStartupBeforeOptimization.ets)
    * 应用优化后[AppStartupAfterOptimization.ets](feature/smartPerfEditor/src/main/ets/view/AppStartupAfterOptimization.ets)
  * 列表场景丢帧问题优化
    * 应用优化前[FrameTimelineBeforeOptimization.ets](feature/smartPerfEditor/src/main/ets/view/FrameTimelineBeforeOptimization.ets)
    * 应用优化后[FrameTimelineAfterOptimization.ets](feature/smartPerfEditor/src/main/ets/view/FrameTimelineAfterOptimization.ets)

### 相关权限

不涉及。  

### 依赖

不涉及。  

### 约束与限制

1.本示例已适配API version 10版本SDK，SDK版本号(API Version 10 Release),镜像版本号(4.0Release)。

2.本示例需要使用DevEco Studio 版本号(4.0Release)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：  

```

 git init
 git config core.sparsecheckout true
 echo code/Performance/PerformanceLibrary/ > .git/info/sparse-checkout
 git remote add origin https://gitee.com/openharmony/applications_app_samples.git
 git pull origin master

```