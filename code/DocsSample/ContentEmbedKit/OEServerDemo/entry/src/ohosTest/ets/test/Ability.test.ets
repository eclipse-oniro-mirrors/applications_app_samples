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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_OEServerDemo]';
const BUNDLE: string = 'OEServerDemo_';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * Verify that string contains a substring.
     */
    it(BUNDLE + 'AssertContain_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertContain_001, begin');
      const a: string = 'abc';
      const b: string = 'b';
      hilog.info(DOMAIN, TAG, 'a=%{public}s, b=%{public}s', a, b);
      expect(a).assertContain(b);
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertContain_001, end');
    })

    /**
     * Verify that a value equals itself.
     */
    it(BUNDLE + 'AssertEqual_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertEqual_001, begin');
      const a: string = 'OEServerDemo';
      hilog.info(DOMAIN, TAG, 'a=%{public}s', a);
      expect(a).assertEqual(a);
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertEqual_001, end');
    })

    /**
     * Verify numeric equality.
     */
    it(BUNDLE + 'AssertNumber_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertNumber_001, begin');
      const expected: number = 100;
      const actual: number = 100;
      hilog.info(DOMAIN, TAG, 'expected=%{public}d, actual=%{public}d', expected, actual);
      expect(actual).assertEqual(expected);
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertNumber_001, end');
    })

    /**
     * Verify boolean true.
     */
    it(BUNDLE + 'AssertTrue_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertTrue_001, begin');
      const isReady: boolean = true;
      hilog.info(DOMAIN, TAG, 'isReady=%{public}s', String(isReady));
      expect(isReady).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertTrue_001, end');
    })

    /**
     * Verify array length.
     */
    it(BUNDLE + 'AssertArrayLength_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertArrayLength_001, begin');
      const arr: string[] = ['open', 'save', 'snapshot'];
      const expectedLength: number = 3;
      hilog.info(DOMAIN, TAG, 'arr.length=%{public}d, expected=%{public}d', arr.length, expectedLength);
      expect(arr.length).assertEqual(expectedLength);
      hilog.info(DOMAIN, TAG, BUNDLE + 'AssertArrayLength_001, end');
    })
  })
}
