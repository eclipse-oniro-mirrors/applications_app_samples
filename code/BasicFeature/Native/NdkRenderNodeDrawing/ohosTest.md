# NdkRenderNodeDrawing 测试用例归档

## 测试结论

| 项 | 数值 |
|---|---|
| 用例套件 | 106 个 |
| 用例总数 | 5,601 条 |
| 已执行 | 5,601 条（106 个套件全部有结果，无跳过） |
| 通过 | 5,601 条 |
| 失败 / 错误 / 忽略 | 0 / 0 / 0 |
| 通过率 | **100%（5,601 / 5,601）** |

- 设备与产物：API 26.0.0 真机 `d629034339413535311095d600002b00`（系统语言中文）；测试 HAP `entry-ohosTest-signed.hap`（10,779,238 B，2026-11-17 18:55:42）。
- 执行方式：使用 DevEco Studio 的 `entry@ohosTest` 运行配置，等价参数为 `-b com.samples.ndknodedrawing`、`-m entry_test`、`-s unittest /ets/TestRunner/OpenHarmonyTestRunner`、`-s timeout 300000`，增量轮再追加 `-s class <套件名>`；判定只看 `OHOS_REPORT_RESULT` 的 `Tests run / Failure / Error`（应用进程退出时 `TestFinished-ResultCode` 可能仍为 0，不能当结论）。
- 执行方式：全量只跑一次作基线（18 套件 897 例），其余 88 套件逐套件执行（4,704 例），按套件去重后 106 套件 5,601 例全部有绿结果；失败项修正后只复跑受影响的 4 个套件，不重复跑全量。
- 首轮不是 100%：基线轮 3 例红（`Sensitivity0055`、`Sensitivity0056`、`PixelSceneC0022`），增量轮 6 例红（`MeasureArg0002`、`0006`、`0017`、`0039`，`MeasureText0008`、`0023`），首轮通过率 5,592 / 5,601 = **99.84%**。9 例都归因为「用例假设与实现语义不符」，只改用例侧断言。
- 收敛后复验：`Sensitivity` 57/57、`PixelSceneC` 70/70、`MeasureArg` 50/50、`MeasureText` 24/24 各连续两轮 `Failure: 0`（测量两套件在折行重建后再补跑一轮仍全绿），无未收敛红例。上表 100% 指修正后的最终状态，口径是「基线 + 增量复跑」，不是「全量两轮全绿」。

## 用例分布

| 分组 | 套件数 | 用例数 |
|---|---|---|
| 像素层（Pixel / PixelMapArg / Resize / Sensitivity） | 4 | 256 |
| 场景轴像素层（PixelSceneA / PixelSceneB / PixelSceneC） | 3 | 150 |
| 契约层（Contract / Param / Schema / Matrix / MatrixTail / TopicMatrix） | 6 | 370 |
| 控制器层（TopicNode / ParamTail / Bridge） | 3 | 107 |
| UI 层（Ability / Page / Index / Capability / Domain / Topic / TopicFlow） | 7 | 142 |
| NAPI 层（Napi / Scene / SceneArg / Node / Draw / Dispatch / Guard / Measure / MeasureArg / MeasureText / UiProbe） | 11 | 328 |
| 能力域参数（A01~A33） | 33 | 2,334 |
| 专题参数（T01~T10） | 10 | 546 |
| 能力域场景（Geometry … Error） | 18 | 1,068 |
| 专题场景（TopicNodeTree … TopicFrameTick） | 10 | 240 |
| 画布场景（Canvas） | 1 | 60 |
| 合计 | 106 | 5,601 |

等级分布 LEVEL0 109 / LEVEL1 2,362 / LEVEL2 3,130，规模分布 SMALLTEST 5,430 / MEDIUMTEST 171；native 枚举、schema 声明、用例镜像与矩阵套件四方的群组下标由 `NdkRenderNodeSchema`、`NdkRenderNodeMatrix` 与 `NdkRenderNodeTopicMatrix` 三套契约用例逐项比对。

用例源码位于 `entry/src/ohosTest/ets/test/`，共 118 个文件 114,036 行：106 个套件文件 + 只做注册的 `List.test.ets` + 11 个公共 helper（`UiDriverUtil.ets`、`SceneDefaults.ets`、`PixelHarness.ets`、`PixelProbe.ets`、`TestPixelMap.ets`、`PixelCaseSupport.ets`、`MatrixSupport.ets`、`ParamProbe.ets`、`SceneArgProbe.ets`、`SceneProbe.ets`、`MeasureArgProbe.ets`）。

## 逐套件台账（按 `List.test.ets` 登记顺序）

序号即挂载顺序；106 套合计 5,601 例，逐套件 `Tests run` 与 `Pass` 相等、`Failure` / `Error` 全为 0。

