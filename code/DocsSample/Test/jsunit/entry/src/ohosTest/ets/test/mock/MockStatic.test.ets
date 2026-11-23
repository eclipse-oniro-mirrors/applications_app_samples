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
// [Start mockStatic_sample]
import { ArgumentMatchers, beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  static method_1(): string {
    return 'ClassName_method_1_call';
  }
}

export default function staticTest(): void {
  describe('mockStatic_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitMockStatic0001
     * @tc.name testJsunitMockStatic0001
     * @tc.desc Observe original, mocked and restored static results without leaking class mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitMockStatic0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const original: string = ClassName.method_1();
      hilog.info(0x0000, 'MockStatic', 'original=%{public}s', original);
      expect(original).assertEqual('ClassName_method_1_call');
      try {
        const mocked: Function = mocker.mockFunc(ClassName, ClassName.method_1);
        when(mocked)(ArgumentMatchers.any).afterReturn('mock_data');
        const result: string = ClassName.method_1();
        hilog.info(0x0000, 'MockStatic', 'mocked=%{public}s', result);
        expect(result).assertEqual('mock_data');
      } finally {
        mocker.clear(ClassName);
      }
      const restored: string = ClassName.method_1();
      hilog.info(0x0000, 'MockStatic', 'restored=%{public}s', restored);
      expect(restored).assertEqual('ClassName_method_1_call');
    });
  });
}
// [End mockStatic_sample]
