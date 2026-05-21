# arkXtest测试用例

## 用例表

| 测试功能                            |预置条件|输入|预期输出|测试结果|
|---------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| UI操作点击指定按钮后，界面变化是否符合预期 | 设备正常运行 | 点击文本为'toClickToAfterIndex'的控件，再点击文本为'Next'的控件 | 文本为'after click'的控件存在，页面变化符合预期 | Pass |
| 查找类型为'Button'的控件，并进行控件点击操作 | 设备正常运行 | 使用ON.type('Button')查找Button类型控件并点击 | 成功找到Button控件并完成点击操作 | Pass |
| 利用相对位置查找控件，查找'Scroll'类型控件中文本内容为'123'的控件 | 设备正常运行 | 使用ON.text('123').within(ON.type('Scroll'))进行相对位置查找 | 成功找到Scroll内文本为'123'的控件 | Pass |
| 查找类型为'Image'的控件，并对其进行双指放大操作 | 设备正常运行 | 使用ON.type('Image')查找Image控件并执行pinchOut(1.5)放大 | 成功找到Image控件并完成双指放大操作 | Pass |
| 使用ON.id获取单个组件，验证组件id属性 | 设备正常运行 | 使用ON.id('idTest')查找控件并获取id | 控件id等于'idTest' | Pass |
| 使用ON.id获取多个组件，验证多个组件文本内容 | 设备正常运行 | 使用ON.id('scroll_item')查找多个控件 | 各控件文本内容与预期数组[0-9]一致 | Pass |
| 使用ON.isBefore获取单个组件，验证组件位于指定控件之前 | 设备正常运行 | 使用ON.type('Radio').isBefore(ON.id('radio_test1'))查找控件 | 控件类型为'Radio'，id为'radio_test' | Pass |
| 使用ON.isAfter获取单个组件，验证组件位于指定控件之后 | 设备正常运行 | 使用ON.type('Radio').isAfter(ON.id('radio_test'))查找控件 | 控件类型为'Radio'，id为'radio_test1' | Pass |
| 使用不同的匹配模式获取控件对象 | 设备正常运行 | 使用MatchPattern.EQUALS和STARTS_WITH查找控件 | EQUALS匹配'unit_jsunit'成功，STARTS_WITH匹配'unit'成功 | Pass |
| 使用ScrollSearch获取单个组件 | 设备正常运行 | 在Scroll控件中scrollSearch查找文本为'1'的控件 | 控件文本等于'1' | Pass |
| 验证组件的description属性 | 设备正常运行 | 使用ON.type('Text').description('')查找控件并获取description | description等于空字符串 | Pass |
| 验证组件的within属性，子控件在父控件范围内 | 设备正常运行 | 使用ON.within(ON.type('Scroll')).text('0')查找控件 | 控件文本为'0'，且在Scroll控件bounds范围内 | Pass |
| 多屏获取组件对象 | 设备正常运行 | 使用ON.belongingDisplay(displayId).text('Next')查找控件 | 控件文本等于'Next' | Pass |
| 组件获取displayId | 设备正常运行 | 获取控件的displayId并与默认屏幕id比较 | 控件displayId与默认屏幕id一致 | Pass |
| 组件获取屏幕大小 | 设备正常运行 | 调用driver.getDisplaySize(displayId)获取屏幕尺寸 | 屏幕宽高均不为0 | Pass |
| 组件获取屏幕密度 | 设备正常运行 | 调用driver.getDisplayDensity(displayId)获取屏幕密度 | 屏幕密度x和y均不为0 | Pass |
| 组件获取屏幕方向 | 设备正常运行 | 调用driver.getDisplayRotation(displayId)获取屏幕旋转方向 | 旋转方向为ROTATION_0/90/180/270之一 | Pass |
| 检测uitest Component click功能 | 设备正常运行 | 点击文本为'singleClick'的按钮 | 出现文本为'back to index'的控件，点击操作符合预期 | Pass |
| 检测uitest double click功能 | 设备正常运行 | 双击文本为'Click twice'的按钮 | 出现文本为'doubleClick'的控件，双击操作符合预期 | Pass |
| 检测uitest long click功能 | 设备正常运行 | 长按文本为'LongClick'的按钮 | 出现文本为'longClick'的控件，长按操作符合预期 | Pass |
| 检测uitest Driver longClickAt功能（API20） | 设备正常运行 | 获取LongClick按钮中心坐标，调用driver.longClickAt长按3000ms | 出现文本为'longClick'的控件，指定坐标长按操作符合预期 | Pass |
| 检测uitest PressBack功能 | 设备正常运行 | 长按LongClick按钮后调用driver.pressBack()返回 | 返回后文本为'Click twice'的控件存在，PressBack操作符合预期 | Pass |
| 检测uitest triggerKey功能 | 设备正常运行 | 长按LongClick按钮后调用driver.triggerKey(2)注入返回键 | 返回后文本为'Click twice'的控件存在，triggerKey操作符合预期 | Pass |
| 检测uitest Driver clickAt功能（API20） | 设备正常运行 | 获取singleClick按钮中心坐标，调用driver.clickAt点击 | 出现文本为'back to index'的控件，指定坐标点击操作符合预期 | Pass |
| 检测uitest Driver doubleClickAt功能（API20） | 设备正常运行 | 获取Click twice按钮中心坐标，调用driver.doubleClickAt双击 | 出现文本为'doubleClick'的控件，指定坐标双击操作符合预期 | Pass |
| 检测uitest fling水平抛滑功能（坐标点仅支持RK3568） | 设备正常运行 | 在swiper控件区域从左到右执行两次fling操作 | swiper_text文本变为'arkUI'，水平抛滑操作符合预期 | Pass |
| 检测uitest fling竖直抛滑功能（坐标点仅支持RK3568） | 设备正常运行 | 从(400,700)到(400,200)执行fling向上抛滑 | scroll_item文本不为'0'，竖直抛滑操作符合预期 | Pass |
| 检测uitest fling垂直滑动功能（坐标点仅支持RK3568） | 设备正常运行 | 使用UiDirection.DOWN执行fling向下滑动 | 向下滑后'wearList1'控件消失，向上滑后'wearList1'控件出现，操作符合预期 | Pass |
| 检测uitest fling多屏垂直滑动功能（坐标点仅支持RK3568） | 设备正常运行 | 使用UiDirection.DOWN/UP带displayId执行fling操作 | 向下滑后'wearList1'控件消失，向上滑后'wearList1'控件出现，多屏操作符合预期 | Pass |
| 检测uitest inputText功能 | 设备正常运行 | 对TextInput控件调用inputText('123') | 控件文本变为'123'，输入操作符合预期 | Pass |
| 检测uitest inputText输入中文功能测试 | 设备正常运行 | 对TextInput控件调用inputText('中文测试') | 控件文本变为'中文测试'，中文输入操作符合预期 | Pass |
| 检测uitest指定坐标位置inputText输入功能测试 | 设备正常运行 | 获取TextInput中心坐标，清空文本后调用driver.inputText(center, '1234556') | 控件文本变为'1234556'，坐标输入操作符合预期 | Pass |
| 检测uitest clearText功能 | 设备正常运行 | 对TextInput先输入'abc'再调用clearText() | 控件文本被清空为''，clearText操作符合预期 | Pass |
| 检测uitest inputText指定paste和addition为false（API20） | 设备正常运行 | 在指定坐标输入'123'，paste=false，addition=false | 控件文本为'123'，输入操作符合预期 | Pass |
| 检测uitest inputText指定paste为true、addition为false（API20） | 设备正常运行 | 在指定坐标输入'123'，paste=true，addition=false | 控件文本为'123'，粘贴方式输入操作符合预期 | Pass |
| 多屏下triggerCombineKeys测试（API20） | 设备正常运行 | 输入'123'后通过组合键Ctrl+A全选、Ctrl+C复制、清空后Ctrl+V粘贴 | 粘贴后控件文本为'123'，多屏组合键操作符合预期 | Pass |
| toast监听测试 | 设备正常运行 | 创建UIEventObserver监听Toast，点击'showToast'按钮触发Toast | 监听到Toast的bundleName、text为'testMessage'、type为'Toast'，toast监听操作符合预期 | Pass |
| dialog监听测试 | 设备正常运行 | 创建UIEventObserver监听Dialog，点击'showDialog'按钮触发Dialog | 监听到Dialog的bundleName、text为'testDialogtestMessage'、type为'AlertDialog'，dialog监听操作符合预期 | Pass |
| 检测uitest pinchIn缩小功能 | 设备正常运行 | 对pinch_ima控件执行pinchIn(0.3)缩小0.3倍 | 缩小前后控件bounds发生变化，pinchIn操作符合预期 | Pass |
| 检测uitest pinchOut放大功能 | 设备正常运行 | 对pinch_ima_out控件执行pinchOut(1.2)放大1.2倍 | 放大前后控件bounds发生变化，pinchOut操作符合预期 | Pass |
| 检测uitest先缩小再放大功能 | 设备正常运行 | 对控件先执行pinchIn(0.5)缩小再执行pinchOut(1.5)放大 | 缩小后bounds变化，放大后bounds再次变化，操作符合预期 | Pass |
| 检测uitest screenCap功能 | 设备正常运行 | 调用driver.screenCap保存全屏截图到指定路径 | 截图保存成功返回true，screenCap操作符合预期 | Pass |
| 检测uitest screenCapture指定大小截图功能 | 设备正常运行 | 调用driver.screenCapture保存区域截图(0,0,100,100)到指定路径 | 指定区域截图保存成功返回true，screenCapture操作符合预期 | Pass |
| 检测多屏下uitest screenCapture指定大小截图功能（API20） | 设备正常运行 | 获取默认屏幕id后调用driver.screenCap带displayId进行多屏截图 | 多屏截图保存成功返回true，多屏screenCapture操作符合预期 | Pass |
| 检测uitest scrollToBottom滑到底部功能 | 设备正常运行 | 对Scroll控件执行scrollToBottom() | scroller_item_text文本不为'0'，滑动到底部操作符合预期 | Pass |
| 检测uitest scrollToTop滑到顶部功能 | 设备正常运行 | 对Scroll控件先scrollToBottom()再scrollToTop() | scroller_item_text文本为'0'，滑回顶部操作符合预期 | Pass |
| 检测uitest swipe水平滑动功能（坐标点仅支持RK3568） | 设备正常运行 | 在swiper控件区域执行两次从左到右的swipe操作 | swiper_text文本变为'arkUI'，水平滑动操作符合预期 | Pass |
| 检测uitest swipe竖直滑动功能（坐标点仅支持RK3568） | 设备正常运行 | 从(400,700)到(400,300)执行swipe向上滑动 | scroll_item_0控件因滑动不可见而查找失败，竖直滑动操作符合预期 | Pass |
| 检测uitest swipe多屏竖直滑动功能（API20） | 设备正常运行 | 使用swipeBetween带displayId在scroll区域执行上下滑动 | scroller_item_text文本不为'0'，多屏滑动操作符合预期 | Pass |
| webview控件加载html页面，根据html中的控件id查询到控件，并对控件进行操作 | 设备正常运行 | 导航到Web页面，查找webComponent控件，在其中心坐标输入'hello'文本 | 文本输入操作执行成功，web控件操作符合预期 | Pass |
| 检测window1.moveTo功能 | 设备正常运行 | 查找窗口后执行resume()，再调用moveTo(100,100)移动窗口 | 移动前后窗口bounds发生变化，moveTo操作符合预期（不支持设备捕获异常） | Pass |
| 获取、切换屏幕显示方向 | 设备正常运行 | 依次设置屏幕旋转为ROTATION_0/90/180/270并获取旋转方向 | 屏幕旋转方向切换正确，setDisplayRotation/getDisplayRotation操作符合预期 | Pass |
| 唤醒屏幕 | 设备正常运行 | 调用driver.wakeUpDisplay()唤醒屏幕 | 屏幕唤醒操作执行成功，wakeUpDisplay操作符合预期 | Pass |
| 设置window指定的大小与方向测试 | 设备正常运行 | 查找窗口后依次resize(600,600,RIGHT_DOWN)、(400,400,RIGHT_UP)、(300,300,LEFT_DOWN)、(500,500,LEFT_UP) | 每次resize后窗口bounds发生变化，resize操作符合预期（不支持设备捕获异常） | Pass |
| 设置window最大窗口 | 设备正常运行 | 查找窗口后调用resume()再调用maximize() | 窗口模式变为WindowMode.FULLSCREEN，maximize操作符合预期 | Pass |
| 设置window最小窗口 | 设备正常运行 | 查找窗口后调用resume()再调用minimize() | 最小化后查找窗口返回null，minimize操作符合预期 | Pass |
| 获取window对象属性，获取对象与预期一致 | 设备正常运行 | 查找窗口后调用getBundleName()获取bundle名称 | 获取的bundleName与应用bundleName一致，getBundleName操作符合预期 | Pass |