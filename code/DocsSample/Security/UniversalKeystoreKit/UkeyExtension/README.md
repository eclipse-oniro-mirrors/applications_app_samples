# UkeyExtension

本示例展示了密钥管理扩展能力的使用，包括Provider注册/注销、资源打开/关闭、PIN认证状态查询、密钥生成/导出/导入、资源ID获取、属性设置等操作。

## 功能介绍

- Provider注册与注销（ArkTS + C/C++）
- 资源打开与关闭（ArkTS + C/C++）
- PIN认证状态查询与清除（ArkTS + C/C++）
- 扩展密钥生成、公钥导出、密钥导入（ArkTS）
- 获取资源ID与属性设置（ArkTS）
- 浏览器双向SSL认证场景完整实践（ArkTS + C/C++）

## 使用说明

本示例展示了密钥管理扩展能力的接口调用方式。调用registerProvider接口注册Provider后，即可使用资源管理、PIN认证状态查询等能力。涉及实际UKey设备操作（如密钥生成、签名验签等）需要配合UKey硬件设备使用。
