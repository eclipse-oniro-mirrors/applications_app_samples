# 扩展屏独立density适配

## 介绍

本工程主要演示多屏下显示大小缩放比例（Density）的适配方式。通过该工程可在PC/2in1设备连接扩展屏后，
体验主窗口density的三种跟随策略（默认density、系统density、自定义density），以及窗口跨屏移动后density信息的查询与监听。

使用说明：

1. 安装编译生成的hap包，打开应用（需在PC/2in1设备连接扩展屏的场景下体验完整功能）。
2. 应用启动后默认跟随系统density策略，主页面显示当前窗口所在屏幕ID、系统显示大小缩放系数、系统默认显示大小缩放系数和自定义显示大小缩放系数。
3. 点击主页面上的"设置窗口Density跟随策略"按钮进入策略设置页面，打开/关闭"默认density策略"开关，控制窗口是否使用所在屏幕的系统默认显示大小缩放系数，观察窗口布局是否跟随用户设置的显示大小变化。
4. 在策略设置页面点击"自定义density策略"按钮，窗口使用固定的自定义显示大小缩放系数（2.0），跨屏移动后保持不变。
5. 将窗口从主屏拖拽到扩展屏（抬手后生效），主页面上的屏幕ID与density信息随之更新；系统显示大小缩放系数变化时，页面信息同步刷新。

## 工程目录

```
WindowDensitySample
├──entry/src/main/ets
│  │  ├──entryability
│  │  │  ├──EntryAbility.ets           // 保存windowStage供页面使用
|  |  ├──entrybackupability
|  |  |  ├──EntryBackupAbility.ets
│  │  ├──pages
│  │     ├──Index.ets               // 主页面：展示density信息、监听跨屏移动与density变化
│  │     ├──DensityStrategy.ets     // 策略设置页面：切换主窗口density跟随策略
```

## 相关权限

不涉及。

## 依赖

不涉及。

## 约束与限制

1. 本示例支持标准系统上运行，支持设备： 华为电脑、电脑模式下的平板。
2. 本示例仅支持在连接扩展屏的PC/2in1设备上体验完整功能，文中接口在不同设备上的支持情况存在差异。
3. 本示例API Version 26及以上版本SDK。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/ArkUIWindowSamples/WindowDensitySample > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
