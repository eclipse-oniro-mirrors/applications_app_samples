/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
import { Text } from "@koalaui.arkts-arkui.Text"
import { Column } from "@koalaui.arkts-arkui.Column"
import { Button } from "@koalaui.arkts-arkui.Button"
import { Component } from "@koalaui.arkts-arkui.Common"
import { UserView, UserViewBuilder } from "@koalaui.arkts-arkui.UserView"
import { __memo_context_type, __memo_id_type } from "@ohos.arkui.StateManagement.runtime"
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