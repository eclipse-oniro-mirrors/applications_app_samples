# 下拉刷新与上滑加载案例 测试用例归档

## 用例表

| 测试功能                 | 预置条件          | 输入                              | 预期输出             | 是否自动 | 测试结果 |
|----------------------|---------------|---------------------------------|------------------|------|------|
| 验证上滑列表加载下一页功能        | 成功拉起应用，进入案例页面 | 1.上滑列表到底，提示玩命加载后加载下一页数据         | 1.成功加载下一页        | 是    | Pass |
| 验证列表加载完成后继续上滑提示已经到底了 | 成功拉起应用，进入案例页面 | 1.多次上滑到最后一页，继续上滑                | 1.底部提示列表已经到底     | 是    | Pass |
| 验证下拉列表刷新当前数据功能       | 成功拉起应用，进入案例页面 | 1.下拉列表到顶部，继续下拉出现提示释放刷新当前页面数据时释放 | 1.动画过后重新获取当前列表数据 | 否    | Pass |
| 验证下拉列表刷新下个数据功能       | 成功拉起应用，进入案例页面 | 1.下拉列表到最顶部                      | 1.动画过后刷新下一张列表数据  | 是    | Pass |