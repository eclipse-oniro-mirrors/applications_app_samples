/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

export class Log {
  private static readonly DOMAIN: number = 0x0000;
  private static readonly APP_TAG: string = 'MiracastPlayerApp';

  private static format(tag: string, content: string): string {
    return `${tag} --->>> ${content}`;
  }

  static log(tag: string, content: string): void {
    hilog.info(Log.DOMAIN, Log.APP_TAG, '%{public}s', Log.format(tag, content));
  }

  static debug(tag: string, content: string): void {
    hilog.debug(Log.DOMAIN, Log.APP_TAG, '%{public}s', Log.format(tag, content));
  }

  static info(tag: string, content: string): void {
    hilog.info(Log.DOMAIN, Log.APP_TAG, '%{public}s', Log.format(tag, content));
  }

  static warn(tag: string, content: string): void {
    hilog.warn(Log.DOMAIN, Log.APP_TAG, '%{public}s', Log.format(tag, content));
  }

  static error(tag: string, content: string): void {
    hilog.error(Log.DOMAIN, Log.APP_TAG, '%{public}s', Log.format(tag, content));
  }
}
