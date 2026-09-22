# 设备感知（DistributedSoftbusBase）

## 介绍

本示例基于 [@ohos.distributed.softbusBase](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-distributedservice-kit/js-apis-softbusBase-sys.md)（设备感知，系统接口，起始版本 26.0.1）实现，演示 softbusBase 模块提供的 6 个接口：感知广播的启停（startPerceptionAdv / stopPerceptionAdv）、高频切换（setPerceptionAdvHighFreq）、感知扫描的启停（startPerceptionScan / stopPerceptionScan）以及已发现设备列表查询（getPerceptionDeviceList）。

系统应用可通过自定义负载广播唤醒周边协同设备，并通过扫描发现周边感知设备，适用于近场设备间低功耗、高效的协同唤醒与发现场景。

## 效果预览

主界面提供 6 个控件按钮，分别调用 softbusBase 的 6 个接口；下方为调试日志窗口，实时展示每个接口的调用返回结果与错误码。

> 说明：效果图请补充真机截图。

### 使用说明

1. 在主界面，点击「开始广播」启动感知广播，携带自定义负载（01 02 03 04）。
2. 点击「切高频」将活跃广播切换为高频 10 秒，到期自动恢复原频段。
3. 点击「停止广播」停止感知广播，停止后周边扫描设备不再发现本设备。
4. 点击「开始扫描」启动感知扫描，保活周期为中周期。
5. 点击「获取设备」查询扫描发现的设备列表，日志窗口展示设备类型、设备 ID、自定义数据。
6. 点击「停止扫描」停止扫描并清空已发现设备列表。
7. 所有调用结果（成功/失败、错误码）实时显示在下方日志窗口，点击「清空」可清除日志。

## 工程目录

```
DistributedSoftbusBase/
|---AppScope/
|   |---app.json5                                // 应用配置（bundleName、vendor 等）
|---entry/
|   |---src/main/ets/
|   |   |---entryability/
|   |   |   |---EntryAbility.ets                // 应用入口，运行时申请 DISTRIBUTED_DATASYNC 用户授权
|   |   |---entrybackupability/
|   |   |   |---EntryBackupAbility.ets          // 备份扩展能力
|   |   |---pages/
|   |   |   |---Index.ets                        // 主界面，6 个接口的调用与调试日志展示
|   |   |---util/
|   |   |   |---Logger.ets                       // 日志封装（[Sample_SoftBusBase] 前缀，hilog）
|   |   |---module.json5                         // 模块配置，声明 ACCESS_SOFTBUS_SYS_HAP 与 DISTRIBUTED_DATASYNC 权限
|   |   |---resources/                           // 字符串、颜色、图片资源（$r 引用，支持中英文与深色模式）
|   |---src/ohosTest/                            // UI 自动化用例
|---build-profile.json5                          // 工程级构建配置
|---hvigorfile.ts                                // 构建脚本
|---oh-package.json5                             // 依赖配置
```

## 具体实现

- 6 个接口的调用封装在 [Index.ets](entry/src/main/ets/pages/Index.ets) 中，每个接口均以 try/catch 捕获异常，调用结果通过日志窗口实时展示，不会导致应用 crash。
  - 启动广播：调用 `softbusBase.startPerceptionAdv(type, customData)`，携带 ≤5 字节自定义负载。
  - 切换高频：调用 `softbusBase.setPerceptionAdvHighFreq(type, customData)`，活跃广播切换高频 10 秒。
  - 停止广播：调用 `softbusBase.stopPerceptionAdv(type)`。
  - 启动扫描：调用 `softbusBase.startPerceptionScan(type, cycle)`，指定保活周期档位。
  - 获取设备：调用 `softbusBase.getPerceptionDeviceList(type)`，返回 PerceptionDeviceInfo[]（设备类型、设备 ID、自定义数据）。
  - 停止扫描：调用 `softbusBase.stopPerceptionScan(type)`，清空设备列表。
- 日志统一通过 [Logger.ets](entry/src/main/ets/util/Logger.ets) 封装，前缀 `[Sample_SoftBusBase]`，底层使用 hilog。
- 字符串与颜色全部通过 `$r` 引用资源，支持国际化与深色模式。

## 相关权限

- ohos.permission.ACCESS_SOFTBUS_SYS_HAP（系统权限，系统签名授予）。
- ohos.permission.DISTRIBUTED_DATASYNC（用户授权，运行时弹窗申请）。

权限说明可参考[权限定义列表](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md)。

## 依赖

不依赖外部示例。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：phone、tablet、2in1、car、wearable、tv。
2. 本示例仅支持 API 26.0.1 及以上版本 SDK。
3. 本示例涉及系统接口（softbusBase 为 @systemapi），需系统应用签名；涉及 ohos.permission.ACCESS_SOFTBUS_SYS_HAP 为系统级权限，需配置系统签名，可参考[特殊权限配置方法](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/hapsigntool-guidelines.md)。
4. 本示例需要使用 DevEco Studio 4.1 及以上版本才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/DistributedAppDev/DistributedSoftbusBase/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