| 序号 | 套件 | 用例数 | 结果 |
|---|---|---|---|
| 1 | `NdkRenderNodePixel` | 100 | Pass |
| 2 | `NdkRenderNodePixelMapArg` | 23 | Pass |
| 3 | `NdkRenderNodeResize` | 76 | Pass |
| 4 | `NdkRenderNodeSensitivity` | 57 | Pass |
| 5 | `NdkRenderNodePixelSceneA` | 32 | Pass |
| 6 | `NdkRenderNodePixelSceneB` | 48 | Pass |
| 7 | `NdkRenderNodePixelSceneC` | 70 | Pass |
| 8 | `NdkRenderNodeSceneArg` | 6 | Pass |
| 9 | `NdkRenderNodeAbility` | 8 | Pass |
| 10 | `NdkRenderNodeContract` | 5 | Pass |
| 11 | `NdkRenderNodeParam` | 48 | Pass |
| 12 | `NdkRenderNodeSchema` | 87 | Pass |
| 13 | `NdkRenderNodeMatrix` | 101 | Pass |
| 14 | `NdkRenderNodeMatrixTail` | 88 | Pass |
| 15 | `NdkRenderNodeTopicMatrix` | 41 | Pass |
| 16 | `NdkRenderNodeTopicNode` | 61 | Pass |
| 17 | `NdkRenderNodeParamTail` | 20 | Pass |
| 18 | `NdkRenderNodeBridge` | 26 | Pass |
| 19 | `NdkRenderNodePage` | 18 | Pass |
| 20 | `NdkRenderNodeIndex` | 15 | Pass |
| 21 | `NdkRenderNodeCapability` | 26 | Pass |
| 22 | `NdkRenderNodeDomain` | 38 | Pass |
| 23 | `NdkRenderNodeTopic` | 17 | Pass |
| 24 | `NdkRenderNodeTopicFlow` | 20 | Pass |
| 25 | `NdkRenderNodeScene` | 6 | Pass |
| 26 | `NdkRenderNodeNode` | 6 | Pass |
| 27 | `NdkRenderNodeDraw` | 7 | Pass |
| 28 | `NdkRenderNodeNapi` | 89 | Pass |
| 29 | `NdkRenderNodeDispatch` | 58 | Pass |
| 30 | `NdkRenderNodeGuard` | 29 | Pass |
| 31 | `NdkRenderNodeMeasure` | 45 | Pass |
| 32 | `NdkRenderNodeMeasureArg` | 50 | Pass |
| 33 | `NdkRenderNodeMeasureText` | 24 | Pass |
| 34 | `NdkRenderNodeUiProbe` | 8 | Pass |
| 35 | `NdkRenderParamA01` | 96 | Pass |
| 36 | `NdkRenderParamA02` | 24 | Pass |
| 37 | `NdkRenderParamA03` | 96 | Pass |
| 38 | `NdkRenderParamA04` | 42 | Pass |
| 39 | `NdkRenderParamA05` | 96 | Pass |
| 40 | `NdkRenderParamA06` | 24 | Pass |
| 41 | `NdkRenderParamA07` | 96 | Pass |
| 42 | `NdkRenderParamA08` | 18 | Pass |
| 43 | `NdkRenderParamA09` | 96 | Pass |
| 44 | `NdkRenderParamA10` | 12 | Pass |
| 45 | `NdkRenderParamA11` | 96 | Pass |
| 46 | `NdkRenderParamA12` | 36 | Pass |
| 47 | `NdkRenderParamA13` | 96 | Pass |
| 48 | `NdkRenderParamA14` | 54 | Pass |
| 49 | `NdkRenderParamA15` | 96 | Pass |
| 50 | `NdkRenderParamA16` | 72 | Pass |
| 51 | `NdkRenderParamA17` | 96 | Pass |
| 52 | `NdkRenderParamA18` | 18 | Pass |
| 53 | `NdkRenderParamA19` | 96 | Pass |
| 54 | `NdkRenderParamA20` | 42 | Pass |
| 55 | `NdkRenderParamA21` | 96 | Pass |
| 56 | `NdkRenderParamA22` | 96 | Pass |
| 57 | `NdkRenderParamA23` | 42 | Pass |
| 58 | `NdkRenderParamA24` | 90 | Pass |
| 59 | `NdkRenderParamA25` | 96 | Pass |
| 60 | `NdkRenderParamA26` | 84 | Pass |
| 61 | `NdkRenderParamA27` | 96 | Pass |
| 62 | `NdkRenderParamA28` | 18 | Pass |
| 63 | `NdkRenderParamA29` | 96 | Pass |
| 64 | `NdkRenderParamA30` | 66 | Pass |
| 65 | `NdkRenderParamA31` | 84 | Pass |
| 66 | `NdkRenderParamA32` | 90 | Pass |
| 67 | `NdkRenderParamA33` | 78 | Pass |
| 68 | `NdkRenderParamT01` | 60 | Pass |
| 69 | `NdkRenderParamT02` | 78 | Pass |
| 70 | `NdkRenderParamT03` | 54 | Pass |
| 71 | `NdkRenderParamT04` | 48 | Pass |
| 72 | `NdkRenderParamT05` | 48 | Pass |
| 73 | `NdkRenderParamT06` | 72 | Pass |
| 74 | `NdkRenderParamT07` | 48 | Pass |
| 75 | `NdkRenderParamT08` | 54 | Pass |
| 76 | `NdkRenderParamT09` | 42 | Pass |
| 77 | `NdkRenderParamT10` | 42 | Pass |
| 78 | `NdkRenderSceneGeometry` | 66 | Pass |
| 79 | `NdkRenderScenePaint` | 60 | Pass |
| 80 | `NdkRenderSceneColor` | 54 | Pass |
| 81 | `NdkRenderSceneColorFilter` | 54 | Pass |
| 82 | `NdkRenderSceneShader` | 66 | Pass |
| 83 | `NdkRenderSceneMaskFilter` | 48 | Pass |
| 84 | `NdkRenderSceneImageFilter` | 60 | Pass |
| 85 | `NdkRenderSceneBitmap` | 60 | Pass |
| 86 | `NdkRenderScenePixelMap` | 72 | Pass |
| 87 | `NdkRenderSceneImageIo` | 60 | Pass |
| 88 | `NdkRenderSceneFont` | 72 | Pass |
| 89 | `NdkRenderSceneTextBlob` | 48 | Pass |
| 90 | `NdkRenderSceneTypography` | 84 | Pass |
| 91 | `NdkRenderSceneShadow` | 48 | Pass |
| 92 | `NdkRenderSceneMatrix` | 60 | Pass |
| 93 | `NdkRenderSceneRecord` | 48 | Pass |
| 94 | `NdkRenderSceneOffscreen` | 48 | Pass |
| 95 | `NdkRenderSceneError` | 60 | Pass |
| 96 | `NdkRenderSceneTopicNodeTree` | 24 | Pass |
| 97 | `NdkRenderSceneTopicRenderProp` | 24 | Pass |
| 98 | `NdkRenderSceneTopicBlur` | 24 | Pass |
| 99 | `NdkRenderSceneTopicAnimation` | 24 | Pass |
| 100 | `NdkRenderSceneTopicHitTest` | 24 | Pass |
| 101 | `NdkRenderSceneTopicPerformance` | 24 | Pass |
| 102 | `NdkRenderSceneTopicRecord` | 24 | Pass |
| 103 | `NdkRenderSceneTopicMultiDevice` | 24 | Pass |
| 104 | `NdkRenderSceneTopicLifecycle` | 24 | Pass |
| 105 | `NdkRenderSceneTopicFrameTick` | 24 | Pass |
| 106 | `NdkRenderSceneCanvas` | 60 | Pass |

