# ArkTS静态模式分布式接续示例

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 应用接续 | 1. 需在两台真机测试 <br/> 2. 两台设备登录同一华为账号 <br/> 3. 构建并安装测试hap <br/> 4. 连接两台手机或平板设备将自定义test_img.jpg文件放入A设备/mnt/hmdfs/100/acount/merge_view/data/com.example.staticdistibutedobjectcontinue路径下，在A设备上打开hap，B设备弹出接续图标| A设备打开hap应用， | 点击接续图标 | 点击接续图标，应用拉起，B设备/mnt/hmdfs/100/acount/merge_view/data/com.example.staticdistibutedobjectcontinue路径下存在test_img.jpg | 否 | Pass |