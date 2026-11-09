# 上传下载测试说明

## 自动化测试概览

当前 ohosTest 共 **892 条用例**，覆盖 UI、文件模型、常量、URL 持久化、文件目录、数据源订阅、缓存复制和下载清理：

| 套件 | 用例数 | 职责 |
|---|---:|---|
| `UploadDownloadCustomDataSourceBehaviorTest` | 17 | 下载列表数据源的构造、索引、订阅、通知与插入行为 |
| `UploadDownloadFileAlbumCatalogTest` | 10 | 下载目录相册创建、幂等、文件保留与清理边界 |
| `UploadDownloadUrlUtilsBoundaryTest` | 10 | 服务器地址空值、空白、长地址、中文与控制字符边界 |
| `AbilityTest` | 6 | 应用启动、授权、上传/下载页面与文件列表 |
| `UploadDownloadFileModelMatrixTest` | 40 | 文件类型、文件夹、扩展名和名称矩阵 |
| `UploadDownloadFileModelExtraTest` | 40 | 扩展名补充矩阵 |
| `UploadDownloadFileModelExtra2Test` | 15 | 扩展名长尾矩阵 |
| `UploadDownloadFileModelExtra3Test` | 15 | 文档与字体后缀补充 |
| `UploadDownloadFileModelResidualTest` | 20 | 大小写、多点后缀、Unicode 和空名称残留场景 |
| `UploadDownloadFileUtilsExtra4Test` | 10 | 目录生命周期补充 |
| `UploadDownloadFileUtilsResidualTest` | 15 | 尾斜杠、幂等初始化、缺失目录和 Unicode 文件 |
| `UploadDownloadFileUtilsErrorResidualTest` | 10 | 文件路径冲突、嵌套目录、点文件和长文件名错误分支 |
| `UploadDownloadCleanResidualTest` | 10 | 缺失文件、目录路径、重复清理和特殊文件名 |
| `UploadDownloadMediaUtilsResidualTest` | 15 | 缓存复制、覆盖、缺失源/缓存目录、Unicode 和大文件 |
| `UploadDownloadConstantsContractTest` | 15 | 常量、枚举和关系契约 |
| `UploadDownloadUrlUtilsStorageTest` | 30 | 服务器 URL 保存、读取、默认值和覆盖 |
| `UploadDownloadUrlUtilsExtraTest` | 20 | URL 协议、端口、路径和特殊字符补充 |
| `UploadDownloadUrlUtilsExtra2Test` | 15 | URL 路径与编码补充 |
| `UploadDownloadUrlUtilsExtra3Test` | 10 | URL 补充矩阵 |
| `UploadDownloadRequestInvalidExtraTest` | 10 | 非法下载 URL 拒绝 |
| `UploadDownloadUploadInvalidExtraTest` | 10 | 非法上传配置拒绝 |
| `UploadDownloadFileTypeCatalogTest` | 52 | 文件类型目录与文件名场景 |
| `UploadDownloadFileTypeCatalogPart2Test` | 53 | 文件类型目录补充场景 |
| `UploadDownloadServerConfigTest` | 51 | 服务器 URL 配置场景 |
| `UploadDownloadServerConfigPart2Test` | 54 | 服务器 URL 配置补充场景 |
| `UploadDownloadDirectoryScenarioTest` | 46 | 下载目录初始化、列表与清理场景 |
| `UploadDownloadDirectoryScenarioPart2Test` | 44 | 下载目录补充场景 |
| `UploadDownloadCleanupPathScenarioTest` | 39 | 缓存文件清理路径场景 |
| `UploadDownloadCleanupPathScenarioPart2Test` | 41 | 缓存清理路径补充场景 |
| `UploadDownloadFinalEdgeCaseTest` | 5 | 最终扩展名边界补充 |
| `UploadDownloadFileUtilsMatrixTest` | 40 | 下载目录初始化、文件列表和清空 |
| `UploadDownloadFileUtilsExtraTest` | 25 | 目录幂等、空目录和多文件补充 |
| `UploadDownloadFileUtilsExtra2Test` | 20 | 嵌套目录、清空和多文件补充 |
| `UploadDownloadDownloadCleanMatrixTest` | 25 | `clearExistFile` 文件清理与缺失路径 |
| `UploadDownloadDownloadCleanExtraTest` | 15 | 特殊文件名清理补充 |
| `UploadDownloadDownloadCleanExtra2Test` | 10 | 清理文件名长尾补充 |
| `UploadDownloadDownloadCleanExtra3Test` | 12 | 清理文件补充矩阵 |
| `UploadDownloadDownloadCleanExtra4Test` | 10 | 清理文件最终补充 |
| `UploadDownloadFuncTest` | 7 | URL、目录、清理和非法下载参数 |

质量门禁：

- 用例名统一 `testUploadDownloadXxxNNNN`；
- `@tc.number`、`@tc.name`、`@tc.desc`、`@tc.type`、`@tc.size`、`@tc.level` 全量存在；
- 用例名与 `@tc.number` 全局唯一；
- 每条用例至少 3 个断言；
- 全量执行结果：**892/892 通过**（本轮新增 8 条单独执行 **17/17 通过**）。

## 手工用例表

| 测试功能    | 预置条件                                                                 | 输入                                                                       | 预期输出                                                    |是否自动|测试结果|
|---------|----------------------------------------------------------------------|--------------------------------------------------------------------------|---------------------------------------------------------|--------------------------------|--------------------------------|
| 拉起应用    | 	设备正常运行                                                              | 	无	                                                                      | 成功拉起应用                                                  |是|Pass|
| 授权      | 应用正常拉起                                                               | 	点击界面中的允许按钮	                                                             | 输入成功                                                    |是|Pass|
| 上传页面    | 位于首页                                                                 | 	点击**上传**按钮	                                                             | 进入上传页面                                                  |是|Pass|
| 下载文件夹   | 位于下载页面                                                               | 1、点击**查看下载文件**                                                           | 1、进入下载文件页面，展示文件夹                                        | 是 |Pass|
| 查看下载文件  | 下载文件页面                                                               | 1、点击文件夹                                                                  | 1、进入文件夹页面，显示文件夹内的文件列表                                   | 是 |Pass|
| 上传功能    | 1、在上传页面<br/>2、设备和电脑端连接同一个局域网，并且按照environment中的readme，电脑端hfs服务器开启设置完成 | 1、查看hfs服务器的url，在应用首页输入HFS地址<br/>2、点击上传<br/>3、点击uploadFile或agentTask<br/> | 1、url填写成功<br/>2、点击上传后开始上传文件，上传成功会有toast提示<br/>3、服务端收到图片 | 否 |Pass|
| 下载文件    | 1、设备联网                                                               | 1、选择列表中的单个文件<br/>2、点击下载按钮                                                | 1、下载成功会有toast提示。                                        | 否 |Pass|
| 下载用户文件  | 1、设备联网                                                               | 1、选择列表中的单个文件<br/>2、点击下载到用户文件目录按钮                                         | 1、下载成功会有toast提示。                                        | 否 |Pass|