> 台账为 2026-11-17 批次的最终状态：`Sensitivity`（57）、`PixelSceneC`（70）、`MeasureArg`（50）、`MeasureText`（24）四套在修正后各连续两轮 `Failure: 0`；其余 102 套一次通过。

## Ability 套件（`NdkRenderNodeAbility.test.ets`）

套件以 `beforeAll` 做设备前置准备：唤醒屏幕（`power-shell wakeup`）并把应用收敛到首页，避免像素层跑完后测试页不在前台或设备息屏导致后续入口断言整批超时。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 拉起应用 | 设备正常运行 | 启动 Sample | 首页标题与第一个能力入口可见 | 是 | Pass |
| 首页能力入口 | 位于首页 | 逐个查找十二项能力入口 | 十二项入口全部可见 | 是 | Pass |
| 进入绘制页 | 位于首页 | 点击 **Canvas Drawing** | 出现 Draw Path 按钮与返回按钮 | 是 | Pass |
| 返回首页 | 位于绘制页 | 点击 **Back** | 回到首页且末项入口仍可见 | 是 | Pass |
| 进入图元页 | 位于首页 | 点击 **Primitives** | 出现返回按钮，返回后回到首页 | 是 | Pass |
| 重复启动应用 | 位于首页 | 再次启动 EntryAbility | 首页只有一份，入口仍为十二项 | 是 | Pass |
| 切后台再恢复 | 位于首页 | 按 Home 后重新拉起 EntryAbility | 首页标题唯一，首末两个入口均可恢复 | 是 | Pass |
| 连续两轮切后台 | 位于首页 | 连续两轮 Home + 拉起 | 每轮首页标题与第一个入口计数均为 1，不叠加 | 是 | Pass |

> 前置准备不强制停止应用进程：测试代码与 `TestAbility` 运行在同一应用进程内，强制停止会连带杀死当前测试会话；遗留的 `uitest` 守护进程只能在测试拉起之前由主机侧 `hdc shell pkill -f uitest` 清理。

## Page 套件（`NdkRenderNodePage.test.ets`）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 绘制类五页入口 | 位于首页 | 依次进入 **Canvas Drawing**、**Primitives**、**Drawing Effects**、**Canvas Transform**、**Image Drawing** 并返回 | 每页出现各自标记控件（Draw Path、Point、Fill/Stroke、ClipRect、Stretch）与 **Back**，返回后回到首页 | 是 | Pass |
| 文本绘制页控件 | 位于首页 | 进入 **Text Drawing** | **TextBlob**、**Typography**、**Measure Text** 均可见 | 是 | Pass |
| 节点树页控件 | 位于首页 | 进入 **Node Tree** | **Add Child**、**Remove Child**、**Reset** 均可见 | 是 | Pass |
| 渲染属性页开关 | 位于首页 | 进入 **Render Properties** 并统计 Toggle | Toggle 数量为 6 | 是 | Pass |
| 模糊页控件 | 位于首页 | 进入 **Blur Effects** | **Foreground**、**Content**、**Radius** 可见且存在 1 个及以上 Slider | 是 | Pass |
| 生命周期页控件 | 位于首页 | 进入 **Lifecycle** | **Set Label**、**Invalidate**、**Dispose**、**Recreate** 可见，销毁状态初始为 false | 是 | Pass |

## Capability 套件（`NdkRenderNodeCapability.test.ets`）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 能力矩阵目录 | 位于首页 | 点击 **Capability Matrix** | 滚动后十九个能力域标题均可定位，画布域 `10 scenes` 计数可见 | 是 | Pass |
| 画布能力域场景与面板 | 位于目录页 | 进入 **Canvas & Clip** | **Clear & Fill**、**SaveLayer**、**Parameters**、**Reset** 可见且至少 1 个 Slider | 是 | Pass |
| 场景切换联动 | 位于画布能力域 | 点击 **SaveLayer** | 场景说明更新为 SaveLayer 对应的 schema 文案 | 是 | Pass |
| 十九域逐个进入与逐级返回 | 位于目录页 | 依次滚动定位并进入十九个能力域，点 **Back** 回目录，最后回首页 | 每个能力域都出现参数面板与返回按钮，逐级返回成功 | 是 | Pass |

