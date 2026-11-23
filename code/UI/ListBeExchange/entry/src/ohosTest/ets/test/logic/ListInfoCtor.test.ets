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
import { ListInfo } from '../../../../main/ets/bridge/ListExchangeBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new ListInfo (1 cases). */
export default function listInfoCtorTest(): void {
  describe('ListInfoCtorTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_INFO_CTOR_0001
     * @tc.name      ListBeExchange_ListInfoCtor_0001
     * @tc.desc      new ListInfo() initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListInfoCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListInfoCtor_0001 begin`);
      const subject: ListInfo = new ListInfo();
      logInfo(`new ListInfo(): subject.icon=${subject.icon}`);
      expect(subject.icon).assertEqual('');
      logInfo(`new ListInfo(): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`${BUNDLE}ListInfoCtor_0001 end`);
    });
  });
}
