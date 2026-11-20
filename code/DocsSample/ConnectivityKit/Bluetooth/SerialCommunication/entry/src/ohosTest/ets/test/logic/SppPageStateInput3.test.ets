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

/** Logic checks for SppPageState.input (73 cases). */
export default function sppPageStateInput3Test(): void {
  describe('SppPageStateInput3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0147
     * @tc.name      SerialCommunication_SppPageStateInput_0147
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="SPPLIST...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0147 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0147 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0148
     * @tc.name      SerialCommunication_SppPageStateInput_0148
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0148 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0148 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0149
     * @tc.name      SerialCommunication_SppPageStateInput_0149
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0149 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0149 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0150
     * @tc.name      SerialCommunication_SppPageStateInput_0150
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="SPPACCE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0150 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0150 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0151
     * @tc.name      SerialCommunication_SppPageStateInput_0151
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0151 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0151 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0152
     * @tc.name      SerialCommunication_SppPageStateInput_0152
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="sppAcce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0152 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0152 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0153
     * @tc.name      SerialCommunication_SppPageStateInput_0153
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="sppConn...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0153 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0153 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0154
     * @tc.name      SerialCommunication_SppPageStateInput_0154
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="sppWrit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0154 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0154 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0155
     * @tc.name      SerialCommunication_SppPageStateInput_0155
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="sppClos...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0155 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0155 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0156
     * @tc.name      SerialCommunication_SppPageStateInput_0156
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="sppClos...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0156 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0156 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0157
     * @tc.name      SerialCommunication_SppPageStateInput_0157
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="SPPLIST...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0157 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0157 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0158
     * @tc.name      SerialCommunication_SppPageStateInput_0158
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0158 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0158 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0159
     * @tc.name      SerialCommunication_SppPageStateInput_0159
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0159 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0159 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0160
     * @tc.name      SerialCommunication_SppPageStateInput_0160
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseClientSocket success", dataValue="SPPACCE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0160 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseClientSocket success', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0160 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0161
     * @tc.name      SerialCommunication_SppPageStateInput_0161
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="sppListen") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0161 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0161 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0162
     * @tc.name      SerialCommunication_SppPageStateInput_0162
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="sppAccept") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0162 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0162 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0163
     * @tc.name      SerialCommunication_SppPageStateInput_0163
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="sppConnect") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0163 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0163 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0164
     * @tc.name      SerialCommunication_SppPageStateInput_0164
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="sppWrite success") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0164 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0164 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0165
     * @tc.name      SerialCommunication_SppPageStateInput_0165
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="sppCloseServerSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0165 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0165 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0166
     * @tc.name      SerialCommunication_SppPageStateInput_0166
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="sppCloseClientSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0166 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0166 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0167
     * @tc.name      SerialCommunication_SppPageStateInput_0167
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="SPPLISTEN") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0167 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0167 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0168
     * @tc.name      SerialCommunication_SppPageStateInput_0168
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="sppListe") yields "sppAccept"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0168 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0168 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0169
     * @tc.name      SerialCommunication_SppPageStateInput_0169
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="sppListenx") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0169 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0169 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0170
     * @tc.name      SerialCommunication_SppPageStateInput_0170
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPLISTEN", dataValue="SPPACCEPT") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0170 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPLISTEN', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0170 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0171
     * @tc.name      SerialCommunication_SppPageStateInput_0171
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="sppListen") yields "sppAccept"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0171 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0171 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0172
     * @tc.name      SerialCommunication_SppPageStateInput_0172
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="sppAccept") yields "sppAccept"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0172 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0172 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0173
     * @tc.name      SerialCommunication_SppPageStateInput_0173
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="sppConnect") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0173 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0173 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0174
     * @tc.name      SerialCommunication_SppPageStateInput_0174
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="sppWrite success") yields "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0174 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0174 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0175
     * @tc.name      SerialCommunication_SppPageStateInput_0175
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="sppCloseServerSocket succes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0175 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0175 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0176
     * @tc.name      SerialCommunication_SppPageStateInput_0176
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="sppCloseClientSocket succes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0176 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0176 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0177
     * @tc.name      SerialCommunication_SppPageStateInput_0177
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="SPPLISTEN") yields "sppAccept"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0177 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0177 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0178
     * @tc.name      SerialCommunication_SppPageStateInput_0178
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="sppListe") yields "sppAccept"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0178 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0178 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0179
     * @tc.name      SerialCommunication_SppPageStateInput_0179
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="sppListenx") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0179 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0179 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0180
     * @tc.name      SerialCommunication_SppPageStateInput_0180
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListe", dataValue="SPPACCEPT") yields "sppAccept"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0180 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListe', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0180 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0181
     * @tc.name      SerialCommunication_SppPageStateInput_0181
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="sppListen") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0181 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0181 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0182
     * @tc.name      SerialCommunication_SppPageStateInput_0182
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="sppAccept") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0182 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0182 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0183
     * @tc.name      SerialCommunication_SppPageStateInput_0183
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="sppConnect") yields "sppA...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0183 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0183 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0184
     * @tc.name      SerialCommunication_SppPageStateInput_0184
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="sppWrite success") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0184 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0184 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0185
     * @tc.name      SerialCommunication_SppPageStateInput_0185
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="sppCloseServerSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0185 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0185 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0186
     * @tc.name      SerialCommunication_SppPageStateInput_0186
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="sppCloseClientSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0186 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0186 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0187
     * @tc.name      SerialCommunication_SppPageStateInput_0187
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="SPPLISTEN") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0187 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0187 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0188
     * @tc.name      SerialCommunication_SppPageStateInput_0188
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="sppListe") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0188 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0188 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0189
     * @tc.name      SerialCommunication_SppPageStateInput_0189
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="sppListenx") yields "sppA...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0189 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0189 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0190
     * @tc.name      SerialCommunication_SppPageStateInput_0190
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListenx", dataValue="SPPACCEPT") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0190 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListenx', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0190 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0191
     * @tc.name      SerialCommunication_SppPageStateInput_0191
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="sppListen") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0191 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0191 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0192
     * @tc.name      SerialCommunication_SppPageStateInput_0192
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="sppAccept") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0192 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0192 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0193
     * @tc.name      SerialCommunication_SppPageStateInput_0193
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="sppConnect") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0193 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0193 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0194
     * @tc.name      SerialCommunication_SppPageStateInput_0194
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="sppWrite success") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0194 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0194 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0195
     * @tc.name      SerialCommunication_SppPageStateInput_0195
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="sppCloseServerSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0195 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0195 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0196
     * @tc.name      SerialCommunication_SppPageStateInput_0196
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="sppCloseClientSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0196 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0196 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0197
     * @tc.name      SerialCommunication_SppPageStateInput_0197
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="SPPLISTEN") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0197 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0197 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0198
     * @tc.name      SerialCommunication_SppPageStateInput_0198
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="sppListe") yields "sppAccept"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0198 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0198 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0199
     * @tc.name      SerialCommunication_SppPageStateInput_0199
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="sppListenx") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0199 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0199 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0200
     * @tc.name      SerialCommunication_SppPageStateInput_0200
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="SPPACCEPT", dataValue="SPPACCEPT") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0200 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'SPPACCEPT', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0200 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0201
     * @tc.name      SerialCommunication_SppPageStateInput_0201
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="sppListen") yields "sppCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0201 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0201 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0202
     * @tc.name      SerialCommunication_SppPageStateInput_0202
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="sppAccept") yields "sppCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0202 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0202 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0203
     * @tc.name      SerialCommunication_SppPageStateInput_0203
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="sppConnect") yields "sppC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0203 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0203 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0204
     * @tc.name      SerialCommunication_SppPageStateInput_0204
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="sppWrite success") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0204 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'sppWrite success');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0204 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0205
     * @tc.name      SerialCommunication_SppPageStateInput_0205
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="sppCloseServerSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0205 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0205 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0206
     * @tc.name      SerialCommunication_SppPageStateInput_0206
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="sppCloseClientSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0206 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0206 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0207
     * @tc.name      SerialCommunication_SppPageStateInput_0207
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="SPPLISTEN") yields "sppCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0207 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'SPPLISTEN');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0207 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0208
     * @tc.name      SerialCommunication_SppPageStateInput_0208
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="sppListe") yields "sppCon...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0208 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'sppListe');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0208 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0209
     * @tc.name      SerialCommunication_SppPageStateInput_0209
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="sppListenx") yields "sppC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0209 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'sppListenx');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0209 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0210
     * @tc.name      SerialCommunication_SppPageStateInput_0210
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppListen", dataValue="SPPACCEPT") yields "sppCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0210 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppListen', 'SPPACCEPT');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppLis...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0210 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0211
     * @tc.name      SerialCommunication_SppPageStateInput_0211
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="sppListen") yields "sppCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0211 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'sppListen');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0211 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0212
     * @tc.name      SerialCommunication_SppPageStateInput_0212
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="sppAccept") yields "sppCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0212 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0212 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0213
     * @tc.name      SerialCommunication_SppPageStateInput_0213
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="sppConnect") yields "sppC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0213 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0213 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0214
     * @tc.name      SerialCommunication_SppPageStateInput_0214
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="sppWrite success") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0214 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'sppWrite success');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0214 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0215
     * @tc.name      SerialCommunication_SppPageStateInput_0215
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="sppCloseServerSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0215 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0215 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0216
     * @tc.name      SerialCommunication_SppPageStateInput_0216
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="sppCloseClientSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0216 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0216 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0217
     * @tc.name      SerialCommunication_SppPageStateInput_0217
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="SPPLISTEN") yields "sppCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0217 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'SPPLISTEN');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0217 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0218
     * @tc.name      SerialCommunication_SppPageStateInput_0218
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="sppListe") yields "sppCon...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0218 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'sppListe');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0218 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0219
     * @tc.name      SerialCommunication_SppPageStateInput_0219
     * @tc.desc      SppPageState.input(deviceId="sppConnect", uuid="sppAccept", dataValue="sppListenx") yields "sppC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0219 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppConnect', 'sppAccept', 'sppListenx');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppConnect", uuid="sppAcc...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0219 end`);
    });
  });
}
