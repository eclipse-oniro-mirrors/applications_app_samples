# CanvasShowcaseDemo 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.0.0.46 / API 26，分辨率 480×853vp
- 应用：`com.samples.canvasshowcasedemo`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK API 26，`compatibleSdkVersion 26.0.0`
- 测试代码：`entry/src/ohosTest/ets/test/`，19 个套件 247 条用例，由 `List.test.ets` 聚合

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与初始场景 | 设备已安装应用 | 启动 `EntryAbility` | 画布绘制场景1（线性渐变 + 渐变描边圆环），日志输出设备 profile、场景注册表数量与绘制耗时 | 否 | Pass |
| 场景1 径向渐变光晕 | 位于首页 | 点击「场景1：径向渐变光晕」 | 画布出现内亮外透明的径向光晕，按钮变为「（当前）」展示 | 否 | Pass |
| 场景1 圆锥渐变色环 | 位于首页 | 点击「场景1：圆锥渐变色环（API 12+）」 | `createConicGradient` 生成 6 段色环铺满画布，中心叠加白色圆 | 否 | Pass |
| 场景2 图案填充 repeat | 位于首页 | 点击「场景2：图案填充 repeat」 | 棋盘格图案铺满整块画布 | 否 | Pass |
| 场景2 repeat-x 与 no-repeat | 位于首页 | 点击「场景2：repeat-x 与 no-repeat」 | 上半区斜纹横向重复，下半区棋盘格仅贴一块不重复 | 否 | Pass |
| 场景3 平移/缩放/旋转 | 位于首页 | 依次点击三个 Matrix2D 单变换按钮 | 图形分别按平移偏移、等比放大、弧度旋转绘制，日志记录各场景耗时 | 否 | Pass |
| 场景3 组合变换与逆矩阵 | 位于首页 | 点击「场景3：组合变换与逆矩阵」 | translate→rotate→scale 链式效果生效，`invert()` 逆矩阵图元回到原始位置 | 否 | Pass |
| 场景3 倾斜（属性方式） | 位于首页 | 点击「场景3：Matrix2D 倾斜（属性方式）」 | 图形沿 X 方向倾斜，非 `setTransform` 链式写法 | 否 | Pass |
| 场景4 离屏合成 | 位于首页 | 点击「场景4：离屏合成（三特性串联）」 | 离屏画布绘制图案 → `transferToImageBitmap` → 主画布矩阵变换贴图，三特性串联渲染正常 | 否 | Pass |
| 扩展 ImageData 像素操作 | 位于首页 | 点击「扩展：ImageData 像素操作」 | 逐像素写入的渐变通过 `putImageData` 显示在画布上 | 否 | Pass |
| 扩展 GeometryUtil 圆环阵 | 位于首页 | 点击「扩展：GeometryUtil 圆环阵」 | 三圈极坐标圆点按角度均匀排布 | 否 | Pass |
| 扩展 路径绘制 | 位于首页 | 点击「扩展：贝塞尔与二次曲线路径」 | 顶部 `bezierCurveTo` 波浪线、左侧 `quadraticCurveTo` 心形、右侧 `arcTo` 圆角矩形 | 否 | Pass |
| 扩展 clip 与合成模式 | 位于首页 | 点击「扩展：clip 裁剪与合成模式」 | 圆形 / 矩形裁剪区分别显示渐变与条纹；三组双圆呈现 source-over / multiply / screen 叠加 | 否 | Pass |
| 扩展 文字绘制 | 位于首页 | 点击「扩展：文字绘制与 measureText」 | `fillText`、`strokeText` 与渐变填充文字正常显示，日志打印 `measureText` 宽度 | 否 | Pass |
| 扩展 虚线描边 | 位于首页 | 点击「扩展：虚线描边与线帽拐角」 | 虚线随 `lineDashOffset` 相位移动，三组 `lineCap` 与三组 `lineJoin` 对比明显 | 否 | Pass |
| 扩展 ImageData 回读反相 | 位于首页 | 点击「扩展：ImageData 回读反相」 | 中心区域经 `getImageData` 读取并反相后写回，日志打印反相前后 RGB | 否 | Pass |
| 补充 图案矩阵变换 | 位于首页 | 点击「补充：图案矩阵变换（Pattern×Matrix2D）」 | 三个区域分别呈现旋转、缩放、平移后的图案 | 否 | Pass |
| 补充 drawImage 源矩形裁剪 | 位于首页 | 点击「补充：drawImage 源矩形裁剪」 | 离屏图按 9 参数四分块贴在画布四角 | 否 | Pass |
| 补充 阴影与渐变叠加 | 位于首页 | 点击「补充：阴影 + 渐变」 | 左组开启 `shadowBlur` 有投影、右组无阴影，两组对比明显 | 否 | Pass |
| 补充 filter 滤镜模糊 | 位于首页 | 点击「补充：filter 滤镜模糊对比」 | 一侧清晰、一侧 `blur(4px)` 模糊 | 否 | Pass |
| 补充 ColorMetrics 渐变断点 | 位于首页 | 点击「补充：ColorMetrics 渐变断点（API 12+）」 | `addColorStop` 的 ColorMetrics 重载生效，多断点渐变正常渲染 | 否 | Pass |
| 渐变动画启动与停止 | 位于首页 | 点击「动画：渐变过渡」，再次点击「停止渐变动画」 | 每 100ms 重绘一帧，标题切换为动画说明；停止后定时器清除，日志记录启动/停止 | 否 | Pass |
| 当前场景高亮切换 | 位于首页 | 连续点击不同场景按钮 | 仅当前场景按钮为深色并带「（当前）」，切换后旧按钮恢复浅色 | 否 | Pass |
| 清空二次确认 | 位于首页，画布与日志非空 | 点击「清空画布与日志」，分别选「取消」「清空」 | 取消时内容保留；确认后画布清空、日志清空、标题变为「（已清空，点击按钮开始演示）」 | 否 | Pass |
| 日志面板容量与置顶 | 位于首页 | 连续执行多个场景 | 最新日志置顶，最多保留 120 条，超出后丢弃最旧记录 | 否 | Pass |
| 断点自适应布局 | 设备已启动 | 观察 480×853vp 竖屏与 ≥600vp 窗口 | `sm` 单栏上下布局，`md/lg` 双栏（左按钮右日志） | 否 | Pass |
| 离屏上下文与场景绘制 | 设备侧测试环境 | 用 `OffscreenCanvas` 无头执行全部 23 个场景函数 | 23 条用例全部通过；无异常抛出，`transferToImageBitmap` 输出尺寸与画布一致，`createPattern` null 入参不崩溃 | 是 | Pass |
| 场景注册表完整性 | 设备侧测试环境 | 遍历 `SceneRegistry` | id 唯一、按钮/标题/绘制函数齐全、`getById` 命中与未命中正确、注册表覆盖全部场景实现、全场景冒烟绘制通过 | 是 | Pass |
| Matrix2D 变换与逆矩阵 | 设备侧测试环境 | 构造平移/缩放/旋转/链式/属性倾斜 | `identity()` 为单位矩阵，变换属性符合预期，链式顺序正确，`invert()` 可还原，12 条用例通过 | 是 | Pass |
| PixelMapUtil 图案素材 | 设备侧测试环境 | 生成棋盘格/斜纹/圆点/渐变并读回像素 | 尺寸正确，像素颜色与 RGBA 打包符合预期，8 条用例通过 | 是 | Pass |
| ColorUtil 颜色工具 | 设备侧测试环境 | 调用 hex 解析、rgba 打包、插值、多段色带、渐变预设 | 越界插值被钳制、非法 hex 返回 null、预设色带断点合法，15 条用例通过 | 是 | Pass |
| GeometryUtil 几何工具 | 设备侧测试环境 | 调用角度弧度转换、圆周点、矩形包含、clamp、距离 | 四象限取值正确，角度与弧度重载结果一致，6 条用例通过 | 是 | Pass |
| PerfTimer 计时统计 | 设备侧测试环境 | 同步代码块计时、多次采样与统计 | 返回值透传，均值/极值/样本数正确，空统计返回 0，7 条用例通过 | 是 | Pass |
| LogUtil 日志双通道 | 设备侧测试环境 | 注入 sink 后按级别输出日志 | 日志行带时间戳并送达 sink，级别过滤与标记映射正确，6 条用例通过 | 是 | Pass |
| DeviceUtil 设备与断点 | 设备侧测试环境 | 读取设备形态与断点 | 形态非空且类型互斥，断点边界正确，profile 字段完整，6 条用例通过 | 是 | Pass |
| ColorUtil 组合 | 设备侧测试环境 | rgba 位掩码/无符号、parseHex 空白与大小写/长度/非法字符、toHex 补零与越界、alpha 取整、四段色带、四组预设精确色带 | 34 条用例通过，断言与 API 语义一致 | 是 | Pass |
| GeometryUtil 组合 | 设备侧测试环境 | 已知角与负角、九角往返、圆周点偏移/零半径/负半径、角度版逐角一致、矩形四边/零尺寸/负坐标、clamp 退化区间、距离对称与大数值 | 26 条用例通过 | 是 | Pass |
| LogUtil 组合 | 设备侧测试环境 | init 不带级别保持原门限、setMinLevel 上/下调、INFO/ERROR 门限、固定时间格式化、四级别整行、二次 init 替换 sink、标签含空格/中文 | 16 条用例通过 | 是 | Pass |
| PerfTimer 组合 | 设备侧测试环境 | boolean/null/数组透传、fn 恰好一次、异常传播、计数累加、min≤avg≤max、avg 两位小数、reset 重启、空报告精确格式、多实例隔离 | 16 条用例通过 | 是 | Pass |
| PixelMapUtil 组合 | 设备侧测试环境 | 棋盘格分块/奇偶/alpha、斜纹对角等值与周期、圆点半径边界/零半径/覆盖全图、generate 行主序坐标、create 非正方形与行主序映射 | 19 条用例通过，含 `readPixelsToBufferSync` 像素回读 | 是 | Pass |
| SceneRegistry 组合 | 设备侧测试环境 | id 连续与正整数、首末场景映射、补充场景按钮≠标题、按钮/标题唯一、getById 边界与引用一致、逐场景独立画布绘制、分组前缀 | 17 条用例通过 | 是 | Pass |
| DeviceUtil 组合 | 设备侧测试环境 | 0/320/599.9/600.1/839.9/840.1/1280 断点、断点单调性、preferTwoColumn 三档与断点一致、宽屏=平板∨2in1、设备类型标志一致 | 17 条用例通过 | 是 | Pass |
| Canvas 场景组合 | 设备侧测试环境 | 6 个扩展场景在极小/超宽/超窄画布执行、重复执行、虚线数组复位、measureText 可用、裁剪区像素、回读中心不透明 | 8 条用例通过，尺寸与像素断言符合预期 | 是 | Pass |
| Index 页面 UI 自动化 | 应用可正常启动 | UiTest 点击场景按钮、清空弹框 | 场景1 高亮、切换后高亮转移、清空弹框取消与确认两条路径均符合预期，3 条用例通过 | 是 | Pass |
| Ability 冒烟 | 设备侧测试环境 | 执行 `assertContain` | 1 条用例通过 | 是 | Pass |

