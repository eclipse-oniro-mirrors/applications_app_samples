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
// [Start afterReturn_sample]
import { beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  method_1(arg: string): string {
    return '888888';
  }
}

export default function afterReturnTest(): void {
  describe('afterReturn_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAfterReturn0001
     * @tc.name testJsunitAfterReturn0001
     * @tc.desc Distinguish an explicit return, no return and the unmatched original method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAfterReturn0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        const mocked: Function = mocker.mockFunc(claser, claser.method_1);
        when(mocked)('testA').afterReturn('1');
        when(mocked)('testB').afterReturnNothing();
        const explicit: string = claser.method_1('testA');
        const absent: string | undefined = claser.method_1('testB');
        const unmatched: string = claser.method_1('other');
        hilog.info(0x0000, 'AfterReturn', 'A=%{public}s B=%{public}s other=%{public}s',
          explicit, String(absent), unmatched);
        expect(explicit).assertEqual('1');
        hilog.info(0x0000, 'AfterReturn', 'input=testB result=%{public}s expected=undefined', String(absent));
        expect(absent).assertUndefined();
        hilog.info(0x0000, 'AfterReturn', 'input=other result=%{public}s expected=888888', unmatched);
        expect(unmatched).assertEqual('888888');
      } finally {
        mocker.clear(claser);
      }
    });
  });
}
// [End afterReturn_sample]
