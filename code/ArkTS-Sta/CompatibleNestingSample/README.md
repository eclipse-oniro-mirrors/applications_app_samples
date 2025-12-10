# ArkUI动态和ArkUI静态支持组件相互兼容嵌套示例

## 介绍

ArkUI动态页面使用兼容组件嵌入ArkUI静态的子树；
ArkUI静态页面使用兼容组件嵌入ArkUI动态的子树；


## 效果图预览
| ArkUI动态调用静态                                                   | ArkUI静态调用动态                                                   |
|---------------------------------------------------------------|---------------------------------------------------------------|
| ![Alt text](entry/src/main/resources/base/media/ArkUI1_1.PNG) | ![Alt text](entry/src/main/resources/base/media/ArkUI1_2.PNG) |

## 工程结构&模块类型

```
   ModuleSample
   |---entry
   |   |---src/main/ets/pages
   |   |   |---ArkUI1_2.ets                 // 静态嵌套界面
   |   |   |---Index.ets                    // 动态嵌套界面
   |---libaray1_1                           // 动态har包
   |   |---src/main/ets/pages/components
   |   |   |---common
   |   |   |   |---constants
   |   |   |   |   |---CommonConstants.ets
   |   |   |---components
   |   |   |   |---ProductItemComp.ets
   |   |   |---model
   |   |   |   |---ProductModel.ets
   |   |   |---pages
   |   |   |   |---ProductWaterFlowPage.ets
   |---libaray1_2                           // 静态har包
   |   |---src/main/ets/pages/components
   |   |   |---MainPage.ets
```

## 实现思路

### 场景1：动态调用静态界面。

* 静态库library1_2，库内实现一个ArkUI静态代码编写的[SearchSwiperComponent](library1_2/src/main/ets/components/MainPage.ets),通过导入该静态库并调用实现了ArkUI静态页面使用兼容组件嵌入ArkUI动态的子树场景。

### 场景2：静态调用动态界面。
* 静态库library1_1，库内实现一个ArkUI动态代码编写的[ProductWaterFlowPage](library1_1/src/main/ets/components/pages/ProductWaterFlowPage.ets),通过导入该静态库并调用实现了ArkUI动态页面使用兼容组件嵌入ArkUI静态的子树场景。

## 相关权限

无

## 依赖

无

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：Phone;
2. 本示例为Stage模型，支持API20版本SDK，SDK版本号(API Version 20)。
3. 本示例需要使用DevEco Studio 版本号(6.0.0.43)版本才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/ArkTS1.2/CompatibleNestingSample/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull
```