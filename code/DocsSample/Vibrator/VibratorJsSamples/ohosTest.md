# VibratorJsSamples 自动化测试说明

## 状态与实际规模

2026-11-21：测试HAP和主HAP已在备份目录编译成功，均未签名。
`hdc list targets`返回`[Empty]`，全部用例未安装、未执行；不填写Pass或无crash结论。

共41套件、143个全局唯一`testXxxNNNN`用例、44个ETS文件、52224行ETS。
行数包含显式矩阵输入/预期、版权头、元数据、空行及辅助代码，不等同于业务覆盖点数量。
入口为`entry/src/ohosTest/ets/test/List.test.ets`：SDK构造在前，真实资源之后，UI最后。

| 文件或家族（entry/src/ohosTest/ets/test/下） | 文件数 | 用例数 | ETS行数 | 新矩阵唯一输入数 |
| --- | ---: | ---: | ---: | ---: |
| VibratorTransientAmplitudeTable01–03.test.ets | 3 | 12 | 5781 | 300 |
| VibratorTransientOptionTable01–02.test.ets | 2 | 8 | 3422 | 192 |
| VibratorContinuousScheduleTable01–12.test.ets | 12 | 45 | 20892 | 1080 |
| VibratorContinuousAmplitudeTable01–03.test.ets | 3 | 12 | 5781 | 300 |
| VibratorContinuousOptionTable01–02.test.ets | 2 | 5 | 2162 | 120 |
| VibratorContinuousCurveTable01–05.test.ets | 5 | 20 | 10151 | 78 |
| VibratorMixedSequence101/201/301/401/501/601/701/801.test.ets | 8 | 8 | 2168 | 96 |
| VibratorPatternBuilderMatrix.test.ets | 1 | 9 | 328 | — |
| VibratorPatternBuilderGuard.test.ets | 1 | 3 | 185 | — |
| VibratorBuilderStateGuard.test.ets | 1 | 8 | 328 | — |
| Ability.test.ets | 1 | 6 | 335 | — |
| VibratorSample.test.ets | 1 | 3 | 198 | — |
| VibratorPickerSequence.test.ets | 1 | 4 | 237 | — |
| List.test.ets、TestPace.ets、BuilderMatrixSupport.ets | 3 | 0 | 256 | — |
| 合计 | 44 | 143 | 52224 | 2166 |

35个新矩阵套件共110用例，2166个输入在这些矩阵之间不重复，不使用`index % N`模板轮转。
全部130条SDK构造/守卫用例只测试sample使用的SDK依赖，不导入main或宣称覆盖主页面振动流程。
另有6条真实资源用例和7条真实UI用例。

## 行为与断言

| 类别 | 输入/动作 | 结果与不变量 |
| --- | --- | --- |
| 时间与时长 | 24个时间值×15个长事件时长×3通道 | time包含0/1800000，duration包含1/5000；事件字段及独立累计值一致 |
| 强度与频率 | 长/短事件、强度/频率/通道组合 | 显式0不回退默认值，短事件duration固定48 |
| 可选参数 | 省略或提供intensity、frequency、index | 默认100/50/0与显式选项分别检查 |
| 曲线 | 点数4至16、三通道、升/降包络 | 点time、整数百分比强度及频移逐点一致 |
| 混合序列 | 长短事件、逆序添加、多通道 | 各自字段不串数据，不强加SDK数组排序承诺 |
| 基础与非法参数 | 默认/边界、链式构造、非法字段 | 验证事件内容及401，错误code先转为Number |
| 状态守卫 | 空build、128/129事件、失败后恢复 | 空build/129返回401，128有效，非法Add不污染已有事件 |
| 曲线守卫 | time越界、3/17点、4点恢复 | 非法Add返回401，已有事件保留；0.25点强度输出25 |
| 对象隔离 | 两builder交错、修改Add输入或build输出 | 不影响其它builder、已保存事件及后续build结果 |
| 真实资源 | 安装主模块、entry字符串、raw JSON及事件构造 | 原资源两个长事件累计30ms、结束40ms；第二改短事件后结束73ms、间隔10ms |
| raw fd | 全量及分段offset读取，交叉比较资源字节 | 内容及元数据一致，finally配对closeRawFdSync |
| UI初始状态 | 真实EntryAbility页面 | preset为preset:、effect空且为TextInput、usage为unknown |
| UI取消/重开 | effect/usage打开、取消、交错和重开 | 默认warning/unknown行在picker内居中；取消保持输入、preset、callback |
| UI查询 | 实际高清能力与设备列表按钮 | callback准确，布尔回显与SDK一致；前后拓扑稳定后比较数量与deviceId集合 |

矩阵调用真实VibratorPatternBuilder；输入与预期分开声明，输出逐字段检查后再核对独立计算的
事件数、总时长和通道加权强度。实际与预期分别排序后比较，不要求SDK原始枚举顺序。
资源读取真实main资源，不复制原始JSON充当业务结果。上述运行结果均待真机验证。

## 注册、节流与UI生命周期