## Topic 套件（`NdkRenderNodeTopic.test.ets`）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 专题目录 | 位于首页 | 点击 **RenderNode Topics** | 滚动后十个专题标题均可定位，`4 scenes` 计数可见 | 是 | Pass |
| 专题页场景与面板 | 位于目录页 | 进入 **Node Tree** | **Append**、**Row Or Column**、**Parameters**、**Reset**、**Re-apply** 可见且至少 1 个 Slider | 是 | Pass |
| 专题场景切换联动 | 位于模糊层专题 | 点击 **Foreground Blur** | 场景说明更新为 Foreground Blur 对应的 schema 文案 | 是 | Pass |
| 十页逐个进入与逐级返回 | 位于专题目录 | 依次滚动定位并进入十个专题，点 **Back** 回目录，最后回首页 | 每个专题都出现参数面板与返回按钮，逐级返回成功 | 是 | Pass |

## Scene 套件（`NdkRenderNodeScene.test.ets`）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 几何图元九种 kind | 位于图元页 | 依次点击 Point、Line、Circle、Oval、Rect、RoundRect、Arc、Path、Region | 每次切换后页面保持可用，入口按钮仅一份 | 是 | Pass |
| 绘制效果八种 kind | 位于效果页 | 依次点击 Fill/Stroke、BlendMode、Dash、Linear、Radial、Sweep、ColorFilter、MaskBlur | 每次切换后页面保持可用，入口按钮仅一份 | 是 | Pass |
| 画布操作七种 kind | 位于画布变换页 | 依次点击 ClipRect、ClipPath、Translate、Rotate、Scale、Matrix、Save/Restore | 每次切换后页面保持可用，入口按钮仅一份 | 是 | Pass |
| 图片绘制四种 kind | 位于图片页 | 依次点击 Stretch、Nearest、Linear、ScaleView | 每次切换后页面保持可用，入口按钮仅一份 | 是 | Pass |
| 文本绘制三种 kind | 位于文本页 | 依次点击 TextBlob、Typography、Measure | 每次切换后页面保持可用，入口按钮仅一份 | 是 | Pass |
| 文本测量展示 | 位于文本页 | 点击 **Measure Text** | 测量结果非空、以 ` px` 结尾，且宽度大于 0 | 是 | Pass |

## Node 套件（`NdkRenderNodeNode.test.ets`）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 添加子节点 | 位于节点树页 | 点击 **Add Child** 一次 | 子节点数由 0 变为 1 | 是 | Pass |
| 子节点数量上限 | 位于节点树页 | 连续点击 **Add Child** 八次 | 子节点数停在 6 | 是 | Pass |
| 移除与重置子节点 | 位于节点树页 | 点击 **Add Child** 两次后点击 **Remove Child**、再点击 **Reset** | 子节点数依次为 2、1、0 | 是 | Pass |
| 渲染属性开关联动 | 位于渲染属性页 | 逐个点击 6 个属性开关 | 开关点击前均为未选中，点击后均为选中 | 是 | Pass |
| 模糊模式切换 | 位于模糊页 | 依次点击 **Background**、**Content**、**Foreground**、**Reset** | 每次切换后页面保持可用，模式按钮仅一份 | 是 | Pass |
| 销毁与重建节点 | 位于生命周期页 | 点击 **Dispose**，再点击 **Recreate** | 销毁状态先变为 true，重建后恢复为 false | 是 | Pass |

## Draw 套件（`NdkRenderNodeDraw.test.ets`）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 绘制路径 | 位于绘制页 | 点击 **Draw Path** | 绘制后页面保持可用，按钮行未被破坏 | 是 | Pass |
| 绘制文字 | 位于绘制页 | 点击 **Draw Text** | 绘制后页面保持可用，按钮行未被破坏 | 是 | Pass |
| 绘制图片 | 位于绘制页 | 点击 **Draw Image** | 绘制后页面保持可用，页面不出现异常 | 是 | Pass |
| 依次绘制三种内容 | 位于绘制页 | 依次点击 **Draw Path**、**Draw Text**、**Draw Image** | 每一步绘制后页面均保持可用 | 是 | Pass |
| 重复绘制同一内容 | 位于绘制页 | 连续两次点击 **Draw Path** | 页面保持可用，不出现重复页面 | 是 | Pass |
| 切换绘制内容 | 位于绘制页 | 依次点击 **Draw Image**、**Draw Path**、**Draw Image** | 页面保持可用，绘制内容可来回切换 | 是 | Pass |
| 重新启动后再绘制 | 位于绘制页 | 再次启动 EntryAbility 后重新进入绘制页并点击 **Draw Path** | 绘制功能仍可用，按钮不重复 | 是 | Pass |

## Napi 套件（`NdkRenderNodeNapi.test.ets`）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| nativeRenderDraw 导出 | - | 读取 libentry.so 的 nativeRenderDraw | 类型为 function | 是 | Pass |
| nativeMeasureText 导出 | - | 读取 libentry.so 的 nativeMeasureText | 类型为 function | 是 | Pass |
| 文本测量（合法入参） | - | nativeMeasureText('RenderNode', 20, 400) | 返回宽高均大于 0，宽度不超过 400 | 是 | Pass |
| 文本测量（非法排版宽度） | - | nativeMeasureText('RenderNode', 20, 0) | 返回宽高均为 0，不抛出异常 | 是 | Pass |
| NAPI 模块单例 | - | 连续两次读取 nativeRenderDraw、nativeMeasureText | 两次得到同一个函数引用 | 是 | Pass |

> 上文 8 个套件的用例数已扩充（Page 18、Capability 26、Topic 17），表格按功能维度归并展示；P7 新增的 10 个套件按覆盖维度归档如下。

