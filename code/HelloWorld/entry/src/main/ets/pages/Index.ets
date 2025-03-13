import { Text } from "@koalaui.arkts-arkui.Text"
import { Column } from "@koalaui.arkts-arkui.Column"
import { Button } from "@koalaui.arkts-arkui.Button"
import { Component } from "@koalaui.arkts-arkui.Common"
import { UserView, UserViewBuilder } from "@koalaui.arkts-arkui.UserView"
import { __memo_context_type, __memo_id_type } from "@ohos.arkui.StateManagement.runtime"
import { memo } from "@ohos.arkui.StateManagement.runtime"
import hilog from '@ohos.hilog'

@Component
struct MyStateSample {
  build() {
    Column() {
      Text("Hello World!")
      Button('change')
    }
  }
}

export class ComExampleTrivialApplication extends UserView {
  getBuilder(): UserViewBuilder {
    hilog.info(0x0000, 'testTag', 'ComExampleTrivialApplication');
    let wrapper = (__memo_context: __memo_context_type, __memo_id: __memo_id_type) => {
      hilog.info(0x0000, 'testTag', 'MyStateSample.instantiateImpl');
      MyStateSample.instantiateImpl(
        // __memo_context,
        // ((__memo_id) + (21211165)),
        undefined,
        (): MyStateSample => new MyStateSample(),
        {} as __Options_MyStateSample,
        undefined
      )
    }
    hilog.info(0x0000, 'testTag', 'getBuilder.end');
    return wrapper
  }
}