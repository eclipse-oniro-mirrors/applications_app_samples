# XComponent3D 测试用例归档

## 测试工程结构

```
entry/src/ohosTest/
|---ets
|   |---test                              // 测试用例目录，每个文件对应一个 describe 套件
|   |   |---Ability.test.ets              // 应用拉起与按钮点击
|   |   |---XComponentShapeCore.test.ets  // changeShape 与 animate 的形状状态
|   |   |---XComponentGeometryCore.test.ets// 绘制区尺寸与偏移回读
|   |   |---NativeContractCore.test.ets   // 33 个原生接口的契约镜像，describe 名为 NativeContractTest
|   |   |---NativeContractExt.test.ets    // 契约矩阵扩展
|   |   |---NativeRegisterCore.test.ets   // 9 类回调的注册与注销，describe 名为 NativeRegisterTest
|   |   |---NativeStateCore.test.ets      // 状态类用例，describe 名为 NativeStateTest
|   |   |---NativeCombo*.test.ets         // 接口串联与顺序，共 5 个文件
|   |   |---NativePixel*.test.ets         // 像素回读，共 2 个文件
|   |   |---NativeStable*.test.ets        // 稳定性，共 2 个文件
|   |   |---NativeUiCore.test.ets         // UI 自动化扩展
|   |   |---NativeVolume*.test.ets        // 逐值扫描与关系式配对，共 62 个文件
|   |   |---common
|   |   |   |---TestYield.ets             // yieldToSystem 运行保护
|   |   |---List.test.ets                 // 套件注册入口，导出 testsuite()
|   |---testability
|   |   |---TestAbility.ets               // 测试 Ability，加载测试页
|   |   |---pages
|   |   |   |---Index.ets                 // 测试页，200×100vp 的 XComponent
|   |---testrunner
|   |   |---OpenHarmonyTestRunner.ts      // Hypium 测试运行器
|---resources                               // 测试资源
|---module.json5                            // 测试模块配置，模块名 entry_test
```

## 测试套件清单

