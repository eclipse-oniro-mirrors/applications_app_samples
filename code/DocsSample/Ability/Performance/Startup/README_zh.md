# 提升应用冷启动速度示例

### 介绍

本示例展示了[提升应用冷启动速度](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/performance/improve-application-cold-start-speed.md)的四种方式：

1. 缩短应用进程创建&初始化阶段耗时；
2. 缩短Application&Ability初始化阶段耗时；
3. 缩短Ability生命周期阶段耗时；
4. 缩短加载绘制首页阶段耗时。

### 效果预览

| 应用初始页面                    | 任务完成界面                      |
| ------------------------------- | --------------------------------- |
| ![](screenshots/helloworld.png) | ![](screenshots/taskcomplete.png) |

使用说明

应用在启动后显示文本"hello world"；几秒后耗时操作完成，文本变更为"task complete"。

### 工程目录
```
entry/src/main/
├── ets
│   ├── common
│   │   └── Logger.ts                     // 日志工具
│   ├── entryability
│   │   └── EntryAbility.ts               // Ability类
│   └── pages
│       └── Index.ets                     // 首页
├── module.json5
└── resources
    ├── base
    │   ├── element
    │   │   ├── color.json
    │   │   └── string.json
    │   ├── media
    │   │   ├── highResolutionIcon.png    // 高分辨率图标
    │   │   ├── icon.png
    │   │   └── startIcon.png
    │   └── profile
    │       └── main_pages.json
    ├── en_US
    │   └── element
    │       └── string.json
    ├── rawfile
    └── zh_CN
        └── element
            └── string.json

```
### 具体实现

#### 1. 缩短应用进程创建&初始化阶段耗时

通过设置合适分辨率的startWindowIcon，缩短应用进程创建&初始化阶段耗时，进而提升应用冷启动速度。

entry/src/main/module.json5

```json
{
  "module": {
    "name": "entry",
    "type": "entry",
    "description": "$string:module_desc",
    "mainElement": "EntryAbility",
    "deviceTypes": [
      "default"
    ],
    "deliveryWithInstall": true,
    "installationFree": false,
    "pages": "$profile:main_pages",
    "abilities": [
      {
        "name": "EntryAbility",
        "srcEntry": "./ets/entryability/EntryAbility.ts",
        "description": "$string:EntryAbility_desc",
        "icon": "$media:icon",
        "label": "$string:EntryAbility_label",
        "startWindowIcon": "$media:startIcon",	// 优化前为"$media:highResolutionIcon"
        "startWindowBackground": "$color:start_window_background",
        "exported": true,
        "skills": [
          {
            "entities": [
              "entity.system.home"
            ],
            "actions": [
              "action.system.home"
            ]
          }
        ]
      }
    ]
  }
}
```

详情可参见：[设置合适分辨率的startWindowIcon](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/performance/improve-application-cold-start-speed.md/#设置合适分辨率的startwindowicon)

#### 2. 缩短Application&Ability初始化阶段耗时

通过减少import的模块，可以缩短Application&Ability初始化阶段耗时，进而提升应用冷启动速度。

entry/src/main/ets/entryability/EntryAbility.ts

```ts
// 优化减少import的模块
// import ability from '@ohos.ability.ability';
// import dataUriUtils from '@ohos.ability.dataUriUtils';
// import errorCode from '@ohos.ability.errorCode';
// import featureAbility from '@ohos.ability.featureAbility';
// import particleAbility from '@ohos.ability.particleAbility';
// import wantConstant from '@ohos.ability.wantConstant';
// import common from '@ohos.app.ability.common';
// import Configuration from '@ohos.app.ability.Configuration';
// import contextConstant from '@ohos.app.ability.contextConstant';
// import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
// import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
// import GesturePath from '@ohos.accessibility.GesturePath';
// import GesturePoint from '@ohos.accessibility.GesturePoint';
// import distributedAccount from '@ohos.account.distributedAccount';
// import osAccount from '@ohos.account.osAccount';

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import logger from '../common/Logger';
```

详情可参见：[减少import的模块](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/performance/improve-application-cold-start-speed.md/#减少import的模块)

#### 3. 缩短Ability生命周期阶段耗时

通过将Ability生命周期回调接口中的耗时操作改为异步延迟执行，可以缩短Ability生命周期阶段耗时，进而提升应用冷启动速度。

entry/src/main/ets/entryability/EntryAbility.ts

```ts
export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logger.info('Ability onCreate');
    // 耗时操作
    // this.computeTask();
    this.computeTaskAsync(); // 异步任务
  }
  // ...
}
```

详情可参见：[避免在Ability生命周期回调接口进行耗时操作](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/performance/improve-application-cold-start-speed.md/#避免在ability生命周期回调接口进行耗时操作)

#### 4. 缩短加载绘制首页阶段耗时

通过将自定义组件的生命周期回调接口中的耗时操作改为异步延迟执行，可以缩短加载绘制首页阶段耗时，进而提升应用冷启动速度。

entry/src/main/ets/pages/Index.ets

```ts
@Entry
@Component
struct Index {
  // ...
  aboutToAppear() {
    // 耗时操作
    // this.computeTask();
    this.computeTaskAsync(); // 异步任务
    let context = getContext(this) as Context
    this.text = context.resourceManager.getStringSync($r('app.string.startup_text'))
  }
  // ...
}
```

详情可参见：[自定义组件生命周期回调接口里避免耗时操作](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/performance/improve-application-cold-start-speed.md/#自定义组件生命周期回调接口里避免耗时操作)

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行,支持设备：RK3568。

2.本示例已适配API version 10版本SDK，版本号：4.0.10.13。

3.本示例需要使用DevEco Studio 4.0 (Build Version: 4.0.0.600 构建 2023年10月17日)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/Performance/StartupAndResponse/Startup/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```