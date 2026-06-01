# UI并行化创建组件树（ArkTS-Sta）

本工程同步自 `docs/zh-cn/application-dev/ui/ui-parallel-components.md` 中的 ArkTS-Sta 示例代码。

## 示例页面

- `pages/ExternalState.ets`：演示 `ParallelizeUI` 中直接使用外部状态变量的限制。
- `pages/ParameterConstruction.ets`：演示通过 `ParallelizeUI<T>` 构造并行创建参数。
- `pages/Page.ets`：演示并行创建多个组件。
- `pages/ParallelDemo.ets`：演示非 List/Grid 容器中使用 `ParallelizeUI<V, T>` 循环并行创建。
- `pages/ListParallel.ets`：演示 List 容器中使用 `ParallelizeUI<V, T>` 按需并行创建子组件。

## 约束

本示例使用 `ParallelizeUI` API，需使用支持 API version 23 及以上的静态 ArkTS SDK 编译运行。
