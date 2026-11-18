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

import { serial } from '@kit.BasicServicesKit';

/* SDK 26 enum values remain available when the native serial service is absent. */
export default class SerialConfigValues {
  static readonly dataBitsFive: serial.DataBits = 5;
  static readonly dataBitsSix: serial.DataBits = 6;
  static readonly dataBitsSeven: serial.DataBits = 7;
  static readonly dataBitsEight: serial.DataBits = 8;
  static readonly stopBitsOne: serial.StopBits = 1;
  static readonly stopBitsTwo: serial.StopBits = 2;
  static readonly parityNone: serial.Parity = 'none' as serial.Parity;
  static readonly parityEven: serial.Parity = 'even' as serial.Parity;
  static readonly parityOdd: serial.Parity = 'odd' as serial.Parity;
  static readonly parityMark: serial.Parity = 'mark' as serial.Parity;
  static readonly paritySpace: serial.Parity = 'space' as serial.Parity;
}
