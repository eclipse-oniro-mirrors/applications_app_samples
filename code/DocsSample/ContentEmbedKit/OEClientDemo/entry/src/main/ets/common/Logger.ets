/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0xF811;
const TAG = '[Sample_OEClientDemo]';

export class Logger {
  /**
   * Prints DEBUG level log.
   *
   * @param format - format string, same semantics as hilog format.
   * @param args - format arguments.
   */
  static debug(format: string, ...args: (Object | undefined | null)[]): void {
    hilog.debug(DOMAIN, TAG, format, ...args);
  }

  /**
   * Prints INFO level log.
   *
   * @param format - format string, same semantics as hilog format.
   * @param args - format arguments.
   */
  static info(format: string, ...args: (Object | undefined | null)[]): void {
    hilog.info(DOMAIN, TAG, format, ...args);
  }

  /**
   * Prints WARN level log.
   *
   * @param format - format string, same semantics as hilog format.
   * @param args - format arguments.
   */
  static warn(format: string, ...args: (Object | undefined | null)[]): void {
    hilog.warn(DOMAIN, TAG, format, ...args);
  }

  /**
   * Prints ERROR level log.
   *
   * @param format - format string, same semantics as hilog format.
   * @param args - format arguments.
   */
  static error(format: string, ...args: (Object | undefined | null)[]): void {
    hilog.error(DOMAIN, TAG, format, ...args);
  }
}
