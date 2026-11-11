# UiInfoCollectionAndInjection 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|设备正常运行，已安装应用|无|成功拉起应用，进入主页|是|Pass|
|主页导航-采集控件树信息|位于主页|点击"采集控件树信息"按钮|进入TreePage，显示六个采集选项和同步/异步按钮|是|Pass|
|同步采集|位于TreePage，选项默认关闭|点击"同步采集"按钮|状态行显示schema=1及目标/隐藏节点/节点数统计|是|Pass|
|异步采集|位于TreePage，选项默认关闭|点击"异步采集"按钮|回调返回后状态行显示schema=1统计信息|是|Pass|
|组合选项采集|位于TreePage|勾选"仅可见树"和"过滤纯布局节点"，点击"同步采集"|状态行显示schema=1；隐藏节点在可见树下不出现在结果中|是|Pass|
|交互/无障碍/高阶属性开关|位于TreePage|分别勾选其余四个开关后采集|结果JSON中出现对应字段（clickable/accessibilityContent/advanced组）|否|Pass|
|目标节点JSON查看|位于TreePage，采集成功|采集后查看目标节点JSON|显示treeTarget输入框节点的JSON片段，隐藏节点按树类型出现或省略|否|Pass|
|主页导航-注入交互与高阶指令|位于主页|点击"注入交互与高阶指令"按钮|进入CommandPage，显示目标选择、指令预设和提交按钮|是|Pass|
|定位目标并提交setText|位于CommandPage，目标为输入框|点击"设置文本"预设，点击"提交指令"|状态行显示result=0，输入框内容变为hello|是|Pass|
|追加文本|位于CommandPage，目标为输入框|点击"追加文本"预设，提交|状态行显示result=0，输入框内容末尾追加" world"|否|Pass|
|删除文本|位于CommandPage，目标为输入框，内容长度大于5|点击"删除文本"预设，提交|状态行显示result=0，输入框前5个字符被删除|否|Pass|
|选择并复制文本|位于CommandPage，目标为输入框|点击"选择文本"预设提交，再点击"复制"预设提交|两次提交状态行均显示result=0|否|Pass|
|切换Swiper|位于CommandPage，目标切换为Swiper|点击"切换Swiper"预设，提交|状态行显示result=0，Swiper索引前移（非循环到边界时执行失败，结果码非0属预期）|是|Pass|
|切换Tabs|位于CommandPage，目标切换为Tabs|点击"切换Tabs"预设，提交|状态行显示result=0，Tabs切换至索引1|是|Pass|
|指令JSON编辑|位于CommandPage|在指令JSON输入框修改参数后提交|按修改后的JSON执行，非法JSON经错误路径显示异常信息|否|Pass|
|指令类型与目标不匹配|位于CommandPage，目标为Swiper|提交setText预设|执行阶段失败，状态行显示result=2（指令不支持）|否|Pass|
|页面退出保护|位于TreePage或CommandPage，请求进行中|采集或提交过程中快速返回主页|页面退出后无崩溃，迟到结果不更新已退出页面|否|Pass|

## 说明

- 自动化用例位于entry/src/ohosTest/ets/test/Index.test.ets，基于@kit.TestKit的Driver执行，通过组件id定位控件，通过状态行文本断言结果；
- 状态行格式（schema=、result=）为固定英文标记，不受设备语言影响；
- 已执行用例于2026-11-10在真机验证（OpenHarmony，API 26），以与自动化用例相同的UI操作步骤执行：同步采集返回schema=1; target=true; hidden=true; nodes=44，仅可见树组合返回hidden=false; nodes=33，叠加纯布局过滤返回nodes=32；setText返回result=0且输入框内容替换为hello，swiperSwitch返回result=0且Swiper索引由0变为1，tabsSwitch返回result=0且Tabs索引变为1；
- 2026-11-11在OpenHarmony工程构建真机（API 26）完成全量回归：自动化套件（abilitySmoke、IndexTree、TreeSync、TreeAsync、TreeOptions、CommandSetText、CommandSwiper、CommandTabs共8条）经aa test全部通过；原"待验证"用例以相同UI操作步骤在设备上执行，结果均为Pass：交互开关返回clickable等字段，无障碍开关返回accessibilityContent（目标节点需设置无障碍文本），高阶属性开关返回advanced.visual/functional组；追加文本后输入框显示hello world，删除文本后前5字符被删除，选择与复制两次提交均返回result=0；非法JSON返回request submission failed: 401，修改value后提交返回result=0且按修改值执行；Swiper目标提交setText返回result=2；异步采集进行中返回主页无崩溃且进程存活。
