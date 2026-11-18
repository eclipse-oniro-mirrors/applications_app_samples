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
 * Thin hilog facade used by every suite.
 *
 * The sample writes with a single '%{public}s, %{public}s' format string, so the
 * test logger exposes one-argument and two-argument calls explicitly instead of
 * forwarding variable argument lists. That keeps every log line printable and
 * makes a missing argument a compile-time error rather than a runtime hilog
 * failure.
 */
const DOMAIN: number = 0xF817;
const ONE_ARG_FORMAT: string = '%{public}s';
const TWO_ARG_FORMAT: string = '%{public}s, %{public}s';

export class TestLogger {
  static info(tag: string, message: string): void {
    hilog.info(DOMAIN, tag, ONE_ARG_FORMAT, message);
  }

  static infoPair(tag: string, first: string, second: string): void {
    hilog.info(DOMAIN, tag, TWO_ARG_FORMAT, first, second);
  }

  static debug(tag: string, message: string): void {
    hilog.debug(DOMAIN, tag, ONE_ARG_FORMAT, message);
  }

  static warn(tag: string, message: string): void {
    hilog.warn(DOMAIN, tag, ONE_ARG_FORMAT, message);
  }

  static error(tag: string, message: string): void {
    hilog.error(DOMAIN, tag, ONE_ARG_FORMAT, message);
  }

  static begin(tag: string, caseName: string): void {
    TestLogger.info(tag, caseName + ' begin');
  }

  static end(tag: string, caseName: string): void {
    TestLogger.info(tag, caseName + ' end');
  }

  /** Logs an assertion input before the assertion itself, as the sample style requires. */
  static value(tag: string, label: string, value: string): void {
    TestLogger.infoPair(tag, label, value);
  }
}
