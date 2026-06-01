'use static'

// [Start parallelExternalState_start]
// ArkTS-Sta示例
import { Entry, Text, Column, Component } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ParallelizeUI } from '@ohos.arkui.Parallelize';

@Entry
@Component
struct Index {
  @State str: string = 'Hello';
  build() {
    Column() {
      ParallelizeUI(undefined) {
        Text(this.str) // ParallelizeUI内部不能使用外部定义的状态变量
          .fontSize(50)
      }
      Text('World')
        .fontSize(50)
    }.height('100%')
    .width('100%')
  }
}
// [End parallelExternalState_start]
