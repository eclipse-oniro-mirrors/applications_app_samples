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

/** Logic checks for SppPageState.close (2 cases). */
export default function sppPageStateCloseTest(): void {
  describe('SppPageStateCloseTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CLOSE_0001
     * @tc.name      SerialCommunication_SppPageStateClose_0001
     * @tc.desc      SppPageState.close(isServer=true) yields "sppCloseServerSocket success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateClose_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateClose_0001 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.close(true);
      logInfo(`close(isServer=true): actual=${actual}`);
      expect(actual).assertEqual('sppCloseServerSocket success');
      logInfo(`close(isServer=true) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateClose_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CLOSE_0002
     * @tc.name      SerialCommunication_SppPageStateClose_0002
     * @tc.desc      SppPageState.close(isServer=false) yields "sppCloseClientSocket success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateClose_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateClose_0002 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.close(false);
      logInfo(`close(isServer=false): actual=${actual}`);
      expect(actual).assertEqual('sppCloseClientSocket success');
      logInfo(`close(isServer=false) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateClose_0002 end`);
    });
  });
}
