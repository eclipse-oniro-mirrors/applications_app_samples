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
// [Start ignoreMock_sample]
import { ArgumentMatchers, beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  method_1(...arg: number[]): string {
    return '888888';
  }

  method_2(...arg: number[]): string {
    return '999999';
  }
}

export default function ignoreMockTest(): void {
  describe('ignoreMock_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitIgnoreMock0001
     * @tc.name testJsunitIgnoreMock0001
     * @tc.desc Restore one method while retaining the other method stub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitIgnoreMock0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        const first: Function = mocker.mockFunc(claser, claser.method_1);
        const second: Function = mocker.mockFunc(claser, claser.method_2);
        when(first)(ArgumentMatchers.anyNumber).afterReturn('4');
        when(second)(ArgumentMatchers.anyNumber).afterReturn('5');
        const mockedResults: string[] = [claser.method_1(123), claser.method_2(456)];
        hilog.info(0x0000, 'IgnoreMock', 'method_1/2 inputs=123,456 results=%{public}s expected=[4,5]',
          JSON.stringify(mockedResults));
        expect(mockedResults).assertDeepEquals(['4', '5']);
        mocker.ignoreMock(claser, claser.method_1);
        const restoredResult: string = claser.method_1(123);
        hilog.info(0x0000, 'IgnoreMock', 'restored method_1 input=123 result=%{public}s expected=888888',
          restoredResult);
        expect(restoredResult).assertEqual('888888');
        const retainedResult: string = claser.method_2(456);
        hilog.info(0x0000, 'IgnoreMock', 'retained method_2 input=456 result=%{public}s expected=5', retainedResult);
        expect(retainedResult).assertEqual('5');
      } finally {
        mocker.clear(claser);
      }
    });
  });
}
// [End ignoreMock_sample]
