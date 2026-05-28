# LocalStorage测试用例归档
  	 
## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 从UI内部使用LocalStorage | 设备正常运行 | 点击按钮 | Parent和Child组件双向同步数据刷新 | 是 | Pass |
| @LocalStoragePropRef单向同步 | 设备正常运行 | 点击按钮 | Parent修改不同步到LocalStorage，Child显示不变 | 是 | Pass |
| @LocalStoragePropRef获得数据源引用 | 设备正常运行 | 点击按钮 | 修改属性影响LocalStorage，替换对象不影响 | 是 | Pass |
| @LocalStorageLink双向同步 | 设备正常运行 | 点击按钮 | storageLink修改同步回LocalStorage，全局变量同步 | 是 | Pass |
| 兄弟组件同步状态 | 设备正常运行 | 点击按钮 | 父组件、LocalStorage API、子组件修改同步刷新 | 是 | Pass |
| 从UIAbility共享LocalStorage | 设备正常运行 | 查看页面 | 页面获取共享的LocalStorage实例，propA为47 | 是 | Pass |
| 自定义组件接收LocalStorage实例 | 设备正常运行 | 查看页面 | 子组件使用传入的localStorage2实例，PropB为'PropB' | 是 | Pass |
| 自定义组件接收LocalStorage实例（无属性） | 设备正常运行 | 查看页面 | 子组件使用传入的localStorage2实例，无父组件属性 | 是 | Pass |
| LocalStorage支持联合类型 | 设备正常运行 | 点击按钮 | number和null/undefined切换可观察 | 是 | Pass |
| 装饰Date类型变量 | 设备正常运行 | 点击按钮 | Date整体赋值和API操作变化可观察 | 是 | Pass |
| 装饰Map类型变量 | 设备正常运行 | 点击按钮 | Map整体赋值和API操作变化可观察 | 是 | Pass |
| 装饰Set类型变量 | 设备正常运行 | 点击按钮 | Set整体赋值和API操作变化可观察 | 是 | Pass |
| 组件外改变状态变量 | 设备正常运行 | 点击按钮 | 外部Model修改LocalStorage，UI同步刷新 | 是 | Pass |