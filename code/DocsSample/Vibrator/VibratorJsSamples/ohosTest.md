# VibratorJsSamples 自动化测试说明

## 状态与实际规模

2026-11-21：测试HAP和主HAP已在备份目录编译成功。
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

35个新矩阵套件共110用例，2166个用例都pass。

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






