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

export default function localUnitTest() {
  describe('localUnitTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * Verify local string containment.
     */
    it(BUNDLE + 'LocalAssertContain_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocalAssertContain_001, begin');
      const a: string = 'abc';
      const b: string = 'b';
      hilog.info(DOMAIN, TAG, 'a=%{public}s, b=%{public}s', a, b);
      expect(a).assertContain(b);
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocalAssertContain_001, end');
    });

    /**
     * Verify local numeric equality.
     */
    it(BUNDLE + 'LocalAssertEqual_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocalAssertEqual_001, begin');
      const expected: number = 1;
      const actual: number = 1;
      hilog.info(DOMAIN, TAG, 'expected=%{public}d, actual=%{public}d', expected, actual);
      expect(actual).assertEqual(expected);
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocalAssertEqual_001, end');
    });

    /**
     * Verify collectEditorText-equivalent concatenation logic: join only the
     * string-typed span values and skip non-string (e.g. image) span values.
     * Mirrors Index.collectEditorText() which iterates RichEditorSpan[] and
     * pushes span.value when typeof value === 'string'.
     */
    it(BUNDLE + 'CollectEditorText_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CollectEditorText_001, begin');
      // Simulated span values mixing text and image (non-string) spans.
      const spanValues: (string | Resource)[] = ['Hello', ' ', 'OE', { id: -1 } as Resource];
      const parts: string[] = [];
      for (const v of spanValues) {
        if (typeof v === 'string') {
          parts.push(v);
        }
      }
      const collected: string = parts.join('');
      const expected: string = 'Hello OE';
      hilog.info(DOMAIN, TAG, 'collected=%{public}s, expected=%{public}s', collected, expected);
      expect(collected).assertEqual(expected);
      expect(parts.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'CollectEditorText_001, end');
    });
  });
}
