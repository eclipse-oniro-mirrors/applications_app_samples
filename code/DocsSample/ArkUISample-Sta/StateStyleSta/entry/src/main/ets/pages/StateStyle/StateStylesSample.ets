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
// [Start state_style]
import { Entry, Component, CommonMethod, CustomStyles, Column, Button } from '@kit.ArkUI';

@Entry
@Component
struct StateStylesSample {
  focusedStyle: CustomStyles = (instance: CommonMethod): void => {
    instance.backgroundColor('#ffffeef0');
  }
  pressedStyle: CustomStyles = (instance: CommonMethod): void => {
    instance.backgroundColor('#ff707070');
  }
  normalStyle: CustomStyles = (instance: CommonMethod): void => {
    instance.backgroundColor('#ff2787d9');
  }

  build() {
    Column() {
      Button('Button1')
        .stateStyles({
          focused: this.focusedStyle,
          pressed: this.pressedStyle,
          normal: this.normalStyle
        })
        .margin(20)
      Button('Button2')
        .stateStyles({
          focused: this.focusedStyle,
          pressed: this.pressedStyle,
          normal: this.normalStyle
        })
    }.margin('30%')
  }
}
// [End state_style]