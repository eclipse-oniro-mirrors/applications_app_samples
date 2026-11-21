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
// [Start verifyTimes_sample]
import { beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  method_1(...arg: string[]): string {
    return '888888';
  }
}

export default function verifyTimesTest(): void {
  describe('verifyTimes_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitVerifyTimes0001
     * @tc.name testJsunitVerifyTimes0001
     * @tc.desc Verify repeated calls, unmatched prefixes and the installed zero-argument fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitVerifyTimes0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        const mocked: Function = mocker.mockFunc(claser, claser.method_1);
        when(mocked)('123').afterReturn('4');
        const exactResult: string = claser.method_1('123');
        hilog.info(0x0000, 'VerifyTimes', 'exact stub input=123 result=%{public}s expected=4', exactResult);
        expect(exactResult).assertEqual('4');
        const results: string[] = [claser.method_1('123', 'ppp'), claser.method_1('abc'), claser.method_1('xyz'),
          claser.method_1(), claser.method_1('abc', 'xxx', 'yyy'), claser.method_1('abc'), claser.method_1()];
        // MockKit.getReturnInfo uses the current stub for zero arguments; other unmatched calls use the original.
        hilog.info(0x0000, 'VerifyTimes', 'unmatched/empty call results=%{public}s', JSON.stringify(results));
        expect(results).assertDeepEquals(['888888', '888888', '888888', '4', '888888', '888888', '4']);
        hilog.info(0x0000, 'VerifyTimes', 'method_1 input=[abc] results=%{public}s,%{public}s expected calls=2',
          results[1], results[5]);
        mocker.verify('method_1', ['abc']).times(2);
        hilog.info(0x0000, 'VerifyTimes', 'method_1 input=[] results=%{public}s,%{public}s expected calls>=2',
          results[3], results[6]);
        mocker.verify('method_1', []).atLeast(2);
      } finally {
        mocker.clear(claser);
      }
      const restoredResult: string = claser.method_1('123');
      hilog.info(0x0000, 'VerifyTimes', 'cleared stub input=123 result=%{public}s expected=888888', restoredResult);
      expect(restoredResult).assertEqual('888888');
    });
  });
}
// [End verifyTimes_sample]
