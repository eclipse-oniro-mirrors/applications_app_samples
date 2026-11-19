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

const MAX_LOG_VALUE_LENGTH: number = 120;

export class InterfaceTestLog {
  static begin(name: string, input: string): void {
    hilog.info(0xF811, '[Sample_ReasonableUsingSystemInterfaces]', '%{public}s begin input=%{public}s', name, input);
  }

  static value(name: string, label: string, expected: string, actual: string): void {
    hilog.info(0xF811, '[Sample_ReasonableUsingSystemInterfaces]', '%{public}s %{public}s expected=%{public}s actual=%{public}s',
      name, label, expected.substring(0, MAX_LOG_VALUE_LENGTH), actual.substring(0, MAX_LOG_VALUE_LENGTH));
  }

  static number(name: string, label: string, expected: number, actual: number): void {
    InterfaceTestLog.value(name, label, String(expected), String(actual));
  }

  static flag(name: string, label: string, actual: boolean): void {
    hilog.info(0xF811, '[Sample_ReasonableUsingSystemInterfaces]', '%{public}s %{public}s actual=%{public}s', name, label, String(actual));
  }

  static end(name: string): void {
    hilog.info(0xF811, '[Sample_ReasonableUsingSystemInterfaces]', '%{public}s end', name);
  }
}
