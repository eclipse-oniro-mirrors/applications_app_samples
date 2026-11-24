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

/** Logic checks for SppPageState.input (14 cases). */
export default function sppPageStateInput4Test(): void {
  describe('SppPageStateInput4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0220
     * @tc.name      SerialCommunication_SppPageStateInput_0220
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="SPPACCEPT") yields "sppCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0220 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'SPPACCEPT');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0220 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0221
     * @tc.name      SerialCommunication_SppPageStateInput_0221
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="sppListen") yields "sppC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0221 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0221 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0222
     * @tc.name      SerialCommunication_SppPageStateInput_0222
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="sppAccept") yields "sppC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0222 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0222 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0223
     * @tc.name      SerialCommunication_SppPageStateInput_0223
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="sppConnect") yields "spp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0223 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0223 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0224
     * @tc.name      SerialCommunication_SppPageStateInput_0224
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="sppWrite success") yield...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0224 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'sppWrite success');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0224 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0225
     * @tc.name      SerialCommunication_SppPageStateInput_0225
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="sppCloseServerSocket suc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0225 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0225 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0226
     * @tc.name      SerialCommunication_SppPageStateInput_0226
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="sppCloseClientSocket suc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0226 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0226 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0227
     * @tc.name      SerialCommunication_SppPageStateInput_0227
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="SPPLISTEN") yields "sppC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0227 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'SPPLISTEN');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0227 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0228
     * @tc.name      SerialCommunication_SppPageStateInput_0228
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="sppListe") yields "sppCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0228 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'sppListe');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0228 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0229
     * @tc.name      SerialCommunication_SppPageStateInput_0229
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="sppListenx") yields "spp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0229 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'sppListenx');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0229 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0230
     * @tc.name      SerialCommunication_SppPageStateInput_0230
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppConnect", dataValue="SPPACCEPT") yields "sppC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0230 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppConnect', 'SPPACCEPT');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppCon...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0230 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0231
     * @tc.name      SerialCommunication_SppPageStateInput_0231
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppWrite success", dataValue="sppListen") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0231 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppWrite success', 'sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppWri...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppWri...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppConnect", uuid="sppWri...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0231 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0232
     * @tc.name      SerialCommunication_SppPageStateInput_0232
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppWrite success", dataValue="sppAccept") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0232 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppWrite success', 'sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppWri...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppWri...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppConnect", uuid="sppWri...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0232 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0233
     * @tc.name      SerialCommunication_SppPageStateInput_0233
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppWrite success", dataValue="sppConnect") yield...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0233 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppWrite success', 'sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppWri...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppWri...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppConnect", uuid="sppWri...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0233 end`);
    });
  });
}
