# OEServerDemo

### 介绍

本示例展示了[OH_ContentEmbed](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-content-embed-kit/capi-contentembed.md)内容嵌入模块服务端的开发方法：作为OE（Object Editor）客户端的服务端，通过[ContentEmbedKit](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-content-embed-kit/capi-content-embed-extension-h.md)提供的Native接口，向客户端应用提供`.aaa`自定义格式文档的嵌入与协同编辑能力。

本示例完整演示OE服务端开发流程，主要包含：

1. 在`module.json5`中声明`type: "contentEmbed"`类型的ExtensionAbility（`OEExtAbility`），并通过`content_embed_config.json`配置oeid与支持的文件扩展名。
2. 在`OH_AbilityRuntime_OnNativeExtensionCreate`中获取OE Extension实例，注册生命周期回调（`OnCreate`.`OnDestroy`.`OnObjectAttach`.`OnObjectDetach`）及客户端请求回调（`OnWriteToDataStream`.`OnGetSnapshot`.`OnDoEdit`.`OnGetCapability`.`OnGetEditStatus`）。
3. 通过`OH_ContentEmbed_Extension_ContextStartSelfUIAbility`拉起UIAbility（`EntryAbility`，launchType为`specified`），UIAbility内嵌ArkUI `RichEditor`组件完成`.aaa`纯文本文档的加载.编辑.回写与快照生成。
4. 通过NAPI模块（`libcomm.so`）将UIAbility侧的保存.停止.对象存活查询等操作桥接到Native侧的OE Extension实例，触发`OH_ContentEmbed_Extension_CallbackToOnUpdate`等回调通知客户端。

应用包名：`com.samples.oeserverdemo`，对应SysCap：`SystemCapability.ContentEmbed.ObjectEditor`。

### 效果展示

本应用作为OE服务端运行，等待OE客户端应用（如OEClientDemo）通过`OH_ContentEmbed_Proxy_StartWork`发起请求后，由本应用拉起`EntryAbility`展示基于`RichEditor`的文档编辑界面。编辑界面提供打开.保存.快照.另存为.OLE另存为工具栏，用户可在编辑器中输入文字，编辑完成后点击保存将内容同步回客户端嵌入位置。`.aaa`文档为UTF-8纯文本格式，保存时由`RichEditorController.getSpans()`收集文本span并直接写入目标URI，无压缩.无中间资源目录。

### 工程目录

```text
entry/src/main/
├── cpp/
│   ├── ole_ext_ability.cpp         // OE Extension入口与全部服务端回调实现
│   ├── napi_init.cpp               // NAPI模块注册，导出save/update/start/stop/isObjectAlive
│   ├── CMakeLists.txt              // CMake构建配置
│   └── types/libcomm/Index.d.ts    // NAPI接口声明，供ArkTS侧import libcomm.so使用
├── ets/
│   ├── abilitystage/
│   │   └── EntryAbilityStage.ets   // AbilityStage，onAcceptWant返回objectKey作为specified复用key
│   ├── entryability/
│   │   └── EntryAbility.ets         // UIAbility，读取Want参数转存LocalStorage并加载pages/Index
│   ├── entrybackupability/
│   │   └── EntryBackupAbility.ets  // 备份Extension
│   ├── common/
│   │   └── Logger.ets              // 日志封装，统一TAG前缀[Sample_OEServerDemo]
│   └── pages/
│       └── Index.ets               // 主页面，ArkUI RichEditor编辑器与纯文本文档编辑逻辑
├── resources/
│   ├── base/profile/
│   │   ├── content_embed_config.json  // OE Extension配置，声明oeid与.aaa扩展名
│   │   ├── main_pages.json            // 页面路由配置
│   │   └── backup_config.json         // 备份配置
│   ├── base/element/string.json       // 字符串资源（base/en/zh三套）
│   ├── rawfile/
│   │   └── arkdata/utd/utd.json5     // 自定义UTD类型声明 com.samples.oeserverdemo.aaa
│   └── resfile/default_snapshot.png   // 默认快照图片
└── module.json5                       // 模块配置，声明OEExtAbility与EntryAbility
```

### 使用说明