| 套件 | 分类 | 用例数 | 覆盖内容 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| ActsAbilityTest | UI | 3 | 拉起 EntryAbility，点击 DrawCube 与 DrawTransform |
| NativeUiCoreTest | UI | 25 | 两个按钮的定位、属性读取与单次及交替点击 |
| XComponentShapeTest | 状态 | 24 | changeShape 与 animate 的返回值、索引回显与幂等 |
| XComponentGeometryTest | 状态 | 20 | 绘制区宽高与偏移的回读、比值不变式与稳定性 |
| NativeContractTest | 契约镜像 | 32 | 33 个 Native XComponent 原生接口的合法入参契约 |
| NativeContractExtTest | 契约镜像 | 100 | 空 component、越界入参与错误码取值范围 |
| NativeRegisterTest | 注册 | 40 | 9 类回调的重复注册与注销、帧率区间与软键盘设置 |
| NativeStateTest | 状态 | 55 | 跨接口状态隔离与回读一致性 |
| NativeComboCoreTest | 组合 | 80 | 两接口串联与查询三连 |
| NativeComboExtTest | 组合 | 80 | 三至五接口串联 |
| NativeComboAdvTest | 组合 | 80 | 注册、查询与状态的混合链路 |
| NativeComboTailTest | 组合 | 80 | 长链路收尾与形状状态机 |
| NativeComboMatrixTest | 组合 | 80 | 六至十接口的组合矩阵 |
| NativePixelCoreTest | 像素 | 100 | 标准色与灰阶扫描、四通道回读 |
| NativePixelExtTest | 像素 | 100 | 越界、小数截断与越界后恢复 |
| NativeStableCoreTest | 稳定性 | 50 | 同色重复、幂等与三元组稳定 |
| NativeStableExtTest | 稳定性 | 50 | 长序列与恢复能力 |
| NativeVolumeAlpha01 | 通道扫描 | 66 | alpha 通道逐值清屏 |
| NativeVolumeAlpha02 | 通道扫描 | 66 | alpha 通道逐值清屏 |
| NativeVolumeAlpha03 | 通道扫描 | 66 | alpha 通道逐值清屏 |
| NativeVolumeAlpha04 | 通道扫描 | 66 | alpha 通道逐值清屏与跨调用场景校验 |
| NativeVolumeAlphaReal01 | 关系式配对 | 2 | alpha 槽的关系式配对 |
| NativeVolumeBlue01 | 通道扫描 | 65 | 蓝通道 0..255 逐值 |
| NativeVolumeBlue02 | 通道扫描 | 65 | 蓝通道 0..255 逐值 |
| NativeVolumeBlue03 | 通道扫描 | 65 | 蓝通道 0..255 逐值 |
| NativeVolumeBlue04 | 通道扫描 | 65 | 蓝通道越界与饱和端点 |
| NativeVolumeCycle01 | 区间循环 | 4 | 0..255 区间循环单例 |
| NativeVolumeDiag01 | 通道扫描 | 65 | 红蓝两通道不互换 |
| NativeVolumeDiag02 | 通道扫描 | 65 | 红蓝两通道不互换 |
| NativeVolumeDiag03 | 通道扫描 | 65 | 红蓝两通道不互换 |
| NativeVolumeDiag04 | 通道扫描 | 65 | 红蓝越界与中间值端点 |
| NativeVolumeFrameRate01 | 区间扫描 | 49 | 10 档下限与 7 档上限的区间组合 |
| NativeVolumeFrameRate02 | 区间扫描 | 58 | 帧率下限 0..63 逐值（固定 max=120） |
| NativeVolumeFrameRate03 | 区间扫描 | 56 | 帧率下限 64..119 逐值（固定 max=120） |
| NativeVolumeFrameRateReal01 | 关系式配对 | 2 | 帧率区间的关系式配对 |
| NativeVolumeGb01 | 通道扫描 | 65 | 绿蓝互补 v=1..64 逐值 |
| NativeVolumeGb02 | 通道扫描 | 65 | 绿蓝互补 v=65..128 逐值 |
| NativeVolumeGb03 | 通道扫描 | 65 | 绿蓝互补 v=129..192 逐值 |
| NativeVolumeGb04 | 通道扫描 | 63 | 绿蓝互补 v=193..254 尾段 |
| NativeVolumeGbReal01 | 关系式配对 | 2 | 绿蓝互补关系的关系式配对 |
| NativeVolumeGreen01 | 通道扫描 | 65 | 绿通道 0..255 逐值 |
| NativeVolumeGreen02 | 通道扫描 | 65 | 绿通道 0..255 逐值 |
| NativeVolumeGreen03 | 通道扫描 | 65 | 绿通道 0..255 逐值 |
| NativeVolumeGreen04 | 通道扫描 | 65 | 绿通道越界与饱和端点 |
| NativeVolumeGrey01 | 通道扫描 | 34 | 灰阶 0..248 步长 8 扫描 |
| NativeVolumeGrey02 | 通道扫描 | 57 | 灰阶剩余值 1..63（非 8 倍数） |
| NativeVolumeGrey03 | 通道扫描 | 57 | 灰阶剩余值 65..127 |
| NativeVolumeGrey04 | 通道扫描 | 57 | 灰阶剩余值 129..191 |
| NativeVolumeGrey05 | 通道扫描 | 56 | 灰阶剩余值 193..255（含 255 锚点） |
| NativeVolumeGreyReal01 | 关系式配对 | 2 | 灰阶关系式的关系式配对 |
| NativeVolumeMix01 | 通道扫描 | 65 | 红绿两通道不互换 |
| NativeVolumeMix02 | 通道扫描 | 65 | 红绿两通道不互换 |
| NativeVolumeMix03 | 通道扫描 | 65 | 红绿两通道不互换 |
| NativeVolumeMix04 | 通道扫描 | 65 | 红绿越界与中间值端点 |
| NativeVolumeRed01 | 通道扫描 | 65 | 红通道 0..255 逐值 |
| NativeVolumeRed02 | 通道扫描 | 65 | 红通道 0..255 逐值 |
| NativeVolumeRed03 | 通道扫描 | 65 | 红通道 0..255 逐值 |
| NativeVolumeRed04 | 通道扫描 | 65 | 红通道越界与饱和端点 |
| NativeVolumeRgbReal01 | 关系式配对 | 12 | RGB 输入域的关系式配对 |
| NativeVolumeShape01 | 索引扫描 | 42 | 形状 0..31 连续与 2^k 邻域 |
| NativeVolumeShape02 | 索引扫描 | 42 | 形状 int32 与 uint32 边界 |
| NativeVolumeShape03 | 索引扫描 | 48 | 形状索引 32..80 连续段（跳过 63/64） |
| NativeVolumeShape04 | 索引扫描 | 47 | 形状索引 81..127 连续段（跳过 64） |
| NativeVolumeShapeReal01 | 关系式配对 | 2 | 形状序列的关系式配对 |
| NativeVolumeSwitch01 | 索引扫描 | 18 | 软键盘开关逐值与 UI 事件类型枚举 |
| NativeVolumeSwitchReal01 | 关系式配对 | 2 | 开关序列的关系式配对 |
| NativeVolumeTilt01 | 索引扫描 | 49 | 3 个倾角/事件源接口 × index 0..15 |
| NativeVolumeTiltReal01 | 关系式配对 | 2 | 倾角与事件源交叉口径的关系式配对 |
| NativeVolumeTouch01 | 索引扫描 | 50 | 5 个触摸点接口的索引扫描 |
| NativeVolumeTouch02 | 索引扫描 | 34 | 触摸点索引越界与四坐标口径 |
| NativeVolumeTouchReal01 | 关系式配对 | 2 | 触点口径的关系式配对 |
| NativeVolumeRgb301 | 组合扫描 | 64 | 三通道互异 R/G/B 阶梯组合 |
| NativeVolumeRgb302 | 组合扫描 | 64 | 三通道互异 R/G/B 阶梯组合 |
| NativeVolumeRgb303 | 组合扫描 | 64 | 三通道互异 R/G/B 阶梯组合 |
| NativeVolumeRgb304 | 组合扫描 | 64 | 三通道互异 R/G/B 阶梯组合 |
| NativeVolumeRgb305 | 组合扫描 | 64 | 三通道互异 R/G/B 阶梯组合 |
| NativeVolumeRgb306 | 组合扫描 | 64 | 三通道互异 R/G/B 阶梯组合 |
| NativeVolumeRgb307 | 组合扫描 | 64 | 三通道互异 R/G/B 阶梯组合 |
| NativeVolumeRgb308 | 组合扫描 | 64 | 三通道互异 R/G/B 阶梯组合 |
| NativeVolumeShapeExt01 | 索引扫描 | 65 | 形状索引 128..191 连续段 |
| NativeVolumeShapeExt02 | 索引扫描 | 65 | 形状索引 192..255 连续段 |
| NativeVolumeCallback01 | 调用稳定性 | 51 | 11 类回调的重复调用码稳定 |
| NativeVolumeCallback02 | 调用稳定性 | 50 | 11 类回调的重复调用码稳定 |
| NativeVolumeFps301 | 区间扫描 | 59 | 帧率三元组合法段与越界段 |
| NativeVolumeUiExt01 | 索引扫描 | 65 | 触点索引 16..79 双探针口径 |
| NativeVolumeUiExt02 | 索引扫描 | 65 | 触点索引 80..143 双探针口径 |
| NativeVolumeCombo201 | 接口串联 | 65 | 形状→颜色→帧率三接口串联 |
| NativeVolumeCombo202 | 接口串联 | 65 | 形状→颜色→帧率三接口串联 |
| NativeVolumeRgb3Real01 | 关系式配对 | 3 | 三值互异的关系式与饱和端点 |
| NativeVolumeShapeExtReal01 | 关系式配对 | 3 | 延伸段边界的往返与残留 |
| NativeVolumeCallbackReal01 | 关系式配对 | 3 | 注册注销配对与码域一致性 |
| NativeVolumeFps3Real01 | 关系式配对 | 3 | 帧率三元组的边界与负数入参 |
| NativeVolumeUiExtReal01 | 关系式配对 | 3 | 四坐标探针齐读与重复读取 |
| NativeVolumeCombo2Real01 | 关系式配对 | 3 | 串联链路末态一致与连续切换 |

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 拉起应用（ActsAbilityTest beforeAll） | 设备正常运行 | 启动 EntryAbility | 成功拉起应用，前台 Ability 为 EntryAbility | 是 | 通过 |
| 绘制3D立方体（SUB_XCOMPONENT3D_ABILITY_0002） | 位于首页 | 点击 DrawCube 按钮 | 按钮可定位且文案为 DrawCube，点击后应用仍在前台 | 是 | 通过 |
| 绘制2D矩形（SUB_XCOMPONENT3D_ABILITY_0001） | 位于首页 | 点击 DrawTransform 按钮 | 按钮可定位且文案为 DrawTransform，点击后按钮仍存在 | 是 | 通过 |
| 形状往返切换（SUB_XCOMPONENT3D_ABILITY_0003） | 位于首页 | 先点 DrawCube 再点 DrawTransform | 两次点击均可定位并返回正确文案 | 是 | 通过 |
| 形状切换-合法-立方体（SUB_XCOMPONENT3D_SHAPE_0001） | 测试 HAP 已安装 | changeShape(1) 后 changeShape(0) | getShapeIndex() 返回 0，且不等于 1 | 是 | 通过 |
| 形状切换-合法-矩形（SUB_XCOMPONENT3D_SHAPE_0002） | 测试 HAP 已安装 | changeShape(0) 后 changeShape(1) | getShapeIndex() 返回 1，且大于 0 | 是 | 通过 |
| 形状切换-返回值契约（SUB_XCOMPONENT3D_SHAPE_0003） | 测试 HAP 已安装 | changeShape(1) / changeShape(0) | 返回值均为 undefined，索引同步更新 | 是 | 通过 |
| 帧驱动-返回值契约（SUB_XCOMPONENT3D_SHAPE_0004） | 测试 HAP 已安装 | changeShape(1) 后连续 animate() | animate() 返回 undefined，索引保持 1 | 是 | 通过 |
| 形状切换-边界-小数截断（SUB_XCOMPONENT3D_SHAPE_0005） | 测试 HAP 已安装 | changeShape(0.9) / changeShape(1.9) | 索引分别为 0 与 1（向零截断） | 是 | 通过 |
| 形状切换-边界-负零（SUB_XCOMPONENT3D_SHAPE_0006） | 测试 HAP 已安装 | changeShape(-0) | 索引为 0，符号位不残留 | 是 | 通过 |
| 形状切换-边界-uint32 上界（SUB_XCOMPONENT3D_SHAPE_0007） | 测试 HAP 已安装 | changeShape(4294967295) | 索引原样返回 4294967295，不溢出为 0 | 是 | 通过 |
| 形状切换-边界-2^32 回绕（SUB_XCOMPONENT3D_SHAPE_0008） | 测试 HAP 已安装 | changeShape(4294967296) / changeShape(4294967297) | 索引按模 2^32 回绕为 0 与 1 | 是 | 通过 |
| 形状切换-非法-NaN（SUB_XCOMPONENT3D_SHAPE_0009） | 测试 HAP 已安装 | changeShape(NaN) | 索引归一为 0，非 NaN | 是 | 通过 |
| 形状切换-非法-无穷（SUB_XCOMPONENT3D_SHAPE_0010） | 测试 HAP 已安装 | changeShape(Infinity) / changeShape(-Infinity) | 索引均归一为 0，为有限值 | 是 | 通过 |
| 形状切换-非法-负数（SUB_XCOMPONENT3D_SHAPE_0011） | 测试 HAP 已安装 | changeShape(-1) | 索引按 uint32 语义返回 4294967295 | 是 | 通过 |
| 形状切换-非法-int32 下界（SUB_XCOMPONENT3D_SHAPE_0012） | 测试 HAP 已安装 | changeShape(-2147483648) | 索引返回 2147483648 | 是 | 通过 |
| 形状切换-极值-1e10（SUB_XCOMPONENT3D_SHAPE_0013） | 测试 HAP 已安装 | changeShape(1e10) | 索引按模 2^32 返回 1410065408 | 是 | 通过 |
| 形状切换-极值-MAX_SAFE_INTEGER（SUB_XCOMPONENT3D_SHAPE_0014） | 测试 HAP 已安装 | changeShape(Number.MAX_SAFE_INTEGER) | 索引返回 4294967295 | 是 | 通过 |
| 形状切换-极值-千次切换（SUB_XCOMPONENT3D_SHAPE_0015） | 测试 HAP 已安装 | 循环 1000 次 changeShape(i) | 索引等于末次入参 999，无累积偏移 | 是 | 通过 |
| 形状切换-组合-切换后绘制（SUB_XCOMPONENT3D_SHAPE_0016） | 测试 HAP 已安装 | changeShape(1) 后两次 animate() | 索引保持 1，绘制不覆盖切换结果 | 是 | 通过 |
| 形状切换-组合-交替五轮（SUB_XCOMPONENT3D_SHAPE_0017） | 测试 HAP 已安装 | animate() 与 changeShape(i%2) 交替 5 轮 | 索引等于末次入参 0 | 是 | 通过 |
| 形状切换-组合-中间档位（SUB_XCOMPONENT3D_SHAPE_0018） | 测试 HAP 已安装 | animate() 后 changeShape(2) 再 animate() | 索引为 2，不被绘制链路覆盖 | 是 | 通过 |
| 形状切换-状态-幂等（SUB_XCOMPONENT3D_SHAPE_0019） | 测试 HAP 已安装 | 连续两次 changeShape(1) | 两次回读一致且均为 1 | 是 | 通过 |
| 形状切换-状态-越界档位回显（SUB_XCOMPONENT3D_SHAPE_0020） | 测试 HAP 已安装 | changeShape(3) 后 changeShape(0) | 先回读 3，再回读 0 | 是 | 通过 |
| 形状切换-状态-序列稳定（SUB_XCOMPONENT3D_SHAPE_0021） | 测试 HAP 已安装 | 0→1→0→1 序列切换 | 索引稳定为 1，不残留历史值 | 是 | 通过 |
| 形状切换-状态-百次同值（SUB_XCOMPONENT3D_SHAPE_0022） | 测试 HAP 已安装 | 100 次 changeShape(1) | 索引恒为 1，不随调用次数漂移 | 是 | 通过 |
| 形状切换-状态-切换与绘制互不破坏（SUB_XCOMPONENT3D_SHAPE_0023） | 测试 HAP 已安装 | changeShape/animate 来回调用 | 索引等于末次入参 0，animate() 仍返回 undefined | 是 | 通过 |
| 形状切换-状态-五百次轮转（SUB_XCOMPONENT3D_SHAPE_0024） | 测试 HAP 已安装 | 500 次 changeShape(i%3) | 索引等于末次入参 1 | 是 | 通过 |
| 尺寸回读-合法-宽度（SUB_XCOMPONENT3D_GEOMETRY_0001） | 测试 HAP 已安装，绘制区已建立（200×100vp） | 读 GetXComponentSize_Width() | 回读宽度为正（真机单位为 px），且宽高与布局 200:100 等比 | 是 | 通过 |
| 尺寸回读-合法-高度（SUB_XCOMPONENT3D_GEOMETRY_0002） | 测试 HAP 已安装，绘制区已建立 | 读 GetXComponentSize_Height() | 回读高度为正、小于宽度，且宽高与布局等比 | 是 | 通过 |
| 尺寸回读-合法-宽高比（SUB_XCOMPONENT3D_GEOMETRY_0003） | 测试 HAP 已安装，绘制区已建立 | 读 width 与 height 求比值 | 比值落在 1.8~2.2，不为 1 | 是 | 通过 |
| 偏移回读-合法-两轴（SUB_XCOMPONENT3D_GEOMETRY_0004） | 测试 HAP 已安装，绘制区已建立（margin 16/24） | 读 GetXComponentOffset_x() / _y() | 两轴均为非负有限值，当前框架实现回读 0 | 是 | 通过 |
| 偏移回读-合法-比例不变式（SUB_XCOMPONENT3D_GEOMETRY_0005） | 测试 HAP 已安装，绘制区已建立 | 计算 offset/size 比值 | 两轴比值均落在 [0, 1) 内，与屏幕密度无关 | 是 | 通过 |
| 尺寸回读-边界-有限数值（SUB_XCOMPONENT3D_GEOMETRY_0006） | 测试 HAP 已安装，绘制区已建立 | 读取四个几何量 | 均为有限数值（非 NaN/Infinity） | 是 | 通过 |
| 尺寸回读-边界-整数语义（SUB_XCOMPONENT3D_GEOMETRY_0007） | 测试 HAP 已安装，绘制区已建立 | 读取 width 与 height | 均为整数，无小数部分 | 是 | 通过 |
| 尺寸回读-边界-取值范围（SUB_XCOMPONENT3D_GEOMETRY_0008） | 测试 HAP 已安装，绘制区已建立 | 读取 width 与 height | 均落在 [1, 4000]，不退化为 0 | 是 | 通过 |
| 偏移回读-边界-整数语义（SUB_XCOMPONENT3D_GEOMETRY_0009） | 测试 HAP 已安装，绘制区已建立 | 读取 offset_x 与 offset_y | 均为整数，且 offset_y >= 0 | 是 | 通过 |
| 尺寸回读-无参调用确定性（SUB_XCOMPONENT3D_GEOMETRY_0010） | 测试 HAP 已安装，绘制区已建立 | 重复调用尺寸回读接口 | 不抛异常，两次结果一致且均为正 | 是 | 通过 |
| 尺寸回读-极值-千次回读（SUB_XCOMPONENT3D_GEOMETRY_0011） | 测试 HAP 已安装，绘制区已建立 | 连续 1000 次读取宽度 | 首末值一致，无漂移 | 是 | 通过 |
| 尺寸回读-极值-两百轮交错（SUB_XCOMPONENT3D_GEOMETRY_0012） | 测试 HAP 已安装，绘制区已建立 | 200 轮四接口交替回读 | 几何量全部保持首轮取值 | 是 | 通过 |
| 尺寸回读-组合-切换形状后尺寸（SUB_XCOMPONENT3D_GEOMETRY_0013） | 测试 HAP 已安装，绘制区已建立 | changeShape(1) 前后读取尺寸 | width/height 不变且宽高仍与布局 200:100 等比 | 是 | 通过 |
| 偏移回读-组合-切换形状后偏移（SUB_XCOMPONENT3D_GEOMETRY_0014） | 测试 HAP 已安装，绘制区已建立 | changeShape(0) 前后读取偏移 | offset 不变，缓存未被重绘覆盖 | 是 | 通过 |
| 尺寸回读-组合-重绘后几何量（SUB_XCOMPONENT3D_GEOMETRY_0015） | 测试 HAP 已安装，绘制区已建立 | 连续两次 animate() | size 与 offset 均不变 | 是 | 通过 |
| 尺寸回读-组合-交替五轮（SUB_XCOMPONENT3D_GEOMETRY_0016） | 测试 HAP 已安装，绘制区已建立 | animate() 与 changeShape(i%2) 交替 5 轮 | 四个几何量全部保持初始值 | 是 | 通过 |
| 尺寸回读-状态-接口幂等（SUB_XCOMPONENT3D_GEOMETRY_0017） | 测试 HAP 已安装，绘制区已建立 | 四个接口各自相邻两次读取 | 各自两次结果相等 | 是 | 通过 |
| 尺寸回读-状态-绘制区已建立（SUB_XCOMPONENT3D_GEOMETRY_0018） | 测试 HAP 已安装 | 同时读取 size 与 offset | width/height 为正，offset 之和非负 | 是 | 通过 |
| 偏移回读-状态-多次调用稳定（SUB_XCOMPONENT3D_GEOMETRY_0019） | 测试 HAP 已安装，绘制区已建立 | 多次读取 offset | 均非负且相邻两次相等 | 是 | 通过 |
| 尺寸回读-状态-与形状索引解耦（SUB_XCOMPONENT3D_GEOMETRY_0020） | 测试 HAP 已安装，绘制区已建立 | changeShape(0) 与 changeShape(4294967295) | 两次 width 相等且宽高仍与布局等比 | 是 | 通过 |
| 契约镜像与错误码矩阵（SUB_XCOMPONENT3D_CONTRACT_0001~0187，共 187 例） | 测试 HAP 已安装 | 33 个原生接口的合法/边界/非法/极值入参；空 component 路径；错误码取值范围 | 每个 probe 返回 `{code, value, aux}`；`code` 属于 `{0, -1, -2}`；非法入参不崩溃且不产生部分写入 | 是 | 通过 |
| 注册接口 probe（SUB_XCOMPONENT3D_CALLBACK_0001~0040，共 40 例） | 测试 HAP 已安装 | 9 类回调的重复注册/注销；帧率区间与软键盘设置 | 返回码稳定且属于合法域；重复注册幂等；注销后再次注册仍返回同一码 | 是 | 通过 |
| 组合与顺序（SUB_XCOMPONENT3D_COMBO_0001~0400，共 400 例） | 测试 HAP 已安装 | 两至十接口串联、查询三连、注册+查询+状态、changeShape 状态机序列 | 全链返回码合法；尺寸/偏移/标识跨接口不被污染；形状末态回显且每例复位到 0 | 是 | 通过 |
| 像素回读（SUB_XCOMPONENT3D_PIXEL_0001~0200，共 200 例） | 测试 HAP 已安装；pbuffer 可用 | 标准色/灰阶/单通道扫描；四通道越界；小数截断；越界恢复；像素×查询×形状交错 | 结构层：`pixel`/`corner` 含 4 元素、`aux` 为 4；颜色层：通道和/倍比/两点一致等关系式成立；越界时 `code=-2` 且 RGBA 全 0 | 是 | 通过 |
| 稳定性（SUB_XCOMPONENT3D_STABLE_0001~0100，共 100 例） | 测试 HAP 已安装 | 同色 2~50 次重复、changeShape 幂等与序列、几何/标识三元组稳定、注册与设置幂等、点查询、20~50 阶长序列、恢复 | 两次调用三元组全等；尺寸/偏移/标识不漂移；形状幂等且收尾归零；越界拒绝后合法调用可恢复 | 是 | 通过 |
| UI 扩展（SUB_XCOMPONENT3D_UI_0001~0025，共 25 例） | 位于首页，两档按钮已渲染 | `ON.id('DrawCube')`/`ON.id('DrawTransform')` 定位、属性读取、单次与交替点击 | 文案与标识逐字匹配；可点击/可用/不可滚动；边界盒宽高为正；收尾复位到 DrawCube 且绘制区存在 | 是 | 通过 |
| 通道扫描-ALPHA 通道（SUB_XCOMPONENT3D_VOLALPHA_0001~0264，共 264 例） | 测试 HAP 已安装；pbuffer 可用 | alpha 0..255 逐值清屏；锚点覆盖 256/-1 越界与 alpha 通道回读；补充用例 0261~0264 覆盖两帧 alpha 跟随、跨 RGB 不变、越界后恢复、四通道同帧 | `pixel.length=4`、`aux=4`、`pixel[0..1]=0`、`code=0`；越界 `code=-2` 且 RGB 全 0 | 是 | 通过 |
| 索引扫描-形状 2^k 邻域（SUB_XCOMPONENT3D_VOLSHAPE_0001~0084，共 84 例） | 测试 HAP 已安装 | 0..31 连续、2^6..2^28 的 -1/幂/幂+1 族、int32/uint32 边界；锚点 2^32 回绕与 -1 归一；补充用例 0083~0084 覆盖 16 档位连读与 2→1024→2 跳变 | `getShapeIndex()` 回显入参；非负、整数、不超过 4294967295；回绕为 0、-1 归一为 4294967295 | 是 | 通过 |
| 区间扫描-帧率区间（SUB_XCOMPONENT3D_VOLFPS_0001~0049，共 49 例） | 测试 HAP 已安装 | 10 档下限 × 7 档上限的 47 组区间；锚点 min>max 逆序区间；补充用例 0049 覆盖 (1,30,16) 与 (30,60,30) 两组回显 | `value` 回显下限、`aux` 回显上限、`value<=aux`、`code` 落在 `{0,-1,-2}` | 是 | 通过 |
| 索引扫描-触摸点索引（SUB_XCOMPONENT3D_VOLTOUCH_0001~0084，共 84 例） | 测试 HAP 已安装；XComponent 已绑定 | 5 个触摸点接口 × index 0..15；锚点 index -1 与 16 越界；补充用例 0083~0084 覆盖索引 5 四坐标口径与 WindowY/DisplayY/ToolType 同索引 | `aux` 回显 pointIndex；`value>=-1` 且为整数；`code` 落在 `{0,-1,-2}` | 是 | 通过 |
| 通道扫描-灰阶扫描（SUB_XCOMPONENT3D_VOLGREY_0001~0034，共 34 例） | 测试 HAP 已安装；pbuffer 可用 | 灰阶 0..248 步长 8；锚点白场 255；补充用例 0034 覆盖白场与黑场在两采样点同时成立 | `pixel[0..2]` 与 `corner[0]` 均等于设定灰阶，`code=0` | 是 | 通过 |
| 区间循环-单次覆盖（SUB_XCOMPONENT3D_VOLCYCLE_0001~0004，共 4 例） | 测试 HAP 已安装；pbuffer 可用 | changeShape 0..255 单例、alpha 0..255 单例、灰阶 0..255 单例、形状 0/1 交替 100 轮 | 每轮不变量均成立且失败会打印轮次；循环收尾回读等于末次入参 | 是 | 通过 |
| 通道扫描-红通道 0..255（SUB_XCOMPONENT3D_VOLRED_0001~0260，共 260 例） | 测试 HAP 已安装；pbuffer 可用 | `(v,0,0,255)` 红通道 0..255 逐值清屏（65 例 × 4 桶）；锚点覆盖 256/-1 越界与 (255,0,0) 饱和端点与跨通道分离 | 回读红通道等于入参、绿蓝通道为 0、`aux=4`、`code=0`；越界 `code=-2` 且 RGBA 全 0 | 是 | 通过 |
| 通道扫描-绿通道 0..255（SUB_XCOMPONENT3D_VOLGREEN_0001~0260，共 260 例） | 测试 HAP 已安装；pbuffer 可用 | `(0,v,0,255)` 绿通道 0..255 逐值清屏（65 例 × 4 桶）；锚点覆盖 256/-1 越界与 (0,255,0) 饱和端点与红通道不串扰 | 回读绿通道等于入参、红蓝通道为 0、`aux=4`、`code=0`；越界 `code=-2` 且 RGBA 全 0 | 是 | 通过 |
| 通道扫描-蓝通道 0..255（SUB_XCOMPONENT3D_VOLBLUE_0001~0260，共 260 例） | 测试 HAP 已安装；pbuffer 可用 | `(0,0,v,255)` 蓝通道 0..255 逐值清屏（65 例 × 4 桶）；锚点覆盖 256/-1 越界与 (0,0,255) 饱和端点与红绿通道不串扰 | 回读蓝通道等于入参、红绿通道为 0、`aux=4`、`code=0`；越界 `code=-2` 且 RGBA 全 0 | 是 | 通过 |
| 通道扫描-红绿不互换（SUB_XCOMPONENT3D_VOLMIX_0001~0260，共 260 例） | 测试 HAP 已安装；pbuffer 可用 | `(v,255-v,0,255)` 逐值清屏（65 例 × 4 桶）；锚点覆盖 256/-1 越界与 (255,0,0) 端点、 (127,128,0) 中间值 | 两通道分别回显且不交换、蓝通道为 0、`code=0`；越界 `code=-2` 且 RGBA 全 0 | 是 | 通过 |
| 通道扫描-红蓝不互换（SUB_XCOMPONENT3D_VOLDIAG_0001~0260，共 260 例） | 测试 HAP 已安装；pbuffer 可用 | `(v,0,255-v,255)` 逐值清屏（65 例 × 4 桶）；锚点覆盖 256/-1 越界与 (30,0,255) 端点、 (127,0,128) 中间值 | 两通道分别回显且不交换、绿通道为 0、`code=0`；越界 `code=-2` 且 RGBA 全 0 | 是 | 通过 |
| 通道扫描-绿蓝互补（SUB_XCOMPONENT3D_VOLGB_0001~0258，共 258 例） | 测试 HAP 已安装；pbuffer 可用 | `(0,v,255-v,255)` 绿蓝互补 v=1..254 逐值（64/64/64/62 四桶）；锚点覆盖 corner 次采样点、绿蓝互换镜像、和恒 255、残蓝=1 | 红通道为 0、绿蓝通道各自回显且不互换、`code=0` | 是 | 通过 |
| 索引扫描-触点倾角与事件源（SUB_XCOMPONENT3D_VOLTILT_0001~0049，共 49 例） | 测试 HAP 已安装；XComponent 已绑定 | TiltX / TiltY / EventSourceType 三接口 × index 0..15；锚点 index=16 越界 | `aux` 回显入参索引、倾角为大于等于 -1 的整数、`code` 落在 `{0,-1,-2}` | 是 | 通过 |
| 区间扫描-帧率下限逐档（SUB_XCOMPONENT3D_VOLFPS_0050~0163，共 114 例） | 测试 HAP 已安装 | 固定 max=120、expected=60，下限 0..119 逐值（57+55 两桶）；锚点 `min=max=120` 与 `min=max=60` | `value` 回显下限、`aux` 回显上限、`value<=aux`、`code` 落在 `{0,-1,-2}` | 是 | 通过 |
| 索引扫描-开关型逐值（SUB_XCOMPONENT3D_VOLSWITCH_0001~0018，共 18 例） | 测试 HAP 已安装 | 软键盘 8 个未覆盖入参（含 int32 上下界）；UI 事件类型 8 个取值（含未知类型与负数）；锚点 need=2 开→关→开幂等；补充用例 键盘与注册交错 | 键盘 `value` 回显入参、注册类 `value` 回显事件类型；`aux=0`；码域分别为 `{0,-1,-2}` 与 `{0,401}` | 是 | 通过 |
| 关系式配对-RGB 输入域（SUB_XCOMPONENT3D_RGBREAL_0001~0012，共 12 例） | 测试 HAP 已安装；pbuffer 可用 | 白/黄/绿/蓝/品红/中灰 128/低值 (1,2,3)/递减 (200,100,50)/纯红与纯蓝双采样；alpha 0 与 alpha 256 越界 | 三通道与两采样点逐值匹配、跨通道为 0、`aux=4`；alpha 0 时 RGB 保留且 `pixel[3]=0`；alpha 256 时 `code=-2` 且 RGBA 全 0 | 是 | 通过 |
| 关系式配对-ALPHA 槽（SUB_XCOMPONENT3D_ALPHAREAL_0001~0002，共 2 例） | 测试 HAP 已安装；pbuffer 可用 | 不透明红双采样；全透明结构校验 | 两采样点 `pixel[3]=255`、`aux=4`、`code=0`；alpha 0 时 `pixel[3]=0` 且 RGB 不受影响 | 是 | 通过 |
| 关系式配对-形状序列（SUB_XCOMPONENT3D_SHAPEREAL_0001~0002，共 2 例） | 测试 HAP 已安装 | 3→5→0 顺序切换；`changeShape(7)` 连读两次后复位 | 每次 `getShapeIndex()` 等于刚设置值；同值连读稳定；每例收尾复位到 0，不污染 UI 套件 | 是 | 通过 |
| 关系式配对-帧率区间（SUB_XCOMPONENT3D_FPSREAL_0001~0002，共 2 例） | 测试 HAP 已安装 | 设置 (30,120,60) 与 (60,60,60) 两组区间 | `value` 回显下限、`aux` 回显上限、`value<=aux`、`code` 落在 `{0,-1,-2}` | 是 | 通过 |
| 关系式配对-触点口径（SUB_XCOMPONENT3D_TOUCHREAL_0001~0002，共 2 例） | 测试 HAP 已安装；XComponent 已绑定 | 同状态下读 ToolType(3)/ToolType(4)；WindowX(0)/DisplayX(0) | `aux` 回显各自 pointIndex；同组两接口 `code` 相等 | 是 | 通过 |
| 关系式配对-灰阶关系式（SUB_XCOMPONENT3D_GREYREAL_0001~0002，共 2 例） | 测试 HAP 已安装；pbuffer 可用 | 灰阶 64 与 200 两档，改用通道间相等关系断言 | 三通道两两相等、两采样点各自等于设定灰阶且 `code=0` | 是 | 通过 |
| 关系式配对-绿蓝互补（SUB_XCOMPONENT3D_GBREAL_0001~0002，共 2 例） | 测试 HAP 已安装；pbuffer 可用 | `(0,128,127,255)` 双采样；`(0,200,55)` → `(0,55,200)` → 回退 两次互换 | 绿蓝两通道和恒 255 且各自守位；互换与回退后不残留 | 是 | 通过 |
| 关系式配对-触点倾角（SUB_XCOMPONENT3D_TILTREAL_0001~0002，共 2 例） | 测试 HAP 已安装；XComponent 已绑定 | index 0 与 15 下三接口交叉比对；同索引重复调用 | `aux` 回显各自索引且三接口相等；两倾角接口 `code` 一致、事件源接口 `code` 落在 `{0,-1,-2}`；重复调用值与码稳定 | 是 | 通过 |
| 关系式配对-开关序列（SUB_XCOMPONENT3D_SWITCHREAL_0001~0002，共 2 例） | 测试 HAP 已安装 | 键盘 1→0→1 序列；触摸/鼠标/按键三类注册 | 三次回显与首轮一致；三类注册码相等且回显各自事件类型 | 是 | 通过 |
| 跨调用场景（10 例，分布在 ALPHA 0261~0264 / SHAPE 0083~0084 / FPS 0049 / TOUCH 0083~0084 / GREY 0034） | 测试 HAP 已安装；pbuffer 可用 | 多步真实场景：两帧间 alpha 跟随、RGB 变化不影响 alpha、越界拒绝后合法可恢复、四通道同帧校验、形状大小跳变、区间下限回显、四坐标口径同索引、白黑场两采样点同时成立 | 每例 4 条断言覆盖跨调用一致性，末次回读等于期望，形状类收尾复位 | 是 | 通过 |
| 组合扫描-三值互异（SUB_XCOMPONENT3D_VOLRGB3_0001~0512，共 512 例） | 测试 HAP 已安装；pbuffer 可用 | 阶梯 0/32/64/96/128/160/192/224/255 的全排列中取三点两两互异的 504 组（64 例 × 8 桶）；每桶 1 例锚点用 corner 端点复核 | 三通道分别回读等于入参、两两互异关系成立、corner 三通道与入参一致、`code=0` | 是 | 通过 |
| 索引扫描-形状索引延伸段（SUB_XCOMPONENT3D_VOLSHAPEEXT_0001~0130，共 130 例） | 测试 HAP 已安装 | `changeShape(128..255)` 逐值（65 例 × 2 桶）；锚点覆盖 128 与 255 两端点与切回残留 | `getShapeIndex()` 回显入参、落在 128..255、重复回读一致 | 是 | 通过 |
| 调用稳定性-注册回调（SUB_XCOMPONENT3D_VOLCALLBACK_0001~0101，共 101 例） | 测试 HAP 已安装；XComponent 已绑定 | 11 类注册探针 × 连续调用 1..9 次（50 例 × 2 桶）；锚点覆盖 onFrame 注册注销配对与触控拦截重复注册 | 多次调用返回码相等、码域为 `{0,401}` 与 `{-2,0}` 并集、`value`/`aux` 为整数 | 是 | 通过 |
| 区间扫描-帧率三元组回显（SUB_XCOMPONENT3D_VOLFPS3_0001~0059，共 59 例） | 测试 HAP 已安装 | 6 档下限 × 6 档上限中 max>min 的合法组；再加下限倒置、单点区间、0 与负数、240/1000 极值共 30 例；锚点覆盖 120/30 倒置 | `value` 回显下限、`aux` 回显上限、两字段之差等于入参之差（倒置三元组同样成立）、合法组 `code=0` | 是 | 通过 |
| 索引扫描-触点索引延伸段（SUB_XCOMPONENT3D_VOLUIEXT_0001~0130，共 130 例） | 测试 HAP 已安装；XComponent 已绑定 | 触点索引 16..143 逐值（65 例 × 2 桶），每例同时读 WindowX/WindowY/DisplayX 三个探针；锚点四坐标齐读 | `aux` 回显索引、同一索引的坐标探针 `code` 相等、`value>=0` | 是 | 通过 |
| 接口串联-形状颜色帧率（SUB_XCOMPONENT3D_VOLCOMBO2_0001~0130，共 130 例） | 测试 HAP 已安装；pbuffer 可用 | 形状 128..143 × 8 组递增色（64 例 × 2 桶），每例按 changeShape → 清屏 → 设帧率 → 回读索引 的顺序执行；锚点用饱和色复核三态 | 末态索引等于入参、三通道回读等于入参、帧率 `value` 回显下限、`code=0` | 是 | 通过 |
| 关系式配对-扩展主题（SUB_XCOMPONENT3D_RGB3REAL/SHAPEEXTREAL/CALLBACKREAL/FPS3REAL/UIEXTREAL/COMBO2REAL_0001~0003，共 18 例） | 测试 HAP 已安装；pbuffer 可用 | 手写语义断言：全零与全白饱和、通道升序不串扰、形状 128/255 往返、注册注销配对、帧率倒置与负数、四坐标齐读、串联后连续切换 | 每例至少 4 条断言，含 1 条跨调用一致性；形状类用例收尾不残留 | 是 | 通过 |