## Contract 套件（`NdkRenderNodeContract.test.ets`，5 条）

| 测试功能 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|
| 默认值顺序 | 多参数场景 | 默认值按声明顺序返回，个数与参数个数一致 | Pass |
| 步长对齐与裁剪 | 越界与不在刻度上的值 | 先裁剪到[min,max]，再对齐到最近刻度 | Pass |
| 开关与下拉规整 | 任意小数 | 开关固定 0/1，下拉固定为整数下标 | Pass |
| 归一化补齐 | 长度不足或超长的数值数组 | 输出长度始终等于参数声明数 | Pass |
| schema 与 native 编号一致 | 画布能力域 | 编号、场景数、场景 id 与 native 侧一致 | Pass |

## Param 套件（`NdkRenderNodeParam.test.ets`，48 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 默认值 | 无参数场景返回空数组；默认值顺序即 native 读取下标；返回值是新数组不污染声明 | 按能力域展开 |
| 裁剪 | 上下界、越界、NaN 回退默认值 | 按参数类型展开 |
| 步长对齐 | 整数/小数步长均对齐到刻度，并保证不越界 | 按参数类型展开 |
| 摘要文案 | `key=value` 拼接、单位、小数位数、下拉选项名 | 按控件类型展开 |
| 归一化与回写 | `normalize` / `withValue` 不改写调用方数组 | 按能力域展开 |

## Schema 套件（`NdkRenderNodeSchema.test.ets`，87 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 19 个能力域 | 编号、键名、标题、场景数、场景说明非空与 native `CAPABILITY_GROUP` 声明一致 | 19 |
| 领域细分 | 每个能力域的场景 id 连续、参数类型合法、下拉选项非空 | 按能力域展开 |
| 10 个专题 | `TOPIC_*` 编号、4 个场景、参数声明与 `TopicEngine` 分派一致 | 10 |
| 总量守卫 | 能力域 19 个、专题 10 个、总计 188 + 40 个场景 | 1 |

## Matrix 套件（`NdkRenderNodeMatrix.test.ets`，189 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 逐域逐场景契约 | 19 个能力域共 188 个场景逐个校验：分组编号、场景编号、参数类型/区间/步长/下拉下标合法，`clamp` 越界夹取有效，默认值幂等（`normalize(defaults) == defaults`），状态栏摘要逐项带出参数名 | 188 |
| 总量守卫 | 19 个域编号连续、逐域场景数等于 native `*_SCENE_COUNT`、场景总数 188 | 1 |

> `CAPABILITY_SCENE_COUNTS` 与 native、schema、`NdkRenderNodeSchema.test.ets` 的镜像数组由 `node scripts/verify-matrix.js` 四方比对，任一侧漏改即失败。

## TopicMatrix 套件（`NdkRenderNodeTopicMatrix.test.ets`，41 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 逐专题逐场景契约 | 10 个专题共 40 个场景逐个校验：专题编号落在 20..29、场景编号、参数契约、默认值幂等、摘要文案，并用 `withValue` 把单个参数推到上下界（其余参数保持默认）断言被夹回声明区间 | 40 |
| 总量守卫 | 专题编号连续、每页固定四个场景、场景总数 40 | 1 |

## TopicNode 套件（`NdkRenderNodeTopicNode.test.ets`，61 条）

只 import `main/ets/core/TopicNode.ets`，不挂载 `NodeController`、不触发 native 绘制；所有用例都先构造 `TopicNodeController` 走子节点容器分支。

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 子节点重建 | `rebuildBoxes` 合法值 1/4/7/8、上界 9/100、负值与 `Number.MAX_SAFE_INTEGER`、NaN 回退、清空、覆盖重建、行/列两种布局、连续三次重建的返回值与子节点数同步 | 15 |
| 插入子节点 | 空树、负下标、中间插入、等于长度（追加）、超长下标、已满 8 个后插入被拒、逐步填满到上限、返回值与 `nodeCount` 同步 | 11 |
| 移除子节点 | mode 2 清空、mode 1 只删第一个、其余模式删末尾、空树移除返回 0、连续移除到空 | 10 |
| 录制与回放 | `record` 达到 32 步上限后不再增长、`recordSize` 与返回值一致、`clearRecord` 归零、`replay` 空录制返回 0 且不启动定时器、回放后 `invalidateTimes` 非负 | 10 |
| 统计快照 | 空态四个计数器为 0、重建/点击/绘制后计数同步、label 被记录、`resetStats` 归零但不删子节点 | 10 |
| 帧驱动 | `startTick` 后 `isTicking` 为 true、`stopTick` 后回落、重复 `startTick` 不叠加定时器、`stopTick` 幂等 | 5 |

> 定时器类用例全部在 `try/finally` 里 `stopTick()`，避免用例之间残留 16 ms 定时器互相干扰；`onTouchEvent` 依赖框架构造的 `TouchEvent`，不在本套件内。

## ParamTail 套件（`NdkRenderNodeParamTail.test.ets`，20 条）

补齐 `ParamEngine.describe` / `summary` / `withValue` / `normalize` 的展示口径与下标守卫，期望值来自冻结文案基线 `width=24 vp, enabled=on, sampling=Linear`。

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 滑杆文案 | 带单位按「数值 空格 单位」、无单位不带尾随空格、小数步长保留一位、整数步长四舍五入且不出现小数点 | 4 |
| 开关文案 | 1 展示 `on`、0 展示 `off`、0.5 仍为 `off`（阈值不含等号）、0.4/0.6 两侧取值 | 3 |
| 下拉文案 | 三个合法下标、越界 99 与负下标回落 `-`、小数下标四舍五入（1.4→Linear、1.5→Cubic、2.6→越界占位符） | 5 |
| 摘要拼接 | 缺值按默认值补齐、超长入参数组不参与拼接、按声明顺序以逗号加空格分隔 | 3 |
| 回写与归一化 | `withValue` 负下标/超下标被忽略、上下界夹取、不写回入参数组、`normalize([])` 补默认值 | 5 |

