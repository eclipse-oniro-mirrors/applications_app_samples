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
export default function sppPageStateInputTest(): void {
  describe('SppPageStateInputTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0001
     * @tc.name      SerialCommunication_SppPageStateInput_0001
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="sppListen") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateInput_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0001 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0002
     * @tc.name      SerialCommunication_SppPageStateInput_0002
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="sppAccept") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateInput_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0002 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0003
     * @tc.name      SerialCommunication_SppPageStateInput_0003
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="sppConnect") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0003 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0004
     * @tc.name      SerialCommunication_SppPageStateInput_0004
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="sppWrite success") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0004 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0005
     * @tc.name      SerialCommunication_SppPageStateInput_0005
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="sppCloseServerSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0005 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0006
     * @tc.name      SerialCommunication_SppPageStateInput_0006
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="sppCloseClientSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0006 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0007
     * @tc.name      SerialCommunication_SppPageStateInput_0007
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="SPPLISTEN") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0007 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0008
     * @tc.name      SerialCommunication_SppPageStateInput_0008
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="sppListe") yields "sppListen"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0008 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0009
     * @tc.name      SerialCommunication_SppPageStateInput_0009
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="sppListenx") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0009 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0010
     * @tc.name      SerialCommunication_SppPageStateInput_0010
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListen", dataValue="SPPACCEPT") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0010 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListen', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0011
     * @tc.name      SerialCommunication_SppPageStateInput_0011
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="sppListen") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0011 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0012
     * @tc.name      SerialCommunication_SppPageStateInput_0012
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="sppAccept") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0012 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0013
     * @tc.name      SerialCommunication_SppPageStateInput_0013
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="sppConnect") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0013 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0014
     * @tc.name      SerialCommunication_SppPageStateInput_0014
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="sppWrite success") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0014 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0015
     * @tc.name      SerialCommunication_SppPageStateInput_0015
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="sppCloseServerSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0015 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0016
     * @tc.name      SerialCommunication_SppPageStateInput_0016
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="sppCloseClientSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0016 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0017
     * @tc.name      SerialCommunication_SppPageStateInput_0017
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="SPPLISTEN") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0017 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0018
     * @tc.name      SerialCommunication_SppPageStateInput_0018
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="sppListe") yields "sppListen"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0018 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0019
     * @tc.name      SerialCommunication_SppPageStateInput_0019
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="sppListenx") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0019 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0020
     * @tc.name      SerialCommunication_SppPageStateInput_0020
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppAccept", dataValue="SPPACCEPT") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0020 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppAccept', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppAcce...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0021
     * @tc.name      SerialCommunication_SppPageStateInput_0021
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="sppListen") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0021 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0022
     * @tc.name      SerialCommunication_SppPageStateInput_0022
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="sppAccept") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0022 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0023
     * @tc.name      SerialCommunication_SppPageStateInput_0023
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="sppConnect") yields "sppL...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0023 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0024
     * @tc.name      SerialCommunication_SppPageStateInput_0024
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="sppWrite success") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0024 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0025
     * @tc.name      SerialCommunication_SppPageStateInput_0025
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="sppCloseServerSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0025 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0026
     * @tc.name      SerialCommunication_SppPageStateInput_0026
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="sppCloseClientSocket succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0026 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0027
     * @tc.name      SerialCommunication_SppPageStateInput_0027
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="SPPLISTEN") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0027 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0028
     * @tc.name      SerialCommunication_SppPageStateInput_0028
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="sppListe") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0028 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0029
     * @tc.name      SerialCommunication_SppPageStateInput_0029
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="sppListenx") yields "sppL...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0029 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0030
     * @tc.name      SerialCommunication_SppPageStateInput_0030
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppConnect", dataValue="SPPACCEPT") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0030 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppConnect', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppConn...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0031
     * @tc.name      SerialCommunication_SppPageStateInput_0031
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="sppListen") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0031 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0032
     * @tc.name      SerialCommunication_SppPageStateInput_0032
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="sppAccept") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0032 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0033
     * @tc.name      SerialCommunication_SppPageStateInput_0033
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="sppConnect") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0033 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0034
     * @tc.name      SerialCommunication_SppPageStateInput_0034
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="sppWrite success") ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0034 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0035
     * @tc.name      SerialCommunication_SppPageStateInput_0035
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="sppCloseServerSocke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0035 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0036
     * @tc.name      SerialCommunication_SppPageStateInput_0036
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="sppCloseClientSocke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0036 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0037
     * @tc.name      SerialCommunication_SppPageStateInput_0037
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="SPPLISTEN") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0037 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0038
     * @tc.name      SerialCommunication_SppPageStateInput_0038
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="sppListe") yields "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0038 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0039
     * @tc.name      SerialCommunication_SppPageStateInput_0039
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="sppListenx") yields...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0039 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0040
     * @tc.name      SerialCommunication_SppPageStateInput_0040
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppWrite success", dataValue="SPPACCEPT") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0040 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppWrite success', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppWrit...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0041
     * @tc.name      SerialCommunication_SppPageStateInput_0041
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0041 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0042
     * @tc.name      SerialCommunication_SppPageStateInput_0042
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="sppAcce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0042 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0043
     * @tc.name      SerialCommunication_SppPageStateInput_0043
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="sppConn...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0043 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0044
     * @tc.name      SerialCommunication_SppPageStateInput_0044
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="sppWrit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0044 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0045
     * @tc.name      SerialCommunication_SppPageStateInput_0045
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="sppClos...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0045 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0046
     * @tc.name      SerialCommunication_SppPageStateInput_0046
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="sppClos...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0046 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0047
     * @tc.name      SerialCommunication_SppPageStateInput_0047
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="SPPLIST...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0047 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0048
     * @tc.name      SerialCommunication_SppPageStateInput_0048
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0048 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0049
     * @tc.name      SerialCommunication_SppPageStateInput_0049
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0049 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0050
     * @tc.name      SerialCommunication_SppPageStateInput_0050
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseServerSocket success", dataValue="SPPACCE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0050 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseServerSocket success', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0051
     * @tc.name      SerialCommunication_SppPageStateInput_0051
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0051 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0052
     * @tc.name      SerialCommunication_SppPageStateInput_0052
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="sppAcce...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0052 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0053
     * @tc.name      SerialCommunication_SppPageStateInput_0053
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="sppConn...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0053 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0054
     * @tc.name      SerialCommunication_SppPageStateInput_0054
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="sppWrit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0054 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0055
     * @tc.name      SerialCommunication_SppPageStateInput_0055
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="sppClos...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0055 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0056
     * @tc.name      SerialCommunication_SppPageStateInput_0056
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="sppClos...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateInput_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0056 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0057
     * @tc.name      SerialCommunication_SppPageStateInput_0057
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="SPPLIST...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0057 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0058
     * @tc.name      SerialCommunication_SppPageStateInput_0058
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0058 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0059
     * @tc.name      SerialCommunication_SppPageStateInput_0059
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="sppList...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0059 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0060
     * @tc.name      SerialCommunication_SppPageStateInput_0060
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppCloseClientSocket success", dataValue="SPPACCE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0060 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppCloseClientSocket success', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="sppClos...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0061
     * @tc.name      SerialCommunication_SppPageStateInput_0061
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="sppListen") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0061 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0062
     * @tc.name      SerialCommunication_SppPageStateInput_0062
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="sppAccept") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0062 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0063
     * @tc.name      SerialCommunication_SppPageStateInput_0063
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="sppConnect") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0063 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0064
     * @tc.name      SerialCommunication_SppPageStateInput_0064
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="sppWrite success") yields ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0064 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'sppWrite success');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateInput_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0065
     * @tc.name      SerialCommunication_SppPageStateInput_0065
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="sppCloseServerSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0065 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'sppCloseServerSocket success');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0066
     * @tc.name      SerialCommunication_SppPageStateInput_0066
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="sppCloseClientSocket succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0066 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'sppCloseClientSocket success');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateInput_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0067
     * @tc.name      SerialCommunication_SppPageStateInput_0067
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="SPPLISTEN") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0067 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPLISTEN');
      logInfo(`${BUNDLE}SppPageStateInput_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0068
     * @tc.name      SerialCommunication_SppPageStateInput_0068
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="sppListe") yields "sppListen"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0068 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'sppListe');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListe');
      logInfo(`${BUNDLE}SppPageStateInput_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0069
     * @tc.name      SerialCommunication_SppPageStateInput_0069
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="sppListenx") yields "sppLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0069 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'sppListenx');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListenx');
      logInfo(`${BUNDLE}SppPageStateInput_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0070
     * @tc.name      SerialCommunication_SppPageStateInput_0070
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="SPPLISTEN", dataValue="SPPACCEPT") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0070 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'SPPLISTEN', 'SPPACCEPT');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('SPPLISTEN');
      logInfo(`input(deviceId="sppListen", uuid="SPPLIST...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('SPPACCEPT');
      logInfo(`${BUNDLE}SppPageStateInput_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0071
     * @tc.name      SerialCommunication_SppPageStateInput_0071
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="sppListen") yields "sppListen"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0071 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppListen');
      logInfo(`${BUNDLE}SppPageStateInput_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0072
     * @tc.name      SerialCommunication_SppPageStateInput_0072
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="sppAccept") yields "sppListen"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0072 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'sppAccept');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppAccept');
      logInfo(`${BUNDLE}SppPageStateInput_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_INPUT_0073
     * @tc.name      SerialCommunication_SppPageStateInput_0073
     * @tc.desc      SppPageState.input(deviceId="sppListen", uuid="sppListe", dataValue="sppConnect") yields "sppLis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateInput_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateInput_0073 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('sppListen', 'sppListe', 'sppConnect');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('sppListen');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('sppListe');
      logInfo(`input(deviceId="sppListen", uuid="sppList...: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('sppConnect');
      logInfo(`${BUNDLE}SppPageStateInput_0073 end`);
    });
  });
}
