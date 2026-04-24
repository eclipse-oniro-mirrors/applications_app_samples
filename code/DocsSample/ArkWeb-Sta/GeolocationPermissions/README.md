#  管理位置权限

### ManageLocPerms

#### 介绍

1. 本示例主要介绍管理位置权限，可以通过onGeolocationShow()接口对某个网站进行位置权限管理。Web组件根据接口响应结果，决定是否赋予前端页面权限。
2. 实现对以下指南文档中 https://gitee.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/web/web-geolocation-permission.md 示例代码片段的工程化，保证指南中示例代码与sample工程文件同源。

#### 效果预览

| 主页                                                        | 提示框                                                      |
| ----------------------------------------------------------- | ----------------------------------------------------------- |
| <img src="screenshots\ManageLocPerms_1.png" width="360;" /> | <img src="screenshots\ManageLocPerms_2.png" width="360;" /> |

#### 具体实现

1. 通过onGeolocationShow()接口对某个网站进行位置权限管理。
1. 点击按钮，Web组件通过弹窗的形式通知应用侧位置权限请求消息，参考源码：[ManageLocPerms.ets](./entry/src/main/ets/pages/ManageLocPerms.ets)。
