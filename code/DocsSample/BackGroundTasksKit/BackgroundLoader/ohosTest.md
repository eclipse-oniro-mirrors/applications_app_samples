# BackgroundLoader 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|---|---|---|---|---|
|打开应用|设备正常运行| |正常拉起BackgroundLoader应用|Pass|
|注册后台加载任务|应用正常运行|点击"Register Task"按钮，输入abilityName和taskId后确认|注册成功，返回"Success"|Pass|
|查询后台加载任务信息|已注册后台加载任务|点击"Get Task Info"按钮，输入taskId后确认|返回任务信息（taskId和abilityName）|Pass|
|完成后台加载任务|已注册后台加载任务|点击"Finish Task"按钮，输入abilityName和taskId后确认|完成任务成功，返回"Success"|Pass|
|注销后台加载任务|已注册后台加载任务|点击"Unegister Task"按钮，输入abilityName和taskId后确认|注销成功，返回"Success"|Pass|

## 本地单元测试用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|---|---|---|---|---|
|ON_START常量验证|无|读取backgroundLoader.ON_START|ON_START为非空字符串|Pass|
|ON_STOP常量验证|无|读取backgroundLoader.ON_STOP|ON_STOP为非空字符串|Pass|
|ON_START与ON_STOP不相等|无|比较ON_START和ON_STOP|两者值不相等|Pass|
|注册任务参数校验|无|传入空abilityName和-1的taskId|接口抛出异常，error.code > 0|Pass|
|注销未注册任务|无|注销不存在的任务|接口抛出异常，error.code > 0|Pass|
|完成未注册任务|无|完成不存在的任务|接口抛出异常，error.code > 0|Pass|
|查询不存在的任务信息|无|查询taskId=99999|接口抛出异常，error.code > 0|Pass|
|注册并注销任务|无|注册任务后注销|注册和注销均成功|Pass|
|注册并查询任务信息|无|注册任务后查询|查询返回正确的taskId和abilityName|Pass|
|注册并完成任务|无|注册任务后完成|注册和完成均成功|Pass|
|TaskInfo属性验证|无|创建TaskInfo对象|abilityname和taskId属性正确|Pass|
