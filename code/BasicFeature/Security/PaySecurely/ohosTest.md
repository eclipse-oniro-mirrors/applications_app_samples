# PaySecurely测试用例归档

### 用例表

| 测试功能 | 预置条件       | 输入         | 预期输出                     | 是否自动 | 测试结果 |
|------|------------|------------|--------------------------|------|------|
| 拉起应用 | 设备正常运行     | 无          | 成功拉起应用                   | 是    | Pass |
| 主页   | 位于主页       | 无          | 显示商品列表                   | 是    | Pass |
| 主页   | 位于主页       | 点击商品       | 跳转支付页                    | 是    | Pass |
| 支付页  | 位于支付页      | 点击确认支付     | 弹出支付密码输入框                | 是    | Pass |
| 支付页  | 位于支付页密码输入框 | 输入密码111111 | 提示支付失败                   | 否    | Pass |
| 支付页  | 位于支付页密码输入框 | 输入密码123456 | 密码框消失，显示返回商家按钮，5s后自动回到主页 | 否    | Pass |

