# ArkuiDialogMigrationSample（弹窗迁移示例）测试用例归档

## 用例表

| 测试功能                                   | 预置条件     | 输入                                                               | 预期输出                                 | 是否自动 | 测试结果 |
|----------------------------------------| ------------ |----------------------------------------------------------------|----------------------------------------| :------- | -------- |
| 首页加载与列表导航                               | 设备正常运行 | 进入示例首页，点击"自定义弹出框/openCustomDialog"列表项                         | 跳转至openCustomDialog子列表页，列表显示正常       | 是       | Pass     |
| 完整示例：打开弹窗并更新属性                          | 设备正常运行 | 进入"完整示例"页面，点击"open dialog and update options"按钮，等待弹窗弹出后返回      | 弹窗从顶部弹出，1.5秒后位置更新为底部，关闭正常           | 是       | Pass     |
| 完整示例：打开弹窗并更新内容                          | 设备正常运行 | 进入"完整示例"页面，点击"open dialog and update content"按钮，等待弹窗弹出后返回      | 弹窗弹出，1.5秒后内容由"hello"更新为"update"，关闭正常 | 是       | Pass     |
| 使用DialogPresenter弹出自定义弹窗               | 设备正常运行 | 进入"使用DialogPresenter弹出自定义弹窗"页面，点击新接口按钮弹出弹窗，点击"关闭弹窗"按钮返回       | 弹窗弹出显示内容正常，关闭正常                       | 是       | Pass     |
| 使用promptAction.openCustomDialog弹出自定义弹窗 | 设备正常运行 | 进入"使用promptAction.openCustomDialog弹出自定义弹窗"页面，点击打开弹窗按钮，返回      | 弹窗弹出显示内容正常，关闭正常                       | 是       | Pass     |
| openCustomDialogWithController迁移前示例     | 设备正常运行 | 进入"openCustomDialogWithController迁移前示例"页面，点击"打开 openCustomDialogWithController"按钮，返回 | 弹窗弹出显示内容正常，关闭正常                       | 是       | Pass     |
| openCustomDialogWithController迁移后示例     | 设备正常运行 | 进入"openCustomDialogWithController迁移后示例"页面，点击新接口按钮弹出弹窗，返回       | 弹窗弹出显示内容正常，关闭正常                       | 是       | Pass     |
| PresentCustomDialog迁移前示例               | 设备正常运行 | 进入"PresentCustomDialog迁移前示例"页面，点击"打开 presentCustomDialog"按钮，点击"关闭弹窗"按钮，返回 | 弹窗弹出显示内容正常，关闭正常                       | 是       | Pass     |
| PresentCustomDialog迁移后示例               | 设备正常运行 | 进入"PresentCustomDialog迁移后示例"页面，点击新接口按钮弹出弹窗，返回       | 弹窗弹出显示内容正常，关闭正常                       | 是       | Pass     |
| ActionMenu迁移前示例                        | 设备正常运行 | 进入"ActionMenu迁移前示例"页面，点击老接口按钮，返回                               | 操作菜单弹出正常，交互显示正常                       | 是       | Pass     |
| ActionMenu迁移后示例                        | 设备正常运行 | 进入"ActionMenu迁移后示例"页面，点击"新接口：DialogPresenter.present（操作菜单）"按钮，点击菜单选项，返回 | 操作菜单弹出正常，点击选项后结果显示正常               | 是       | Pass     |
| ShowDialog迁移前示例                        | 设备正常运行 | 进入"ShowDialog迁移前示例"页面，点击老接口按钮，返回                               | 对话框弹出正常，交互显示正常                        | 是       | Pass     |
| ShowDialog迁移后示例                        | 设备正常运行 | 进入"ShowDialog迁移后示例"页面，点击"新接口：DialogPresenter.present（对话框）"按钮，点击"确认"或"取消"按钮，返回 | 对话框弹出正常，点击按钮后结果显示正常                 | 是       | Pass     |
| ActionSheet迁移前示例                       | 设备正常运行 | 进入"ActionSheet迁移前示例"页面，点击老接口按钮，返回                              | 列表选择弹窗弹出正常，交互显示正常                     | 是       | Pass     |
| ActionSheet迁移后示例                       | 设备正常运行 | 进入"ActionSheet迁移后示例"页面，点击"新接口：DialogPresenter.present（列表选择弹窗）"按钮，点击选项，返回 | 列表选择弹窗弹出正常，点击选项后结果显示正常             | 是       | Pass     |
| AlertDialog迁移前示例                      | 设备正常运行 | 进入"AlertDialog迁移前示例"页面，点击老接口按钮，返回                              | 警告弹窗弹出正常，交互显示正常                       | 是       | Pass     |
| AlertDialog迁移后示例                      | 设备正常运行 | 进入"AlertDialog迁移后示例"页面，点击"新接口：DialogPresenter.present（固定样式弹窗）"按钮，点击"确认"或"取消"按钮，返回 | 警告弹窗弹出正常，点击按钮后结果显示正常               | 是       | Pass     |
| CustomDialog迁移前示例                      | 设备正常运行 | 进入"CustomDialog迁移前示例"页面，点击"打开弹窗"按钮，点击"关闭"按钮，返回                 | 自定义弹窗弹出显示内容正常，关闭正常                    | 是       | Pass     |
| CustomDialog迁移后示例                      | 设备正常运行 | 进入"CustomDialog迁移后示例"页面，点击新接口按钮弹出弹窗，点击"关闭弹窗"按钮，返回              | 自定义弹窗弹出显示内容正常，关闭正常                    | 是       | Pass     |
| 页面级弹出框                                  | 设备正常运行 | 进入"自定义弹窗"列表页，点击"页面级弹出框"列表项，打开弹窗后返回                              | 弹窗随页面切换正常显示和关闭                        | 是       | Pass     |
| 基于Navigation导航的页面级弹出框                  | 设备正常运行 | 进入"自定义弹窗"列表页，点击"基于Navigation导航的页面级弹出框"列表项，打开弹窗后返回              | 弹窗在Navigation导航场景下显示和关闭正常            | 是       | Pass     |
