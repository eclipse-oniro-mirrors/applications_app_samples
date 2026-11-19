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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ExchangeItemState } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new ExchangeItemState (1 cases). */
export default function exchangeItemStateCtorTest(): void {
  describe('ExchangeItemStateCtorTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_EXCHANGE_ITEM_STATE_CTOR_0001
     * @tc.name      ListBeExchange_ExchangeItemStateCtor_0001
     * @tc.desc      new ExchangeItemState() initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ExchangeItemStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ExchangeItemStateCtor_0001 begin`);
      const subject: ExchangeItemState = new ExchangeItemState();
      logInfo(`new ExchangeItemState(): subject.hasShadow=${subject.hasShadow}`);
      expect(subject.hasShadow).assertFalse();
      logInfo(`new ExchangeItemState(): subject.scale=${subject.scale}`);
      expect(subject.scale).assertEqual(1);
      logInfo(`new ExchangeItemState(): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ExchangeItemState(): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ExchangeItemState(): subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`${BUNDLE}ExchangeItemStateCtor_0001 end`);
    });
  });
}
