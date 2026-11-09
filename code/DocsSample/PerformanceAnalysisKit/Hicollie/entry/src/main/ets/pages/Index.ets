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

// [Start hicollie_Index_ets_IndexStruct]
import testNapi from 'libentry.so';

@Entry
@Component
struct Index {
  build() {
    RelativeContainer() {
      Column() {
        // 选择下方对应的功能，可在此处添加不同的点击事件
        // [StartExclude hicollie_Index_ets_IndexStruct]
        // [Start hicollie_Index_ets_JankDetection]
        Column() {
          Button('testHiCollieJankNdk', { stateEffect: true, type: ButtonType.Capsule })
            .width('75%')
            .height(50)
            .margin(15)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(testNapi.testHiCollieJankNdk);
        }
        // [End hicollie_Index_ets_JankDetection]
        // [Start hicollie_Index_ets_StuckDetection]
        Column() {
          Button('testHiCollieStuckNdk', { stateEffect: true, type: ButtonType.Capsule })
            .width('75%')
            .height(50)
            .margin(15)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(testNapi.testHiCollieStuckNdk);
        }
        // [End hicollie_Index_ets_StuckDetection]
        // [Start hicollie_Index_ets_StuckDetectionWithTimeout]
        Column() {
          Button('testHiCollieStuckWithTimeoutNdk', { stateEffect: true, type: ButtonType.Capsule })
            .width('75%')
            .height(50)
            .margin(15)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(testNapi.testHiCollieStuckWithTimeoutNdk);
        }
        // [End hicollie_Index_ets_StuckDetectionWithTimeout]
        // [Start hicollie_Index_ets_InputBlock]
        Column() {
          Button('testHiCollieStuckNdk', { stateEffect: true, type: ButtonType.Capsule })
            .width('75%')
            .height(50)
            .margin(15)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(testNapi.testHiCollieStuckNdk);
          Button('testHiCollieInputBlock', { stateEffect: true, type: ButtonType.Capsule })
            .width('75%')
            .height(50)
            .margin(15)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(testNapi.testHiCollieInputBlock);
        }
        // [End hicollie_Index_ets_InputBlock]
        // [Start hicollie_Index_ets_Callback]
        Column() {
          Button('testHiCollieSetFreezeCallback', { stateEffect: true, type: ButtonType.Capsule })
            .width('75%')
            .height(50)
            .margin(15)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(testNapi.testHiCollieSetFreezeCallback);
          Button('testHiCollieAssociateProcessReport', { stateEffect: true, type: ButtonType.Capsule })
            .width('75%')
            .height(50)
            .margin(15)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(testNapi.testHiCollieAssociateProcessReport);
        }
        // [End hicollie_Index_ets_Callback]
        // [EndExclude hicollie_Index_ets_IndexStruct]
      }
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
}
// [End hicollie_Index_ets_IndexStruct]
