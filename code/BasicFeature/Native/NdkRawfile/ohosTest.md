|测试功能|预置条件|输入| 预期输出                                        |测试结果|
|--------------------------------|--------------------------------|--------------------------------|---------------------------------------------|--------------------------------|
|拉起应用|	设备正常运行|		| 成功拉起应用                                      |Pass|
|进入主页|	位于主页|	| 	展示通过Native接口获取Rawfile资源的调用结果 |Pass|

## 逻辑用例（数据驱动）

以下 2601 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| seekApplies（函数） | 无 | 50 组输入（NdkRawfile_SeekApplies_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| readLengthOf（函数） | 无 | 166 组输入（NdkRawfile_ReadLengthOf_0001~0166） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| readStartOf（函数） | 无 | 166 组输入（NdkRawfile_ReadStartOf_0001~0166） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| bytesReadOf（函数） | 无 | 166 组输入（NdkRawfile_BytesReadOf_0001~0166） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| bufferLengthOf（函数） | 无 | 120 组输入（NdkRawfile_BufferLengthOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| paddingBytesOf（函数） | 无 | 166 组输入（NdkRawfile_PaddingBytesOf_0001~0166） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| decodedContentOf（函数） | 无 | 166 组输入（NdkRawfile_DecodedContentOf_0001~0166） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| visibleContentOf（函数） | 无 | 166 组输入（NdkRawfile_VisibleContentOf_0001~0166） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| receivedFileNameOf（函数） | 无 | 90 组输入（NdkRawfile_ReceivedFileNameOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| fileListJsonOf（函数） | 无 | 8 组输入（NdkRawfile_FileListJsonOf_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| fileListLabelOf（函数） | 无 | 90 组输入（NdkRawfile_FileListLabelOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| contentLabelOf（函数） | 无 | 90 组输入（NdkRawfile_ContentLabelOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| offsetContentLabelOf（函数） | 无 | 90 组输入（NdkRawfile_OffsetContentLabelOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| content64LabelOf（函数） | 无 | 90 组输入（NdkRawfile_Content64LabelOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| offsetContent64LabelOf（函数） | 无 | 90 组输入（NdkRawfile_OffsetContent64LabelOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| descriptorLabelOf（函数） | 无 | 166 组输入（NdkRawfile_DescriptorLabelOf_0001~0166） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| shouldRelease（函数） | 无 | 50 组输入（NdkRawfile_ShouldRelease_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| descriptorEndOf（函数） | 无 | 166 组输入（NdkRawfile_DescriptorEndOf_0001~0166） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new RawfilePageState（构造） | 无 | 1 组输入（NdkRawfile_RawfilePageStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RawfilePageState.appear（实例方法） | 无 | 165 组输入（NdkRawfile_RawfilePageStateAppear_0001~0165） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RawfilePageState.openDescriptors（实例方法） | 无 | 165 组输入（NdkRawfile_RawfilePageStateOpenDescriptors_0001~0165） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RawfilePageState.disappear（实例方法） | 无 | 1 组输入（NdkRawfile_RawfilePageStateDisappear_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RawfilePageState.listLabel（实例方法） | 无 | 1 组输入（NdkRawfile_RawfilePageStateListLabel_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RawfilePageState flow（调用序列） | 无 | 165 组输入（NdkRawfile_RawfilePageStateFlow_0001~0165） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NdkRawfileLogic（常量契约） | 无 | 7 组输入（NdkRawfile_NdkRawfileLogicConstants_0001~0007） | 返回值与状态逐条符合预期 | 是 | 待执行 |
