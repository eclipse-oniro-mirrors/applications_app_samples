# arkts-immersive-light-sense

## 介绍

本示例展示了沉浸光感（Immersive Light Sense）中沉浸式系统材质（ImmersiveMaterial）各项能力的使用方式与注意事项。沉浸光感是ArkUI从API版本26.0.0起新增的一套高品质视觉与动效体系，通过沉浸式系统材质（ImmersiveMaterial）与空间动效的结合，为应用组件带来通透、精致的视觉表现。

[沉浸光感](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-immersive-light-sense.md)

## 使用说明

1. 安装编译生成的hap包，并打开应用；
2. 首页面会出现示例列表，点击列表项进入对应的沉浸光感示例页面；
3. 各示例页面从材质生效范围、阴影、材质设置顺序、渲染区域、显示层级、兼容性适配、反色、赋色、交互形变与点光源、自定义阴影等维度，展示沉浸式系统材质的设置方式和注意事项。

## 工程目录

```
arktsImmersiveLightSense
├── AppScope
│   ├── app.json5
│   └── resources
│       └── base
│           ├── element
│           │   └── string.json
│           └── media
│               ├── background.png
│               ├── foreground.png
│               └── layered_image.json
├── entry
│   └── src
│       ├── main
│       │   ├── ets
│       │   │   ├── entryability
│       │   │   │   └── EntryAbility.ets
│       │   │   ├── entrybackupability
│       │   │   │   └── EntryBackupAbility.ets
│       │   │   └── pages
│       │   │       ├── Index.ets                                  // 首页导航
│       │   │       ├── MaterialScopeAdaptExample.ets              // 材质生效范围
│       │   │       ├── ApplyShadowExample.ets                     // 关闭材质阴影使用自定义shadow
│       │   │       ├── SystemMaterialOrderExample.ets             // systemMaterial设置顺序
│       │   │       ├── MaterialRenderAreaExample.ets              // 材质渲染区域与可视区域
│       │   │       ├── MaterialDisplayLayerExample.ets            // 材质效果显示层级
│       │   │       ├── AppLevelCompatibilityExample.ets           // 应用级兼容性适配
│       │   │       ├── ComponentLevelCompatibilityExample.ets     // 组件级兼容性适配
│       │   │       ├── MaterialColorInvertExample.ets             // 材质自动反色
│       │   │       ├── MaterialColorExample.ets                  // 材质赋色
│       │   │       ├── MaterialInteractiveLightExample.ets        // 交互形变与点光源
│       │   │       └── CustomShadowExample.ets                    // 自定义阴影
│       │   ├── module.json5
│       │   └── resources
│       │       └── base
│       │           ├── element
│       │           │   ├── color.json
│       │           │   ├── float.json
│       │           │   └── string.json
│       │           ├── media
│       │           │   ├── background.png
│       │           │   ├── foreground.png
│       │           │   ├── greyBackground.png
│       │           │   ├── invert.png
│       │           │   └── startIcon.png
│       │           └── profile
│       │               ├── backup_config.json
│       │               └── main_pages.json
│       └── ohosTest
│           └── ets
│               └── test
│                   ├── Ability.test.ets
│                   └── List.test.ets
├── ohosTest.md
└── README_zh.md
```

## 具体实现

1. **材质生效范围**：在Navigation标题栏与内容区分别为组件设置systemMaterial，对比展示处于生效范围内（标题栏）材质生效、处于生效范围外（内容区）材质不生效的行为差异。
2. **关闭材质阴影使用自定义shadow**：通过`applyShadow: false`关闭沉浸式系统材质自带的阴影，改用自定义`.shadow()`属性实现阴影效果。
3. **systemMaterial设置顺序**：展示推荐写法——先设置组件其余属性（尺寸、圆角等），再设置`systemMaterial`，避免属性覆盖导致材质失效。
4. **材质渲染区域与可视区域**：以Checkbox、Text为例，展示材质渲染区域与组件可视区域不一致时的表现。
5. **材质效果显示层级**：以TextArea为例，说明不建议同时使用沉浸式系统材质和背景色接口，避免显示层级冲突。
6. **应用级兼容性适配**：通过`uiMaterial.getMaterialInfo()`获取应用材质状态，当应用级材质开启时将组件`backgroundColor`置为undefined，避免遮挡材质效果。
7. **组件级兼容性适配**：通过`deviceInfo.sdkApiVersion`判断API版本，不低于26.0.0时设置沉浸式系统材质，低于26.0.0时置为undefined恢复原有样式。
8. **材质自动反色**：通过`colorInvert: true`为tabBar材质开启自动反色，配合ULTRA_THIN或THIN样式，使内容颜色自动适配背景反色，保证可读性。
9. **材质赋色**：通过`materialColor`为材质指定颜色，展示带颜色的沉浸式系统材质效果。
10. **交互形变与点光源**：通过`interactive: true`开启交互形变，通过`lightEffect: {}`开启交互点光源效果，按压产生弹性形变、触摸产生流光跟随。
11. **自定义阴影**：在Navigation标题栏中关闭材质自带阴影（`applyShadow: false`）并设置自定义`.shadow()`，同时开启`interactive`交互形变。

## 相关权限

不涉及

## 依赖

不涉及

## 约束和限制

1. 本示例支持标准系统上运行。

2. 本示例为Stage模型，支持API26版本SDK，版本号：26.0.0。

3. 本示例需使用DevEco Studio配套API26版本才可编译运行。

4. 沉浸光感功能从API版本26.0.0开始支持，需要确保设备的targetAPIVersion不低于26.0.0。

5. 沉浸光感效果会根据设备算力档位自动适配，高档设备呈现完整效果，中低档设备自动降级。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/arktsImmersiveLightSense > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
