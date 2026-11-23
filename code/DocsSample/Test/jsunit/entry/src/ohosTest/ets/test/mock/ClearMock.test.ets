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
// [Start clearMock_sample]
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

export default function clearTest(): void {
  describe('clearMock_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitClearMock0001
     * @tc.name testJsunitClearMock0001
     * @tc.desc Restore both mocked methods with a single clear operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitClearMock0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        const first: Function = mocker.mockFunc(claser, claser.method_1);
        const second: Function = mocker.mockFunc(claser, claser.method_2);
        when(first)(ArgumentMatchers.anyNumber).afterReturn('4');
        when(second)(ArgumentMatchers.anyNumber).afterReturn('5');
        const firstMocked: string = claser.method_1(123);
        hilog.info(0x0000, 'ClearMock', 'mocked method_1 input=123 result=%{public}s expected=4', firstMocked);
        expect(firstMocked).assertEqual('4');
        const secondMocked: string = claser.method_2(123);
        hilog.info(0x0000, 'ClearMock', 'mocked method_2 input=123 result=%{public}s expected=5', secondMocked);
        expect(secondMocked).assertEqual('5');
        mocker.clear(claser);
        const firstRestored: string = claser.method_1(123);
        hilog.info(0x0000, 'ClearMock', 'cleared method_1 input=123 result=%{public}s expected=888888', firstRestored);
        expect(firstRestored).assertEqual('888888');
        const secondRestored: string = claser.method_2(123);
        hilog.info(0x0000, 'ClearMock', 'cleared method_2 input=123 result=%{public}s expected=999999', secondRestored);
        expect(secondRestored).assertEqual('999999');
      } finally {
        mocker.clear(claser);
      }
    });
  });
}
// [End clearMock_sample]
