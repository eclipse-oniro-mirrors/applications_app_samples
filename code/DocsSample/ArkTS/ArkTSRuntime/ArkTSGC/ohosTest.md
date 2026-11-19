| 测试功能              | 预置条件 | 输入         | 预期输出                                              |是否自动|测试结果|
|-------------------|------|------------|---------------------------------------------------|--------------------------------|--------------------------------|
| 拉起应用              | 	设备正常运行 | 		         | 成功拉起应用                          |是|Pass|
| 测试HintGC触发  | 执行用例 | 执行无需输入     | 点击'触发HintGC'按钮调用ArkTools.hintGC()完成    |是|Pass|
| HintGC调用守卫（HintGcGuard，11条） | 设备正常运行 | 单次/连续/异步/分配压力下调用ArkTools.hintGC() | 调用不抛异常、GC计数单调不减、被释放对象最终被回收、被持有对象不被回收 |是|Pass|
| 循环引用组合（CyclicReferenceMatrix，12条） | 设备正常运行 | 父子互引、2~10000节点环、不同负载、全连接网格、树形回指、闭包/Map/数组自引用 | 释放后WeakRef被清空、FinalizationRegistry回调token完整，环与网格结构在释放前正确闭合 |是|Pass|
| 循环引用时序（CyclicReferenceSequence，10条） | 设备正常运行 | 持有-释放、部分释放、unregister、分阶段释放、反复重建、闭包持有 | 仍持有的循环不被回收，释放的循环被回收，unregister后的对象不再上报 |是|Pass|
| GC统计表（GcRuntimeStatTable，10条） | 设备正常运行 | hidebug.getVMRuntimeStat五个统计键、非法键、近似键 | 统计值为有限非负数且单调不减，非法键返回401，保留内存期间GC后数组完好且已分配减已释放字节不低于保留量 |是|Pass|
| VM内存不变量（VmMemoryInvariant，5条） | 设备正常运行 | 保留8MB/16MB数组、分配垃圾、20次采样 | used不超过total，对象占用覆盖持有载荷，分配字节增量覆盖新增载荷，数组内容保持完整 |是|Pass|
| 包配置守卫（BundleConfigGuard，12条） | 设备正常运行 | bundleManager查询自身包、模块、Ability、备份扩展及profile | bundleName/版本/targetVersion/模块/技能/备份配置与工程配置一致，非法查询返回17700003/17700024 |是|Pass|
| 资源守卫（ResourceGuard，11条） | 设备正常运行 | 按名称/ID读取字符串、浮点、颜色、媒体与分层图标资源 | 字符串与string.json一致，深浅色背景正确，PNG头合法，非法名称返回9001003，非法ID返回9001001 |是|Pass|
| Ability生命周期（AbilityLifecycleSequence，7条） | 设备正常运行 | 拉起、终止并重启EntryAbility，监听生命周期 | 创建/窗口创建/前台与窗口销毁/销毁回调顺序正确，窗口可见且区域非空，每次重启得到新的前台实例 |是|Pass|
| 首页UI（IndexUiGuard，5条） | 设备正常运行，屏幕点亮 | 拉起首页、单击/连续点击'触发HintGC'按钮、重启应用 | 首页显示Hello World与按钮，点击后变为Success且按钮仍可用，重启后回到Hello World |是|Pass|
| WeakRef生命周期（GcWeakRefLifecycle，104条） | 设备正常运行 | 单/多WeakRef、容器持有、不同对象形状、闭包持有、释放与压力序列 | deref标识稳定，持有对象不被回收，释放对象在压力+hintGC后清空 |是|Pass|
| FinalizationRegistry（GcFinalizationRegistry，108条） | 设备正常运行 | 数字/字符串/对象token、多注册表、注册与注销交错、重复注册 | 注销后不再上报，未注销token按轮次回收，token顺序与集合一致 |是|Pass|
| 对象图完整性（GcObjectGraph，108条） | 设备正常运行 | 父子互引、链、环、全连接网格、树回指、菱形与共享子节点 | 结构与独立oracle一致，id和/长度/回指关系在GC前后正确 |是|Pass|
| GC统计采样（GcStatSampling，105条） | 设备正常运行 | 五个统计键的连续采样、压力/保留内存/异步间隔 | 计数单调不减、值有限非负、allocated≥freed、重复读稳定 |是|Pass|
| GC统计非法输入（GcStatErrorMatrix，100条） | 设备正常运行 | 空串、大小写、点号、前后缀、近似键、超长键 | 非法键返回401，合法键不受影响，统计值不因失败调用变化 |是|Pass|
| VM堆矩阵（VmHeapMatrix，112条） | 设备正常运行 | 不同载荷的保留/释放、采样序列、与GC字节计数联动 | used≤total，保留内存方向正确，释放不产生负值，比率在(0,1] |是|Pass|
| 包信息字段（BundleSelfInfo，108条） | 设备正常运行 | getBundleInfoForSelf各Flag组合与字段 | 名称/版本/模块/Ability/备份扩展与工程配置一致，Flag子集关系正确 |是|Pass|
| 字符串资源（ResourceStringMatrix，100条） | 设备正常运行 | 按名称/ID读取base与en_US字符串、非法名称/ID | 值与string.json一致，非法名称9001003，非法ID9001001 |是|Pass|
| 颜色资源（ResourceColorMatrix，115条） | 设备正常运行 | 按名称/ID读取颜色、ARGB拆解、边界颜色 | 通道0~255，alpha计算一致，深浅色取值正确 |是|Pass|
| 媒体与profile资源（ResourceMediaMatrix，118条） | 设备正常运行 | 按名称/ID读取media、分层图标、profile | PNG签名/IHDR合法，尺寸与文件一致，非法输入错误码正确 |是|Pass|
| 模块与Ability信息（BundleModuleMatrix，123条） | 设备正常运行 | HapModuleInfo、EntryAbility、备份扩展、metadata与skills | 字段与module.json5一致，模块/Ability数量与技能实体正确 |是|Pass|
| 包查询错误路径（BundleErrorMatrix，122条） | 设备正常运行 | 未知/空/近似包名、非法模块与Ability、非法Flag | 返回17700001/17700003等错误码，失败后合法查询仍成功 |是|Pass|
| Ability生命周期矩阵（AbilityLifecycleMatrix，108条） | 设备正常运行 | 拉起/终止/重启、回调顺序、生命周期搅动 | 新实例唯一、回调顺序正确、窗口阶段存在、GC计数不回退 |是|Pass|
| 窗口与显示（AbilityWindowMatrix，108条） | 设备正常运行 | 窗口矩形/可见性/避让区、显示密度与旋转 | 矩形为正、可见状态正确、避让区字段合法、显示值有限 |是|Pass|
| 应用与模块上下文（AppContextMatrix，111条） | 设备正常运行 | ApplicationContext与模块上下文、目录可写性 | bundleName与模块名正确，目录路径以 `/` 开头且可读写，重复调用稳定 |是|Pass|
| 运行时交叉校验（RuntimeIntegrationMatrix，108条） | 设备正常运行 | GC计数/字节计数/VM堆/WeakRef/资源查询联动 | 独立下界成立、计数不回退、重压后查询与拉起仍正确 |是|Pass|

说明：

1. 共26个补充测试套件、1841条规范用例，另保留原模板1条，运行器实际注册1842条。全部通过，无断言失败。
2. `ArkTools.hintGC()` 只是回收提示，用例通过“分配压力 + 多轮等待”的方式判定回收，不假设调用后立即回收。
3. 运行时观察：同一个任务（job）内创建8个及以上 WeakRef 时，其目标对象会一直保持存活，FinalizationRegistry 也不回调；每个任务内创建3个以内 WeakRef 可正常回收。相关用例只创建少量 WeakRef，其余对象改用 FinalizationRegistry token 校验。
4. 运行时观察：已经晋升到老年代的循环引用不会被及时回收，用例只校验新创建并立即释放的循环。
5. 构建观察：构建会把 `layered_image.json` 中的 `$media:名称` 改写为 `$media:资源ID`，并把分层图标前景/背景缩放为512×512，资源用例按构建产物校验。
6. `entry/src/main/ets/ReferenceCounting.ts` 没有导出任何内容，其中的 `main()` 也未被调用，因此不纳入自动化测试。
7. bundleName `com.sample.ArkTSGC` 的最后一段含大写，与签名配置中登记的包名绑定；改为全小写会导致签名校验失败（00303074），因此保留现状。
