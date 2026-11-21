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
// [Start argumentMatchersForAny_sample]
import { ArgumentMatchers, beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  method_1(arg: string | number | boolean): string {
    return '888888';
  }
}

export default function argumentMatchersAnyTest(): void {
  describe('argumentMatchersForAny_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAnyMatcher0001
     * @tc.name testJsunitAnyMatcher0001
     * @tc.desc Match actual string, number and boolean arguments rather than three strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAnyMatcher0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        const mocked: Function = mocker.mockFunc(claser, claser.method_1);
        when(mocked)(ArgumentMatchers.any).afterReturn('1');
        const stringResult: string = claser.method_1('test');
        hilog.info(0x0000, 'AnyMatcher', 'input string=test result=%{public}s expected=1', stringResult);
        expect(stringResult).assertEqual('1');
        const numberResult: string = claser.method_1(123);
        hilog.info(0x0000, 'AnyMatcher', 'input number=123 result=%{public}s expected=1', numberResult);
        expect(numberResult).assertEqual('1');
        const booleanResult: string = claser.method_1(true);
        hilog.info(0x0000, 'AnyMatcher', 'input boolean=true result=%{public}s expected=1', booleanResult);
        expect(booleanResult).assertEqual('1');
      } finally {
        mocker.clear(claser);
      }
    });
  });
}
// [End argumentMatchersForAny_sample]