1. **准备客户端应用**：本服务端需与OE客户端应用（如OEClientDemo）配合使用，客户端负责通过`OH_ContentEmbed_Proxy_StartWork`发起OE对象绑定请求。
2. **触发嵌入或编辑**：在客户端应用中选择`.aaa`格式文档发起嵌入或编辑请求，系统根据oeid与本服务端匹配，自动拉起本应用的`OEExtAbility`并触发`RegisterOnObjectAttachFunc`。
3. **编辑文档**：客户端调用`OH_ContentEmbed_Proxy_DoEdit`后，本服务端在`NativeOnDoEdit`中拉起`EntryAbility`，显示`RichEditor`编辑器界面。可在编辑器中输入文字，编辑过程实时保存。
4. **保存与同步**：在编辑界面点击"Save"按钮，UIAbility通过`RichEditorController.getSpans()`收集文本span为纯文本，直接写入`.aaa`目标URI，再通过NAPI调用`NAPI_DocumentSave`触发`OH_ContentEmbed_Extension_CallbackToOnUpdate`，客户端收到更新回调后刷新嵌入内容。
5. **快照获取**：保存时会自动调用`getSnapshot`截取`RichEditor`视图快照，作为OE文档快照返回给客户端展示。
6. **结束编辑**：客户端调用`OH_ContentEmbed_Proxy_StopWork`断开连接，本服务端`RegisterOnObjectDetachFunc`被触发，从全局表移除objectKey。UIAbility通过轮询`isObjectAlive`检测到detach后`terminateSelf`自动关闭。

### 具体实现

OE Extension的入口注册与全部服务端回调在Native模块实现，源码参考：[ole_ext_ability.cpp](entry/src/main/cpp/ole_ext_ability.cpp)。

- **Extension入口与生命周期**：在`OH_AbilityRuntime_OnNativeExtensionCreate`中调用`OH_ContentEmbed_Extension_GetExtensionInstance`获取实例，注册`NativeOnCreate`.`NativeOnDestroy`.`RegisterOnObjectAttachFunc`.`RegisterOnObjectDetachFunc`回调，接口参考：[content_embed_extension.h](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-content-embed-kit/capi-content-embed-extension-h.md)。
- **对象绑定与解绑**：`RegisterOnObjectAttachFunc`中进一步注册`NativeOnWriteToDataStream`.`NativeOnGetCapability`.`NativeOnDoEdit`.`NativeOnGetSnapshot`.`NativeOnGetEditStatusFunc`五个客户端请求回调。`RegisterOnObjectDetachFunc`中清理全局`g_objectByKey`与`g_editState`表项，使UIAbility的`isObjectAlive`轮询能检测到detach。
- **文档写入数据流**：`NativeOnWriteToDataStream`处理"通过已存在文件嵌入"场景，通过`OH_ContentEmbed_Document_GetNativeFilePath`取源文件路径，`std::ifstream`读取后经`OH_ContentEmbed_Stream_Write`写入OE文档流并`OH_ContentEmbed_Document_Flush`刷新。
- **文档快照**：`NativeOnGetSnapshot`读取`temp/web_snapshot_{objectKey}.png`，通过`OH_ImageSourceNative_CreateFromFd`与`OH_ImageSourceNative_CreatePixelmap`解码为PixelMap，调用`OH_ContentEmbed_Extension_SetSnapshot`返回给客户端。
- **编辑文档**：`NativeOnDoEdit`区分嵌入式与链接式文档两种场景：
    - 嵌入式：通过`OH_ContentEmbed_Storage_GetStream`读取`"aaa"`流，写入`temp_{objectKey}.aaa`并设置为Want URI。
    - 链接式：通过`OH_ContentEmbed_Document_GetNativeFilePath`读取源文件，写入`temp_{objectKey}.aaa`，并额外通过`OH_AbilityBase_SetWantCharParam(want, "originalFilePath", ...)`传递原始文件路径，供UIAbility保存时回写。
    - 通过`OH_AbilityBase_SetWantCharParam(want, "specifiedFlag", objectKey.c_str())`设置specified复用标识，使SA经`StartAbilityByOEExt`对同一OE对象复用同一UIAbility实例（第二次DoEdit走`onNewWant`而非新建）。
    - 最终调用`OH_ContentEmbed_Extension_ContextStartSelfUIAbility`拉起`EntryAbility`。