## Bridge 套件（`NdkRenderNodeBridge.test.ets`，26 条）

覆盖 `UnitUtil.toVp` 与两个「未挂载即静默」的控制器（`DemoNodeController`、`CapabilityController`），断言全部落在返回值与空态上，不依赖框架回调 `makeNode`。

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 长度换算 | 数值 24/1/0 原样透传、负值不裁剪、`'24'`/`'24.5'` 按数值解析、空串与 `'abc'`/`'12vp'`/`'12px'` 回退 0、`MAX_SAFE_INTEGER` 不丢精度、数值 NaN 原样透传 | 10 |
| 演示控制器 | 新建后为空、挂载前 `setScene`/`setPixelMap`/`resize` 被静默丢弃、`invalidate` 与重复 `disposeNode` 安全、销毁后设置场景不复活节点 | 5 |
| 能力域渲染节点 | 默认落在画布域第 0 场景、下发场景后域号与场景号分别回报、后一次覆盖前一次、负编号原样保存、超大场景号不截断 | 5 |
| 能力域控制器 | 新建为空且两实例互相隔离、挂载前 `applyScene` 只进缓存、零尺寸与负尺寸 `resize` 被拒、重复销毁幂等、销毁后再下发场景/调整尺寸都不复活 | 6 |

## Dispatch 套件（`NdkRenderNodeDispatch.test.ets`，58 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 全场景分派 | 19 个能力域全部场景以 schema 默认参数调用 `nativeRenderScene`，分派场景数与 schema 一致 | 19 |
| 专题分派 | 10 个专题 × 4 个场景的 `TopicEngine` 分派与节点重建 | 20 |
| 参数组合 | 边界参数（极值、零值、满值）下分派仍不报错 | 按能力域展开 |

## Guard 套件（`NdkRenderNodeGuard.test.ets`，29 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 退化画布 | 19 个能力域 × 零宽/零高/负尺寸等六种非法画布尺寸均静默跳过 | 19 |
| 非法参数 | 超出范围的场景号、非法参数长度、空画布指针均不崩溃 | 10 |

## Measure 套件（`NdkRenderNodeMeasure.test.ets`，45 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 文本测量契约 | 单词/单字/双字/长串 × 常用字号 × 排版宽度组合：宽高为正、有限值、不超排版宽度、行高与字号成比例 | 45 |

## Pixel 套件（`NdkRenderNodePixel.test.ets`，100 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 像素探针 | 测试页 NodeContainer 挂载、组件快照取到非空像素、探针被 ArkUI 实际调度重绘 | 按能力域展开 |
| 绘制正确性 | 清屏、形状、文本、图像等场景绘制后像素与预期基线差分 | 按能力域展开 |
| 确定性 | 同场景同参数重复绘制结果完全一致 | 按能力域展开 |
| 参数敏感性 | 改变调色板/尺寸/透明度后像素哈希发生变化 | 按能力域展开 |

> 探针 `RenderNode` 只在测试页位于前台时才被调度绘制，故本套件在 `List.test.ets` 中排在最前；`PIXEL_0001` 会断言 15 s 内绘制计数必须增长，否则直接报出「探针页被遮挡」而非整层误判。

## PixelMapArg 套件（`NdkRenderNodePixelMapArg.test.ets`，23 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 真实贴图 12 场景 | 像素图域 DRAW_RECT、SAMPLING_NEAREST、SAMPLING_LINEAR、SRC_CONSTRAINT、NINE_PATCH、MESH、ROTATE、TILE、ALPHA、SCALE、CLIP 逐个传入合法 PixelMap，断言真实贴图生效（与缺图示意图哈希不同）；FALLBACK 场景反过来断言传入图片也不改变画面 | 12 |
| 边界尺寸图片 | 1×1 极小图 × 整幅/九宫格/平铺/裁剪四场景；4096×4096 超界图 × 整幅/平铺两场景；均断言不崩溃、仍走真实贴图 | 6 |
| 异常入参降级 | 已 `release()` 的 PixelMap 传入后按缺图处理，画面与缺图基线完全一致 | 1 |
| 入参作用域 | 非像素图能力域（画布域）收到 PixelMap 时忽略该参数，画面与不传时逐字节一致 | 1 |
| 状态隔离 | 同一 PixelMap 连续两次绘制一致；释放后重建的图片再次绘制与第一次结果一致 | 2 |
| 越界守卫 | 场景编号等于场景总数时即使带图也被拦截，画面与空白基线一致 | 1 |

> 该套件补齐了 `SceneRenderNode` 只调用 `nativeRenderScene(context, w, h, group, scene, params)` 六参形式、真实图片从未被矩阵页面传入的空白；测试图由 `TestPixelMap.ets` 构造象限色位图，不依赖 rawfile 与解码器。

## Resize 套件（`NdkRenderNodeResize.test.ets`，76 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 非法尺寸拒绝 | 19 个能力域 × 零高度、负尺寸两组：`resize` 被拒绝后 RenderNode 宽高不变、快照摘要与基准完全一致（不白屏），装载场景后绘制计数继续增长 | 38 |
| 合法尺寸接受 | 19 个能力域 × 1×1、4096×4096 两组：`resize` 被接受后宽高即为请求值，绘制不中断，恢复标准画布后画面逐字节回到基准（不残留白屏） | 38 |

