# 虚拟文件拖拽（C API）

### 介绍

本示例展示通过拖拽导出尚未准备好完整内容的文件或目录。提供方先声明文件树和准确大小，再通过读取回调按需提供内容；目标应用使用普通文件接口读取。

对应指南：[拖拽事件：虚拟文件拖拽](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/ndk-drag-event.md#虚拟文件拖拽)。

### 使用说明

1. 使用支持 API 26.1.0 的 OpenHarmony SDK 和 Hvigor 6.0.0 的 DevEco Studio 打开本工程，同步依赖，配置开发签名后编译安装。本工程不携带个人签名材料。
2. 设备 ROM 必须已支持 UDMF 虚拟文件拖拽及沙箱配置；仅补充 SDK 声明不能使旧 ROM 具备此能力。建议使用支持鼠标拖拽的 PC 形态或可分屏设备。
3. 默认选择文档，可通过“文档”“目录”“按需解压”三个按钮切换场景。选择“按需解压”后，文件内容在第一次读取时由 C 回调解压。按钮顺序、拖出区域和接收区域与动态接口示例一致。
4. 长按蓝色区域拖出。此区域由 Native ArkUI 创建，通过 OH_ArkUI_DragEvent_SetData 设置 C 接口创建的数据。
5. 将蓝色区域拖到文件管理器或支持接收文件的桌面位置，保存后打开核对内容。也可分别安装两个示例，分屏后互相拖入绿色接收区。
6. 绿色接收区只获取 URI 并交给业务回调，显示接收数量；读取、复制、保存或打开由业务决定。

### 工程目录

- [Index.ets](entry/src/main/ets/pages/Index.ets)：场景选择、拖起区和文件 URI 接收区。
- [virtual_file_provider.cpp](entry/src/main/cpp/virtual_file_provider.cpp)：虚拟节点、stat/read/cancel/finalize 回调与数据组装。
- [napi_init.cpp](entry/src/main/cpp/napi_init.cpp)：NAPI 场景配置、Native ArkUI 拖拽及清理。
- [virtual_file_receiver.cpp](entry/src/main/cpp/virtual_file_receiver.cpp)：通过C接口获取落入数据并复制 URI 字符串，交给业务处理。
- [ohosTest.md](ohosTest.md)：人工验证步骤和预期现象。

### 接口用法和约束

- size 必须准确、非负，空文件为 0；modifyTime 使用毫秒时间戳。不同内容使用不同 id，同一文件各次读取使用同一个 id。
- onRead 从 offset 开始提供不超过 length 的字节；length 不是已读取长度。成功到达末尾才返回空数据，失败不能用空数据伪装 EOF。
- onStat 返回文件元数据；声明准确大小后，普通 stat 不保证每次都调用 onStat，不能据此判断失败。
- onCancel 取消当前待处理任务，应允许重复通知，不能永久禁止同一 id 的后续读取；用户中止拖拽不保证一定触发该回调。本示例无异步读取任务，回调记录通知并返回成功。
- CreateVirtualFileInfo 成功后 context 由 UDMF 管理，最终调用 finalize；失败时由调用方释放。AddVirtualItemChild 复制 child，原 child 仍需销毁。FileUri/Record 持有独立引用，可以清理临时包装对象；交给 ArkUI 的 OH_UdmfData 保留到拖拽结束。
- 示例未申请后台保活能力。实际应用应根据后台运行条件保障提供数据期间的可用性；提供方退出或回调失败会导致目标读取失败。
- C 压缩场景使用 zlib 内存压缩流，展示按需解压，不是完整 ZIP 归档浏览器。

### 权限与依赖

不涉及额外权限。使用 SDK 提供的 UDMF、Native ArkUI、NAPI、HiLog和 zlib 库。采用 Stage 模型和动态 ArkTS，不包含 ArkTS 1.2 静态接口。

### 资料同源

指南直接引用本工程的 `[Start virtual_drag_...]` / `[End virtual_drag_...]` 标记段。调整调用时，应同步更新指南中对应 `@[标记名](源码链接)` 后的代码块，不能只修改文档副本。
