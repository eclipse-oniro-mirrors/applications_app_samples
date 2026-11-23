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
import { expect } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export async function runCase(name: string, action: () => Promise<void>, done: Function): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s begin', name);
  try {
    await action();
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s failed: %{public}s', name, String(error));
    expect().assertFail();
  } finally {
    hilog.info(DOMAIN, TAG, '%{public}s end', name);
    done();
  }
}

export function logAssertion(domain: number, tag: string, actual: string, expected: string): void {
  hilog.info(domain, tag, 'actual=%{public}s expected=%{public}s', actual, expected);
}
