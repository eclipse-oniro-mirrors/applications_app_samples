# 页面加载效果实现案例测试用例

## 用例表

| 测试功能         | 预置条件                      | 输入            | 预期输出                                                | 是否自动 | 测试结果 |
|--------------|---------------------------|---------------|-----------------------------------------------------|------|------|
| 快速滑动，背景条自动左右滑动  | 	启动应用 | 	快速滑动tab页	 | 背景条自动左右滑动 | 否    | Pass |
| 滑动距离不足一半，背景条自动回弹       | 	启动应用                 | 	左右滑动距离不足单个页签一半        | 背景条自动回弹到当前页签                                          | 否    | Pass |
| 滑动距离超过一半，背景条自动滑动至下一页签       | 	启动应用                 | 	滑动距离超过页签一半        | 背景条进入下一页签                                          | 否    | Pass |
| 点击页签，背景条跳转至对应页签       | 	启动应用                 | 	点击相应页签         | 背景条跳转至对应页签                                        | 否    | Pass |

## 逻辑用例（数据驱动）

以下 2076 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| ComponentFactory.getBar（实例方法） | 无 | 30 组输入（CustomAnimationTab_ComponentFactoryGetBar_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ComponentFactory.toArray（实例方法） | 无 | 1 组输入（CustomAnimationTab_ComponentFactoryToArray_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ComponentFactory flow（调用序列） | 无 | 2000 组输入（CustomAnimationTab_ComponentFactoryFlow_0001~2000） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new AnimationAttribute（构造） | 无 | 1 组输入（CustomAnimationTab_AnimationAttributeCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| IndicatorBarAttribute（常量契约） | 无 | 2 组输入（CustomAnimationTab_IndicatorBarAttributeValues_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new TabBarAttribute（构造） | 无 | 2 组输入（CustomAnimationTab_TabBarAttributeCtor_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SizeMode（常量契约） | 无 | 2 组输入（CustomAnimationTab_SizeModeValues_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CommonConstants（常量契约） | 无 | 27 组输入（CustomAnimationTab_CommonConstantsValues_0001~0027） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CustomAnimationTabConfigure（常量契约） | 无 | 11 组输入（CustomAnimationTab_CustomAnimationTabConfigureValues_0001~0011） | 返回值与状态逐条符合预期 | 是 | 待执行 |
