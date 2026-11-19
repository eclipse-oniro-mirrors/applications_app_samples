# ArkTS 卡片计算器测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| [页面计算器四则运算](./entry/src/ohosTest/ets/test/Expansion.test.ets)（源码第 1330 行） | 已加载页面和 ArkTS 卡片的生产计算函数 | 加减乘除表达式、带符号右操作数、除数边界 | 返回预期结果或既定的异常输入结果，符合原有字符串格式 | 是 | Pass（96/96） |
| [卡片计算器四则运算](./entry/src/ohosTest/ets/test/Expansion.test.ets#L910) | 已加载页面和 ArkTS 卡片的生产计算函数 | 加减乘除表达式、带符号右操作数、除数边界 | 卡片的计算结果或异常输入结果符合表达式的预期 | 是 | Pass（96/96） |
| [字面量与输入边界](./entry/src/ohosTest/ets/test/Expansion.test.ets)（源码第 1030 行） | 已加载页面和 ArkTS 卡片的生产计算函数 | 大数、数字字面量、尾随运算符或残缺表达式 | 数值语义、显示文本和原有边界处理保持一致 | 是 | Pass（88/88） |
| [整数计算矩阵](./entry/src/ohosTest/ets/test/Expansion.test.ets#L2278) | 已加载页面和 ArkTS 卡片的生产计算函数 | 页面和卡片的整数四则运算；交错普通输入和对照输入后重算 | 逐次校验精确数值、字符串格式和重算结果，调用之间互不影响 | 是 | Pass（288/288） |
| [二进制可精确表示的小数计算矩阵](./entry/src/ohosTest/ets/test/Expansion.test.ets)（源码第 1846 行） | 已加载页面和 ArkTS 卡片的生产计算函数 | 页面和卡片的小数四则运算、不同精度和符号组合 | 结果与预先确定的数值及精度一致，交错调用后仍能复现 | 是 | Pass（288/288） |
| [页面和卡片计算回归](./entry/src/ohosTest/ets/test/Expansion.test.ets)（源码第 1750 行） | 已加载页面和 ArkTS 卡片的生产计算函数 | 零值与代表性非零表达式交错执行并重放 | 字符串和数值符合预期、无跨次调用污染 | 是 | Pass（32/32） |

运行范围：连接测试设备后，在 DevEco Studio 使用 **All Tests in 'test (entry)'**。[List.test.ets](./entry/src/ohosTest/ets/test/List.test.ets) 只运行 [Expansion.test.ets](./entry/src/ohosTest/ets/test/Expansion.test.ets) 注册的用例，对应表中带通过数的条目；其余条目仅作历史归档，不由此入口执行。2026-11-18 的 API 26 真机归档记录：888/888 通过，应用启动检查通过。
