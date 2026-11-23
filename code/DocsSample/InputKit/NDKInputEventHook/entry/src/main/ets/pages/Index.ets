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

import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';

const DOMAIN = 0xF811;
const TAG = '[Sample_NDKInputEventHook]';

@Component
export struct ResultDisplay {
  @Prop result: string

  build() {
    Column() {
      Text(this.result)
        .id('result_text')
        .fontSize(14)
        .width('100%')
        .wordBreak(WordBreak.NORMAL)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Start)
        .padding(12)
    }
    .width('100%')
    .backgroundColor($r('app.color.result_background'))
    .borderRadius(8)
    .margin({ top: 20, bottom: 20 })
    .padding(0)
  }
}

@Entry
@Component
struct Index {
  @State result: string = '';

  @Builder
  ApiMethodItem(title: Resource, onClick: () => void) {
    Text(title)
      .height('auto')
      .width('100%')
      .fontSize(13)
      .fontWeight(FontWeight.Bold)
      .fontColor($r('app.color.method_item_font_color'))
      .textAlign(TextAlign.Start)
      .margin({ top: 8, bottom: 8 })
      .lineHeight(20)
      .wordBreak(WordBreak.NORMAL)
      .maxLines(2)
      .backgroundColor($r('app.color.method_item_background'))
      .borderRadius(4)
      .padding(8)
      .onClick(onClick)
  }

  aboutToAppear(): void {
    if (testNapi) {
      testNapi.onChange((event: testNapi.ValueChangeEvent) => {
        this.result = event.value;
      });
    } else {
      hilog.error(DOMAIN, TAG, 'testNapi is undefined');
      this.result = getContext(this).resourceManager.getStringSync($r('app.string.native_load_failed').id);
    }
  }

  build() {
    Scroll() {
      Column() {
        ResultDisplay({ result: this.result })

        Column() {
          TextInput({ placeholder: $r('app.string.input_placeholder') })
            .type(InputType.Normal)
            .width('80%')
            .height(50)
            .margin(10)
        }

        this.ApiMethodItem($r('app.string.button_create_handler'), () => {
          try {
            this.result = testNapi.createAndEnableHandler();
          } catch (e) {
            hilog.error(DOMAIN, TAG, 'createAndEnableHandler failed, error: %{public}s', JSON.stringify(e));
            this.result = `Create and enable event handler, error: ${JSON.stringify(e)}`;
          }
        })

        this.ApiMethodItem($r('app.string.button_disable_handler'), () => {
          try {
            this.result = testNapi.disableAndDestroyHandler();
          } catch (e) {
            hilog.error(DOMAIN, TAG, 'disableAndDestroyHandler failed, error: %{public}s', JSON.stringify(e));
            this.result = `Disable and destroy event handler, error: ${JSON.stringify(e)}`;
          }
        })

      }
      .height('100%')
      .width('80%')
      .alignItems(HorizontalAlign.Center)
      .margin({ left: '10%', right: '10%' })
      .margin({ bottom: 200 })
    }
    .width('100%')
    .height('100%')
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.On)
    .scrollBarColor($r('app.color.scrollbar_color'))
    .scrollBarWidth(8)
    .edgeEffect(EdgeEffect.Spring)
  }
}
