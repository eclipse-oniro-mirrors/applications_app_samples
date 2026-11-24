/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
// [Start order3_sample]
import { beforeEach, describe, expect, it, Level, SysTestKit, xit } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

export default function describeExampleTest(): void {
  describe('order3_sample', (): void => {
    let skippedBodyRuns: number = 0;
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    // Original xit demonstration: intentionally excluded from effective/pass counts.
    xit('testJsunitSkippedExample0001', Level.LEVEL1, (done: () => void): void => {
      skippedBodyRuns++;
      done();
    });

    /**
     * @tc.number testJsunitSkipSelection0002
     * @tc.name testJsunitSkipSelection0002
     * @tc.desc Verify that the active example runs with its own identity while xit is excluded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitSkipSelection0002', Level.LEVEL1, (): void => {
      hilog.info(0x0000, 'SkipExample', 'skipped body runs=%{public}d', skippedBodyRuns);
      expect(skippedBodyRuns).assertEqual(0);
      const name: string = SysTestKit.getItName();
      hilog.info(0x0000, 'SkipExample', 'running case=%{public}s', name);
      expect(name).assertEqual('testJsunitSkipSelection0002');
      const suite: string = SysTestKit.getDescribeName();
      hilog.info(0x0000, 'SkipExample', 'running suite=%{public}s', suite);
      expect(suite).assertEqual('order3_sample');
    });
  });
}
// [End order3_sample]