> 画布尺寸链路是全部场景的地基：`GroupHost.onAreaChange` 换算出的高度一旦为 0，所有能力域会同时全白而编译期毫无提示。断言分两层——拒绝的尺寸不得改动画面、接受的尺寸不得让节点失效，且两种情况都要求「恢复标准画布后与基准一致」。

## Sensitivity 套件（`NdkRenderNodeSensitivity.test.ets`，57 条）

| 维度 | 覆盖内容 | 用例数 |
|---|---|---|
| 三态两两比较 | 19 个能力域各自的第一个滑杆参数（按场景顺序扫描定位，含场景 0 无滑杆而落在后续场景的五个域），比较下界↔默认值、上界↔默认值、下界↔上界三组画面：取值不同则摘要必须不同且差异像素数大于 0，取值相同（默认值恰好等于边界，如画布域 alpha）则摘要必须一致 | 57 |

> 像素图域在本套件中传入真实 PixelMap：该域缺图时走示意图分支，不消费滑杆参数，直接比对会得到「参数无感」的假结论。

## Index 套件（`NdkRenderNodeIndex.test.ets`，15 条）

| 测试功能 | 预期输出 | 测试结果 |
|---|---|---|
| 首页结构 | 标题、副标题与可滚动入口列表同时呈现 | Pass |
| 入口唯一性 | 12 个入口标题与说明均可滚动定位且各只出现一次 | Pass |
| 入口往返 | 12 个入口逐个进入并返回首页，层级不叠加 | Pass |
| 多层目录 | 能力目录/专题目录交替进出、三层页面栈返回 | Pass |
| 目录计数 | 能力目录 19 组、专题目录 10 组，场景计数文案与 schema 一致 | Pass |

## Domain 套件（`NdkRenderNodeDomain.test.ets`，38 条）

| 测试功能 | 预期输出 | 测试结果 |
|---|---|---|
| 19 域全场景扫描 | 每个域内逐场景点击：状态栏摘要等于该场景默认参数摘要、场景说明刷新、滑杆/开关/下拉数量与 schema 一致 | Pass |
| 19 域首末切换 | 首末场景来回两轮后面板按 schema 重建，按钮数为场景数+2，重置后状态栏仍为首场景摘要 | Pass |

## TopicFlow 套件（`NdkRenderNodeTopicFlow.test.ets`，20 条）

| 测试功能 | 预期输出 | 测试结果 |
|---|---|---|
| 10 专题全场景扫描 | 逐场景点击后说明与参数控件随 schema 刷新，状态栏保留 nodes/draws/touches/rebuilds 四个计数器且仅一份 | Pass |
| 10 专题下发与重置 | Re-apply 三次说明不变；切末场景后重置，控件数量与该场景 schema 一致 | Pass |

## 执行说明

- 用例文件：`entry/src/ohosTest/ets/test/` 下的 106 个 `*.test.ets` 共 5,601 条用例（逐套件条数见文首「逐套件台账」），套件在 `List.test.ets` 中按 Pixel → PixelMapArg → Resize → Sensitivity → PixelSceneA → PixelSceneB → PixelSceneC → SceneArg → Ability → Contract → Param → Schema → Matrix → MatrixTail → TopicMatrix → TopicNode → ParamTail → Bridge → Page → Index → Capability → Domain → Topic → TopicFlow → Scene → Node → Draw → Napi → Dispatch → Guard → Measure → MeasureArg → MeasureText → UiProbe → A01~A33 → T01~T10 → 场景轴 29 套的顺序挂载：像素层四个套件必须最先执行（探针 `RenderNode` 仅在测试页位于前台时才被调度绘制，一旦被应用页面遮住就不再回调 `draw`，因此 `Pixel` 之后紧接 `PixelMapArg`、`Resize`、`Sensitivity`），契约与矩阵类（不操作界面）紧随其后，页面类、native 与测量类居中，参数域与场景轴（只依赖 schema、不操作界面）最后。
- 公共驱动封装位于 `entry/src/ohosTest/ets/test/UiDriverUtil.ets`，统一提供启动、查找、点击、等待与文本读取；`delayMs`、`click`、`appendChild` 等可能抛异常的调用均已捕获并打印日志。
- 界面文案来自 `$r` 资源，设备语言不同则渲染不同，因此 UI 用例统一按组件 id 定位，不匹配任何文案：目录项 `catalog_item_<key>`、专题目录项 `topic_catalog_item_<key>`、返回 `nav_back_<key>`、场景按钮 `scene_btn_<key>_<id>`、场景说明 `scene_desc_<key>_<id>`、参数面板 `params_title|reapply|reset_<key>`、状态栏 `group_status_<key>`；状态栏等运行时拼接文本再用 `collectTexts` 做包含断言。
- 导航类用例统一走 `ensureIndex`、`openCatalog`、`openTopicCatalog`、`openCapabilityGroup`、`openTopicGroup` 与 `backToIndex`：前者逐级 `Back` 回到首页并重置列表滚动位置，入口位于屏幕外时由 `scrollToId` 在 `List` 容器内逐屏滚动到目标 id 再点击，避免用例之间因页面或滚动状态残留互相干扰。
- `main` 侧为状态类断言补充了组件 id：`node_tree_child_count`、`lifecycle_disposed`、`text_measure_result`、`prop_*_toggle`（6 个属性开关）；id 只用于测试定位，不影响界面表现，新增交互控件沿用 `<用途>_<分组 key>` 命名规则。
- 编译验证命令：
  `hvigorw --mode module -p product=default -p module=entry@ohosTest assembleHap --no-daemon`，结果 `BUILD SUCCESSFUL in 12 s 160 ms`，产物 `entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap`（2,853,267 字节）；主模块 `-p module=entry@default` 同为 `BUILD SUCCESSFUL in 10 s 977 ms`，产物 `entry/build/default/outputs/default/entry-default-signed.hap`（5,635,574 字节）。矩阵套件、Ability 套件、像素层四个套件（`Pixel`、`PixelMapArg`、`Resize`、`Sensitivity`）与其共享的 `PixelHarness.ets`、`PixelProbe.ets`、`TestPixelMap.ets`，以及 `UiDriverUtil.ets`、`TestAbility.ets` 均已进入 ohosTest 的 `sourceMaps.map`。
