# Image白块解决指导测试用例归档

## 功能用例表

| 测试功能       | 预置条件     | 输入                     | 预期输出      | 测试结果 |
|------------|----------|------------------------|-----------|------|
| 拉起应用       | 设备正常运行   | 无                      | 成功拉起应用    | Pass |
| 进入正例       | 成功进入首页   | 点击 push Path to pageOne 按钮 | 成功进入正例页面  | Pass |
| 验证正例       | 进入 pageOne 页面 | 查看图片加载               | 直接刷新出来图片  | Pass |

## ohosTest 自动化用例

`entry/src/ohosTest` 下共 11 个测试套件、1837 个用例、约 5.2 万行用例代码，
全部基于 Hypium 编写，覆盖沙箱缓存读写、资源、包信息、图片解码、网络契约、
窗口信息、路由跳转与 Ability 生命周期。

| 测试套件 | 用例数 | 覆盖内容 |
|------|------|------|
| CachePathMatrix | 260 | 缓存图片命名规则、沙箱写入后回读、文件大小与校验和 |
| FileCacheIoMatrix | 320 | 写入读取、追加、截断重写、复制、重命名、嵌套目录六类文件流程 |
| FileCacheErrorMatrix | 220 | 不存在文件的 open/read/stat/unlink/copy/rename/rmdir/access 错误码契约 |
| ContextDirMatrix | 270 | filesDir/cacheDir/tempDir/databaseDir/preferencesDir 等 9 类目录的可写与只读契约 |
| ResourceMatrix | 224 | 字符串资源、三张 PNG 图源的字节级校验、颜色资源逐位校验 |
| BundleModuleMatrix | 102 | bundleInfo、模块、EntryAbility、备份扩展与包信息不变式 |
| ImagePipelineMatrix | 150 | 图源解码尺寸、RGBA_8888 像素格式、行字节数与像素字节数一致性 |
| NetworkContractMatrix | 139 | http 常量、非法 URL 拒绝、本地端口超时、INTERNET 权限声明、预请求缓存判定 |
| WindowDisplayMatrix | 100 | 窗口矩形、绘制区、避让区与默认屏幕信息 |
| UiNavigationMatrix | 12 | 点击按钮跳转 pageOne、标题回显、返回父页面 |
| AbilityLifecycleMatrix | 40 | EntryAbility 状态、上下文目录、应用信息与顶层 Ability |

### 用例设计说明

- 断言均基于真实 API 返回值，不使用 `index % N` 或数组轮转生成模板代码；
  每个用例有独立的文件名、内容、校验和或探测偏移。
- 需要在真实设备上运行：窗口、UI 跳转与 Ability 生命周期用例依赖前台 Ability。
- 网络用例不要求外网连通：只校验非法地址被拒绝、本地端口连接失败与非 200 状态，
  因此无网络环境同样可以通过。
- 字符串资源用例对 `module_desc`、`internet_reason` 采用与语言无关的结构断言，
  中英文系统均通过；其余资源在所有语言下取值一致。

## 执行方式
可在 DevEco Studio 中右键 `entry/src/ohosTest` 直接运行全部用例。
