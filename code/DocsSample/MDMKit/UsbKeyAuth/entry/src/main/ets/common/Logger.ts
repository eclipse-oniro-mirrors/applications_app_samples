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

import hilog from '@ohos.hilog';

const DOMAIN = 0x0001;
const TAG = 'UsbKeyAuth';

export default class Logger {
  static info(msg: string): void {
    hilog.info(DOMAIN, TAG, msg);
  }

  static warn(msg: string): void {
    hilog.warn(DOMAIN, TAG, msg);
  }

  static error(msg: string): void {
    hilog.error(DOMAIN, TAG, msg);
  }
}
