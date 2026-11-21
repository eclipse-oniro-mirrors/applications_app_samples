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
import { paceTurn } from '../TestPace';
import { beforeEach, describe, expect, it, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import EntryAbility from '../../../../main/ets/entryability/EntryAbility';

function testFun(callBack: () => void): void {
  callBack();
}

export default function callBackExampleTest(): void {
  describe('callBackExampleTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitCallback0001
     * @tc.name testJsunitCallback0001
     * @tc.desc Propagate assertion exceptions through the awaited callback promise and observe real custom output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitCallback0001', TestType.FUNCTION, async (): Promise<void> => {
      const ability: EntryAbility = new EntryAbility();
      let callCount: number = 0;
      let trace: string = '';
      const result: string = await new Promise<string>((resolve: (value: string) => void,
        reject: (reason: Error) => void): void => {
        testFun((): void => {
          try {
            callCount++;
            const value: string = ability.customFun();
            hilog.info(0x0000, 'CallbackExample', 'callback count=%{public}d result=%{public}s', callCount, value);
            trace += 'callback';
            resolve(value);
          } catch (error) {
            reject(error as Error);
          }
        });
      });
      trace += '>resolved';
      hilog.info(0x0000, 'CallbackExample', 'awaited callback result=%{public}s', result);
      expect(result).assertEqual('custom');
      hilog.info(0x0000, 'CallbackExample', 'completed callback count=%{public}d', callCount);
      expect(callCount).assertEqual(1);
      hilog.info(0x0000, 'CallbackExample', 'callback completion order=%{public}s', trace);
      expect(trace).assertEqual('callback>resolved');
    });
  });
}
