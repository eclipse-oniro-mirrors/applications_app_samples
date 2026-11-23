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
// [Start afterThrow_sample]
import { beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  method_1(arg: string): string {
    return '888888';
  }
}

export default function afterThrowTest(): void {
  describe('afterThrow_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAfterThrow0001
     * @tc.name testJsunitAfterThrow0001
     * @tc.desc Verify original output, an actual primitive mock throw and restoration after clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAfterThrow0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      const original: string = claser.method_1('test');
      hilog.info(0x0000, 'AfterThrow', 'original test result=%{public}s', original);
      expect(original).assertEqual('888888');
      let threw: boolean = false;
      let message: string = '';
      let wasError: boolean = false;
      try {
        const mocked: Function = mocker.mockFunc(claser, claser.method_1);
        when(mocked)('test').afterThrow('error xxx');
        try {
          claser.method_1('test');
        } catch (error) {
          threw = true;
          wasError = error instanceof Error;
          message = error as string;
        }
        hilog.info(0x0000, 'AfterThrow', 'threw=%{public}s value=%{public}s', String(threw), message);
        expect(threw).assertTrue();
        hilog.info(0x0000, 'AfterThrow', 'input=test thrown value=%{public}s expected=error xxx', message);
        expect(message).assertEqual('error xxx');
        hilog.info(0x0000, 'AfterThrow', 'input=test wasError=%{public}s expected=false', String(wasError));
        expect(wasError).assertFalse();
      } finally {
        mocker.clear(claser);
      }
      const restored: string = claser.method_1('test');
      hilog.info(0x0000, 'AfterThrow', 'restored test result=%{public}s', restored);
      expect(restored).assertEqual('888888');
    });
  });
}
// [End afterThrow_sample]
