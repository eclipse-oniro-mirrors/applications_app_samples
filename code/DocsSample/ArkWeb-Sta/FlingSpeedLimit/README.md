# Web组件惯性滚动速度限制

## 介绍

本工程主要实现了对Web组件 `flingSpeedLimit` 属性的示例化，包含静态模式。主要目标是实现指南示例代码与sample工程文件同源。

## 使用说明

1. 启动应用后，首页提供一个入口按钮，进入静态属性示例。
2. 在示例页面中，通过按钮切换不同的速度上限值（1000/5000/9000 vp/s），在Web页面上快速滑动并松手，观察惯性滚动的减速行为差异。

## 静态属性方式设置惯性滚动速度上限：flingSpeedLimit

### 介绍

1. 通过 `.flingSpeedLimit()` 属性链式调用直接设置Web组件惯性滚动的速度上限。
2. 使用 `@State` 装饰器管理速度值，按钮点击后自动驱动UI刷新。

### 使用说明

1. 点击按钮切换速度上限值，在Web页面上快速滑动松手，感受惯性滚动距离的变化。
2. 较小的速度上限使惯性滚动更快停止，较大的速度上限允许惯性滚动持续更久。

## AttributeModifier方式设置惯性滚动速度上限：flingSpeedLimit

### 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets                          // 首页入口
|---|---|---FlingSpeedLimitStatic.ets          // 静态属性方式示例
|---resources                                   // 静态资源
|---|---rawfile
|---|---|---fling_demo.html                     // 演示用长页面
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets               // 自动化测试用例
```

### 具体实现

1. 构建一个长页面的HTML文件（`fling_demo.html`），用于展示惯性滚动效果。
2. **静态属性方式**：在 `FlingSpeedLimitStatic.ets` 中，通过 `@State speedLimit` 驱动 `.flingSpeedLimit(this.speedLimit)` 属性调用。
3. 两种方式均提供按钮切换速度上限值（1000/5000/9000 vp/s）。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行。
2. 本示例支持API 26.0.1版本SDK。
3. 本示例需要使用DevEco Studio才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb/FlingSpeedLimit > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