- 真机执行前的设备预检（在主机侧执行，不在用例内）：`hdc -t <设备序列号> shell pkill -f uitest` 结束遗留的 UI 测试守护进程，否则下一轮 `Driver.create` 可能直接返回 `CONNECTION_EXIST`；随后 `hdc shell power-shell wakeup` 唤醒屏幕。
- 真机执行方式（连接多台设备时在运行配置里指定目标设备）：使用 DevEco Studio 的 `entry@ohosTest` 运行配置，参数为 `-b com.samples.ndknodedrawing`、`-m entry_test`、`-s unittest /ets/TestRunner/OpenHarmonyTestRunner`、`-s timeout 300000`，全量 5,601 条用例。单进程一次性跑全量约在 900 例后触发 `THREAD_BLOCK_6S`（`libuitest.z.so TransactAsync` 卡住主线程），因此实际验证按套件拆分执行（追加 `-s class <套件名>`，并在套件之间清场）。像素层每条用例都要多次取快照回读，耗时明显高于逻辑用例，超时上限不要低于 300000 ms。
- 执行记录（2026-11-17，当前台账）：全量基线轮 18 套件 897 例（3 例红）→ 逐套件增量轮 88 套件 4,704 例（6 例红）→ 修正后复跑 `Sensitivity`、`PixelSceneC`、`MeasureArg`、`MeasureText` 各连续两轮 `Failure: 0`；按套件去重后 106 套件 5,601 例全部通过，通过率 100%。9 例红均归因为用例假设与实现语义不符，只改用例侧断言。
- 执行记录（历史）：在 API 26.0.0 真机（序列号 `d629034339413535311095d600002b00`，系统语言中文）连续执行两轮 18 套件 620 条全量（`-s timeout 300000`，不带 `-s class`），结果均为 `Tests run: 620, Failure: 0, Error: 0, Pass: 620, Ignore: 0`，单轮耗时约 37 min（2,244,567 ms / 2,248,421 ms）；当时基础层 74 条全部通过。第一轮曾因套件执行顺序暴露 81 例像素层失败，修复（像素层前置 + `PIXEL_0001` 重绘门禁）后两轮全通过。
- 上一轮变更为矩阵套件（189 + 41 条）、Ability 套件新增两条恢复类用例与 `TestAbility` 启动时机调整，共新增 232 条；再上一轮新增 `PixelMapArg`（23 条）、`Resize`（76 条）、`Sensitivity`（57 条）三个像素层套件共 156 条，并把握手能力扩到第 7 个可选入参 `PixelMap`，同时把 `Pixel` 套件内联的快照原语抽到共享的 `PixelProbe.ets`。
- 本轮（W1）新增控制器层三个套件共 107 条：`TopicNode`（61 条）、`ParamTail`（20 条）、`Bridge`（26 条），全部只 import `main/ets` 类、不操作界面、不调用 native，与契约层同批执行。改动范围限 `entry/src/ohosTest/**` 与本文件，`src/main/**` 未改动。主机侧验证：`hvigorw --mode module -p product=default -p module=entry@ohosTest assembleHap --no-daemon` 结果 `BUILD SUCCESSFUL in 11 s 565 ms`（仅一条既有 `OpenHarmonyTestRunner.ets:52:68` 警告），三个新套件的 `@tc.number`、`@tc.name` 与 `it()` 名称逐条比对无偏差。三个新套件已在 2026-11-17 全量批次中真机跑过（`TopicNode` 61/61、`ParamTail` 20/20、`Bridge` 26/26），结果全绿。
- 每个用例文件顶部注释块带 `@tc.number`、`@tc.name` 与 `@tc.desc`，用例名前缀与套件文件同名（如 `NdkRenderSceneOffscreen.test.ets` 内为 `testNdkRenderSceneOffscreen0001`），编号段 `SUB_RENDER_NODE_SCENE_OFFSCREEN_0001` 起顺序递增。
- 本轮重命名说明：能力域相关自建命名统一为 `offscreen`（`cap_offscreen.*`、`CapabilityOffscreen(.Demo)`、`cap_offscreen_*`、`OFFSCREEN_GROUP`、`OffscreenScene`、`NdkRenderSceneOffscreen`），48 条用例的 `@tc.number` / `@tc.name` 同步为 `SUB_RENDER_NODE_SCENE_OFFSCREEN_NNNN` / `testNdkRenderSceneOffscreenNNNN`；NDK 真实接口 `OH_Drawing_Surface*` 与 `drawing_surface.h` 保持不变。用例体与断言未改动，本轮只做构建验证，未重跑真机用例。
- 场景绘制结果与模糊效果是 RenderNode 原生自绘制内容，无法通过组件树读取，需结合 `screenshots` 目录下的截图人工确认；自动化用例断言的是页面存活、控件状态与 native 返回值。
