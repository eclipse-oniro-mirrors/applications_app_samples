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

// [Start gamepad_sample]
import {
  Entry,
  Component,
  State,
  Column,
  Button,
  Text,
  Divider,
  KeyEvent,
  KeyType,
  FocusAxisEvent,
  AxisModel,
  HorizontalAlign,
  ColumnOptions,
  Margin,
  Padding
} from '@kit.ArkUI';

@Entry
@Component
struct GamepadSample {
  @State keyValue: string = '';
  @State keyEventType: string = '';
  @State axisValue: string = '';

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Button1')

      Column() {
        Button('JoyStick')
          .defaultFocus(true)
          .onFocusAxisEvent((event: FocusAxisEvent) => {
            let absX = event.axisMap.get(AxisModel.ABS_X);
            let absY = event.axisMap.get(AxisModel.ABS_Y);
            let absZ = event.axisMap.get(AxisModel.ABS_Z);
            let absRz = event.axisMap.get(AxisModel.ABS_RZ);
            let absGas = event.axisMap.get(AxisModel.ABS_GAS);
            let absBrake = event.axisMap.get(AxisModel.ABS_BRAKE);
            let absHat0X = event.axisMap.get(AxisModel.ABS_HAT0X);
            let absHat0Y = event.axisMap.get(AxisModel.ABS_HAT0Y);
            this.axisValue =
              'absX: ' + absX + '\nabsY: ' + absY + '\nabsZ: ' + absZ + '\nabsRz: ' + absRz + '\nabsGas: ' + absGas +
                '\nabsBrake: ' + absBrake + '\nabsHat0X: ' + absHat0X + '\nabsHat0Y: ' + absHat0Y;
          })
          .onKeyEvent((event: KeyEvent): boolean => {
            if (event && event.type === KeyType.Down) {
              this.keyValue =
                'keyCode:' + event.keyCode + '\nkeyText:' + event.keyText + '\nintentionCode:' + event.intentionCode;
            }
            return false;
          })
      }.focusScopeId('myGroup', true, false)

      Button('Button2')

      Text('Axis value info: ').margin({ top: 10 } as Margin)
      Column() {
        Text(this.axisValue).padding(15)
      }.width('100%').alignItems(HorizontalAlign.Start).padding({ left: 40 } as Padding)

      Divider()

      Text('Key value info: ').margin({ top: 10 } as Margin)
      Column() {
        Text(this.keyValue).padding(15)
      }.width('100%').alignItems(HorizontalAlign.Start).padding({ left: 40 } as Padding)

    }.height(300).width('100%').margin({ top: 30 } as Padding)
  }
}

// [End gamepad_sample]