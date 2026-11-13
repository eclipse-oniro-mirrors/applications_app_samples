# 虚拟文件拖拽（动态 ArkTS 接口）

### 介绍

本示例展示通过拖拽导出尚未准备好完整内容的文件或目录。提供方先声明文件树和准确大小，再通过读取回调按需提供内容；目标应用使用普通文件接口读取。

对应指南：[拖拽事件：虚拟文件拖拽](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-common-events-drag-event.md#虚拟文件拖拽)。

### 使用说明

1. 使用支持 API 26.1.0 的 OpenHarmony SDK 和 Hvigor 6.0.0 的 DevEco Studio 打开本工程，同步依赖，配置开发签名后编译安装。本工程不携带个人签名材料。
2. 设备 ROM 必须已支持 UDMF 虚拟文件拖拽及沙箱配置；仅补充 SDK 声明不能使旧 ROM 具备此能力。建议使用支持鼠标拖拽的 PC 形态或可分屏设备。
3. 默认选择文档，可切换“文档”“目录”或“按需解压”，等候元数据准备完成。ZIP 来自工程自带的 documents.zip，只有第一次读取时才解压。
4. 将蓝色区域拖到文件管理器或支持接收文件的桌面位置，保存后打开核对内容。也可分别安装两个示例，分屏后互相拖入绿色接收区。
5. 接收区仅以简短提示反馈保存成功或失败，不显示日志。文件保存在应用私有 filesDir 下的 received-<时间戳> 目录。

### 工程目录

- [Index.ets](entry/src/main/ets/pages/Index.ets)：场景选择、拖起区和普通文件接收区。
- [VirtualFileProvider.ets](entry/src/main/ets/model/VirtualFileProvider.ets)：文件树、stat/read/cancel 回调和延迟解压。
- [documents.zip](entry/src/main/resources/rawfile/documents.zip)：内含 106 字节的 archive-note.txt，用于按需解压验证。
- [DropReceiver.ets](entry/src/main/ets/model/DropReceiver.ets)：使用异步普通文件 API 遍历、读取、复制拖入的文件。
- [ohosTest.md](ohosTest.md)：人工验证步骤和预期现象。

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
