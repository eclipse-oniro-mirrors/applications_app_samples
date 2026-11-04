# 预上屏文本样式（静态 ArkTS）

### 介绍

本工程对应静态 ArkTS 自绘编辑框开发指南，包含一个自绘编辑页面和一个输入法发送页面。
使用 ArkTS 1.2，仅演示带样式预上屏，结束预上屏以及订阅与解绑。

应用包名为 `com.samples.previewstylestatic`。本示例使用 [IMEKit 输入法接口](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ime-kit/js-apis-inputmethod.md) 的输入法扩展、编辑器绑定和预上屏样式接口。工程源码位于 [PreviewTextStyleStatic](https://gitcode.com/openharmony/applications_app_samples/tree/OpenHarmony_feature_sta_20260331/code/DocsSample/InputMethod/PreviewTextStyleStatic)。

### 效果预览

| 页面说明 | 截图 |
| --- | --- |
| 发送预上屏 | <img src="./screenshots/STA-Preview.jpeg" width="360" style="zoom:33%;" /> |
| 结束预上屏 | <img src="./screenshots/STA-Finished.jpeg" width="360" style="zoom:33%;" /> |

### 使用说明

1. 使用支持 ArkTS 1.2 和 SDK 26.1.0 的开发工具打开本工程，按本地设备配置签名。
2. 安装后在系统设置中选择本示例输入法，回到应用并点击编辑区完成绑定。
3. 在输入法页面点击“发送预上屏”，观察真实回调更新的文字和红色波浪线。
4. 点击“结束预上屏”，文字保留，下划线清除；离开页面时自动解绑并取消订阅。

构建验证见 [TestReport.md](./TestReport.md)。 IDE 构建截图见 [IDE-Build.jpg](./screenshots/IDE-Build.jpg)。

### 工程目录

```text
PreviewTextStyleStatic/
├── AppScope/                         应用名称资源与包配置
├── entry/src/main/ets/components/    自绘编辑器与样式接收
├── entry/src/main/ets/keyboard/      输入法扩展、键盘界面与发送端
├── entry/src/main/ets/pages/         应用入口与编辑页面
├── entry/src/main/resources/         文案、颜色与页面资源
├── entry/src/ohosTest/                UI自动化测试
├── ohosTest.md                       测试用例和运行说明
├── screenshots/                      真实运行或构建截图
└── TestReport.md                     测试记录
```

#### 指南代码对应

| 内容 | 文件 | 标记 |
| --- | --- | --- |
| 处理预上屏及结束回调 | `entry/src/main/ets/components/PreviewEditor.ets` | `preview_style_sta_receive` |
| 订阅和取消订阅 | 同上 | `preview_style_sta_subscribe` |
| 异步发送 | `entry/src/main/ets/keyboard/PreviewSender.ets` | `preview_style_sta_send` |
| 同步等价写法 | 同上 | `preview_style_sta_send_sync` |
| 结束预上屏 | 同上 | `preview_style_sta_finish` |

颜色采用 0xRRGGBB，颜色字段设为 undefined 时跟随编辑器主题色，显式 0 表示黑色。
编辑器只订阅带样式预上屏回调，避免与旧回调重复处理同一文本。
运行环境需要同时提供静态输入法扩展，自绘编辑框绑定及预上屏样式接口。

- [PreviewSender.ets](https://gitcode.com/openharmony/applications_app_samples/blob/OpenHarmony_feature_sta_20260331/code/DocsSample/InputMethod/PreviewTextStyleStatic/entry/src/main/ets/keyboard/PreviewSender.ets) 从输入法连接取得 `InputClient`，发送带样式的预上屏文本并结束预上屏。
- [PreviewEditor.ets](https://gitcode.com/openharmony/applications_app_samples/blob/OpenHarmony_feature_sta_20260331/code/DocsSample/InputMethod/PreviewTextStyleStatic/entry/src/main/ets/components/PreviewEditor.ets) 订阅编辑回调，按范围绘制预上屏文字与下划线，解绑时取消订阅。
- [KeyboardPanel.ets](https://gitcode.com/openharmony/applications_app_samples/blob/OpenHarmony_feature_sta_20260331/code/DocsSample/InputMethod/PreviewTextStyleStatic/entry/src/main/ets/keyboard/KeyboardPanel.ets) 提供发送与结束按钮，实际结果由编辑器回调显示。

### 相关权限

本示例无需申请额外权限。

### 依赖

运行环境需提供输入法扩展、自绘编辑框绑定与预上屏样式接口，并使用配套 SDK。接口说明见 [IMEKit API](https://gitcode.com/openharmony/docs/tree/master/zh-cn/application-dev/reference/apis-ime-kit)。

### 约束与限制

本示例面向已集成预上屏样式接口的 OpenHarmony 标准系统，验证设备为 RK3568。工程目标 SDK 为 26.1.0，IDE 需支持该 SDK 的构建工具链。按目标设备配置本地调试签名；工程不包含设备证书。

### 下载

```sh
git init
git config core.sparsecheckout true
echo code/DocsSample/InputMethod/PreviewTextStyleStatic/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
