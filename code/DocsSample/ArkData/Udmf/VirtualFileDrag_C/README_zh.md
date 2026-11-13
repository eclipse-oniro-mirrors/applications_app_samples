# 虚拟文件拖拽（C API）

### 介绍

本示例展示通过拖拽导出尚未准备好完整内容的文件或目录。提供方先声明文件树和准确大小，再通过读取回调按需提供内容；目标应用使用普通文件接口读取。

对应指南：[拖拽事件：虚拟文件拖拽](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/ndk-drag-event.md#虚拟文件拖拽)。

应用包名：`com.samples.virtualfiledragc`。

### 效果预览

界面上方为三个场景按钮，下方蓝色区域用于拖出文件，绿色区域用于获取落入文件的 URI。

### 使用说明

1. 使用支持 API 26.1.0 的 OpenHarmony SDK 和 Hvigor 6.0.0 的 DevEco Studio 打开本工程，同步依赖，配置开发签名后编译安装。本工程不携带个人签名材料。
2. 设备 ROM 必须已支持 UDMF 虚拟文件拖拽及沙箱配置；仅补充 SDK 声明不能使旧 ROM 具备此能力。建议使用支持鼠标拖拽的 PC 形态或可分屏设备。
3. 默认选择文档，可通过“文档”“目录”“按需解压”三个按钮切换场景。选择“按需解压”后，文件内容在第一次读取时由 C 回调解压。按钮顺序、拖出区域和接收区域与动态接口示例一致。
4. 长按蓝色区域拖出。此区域由 Native ArkUI 创建，通过 OH_ArkUI_DragEvent_SetData 设置 C 接口创建的数据。
5. 将蓝色区域拖到文件管理器或支持接收文件的桌面位置，保存后打开核对内容。也可分别安装两个示例，分屏后互相拖入绿色接收区。
6. 绿色接收区只获取 URI 并交给业务回调，显示接收数量；读取、复制、保存或打开由业务决定。

### 工程目录

```text
AppScope/                 应用标识及矢量图标
entry/src/main/           页面、数据提供方与资源
entry/src/ohosTest/       场景切换测试及测试入口
ohosTest.md               自动化与人工验证说明
```

- [app_icon.svg](AppScope/resources/base/media/app_icon.svg)：手绘矢量图标，供应用图标和启动图标共用。
- [Index.ets](entry/src/main/ets/pages/Index.ets)：场景选择、拖起区和文件 URI 接收区。
- [virtual_file_provider.cpp](entry/src/main/cpp/virtual_file_provider.cpp)：虚拟节点、stat/read/cancel/finalize 回调与数据组装。
- [napi_init.cpp](entry/src/main/cpp/napi_init.cpp)：NAPI 场景配置、Native ArkUI 拖拽及清理。
- [virtual_file_receiver.cpp](entry/src/main/cpp/virtual_file_receiver.cpp)：通过C接口获取落入数据并复制 URI 字符串，交给业务处理。
- [ohosTest.md](ohosTest.md)：人工验证步骤和预期现象。

### 具体实现

建议先选择默认的“文档”场景，按以下顺序阅读。虚拟文件接口集中在`virtual_file_provider.cpp`，URI 获取集中在`virtual_file_receiver.cpp`；Native ArkUI 布局和 NAPI 参数转换位于`napi_init.cpp`。

```text
NODE_ON_DRAG_START
  → CreateVirtualDragData()：节点 → VirtualFileInfo → FileUri → Record → Data
  → OH_ArkUI_DragEvent_SetData()
  → NODE_ON_DROP：GetDroppedFileUris()
  → NotifyUris() → handleUris() 交给业务处理
```

| 接口 | 如何使用 | 对应代码 |
| --- | --- | --- |
| `OH_UDMF_CreateVirtualFileItem`、`OH_UDMF_SetVirtualFileSize` | 创建文件节点，设置名称、id、修改时间和准确大小。 | `CreateFileItem()` |
| `OH_UDMF_CreateVirtualDirectoryItem` | 创建目录节点。 | `CreateRoot()` |
| `OH_UDMF_AddVirtualItemChild` | 将子节点复制到目录，之后释放调用方持有的原子节点。 | `AddChildAndDestroy()` |
| `OH_UDMF_VirtualFileCallbacks` | structSize 设置为 sizeof(callbacks)，onRead 必选，onStat 和 onCancel 可选。 | `CreateVirtualDragData()` |
| `OH_UDMF_VirtualFileOnStat` | 返回通过创建接口获得的新文件节点，返回后由 UDMF 接管。 | `OnStat()` |
| `OH_UDMF_VirtualFileOnRead` | 将请求范围的内容写入 data，用 bytesRead 输出字节数，函数返回状态码；不保存或释放 data。 | `OnRead()` |
| `OH_UDMF_VirtualFileOnCancel` | 停止对应 id 当前待处理的任务。本地示例没有额外的可取消任务，直接返回成功。 | `OnCancel()` |
| `OH_UDMF_CreateVirtualFileInfo` | 关联根节点、回调及 context；创建成功后由 UDMF 管理 context，最终调用 finalize。 | `CreateVirtualDragData()` |
| `OH_UDMF_VirtualFileFinalize` | 释放业务上下文及其数据源。示例的 Finalize 回调负责删除 ProviderContext。 | `Finalize()` |
| `OH_UdsFileUri_Create`、`OH_UdsFileUri_SetFileUri`、`OH_UdsFileUri_SetFileType` | 创建 FileUri，填写非空占位 URI 和文件类型；普通文件使用 general.file，目录使用 general.directory。 | `CreateVirtualDragData()` |
| `OH_UDMF_SetFileUriVirtualEntry` | 将 VirtualFileInfo 附加到 FileUri，再通过 Record、Data 设置拖拽数据。 | `CreateVirtualDragData()` |
| `OH_UDMF_ClearFileUriVirtualEntry` | 解除指定 FileUri 的附加关系，不影响此前已放入 Record 的独立引用。 | `CreateVirtualDragData()` 的临时对象清理 |
| `OH_UDMF_DestroyVirtualItem`、`OH_UDMF_DestroyVirtualFileInfo` | 释放调用方持有的节点或包装对象；其他对象持有的独立引用仍然有效。 | `CreateFileItem()`、`AddChildAndDestroy()`、`CreateVirtualDragData()` |
| `OH_ArkUI_DragEvent_SetData` | 在起拖事件设置统一数据，并将该 Data 保留到拖拽结束。 | `napi_init.cpp`：`OnNodeEvent()` |
| `OH_ArkUI_DragEvent_GetUdmfData`、`OH_UdmfRecord_GetFileUri`、`OH_UdsFileUri_GetFileUri` | 在落入事件提取 URI，销毁临时对象前复制字符串。 | `GetDroppedFileUris()` |

资源释放需要区分三个时机：

1. 节点被复制后，释放原节点；FileUri 被加入 Record 后，可以清理临时 FileUri 和 VirtualFileInfo 包装对象。
2. `OH_ArkUI_DragEvent_SetData()`暂存 Data 指针，拖拽结束后再销毁该 Data。
3. 业务 context 由成功创建的 VirtualFileInfo 管理，不能在拖拽结束时直接删除；由最终的 Finalize 回调释放。创建失败时，示例中的 unique_ptr 自动清理尚未交给 UDMF 的 context。

`ProviderContext`、`SourceFile`和`PrepareFileContent()`属于示例数据源，不是 SDK 接口。按需解压场景在准备阶段压缩少量文本，到 onRead 时解压。业务可替换该函数，从自己的文件、压缩内容或网络资源提供字节数据。

绿色接收区仅提取 URI 并交给`handleUris()`。读取、复制、保存或打开由业务决定，不在示例中自动执行。

### 接口用法和约束

- size 必须准确、非负，空文件为 0；modifyTime 使用毫秒时间戳。不同内容使用不同 id，同一文件各次读取使用同一个 id。
- onRead 从 offset 开始提供不超过 length 的字节；length 不是已读取长度。成功到达末尾才返回空数据，失败不能用空数据伪装 EOF。
- onStat 返回文件元数据；声明准确大小后，普通 stat 不保证每次都调用 onStat，不能据此判断失败。
- onCancel 取消当前待处理任务，应允许重复通知，不能永久禁止同一 id 的后续读取；用户中止拖拽不保证一定触发该回调。本示例无异步读取任务，回调直接返回成功。
- CreateVirtualFileInfo 成功后 context 由 UDMF 管理，最终调用 finalize；失败时由调用方释放。AddVirtualItemChild 复制 child，原 child 仍需销毁。FileUri/Record 持有独立引用，可以清理临时包装对象；交给 ArkUI 的 OH_UdmfData 保留到拖拽结束。
- 示例未申请后台保活能力。实际应用应根据后台运行条件保障提供数据期间的可用性；提供方退出或回调失败会导致目标读取失败。
- C 压缩场景使用 zlib 内存压缩流，展示按需解压，不是完整 ZIP 归档浏览器。

### 权限与依赖

不涉及额外权限。使用 SDK 提供的 UDMF、Native ArkUI、NAPI 和 zlib 库。采用 Stage 模型和动态 ArkTS，不包含 ArkTS 1.2 静态接口。

### 资料同源

指南直接引用本工程的 `[Start virtual_drag_...]` / `[End virtual_drag_...]` 标记段。调整调用时，应同步更新指南中对应 `@[标记名](源码链接)` 后的代码块，不能只修改文档副本。

### 下载命令

```shell
git clone --filter=blob:none --sparse --branch master https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout set code/DocsSample/ArkData/Udmf/VirtualFileDrag_C
```

### 自动化验证

工程通过 Hypium 1.0.24 提供三个场景切换用例，可在 DevEco Studio 中运行 `entry/src/ohosTest/ets/test/Ability.test.ets`。跨应用保存、内容读取和重复拖拽仍按 [ohosTest.md](ohosTest.md) 人工验证。
