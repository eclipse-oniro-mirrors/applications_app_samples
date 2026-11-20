# IDLTool 测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|---------|---------|
| testIntTransaction接口调用验证 | 设备正常运行 | 调用testIntTransaction(123) | 返回errCode为0，ret为124 | 是 | Pass |
| testStringTransaction接口调用验证 | 设备正常运行 | 调用testStringTransaction('hello idl') | 返回errCode为0 | 是 | Pass |
| IdlTestImp服务端实现验证 | 设备正常运行 | 调用IdlTestImp.testIntTransaction(100) | 返回errCode为0，ret为101 | 是 | Pass |
| IdlTestImp服务端String实现验证 | 设备正常运行 | 调用IdlTestImp.testStringTransaction('test') | 返回errCode为0 | 是 | Pass |
| MySequenceable序列化反序列化验证 | 设备正常运行 | 创建MySequenceable对象并进行marshalling/unmarshalling | 序列化成功，反序列化后数据一致（num=42, str='hello'） | 是 | Pass |
