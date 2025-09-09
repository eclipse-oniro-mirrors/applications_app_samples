'use static'

import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Component
export struct MainPage01 {
  @State stateVar: string = 'har_static';
  message: string = 'var';
  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Text(this.stateVar).fontSize(20)
    }
  }
}
