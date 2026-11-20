# DLP文件添加展示案例

## 用例表l

| 测试功能                   | 预置条件                                              | 输入                | 预期输出                                                                                     | 是否自动 |测试结果|
|------------------------|---------------------------------------------------|-------------------|------------------------------------------------------------------------------------------|------|--------------------------------|
| DLP文件添加展示案例正常打开        | 	开发者手动生成DLP文件                                     | 	点击【DLP文件添加展示案例】	 | 进入会出现【DLP文件添加展示案例】页面                                                                     | 否    |Pass|
| 添加DLP文件                | 	开发者手动生成DLP文件                                     | 	点击加号             | 点击右上角加号打开文件管理。<br/>选择开发者手动生成的DLP文件，可选择三个文件<br/>选中DLP文件后，点击确定<br/>【DLP文件添加展示案例】页面展示对应文件列表 | 否    |Pass|
| 打开DLP文件                | 	案例成功添加DLP文件列表                                    | 	点击列表             | 点击列表会打开文件预览显示DLP文件                                                                       | 否    |Pass|

## 逻辑用例（数据驱动）

以下 2586 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| viewWantOf（函数） | 无 | 90 组输入（FilePreviewDLP_ViewWantOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| viewWantJsonOf（函数） | 无 | 90 组输入（FilePreviewDLP_ViewWantJsonOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| acceptedCountOf（函数） | 无 | 100 组输入（FilePreviewDLP_AcceptedCountOf_0001~0100） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| appendSelection（函数） | 无 | 64 组输入（FilePreviewDLP_AppendSelection_0001~0064） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| countAfterSelection（函数） | 无 | 267 组输入（FilePreviewDLP_CountAfterSelection_0001~0267） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| itemTitleOf（函数） | 无 | 120 组输入（FilePreviewDLP_ItemTitleOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| twoDigits（函数） | 无 | 120 组输入（FilePreviewDLP_TwoDigits_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| formatDate（函数） | 无 | 267 组输入（FilePreviewDLP_FormatDate_0001~0267） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| formatDateFromMonthIndex（函数） | 无 | 266 组输入（FilePreviewDLP_FormatDateFromMonthIndex_0001~0266） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| formatSize（函数） | 无 | 120 组输入（FilePreviewDLP_FormatSize_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| sizeValueOf（函数） | 无 | 120 组输入（FilePreviewDLP_SizeValueOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| errorMessageOf（函数） | 无 | 266 组输入（FilePreviewDLP_ErrorMessageOf_0001~0266） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| itemKeyOf（函数） | 无 | 266 组输入（FilePreviewDLP_ItemKeyOf_0001~0266） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new DlpListState（构造） | 无 | 1 组输入（FilePreviewDLP_DlpListStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DlpListState.select（实例方法） | 无 | 8 组输入（FilePreviewDLP_DlpListStateSelect_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DlpListState.view（实例方法） | 无 | 30 组输入（FilePreviewDLP_DlpListStateView_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DlpListState.sift（实例方法） | 无 | 1 组输入（FilePreviewDLP_DlpListStateSift_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DlpListState.titleAt（实例方法） | 无 | 120 组输入（FilePreviewDLP_DlpListStateTitleAt_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DlpListState flow（调用序列） | 无 | 266 组输入（FilePreviewDLP_DlpListStateFlow_0001~0266） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FilePreviewDlpLogic（常量契约） | 无 | 4 组输入（FilePreviewDLP_FilePreviewDlpLogicConstants_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