## 测试设计

设备侧用例按覆盖类型分组，避免重复覆盖：

1. **主路径与冒烟（11 个套件，94 条）**：每个工具类/场景的主路径与冒烟，已在 RK3568 真机执行通过；
2. **组合展开（8 个套件，153 条）**：按输入维度展开边界组合，每条用例均为显式 `it` 并带完整 `@tc` 注释，可直接单条定位；
3. **UI 自动化（1 个套件，3 条）**：通过 `@kit.TestKit` 驱动真实页面，覆盖高亮切换与清空二次确认。

| 组合套件 | 维度 | 用例数 |
| --- | --- | --- |
| ColorUtilMatrix | rgba 位掩码/无符号；parseHex 空白、大小写、长度、非法字符；toHex 补零/越界；toRgbaString alpha 取整/截断；lerp 方向/同色；lerpHexStops 空/单色/非法/四段/越界/alpha；clamp 退化；四组预设精确色带与明度方向 | 34 |
| GeometryUtilMatrix | 角度弧度已知值/负角/九角往返；圆周点偏移/零半径/负半径/整圈+四分之一/半径不变式；角度版负角/逐角一致；矩形四边/零尺寸/负坐标/外侧/近角；clamp 负区间/退化；距离水平垂直/负坐标/对称/对角/大数值 | 26 |
| LogUtilMatrix | init 不带 minLevel 保持原级别；setMinLevel 上/下调；INFO/ERROR 门限；枚举数值序；固定日期格式化；时间戳模式；四级别整行；二次 init 替换 sink；标签空格/中文；各标记行 | 16 |
| PerfTimerMatrix | boolean/null/数组透传；fn 恰好一次；异常传播；耗时非负；计数累加；min≤avg≤max；avg 两位小数；reset 重启/清空统计；空报告精确格式；多实例隔离；report 不清样本；start 重置起点 | 16 |
| PixelMapUtilMatrix | 棋盘格 cell 分块/奇数尺寸奇偶/alpha/1x1；斜纹对角等值/period=2/自定义色；圆点半径边界/零半径/覆盖全图/偶数尺寸中心；generate 行主序/像素回读；rgba 高位掩码；create 非正方形/行主序/RGBA_8888/alpha 往返 | 19 |
| SceneRegistryMatrix | id 连续/正整数；首末映射；补充场景按钮≠标题；按钮/标题唯一；getById 0/小数/引用一致；getAll 稳定；draw 可调用；逐场景独立画布；文案无首尾空白；前 12 标题=按钮；分组前缀；逐 id 引用 | 17 |
| DeviceUtilMatrix | 0/320/599.9/600.1/839.9/840.1/1280 断点；单调性；preferTwoColumn 三档与断点一致；宽屏=平板∨2in1；设备类型与标志一致；marketName 类型；SDK 整数；档案日志不抛异常 | 17 |
| CanvasScenesMatrix | 扩展场景在 40×20 / 640×180 / 120×480 画布执行；同上下文重复 3 轮；虚线数组复位；measureText 可用；clip 内外像素 alpha；回读中心不透明（3 种尺寸） | 8 |

