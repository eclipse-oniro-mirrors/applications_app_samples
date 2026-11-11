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

import { it } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

export const DOMAIN: number = 0xF811;
export const TAG: string = '[Sample_AppStartupAuto]';
export const BUNDLE: string = 'com.example.appstartupauto';

/** Retain existing case IDs, flags, runner hooks, and fixture cleanup. */
export function loggedIt(name: string, flag: number, body: () => void | Promise<void>): void {
  it(name, flag, async (): Promise<void> => {
    hilog.info(DOMAIN, TAG, '%{public}s %{public}s begin', BUNDLE, name);
    try {
      await body();
    } catch (error) {
      hilog.error(DOMAIN, TAG, '%{public}s %{public}s failure: %{public}s', BUNDLE, name, String(error));
      throw error as Error;
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s end', BUNDLE, name);
    }
  });
}