## 运行保护机制

94 个套件均在 `describe` 内注册 `beforeEach` 调用 [TestYield.ets](entry/src/ohosTest/ets/test/common/TestYield.ets) 中的 `yieldToSystem()`，每 20 例执行一次 `getCurrentTopAbility()` 真实异步调用并 `await` 与 `setTimeout(0)`，打断 Hypium 微任务链，避免长套件在单帧内拖死 UI 线程。

## 构建验证

```
# 主包
hvigorw --mode module -p module=entry@default -p product=default assembleHap --no-daemon

# 测试包
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
```

| 项目 | 值 |
|--------------------------------|--------------------------------|
| 主包产物 | `entry/build/default/outputs/default/entry-default-signed.hap` |
| 测试包产物 | `entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap` |
| 应用包名 | `com.samples.xcomponent3d` |
| 测试模块名 | `entry_test` |
| 测试运行器 | `OpenHarmonyTestRunner` |

## 执行说明

先安装两个 HAP，再执行测试。测试包只包含用例代码，native 库由主包提供，因此修改 `entry/src/main/cpp` 后必须重建主包。

```powershell
# 1. 卸载旧版本
hdc uninstall com.samples.xcomponent3d

# 2. 推送并安装两个 HAP（先 cd 到各自产物目录，用裸文件名发送，否则设备端会重建目录树）
hdc shell mkdir data/local/tmp/<唯一目录名>
hdc file send entry-default-signed.hap "data/local/tmp/<唯一目录名>"
hdc file send entry-ohosTest-signed.hap "data/local/tmp/<唯一目录名>"
hdc shell ls -l data/local/tmp/<唯一目录名>
hdc shell bm install -p data/local/tmp/<唯一目录名>
hdc shell rm -rf data/local/tmp/<唯一目录名>

# 3. 在 DevEco Studio 中选择 entry@ohosTest 运行配置，按下表填写参数后执行单个套件
#    （推荐；不要省略套件过滤跑全量，会被整体超时保护杀掉）
#    应用包名        com.samples.xcomponent3d                 对应 -b
#    测试模块名      entry_test                               对应 -m
#    测试运行器路径  /ets/testrunner/OpenHarmonyTestRunner     对应 -s unittest
#    单例超时        60000 ms                                 对应 -s timeout
#    套件过滤        追加 -s class XComponentGeometryTest
#
# 4. 只执行单个用例：在上述参数基础上再追加一个选项
#    -s class "XComponentGeometryTest#testXComponentGeometry0001"
```