- 总用例数控制为143，不生成数千个it；每个新矩阵文件最多4例、单个矩阵最多25事件。
- 数据放在`runMatrixNNNN()`内，仅执行时分配；it注册回调短小，describe不计算矩阵、不创建Driver。
- 所有套件beforeEach调用真实30ms定时器的`paceTurn()`；128事件用例中途额外让出事件循环。
  不用0ms定时器、长固定sleep、class分批或放大全轮timeout掩盖crash。
- 7条UI用例共享懒初始化Driver和启动Promise，一轮最多启动主EntryAbility一次，且只在UI执行时启动。
  初始化失败保留被拒绝的Promise，不吞异常或偷偷重启。
- 不使用AbilityMonitor、MockKit、terminateSelf或用例内反复重建Ability。
  选择器用finally清理，仅TextPicker存在才pressBack；3000ms为条件等待上限，不是固定等待。
- effect/usage只走取消，不点确认；仅查询设备能力，不调用startVibration、stopVibration或on/off。

这些措施针对注册耗时、连续微任务和生命周期风险；单例/全量耗时与无崩溃性尚未实测。

## SDK结果依据与限制

声明依据：`E:/backup/ohsdk/26.0.0/ets/api/@ohos.vibrator.d.ts`。
默认值、范围、百分比转换、状态与隔离预期另核对了
[eclipse-oniro-mirrors/sensors_miscdevice](https://github.com/eclipse-oniro-mirrors/sensors_miscdevice)
的`frameworks/js/napi/vibrator/src/vibrator_pattern_js.cpp`；目标设备实现仍须实测确认。

- time为0至1800000，continuous duration为1至5000且必填，transient duration为48。
- event intensity/frequency为0至100，默认100/50；index为0至2、默认0；pattern.time为0。
- build接受1至128事件，0或129返回401；Add解析成功后保存事件，build生成新的返回对象。
- 非空曲线为4至16点，点time在0至event.duration内，frequency为-100至100、默认0。
- 曲线输入intensity为0至1，native乘100转整数返回；0.25输出25，1或省略输出100，不能断言输出1。

本地声明与native参考不能替代目标镜像的接口、硬件效果及系统能力验证。

## 构建、配置与审计

仅在`E:/backup/VibratorJsSamples`构建，工具为DevEco Studio 6.1.1与OpenHarmony 26.0.0 SDK。
compileSdkVersion为字符串26.0.0，compatibleSdkVersion/targetSdkVersion保持20，runtimeOS保持OpenHarmony。
测试模块为entry_test，deviceTypes仍为default/tablet；本轮未进一步修改配置，未保存签名材料。

| 产物/记录 | 绝对路径 | 结果 |
| --- | --- | --- |
| 最终测试构建日志 | E:/backup/vibrator_50k_test_final.log | BUILD SUCCESSFUL，10s635ms |
| 最终主HAP构建日志 | E:/backup/vibrator_50k_main_final.log | BUILD SUCCESSFUL，5s997ms |
| 用例元数据审计 | E:/backup/vibrator_50k_cases_audit.log | 143例，重复名称/编号、元数据问题及少于3条静态expect均为0 |
| 范围/格式审计 | E:/backup/vibrator_50k_final_audit.json | 52224行、41套件，保护文件及源/备份测试零差异 |
| 本轮保护基线 | E:/backup/vibrator_50k_20261121_baseline.json | main/AppScope共20文件哈希零差异 |
| 测试产物 | E:/backup/VibratorJsSamples/entry/build/default/outputs/ohosTest/entry-ohosTest-unsigned.hap | unsigned |
| 主产物 | E:/backup/VibratorJsSamples/entry/build/default/outputs/default/entry-default-unsigned.hap | unsigned |

已使用pr-review_origin检视类型、日志、格式、安全与具体语义；静态审计不能解释为运行通过。
未修改main、AppScope、权限或测试deviceTypes，未提交git，未将构建生成物/依赖锁文件复制回源码。
构建仍有createModuleContext弃用及UI调用可能抛异常的警告；异常向Hypium传播，不以假成功处理。

## 真机验证与未覆盖项

unsigned产物不能宣称可直接安装；需已有授权的签名与适配镜像，不在仓库保存签名材料。
安装签名后的主/测试HAP，亮屏、解锁并关闭遮挡弹窗。每轮在测试外部冷启动应用，一次运行全部143例：


不加class过滤；同一构建连续两轮核对`Tests run: 143, Failure: 0, Pass: 143`与`OHOS_REPORT_RESULT`。
`TestFinished-ResultCode: 0`只代表runner结束，不是全通过证据；当前没有上述运行日志。

待验证：目标SDK输出与401、128/129边界和对象隔离、entry资源/raw fd、picker节点与几何、
TextInput空值、取消后的状态、查询按钮可见性、共享懒启动生命周期及单次全量稳定性。
未覆盖：真实振动效果、启动/停止、权限弹窗、热插拔、on/off订阅、preset确认与振动链。
不改业务来导出纯逻辑，也不以SDK矩阵替代这些业务场景的验收。
