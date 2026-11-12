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

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const PREFIX: string = '[Sample_SystemConfig]';

class Logger {
  debug(message: string): void {
    hilog.debug(DOMAIN, PREFIX, '%{public}s', message);
  }

  info(message: string): void {
    hilog.info(DOMAIN, PREFIX, '%{public}s', message);
  }

  warn(message: string): void {
    hilog.warn(DOMAIN, PREFIX, '%{public}s', message);
  }

  error(message: string): void {
    hilog.error(DOMAIN, PREFIX, '%{public}s', message);
  }
}

export const logger = new Logger();
