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
import { ListExchangeModel } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new ListExchangeModel (1 cases). */
export default function listExchangeModelCtorTest(): void {
  describe('ListExchangeModelCtorTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_CTOR_0001
     * @tc.name      ListBeExchange_ListExchangeModelCtor_0001
     * @tc.desc      new ListExchangeModel() initialises 7 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelCtor_0001 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      logInfo(`new ListExchangeModel(): subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(0);
      logInfo(`new ListExchangeModel(): subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(0);
      logInfo(`new ListExchangeModel(): subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(0);
      logInfo(`new ListExchangeModel(): subject.shadows.length=${subject.shadows.length}`);
      expect(subject.shadows.length).assertEqual(0);
      logInfo(`new ListExchangeModel(): subject.dragRefOffset=${subject.dragRefOffset}`);
      expect(subject.dragRefOffset).assertEqual(0);
      logInfo(`new ListExchangeModel(): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ListExchangeModel(): subject.state=${subject.state}`);
      expect(subject.state).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelCtor_0001 end`);
    });
  });
}
