# 相册选择与跨线程访问

## 介绍

本示例演示媒体库的三种典型用法，分别对应三套接口：

1. [@ohos.file.photoAccessHelper](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-media-library-kit/js-apis-photoAccessHelper.md)：调用 `PhotoViewPicker` 打开系统全屏相册选择器，选中的文件通过 URI 授权交给应用，无需申请媒体读权限即可使用。
2. [@ohos.file.RecentPhotoComponent](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-media-library-kit/ohos-file-RecentPhotoComponent.md)：展示最近照片入口，支持时间范围、照片来源筛选与自动刷新。
3. [@ohos.file.sendablePhotoAccessHelper](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-media-library-kit/js-apis-sendablePhotoAccessHelper.md)：可跨线程传递的 PhotoAccessHelper，配合 TaskPool 在工作线程中读取选择器授权的 URI，完成压缩、裁剪、旋转、滤镜与加水印。

示例由五个场景组成：相册选择、最近照片、全量图库、跨线程编辑、沙箱缓存。

## 效果预览

<img src="screenshots/main_page.png" alt="主页面" width="320" height="569"/>

### 使用说明

1. 在首页点击「相册选择」，点「选择图片和视频」打开系统全屏相册选择器，选中后返回页面，底部会实时显示已选数量和缩略图，点击「使用所选」写入跨页面共享的选择状态；
2. 返回首页点击「最近照片」，切换时间范围（1 小时/6 小时/24 小时）和照片来源（全部/相机/截图），点击最近照片即可加入选择，点击「查询最近照片信息」查看拍摄时间与标识；
3. 返回首页点击「全量图库」，首次进入会展示权限说明卡片，点击「申请权限」触发 `ohos.permission.READ_IMAGEVIDEO` 申请，授权成功后按页加载媒体库；
4. 返回首页点击「跨线程编辑」，在预览图上拖动确定裁剪区域，再选择旋转角度、滤镜、亮度、对比度、饱和度、水印与压缩质量，点击「在 TaskPool 中处理」，页面会展示处理结果、工作线程耗时、解码耗时与压缩比例；
5. 点击「保存到沙箱」把结果写入应用沙箱，返回首页点击「沙箱缓存」查看文件列表、导出所选原图、删除单个文件或清空全部缓存。

