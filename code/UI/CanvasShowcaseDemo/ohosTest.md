# CanvasShowcaseDemo 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.0.0.46 / API 26，分辨率 480×853vp
- 应用：`com.example.canvasshowcasedemo`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK API 26，`compatibleSdkVersion 6.1.1(24)`
- 测试代码：`entry/src/ohosTest/ets/test/`，11 个套件 88 条用例，由 `List.test.ets` 聚合

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与初始场景 | 设备已安装应用 | 启动 `EntryAbility` | 画布绘制场景1（线性渐变 + 渐变描边圆环），日志输出设备 profile、场景注册表数量与绘制耗时 | 否 | Pass |
| 场景1 径向渐变光晕 | 位于首页 | 点击「场景1：径向渐变光晕」 | 画布出现内亮外透明的径向光晕，按钮变为「（当前）」展示 | 否 | Pass |
| 场景2 图案填充 repeat | 位于首页 | 点击「场景2：图案填充 repeat」 | 棋盘格图案铺满整块画布 | 否 | Pass |
| 场景2 repeat-x 与 no-repeat | 位于首页 | 点击「场景2：repeat-x 与 no-repeat」 | 上半区斜纹横向重复，下半区棋盘格仅贴一块不重复 | 否 | Pass |
| 场景3 平移/缩放/旋转 | 位于首页 | 依次点击三个 Matrix2D 单变换按钮 | 图形分别按平移偏移、等比放大、弧度旋转绘制，日志记录各场景耗时 | 否 | Pass |
| 场景3 组合变换与逆矩阵 | 位于首页 | 点击「场景3：组合变换与逆矩阵」 | translate→rotate→scale 链式效果生效，`invert()` 逆矩阵图元回到原始位置 | 否 | Pass |
| 场景3 倾斜（属性方式） | 位于首页 | 点击「场景3：Matrix2D 倾斜（属性方式）」 | 图形沿 X 方向倾斜，非 `setTransform` 链式写法 | 否 | Pass |
| 场景4 离屏合成 | 位于首页 | 点击「场景4：离屏合成（三特性串联）」 | 离屏画布绘制图案 → `transferToImageBitmap` → 主画布矩阵变换贴图，三特性串联渲染正常 | 否 | Pass |
| 扩展 ImageData 像素操作 | 位于首页 | 点击「扩展：ImageData 像素操作」 | 逐像素写入的渐变通过 `putImageData` 显示在画布上 | 否 | Pass |
| 扩展 GeometryUtil 圆环阵 | 位于首页 | 点击「扩展：GeometryUtil 圆环阵」 | 三圈极坐标圆点按角度均匀排布 | 否 | Pass |
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
| 离屏上下文与场景绘制 | 设备侧测试环境 | 用 `OffscreenCanvas` 无头执行全部 17 个场景函数 | 17 条用例全部通过；无异常抛出，`transferToImageBitmap` 输出尺寸与画布一致，`createPattern` null 入参不崩溃 | 是 | Pass |
| 场景注册表完整性 | 设备侧测试环境 | 遍历 `SceneRegistry` | id 唯一、按钮/标题/绘制函数齐全、`getById` 命中与未命中正确、注册表覆盖全部场景实现、全场景冒烟绘制通过 | 是 | Pass |
| Matrix2D 变换与逆矩阵 | 设备侧测试环境 | 构造平移/缩放/旋转/链式/属性倾斜 | `identity()` 为单位矩阵，变换属性符合预期，链式顺序正确，`invert()` 可还原，12 条用例通过 | 是 | Pass |
| PixelMapUtil 图案素材 | 设备侧测试环境 | 生成棋盘格/斜纹/圆点/渐变并读回像素 | 尺寸正确，像素颜色与 RGBA 打包符合预期，8 条用例通过 | 是 | Pass |
| ColorUtil 颜色工具 | 设备侧测试环境 | 调用 hex 解析、rgba 打包、插值、多段色带、渐变预设 | 越界插值被钳制、非法 hex 返回 null、预设色带断点合法，15 条用例通过 | 是 | Pass |
| GeometryUtil 几何工具 | 设备侧测试环境 | 调用角度弧度转换、圆周点、矩形包含、clamp、距离 | 四象限取值正确，角度与弧度重载结果一致，6 条用例通过 | 是 | Pass |
| PerfTimer 计时统计 | 设备侧测试环境 | 同步代码块计时、多次采样与统计 | 返回值透传，均值/极值/样本数正确，空统计返回 0，7 条用例通过 | 是 | Pass |
| LogUtil 日志双通道 | 设备侧测试环境 | 注入 sink 后按级别输出日志 | 日志行带时间戳并送达 sink，级别过滤与标记映射正确，6 条用例通过 | 是 | Pass |
| DeviceUtil 设备与断点 | 设备侧测试环境 | 读取设备形态与断点 | 形态非空且类型互斥，断点边界正确，profile 字段完整，6 条用例通过 | 是 | Pass |
| Index 页面 UI 自动化 | 应用可正常启动 | UiTest 点击场景按钮、清空弹框 | 场景1 高亮、切换后高亮转移、清空弹框取消与确认两条路径均符合预期，3 条用例通过 | 是 | Pass |
| Ability 冒烟 | 设备侧测试环境 | 执行 `assertContain` | 1 条用例通过 | 是 | Pass |

## 执行方式

设备侧测试（需先安装应用，签名由 DevEco Studio 自动签名或本机脚本提供）：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.example.canvasshowcasedemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

日志查看：

```bash
hdc shell hilog | grep CanvasShowcase
```

## 验证结果

`Tests run: 88, Failure: 0, Error: 0, Pass: 88`（11 个套件：CanvasScenes 17、ColorUtil 15、Matrix2D 12、PixelMapUtil 8、PerfTimer 7、SceneRegistry 7、DeviceUtil 6、GeometryUtil 6、LogUtil 6、IndexUi 3、Ability 1）。

## 补充说明

- `IndexUi.test.ets` 的滑动坐标按 480×853vp 标定（`SWIPE_TOP_Y=650`、`SWIPE_BOTTOM_Y=950`），在其他分辨率的设备上运行需调整该常量，否则可能找不到列表底部的按钮。
- `entry/src/test/` 目前只有模板自带的 1 条本地用例，工程的功能验证以 `entry/src/ohosTest` 下的 88 条设备侧用例为准。
- 设备侧用例为无头绘制验证，只断言"不抛异常/输出尺寸与像素值正确"，不校验最终视觉效果；视觉效果由上表中标为「否」的手工用例覆盖。
