# 事件末端拦截再分发（C/C++）

## 介绍

本工程主要实现了对以下指南文档[事件末端拦截再分发开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/input/eventhandler-guidelines.md)
中示例代码片段的工程化，通过该工程可以创建并启用输入事件handler，在输入事件到达目标应用前同步接收按键、鼠标、触摸和轴事件，并对每条事件单独决定拦截或再分发。

使用说明：

1. 安装编译生成的hap包，打开应用（需在PC/2in1设备上运行，并在"设置 > 隐私 > 权限管理"中为应用手动开启输入事件拦截授权）。
2. 点击对应按键创建并启用handler，此后操作键盘、鼠标、触屏和滚轮，页面实时显示接收到的事件。
3. 数字键"1"的按下事件被拦截（不会输入到输入框），其余事件再分发（可正常输入到输入框）。
4. 点击对应按键禁用并销毁handler，输入事件恢复默认分发。

## 效果预览

主界面自上而下分为三个区域：顶部为事件结果展示区（实时显示接收到的事件信息或接口调用结果）；中部为输入框（用于验证按键事件被拦截或再分发的效果）；底部为功能按钮区（创建并启用handler、禁用并销毁handler）。

<!-- 效果图待补充：真机截图 screenshots/main_page.png -->

## 工程目录

```
NDKInputEventHook
├──entry/src/main
│  ├──cpp                           // C++代码区
│  │  ├──CMakeLists.txt             // CMake配置文件
│  │  ├──napi_init.cpp              // 示例代码
│  │  ├──types
│  │  │  ├──libentry
│  │  │  │  ├──Index.d.ts           // 接口声明
│  │  │  │  ├──oh-package.json5     // 接口配置
│  ├──ets                           // 代码区
│  │  ├──entryability
│  │  │  └──EntryAbility.ets        // Ability的生命周期回调
│  │  ├──entrybackupability         // 备份能力
│  │  └──pages
│  │     └──Index.ets               // 主界面
│  └──resources                     // 资源目录
└──
```

## 相关概念

- 事件末端拦截再分发：应用通过输入事件handler，在输入事件到达目标应用前同步接收事件，并可对每条事件单独决定是拦截还是再分发。

## 具体实现

* 输入事件handler的创建、启用、查询与销毁全流程封装在native模块中，源码参考：[napi_init.cpp](entry/src/main/cpp/napi_init.cpp)
    * 创建并启用handler：`OH_Input_EventHandler_Create`组合四类事件掩码创建handler，`OH_Input_EventHandler_Enable`启用后开始接收输入事件，`OH_Input_EventHandler_IsEnabled`与`OH_Input_EventHandler_GetMask`查询handler状态；
    * 处理输入事件：事件回调`OnEvent`中通过`OH_Input_Event_GetType`获取事件类型，再经`OH_Input_Event_AsKeyEvent`等接口转换为对应事件视图读取字段，对数字键"1"的按下事件返回nullptr拦截，其余事件返回原事件再分发；
    * 禁用并销毁handler：`OH_Input_EventHandler_Enable`传入false禁用，`OH_Input_EventHandler_Destroy`销毁并释放资源；
    * 接口声明参考：[Index.d.ts](entry/src/main/cpp/types/libentry/Index.d.ts)，C API说明参考[事件末端拦截再分发开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/input/eventhandler-guidelines.md)。

## 相关权限

- [ohos.permission.HOOK_INPUT_EVENT](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/restricted-permissions.md)

## 依赖

不依赖三方库。

## 约束与限制

- 仅支持PC/2in1形态设备。
- 本示例仅支持API 26及以上版本SDK，SDK版本号：26.1.0。
- 本示例需要使用DevEco Studio 6.0及以上版本才可编译运行。
- [ohos.permission.HOOK_INPUT_EVENT](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/restricted-permissions.md)为system_basic级别权限，需要配置高权限签名，可参考[特殊权限配置方法](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/hapsigntool-overview.md)。
- 该权限无法通过弹窗申请，应用上架审核通过后，需引导用户在"设置 > 隐私 > 权限管理"中手动开启授权。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/InputKit/NDKInputEventHook/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
