# 测试用例归档

## 用例表

| 测试功能           | 预置条件                                      | 输入                                                              | 预期输出                       | 是否自动 | 测试结果 |
| ------------------ | --------------------------------------------- | ----------------------------------------------------------------- | ------------------------------ | -------- | -------- |
| 创建包过滤器       | 设备正常运行，已授权 TRAFFIC_FILTER 权限      | group_id、priority、packetCopyLen、nfqueueMaxlen、packetCopyMode  | 显示成功，返回 controller id   | 是       | pass     |
| 销毁包过滤器       | 已创建包过滤器                                | controller id                                                     | 显示 id 已销毁                 | 是       | pass     |
| 添加包过滤规则     | 已创建包过滤器                                | priority、hookPoint、protocol、源/目的 IP/端口等                  | 显示 addRule ok                | 是       | pass     |
| 清空包过滤规则     | 已创建包过滤器且已添加规则                    | controller id                                                     | 显示 clearRule ok              | 是       | pass     |
| 注册报文回调       | 已创建包过滤器                                | controller id、user_data                                          | 显示已注册回调                 | 是       | pass     |
| 取消报文回调       | 已注册回调                                    | controller id                                                     | 显示已取消回调                 | 是       | pass     |
