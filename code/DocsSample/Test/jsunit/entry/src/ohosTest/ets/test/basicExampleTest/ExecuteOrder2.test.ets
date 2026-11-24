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
// [Start order2_sample]
import { afterItSpecified, beforeItSpecified, beforeEach, SysTestKit } from '@ohos/hypium';
import { describe, expect, it, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

export default function exampleTest(): void {
  describe('order2_sample', (): void => {
    let testNumA: number = 1;
    let testNumB: number = 1;
    let specified: string = '';
    const reset: () => void = (): void => {
      testNumA = 1;
      testNumB = 1;
      specified = '';
    };
    const beforeA: () => void = (): void => {
      reset();
    };
    const beforeB: () => void = (): void => {
      reset();
      testNumB++;
      specified = 'before B';
    };
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });
    // 1.0.29 examines only the first specified-hook map entry; dispatch both targets in that entry.
    beforeItSpecified(['testJsunitSpecifiedHooks0001', 'testJsunitSpecifiedHooks0002'], (): void => {
      if (SysTestKit.getItName() === 'testJsunitSpecifiedHooks0001') {
        beforeA();
      } else {
        beforeB();
      }
    });
    afterItSpecified(['testJsunitSpecifiedHooks0001'], (): void => {
      testNumA++;
      hilog.info(0x0000, 'OrderExample', 'after specified A=%{public}d', testNumA);
      expect(testNumA).assertEqual(2);
    });

    /**
     * @tc.number testJsunitSpecifiedHooks0001
     * @tc.name testJsunitSpecifiedHooks0001
     * @tc.desc Run the case without the other case targeted before hook
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitSpecifiedHooks0001', Level.LEVEL1, (): void => {
      hilog.info(0x0000, 'OrderExample', 'case A counter=%{public}d', testNumA);
      expect(testNumA).assertEqual(1);
      hilog.info(0x0000, 'OrderExample', 'case A B counter=%{public}d', testNumB);
      expect(testNumB).assertEqual(1);
      hilog.info(0x0000, 'OrderExample', 'case A specified hook=%{public}s', specified);
      expect(specified).assertEqual('');
    });

    /**
     * @tc.number testJsunitSpecifiedHooks0002
     * @tc.name testJsunitSpecifiedHooks0002
     * @tc.desc Run the explicitly targeted before hook independently of case A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitSpecifiedHooks0002', Level.LEVEL1, (): void => {
      hilog.info(0x0000, 'OrderExample', 'case B A reset=%{public}d', testNumA);
      expect(testNumA).assertEqual(1);
      hilog.info(0x0000, 'OrderExample', 'case B B counter=%{public}d', testNumB);
      expect(testNumB).assertEqual(2);
      hilog.info(0x0000, 'OrderExample', 'case B specified hook=%{public}s', specified);
      expect(specified).assertEqual('before B');
    });
  });
}
// [End order2_sample]
