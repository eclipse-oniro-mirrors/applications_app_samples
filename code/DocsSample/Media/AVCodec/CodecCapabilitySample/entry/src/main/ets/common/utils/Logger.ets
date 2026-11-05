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

const DOMAIN: number = 0x0002B67;

export default class Logger {
  static debug(tag: string, format: string, ...args: Array<string | number | boolean>): void {
    hilog.debug(DOMAIN, tag, format, args);
  }

  static info(tag: string, format: string, ...args: Array<string | number | boolean>): void {
    hilog.info(DOMAIN, tag, format, args);
  }

  static warn(tag: string, format: string, ...args: Array<string | number | boolean>): void {
    hilog.warn(DOMAIN, tag, format, args);
  }

  static error(tag: string, format: string, ...args: Array<string | number | boolean>): void {
    hilog.error(DOMAIN, tag, format, args);
  }
}