断言来源：颜色打包/RGBA 字节序、断点阈值 600/840vp、预设色带取值、画布尺寸与像素坐标均取自公开 API 语义与需求约定；不对被测类做镜像实现，也不使用 `forEach` 批量生成用例（每条均带独立 `@tc` 注释）。

## 执行方式

设备侧测试（需先安装应用；签名使用 SDK 自带的 OpenHarmony 默认调试签名，仓库内不保存任何证书或口令）：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.canvasshowcasedemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

本仓库不保存签名材料；未配置签名时构建产物为 `entry-ohosTest-unsigned.hap`，需在 DevEco Studio 中启用自动签名后再安装到真机。

日志查看：

```bash
hdc shell hilog | grep CanvasShowcase
```

## 验证结果

247 条设备侧用例已在 RK3568 真机全量执行通过：`Tests run: 247, Failure: 0, Error: 0, Pass: 247`（19 个套件）。其中 94 条主路径与冒烟用例（11 个套件：CanvasScenes 23、ColorUtil 15、Matrix2D 12、PixelMapUtil 8、PerfTimer 7、SceneRegistry 7、DeviceUtil 6、GeometryUtil 6、LogUtil 6、IndexUi 3、Ability 1），153 条组合与边界用例（8 个套件）。

## 补充说明

- `IndexUi.test.ets` 的滑动坐标按 480×853vp 标定（`SWIPE_TOP_Y=650`、`SWIPE_BOTTOM_Y=950`），在其它分辨率的设备上运行需调整该常量，否则可能找不到列表底部的按钮。
- `entry/src/test/` 目前只有模板自带的 1 条本地用例，工程的功能验证以 `entry/src/ohosTest` 下的 247 条设备侧用例为准。
- 设备侧用例为无头绘制验证，只断言"不抛异常/输出尺寸与像素值正确"，不校验最终视觉效果；视觉效果由上表中标为「否」的手工用例覆盖。
- `@tc.number` 前缀按套件区分（如 `SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_*` 与 `SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_*`），编号全局唯一。