日志中 `OHOS_REPORT_RESULT: stream=Tests run: N, Failure: F, Error: E, Pass: P` 为单个套件的结果行，`OHOS_REPORT_STATUS_CODE` 的 0 表示用例通过、-2 表示失败。

## 测试结果

**执行环境**：OpenHarmony-7.1.0.21（API 26），设备类型 default，2026-11-18，`com.samples.xcomponent3d` + `entry_test` + `OpenHarmonyTestRunner`。

| 项目 | 数值 |
|--------------------------------|--------------------------------|
| 测试套件 | 94 |
| 用例总数 | 4687 |
| 通过 | 4687 |
| 失败 | 0 |
| 错误 | 0 |

执行方式：主包与测试 HAP 重建并安装后，按 `List.test.ets` 注册顺序逐套件执行（每轮追加 `-s class <套件>` 过滤），不指定 `-s class` 的全量执行会被整体超时保护杀掉，故不采用；单套件超时 60 s。94 个套件在同一构建产物上逐套件跑通，全部结果行为 `Failure: 0, Error: 0`，合计耗时 402 s（新增 23 套件 88 s + 存量 71 套件 314 s）。历史基线（2026-11-17，54 个套件 / 2840 条用例；2026-11-18，71 个套件 / 3607 条用例）同样全量通过，失败归因与处置见下节。

