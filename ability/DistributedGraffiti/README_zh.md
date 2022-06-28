# 分布式涂鸦

### 简介

本示例展示了在eTS中如何构建FA模型下分布式涂鸦Ability和Service，包含:

1.通过deviceManager提供的接口，获取设备ID（当前该接口未对三方应用开放）。

2.远程拉起对端FA。

3.远程绑定对端PA。

详细的说明见 [ServiceAbility开发指导](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/ability/fa-serviceability.md)。


### 使用说明

1.两台设备组网

2.对弹出的分布式权限弹框进行授权。

3.在一台设备界面中点击start remote ability按钮，拉起远端FA。

4.继续点击connect remote ability按钮，绑定远端PA。

5.在按钮下方的画板进行涂鸦，可以看到远端设备也在同步涂鸦。

### 约束与限制

1.本示例仅支持标准系统上运行。

2.本示例需要使用3.0.0.901及以上的DevEco Studio版本才可编译运行。