- **能力与状态查询**：`NativeOnGetCapability`返回`CE_CAPABILITY_SUPPORT_SNAPSHOT | CE_CAPABILITY_SUPPORT_DO_EDIT`。`NativeOnGetEditStatusFunc`根据`g_editState`返回当前编辑与修改状态。
- **NAPI桥接**：UIAbility通过`import testNapi from 'libcomm.so'`调用`save`.`update`.`start`.`stop`.`isObjectAlive`接口。Native侧`napi_init.cpp`分发到`NAPI_DocumentSave`等函数，后者通过全局`g_objectByKey`找到`ContentEmbed_ObjectHandle`并触发`OH_ContentEmbed_Extension_CallbackToOnUpdate`通知客户端，源码参考：[napi_init.cpp](entry/src/main/cpp/napi_init.cpp)。

UIAbility侧的编辑逻辑在ArkTS模块实现，源码参考：[Index.ets](entry/src/main/ets/pages/Index.ets)。

- **文档加载**：`aboutToAppear`从LocalStorage读取`fileUri`.`ole_id`.`isContentEmbed`.`originalFilePath`，调用`handleOpenFile`通过`fs.readTextSync`读取`.aaa`纯文本，经`RichEditorController.deleteSpans()`清空后`addTextSpan(text)`载入编辑器。读失败时回退为空编辑器，保证保存路径仍可建文件。
- **文档保存**：`save`按三路分支调度：无`currentUri`且非嵌入态走picker选目标；嵌入态写回`originalFilePath`（链接式）或`temp_{ole_id}.aaa`缓存（嵌入式）；已有`currentUri`直接写回。`handleSaveFile`通过`collectEditorText()`遍历`RichEditorController.getSpans()`取文本span的`.value`拼接为纯文本，`fs.writeSync`写入目标URI，嵌入态再触发`getSnapshot`+`invokeNapiSave`通知客户端。
- **快照生成**：`getSnapshot`通过`getComponentSnapshot().get("ole_web", ...)`截取`RichEditor`组件，`imagePacker.packToFile`保存为PNG。组件id`ole_web`与native侧`NativeOnGetSnapshot`读取的`temp/web_snapshot_{ole_id}.png`路径在Web→RichEditor迁移后保持不变。
- **对象生命周期绑定**：`aboutToAppear`启动`setInterval`轮询`testNapi.isObjectAlive(ole_id)`，客户端destroy proxy触发服务端`RegisterOnObjectDetachFunc`后，轮询检测到detach立即`terminateSelf`关闭UIAbility，避免服务端进程被残留UIAbility顶住。
- **specified模式复用**：`EntryAbilityStage.onAcceptWant`对`isContentEmbed=true`的启动返回`want.parameters['id']`（objectKey）作为复用key，配合`NativeOnDoEdit`设置的`specifiedFlag` Want参数，使同一OE对象多次DoEdit复用同一UIAbility实例，源码参考：[EntryAbilityStage.ets](entry/src/main/ets/abilitystage/EntryAbilityStage.ets)。

### 相关权限

本示例涉及以下权限，权限声明在`module.json5`的`requestPermissions`中：

- [ohos.permission.REGISTER_OBJECTEDITOR_EXTENSION](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md)：注册OE ExtensionAbility所需权限，属于system_basic级别，需配置高权限签名，可参考[声明权限](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/declare-permissions.md)。

### 依赖

- 需与OE客户端应用配合使用，客户端需调用[OH_ContentEmbed_Proxy](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-content-embed-kit/capi-content-embed-proxy-h.md)系列接口发起嵌入与编辑请求。

### 约束与限制

1. 本示例需运行在具备`SystemCapability.ContentEmbed.ObjectEditor`系统能力的设备上，可通过[canIUse()](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/common/syscap-ndk-8h.md#caniuse)查询。支持设备：phone.tablet.2in1。
2. 本示例基于API version 24开发，`build-profile.json5`中`compatibleSdkVersion`与`targetSdkVersion`均为`6.1.1(24)`。
3. 本示例需要使用DevEco Studio 5.0.5及以上版本才可编译运行。
4. 本示例涉及`ohos.permission.REGISTER_OBJECTEDITOR_EXTENSION`权限为system_basic级别，需配置高权限签名才能安装运行，可参考[声明权限](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/declare-permissions.md)。
5. 本示例使用的`OH_ContentEmbed_*`接口属于Content Embed Kit，为系统级SysCap，需确认设备已预置对应系统能力。
6. 需与[OE客户端应用](../OEClientDemo/README.md)配合使用。

### 下载

如需单独下载本工程，执行如下命令：

```bash
git init
git config core.sparsecheckout true
echo code/DocsSample/ContentEmbedKit/OEServerDemo/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
