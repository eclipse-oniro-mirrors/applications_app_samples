# 事件末端拦截再分发（C/C++）

## 介绍

本工程主要实现了对以下指南文档[事件末端拦截再分发开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/input/eventhandler-guidelines.md)
中示例代码片段的工程化，通过该工程可以创建并启用输入事件handler，在输入事件到达目标应用前同步接收按键、鼠标、触摸和轴事件，并对每条事件单独决定拦截或再分发。

使用说明：

1. 安装编译生成的hap包，打开应用（需在PC/2in1设备上运行，并在"设置 > 隐私 > 权限管理"中为应用手动开启输入事件拦截授权）。
2. 点击对应按键创建并启用handler，此后操作键盘、鼠标、触屏和滚轮，页面实时显示接收到的事件。
3. 数字键"1"的按下事件被拦截（不会输入到输入框），其余事件再分发（可正常输入到输入框）。
4. 点击对应按键禁用并销毁handler，输入事件恢复默认分发。

## 工程目录

```
NDKInputEventHook
├──entry/src/main
│  ├──cpp                           // C++代码区
│  │  ├──CMakeLists.txt             // CMake配置文件
│  │  ├──napi_init.cpp              // 示例代码
|  |  ├──types
|  |  |  ├──libentry
|  |  |  |  ├──Index.d.ts           // 接口声明
|  |  |  |  ├──oh-package.json5     // 接口配置
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

## 相关权限

- [ohos.permission.HOOK_INPUT_EVENT](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/restricted-permissions.md)

## 依赖

不依赖三方库。

## 约束与限制

- 仅支持PC/2in1形态设备。
- 该权限无法通过弹窗申请，应用上架审核通过后，需引导用户在"设置 > 隐私 > 权限管理"中手动开启授权。
