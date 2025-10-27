# 复杂文本绘制与显示（C++）

## 介绍

本工程主要实现了对以下指南文档中 [复杂文本绘制](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/graphics/complex-text-arkts.md) 示例代码片段的工程化，主要目标是实现指南中示例代码需要与sample工程文件同源，以及除基本文字、排版属性之外，针对应用中不同文本的设计，开发者可能需要设置使用不同的绘制样式或能力，以凸显对应文本的独特表现或风格，此时可以结合使用多种绘制样式进行文本的渲染。

## 效果预览

| ![](screenshots/device/index.jpeg) | ![](screenshots/device/1.jpeg)    | ![](screenshots/device/2.jpeg)   | ![](screenshots/device/2-1.jpeg) | ![](screenshots/device/2-2.jpeg) | ![](screenshots/device/2-3.jpeg) | ![](screenshots/device/2-4.jpeg) | ![](screenshots/device/2-5.jpeg) | ![](screenshots/device/3.jpeg)    | ![](screenshots/device/3-1.jpeg)  |
| ---------------------------------- | --------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | --------------------------------- | --------------------------------- |
| ![](screenshots/device/3-2.jpeg)   | ![](screenshots/device/3-3.jpeg)  | ![](screenshots/device/3-4.jpeg) | ![](screenshots/device/3-5.jpeg) | ![](screenshots/device/3-6.jpeg) | ![](screenshots/device/3-7.jpeg) | ![](screenshots/device/3-8.jpeg) | ![](screenshots/device/3-9.jpeg) | ![](screenshots/device/3-10.jpeg) | ![](screenshots/device/3-11.jpeg) |
| ![](screenshots/device/3-12.jpeg)  | ![](screenshots/device/3-13.jpeg) | ![](screenshots/device/4.jpeg)   | ![](screenshots/device/5.jpeg)   |                                  |                                  |                                  |                                  |                                   |                                   |

使用说明

1. 该工程可以选择在模拟器和开发板上运行。   
2. 点击构建，即可在生成的应用中点击对应的按钮进行图案的绘制。
3. 进入“DocsSample/graphic/NDKGraphics2D/NDKComplexText1/entry/src/ohosTest/ets/test/DrawingAbility.test.ets”文件，可以对本项目进行UI的自动化测试。

## 工程目录

```
NDKComplexTextPart2
├──entry/src/main
│  ├──cpp                           // C++代码区
│  │  ├──CMakeLists.txt             // CMake配置文件
│  │  ├──napi_init.cpp                  // Napi模块注册
│  │  ├──common
│  │  │  └──log_common.h            // 日志封装定义文件
│  │  ├──plugin                     // 生命周期管理模块
│  │  │  ├──plugin_manager.cpp
│  │  │  └──plugin_manager.h
│  │  ├──samples                    // samples渲染模块
│  │  │  ├──draw_text_impl.cpp
│  │  │  ├──sample_bitmap.cpp
│  │  │  └──sample_bitmap.h
│  ├──ets                           // ets代码区
│  │  ├──entryability
|  |  |  └──EntryAbility.ets
│  │  └──pages                      // 页面文件
│  │     ├─ Index.ets               // 主界面
│  │     ├─ NavTreePage.ets
│  │     └──NdkPage.ets
|  ├──resources         			// 资源文件目录
```

## 具体实现

1. 利用Native XComponent来获取NativeWindow实例、获取布局/事件信息、注册事件回调并通过Drawing API实现在页面上绘制形状。
2. 通过在IDE中创建Native c++ 工程，在c++代码中定义对外接口，在js侧调用该接口可在页面上绘制出相对应的不同效果的文字。
3. 在XComponent的OnSurfaceCreated回调中获取NativeWindow实例并初始化NativeWindow环境。调用OH_Drawing_TextStyle接口创建指向OH_Drawing_TextStyle对象的指针，调用OH_Drawing_SetTextStyleFontSize接口设置字号，OH_Drawing_SetTextStyleFontWeight接口设置字重,OH_Drawing_TextStyleAddFontFeature接口设置文本样式中指定字体特征是否启用，OH_Drawing_SetTypographyTextLocale接口来设置指定排版样式的语言环境，OH_Drawing_SetTypographyTextAlign接口设置文本对齐方式，OH_Drawing_SetTypographyTextWordBreakType接口设置单词的断词方式，OH_Drawing_SetTypographyTextMaxLines接口设置文本最大行数。

## 相关权限

无。

## 依赖

不涉及。

## 约束和限制

1. 本示例支持标准系统上运行，支持设备：RK3568。
2. 本示例支持API22版本SDK，版本号：6.0.2.55。
3. 本示例已支持DevEco Studio 6.0.0 Release (构建版本：6.0.0.858，构建 2025年9月25日)编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/graphic/NDKGraphics2D/NDKComplexText1/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

