/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { it as hypiumIt, expect as hypiumExpect } from '@ohos/hypium';
import type { Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[CalendarEventTest]';

/** Register one logical scenario, keeping diagnostics outside production functions. */
export function it(name: string, level: number, body: () => void | Promise<void>): void {
  hypiumIt(name, level, async (): Promise<void> => {
    hilog.info(DOMAIN, TAG, '%{public}s', `${name}, begin`);
    try {
      await body();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', `${name}, end`);
    }
  });
}

/** Log the actual test value before invoking the ordinary Hypium assertion. */
export function expect(actual: string | number | boolean | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', `assert actual=${actual}`);
  return hypiumExpect(actual);
}