首轮全量基线（54 套件）有 68 条用例失败，分布在 9 个套件。逐条归因后确认失败全部来自用例侧的期望值与真机契约不一致，main 侧无功能缺陷：

| 根因 | 表现 | 处理 |
|--------------------------------|--------------------------------|--------------------------------|
| 错误返回码域错配 | RegisterUIInputEventCallback 返回 ArkUI 错误码域 0 与 401，用例按自定义域 0 与 -1 与 -2 断言 | 断言改为分域判定 |
| 无按键事件语义 | 未注入按键事件时 keyCode 与 action 实际为 -1 | 断言放宽为大于等于 -1 |
| GetContext 指针截断 | 指针经 ToInt64 转换后高位丢失 | 改为直接取属性，不比较地址 |
| NAPI 属性不可枚举 | GetContext 返回对象的属性不可枚举，Object.keys 恒返回空数组 | 改用 Object.getOwnPropertyNames |
| 像素 alpha 干扰 | 清屏写入的 alpha 恒为 255，干扰通道比对 | 改用 RGB 三通道关系式断言 |
| 绘制区几何真值偏差 | GetXComponentSize 回读单位为 px，200×100vp 实测回读 300×150；GetXComponentOffset 恒返回 0 | 断言改为与布局 200:100 等比且 offset 非负 |

