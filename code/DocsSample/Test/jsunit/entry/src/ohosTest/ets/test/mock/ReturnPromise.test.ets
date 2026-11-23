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
// [Start returnPromise_sample]
import { beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  method_1(arg: string): Promise<string> {
    return new Promise<string>((resolve: (value: string) => void): void => {
      setTimeout((): void => {
        resolve('Data conversion');
      }, 2000);
    });
  }
}

export default function mockPromiseTest(): void {
  describe('returnPromise_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitReturnPromise0001
     * @tc.name testJsunitReturnPromise0001
     * @tc.desc Verify the returned mock promise and recover the original asynchronous output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitReturnPromise0001', 0, async (): Promise<void> => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        const mocked: Function = mocker.mockFunc(claser, claser.method_1);
        when(mocked)('test').afterReturn(Promise.resolve('success something'));
        const promise: Promise<string> = claser.method_1('test');
        hilog.info(0x0000, 'ReturnPromise', 'mocked input=test; expect resolved promise');
        await expect(promise).assertPromiseIsResolved();
        const result: string = await promise;
        hilog.info(0x0000, 'ReturnPromise', 'resolved mock result=%{public}s', result);
        expect(result).assertEqual('success something');
      } finally {
        mocker.clear(claser);
      }
      const restored: string = await claser.method_1('test');
      hilog.info(0x0000, 'ReturnPromise', 'restored async result=%{public}s', restored);
      expect(restored).assertEqual('Data conversion');
    });
  });
}
// [End returnPromise_sample]
