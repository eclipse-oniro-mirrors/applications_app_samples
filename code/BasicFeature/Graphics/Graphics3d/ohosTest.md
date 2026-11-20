# Graphics3d 测试用例

Graphics3d 三维渲染样例的测试归档，真实 API 冒烟覆盖业务 GLB 加载、场景节点与相机属性、节点容器操作；既有矩阵保留相机球坐标、投影视锥、网格与向量等计算检查。

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 42 个业务套件文件 2846 条；`test/Ability.test.ets` 另有 5 条环境自检，合计 2851 条。本轮主包、测试包编译、签名、安装及 RK3568 真机全量完成，2851/2851 通过，Failure/Error/Ignore 均为 0。

其中 `G3dApiSmoke` 的 2 条用例实际调用 ArkGraphics3D API，使用业务资源与真实场景对象。既有算术及路由字符串矩阵不证明场景 API 可达、页面实际跳转或 GPU 画面正确。

用例写法与元数据约定如下：

- `@tc.number G3D_<主题>_NNNN`、`@tc.name g3d<主题><序号>`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST`、`@tc.level LEVEL0`；
- `it(name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, fn)`，每条用例首尾各打一行 `hilog` begin/end；
- 断言前声明本条用例的入参（如 `distance = 1`、`yaw = 0 * Math.PI / 180`、`pitch = 0 * Math.PI / 180`），期望值全部写成字面量，浮点比较统一用 `Math.abs(actual - expected) < 0.01`；
- 日志统一使用 `DOMAIN = 0xF811`、`TAG = '[Sample_Graphics3d]'`，可用 `hilog -x -D 0xF811` 过滤；
- 矩阵套件通过 `beforeEachIt` 调用 `util/TestTick.ets` 的 `tick()`，用例末尾再次调用，每 10 条用例让出一次主线程；真实冒烟使用异步系统 API，并在 `finally` 中销毁场景；
- 单个套件文件不超过 2000 行，大主题按 `Matrix1` .. `MatrixN` 拆分。

### 套件清单

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| G3dApiSmoke | G3dApiSmoke.test.ets | 2 | 实际加载 DamagedHelmet.glb 并查询业务模型；创建并挂接相机，读写 position/fov/nearPlane/farPlane/enabled，按父子完整路径反查；真实 children 执行 append/insertAfter/remove/clear；finally 调用 Scene.destroy |
| G3dCameraMatrix1 .. 31 | G3dCameraMatrixN.test.ets | 2250 | 相机距离 1 / 2 / 3 / 4 / 5 / 6 / 8 / 10 / 12 / 16 / 20 / 24 / 32 / 48 / 64 × 偏航 0 ~ 330 度 × 俯仰 0 ~ 180 度组成的 31 组参数，按球坐标公式推算笛卡尔位置 x / y / z，并校验模长与设定距离一致 |
| G3dProjectionMatrix1 .. 4 | G3dProjectionMatrixN.test.ets | 288 | 视场角 30 / 60 / 90 / 110 度 × 近平面 0.1 / 0.2 × 远平面 10 ~ 2000 组成的 4 组参数，推算近远平面处的视锥宽高、纵横比与深度比 |
| G3dMeshMatrix1 .. 3 | G3dMeshMatrixN.test.ets | 180 | 8 / 96 / 3072 顶点、2 维与 3 维网格在 0.5 / 1 / 2 / 3 / 4 / 8 倍缩放下，推算顶点坐标、索引数量与三角面片数 |
| G3dVectorMatrix1 | G3dVectorMatrix1.test.ets | 52 | 向量点积与模长推算、叉积正交性校验，以及绕 Z 轴 0 ~ 315 度旋转后的三角函数分量 |
| G3dGeomMatrix1 | G3dGeomMatrix1.test.ets | 48 | 画布矩形面积与中心点、两矩形相交面积、点距与曼哈顿距离等几何推算（含负坐标矩形） |
| G3dRouteFactsMatrix1 | G3dRouteFactsMatrix1.test.ets | 26 | 页面路由 `pages/Index` 与 `graphics3d/container`、`graphics3d/node_base`、`graphics3d/node_camera`、`graphics3d/node_light`、`graphics3d/scene_animation`、`graphics3d/scene_environment`、`graphics3d/scene_shader` 的分段、字符集、长度与反查文件名后缀校验，包名 `com.samples.graphics3d` 命名规范，`EntryAbility` 后缀校验 |

测试入口与辅助文件：

- `test/List.test.ets`：注册全部套件；
- `test/Ability.test.ets`：应用上下文、包信息、模块入口、能力列表、应用级上下文共 5 条环境自检，断言包名为 `com.samples.graphics3d`、`mainElementName` 为 `EntryAbility`；
- `util/TestTick.ets`：每 10 条用例插入一次 1ms 定时器，让主线程回到事件循环；
- `testability/TestAbility.ets`：`onForeground` 后延迟 1 秒注册 hypium，`onDestroy` 以 -2 结束；
- `testrunner/OpenHarmonyTestRunner.ts`：拉起 `TestAbility`，开发者模式未解锁时以 -3 结束；
- `main/ets/util/Logger.ts`：样例侧日志封装，沿用同一 `DOMAIN` / `TAG`。

## 手工用例

下表保留既有手工测试记录，Pass 不代表本轮重新逐项操作验证；本轮新增冒烟与全量成绩仅对应上文自动化范围。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用 | 是 | Pass |
| 主页展示 | 设备正常运行 | 无 | 展示 container、node_base、node_camera、node_light、scene_environment、scene_animation、scene_shader 按钮 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 container | 跳转 container 页面 | 否 | Pass |
| 删除节点 | 位于 container | 点击 remove node | 头盔消失 | 否 | Pass |
| 尾端插入节点 | 位于 container | 点击 append node | 头盔出现 | 否 | Pass |
| 当中插入节点 | 位于 container | 点击 insert node | 头盔出现 | 否 | Pass |
| 返回主页 | 位于 container | 点击 back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 node_base | 跳转 node_base 页面 | 否 | Pass |
| 缩放功能 | 位于 node_base | 点击 scale helmet | 头盔缩放 | 否 | Pass |
| 旋转功能 | 位于 node_base | 点击 rotate helmet | 头盔旋转 | 否 | Pass |
| 旋转父节点 | 位于 node_base | 点击 rotate parent | 头盔旋转 | 否 | Pass |
| 节点可见性 | 位于 node_base | 点击 root visible | 头盔可见性切换 | 否 | Pass |
| 层级标记 | 位于 node_base | 点击 layer mask | 头盔层级标记生效 | 否 | Pass |
| 返回主页 | 位于 node_base | 点击 back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 node_camera | 跳转 node_camera 页面 | 否 | Pass |
| 改变视场角 | 位于 node_camera | 点击 change fov | 视场角改变，画面透视随之变化 | 否 | Pass |
| 改变调色 | 位于 node_camera | 点击 Change Tonemap Type | tone mapping 类型切换 | 否 | Pass |
| 改变相机背景色 | 位于 node_camera | 点击 set clearColor | 背景色改变 | 否 | Pass |
| 改变相机使能 | 位于 node_camera | 点击 enabled | 相机不再响应交互 | 否 | Pass |
| 返回主页 | 位于 node_camera | 点击 back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 node_light | 跳转 node_light 页面 | 否 | Pass |
| 改变光源类型 | 位于 node_light | 点击切换光源类型 | 光源类型转变 | 否 | Pass |
| 改变光源颜色 | 位于 node_light | 点击切换光源颜色 | 光源颜色改变 | 否 | Pass |
| 改变光源强度 | 位于 node_light | 点击切换光源强度 | 光源强度改变 | 否 | Pass |
| 改变光源阴影 | 位于 node_light | 点击切换光源阴影使能 | 阴影开关生效 | 否 | Pass |
| 改变光源使能 | 位于 node_light | 点击切换光源使能 | 光源使能切换 | 否 | Pass |
| 返回主页 | 位于 node_light | 点击 back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 node_environment | 跳转 node_environment 页面 | 否 | Pass |
| 改变环境贴图类型 | 位于 node_environment | 点击 change env Img Type | 环境贴图类型改变 | 否 | Pass |
| 改变环境辐照度贴图 | 位于 node_environment | 点击 change radiance Img | 环境辐照贴图改变 | 否 | Pass |
| 改变间接漫反射因子 | 位于 node_environment | 点击 change indirectDiffuseFactor | 间接漫反射效果改变 | 否 | Pass |
| 改变间接高光反射因子 | 位于 node_environment | 点击 change indirectSpecularFactor | 间接高光反射效果改变 | 否 | Pass |
| 改变环境贴图因子 | 位于 node_environment | 点击 change environmentMapFactor | 环境贴图效果改变 | 否 | Pass |
| 改变环境辐照度系数 | 位于 node_environment | 点击 change irradianceCoefficients | 环境辐照度系数改变 | 否 | Pass |
| 返回主页 | 位于 node_environment | 点击 back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 scene_environment | 跳转 scene_environment 页面 | 否 | Pass |
| 改变环境贴图类型 | 位于 scene_environment | 点击 change env Img Type | 环境贴图类型改变 | 否 | Pass |
| 改变环境辐照度贴图 | 位于 scene_environment | 点击 change radiance Img | 环境辐照贴图改变 | 否 | Pass |
| 改变间接漫反射因子 | 位于 scene_environment | 点击 change indirectDiffuseFactor | 间接漫反射效果改变 | 否 | Pass |
| 改变间接高光反射因子 | 位于 scene_environment | 点击 change indirectSpecularFactor | 间接高光反射效果改变 | 否 | Pass |
| 改变环境贴图因子 | 位于 scene_environment | 点击 change environmentMapFactor | 环境贴图效果改变 | 否 | Pass |
| 改变环境辐照度系数 | 位于 scene_environment | 点击 change irradianceCoefficients | 环境辐照度系数改变 | 否 | Pass |
| 返回主页 | 位于 scene_environment | 点击 back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 scene_animation | 跳转 scene_animation 页面 | 否 | Pass |
| 播放动画 | 位于 scene_animation | 点击 start | 动画播放 | 否 | Pass |
| 暂停动画 | 位于 scene_animation | 点击 pause | 动画暂停 | 否 | Pass |
| 停止动画 | 位于 scene_animation | 点击 stop | 动画停止 | 否 | Pass |
| 动画完成 | 位于 scene_animation | 点击 finish | 动画播放至结束 | 否 | Pass |
| 动画重新开始 | 位于 scene_animation | 点击 restart | 动画重新播放 | 否 | Pass |
| 返回主页 | 位于 scene_animation | 点击 back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 scene_shader | 跳转 scene_shader 页面 | 否 | Pass |
| 创建 shader 和材质 | 位于 scene_shader | 点击 create shader and change material | 画面呈现 shader 变化 | 否 | Pass |
| 恢复原来材质 | 位于 scene_shader | 点击 recovery original material | 画面恢复到原材质效果 | 否 | Pass |
| 材质覆盖 | 位于 scene_shader | 点击 material override | 画面呈现 shader 变化 | 否 | Pass |
| 返回主页 | 位于 scene_shader | 点击 back | 回到主页 | 否 | Pass |

覆盖边界：真实冒烟验证场景加载、节点可达及属性和容器操作，不比较屏幕渲染结果。GPU 视觉效果、页面跳转、按钮交互仍需独立验证；算术矩阵仅检查计算关系，不能替代这些业务行为的验证。

## 运行方式

```shell
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

安装完成后，通过 `hdc shell` 调用测试执行器拉起 `entry_test` 模块：`-b com.samples.graphics3d` 指定应用包名，`-m entry_test` 指定测试模块，`-s unittest /ets/testrunner/OpenHarmonyTestRunner` 指定执行器入口（路径区分大小写），`-s timeout 30000` 指定超时时间。

安装后也可在 DevEco Studio 中右键 `entry/src/ohosTest` 运行。上库版本的 `build-profile.json5` 必须保持 `signingConfigs` 为空且无产品签名引用，运行前在本地配置签名。证书、密钥、口令和 Token 仅保留本地，不进入上库仓或 Git 对象；更换签名可能报 `install sign info inconsistent`，重新安装前确认应用数据影响。

## 真机实测约束

1. hypium 把整批用例串在同一个主线程任务里执行，`await` 已完成的 Promise 只产生微任务，主线程累计占用超过 6 秒会被系统判定 `THREAD_BLOCK_6S` 并结束进程（报告表现为 `TestFinished-ResultMsg: App died`），因此每个套件必须用 `beforeEachIt` 调用 `tick()`，每 10 条用例插入一次 1ms 定时器。
2. 用例注册放在 `TestAbility.onForeground` 之后延迟 1 秒执行：注册阶段 hypium 会同步写大量日志，接口回调整体占用主线程可能触发前台超时并回收测试进程。
3. `-s unittest` 的入口路径必须写成小写的 `/ets/testrunner/OpenHarmonyTestRunner`，设备端大小写敏感，写成 `TestRunner` 会报 `Cannot find module`。
4. 开发者模式未解锁屏幕时，启动应用命令返回 `10106102`，`OpenHarmonyTestRunner` 会以 -3 直接结束测试，跑测前先解锁屏幕。
5. hilog 的 tag 超过 31 字节会截断，所有套件只使用一个短 tag `[Sample_Graphics3d]`，用例归属靠日志正文中的 `it` 名称区分。
6. 相机、投影、网格矩阵涉及三角函数与开方，使用浮点容差；真实相机 fov、nearPlane 的读回容差为 0.0001。浮点日志使用 `String(value)` 与 `%{public}s`，避免本机 `%{public}f` 输出残片。
7. 本轮设备创建并挂接相机后，`camera.path` 仍返回根路径，不能用该值反查叶节点。冒烟先验证 parent，再按 `root.name + '/' + camera.name` 查询目标；这只是本轮设备行为，不推断所有 SDK 版本均相同。
