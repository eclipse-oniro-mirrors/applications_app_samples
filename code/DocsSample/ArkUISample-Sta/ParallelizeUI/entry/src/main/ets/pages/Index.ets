'use static'

import { Entry, Column, Component, Button, ForEach, Scroll } from '@ohos.arkui.component';

interface DemoItem {
  name: string;
  path: string;
}

@Entry
@Component
struct Index {
  demos: DemoItem[] = [
    { name: 'ParallelizeUI外部状态变量示例', path: 'pages/ExternalState' },
    { name: 'ParallelizeUI参数构造示例', path: 'pages/ParameterConstruction' },
    { name: '并行化创建组件示例', path: 'pages/Page' },
    { name: '非List和Grid并行循环创建示例', path: 'pages/ParallelDemo' },
    { name: 'List并行创建子组件示例', path: 'pages/ListParallel' },
  ];

  build() {
    Scroll() {
      Column() {
        ForEach(this.demos, (item: DemoItem) => {
          Button(item.name)
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({ url: item.path })
            })
            .fontSize(18)
            .margin(15)
            .width('100%')
        }, (item: DemoItem) => item.path)
      }
      .padding(15)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
