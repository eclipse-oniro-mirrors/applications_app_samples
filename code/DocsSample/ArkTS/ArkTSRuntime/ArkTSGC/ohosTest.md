| 测试功能              | 预置条件 | 输入         | 预期输出                                              |是否自动|测试结果|
|-------------------|------|------------|---------------------------------------------------|--------------------------------|--------------------------------|
| 拉起应用              | 	设备正常运行 | 		         | 成功拉起应用                          |是|Pass|
| 测试HintGC触发  | 执行用例 | 执行无需输入     | 点击'触发HintGC'按钮调用ArkTools.hintGC()完成    |是|Pass|
| HintGC调用守卫（HintGcGuard，11条） | 设备正常运行 | 单次/连续/异步/分配压力下调用ArkTools.hintGC() | 调用不抛异常、真实GC轮次达到要求、被释放对象最终被回收、被持有对象不被回收 |是|待真机全量验证|
| 循环引用组合（CyclicReferenceMatrix，12条） | 设备正常运行 | 父子互引、2~10000节点环、不同负载、全连接网格、树形回指、闭包/Map/数组自引用 | 释放后WeakRef被清空、FinalizationRegistry回调token完整，环与网格结构在释放前正确闭合 |是|待真机全量验证|
| 循环引用时序（CyclicReferenceSequence，10条） | 设备正常运行 | 持有-释放、部分释放、unregister、分阶段释放、反复重建、闭包持有 | 仍持有的循环不被回收，释放的循环被回收，unregister后的对象不再上报 |是|Pass|
| GC统计表（GcRuntimeStatTable，10条） | 设备正常运行 | hidebug.getVMRuntimeStat五个统计键、非法键、近似键 | 统计值有限非负，非法键返回401；字节计数在独立工作负载预算内正常增长或可信回绕，保留数组内容完整 |是|待真机全量验证|
| VM内存不变量（VmMemoryInvariant，5条） | 设备正常运行 | 保留8MB/16MB数组、分配垃圾、20次采样 | used不超过total，对象占用及分配增量覆盖持有载荷；丢弃数组经WeakRef确认回收，释放量覆盖载荷且不超过物理上界 |是|待真机全量验证|
| 包配置守卫（BundleConfigGuard，12条） | 设备正常运行 | bundleManager查询自身包、模块、Ability、备份扩展及profile | bundleName/版本/targetVersion/模块/技能/备份配置与工程配置一致，非法查询返回17700003/17700024 |是|Pass|
| 资源守卫（ResourceGuard，11条） | 设备正常运行 | 按名称/ID读取字符串、浮点、颜色、媒体与分层图标资源 | 字符串与string.json一致，深浅色背景正确，PNG头合法，非法名称返回9001003，非法ID返回9001001 |是|Pass|
| Ability生命周期（AbilityLifecycleSequence，7条） | 设备正常运行 | 拉起、终止并重启EntryAbility，监听生命周期 | 创建/窗口创建/前台与窗口销毁/销毁回调顺序正确，窗口可见且区域非空，每次重启得到新的前台实例 |是|Pass|
| 首页UI（IndexUiGuard，5条） | 设备正常运行，屏幕点亮 | 拉起首页、单击/连续点击'触发HintGC'按钮、重启应用 | 首页显示Hello World与按钮，点击后变为Success且按钮仍可用，重启后回到Hello World |是|Pass|
| WeakRef生命周期（GcWeakRefLifecycle，104条） | 设备正常运行 | 单/多WeakRef、容器持有、不同对象形状、闭包持有、释放与压力序列 | deref标识稳定，持有对象不被回收，释放对象在压力+hintGC后清空，统计变化位于可信窗口内 |是|待真机全量验证|
| FinalizationRegistry（GcFinalizationRegistry，108条） | 设备正常运行 | 数字/字符串/对象token、多注册表、注册与注销交错、重复注册 | 注销后不再上报，未注销token按轮次回收，token顺序与集合一致，GC统计变化位于可信窗口内 |是|待真机全量验证|
| 对象图完整性（GcObjectGraph，108条） | 设备正常运行 | 父子互引、链、环、全连接网格、树回指、菱形与共享子节点 | 结构与独立oracle一致，id和/长度/回指关系在GC前后正确，真实GC轮次达到用例要求 |是|待真机全量验证|
| GC统计采样（GcStatSampling，105条） | 设备正常运行 | 五个统计键的连续采样、压力/保留内存/异步间隔 | 值有限非负；按独立工作负载预算识别正常增长与32位回绕；有明确载荷时分配增量覆盖载荷 |是|待真机全量验证|
| GC统计非法输入（GcStatErrorMatrix，100条） | 设备正常运行 | 空串、大小写、点号、前后缀、近似键、超长键 | 非法键返回401，合法键不受影响，失败调用前后统计变化位于无业务负载的采样预算内 |是|待真机全量验证|
| VM堆矩阵（VmHeapMatrix，111条） | 设备正常运行 | 不同载荷的保留/释放、采样序列、与GC字节计数联动 | used≤total，保留载荷可达且内容完整，释放目标经WeakRef确认清空，字节计数位于可信工作负载窗口内 |是|待真机全量验证|
| 包信息字段（BundleSelfInfo，108条） | 设备正常运行 | getBundleInfoForSelf各Flag组合与字段 | 名称/版本/模块/Ability/备份扩展与工程配置一致，Flag子集关系正确 |是|Pass|
| 字符串资源（ResourceStringMatrix，100条） | 设备正常运行 | 按名称/ID读取base与en_US字符串、非法名称/ID | 值与string.json一致，非法名称9001003，非法ID9001001 |是|Pass|
| 颜色资源（ResourceColorMatrix，115条） | 设备正常运行 | 按名称/ID读取颜色、ARGB拆解、边界颜色 | 通道0~255，alpha计算一致，深浅色取值正确 |是|Pass|
| 媒体与profile资源（ResourceMediaMatrix，118条） | 设备正常运行 | 按名称/ID读取media、分层图标、profile | PNG签名/IHDR合法，尺寸与文件一致，非法输入错误码正确 |是|Pass|
| 模块与Ability信息（BundleModuleMatrix，123条） | 设备正常运行 | HapModuleInfo、EntryAbility、备份扩展、metadata与skills | 字段与module.json5一致，模块/Ability数量与技能实体正确 |是|Pass|
| 包查询错误路径（BundleErrorMatrix，122条） | 设备正常运行 | 未知/空/近似包名、非法模块与Ability、非法Flag | 返回17700001/17700003等错误码，失败后合法查询仍成功 |是|Pass|
| Ability生命周期矩阵（AbilityLifecycleMatrix，108条） | 设备正常运行 | 拉起/终止/重启、回调顺序、生命周期搅动 | 新实例唯一、回调顺序正确、窗口阶段存在，生命周期操作前后GC统计位于独立预算窗口内 |是|待真机全量验证|
| 窗口与显示（AbilityWindowMatrix，108条） | 设备正常运行 | 窗口矩形/可见性/避让区、显示密度与旋转 | 矩形为正、可见状态正确、避让区字段合法、显示值有限 |是|Pass|
| 应用与模块上下文（AppContextMatrix，111条） | 设备正常运行 | ApplicationContext与模块上下文、目录可写性 | bundleName与模块名正确，目录路径以 `/` 开头且可读写，重复调用稳定 |是|Pass|
| 运行时交叉校验（RuntimeIntegrationMatrix，107条） | 设备正常运行 | GC计数/字节计数/VM堆/WeakRef/资源查询联动 | 载荷独立下界成立、统计变化位于工作负载预算内、目标回收状态正确，重压后查询与拉起仍可用 |是|待真机全量验证|

说明：

1. 共26个测试套件、1840条用例（含原模板1条），本轮保留全部现有用例的名称、编号和顺序；已完成本地独立oracle回归和新备份构建，真机无class全量运行待验证。
2. `ArkTools.hintGC()` 只是回收提示，用例通过“分配压力 + 多轮等待”的方式判定回收，不假设调用后立即回收。
3. WeakRef目标在创建它的同步任务结束前不会被回收；释放类用例在同步辅助函数中创建目标和WeakRef，函数返回后通过真实定时器让出任务，再执行多轮回收检查。
4. 运行时观察：已经晋升到老年代的循环引用不会被及时回收，用例只校验新创建并立即释放的循环。
5. 构建观察：构建会把 `layered_image.json` 中的 `$media:名称` 改写为 `$media:资源ID`，并把分层图标前景/背景缩放为512×512，资源用例按构建产物校验。
6. `entry/src/main/ets/ReferenceCounting.ts` 没有导出任何内容，其中的 `main()` 也未被调用，因此不纳入自动化测试。
7. bundleName `com.sample.ArkTSGC` 的最后一段含大写，与签名配置中登记的包名绑定；改为全小写会导致签名校验失败（00303074），因此保留现状。
