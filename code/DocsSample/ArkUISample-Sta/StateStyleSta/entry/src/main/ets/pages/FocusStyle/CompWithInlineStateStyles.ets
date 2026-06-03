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

// [Start focus_style]
import { Entry, Component, State, CommonMethod, CustomStyles, Column, Button } from '@kit.ArkUI';

@Entry
@Component
struct CompWithInlineStateStyles {
  @State focusedColor: int = 0xD5D5D5;
  normalColor: int = 0x004AAF;
  normalStyle: CustomStyles = (instance: CommonMethod): void => {
    instance.backgroundColor(this.normalColor);
  }
  focusedStyle: CustomStyles = (instance: CommonMethod): void => {
    instance.backgroundColor(this.focusedColor);
  }

  build() {
    Column() {
      Button('clickMe')
        .height(100)
        .width(100)
        .stateStyles({
          normal: this.normalStyle,
          focused: this.focusedStyle
        })
        .onClick(() => {
          this.focusedColor = 0x707070;
        })
        .margin('30%')
    }
  }
}
// [End focus_style]