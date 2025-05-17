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

import {
  memo,
  __memo_context_type,
  __memo_id_type
} from '@ohos.arkui.stateManagement'; // should be insert by ui-plugins
import {
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  UserView,
  Row,
  Scroll
} from '@ohos.arkui.component'; // TextAttribute should be insert by ui-plugins
import {
  State,
  StateDecoratedVariable,
  MutableState,
  stateOf,
  observableProxy
} from '@ohos.arkui.stateManagement'; // should be insert by ui-plugins
import hilog from '@ohos.hilog';
import { test, ErrorHandle } from './Use1From2/1.2.ets';
import { test2, ErrorHandle2 } from './Use2From1/1.0.ets';
import { test3, ErrorHandle3 } from './UseJSFrom2/1.2.ets';
import { test4, ErrorHandle4 } from './UseTSFrom2/1.2.ets';

@Component
struct MyStateSample {
  @State logs: Array<string> = new Array<string>();
  @State logs2: Array<string> = new Array<string>();
  @State logs3: Array<string> = new Array<string>();
  @State logs4: Array<string> = new Array<string>();
  @State message: string = '场景一：use 1.0 from 1.2';
  @State message2: string = '场景二：use 1.2 from 1.0';
  @State message3: string = '场景三：use JS from 1.2';
  @State message4: string = '场景四：use TS from 1.2';
  @State logsString: string = '';
  @State logsString2: string = '';
  @State logsString3: string = '';
  @State logsString4: string = '';

  build() {
    Scroll() {
      Column() {
        Button(this.message)
          .width(`80%`)
          .height(40)
          .onClick((e: ClickEvent) => {
            this.logs = test();
            let errorHandleLog = ErrorHandle();
            this.logs.push(errorHandleLog);
            this.logsString = this.logs.join(`\n`);
          })
        Text(this.logsString)
          .width('80%')
          .height(160)
          .fontSize(16)
        Button(this.message2)
          .width(`80%`)
          .height(40)
          .onClick((e: ClickEvent) => {
            this.logs2 = test2();
            let errorHandleLog = ErrorHandle2();
            this.logs2.push(errorHandleLog);
            this.logsString2 = this.logs2.join(`\n`);
          })
        Text(this.logsString2)
          .width('80%')
          .height(150)
          .fontSize(16)
        Button(this.message3)
          .width(`80%`)
          .height(40)
          .onClick((e: ClickEvent) => {
            this.logs3 = test3();
            let errorHandleLog = ErrorHandle3();
            this.logs3.push(errorHandleLog);
            this.logsString3 = this.logs3.join(`\n`);
          })
        Text(this.logsString3)
          .width('80%')
          .height(140)
          .fontSize(16)
        Button(this.message4)
          .width(`80%`)
          .height(40)
          .onClick((e: ClickEvent) => {
            this.logs4 = test4();
            let errorHandleLog = ErrorHandle4();
            this.logs4.push(errorHandleLog);
            this.logsString4 = this.logs4.join(`\n`);
          })
        Text(this.logsString4)
          .width('80%')
          .height(140)
          .fontSize(16)
      }
    }.width('100%')
    .height('100%')
  }
}

export class ComExampleTrivialApplication extends UserView {
  getBuilder() {
    hilog.info(0x0000, 'testTag', 'getBuilder');
    let wrapper = @memo() =>
    {
      hilog.info(0x0000, 'testTag', 'MyStateSample');
      MyStateSample()
    }
    return wrapper
  }
}