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
// [Start argumentMatchersForRegex_sample]
import { ArgumentMatchers, beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  method_1(arg: string): string {
    return '888888';
  }
}

export default function matchRegexsTest(): void {
  describe('argumentMatchersForRegex_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitRegexMatcher0001
     * @tc.name testJsunitRegexMatcher0001
     * @tc.desc Match the regex in exact and containing strings and retain unmatched behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitRegexMatcher0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        const mocked: Function = mocker.mockFunc(claser, claser.method_1);
        when(mocked)(ArgumentMatchers.matchRegexs(new RegExp('test'))).afterReturn('1');
        const exactResult: string = claser.method_1('test');
        hilog.info(0x0000, 'RegexMatcher', 'regex=test input=test result=%{public}s expected=1', exactResult);
        expect(exactResult).assertEqual('1');
        const containingResult: string = claser.method_1('prefix-test-suffix');
        hilog.info(0x0000, 'RegexMatcher', 'regex=test input=prefix-test-suffix result=%{public}s expected=1',
          containingResult);
        expect(containingResult).assertEqual('1');
        const unmatchedResult: string = claser.method_1('abc');
        hilog.info(0x0000, 'RegexMatcher', 'regex=test input=abc result=%{public}s expected=888888', unmatchedResult);
        expect(unmatchedResult).assertEqual('888888');
      } finally {
        mocker.clear(claser);
      }
    });
  });
}
// [End argumentMatchersForRegex_sample]
