# Navigation 测试用例归档

## 用例表

| 测试功能            | 预置条件       | 输入                                    | 预期输出        | 是否自动 | 测试结果 |
| ------------------- | -------------- |---------------------------------------|-------------| :------- | -------- |
| 测试使用ContentSlot挂载Native侧的文本列表    | 设备正常运行   | 进入示例页面，点击按钮出现文本列表，下拉到页面底部，然后返回        | 文本列表显示正常，滑动页面正常 | 是       | Pass     |
| 测试设置和获取ArkTS命令式节点的跨语言配置    | 设备正常运行   | 点击CrossLanguage按钮进入跨语言页面，点击setCrossLanguageOptions按钮        | CrossLanguageOptions文本显示attributeSetting在true和false之间切换 | 否       | Pass     |
| 测试Native侧跨语言修改ArkTS节点属性    | 设备正常运行   | 进入跨语言页面，先点击setCrossLanguageOptions按钮开启跨语言属性设置，再分别点击Native侧scrollBarColor和scrollBarWidth按钮        | ArkTS侧Scroll组件滚动条颜色变为绿色、宽度变粗；未开启跨语言属性设置时点击Native侧按钮，滚动条属性不变 | 否       | Pass     |
