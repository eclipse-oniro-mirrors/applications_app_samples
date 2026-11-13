# 虚拟文件拖拽（动态 ArkTS 接口）

### 介绍

本示例展示通过拖拽导出尚未准备好完整内容的文件或目录。提供方先声明文件树和准确大小，再通过读取回调按需提供内容；目标应用使用普通文件接口读取。

对应指南：[拖拽事件：虚拟文件拖拽](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-common-events-drag-event.md#虚拟文件拖拽)。

应用包名：`com.samples.virtualfiledrag`。

### 效果预览

界面上方为三个场景按钮，下方蓝色区域用于拖出文件，绿色区域用于获取落入文件的 URI。

### 使用说明

1. 使用支持 API 26.1.0 的 OpenHarmony SDK 和 Hvigor 6.0.0 的 DevEco Studio 打开本工程，同步依赖，配置开发签名后编译安装。本工程不携带个人签名材料。
2. 设备 ROM 必须已支持 UDMF 虚拟文件拖拽及沙箱配置；仅补充 SDK 声明不能使旧 ROM 具备此能力。建议使用支持鼠标拖拽的 PC 形态或可分屏设备。
3. 默认选择文档，可切换“文档”“目录”或“按需解压”，等候元数据准备完成。ZIP 来自工程自带的 documents.zip，只有第一次读取时才解压。
4. 将蓝色区域拖到文件管理器或支持接收文件的桌面位置，保存后打开核对内容。也可分别安装两个示例，分屏后互相拖入绿色接收区。
5. 绿色接收区只获取 URI 并交给业务回调，显示接收数量；读取、复制、保存或打开由业务决定。

### 工程目录

```text
AppScope/                 应用标识及矢量图标
entry/src/main/           页面、数据提供方与资源
entry/src/ohosTest/       场景切换测试及测试入口
ohosTest.md               自动化与人工验证说明
```

- [app_icon.svg](AppScope/resources/base/media/app_icon.svg)：手绘矢量图标，供应用图标和启动图标共用。
- [Index.ets](entry/src/main/ets/pages/Index.ets)：场景选择、拖起区和文件 URI 接收区。
- [VirtualFileProvider.ets](entry/src/main/ets/model/VirtualFileProvider.ets)：文件树、stat/read/cancel 回调和延迟解压。
- [documents.zip](entry/src/main/resources/rawfile/documents.zip)：内含 106 字节的 archive-note.txt，用于按需解压验证。
- [DropReceiver.ets](entry/src/main/ets/model/DropReceiver.ets)：获取落入文件的 URI 列表，交给业务处理。
- [ohosTest.md](ohosTest.md)：人工验证步骤和预期现象。

### 具体实现

建议先选择默认的“文档”场景，按以下顺序阅读。目录场景只改变节点树，按需解压场景只改变内容来源，拖拽接口的调用方式相同。

```text
prepareDocuments() 声明文件信息
  → createVirtualEntry() 绑定内容回调
  → createDragData() 附加到 FileUri.virtualEntry
  → onDragStart：event.setData()
  → onDrop：getDroppedFileUris()
  → handleUris() 交给业务处理
```

| 接口或类型 | 如何使用 | 对应代码 |
| --- | --- | --- |
| `VirtualFileItem` | 设置文件名、id、准确的 size 和毫秒时间戳 modifyTime。id 用于回调查找数据源。 | `VirtualFileProvider.ets`：`prepareDocuments()` |
| `VirtualDirItem`、`VirtualItemType` | 用 subItems 放置文件或子目录；根节点可以是文件，也可以是目录。 | `VirtualFileProvider.ets`：`prepareDocuments()` |
| `VirtualFileInfo` | itemInfo 指定根节点，onRead 提供内容，onStat 和 onCancel 按需设置。 | `VirtualFileProvider.ets`：`createVirtualEntry()` |
| `onStat(id)` | 返回该 id 对应文件的信息。 | `createVirtualEntry()` 中的 onStat |
| `onRead(id, offset, length)` | 返回从 offset 开始的内容，最多 length 字节；到末尾返回空数组，失败时抛出异常使 Promise 拒绝。 | `createVirtualEntry()` 中的 onRead |
| `onCancel(ids)` | 取消这些 id 当前待处理的任务。本地示例没有额外的可取消任务，回调为空实现并说明原因。 | `createVirtualEntry()` 中的 onCancel |
| `FileUri.virtualEntry` | 附加 VirtualFileInfo，设置文件或目录的 fileType，并填写非空占位 oriUri。占位路径不要求对应真实文件。 | `Index.ets`：`createDragData()` |
| `UnifiedRecord`、`UnifiedData`、`DragEvent.setData()` | 将 FileUri 作为文件记录放入统一数据，在起拖回调中设置。 | `Index.ets`：`createDragData()`、`onDragStart` |
| `DragEvent.getData()`、`getRecords()`、`getEntry()` | 在落入回调中取得实际返回的文件 URI；不使用起拖方的占位 URI。 | `DropReceiver.ets`：`getDroppedFileUris()` |

`SourceFile`和`sources`是示例自己的数据源及索引，不是 SDK 接口。`prepareArchive()`把自带 ZIP 放入应用目录，`readArchive()`在读取时解压并读取指定范围，业务可将这部分替换为自己的内容获取方式。

绿色接收区只把 URI 传给`handleUris()`，获取 URI 本身不会触发内容读取。需要验证 onRead 时，将文件拖到文件管理器等会实际打开并读取文件的应用。

### 接口用法和约束

- size 必须准确、非负，空文件为 0；modifyTime 使用毫秒时间戳。不同内容使用不同 id，同一文件各次读取使用同一个 id。
- onRead 从 offset 开始提供不超过 length 的字节；length 不是已读取长度。成功到达末尾才返回空数据，失败不能用空数据伪装 EOF。
- onStat 返回文件元数据；声明准确大小后，普通 stat 不保证每次都调用 onStat，不能据此判断失败。
- onCancel 取消当前待处理任务，应允许重复通知，不能永久禁止同一 id 的后续读取；用户中止拖拽不保证一定触发该回调。本地读取没有额外的可取消任务，示例保留该回调的用法。
- 通过 FileUri.virtualEntry 附加节点和回调，在 onDragStart 设置 UnifiedData，无须先调用 insertData。拖拽结束不代表目标读取完成，不在 onDragEnd 中取消读取。
- 示例未申请后台保活能力。实际应用应根据后台运行条件保障提供数据期间的可用性；提供方退出或回调失败会导致目标读取失败。
- ZIP 场景使用受控资源及已知大小；演示缓存位于应用私有目录，测试结束可清除应用数据。

### 权限与依赖

不涉及额外权限。使用 SDK 提供的 UDMF、文件和 zlib 接口，无第三方依赖。采用 Stage 模型和动态 ArkTS，不包含 ArkTS 1.2 静态接口。

### 资料同源

指南直接引用本工程的 `[Start virtual_drag_...]` / `[End virtual_drag_...]` 标记段。调整调用时，应同步更新指南中对应 `@[标记名](源码链接)` 后的代码块，不能只修改文档副本。

### 下载命令

```shell
git clone --filter=blob:none --sparse --branch master https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout set code/DocsSample/ArkData/Udmf/VirtualFileDrag
```

### 自动化验证

工程通过 Hypium 1.0.24 提供三个场景切换用例，可在 DevEco Studio 中运行 `entry/src/ohosTest/ets/test/Ability.test.ets`。跨应用保存、内容读取和重复拖拽仍按 [ohosTest.md](ohosTest.md) 人工验证。
