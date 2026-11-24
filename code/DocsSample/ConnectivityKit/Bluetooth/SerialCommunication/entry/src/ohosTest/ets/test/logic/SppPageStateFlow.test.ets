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

/** Logic checks for SppPageState flow (54 cases). */
export default function sppPageStateFlowTest(): void {
  describe('SppPageStateFlowTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0001
     * @tc.name      SerialCommunication_SppPageStateFlow_0001
     * @tc.desc      SppPageState call flow listen > input > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0001 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(225, 45);
      logInfo(`step1 listen(225, 45): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 225');
      subject.input('', '', '\u4e2d\u6587');
      const step3: string = subject.listen(500, 0);
      logInfo(`step3 listen(500, 0): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 500');
      logInfo(`listen>input>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`listen>input>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`listen>input>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0002
     * @tc.name      SerialCommunication_SppPageStateFlow_0002
     * @tc.desc      SppPageState call flow listen > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0002 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(50, 35);
      logInfo(`step1 listen(50, 35): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 50');
      const step2: string = subject.listen(0, 35);
      logInfo(`step2 listen(0, 35): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 35');
      logInfo(`listen>listen final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(35);
      logInfo(`listen>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 35');
      logInfo(`${BUNDLE}SppPageStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0003
     * @tc.name      SerialCommunication_SppPageStateFlow_0003
     * @tc.desc      SppPageState call flow accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0003 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(75, 55);
      logInfo(`step1 accept(75, 55): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 75');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0004
     * @tc.name      SerialCommunication_SppPageStateFlow_0004
     * @tc.desc      SppPageState call flow close > close > accept > close > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0004 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      const step3: string = subject.accept(0, -1);
      logInfo(`step3 accept(0, -1): step3=${step3}`);
      expect(step3).assertEqual('accept the client success');
      const step4: string = subject.close(true);
      logInfo(`step4 close(true): step4=${step4}`);
      expect(step4).assertEqual('sppCloseServerSocket success');
      subject.input('xa', ' a ', 'A');
      logInfo(`close>close>accept>close>input final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(-1);
      logInfo(`close>close>accept>close>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`close>close>accept>close>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`close>close>accept>close>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`close>close>accept>close>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0005
     * @tc.name      SerialCommunication_SppPageStateFlow_0005
     * @tc.desc      SppPageState call flow connect > connect > listen > listen > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0005 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(175, 85);
      logInfo(`step1 connect(175, 85): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 175');
      const step2: string = subject.connect(450, 0);
      logInfo(`step2 connect(450, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 450');
      const step3: string = subject.listen(300, 60);
      logInfo(`step3 listen(300, 60): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 300');
      const step4: string = subject.listen(-25, 85);
      logInfo(`step4 listen(-25, 85): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is -25');
      const step5: string = subject.connect(200, 85);
      logInfo(`step5 connect(200, 85): step5=${step5}`);
      expect(step5).assertEqual('sppConnect error, code = 200');
      logInfo(`connect>connect>listen>listen>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0006
     * @tc.name      SerialCommunication_SppPageStateFlow_0006
     * @tc.desc      SppPageState call flow close > connect > accept > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0006 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.connect(0, 60);
      logInfo(`step2 connect(0, 60): step2=${step2}`);
      expect(step2).assertEqual('sppConnect success, socketId = 60');
      const step3: string = subject.accept(50, 25);
      logInfo(`step3 accept(50, 25): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 50');
      subject.input('', 'aa', 'a');
      logInfo(`close>connect>accept>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('aa');
      logInfo(`close>connect>accept>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('a');
      logInfo(`close>connect>accept>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 50');
      logInfo(`${BUNDLE}SppPageStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0007
     * @tc.name      SerialCommunication_SppPageStateFlow_0007
     * @tc.desc      SppPageState call flow close > accept > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0007 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.accept(125, 115);
      logInfo(`step2 accept(125, 115): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 125');
      const step3: string = subject.connect(425, 45);
      logInfo(`step3 connect(425, 45): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 425');
      logInfo(`close>accept>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 425');
      logInfo(`${BUNDLE}SppPageStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0008
     * @tc.name      SerialCommunication_SppPageStateFlow_0008
     * @tc.desc      SppPageState call flow connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0008 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(404, 5);
      logInfo(`step1 connect(404, 5): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 404');
      const step2: string = subject.accept(0, 20);
      logInfo(`step2 accept(0, 20): step2=${step2}`);
      expect(step2).assertEqual('accept the client success');
      logInfo(`connect>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(20);
      logInfo(`connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0009
     * @tc.name      SerialCommunication_SppPageStateFlow_0009
     * @tc.desc      SppPageState call flow connect > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0009 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(0, 85);
      logInfo(`step1 connect(0, 85): step1=${step1}`);
      expect(step1).assertEqual('sppConnect success, socketId = 85');
      const step2: string = subject.listen(225, -1);
      logInfo(`step2 listen(225, -1): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 225');
      logInfo(`connect>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 225');
      logInfo(`${BUNDLE}SppPageStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0010
     * @tc.name      SerialCommunication_SppPageStateFlow_0010
     * @tc.desc      SppPageState call flow close > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0010 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`close>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0011
     * @tc.name      SerialCommunication_SppPageStateFlow_0011
     * @tc.desc      SppPageState call flow accept > connect > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0011 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(212, 85);
      logInfo(`step1 accept(212, 85): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 212');
      const step2: string = subject.connect(0, 95);
      logInfo(`step2 connect(0, 95): step2=${step2}`);
      expect(step2).assertEqual('sppConnect success, socketId = 95');
      const step3: string = subject.listen(350, 2);
      logInfo(`step3 listen(350, 2): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 350');
      logInfo(`accept>connect>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 350');
      logInfo(`${BUNDLE}SppPageStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0012
     * @tc.name      SerialCommunication_SppPageStateFlow_0012
     * @tc.desc      SppPageState call flow input > close > input > listen > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0012 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('aa', 'xa', 'hello world');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      subject.input('xa', 'xa', 'Hello World');
      const step4: string = subject.listen(1, 0);
      logInfo(`step4 listen(1, 0): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is 1');
      subject.input('xa', '', 'Hello');
      logInfo(`input>close>input>listen>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`input>close>input>listen>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`input>close>input>listen>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>close>input>listen>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0013
     * @tc.name      SerialCommunication_SppPageStateFlow_0013
     * @tc.desc      SppPageState call flow connect > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0013 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(242, 85);
      logInfo(`step1 connect(242, 85): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 242');
      subject.input(' ', '', 'Hello');
      logInfo(`connect>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`connect>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`connect>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`connect>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 242');
      logInfo(`${BUNDLE}SppPageStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0014
     * @tc.name      SerialCommunication_SppPageStateFlow_0014
     * @tc.desc      SppPageState call flow close > close > connect > accept > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0014 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      const step3: string = subject.connect(-1, 0);
      logInfo(`step3 connect(-1, 0): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = -1');
      const step4: string = subject.accept(0, 3);
      logInfo(`step4 accept(0, 3): step4=${step4}`);
      expect(step4).assertEqual('accept the client success');
      const step5: number = subject.write();
      logInfo(`step5 write(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`close>close>connect>accept>write final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(3);
      logInfo(`close>close>connect>accept>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0015
     * @tc.name      SerialCommunication_SppPageStateFlow_0015
     * @tc.desc      SppPageState call flow input > write > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0015 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('abc', 'abc', '');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listen(100, 60);
      logInfo(`step3 listen(100, 60): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 100');
      logInfo(`input>write>listen final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`input>write>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`input>write>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 100');
      logInfo(`${BUNDLE}SppPageStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0016
     * @tc.name      SerialCommunication_SppPageStateFlow_0016
     * @tc.desc      SppPageState call flow connect > listen > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0016 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(275, 35);
      logInfo(`step1 connect(275, 35): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 275');
      const step2: string = subject.listen(1, 25);
      logInfo(`step2 listen(1, 25): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 1');
      const step3: string = subject.connect(242, 50);
      logInfo(`step3 connect(242, 50): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 242');
      logInfo(`connect>listen>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 242');
      logInfo(`${BUNDLE}SppPageStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0017
     * @tc.name      SerialCommunication_SppPageStateFlow_0017
     * @tc.desc      SppPageState call flow close > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0017 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.listen(75, 55);
      logInfo(`step2 listen(75, 55): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 75');
      logInfo(`close>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 75');
      logInfo(`${BUNDLE}SppPageStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0018
     * @tc.name      SerialCommunication_SppPageStateFlow_0018
     * @tc.desc      SppPageState call flow input > close > connect > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0018 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('', ' a ', 'Hello');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      const step3: string = subject.connect(459.14, 1);
      logInfo(`step3 connect(459.14, 1): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 459.14');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`input>close>connect>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`input>close>connect>write final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>close>connect>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`input>close>connect>write final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(5);
      logInfo(`${BUNDLE}SppPageStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0019
     * @tc.name      SerialCommunication_SppPageStateFlow_0019
     * @tc.desc      SppPageState call flow write > close > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0019 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      const step3: string = subject.connect(-1, 1);
      logInfo(`step3 connect(-1, 1): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = -1');
      logInfo(`write>close>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0020
     * @tc.name      SerialCommunication_SppPageStateFlow_0020
     * @tc.desc      SppPageState call flow close > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0020 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      subject.input('a_1', '', 'Hello');
      logInfo(`close>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`close>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`close>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`close>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0021
     * @tc.name      SerialCommunication_SppPageStateFlow_0021
     * @tc.desc      SppPageState call flow listen > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0021 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(425, 110);
      logInfo(`step1 listen(425, 110): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 425');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`listen>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0022
     * @tc.name      SerialCommunication_SppPageStateFlow_0022
     * @tc.desc      SppPageState call flow connect > input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0022 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(242, 85);
      logInfo(`step1 connect(242, 85): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 242');
      subject.input('', ' ', 'Hello');
      const step3: string = subject.accept(2, 3);
      logInfo(`step3 accept(2, 3): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 2');
      logInfo(`connect>input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' ');
      logInfo(`connect>input>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`connect>input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 2');
      logInfo(`${BUNDLE}SppPageStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0023
     * @tc.name      SerialCommunication_SppPageStateFlow_0023
     * @tc.desc      SppPageState call flow input > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0023 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('abc', 'aa', 'Hello World');
      const step2: string = subject.connect(450, 95);
      logInfo(`step2 connect(450, 95): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 450');
      logInfo(`input>connect final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`input>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('aa');
      logInfo(`input>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello World');
      logInfo(`input>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 450');
      logInfo(`${BUNDLE}SppPageStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0024
     * @tc.name      SerialCommunication_SppPageStateFlow_0024
     * @tc.desc      SppPageState call flow write > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0024 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.input('123', 'aa', ' ');
      logInfo(`write>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('123');
      logInfo(`write>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('aa');
      logInfo(`write>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual(' ');
      logInfo(`write>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0025
     * @tc.name      SerialCommunication_SppPageStateFlow_0025
     * @tc.desc      SppPageState call flow input > listen > close > connect > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0025 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('aa', 'a_1', '\u4e2d\u6587');
      const step2: string = subject.listen(0, 10);
      logInfo(`step2 listen(0, 10): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 10');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      const step4: string = subject.connect(400, 115);
      logInfo(`step4 connect(400, 115): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 400');
      const step5: string = subject.connect(325, 90);
      logInfo(`step5 connect(325, 90): step5=${step5}`);
      expect(step5).assertEqual('sppConnect error, code = 325');
      logInfo(`input>listen>close>connect>connect final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(10);
      logInfo(`input>listen>close>connect>connect final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`input>listen>close>connect>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a_1');
      logInfo(`input>listen>close>connect>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`input>listen>close>connect>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 325');
      logInfo(`${BUNDLE}SppPageStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0026
     * @tc.name      SerialCommunication_SppPageStateFlow_0026
     * @tc.desc      SppPageState call flow accept > listen > input > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0026 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(0, 2);
      logInfo(`step1 accept(0, 2): step1=${step1}`);
      expect(step1).assertEqual('accept the client success');
      const step2: string = subject.listen(447.61, 45);
      logInfo(`step2 listen(447.61, 45): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 447.61');
      subject.input('xa', ' a ', 'abc');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`accept>listen>input>write final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(2);
      logInfo(`accept>listen>input>write final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`accept>listen>input>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`accept>listen>input>write final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('abc');
      logInfo(`accept>listen>input>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`accept>listen>input>write final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(3);
      logInfo(`${BUNDLE}SppPageStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0027
     * @tc.name      SerialCommunication_SppPageStateFlow_0027
     * @tc.desc      SppPageState call flow listen > input > input > input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0027 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(3, 85);
      logInfo(`step1 listen(3, 85): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 3');
      subject.input('xa', ' a ', 'A');
      subject.input(' ', '', 'Hello');
      subject.input('a', 'a', 'hello world');
      const step5: string = subject.accept(0, 80);
      logInfo(`step5 accept(0, 80): step5=${step5}`);
      expect(step5).assertEqual('accept the client success');
      logInfo(`listen>input>input>input>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(80);
      logInfo(`listen>input>input>input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`listen>input>input>input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`listen>input>input>input>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`listen>input>input>input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0028
     * @tc.name      SerialCommunication_SppPageStateFlow_0028
     * @tc.desc      SppPageState call flow listen > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0028 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(250, 0);
      logInfo(`step1 listen(250, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 250');
      const step2: string = subject.connect(10, 75);
      logInfo(`step2 connect(10, 75): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 10');
      logInfo(`listen>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 10');
      logInfo(`${BUNDLE}SppPageStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0029
     * @tc.name      SerialCommunication_SppPageStateFlow_0029
     * @tc.desc      SppPageState call flow input > input > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0029 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('Hello World', '123', 'hello world');
      subject.input('', ' a ', 'Hello');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(5);
      logInfo(`input>input>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`input>input>write final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>input>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`input>input>write final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(5);
      logInfo(`${BUNDLE}SppPageStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0030
     * @tc.name      SerialCommunication_SppPageStateFlow_0030
     * @tc.desc      SppPageState call flow input > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0030 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('abc', ' ', 'Hello World');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(11);
      logInfo(`input>write final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`input>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' ');
      logInfo(`input>write final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello World');
      logInfo(`input>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`input>write final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(11);
      logInfo(`${BUNDLE}SppPageStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0031
     * @tc.name      SerialCommunication_SppPageStateFlow_0031
     * @tc.desc      SppPageState call flow write > write > accept > connect > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0031 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.accept(50, 25);
      logInfo(`step3 accept(50, 25): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 50');
      const step4: string = subject.connect(375, -1);
      logInfo(`step4 connect(375, -1): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 375');
      subject.input(' ', 'a', 'A');
      logInfo(`write>write>accept>connect>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`write>write>accept>connect>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`write>write>accept>connect>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`write>write>accept>connect>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 375');
      logInfo(`${BUNDLE}SppPageStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0032
     * @tc.name      SerialCommunication_SppPageStateFlow_0032
     * @tc.desc      SppPageState call flow listen > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0032 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(401, 25);
      logInfo(`step1 listen(401, 25): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 401');
      const step2: string = subject.listen(75, 55);
      logInfo(`step2 listen(75, 55): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 75');
      logInfo(`listen>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 75');
      logInfo(`${BUNDLE}SppPageStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0033
     * @tc.name      SerialCommunication_SppPageStateFlow_0033
     * @tc.desc      SppPageState call flow connect > listen > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0033 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(225, 20);
      logInfo(`step1 connect(225, 20): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 225');
      const step2: string = subject.listen(0, 2);
      logInfo(`step2 listen(0, 2): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 2');
      subject.input('', 'a_1', 'abc');
      subject.input(' a ', 'xa', '');
      logInfo(`connect>listen>input>input final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(2);
      logInfo(`connect>listen>input>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' a ');
      logInfo(`connect>listen>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`connect>listen>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 2');
      logInfo(`${BUNDLE}SppPageStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0034
     * @tc.name      SerialCommunication_SppPageStateFlow_0034
     * @tc.desc      SppPageState call flow write > listen > listen > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0034 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listen(250, 60);
      logInfo(`step2 listen(250, 60): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 250');
      const step3: string = subject.listen(125, 80);
      logInfo(`step3 listen(125, 80): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 125');
      subject.input('a', '123', 'A');
      logInfo(`write>listen>listen>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`write>listen>listen>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('123');
      logInfo(`write>listen>listen>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`write>listen>listen>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 125');
      logInfo(`${BUNDLE}SppPageStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0035
     * @tc.name      SerialCommunication_SppPageStateFlow_0035
     * @tc.desc      SppPageState call flow close > listen > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0035 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.listen(475, 0);
      logInfo(`step2 listen(475, 0): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 475');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      logInfo(`close>listen>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0036
     * @tc.name      SerialCommunication_SppPageStateFlow_0036
     * @tc.desc      SppPageState call flow input > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0036 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('a_1', 'a', ' ');
      const step2: string = subject.listen(0, 0);
      logInfo(`step2 listen(0, 0): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 0');
      logInfo(`input>listen final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`input>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`input>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual(' ');
      logInfo(`input>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 0');
      logInfo(`${BUNDLE}SppPageStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0037
     * @tc.name      SerialCommunication_SppPageStateFlow_0037
     * @tc.desc      SppPageState call flow listen > listen > input > close > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0037 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(275, 90);
      logInfo(`step1 listen(275, 90): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 275');
      const step2: string = subject.listen(0, 55);
      logInfo(`step2 listen(0, 55): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 55');
      subject.input('a', '', '');
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      const step5: number = subject.write();
      logInfo(`step5 write(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`listen>listen>input>close>write final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(55);
      logInfo(`listen>listen>input>close>write final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`listen>listen>input>close>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`listen>listen>input>close>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0038
     * @tc.name      SerialCommunication_SppPageStateFlow_0038
     * @tc.desc      SppPageState call flow write > input > close > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0038 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.input('', 'a_1', 'abc');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      const step4: string = subject.listen(350, 44.34);
      logInfo(`step4 listen(350, 44.34): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is 350');
      logInfo(`write>input>close>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a_1');
      logInfo(`write>input>close>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('abc');
      logInfo(`write>input>close>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 350');
      logInfo(`${BUNDLE}SppPageStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0039
     * @tc.name      SerialCommunication_SppPageStateFlow_0039
     * @tc.desc      SppPageState call flow connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0039 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(459.14, 100);
      logInfo(`step1 connect(459.14, 100): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 459.14');
      const step2: string = subject.accept(275, 0);
      logInfo(`step2 accept(275, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 275');
      logInfo(`connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 275');
      logInfo(`${BUNDLE}SppPageStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0040
     * @tc.name      SerialCommunication_SppPageStateFlow_0040
     * @tc.desc      SppPageState call flow close > connect > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0040 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.connect(150, 85);
      logInfo(`step2 connect(150, 85): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 150');
      subject.input('Hello World', 'abc', 'Hello');
      subject.input(' ', 'xa', '\u4e2d\u6587');
      logInfo(`close>connect>input>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`close>connect>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`close>connect>input>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`close>connect>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 150');
      logInfo(`${BUNDLE}SppPageStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0041
     * @tc.name      SerialCommunication_SppPageStateFlow_0041
     * @tc.desc      SppPageState call flow connect > write > input > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0041 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(459.14, 0);
      logInfo(`step1 connect(459.14, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 459.14');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.input('xa', 'Hello World', ' ');
      const step4: string = subject.listen(0, 10);
      logInfo(`step4 listen(0, 10): step4=${step4}`);
      expect(step4).assertEqual('sppListen success, serverNumber = 10');
      logInfo(`connect>write>input>listen final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(10);
      logInfo(`connect>write>input>listen final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`connect>write>input>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('Hello World');
      logInfo(`connect>write>input>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual(' ');
      logInfo(`connect>write>input>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 10');
      logInfo(`${BUNDLE}SppPageStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0042
     * @tc.name      SerialCommunication_SppPageStateFlow_0042
     * @tc.desc      SppPageState call flow close > input > close > listen > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0042 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      subject.input('xa', ' a ', 'abc');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      const step4: string = subject.listen(75, 0);
      logInfo(`step4 listen(75, 0): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is 75');
      subject.input('abc', 'a', '\u4e2d\u6587');
      logInfo(`close>input>close>listen>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`close>input>close>listen>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`close>input>close>listen>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`close>input>close>listen>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 75');
      logInfo(`${BUNDLE}SppPageStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0043
     * @tc.name      SerialCommunication_SppPageStateFlow_0043
     * @tc.desc      SppPageState call flow connect > input > listen > write > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0043 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(50, 70);
      logInfo(`step1 connect(50, 70): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 50');
      subject.input('aa', 'xa', '');
      const step3: string = subject.listen(1, 0);
      logInfo(`step3 listen(1, 0): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 1');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.close(true);
      logInfo(`step5 close(true): step5=${step5}`);
      expect(step5).assertEqual('sppCloseServerSocket success');
      logInfo(`connect>input>listen>write>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`connect>input>listen>write>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`connect>input>listen>write>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0044
     * @tc.name      SerialCommunication_SppPageStateFlow_0044
     * @tc.desc      SppPageState call flow write > input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0044 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.input('aa', '', 'A');
      const step3: string = subject.accept(401, 85);
      logInfo(`step3 accept(401, 85): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 401');
      logInfo(`write>input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`write>input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`write>input>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`write>input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0045
     * @tc.name      SerialCommunication_SppPageStateFlow_0045
     * @tc.desc      SppPageState call flow connect > input > write > accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0045 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(125, 60);
      logInfo(`step1 connect(125, 60): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 125');
      subject.input(' ', 'Hello World', 'Sample Title 123');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(16);
      const step4: string = subject.accept(0, 45);
      logInfo(`step4 accept(0, 45): step4=${step4}`);
      expect(step4).assertEqual('accept the client success');
      const step5: string = subject.close(false);
      logInfo(`step5 close(false): step5=${step5}`);
      expect(step5).assertEqual('sppCloseClientSocket success');
      logInfo(`connect>input>write>accept>close final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(45);
      logInfo(`connect>input>write>accept>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`connect>input>write>accept>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('Hello World');
      logInfo(`connect>input>write>accept>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Sample Title 123');
      logInfo(`connect>input>write>accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`connect>input>write>accept>close final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(16);
      logInfo(`${BUNDLE}SppPageStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0046
     * @tc.name      SerialCommunication_SppPageStateFlow_0046
     * @tc.desc      SppPageState call flow connect > accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0046 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(350, 0);
      logInfo(`step1 connect(350, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 350');
      const step2: string = subject.accept(-1, 60);
      logInfo(`step2 accept(-1, 60): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is -1');
      const step3: string = subject.accept(150, 15);
      logInfo(`step3 accept(150, 15): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 150');
      logInfo(`connect>accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 150');
      logInfo(`${BUNDLE}SppPageStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0047
     * @tc.name      SerialCommunication_SppPageStateFlow_0047
     * @tc.desc      SppPageState call flow accept > accept > listen > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0047 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(450, 0);
      logInfo(`step1 accept(450, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 450');
      const step2: string = subject.accept(325, 75);
      logInfo(`step2 accept(325, 75): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 325');
      const step3: string = subject.listen(175, -1);
      logInfo(`step3 listen(175, -1): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 175');
      subject.input('xa', '', 'Hello World');
      logInfo(`accept>accept>listen>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`accept>accept>listen>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`accept>accept>listen>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello World');
      logInfo(`accept>accept>listen>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 175');
      logInfo(`${BUNDLE}SppPageStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0048
     * @tc.name      SerialCommunication_SppPageStateFlow_0048
     * @tc.desc      SppPageState call flow listen > listen > accept > close > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0048 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(0, 3);
      logInfo(`step1 listen(0, 3): step1=${step1}`);
      expect(step1).assertEqual('sppListen success, serverNumber = 3');
      const step2: string = subject.listen(275, 0);
      logInfo(`step2 listen(275, 0): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 275');
      const step3: string = subject.accept(325, 1);
      logInfo(`step3 accept(325, 1): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 325');
      const step4: string = subject.close(true);
      logInfo(`step4 close(true): step4=${step4}`);
      expect(step4).assertEqual('sppCloseServerSocket success');
      const step5: number = subject.write();
      logInfo(`step5 write(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`listen>listen>accept>close>write final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(3);
      logInfo(`listen>listen>accept>close>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0049
     * @tc.name      SerialCommunication_SppPageStateFlow_0049
     * @tc.desc      SppPageState call flow input > close > close > listen > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0049 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('', '', 'hello world');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      const step4: string = subject.listen(425, 2);
      logInfo(`step4 listen(425, 2): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is 425');
      subject.input('', '', 'A');
      logInfo(`input>close>close>listen>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`input>close>close>listen>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`input>close>close>listen>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 425');
      logInfo(`${BUNDLE}SppPageStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0050
     * @tc.name      SerialCommunication_SppPageStateFlow_0050
     * @tc.desc      SppPageState call flow accept > connect > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0050 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(475, 0);
      logInfo(`step1 accept(475, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 475');
      const step2: string = subject.connect(325, 0);
      logInfo(`step2 connect(325, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 325');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      logInfo(`accept>connect>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0051
     * @tc.name      SerialCommunication_SppPageStateFlow_0051
     * @tc.desc      SppPageState call flow close > listen > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0051 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.listen(475, 30);
      logInfo(`step2 listen(475, 30): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 475');
      subject.input('', '123', 'Hello World');
      logInfo(`close>listen>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('123');
      logInfo(`close>listen>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello World');
      logInfo(`close>listen>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 475');
      logInfo(`${BUNDLE}SppPageStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0052
     * @tc.name      SerialCommunication_SppPageStateFlow_0052
     * @tc.desc      SppPageState call flow write > listen > write > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0052 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listen(3, 35);
      logInfo(`step2 listen(3, 35): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 3');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`write>listen>write>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0053
     * @tc.name      SerialCommunication_SppPageStateFlow_0053
     * @tc.desc      SppPageState call flow listen > accept > connect > write > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0053 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(10, 2);
      logInfo(`step1 listen(10, 2): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 10');
      const step2: string = subject.accept(375, 0);
      logInfo(`step2 accept(375, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 375');
      const step3: string = subject.connect(425, 55);
      logInfo(`step3 connect(425, 55): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 425');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.listen(225, 115);
      logInfo(`step5 listen(225, 115): step5=${step5}`);
      expect(step5).assertEqual('sppListen error, code is 225');
      logInfo(`listen>accept>connect>write>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 225');
      logInfo(`${BUNDLE}SppPageStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0054
     * @tc.name      SerialCommunication_SppPageStateFlow_0054
     * @tc.desc      SppPageState call flow connect > connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0054 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(404, 5);
      logInfo(`step1 connect(404, 5): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 404');
      const step2: string = subject.connect(400, 0);
      logInfo(`step2 connect(400, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 400');
      const step3: string = subject.accept(2, 70);
      logInfo(`step3 accept(2, 70): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 2');
      logInfo(`connect>connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 2');
      logInfo(`${BUNDLE}SppPageStateFlow_0054 end`);
    });
  });
}
