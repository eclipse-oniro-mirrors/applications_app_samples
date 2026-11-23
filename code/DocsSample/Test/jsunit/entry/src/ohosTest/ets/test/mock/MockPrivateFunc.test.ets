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
// [Start mockPrivateFunc_sample]
import { ArgumentMatchers, beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  method(arg: number): number {
    return this.method_1(arg);
  }

  private method_1(arg: number): number {
    return arg;
  }
}

export default function staticTest(): void {
  describe('privateTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitMockPrivate0001
     * @tc.name testJsunitMockPrivate0001
     * @tc.desc Observe the private stub through its public caller and restore the original implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitMockPrivate0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      hilog.info(0x0000, 'MockPrivate', 'original public caller input=123');
      expect(claser.method(123)).assertEqual(123);
      try {
        const mocked: Function = mocker.mockPrivateFunc(claser, 'method_1');
        when(mocked)(ArgumentMatchers.any).afterReturn(456);
        hilog.info(0x0000, 'MockPrivate', 'private stub through public caller input=123');
        expect(claser.method(123)).assertEqual(456);
      } finally {
        mocker.clear(claser);
      }
      hilog.info(0x0000, 'MockPrivate', 'restored public caller input=123');
      expect(claser.method(123)).assertEqual(123);
    });
  });
}
// [End mockPrivateFunc_sample]
