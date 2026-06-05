# PickerCAPI测试用例

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|:---|:---|:---|:---|:---:|:---:|
| 验证PickerCanLoop循环滚动功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerCanLoop"进入功能页 <br/> 2、点击"canLoop: true"按钮 | 1、按钮文字切换为"canLoop: false"，按钮颜色变为灰色 <br/> 2、Picker滑动到最后一项后无法循环回到第一项 | 否 | Pass |
| 验证PickerCanLoop触觉反馈功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerCanLoop"进入功能页 <br/> 2、点击"hapticFeedback: true"按钮 | 1、按钮文字切换为"hapticFeedback: false"，按钮颜色变为灰色 <br/> 2、滑动Picker时不再有触觉振动反馈 | 否 | Pass |
| 验证PickerEvents onChange事件 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerEvents"进入功能页 <br/> 2、滑动Picker选择不同选项 | 1、下方文字实时更新显示"on change: [选中项文本]" <br/> 2、选项包括"待办"、"进行中"、"已完成" | 否 | Pass |
| 验证PickerEvents onScrollStop事件 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerEvents"进入功能页 <br/> 2、滑动Picker并停止 | 1、下方文字更新显示"on scroll stop: [选中项文本]" <br/> 2、仅在滚动停止后触发更新 | 否 | Pass |
| 验证PickerIndex选中索引功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerIndex"进入功能页 <br/> 2、滑动Picker选择不同选项 | 1、Picker显示5个可见项，每项高度48vp <br/> 2、下方文字实时更新显示"selectedIndex: [当前索引值]" | 否 | Pass |
| 验证PickerIndicator背景指示器功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerIndicator"进入功能页 <br/> 2、点击"背景指示器"按钮 | 1、Picker显示背景指示器样式 <br/> 2、"背景指示器"按钮变为绿色 <br/> 3、可点击corner和color子按钮调整圆角(2vp/10vp)和背景色(粉色/灰色) | 否 | Pass |
| 验证PickerIndicator分割线指示器功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerIndicator"进入功能页 <br/> 2、点击"分割线指示器"按钮 | 1、Picker显示分割线指示器样式 <br/> 2、"分割线指示器"按钮变为绿色 <br/> 3、可点击width、margin、color子按钮调整分割线宽度(2vp/10vp)、边距(2vp/10vp)和颜色(粉色/灰色) | 否 | Pass |
| 验证PickerIndicator清除指示器功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerIndicator"进入功能页 <br/> 2、先设置背景或分割线指示器 <br/> 3、点击"清除"按钮 | 1、指示器样式被清除 <br/> 2、"清除"按钮显示为红色 <br/> 3、所有子按钮恢复未选中状态 | 否 | Pass |
| 验证PickerMonth月选择功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerMonth"进入功能页 <br/> 2、滑动Picker选择月份 | 1、Picker显示"1月"至"12月"选项 <br/> 2、使用分割线指示器样式，可循环滚动 <br/> 3、滚动停止后选中对应月份 | 否 | Pass |
| 验证PickerRegion省市区联动功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerRegion"进入功能页 <br/> 2、滑动省份Picker选择"吉林省" | 1、城市Picker数据刷新为吉林省的城市列表 <br/> 2、区县Picker数据同步刷新 <br/> 3、城市和区县Picker选中索引重置为0 | 否 | Pass |
| 验证PickerRegion市区联动功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerRegion"进入功能页 <br/> 2、滑动城市Picker选择不同城市 | 1、区县Picker数据刷新为所选城市的区县列表 <br/> 2、区县Picker选中索引重置为0 | 否 | Pass |
| 验证PickerTime时间选择功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerTime"进入功能页 <br/> 2、滑动各Picker选择时间 | 1、显示时、分、秒Picker及AM/PM Picker <br/> 2、下方状态标签实时显示当前选中时间 <br/> 3、使用背景指示器样式，圆角24vp | 否 | Pass |
| 验证PickerTime showSecond切换功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerTime"进入功能页 <br/> 2、关闭"show second"开关 | 1、秒Picker从界面移除 <br/> 2、时间显示格式不再包含秒 <br/> 3、重新打开开关后秒Picker恢复显示 | 否 | Pass |
| 验证PickerTime 12/24小时制切换功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerTime"进入功能页 <br/> 2、切换"use military"开关 | 1、24小时制时AM/PM Picker消失，小时Picker显示0-23 <br/> 2、12小时制时AM/PM Picker显示，小时Picker显示1-12 <br/> 3、小时数值自动转换 | 否 | Pass |
| 验证PickerTime两位数显示切换功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerTime"进入功能页 <br/> 2、切换"2-digits"开关 | 1、开启时数值显示为两位数格式(如"01"、"02") <br/> 2、关闭时数值显示为一位数格式(如"1"、"2") | 否 | Pass |
| 验证PickerTypes纯文本选项功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerTypes"进入功能页 <br/> 2、查看第一个Picker | 1、Picker显示纯文本选项"text1"至"text6" <br/> 2、使用分割线指示器样式，可循环滚动 | 否 | Pass |
| 验证PickerTypes纯图片选项功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerTypes"进入功能页 <br/> 2、查看第二个Picker | 1、Picker显示纯图片选项，每个选项为ARKUI_NODE_IMAGE节点 <br/> 2、图片正常渲染无变形 | 否 | Pass |
| 验证PickerTypes图文混合选项功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 | 1、点击"PickerTypes"进入功能页 <br/> 2、查看第三个Picker | 1、Picker显示图文混合选项，每个选项为ARKUI_NODE_ROW节点包含图片和文本 <br/> 2、图片和文字同时显示在同一选项中 | 否 | Pass |
| 验证Native组件销毁功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 进入应用 <br/> 4. 已显示任意Picker功能页 | 1、返回主页面 | 1、Picker组件从界面消失 <br/> 2、ContentSlot区域恢复空白 | 否 | Pass |