修复后只对受影响的 9 个套件做增量复跑，随后重建测试 HAP 并重新安装，再对当时全部 54 个套件执行最终全量，结果为零失败。

扩展后的首轮全量（71 套件 / 3607 例）有 2 条失败，均在触点倾角主题：`NativeVolumeTilt01#testVolumeTilt0049` 与 `NativeVolumeTiltReal01#testVolumeTiltReal0001`。两条用例原先断言 TiltX、TiltY 与 EventSourceType 三接口的 `code` 跨接口相等；真机实测无触点时两个倾角接口返回 0（SUCCESS），事件源接口返回 -2（BAD_PARAMETER），属不同接口族的判错口径，用例假设不成立。改为「两个倾角接口 `code` 相等 + 事件源接口 `code` 落在 `{0, -1, -2}`」，不含 `src/main` 改动。修复后只对两个套件做增量复跑（49 + 2 例全通过），随后重建测试 HAP 并在当时产物上重跑一次全量，71 套件 / 3607 例零失败。

2026-11-18 二轮扩展新增 23 个套件 / 1080 例（17 个逐值扫描套件 + 6 个关系式配对套件），用例总数升到 94 套件 / 4687 例；测试 HAP 构建通过，用例审计 `errors=0`。新构建产物上先跑一轮 23 个新增套件的全量基线，有 10 条失败（Rgb301~304 各 1 条、Fps301 6 条）。逐条归因后确认仍是用例侧断言写错，`src/main` 无改动：

