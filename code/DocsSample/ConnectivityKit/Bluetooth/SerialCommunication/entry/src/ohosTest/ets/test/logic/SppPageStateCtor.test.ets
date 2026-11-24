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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SppPageState } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new SppPageState (1 cases). */
export default function sppPageStateCtorTest(): void {
  describe('SppPageStateCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CTOR_0001
     * @tc.name      SerialCommunication_SppPageStateCtor_0001
     * @tc.desc      new SppPageState() initialises 7 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateCtor_0001 begin`);
      const subject: SppPageState = new SppPageState();
      logInfo(`new SppPageState(): subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(0);
      logInfo(`new SppPageState(): subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(1);
      logInfo(`new SppPageState(): subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('');
      logInfo(`new SppPageState(): subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('00001101-0000-1000-8000-00805f9b34fb');
      logInfo(`new SppPageState(): subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('');
      logInfo(`new SppPageState(): subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('');
      logInfo(`new SppPageState(): subject.written=${subject.written}`);
      expect(subject.written).assertEqual(0);
      logInfo(`${BUNDLE}SppPageStateCtor_0001 end`);
    });
  });
}
