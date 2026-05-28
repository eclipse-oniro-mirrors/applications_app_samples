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

// [Start gamepad_direction_key]
import { Entry, Component, Column, Button, KeyEvent, KeyType, FlexAlign, ColumnOptions } from '@kit.ArkUI';
import { KeyCode } from '@kit.InputKit';

@Entry
@Component
struct DirectionKey {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Button1')
      Column() {
        Button('JoyStick')
          .defaultFocus(true)
          .onKeyEvent((event: KeyEvent): boolean => {
            if (event && event.type === KeyType.Down) {
              switch (event.keyCode as KeyCode) {
                case KeyCode.KEYCODE_DPAD_UP:
                case KeyCode.KEYCODE_DPAD_DOWN:
                case KeyCode.KEYCODE_DPAD_LEFT:
                case KeyCode.KEYCODE_DPAD_RIGHT:
                  console.info('trigger direction button');
                  break;
                default:
                  console.info('trigger other button');
                  break;
              }
            }
            return false;
          })
      }.focusScopeId('myGroup', true, false)

      Button('Button2')
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

// [End gamepad_direction_key]