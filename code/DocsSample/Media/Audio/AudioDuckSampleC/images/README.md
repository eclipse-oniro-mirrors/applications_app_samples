# DuckApplication 真机截图说明

## 需要补充的截图（7张）

| 文件名 | 截图时机 | 页面 | 关键UI元素 |
|--------|---------|------|-----------|
| `index-page.jpg` | 主页，未进入任何方案 | Index | 3个方案按钮+描述文案 |
| `duck-playing.jpg` | 方案一：音乐播放中，未启动导航 | DuckPage | 音乐"正在播放"，导航"导航未启动" |
| `duck-ducket.jpg` | 方案一：导航播报进行中 | DuckPage | 音乐"播放中(音量降低)" + DUCK⬇标记，导航"播报中"，进度条 |
| `duck-session-active.jpg` | 方案二：导航播报进行中 | DuckSessionPage | AudioSession"已激活(修改模式)"，音乐DUCK⬇，导航"播报中" |
| `duck-session-unducked.jpg` | 方案二：导航结束，音乐恢复 | DuckSessionPage | AudioSession"未激活"，音乐"正在播放"(无DUCK⬇)，导航"导航未启动"，toast"音量恢复" |
| `mix-enabled.jpg` | 方案三：MIX开关开启+导航播报 | MixSessionPage | MIX🔄标记，音乐"正在播放"(无DUCK⬇)，导航"播报中" |
| `mix-disabled.jpg` | 方案三：MIX开关关闭+导航播报 | MixSessionPage | DUCK⬇标记，音乐"播放中(音量降低)"，导航"播报中" |

## 截图方法

真机运行时在关键状态用手机截图（音量下键+电源键），通过 hdc 或 USB 拷贝到本目录：

```bash
hdc file recv /data/local/tmp/screenshot.jpg ./images/
```

## 可选补充截图

| 文件名 | 说明 |
|--------|------|
| `duck-architecture.jpg` | 4层架构图（可手绘或用绘图工具） |
| `duck-scenario-flow.jpg` | DUCK事件流时序图 |