## 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                     // 应用入口元能力
|---entrybackupability
|   |---EntryBackupAbility.ets               // 备份恢复元能力
|---pages
|   |---Index.ets                            // 首页，Navigation 容器与场景入口
|---photopicker
|   |---data
|   |   |---FormatUtil.ets                   // 字节、时间、百分比格式化
|   |   |---SceneEntry.ets                   // 场景路由与入口数据结构
|   |   |---SelectionStore.ets               // 跨页面共享的选择状态（@ObservedV2）
|   |---pages
|   |   |---PickerScene.ets                  // 相册选择场景
|   |   |---RecentScene.ets                  // 最近照片场景
|   |   |---GalleryScene.ets                 // 全量图库场景
|   |   |---EditScene.ets                    // 跨线程编辑场景
|   |   |---CacheScene.ets                   // 沙箱缓存场景
Library/src/main/ets/
|---photopicker
|   |---components
|   |   |---MediaThumb.ets                   // 可复用的圆角缩略图控件
|   |---feature
|   |   |---ColorMatrixUtil.ets              // 对比度、饱和度与预设滤镜颜色矩阵
|   |   |---ImageEditEngine.ets              // 持有 sendable helper，派发 TaskPool 任务
|   |   |---ImageTaskUtils.ets               // 工作线程使用的读写、校验与水印工具函数
|   |   |---MediaModels.ets                  // 媒体元数据、编辑参数与处理结果模型
|   |   |---MediaProcessTask.ets             // @Concurrent 图片处理与导出任务
|   |   |---PhotoAccessFeature.ets           // 主线程媒体查询、缩略图与最近照片信息
|   |   |---PickerOptionFactory.ets          // PickerOptions 与 RecentPhotoOptions 构造
|   |   |---SandboxStore.ets                 // 沙箱输出目录管理
|   |---PhotoPickerFeature.ets               // 对外开放的特性接口
|---utils
|   |---Logger.ets                           // 统一日志封装
```

## 具体实现

* 相册选择：`PhotoViewPicker` 打开系统全屏相册选择器，`PhotoSelectOptions` 设置媒体类型（图片与视频）和最大可选数量（与共享选择状态的上限一致，9 个）。返回的 URI 自带授权，后续用 `getAssets` 查询元数据或用文件接口读取都不需要媒体权限；页面把返回的 URI 逐个写入 [SelectionStore.ets](entry/src/main/ets/photopicker/data/SelectionStore.ets)（自动去重并受上限约束），点击「使用所选」时通过 `queryByUris` 读取名称与大小，源码参考：[PickerScene.ets](entry/src/main/ets/photopicker/pages/PickerScene.ets)、[PhotoAccessFeature.ets](Library/src/main/ets/photopicker/feature/PhotoAccessFeature.ets)。

* 最近照片：`RecentPhotoComponent` 使用 `RecentPhotoOptions` 控制时间范围（不超过 86400 秒）、`PhotoViewMIMETypes` 和 `PhotoSource`。`onRecentPhotoCheckResult`/`onRecentPhotoCheckInfo` 返回最近照片是否存在及拍摄时间、标识，`onRecentPhotoClick` 返回被点击媒体的 URI，直接写入共享选择状态，源码参考：[RecentScene.ets](entry/src/main/ets/photopicker/pages/RecentScene.ets)。页面另外用 `getAssets` 按 `date_added` 倒序取该时间窗内最新的一条媒体渲染成兜底卡片（「使用这一项」同样写入共享选择状态），用于 `RecentPhotoComponent`/`getRecentPhotoInfo` 不可用的系统镜像，源码参考：[PhotoAccessFeature.ets](Library/src/main/ets/photopicker/feature/PhotoAccessFeature.ets)。

* 全量图库：调用 `photoAccessHelper.getAssets` 分页读取媒体库，`dataSharePredicates` 按 `date_added` 倒序并 `limit` 分页，`Grid` + `Repeat` 渲染缩略图。由于 `ohos.permission.READ_IMAGEVIDEO` 为 system_basic 级受限权限，页面在未授权时展示说明卡片而不是直接失败，源码参考：[GalleryScene.ets](entry/src/main/ets/photopicker/pages/GalleryScene.ets)、[PhotoAccessFeature.ets](Library/src/main/ets/photopicker/feature/PhotoAccessFeature.ets)。

* 跨线程图片处理：`sendablePhotoAccessHelper.getPhotoAccessHelper(context)` 返回的 `PhotoAccessHelper` 是 ISendable 对象，可直接作为 `taskpool.Task` 参数传入工作线程；工作线程中先用 `getAssets` 校验 URI 是否被选择器授权，再用 `fs` 读取原始字节、`image` 解码、`crop`/`rotate` 变换、`effectKit` 调色、`drawing` 绘制水印，最后用 `ImagePacker` 以 JPEG 重新编码。主线程只负责展示与计时，源码参考：[MediaProcessTask.ets](Library/src/main/ets/photopicker/feature/MediaProcessTask.ets)、[ImageEditEngine.ets](Library/src/main/ets/photopicker/feature/ImageEditEngine.ets)、[EditScene.ets](entry/src/main/ets/photopicker/pages/EditScene.ets)。

* 沙箱缓存：处理结果与导出的原图统一写入 `filesDir/outputs`，[SandboxStore.ets](Library/src/main/ets/photopicker/feature/SandboxStore.ets) 负责目录创建、列表查询、大小统计与清理，[CacheScene.ets](entry/src/main/ets/photopicker/pages/CacheScene.ets) 负责展示与操作。

* 模块对外接口：场景只依赖 [PhotoPickerFeature.ets](Library/src/main/ets/photopicker/PhotoPickerFeature.ets) 暴露的能力，Library 可独立编译为 HAR 复用。

## 相关权限

* [ohos.permission.READ_IMAGEVIDEO](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/restricted-permissions.md#ohospermissionread_imagevideo)：读取用户公共目录的图片与视频。该权限级别为 system_basic，授权方式为用户授权，且属于受限权限，需要配置 ACL 签名后才能申请。

## 依赖

不依赖其他 Sample。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备为 RK3568，Phone 和 Tablet。
2. 本示例仅支持 API 26 版本 SDK，SDK 版本号为 26.0.0。
3. 本示例需要使用 DevEco Studio 6.0.0 Release 及以上版本编译运行。
4. 「全量图库」场景涉及受限权限 `ohos.permission.READ_IMAGEVIDEO`，该权限级别为 system_basic，需要在签名证书的 ACL 中声明。普通签名安装会报 9568289，可按[特殊权限配置方法](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/declare-permissions-in-acl.md)配置 ACL 后再安装运行；只想调试其余四个场景时，可临时移除 module.json5 中的权限声明，此时全量图库会停留在权限说明卡片。
5. 本示例原本规划用内嵌的 `PhotoPickerComponent` 承载「相册选择」场景，但实测部分系统镜像（如 API 26 Beta1 的 RK3568）上内嵌宫格只能渲染，点按和滑动均无响应：扩展进程 `com.ohos.photos:sysPicker/photoPicker` 的窗口没有注册为系统输入窗口，触摸事件落到宿主窗口后没有投递目标。该问题在系统侧，应用无法规避，因此该场景改为调用系统全屏选择器 `PhotoViewPicker`，选择结果同样以 URI 授权的方式交付，不需要媒体读权限。
6. 部分系统镜像上 `getRecentPhotoInfo` 与 `RecentPhotoComponent` 与文档不一致：组件创建后立即回调 `onError` 且不再上报查询结果，接口带 `RecentPhotoOptions` 调用抛出无错误码的 `Constructor is false`、不带参数调用返回 `401 input parmaeter invalid`（原文拼写如此），调用期间媒体库服务无任何日志，说明异常发生在接口实现层。因此「最近照片」场景保留组件与接口的完整用法，同时用 `getAssets` 查同时间窗内最新一条媒体作为兜底卡片；兜底路径依赖 `ohos.permission.READ_IMAGEVIDEO`。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Media/PhotoPickerAndSendable/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
