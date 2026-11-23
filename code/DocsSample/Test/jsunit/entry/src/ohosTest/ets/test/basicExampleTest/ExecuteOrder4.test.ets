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
// [Start order4_sample]
import { describe, beforeEach, afterEach, beforeEachIt, afterEachIt, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

export default function test(): void {
  describe('test0', (): void => {
    let str: string = '';
    let parentCount: number = 0;
    let childCount: number = 0;
    beforeEachIt((): void => {
      str = 'B';
      parentCount = 0;
      childCount = 0;
    });
    beforeEach(async (): Promise<void> => {
      await paceTurn();
      str += 'A';
      parentCount++;
    });
    afterEach((): void => {
      str += 'C';
    });
    afterEachIt((): void => {
      str += 'D';
    });

    /**
     * @tc.number testJsunitParentHooks0001
     * @tc.name testJsunitParentHooks0001
     * @tc.desc Observe parent hook order with independent counters reset for every case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitParentHooks0001', 0, (): void => {
      hilog.info(0x0000, 'OrderExample', 'parent trace=%{public}s', str);
      expect(str).assertEqual('BA');
      hilog.info(0x0000, 'OrderExample', 'parent hook count=%{public}d', parentCount);
      expect(parentCount).assertEqual(1);
      hilog.info(0x0000, 'OrderExample', 'child hook count in parent=%{public}d', childCount);
      expect(childCount).assertEqual(0);
    });
    describe('test1', (): void => {
      beforeEachIt((): void => {
        str += 'F';
      });
      beforeEach(async (): Promise<void> => {
        await paceTurn();
        str += 'E';
        childCount++;
      });

      /**
       * @tc.number testJsunitChildHooks0002
       * @tc.name testJsunitChildHooks0002
       * @tc.desc Observe inherited per-it and child-local beforeEach hooks without prior parent case state
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('testJsunitChildHooks0002', 0, (): void => {
        hilog.info(0x0000, 'OrderExample', 'child trace=%{public}s', str);
        expect(str).assertEqual('BFE');
        hilog.info(0x0000, 'OrderExample', 'parent local hook count in child=%{public}d', parentCount);
        expect(parentCount).assertEqual(0);
        hilog.info(0x0000, 'OrderExample', 'child local hook count=%{public}d', childCount);
        expect(childCount).assertEqual(1);
      });
    });
  });
}
// [End order4_sample]