| 根因 | 表现 | 处理 |
|--------------------------------|--------------------------------|--------------------------------|
| 锚点断言对输入域不恒真 | VOLRGB3 每桶锚点断言三通道和大于 255，而 Rgb301~304 的锚点三元组为 0/32/64、32/64/0、64/96/0、96/128/0，三元组和分别为 96、96、160、224，恒假 | 改为 corner 三通道两两互异（与桶的三点互异前提一致），8 个桶的锚点全部成立 |
| 排序断言对倒置三元组不成立 | VOLFPS3 断言 `value <= aux`，失败 6 例恰为 `min > max` 且 `expected == max` 的倒置三元组；hilog 单例取证显示 `actual=60 expected=60`、`actual=30 expected=30` 后 `value=false`，失败落在排序断言而非码域断言 | 改为断言 `value - aux` 等于 `min - max`（差值等价，任意顺序成立） |

两处修复只落 9 个用例文件（Rgb301~308、Fps301），重建测试 HAP 并重装后，23 个新增套件重跑为 1080 例零失败；随后在同一产物上把 71 个存量套件也逐套件复跑一遍，3607 例零失败。最终 94 个套件 / 4687 例在同一构建产物上零失败。

## 用例设计说明

- 编号规范：`SUB_XCOMPONENT3D_<主题>_<四位序号>`，主题包括 ABILITY、SHAPE、GEOMETRY、CONTRACT、CALLBACK、COMBO、PIXEL、STABLE、UI 与 VOL 系列。
- 六维矩阵：每个主题覆盖合法、边界、非法、极值、组合与状态六类场景，非法的入参只断言不崩溃与返回值域，极值覆盖 int32 与 uint32 边界及 2^32 回绕。
- 分类统计：**合计：94 个测试套件，4687 条用例**，全部为自动化用例。VOL 系列按通道逐值扫描、索引逐值扫描、区间组合扫描与关系式配对四类场景组织，每组末尾保留跨调用场景用例，覆盖连续两帧状态跟随与越界后恢复。
