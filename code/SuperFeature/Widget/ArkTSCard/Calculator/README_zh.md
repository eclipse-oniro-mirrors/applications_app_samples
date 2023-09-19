# ArkTS卡片计算器

### 介绍

本示例展示了使用ArkTS卡片开发的计算器模型。

### 效果预览

| 添加卡片                                         | 卡片预览                                                 | 操作卡片                                         |
| ------------------------------------------------ | -------------------------------------------------------- | ------------------------------------------------ |
| ![CalculatorAdd](screenshots/CalculatorAdd.jpeg) | ![CalculatorPreview](screenshots/CalculatorPreview.jpeg) | ![CalculatorUse](screenshots/CalculatorUse.jpeg) |

### 使用说明

1.部分设备的桌面不支持卡片，可以通过自己的开发卡片使用方，进行卡片的创建、更新和删除等操作。

### 工程目录

```
entry/src/main/ets/
|---entryability
    |---EntryAbility.ts                    // Ability声明周期处理文件
|---entryformability
|   |---EntryFormAbility.ts                // 卡片声明周期处理文件
|---pages
|   |---index.ets                          // 首页
|---calc
|   |---pages
|   |   |---CardCalc.ets                       // 计算器卡片页面
```

### 相关权限

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行。

2.本示例为Stage模型，从API version 9开始支持。版本号：3.2.12.2,镜像版本号：[OpenHarmony_4.0.9.6](http://download.ci.openharmony.cn/version/Master_Version/OpenHarmony_4.0.9.6/20230801_204236/version-Master_Version-OpenHarmony_4.0.9.6-20230801_204236-dayu200_4.0-beta2_img.tar.gz)。

3.本示例需要使用DevEco Studio 3.1 Beta2 (Build Version: 3.1.0.400, built on April 7, 2023)才可编译运行。