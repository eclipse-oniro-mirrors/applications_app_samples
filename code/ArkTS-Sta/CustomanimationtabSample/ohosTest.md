# 自定义动效 Tab 实现测试说明

## 1. 简介

本示例使用 Stack、Scroll、Swiper、List、SkeletonLayout 等组件实现自定义动效页签：页签切换时字体放大加粗、背景指示条平滑移动，并支持通过按钮切换指示条颜色。本文档说明本工程 `ohosTest` 自动化测试的覆盖范围、目录结构、执行方式与结果判定。

## 2. 测试环境

| 项目 | 说明 |
|---|---|
| 设备 | Phone / Tablet / 2in1 真机或模拟器 |
| SDK | 6.0.0(20) 及以上 |
| 测试框架 | Hypium + UiTest（`@kit.TestKit`） |
| 测试模块 | `entry_test` |
| 应用包名 | `com.samples.CustomanimationtabSample` |

## 3. 测试目录结构

```
entry/src/ohosTest/ets/test
├─ List.test.ets                 # 测试入口，注册 26 个套件
├─ Model                         # 页签模型、状态、边界与契约用例（26 个文件）
└─ Shared                        # SharedDriver / CustomAnimationTabFixtures
```

## 4. 测试覆盖统计

| 分类 | 文件数 | 用例数 | 说明 |
|---|---:|---:|---|
| Model | 26 | 335 | 页签模型、布局计算、状态迁移、快照契约、属性与数值边界、资源与上下文契约 |
| Shared | 2 | - | UI 驱动封装与测试夹具，不直接产生用例 |
| **合计** | **26** | **335** | `List.test.ets` 注册全部 26 个套件 |

## 5. 主要测试场景

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 初始页面渲染 | 1. 真机环境<br/>2. 构建并安装测试 HAP<br/>3. 启动测试 Ability | 打开应用首页 | 显示“全部、UI布局、动效、三方库、其它”5 个页签，默认选中“全部”，指示条为灰色 | 是 | Pass |
| 点击页签切换 | 同上 | 依次点击 5 个页签 | 选中页签字体放大加粗，指示条位移到对应页签，Swiper 同步切换页面 | 是 | Pass |
| 内容区滑动切换 | 同上 | 在 Swiper 区域左右滑动 | 页面切换，顶部页签选中态与指示条同步更新 | 是 | Pass |
| 首尾边界处理 | 同上 | 在第一个页签向前滑、在最后一个页签向后滑 | `loop` 关闭时不回绕，选中态与页面保持不变 | 是 | Pass |
| 指示条颜色切换 | 同上 | 点击“切换颜色”按钮 | 指示条在灰色与黄色之间切换，再次点击可恢复 | 是 | Pass |
| 颜色状态保持 | 同上 | 切换颜色后继续切换页签 | 颜色状态保持，不因页签切换而重置 | 是 | Pass |
| 页签栏横向联动 | 同上 | 横向滑动页签栏 | 页签栏滚动，指示条按相反方向补偿位移，位置保持对齐 | 是 | Pass |
| 切换动画时长 | 同上 | 跨多个页签点击 | 动画时长按页签距离计算，指示条平滑移动且最终位置准确 | 是 | Pass |
| 重复与快速操作 | 同上 | 连续点击同一页签、快速反复切换 | 页面、选中态与颜色状态保持稳定，无错位或重复动画 | 是 | Pass |
| 模型与边界校验 | 单元测试环境 | 非法索引、空标题、越界数值、异常状态迁移 | 模型返回合法结果或安全兜底，状态机保持合法状态 | 是 | Pass |

## 6. 构建与运行

```powershell
# 构建主 HAP
hvigorw --mode module -p product=default -p module=entry@default -p buildMode=debug assembleHap

# 构建测试 HAP
hvigorw --mode module -p product=default -p module=entry@ohosTest -p buildMode=debug assembleHap

# 安装（签名 profile 需包含当前设备 UDID）
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

运行测试命令：

<code>hdc shell a&#97; test -b com.samples.CustomanimationtabSample -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000</code>

## 7. 结果判定

- `OHOS_REPORT_RESULT: Tests run: N, Failure: 0, Error: 0, Pass: N` 表示全部通过。
- `OHOS_REPORT_CODE: 0` 且 `TestFinished-ResultCode: 0` 表示测试任务正常结束。
- 存在 `Failure`、`Error` 或 `STATUS_CODE: -1` 时，根据 `stack` 与 `stream` 定位失败用例。
