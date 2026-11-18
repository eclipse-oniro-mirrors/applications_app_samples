# TVScreenshot 测试报告

## 设备

| 设备 | 识别名称 |
|---|---|
| rk3568 | `rk3568` |
| 大屏 | `TV` |

## 功能清单

| 设备 | 功能 |
|---|---|
| rk3568 | 系统截屏入口（systemui TOGGLE 动作）唤起、全屏截屏、悬浮预览窗展示与自动关闭、保存提示浮层、截屏图片写入媒体库、频繁触发节流提示、截屏与保存异常提示、窗口等比缩放适配、悬浮窗不抢焦点、遥控器操作不被打断、中英文应用名资源、服务生命周期与资源释放 |
| 大屏 | 系统截屏入口（systemui TOGGLE 动作）唤起、全屏截屏、悬浮预览窗展示与自动关闭、保存提示浮层、截屏图片写入媒体库、频繁触发节流提示、截屏与保存异常提示、窗口等比缩放适配、悬浮窗不抢焦点、遥控器操作不被打断、中英文应用名资源、服务生命周期与资源释放 |

## 验证点

| 项目 | rk3568 | 大屏 |
|---|---|---|
| 截屏入口注册 | `module.json5` 中 extensionAbility 以 action `com.ohos.systemui.action.TOGGLE` 导出，`clickAction` 指向 `com.ohos.screenshot.ServiceExtAbility`，系统截屏菜单可见 | `module.json5` 中 extensionAbility 以 action `com.ohos.systemui.action.TOGGLE` 导出，`clickAction` 指向 `com.ohos.screenshot.ServiceExtAbility`，系统截屏菜单可见 |
| 服务启动 | 触发截屏后 `ServiceExtAbility.onCreate` 正常执行，`context` 写入 AppStorage，无启动失败日志 | 触发截屏后 `ServiceExtAbility.onCreate` 正常执行，`context` 写入 AppStorage，无启动失败日志 |
| 全屏截屏 | 调用 `screenshot.capture()` 成功获取当前屏幕 PixelMap，屏幕内容与实际画面一致 | 调用 `screenshot.capture()` 成功获取当前屏幕 PixelMap，屏幕内容与实际画面一致 |
| 悬浮预览窗 | 创建 `TYPE_FLOAT` 类型 `ScreenShotWindow`，按 1920 设计宽等比换算定位到 `96/570`，尺寸 `750/421` | 创建 `TYPE_FLOAT` 类型 `ScreenShotWindow`，按 1920 设计宽等比换算定位到 `96/570`，尺寸 `750/421` |
| 预览显示 | 预览页 `@StorageLink('captureImage')` 实时刷新，缩略图完整、圆角与白色背景正常，带淡入动画 | 预览页 `@StorageLink('captureImage')` 实时刷新，缩略图完整、圆角与白色背景正常，带淡入动画 |
| 自动关闭 | 预览展示 1600ms 后自动触发 `CloseShotScreen`，预览窗销毁且不残留 | 预览展示 1600ms 后自动触发 `CloseShotScreen`，预览窗销毁且不残留 |
| 保存提示浮层 | 关闭预览后弹出 `TipPage` 提示窗，位置为顶部居中（Y 偏移 46、宽 686、高 100），展示截屏图标、“截屏”标题与提示文案 | 关闭预览后弹出 `TipPage` 提示窗，位置为顶部居中（Y 偏移 46、宽 686、高 100），展示截屏图标、“截屏”标题与提示文案 |
| 图片保存 | `saveImage()` 将 PixelMap 以 JPEG（quality 100）编码，经 `photoAccessHelper` 创建资源并以 `Screenshot_<时间戳>.jpg` 写入，成功后提示“截屏图片已存储到"照片"” | `saveImage()` 将 PixelMap 以 JPEG（quality 100）编码，经 `photoAccessHelper` 创建资源并以 `Screenshot_<时间戳>.jpg` 写入，成功后提示“截屏图片已存储到"照片"” |
| 图库可查 | 保存后的图片在系统图库中可见，内容正确、无损坏、无重复覆盖 | 保存后的图片在系统图库中可见，内容正确、无损坏、无重复覆盖 |
| 保存异常 | 无截图数据或媒体库写入失败时提示“截屏图片保存失败!”，页面不崩溃 | 无截图数据或媒体库写入失败时提示“截屏图片保存失败!”，页面不崩溃 |
| 截屏异常 | `screenshot.capture()` 抛错时提示“截屏失败,请尝试重新截屏”，流程可重新发起 | `screenshot.capture()` 抛错时提示“截屏失败,请尝试重新截屏”，流程可重新发起 |
| 频繁触发节流 | 服务已运行时再次触发（`startId > 1`）提示“当前操作频繁，请稍后再试”，不重复创建窗口 | 服务已运行时再次触发（`startId > 1`）提示“当前操作频繁，请稍后再试”，不重复创建窗口 |
| 焦点保持 | 预览窗与提示窗均设置 `setWindowFocusable(false)`，不抢占原应用焦点，遥控器操作不被打断 | 预览窗与提示窗均设置 `setWindowFocusable(false)`，不抢占原应用焦点，遥控器操作不被打断 |
| 提示窗背景 | 预览窗与提示窗背景设为透明，圆角与深色半透明提示底色显示正常，无黑边与白块 | 预览窗与提示窗背景设为透明，圆角与深色半透明提示底色显示正常，无黑边与白块 |
| 窗口适配 | 按屏幕宽度与 1920 比例换算尺寸，不同分辨率下预览与提示位置居中、无错位或截断 | 按屏幕宽度与 1920 比例换算尺寸，不同分辨率下预览与提示位置居中、无错位或截断 |
| 资源释放 | 保存流程结束后文件描述符在 `finally` 中关闭，提示窗 `destroyWindow` 后回调 `terminateSelf` 退出服务 | 保存流程结束后文件描述符在 `finally` 中关闭，提示窗 `destroyWindow` 后回调 `terminateSelf` 退出服务 |
| 生命周期 | `onCreate`/`onRequest`/`onDestroy` 调用顺序正常，反复截屏无窗口与进程残留 | `onCreate`/`onRequest`/`onDestroy` 调用顺序正常，反复截屏无窗口与进程残留 |
| 权限申请 | `CAPTURE_SCREEN`、`CUSTOM_SCREEN_CAPTURE`、`WRITE_IMAGEVIDEO`、`SYSTEM_FLOAT_WINDOW` 等权限声明完整，未授权时提示合理不崩溃 | `CAPTURE_SCREEN`、`CUSTOM_SCREEN_CAPTURE`、`WRITE_IMAGEVIDEO`、`SYSTEM_FLOAT_WINDOW` 等权限声明完整，未授权时提示合理不崩溃 |
| 资源加载 | 中英文应用名（截屏 / ScreenShot）与 `app.media.jietu`、`icon`、`screenshot` 等图片资源加载正常，无缺失 | 中英文应用名（截屏 / ScreenShot）与 `app.media.jietu`、`icon`、`screenshot` 等图片资源加载正常，无缺失 |
