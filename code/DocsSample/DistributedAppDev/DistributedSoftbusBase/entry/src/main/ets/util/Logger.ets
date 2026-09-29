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

// Log domain for the SoftBusBase sample.
const DOMAIN = 0x0500;
const PREFIX = '[Sample_SoftBusBase]';

/**
 * Unified logger for the SoftBusBase sample. Wraps hilog with a fixed domain
 * and `[Sample_SoftBusBase]` prefix so logs are easy to filter.
 */
export class Logger {
  static info(format: string, ...args: string[]): void {
    hilog.info(DOMAIN, PREFIX, format, ...args);
  }

  static error(format: string, ...args: string[]): void {
    hilog.error(DOMAIN, PREFIX, format, ...args);
  }

  static debug(format: string, ...args: string[]): void {
    hilog.debug(DOMAIN, PREFIX, format, ...args);
  }
}
