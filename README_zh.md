【示例贡献温馨提示】感谢您关注OpenHarmony，如果您希望提交代码样例/示例/Demo，请参考知识体系的[《如何共建开发样例》](https://gitee.com/openharmony-sig/knowledge/blob/master/docs/co-construct_demos/README_zh.md)，首先提交到SIG（兴趣组）仓，知识体系SIG仓中的提交也是有效贡献。再次感谢您的关注！

# 应用示例<a name="ZH-CN_TOPIC_0000001115464207"></a>

-   [概要简介](#section1470103520301)
-   [目录](#sectionMenu)
-   [使用说明](#section17988202503116)
-   [约束与限制](#section18841871178)
-   [Sample提交规范](CodeCommitChecklist.md)

## 概要简介<a name="section1470103520301"></a>

为帮助开发者快速熟悉OpenHarmony SDK所提供的API和应用开发流程，我们提供了一系列的应用示例，即Sample。每一个应用示例都是一个独立的DevEco Studio工程项目，开发者可以将工程导入到DevEco Studio开发工具，通过浏览代码、编译工程、安装和运行应用示例来了解应用示例中涉及API的使用方法。

## 目录<a name="sectionMenu"></a>
- WebLikeUI：类web开发范式UI
  - [`WebLikeUIComponents`：类web开发范式UI集（JS）（API9）](WebLikeUI/)
- DeclaretiveUI：声明式开发范式UI
  - [`DeclaretiveUIComponents`：声明式开发范式UI（eTS）（API9）](DeclaretiveUI/)
- Feature：基础特性
  - [`Share`：分享（eTS）（API9）（Full SDK）](Feature/Share)
- SystemFeature：系统特性
  - [`Launcher`：仿桌面应用（eTS）（API9）（Full SDK）](SystemFeature/Launcher)
- SuperFeature：高级特性展示
  - [`AdaptiveCapabilities`：多设备自适应能力（eTS）（API9）](SuperFeature/AdaptiveCapabilities)
  - [`AppMarket`：一多应用市场首页（eTS）（API9）](SuperFeature/AppMarket)
  - [`Weather`：一多天气（eTS）（API9）](SuperFeature/Weather)
  - [`DistributedDataGobang`：分布式五子棋（eTS）（API9）（Full SDK）](SuperFeature/DistributedDataGobang)
- Architecture：架构解决方案
- EngineeringCapability：工程能力集
- Util：工具集
- DataMock：数据模拟


## 使用说明<a name="section17988202503116"></a>

1.  将独立的应用示例工程导入DevEco Studio进行编译构建及运行调试。
2.  部分应用示例中含有多个模块，开发者可以选择对单个模块进行编译构建，生成一个HAP应用安装包，也可以对整个工程进行编译构建，生成多个HAP应用安装包。
3.  安装运行后，即可在设备上查看应用示例运行效果，以及进行相关调试。

## 约束与限制<a name="section18841871178"></a>

安装应用示例之前，请先查看"README_zh.md"文件来确认应用示例是否为stage模型，若为Stage模型需要查看entry/src/main路径下的module.json5文件中的"deviceType"字段来确认该应用支持的设备类型；否则为FA模型，查看entry/src/main路径下的config.json文件中的"deviceType"字段来确认该应用示例支持的设备类型，两种模型都可尝试通过修改该字段使其可以在相应类型的设备上运行。