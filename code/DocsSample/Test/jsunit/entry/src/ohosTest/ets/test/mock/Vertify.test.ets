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
// [Start verify_sample]
import { beforeEach, describe, expect, it, MockKit } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  method_1(...arg: string[]): string {
    return '888888';
  }

  method_2(...arg: string[]): string {
    return '999999';
  }
}

export default function verifyTest(): void {
  describe('verify_sample', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitVerifyArguments0001
     * @tc.name testJsunitVerifyArguments0001
     * @tc.desc Record actual calls and distinguish a one-argument call from a two-argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitVerifyArguments0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        mocker.mockFunc(claser, claser.method_1);
        mocker.mockFunc(claser, claser.method_2);
        const firstResults: string[] = [claser.method_1('abc', 'ppp'), claser.method_1('abc'),
          claser.method_1('xyz'), claser.method_1(), claser.method_1('abc', 'xxx', 'yyy'), claser.method_1()];
        const secondResults: string[] = [claser.method_2('111'), claser.method_2('111', '222')];
        hilog.info(0x0000, 'VerifyArguments', 'method_1 results=%{public}s', JSON.stringify(firstResults));
        expect(firstResults).assertDeepEquals(['888888', '888888', '888888', '888888', '888888', '888888']);
        hilog.info(0x0000, 'VerifyArguments', 'method_2 results=%{public}s', JSON.stringify(secondResults));
        expect(secondResults).assertDeepEquals(['999999', '999999']);
        hilog.info(0x0000, 'VerifyArguments', 'method_2 input=[111] result=%{public}s expected calls=1',
          secondResults[0]);
        mocker.verify('method_2', ['111']).once();
        hilog.info(0x0000, 'VerifyArguments', 'method_2 input=[111,222] result=%{public}s expected calls=1',
          secondResults[1]);
        mocker.verify('method_2', ['111', '222']).once();
        hilog.info(0x0000, 'VerifyArguments', 'method_2 called=[111],[111,222]; input=[222] expected calls=0');
        mocker.verify('method_2', ['222']).never();
      } finally {
        mocker.clear(claser);
      }
      const restoredResult: string = claser.method_2('111');
      hilog.info(0x0000, 'VerifyArguments', 'restored method_2 input=111 result=%{public}s expected=999999',
        restoredResult);
      expect(restoredResult).assertEqual('999999');
    });
  });
}
// [End verify_sample]
