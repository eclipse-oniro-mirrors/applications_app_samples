# Web组件嵌套滚动

## 介绍
1. Web组件嵌套滚动：实现对以下指南文档中 https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/web/web-nested-scrolling.md 示例代码片段的工程化，保证指南中示例代码与sample工程文件同源。

## Web组件嵌套滚动 ImpNestedScroll 

### 介绍
1. 使用Web组件nestedScroll属性来设置上下左右四个方向，或者设置向前、向后两个方向的嵌套滚动模式，实现与父组件的滚动联动，同时也允许在过程中动态改变嵌套滚动的模式。

### 效果预览

| 主页                                                       |
| ---------------------------------------------------------- |
| <img src="screenshots\ImpNestedScroll.png" width="360;" /> |

### 使用说明

1. 设置滚动模式（前）
   - 在 切换前滚动模式 区域，点击 SELF_ONLY、SELF_FIRST、PARENT_FIRST、PARALLEL 按钮，可分别将 NestedScrollModeF 设置为相应的滚动模式，此模式用于控制 Web 视图向前滚动（scrollForward）时与父组件的交互方式。
2. 设置滚动模式（后）
   - 在 切换后滚动模式 区域，同样点击上述按钮，可设置NestedScrollModeB，用于控制 Web 视图向后滚动（scrollBackward）时的交互模式。


### 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets					// 首页
|---|---|---ImpNestedScroll.ets	  //使用nestedScroll属性实现嵌套滚动
|---|---|---WebBackToTop.ets        //置顶
|---|---|---WebNestedScroll.ets    //滚动偏移量由滚动父组件统一派发
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```


### 相关权限

[ohos.permission.INTERNET](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

## 依赖

不涉及。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。
2. 本示例支持API14版本SDK，SDK版本号(API Version 14 Release)。
3. 本示例需要使用DevEco Studio 版本号(5.0.1Release)才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb/ManageWebPageInteracts > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```