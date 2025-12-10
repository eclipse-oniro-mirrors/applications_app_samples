# native_node_ani接口指南文档示例代码

### 介绍

本示例介绍如何在ArkTs1.2工程中使用native_node_ani.h头文件中的接口。

### 效果预览

![NDKSample](figures/NDKSample.PNG)

**使用说明**

1. 在主页面点击GetContextFromAniValueTest按钮，调用GetContextFromAniValue接口；
2. 在主页面点击GetNodeHandleFromAniValueTest按钮，调用GetNodeHandleFromAniValue接口。

### 工程结构&模块类型  

    ```
    |entry/src/main/ets                  
    |   |---entryablity
    |   |   |---EntryAbility.ts                         // 程序入口类             
    |   |---pages                                 
    |   |   |---Index.ets                               // 主页面
    |entry/src/main/cpp
    |   |---ani_init.cpp                                // native_node_ani接口测试代码
    ```

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行。

2.本示例为Stage模型，支持API20版本SDK，SDK版本号（API Version 20 Release）。

3.本示例需要使用DevEco Studio版本号（6.0.0.43）及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```shell
git init
git config core.sparsecheckout true
echo code/ArkTS1.2/NDKSample/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull