# 评估管理测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- |
| isActive接口调用 | 设备正常运行，应用已安装 | 调用assessment.isActive | 返回boolean，或抛出201、801业务错误码 | 是 | RK板镜像无该SysCap，用例跳过 |
| getConfiguration接口调用 | 设备正常运行，未开始评估 | 调用assessment.getConfiguration | 返回AssessmentConfig且duration非负，或抛出201、801业务错误码 | 是 | RK板镜像无该SysCap，用例跳过 |
| 主页面布局 | 设备正常运行 | 拉起EntryAbility | 标题与begin、end、isActive、getConfiguration四个按钮均显示 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 按钮可用状态 | 位于主页面，未处于评估状态 | 读取begin与end按钮的enabled状态 | begin按钮可用，end按钮不可用 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 白名单添加 | 位于主页面 | 输入包名com.samples.dictionary并点击添加 | 白名单列表中显示com.samples.dictionary | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 查询接口按钮点击 | 位于主页面 | 依次点击isActive与getConfiguration按钮 | 页面不崩溃，标题仍显示，状态信息卡片刷新 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 开始评估 | 位于主页面，设备支持评估管理能力 | 选择时长与白名单后点击begin按钮，在系统弹窗中确认 | onBegin回调返回code为0，主页面跳转到答题页面，isActive返回true | 否 | 待真机执行 |
| 开始评估时用户取消 | 位于主页面，设备支持评估管理能力 | 点击begin按钮，在系统弹窗中取消 | onBegin回调返回code为1（USER_CANCEL），不跳转答题页面 | 否 | 待真机执行 |
| 重复开始评估 | 已处于评估状态 | 再次调用begin接口 | 抛出评估服务已处于活动状态的业务错误码，回调事件记录中展示该错误码 | 否 | 待真机执行 |
| 答题页面倒计时 | 已进入评估模式，duration大于0 | 停留在答题页面 | 剩余时间按秒递减，递减到0后停止 | 否 | 待真机执行 |
| 答题页面默认时长 | 已进入评估模式，duration为0 | 停留在答题页面 | 剩余时间位置展示"默认时长"，不启动倒计时 | 否 | 待真机执行 |
| 作答与切题 | 位于答题页面 | 点击选项，点击上一题与下一题 | 选中项高亮显示，题目序号与题干随切换刷新 | 否 | 待真机执行 |
| 交卷结束评估 | 位于答题页面 | 点击交卷按钮 | 调用end接口，onEnd回调触发，弹窗展示作答题目数量，返回主页面后isActive返回false | 否 | 待真机执行 |
| 评估超时中断 | 已进入评估模式，duration较小 | 等待评估时长用尽 | onInterrupted回调返回code为2（TIMEOUT），答题页面弹窗展示超时原因并返回主页面 | 否 | 待真机执行 |
| 白名单限制 | 已进入评估模式 | 打开白名单之外的应用 | 该应用无法在评估期间运行 | 否 | 待真机执行 |
| 答题页面返回键 | 位于答题页面 | 点击系统返回键 | onBackPress中调用end接口，解除评估模式的能力限制 | 否 | 待真机执行 |
| 结束非本应用开启的评估 | 已存在非本应用开启且未结束的评估 | 本应用调用end接口 | 抛出非法操作的业务错误码，回调事件记录中展示该错误码 | 否 | 待真机执行 |

## 说明

1. 自动化用例位于entry/src/ohosTest/ets/test目录，Assessment.test.ets覆盖接口调用，AssessmentUi.test.ets覆盖主页面布局与交互，用例命名遵循"包名_测试功能_序号"规范，DOMAIN为0xF811。
2. 接口调用类用例先以canIUse('SystemCapability.Customization.AssessmentConfiguration')做前置门禁。镜像未集成评估管理服务时，assessment命名空间在运行时为undefined，调用抛的是TypeError而非业务错误码，err.code为undefined，因此门禁不通过时记录warn日志后直接返回（hypium计为Pass）；门禁通过后才执行断言，201（Permission denied）与801（Capability not supported）的兼容判断只在能力真实存在的设备上生效，不损失回归检测能力。
3. UI用例有三点约定：每个用例自行拉起EntryAbility，不依赖前序用例的执行顺序；TextInput输入后必须先收起软键盘（driver.pressBack），否则窗口被输入法压缩（实测720x1280下应用窗口由1136高缩到586高），下方卡片滑出List视口；组件查找统一走findComponent辅助函数，视口内找不到时回退到List容器的scrollSearch，规避List懒加载造成的假失败。
4. 标记为"否"的用例需要设备侧提供评估配置服务，并需要在真机上人工确认系统弹窗、能力限制与白名单生效情况。
5. 执行自动化用例前需完成工程签名：build-profile.json5的product必须显式引用signingConfig，否则产物为unsigned包无法安装；ohos.permission.ASSESSMENT_CONFIGURATION在设备侧的availableLevel为system_basic，自动签名生成的normal级profile会导致安装报错9568289，需改用带ACL的system_basic级profile。
6. 命令行强制停止应用后需等待约2秒再启动测试命令，进程未完全退出会导致整批用例失败。
7. 执行UI用例前设备必须处于解锁亮屏状态。设备掉线重连或息屏后可能停留在锁屏页，此时应用窗口虽被创建但被锁屏遮挡，uitest的dumpLayout与Driver.findComponent都取不到应用节点，表现为整批UI用例在开头断言处失败；可先执行uitest uiInput swipe 360 1000 360 300上滑解锁。
8. 本次回填结果来自OpenHarmony 7.0.0.43的RK板（720x1280，devicetype为default），该镜像未集成SystemCapability.Customization.AssessmentConfiguration，接口类用例仅验证了跳过分支，功能正确性需在支持评估管理能力的镜像上重新回填。
