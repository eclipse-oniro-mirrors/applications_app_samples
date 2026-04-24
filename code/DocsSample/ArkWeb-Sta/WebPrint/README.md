# 使用Web组件打印前端页面

## 介绍

1. 本工程主要实现了对指南文档 [使用Web组件打印前端页面](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/web/web-print.md) 中示例代码片段的工程化，主要目标是实现指南中示例代码需要与sample工程文件同源。

## InitiatePrintW3CAPI

### 介绍

1. 本示例主要介绍使用Web组件打印前端页面，通过创建打印适配器，拉起打印应用，并对当前Web页面内容进行渲染，渲染后生成的PDF文件信息通过fd传递给打印框架。W3C标准协议接口window.print()方法用于打印当前页面或弹出打印对话框。该方法没有任何参数，只需要在JavaScript中调用即可。

### 效果预览

| 主页                                                         |
| ------------------------------------------------------------ |
| <img src="./screenshots/InitiatePrintW3CAPI.png" width="360;" /> |

使用说明

1. 点击print按钮，触发window.print()操作，即可对页面内容进行打印。

### 具体实现	 
 
* 使用W3C标准接口window.print，对页面内容进行打印，参考源码：[InitiatePrintW3CAPI.ets](./entry/src/main/ets/pages/InitiatePrintW3CAPI.ets)

## InitiatePrintAppAPI

### 介绍

1. 本示例主要介绍使用Web组件打印前端页面，应用侧通过调用createWebPrintDocumentAdapter创建打印适配器，通过将适配器传入打印的print接口调起打印。

### 效果预览

| 主页                                                         |
| ------------------------------------------------------------ |
| <img src="./screenshots/InitiatePrintAppAPI.png" width="360;" /> |

使用说明

1. 点击createWebPrintDocumentAdapter按钮应用侧会创建打印适配器，并将其传入打印接口，以触发打印操作。

### 具体实现

* 使用Web组件的src参数传入不同来源的PDF文件，以加载PDF文档，参考源码：[PreviewPDF.ets](./entry/src/main/ets/pages/PreviewPDF.ets)
