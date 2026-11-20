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
export default function sppPageStateInput2Test(): void {
  describe('SppPageStateInput2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0074
     * @tc.name      SerialCommunication_SppPageStateInput_0074
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="sppWrite success") yields "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0074 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0075
     * @tc.name      SerialCommunication_SppPageStateInput_0075
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="sppCloseServerSocket succes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0075 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0076
     * @tc.name      SerialCommunication_SppPageStateInput_0076
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="sppCloseClientSocket succes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0076 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0077
     * @tc.name      SerialCommunication_SppPageStateInput_0077
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="SPPLISTEN") yields "sppListen"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0077 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0078
     * @tc.name      SerialCommunication_SppPageStateInput_0078
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="sppListe") yields "sppListen"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0078 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0079
     * @tc.name      SerialCommunication_SppPageStateInput_0079
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="sppListenx") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0079 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0080
     * @tc.name      SerialCommunication_SppPageStateInput_0080
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="SPPACCEPT") yields "sppListen"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0080 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0081
     * @tc.name      SerialCommunication_SppPageStateInput_0081
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="sppListen") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0081 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0082
     * @tc.name      SerialCommunication_SppPageStateInput_0082
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="sppAccept") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0082 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0083
     * @tc.name      SerialCommunication_SppPageStateInput_0083
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="sppConnect") yields "sppL...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0083 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0084
     * @tc.name      SerialCommunication_SppPageStateInput_0084
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="sppWrite success") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0084 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0085
     * @tc.name      SerialCommunication_SppPageStateInput_0085
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="sppCloseServerSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0085 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0086
     * @tc.name      SerialCommunication_SppPageStateInput_0086
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="sppCloseClientSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0086 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0087
     * @tc.name      SerialCommunication_SppPageStateInput_0087
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="SPPLISTEN") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0087 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0088
     * @tc.name      SerialCommunication_SppPageStateInput_0088
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="sppListe") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0088 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0089
     * @tc.name      SerialCommunication_SppPageStateInput_0089
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="sppListenx") yields "sppL...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0089 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0090
     * @tc.name      SerialCommunication_SppPageStateInput_0090
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListenx", dataValue="SPPACCEPT") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0090 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListenx', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0090 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0091
     * @tc.name      SerialCommunication_SppPageStateInput_0091
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="sppListen") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0091 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0091 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0092
     * @tc.name      SerialCommunication_SppPageStateInput_0092
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="sppAccept") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0092 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0092 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0093
     * @tc.name      SerialCommunication_SppPageStateInput_0093
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="sppConnect") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0093 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0093 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0094
     * @tc.name      SerialCommunication_SppPageStateInput_0094
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="sppWrite success") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0094 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0094 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0095
     * @tc.name      SerialCommunication_SppPageStateInput_0095
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="sppCloseServerSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0095 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0095 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0096
     * @tc.name      SerialCommunication_SppPageStateInput_0096
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="sppCloseClientSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0096 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0096 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0097
     * @tc.name      SerialCommunication_SppPageStateInput_0097
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="SPPLISTEN") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0097 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0097 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0098
     * @tc.name      SerialCommunication_SppPageStateInput_0098
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="sppListe") yields "sppListen"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0098 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0098 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0099
     * @tc.name      SerialCommunication_SppPageStateInput_0099
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="sppListenx") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0099 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0099 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0100
     * @tc.name      SerialCommunication_SppPageStateInput_0100
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPACCEPT", dataValue="SPPACCEPT") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0100 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPACCEPT', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPACCE...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0100 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0101
     * @tc.name      SerialCommunication_SppPageStateInput_0101
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="sppListen") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0101 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0101 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0102
     * @tc.name      SerialCommunication_SppPageStateInput_0102
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="sppAccept") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0102 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0102 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0103
     * @tc.name      SerialCommunication_SppPageStateInput_0103
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="sppConnect") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0103 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0103 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0104
     * @tc.name      SerialCommunication_SppPageStateInput_0104
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="sppWrite success") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0104 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0104 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0105
     * @tc.name      SerialCommunication_SppPageStateInput_0105
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="sppCloseServerSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0105 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0105 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0106
     * @tc.name      SerialCommunication_SppPageStateInput_0106
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="sppCloseClientSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0106 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0106 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0107
     * @tc.name      SerialCommunication_SppPageStateInput_0107
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="SPPLISTEN") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0107 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0107 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0108
     * @tc.name      SerialCommunication_SppPageStateInput_0108
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="sppListe") yields "sppAccept"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0108 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0108 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0109
     * @tc.name      SerialCommunication_SppPageStateInput_0109
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="sppListenx") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0109 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0109 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0110
     * @tc.name      SerialCommunication_SppPageStateInput_0110
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppListen", dataValue="SPPACCEPT") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0110 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppListen', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0110 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0111
     * @tc.name      SerialCommunication_SppPageStateInput_0111
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="sppListen") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0111 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0111 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0112
     * @tc.name      SerialCommunication_SppPageStateInput_0112
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="sppAccept") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0112 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0112 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0113
     * @tc.name      SerialCommunication_SppPageStateInput_0113
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="sppConnect") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0113 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0113 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0114
     * @tc.name      SerialCommunication_SppPageStateInput_0114
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="sppWrite success") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0114 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0114 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0115
     * @tc.name      SerialCommunication_SppPageStateInput_0115
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="sppCloseServerSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0115 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0115 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0116
     * @tc.name      SerialCommunication_SppPageStateInput_0116
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="sppCloseClientSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0116 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0116 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0117
     * @tc.name      SerialCommunication_SppPageStateInput_0117
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="SPPLISTEN") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0117 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0117 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0118
     * @tc.name      SerialCommunication_SppPageStateInput_0118
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="sppListe") yields "sppAccept"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0118 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0118 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0119
     * @tc.name      SerialCommunication_SppPageStateInput_0119
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="sppListenx") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0119 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0119 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0120
     * @tc.name      SerialCommunication_SppPageStateInput_0120
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppAccept", dataValue="SPPACCEPT") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0120 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppAccept', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0120 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0121
     * @tc.name      SerialCommunication_SppPageStateInput_0121
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="sppListen") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0121 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0121 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0122
     * @tc.name      SerialCommunication_SppPageStateInput_0122
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="sppAccept") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0122 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0122 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0123
     * @tc.name      SerialCommunication_SppPageStateInput_0123
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="sppConnect") yields "sppA...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0123 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0123 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0124
     * @tc.name      SerialCommunication_SppPageStateInput_0124
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="sppWrite success") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0124 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0124 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0125
     * @tc.name      SerialCommunication_SppPageStateInput_0125
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="sppCloseServerSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0125 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0125 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0126
     * @tc.name      SerialCommunication_SppPageStateInput_0126
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="sppCloseClientSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0126 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0126 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0127
     * @tc.name      SerialCommunication_SppPageStateInput_0127
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="SPPLISTEN") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0127 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0127 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0128
     * @tc.name      SerialCommunication_SppPageStateInput_0128
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="sppListe") yields "sppAcc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0128 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0128 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0129
     * @tc.name      SerialCommunication_SppPageStateInput_0129
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="sppListenx") yields "sppA...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0129 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0129 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0130
     * @tc.name      SerialCommunication_SppPageStateInput_0130
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppConnect", dataValue="SPPACCEPT") yields "sppAc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0130 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppConnect', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0130 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0131
     * @tc.name      SerialCommunication_SppPageStateInput_0131
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="sppListen") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0131 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0131 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0132
     * @tc.name      SerialCommunication_SppPageStateInput_0132
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="sppAccept") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0132 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0132 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0133
     * @tc.name      SerialCommunication_SppPageStateInput_0133
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="sppConnect") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0133 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0133 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0134
     * @tc.name      SerialCommunication_SppPageStateInput_0134
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="sppWrite success") ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0134 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0134 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0135
     * @tc.name      SerialCommunication_SppPageStateInput_0135
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="sppCloseServerSocke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0135 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0135 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0136
     * @tc.name      SerialCommunication_SppPageStateInput_0136
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="sppCloseClientSocke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0136 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0136 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0137
     * @tc.name      SerialCommunication_SppPageStateInput_0137
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="SPPLISTEN") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0137 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'SPPLISTEN');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0137 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0138
     * @tc.name      SerialCommunication_SppPageStateInput_0138
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="sppListe") yields "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0138 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'sppListe');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0138 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0139
     * @tc.name      SerialCommunication_SppPageStateInput_0139
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="sppListenx") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0139 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'sppListenx');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0139 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0140
     * @tc.name      SerialCommunication_SppPageStateInput_0140
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppWrite success", dataValue="SPPACCEPT") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0140 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppWrite success', 'SPPACCEPT');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0140 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0141
     * @tc.name      SerialCommunication_SppPageStateInput_0141
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0141 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'sppListen');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0141 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0142
     * @tc.name      SerialCommunication_SppPageStateInput_0142
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="sppAcce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0142 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0142 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0143
     * @tc.name      SerialCommunication_SppPageStateInput_0143
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="sppConn...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0143 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'sppConnect');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0143 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0144
     * @tc.name      SerialCommunication_SppPageStateInput_0144
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="sppWrit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0144 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'sppWrite success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0144 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0145
     * @tc.name      SerialCommunication_SppPageStateInput_0145
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="sppClos...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0145 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0145 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0146
     * @tc.name      SerialCommunication_SppPageStateInput_0146
     * @tc.desc      SppPageState.input(deviceId="sppAccept", uuid="sppCloseServerSocket success", dataValue="sppClos...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0146 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppAccept', 'sppCloseServerSocket success', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppAccept", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0146 end`);
    });
  });
}
