## 标题下拉缩放案例测试用例

### 用例表

|                     测试功能                      |       预置条件       |      输入       |             预期输出              | 是否自动化 | 测试结果 |
|:---------------------------------------------:|:----------------:|:-------------:|:-----------------------------:|:-----:|:----:|
|            下拉列表，主标题逐渐变大，同时笔记数量逐渐显现            | 启动标题下拉缩放案例sample |     下拉列表      |      主标题逐渐变大，同时笔记数量逐渐显现       |  No   | Pass |
|            上滑列表，主标题逐渐变小，同时笔记数量逐渐隐藏            | 启动标题下拉缩放案例sample |     上滑列表      |      主标题逐渐变小，同时笔记数量逐渐隐藏       |  No   | Pass |
|             下拉列表一定距离停止，根据滑动距离执行回弹             | 启动标题下拉缩放案例sample | 短距离下拉列表并松开手指  |          标题栏回弹至起始状态           |  No   | Pass |
|            下拉列表一定距离停止，会根据滑动距离执行展开             | 启动标题下拉缩放案例sample | 稍长距离下拉列表并松开手指 |          标题栏展开至展开状态           |  No   | Pass |
| 标题栏展开后，继续向下滑动列表，主标题继续放大，并于笔记数量以及右侧菜单栏一起继续向下滑动 | 启动标题下拉缩放案例sample |   标题展开后下拉列表   | 主标题继续放大，并于笔记数量以及右侧菜单栏一起继续向下滑动 |  No   | Pass |

### 如何运行自动化测试

ohosTest 用例位于 `entry/src/ohosTest/ets/test/`，共 56 个套件、2551 条用例（能力套件 1 条 + 核心/UI 套件 184 条 + 数据驱动逻辑用例 2366 条），全部带 `@tc.number/@tc.name/@tc.desc/@tc.type/@tc.size/@tc.level` 六项元数据，在 `List.test.ets` 注册，由 `testability/TestAbility.ets` 加载执行。

运行方式：在 DevEco Studio 中右键 `entry/src/ohosTest/ets/test` 选择 "Run All Tests"（IDE 静态发现器只识别字符串字面量用例名，模板字符串用例不会进入 `-s class` 白名单）；设备连接后也可手工执行 `aa test -b com.samples.expandtitle -m entry_test -s unittest /ets/TestRunner/OpenHarmonyTestRunner -s class <套件名> -s timeout 15000`。

| 套件 | 编号段 | 层级/size | 覆盖内容 |
|---|---|---|---|
| ExpansionConstantsCore | 0101-0123 | 逻辑/SMALLTEST | 通用常量值与类型 |
| ExpansionConfigureCore | 0201-0229 | 逻辑/SMALLTEST | 动画配置一致性、展开/阈值/缩放语义不变式 |
| TitleAttributeModelCore | 0301-0323 | 逻辑/SMALLTEST | 标题属性数据模型（string/Resource、modifier 引用） |
| AnimationAttributeModelCore | 0401-0433 | 逻辑/SMALLTEST | 动效属性数据模型（参数快照、边界值组合） |
| MemoDataModelCore | 0501-0530 | 逻辑/SMALLTEST | 笔记数据模型与 mock 数据完整性 |
| MemoDataSourceCore | 0601-0618 | 逻辑/SMALLTEST | 懒加载数据源（取数/监听/新增） |
| IndexUiState | 0701-0710 | UI/MEDIUMTEST | 主页面核心组件与点击路径 |
| TitleExpandUiState | 0801-0810 | UI/MEDIUMTEST | 标题展开/收起手势动画核心路径 |
| TitleMenuUiState | 0901-0908 | UI/MEDIUMTEST | 菜单按钮存在性与点击交互 |

## 逻辑用例（数据驱动）

以下 2366 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| Constants（常量契约） | 无 | 23 组输入（ExpandTitle_ConstantsValues_0001~0023） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new AnimationAttribute（构造） | 无 | 116 组输入（ExpandTitle_AnimationAttributeCtor_0001~0116） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| Configure（常量契约） | 无 | 5 组输入（ExpandTitle_ConfigureValues_0001~0005） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MemoDataSource.totalCount（实例方法） | 无 | 1 组输入（ExpandTitle_MemoDataSourceTotalCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MemoDataSource.getData（实例方法） | 无 | 120 组输入（ExpandTitle_MemoDataSourceGetData_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new MemoInfo（构造） | 无 | 110 组输入（ExpandTitle_MemoInfoCtor_0001~0110） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| thresholdOf（函数） | 无 | 243 组输入（ExpandTitle_ThresholdOf_0001~0243） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| heightChangeOf（函数） | 无 | 242 组输入（ExpandTitle_HeightChangeOf_0001~0242） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| scaleRatioOf（函数） | 无 | 242 组输入（ExpandTitle_ScaleRatioOf_0001~0242） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| titleOpacityOf（函数） | 无 | 242 组输入（ExpandTitle_TitleOpacityOf_0001~0242） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| translateYOf（函数） | 无 | 120 组输入（ExpandTitle_TranslateYOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| listOffsetOf（函数） | 无 | 242 组输入（ExpandTitle_ListOffsetOf_0001~0242） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| settleHeightOf（函数） | 无 | 50 组输入（ExpandTitle_SettleHeightOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| defaultAttribute（函数） | 无 | 1 组输入（ExpandTitle_DefaultAttribute_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new ThrottleGate（构造） | 无 | 1 组输入（ExpandTitle_ThrottleGateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ThrottleGate.request（实例方法） | 无 | 120 组输入（ExpandTitle_ThrottleGateRequest_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new TitleExpansionState（构造） | 无 | 1 组输入（ExpandTitle_TitleExpansionStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TitleExpansionState.didScroll（实例方法） | 无 | 120 组输入（ExpandTitle_TitleExpansionStateDidScroll_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TitleExpansionState.frameBegin（实例方法） | 无 | 120 组输入（ExpandTitle_TitleExpansionStateFrameBegin_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TitleExpansionState.stop（实例方法） | 无 | 1 组输入（ExpandTitle_TitleExpansionStateStop_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TitleExpansionState.scale（实例方法） | 无 | 1 组输入（ExpandTitle_TitleExpansionStateScale_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TitleExpansionState.opacity（实例方法） | 无 | 1 组输入（ExpandTitle_TitleExpansionStateOpacity_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TitleExpansionState flow（调用序列） | 无 | 242 组输入（ExpandTitle_TitleExpansionStateFlow_0001~0242） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MockData（常量契约） | 无 | 1 组输入（ExpandTitle_MockDataConstants_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TitleExpansionLogic（常量契约） | 无 | 1 组输入（ExpandTitle_TitleExpansionLogicConstants_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
