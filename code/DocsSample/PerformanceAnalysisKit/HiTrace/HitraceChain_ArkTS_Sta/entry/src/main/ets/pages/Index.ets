'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

// [Start TestHiTraceChain_Import]
import { hiTraceChain, hiTraceMeter } from '@kit.PerformanceAnalysisKit';
// [End TestHiTraceChain_Import]

// [Start TestHiTraceChain_TestFunc]
function InitTraceId() {
  let traceId = hiTraceChain.getId();
  if (!hiTraceChain.isValid(traceId)) {
    hilog.info(0x0000, 'testTag', 'HiTraceId is invalid, begin hiTraceChain');
    traceId = hiTraceChain.begin('testTag: hiTraceChain begin');
  }
  // 使能traceId的INCLUDE_ASYNC，INCLUDE_ASYNC表示会在系统支持的异步机制里自动传递HiTraceId
  hiTraceChain.enableFlag(traceId, hiTraceChain.HiTraceFlag.INCLUDE_ASYNC);
  // 查询INCLUDE_ASYNC是否设置成功
  if (hiTraceChain.isFlagEnabled(hiTraceChain.getId(), hiTraceChain.HiTraceFlag.INCLUDE_ASYNC)) {
    hilog.info(0x0000, 'testTag', 'HiTraceFlag INCLUDE_ASYNC is enabled');
  }
  return traceId;
}

function testHiTraceIdPassedAutomatically() {
  InitTraceId();
  const COMMERCIAL = hiTraceMeter.HiTraceOutputLevel.COMMERCIAL;
  hiTraceMeter.startAsyncTrace(COMMERCIAL, 'myTestAsyncTrace', 1001, 'categoryTest', 'key=value');
  hilog.info(0x0000, 'testTag', 'start testHiTraceIdPassedAutomatically async trace');
  Promise.resolve().then(
    () => {
      hiTraceMeter.finishAsyncTrace(COMMERCIAL, 'myTestAsyncTrace', 1001);
      hilog.info(0x0000, 'testTag', 'end testHiTraceIdPassedAutomatically async trace');
    }
  )
}

function testHiTraceIdPassedManually() {
  let traceId = InitTraceId();
  const COMMERCIAL = hiTraceMeter.HiTraceOutputLevel.COMMERCIAL;
  hiTraceMeter.startAsyncTrace(COMMERCIAL, 'myTestAsyncTrace', 1001, 'categoryTest', 'key=value');
  hilog.info(0x0000, 'testTag', 'start testHiTraceIdPassedAutomatically async trace');
  setTimeout(() => {
    hiTraceChain.setId(traceId);
    hiTraceMeter.finishAsyncTrace(COMMERCIAL, 'myTestAsyncTrace', 1001);
    hilog.info(0x0000, 'testTag', 'end testHiTraceIdPassedAutomatically async trace');
  }, 100);
}
// [End TestHiTraceChain_TestFunc]

@Entry
@Component
struct Index {
  @State stateVar: string = 'state var';
  message: string = 'var';

  changeValue() {
    this.stateVar += '~'
  }

  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)

      // [Start TestHiTraceChain_Button]
      Button("testHiTraceIdPassedAutomatically").backgroundColor('#FFFF00FF')
        .onClick(testHiTraceIdPassedAutomatically)
      // [End TestHiTraceChain_Button]

      // [Start TestHiTraceChain_Button]
      Button("testHiTraceIdPassedManually").backgroundColor('#FFFF00FF')
        .onClick(testHiTraceIdPassedManually)
      // [End TestHiTraceChain_Button]


      Text(this.stateVar).fontSize(20)
      Child({ stateVar: this.stateVar })
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';

  build() {
    Text(this.stateVar).fontSize(50)
  }
}