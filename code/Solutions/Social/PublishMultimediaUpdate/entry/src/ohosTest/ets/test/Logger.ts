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
/**
* Device test logger. All suites share one domain so that a failure can be
* traced back to this sample with a single hilog filter.
*/
class Logger {
  // Domain id reserved for this sample's test output.
  private domain: number = 0xF811;
  // Prefix prepended to every log line.
  private prefix: string = '[Sample_PublishMultimediaUpdate]';
  // Format string shared by all severity helpers.
  private format: string = '%{public}s, %{public}s';
  constructor(prefix: string) {
    this.prefix = prefix;
  }
  debug(...args: string[]): void {
    hilog.debug(this.domain, this.prefix, this.format, args);
  }
  info(...args: string[]): void {
    hilog.info(this.domain, this.prefix, this.format, args);
  }
  warn(...args: string[]): void {
    hilog.warn(this.domain, this.prefix, this.format, args);
  }
  error(...args: string[]): void {
    hilog.error(this.domain, this.prefix, this.format, args);
  }
}
export default new Logger('[Sample_PublishMultimediaUpdate]');
