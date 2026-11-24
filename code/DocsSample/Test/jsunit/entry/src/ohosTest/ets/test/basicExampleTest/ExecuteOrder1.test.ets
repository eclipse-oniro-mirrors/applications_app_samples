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
// [Start order1_sample]
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

export default function exampleTest(): void {
  describe('order1_sample', (): void => {
    let testNumA: number = 0;
    let testNumB: number = 0;
    let seed: number = 0;
    let trace: string = '';
    beforeAll((): void => {
      seed = 1;
      seed++;
      trace = 'setup';
    });
    beforeEach(async (): Promise<void> => {
      await paceTurn();
      testNumA = seed;
      testNumB = 1;
      trace = 'before';
      testNumA++;
      testNumB++;
    });
    afterEach((): void => {
      testNumA++;
      trace += '>after';
      hilog.info(0x0000, 'OrderExample', 'afterEach total A=%{public}d', testNumA);
      expect(testNumA).assertEqual(4);
      hilog.info(0x0000, 'OrderExample', 'final hook trace=%{public}s', trace);
      expect(trace).assertEqual('before>after');
    });

    /**
     * @tc.number testJsunitGeneralHooks0001
     * @tc.name testJsunitGeneralHooks0001
     * @tc.desc Observe generic hook counters with per-case reset and assertions in the active afterEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitGeneralHooks0001', Level.LEVEL1, (): void => {
      hilog.info(0x0000, 'OrderExample', 'beforeEach A=%{public}d', testNumA);
      expect(testNumA).assertEqual(3);
      hilog.info(0x0000, 'OrderExample', 'beforeEach B=%{public}d', testNumB);
      expect(testNumB).assertEqual(2);
      hilog.info(0x0000, 'OrderExample', 'before body trace=%{public}s', trace);
      expect(trace).assertEqual('before');
    });
  });
}
// [End order1_sample]
