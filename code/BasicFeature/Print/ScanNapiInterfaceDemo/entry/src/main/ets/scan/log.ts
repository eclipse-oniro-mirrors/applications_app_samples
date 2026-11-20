/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export class ScanLog {
  private static readonly SETTING_DOMAIN: number = 0xF811;
  static debug(msg: string): void {
    hilog.debug(ScanLog.SETTING_DOMAIN, TAG, '%{public}s', msg);
  }
  static info(msg: string): void {
    hilog.info(ScanLog.SETTING_DOMAIN, TAG, '%{public}s', msg);
  }
  static warn(msg: string): void {
    hilog.warn(ScanLog.SETTING_DOMAIN, TAG, '%{public}s', msg);
  }
  static fatal(msg: string): void {
    hilog.fatal(ScanLog.SETTING_DOMAIN, TAG, '%{public}s', msg);
  }
}
