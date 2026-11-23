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
export default function sppPageStateFlow3Test(): void {
  describe('SppPageStateFlow3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0109
     * @tc.name      SerialCommunication_SppPageStateFlow_0109
     * @tc.desc      SppPageState call flow write > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0109 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.connect(100, 0);
      logInfo(`step2 connect(100, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 100');
      logInfo(`write>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 100');
      logInfo(`${BUNDLE}SppPageStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0110
     * @tc.name      SerialCommunication_SppPageStateFlow_0110
     * @tc.desc      SppPageState call flow input > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0110 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('123', '123', '\u4e2d\u6587');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`input>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('123');
      logInfo(`input>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('123');
      logInfo(`input>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`input>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0111
     * @tc.name      SerialCommunication_SppPageStateFlow_0111
     * @tc.desc      SppPageState call flow accept > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0111 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(300, 0);
      logInfo(`step1 accept(300, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 300');
      const step2: string = subject.connect(275, 0);
      logInfo(`step2 connect(275, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 275');
      logInfo(`accept>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 275');
      logInfo(`${BUNDLE}SppPageStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0112
     * @tc.name      SerialCommunication_SppPageStateFlow_0112
     * @tc.desc      SppPageState call flow listen > write > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0112 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(0, -1);
      logInfo(`step1 listen(0, -1): step1=${step1}`);
      expect(step1).assertEqual('sppListen success, serverNumber = -1');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.accept(0, 5);
      logInfo(`step3 accept(0, 5): step3=${step3}`);
      expect(step3).assertEqual('accept the client success');
      logInfo(`listen>write>accept final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(-1);
      logInfo(`listen>write>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(5);
      logInfo(`listen>write>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0113
     * @tc.name      SerialCommunication_SppPageStateFlow_0113
     * @tc.desc      SppPageState call flow accept > write > close > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0113 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(50, 25);
      logInfo(`step1 accept(50, 25): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 50');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      const step4: string = subject.listen(100, -14);
      logInfo(`step4 listen(100, -14): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is 100');
      logInfo(`accept>write>close>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 100');
      logInfo(`${BUNDLE}SppPageStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0114
     * @tc.name      SerialCommunication_SppPageStateFlow_0114
     * @tc.desc      SppPageState call flow accept > accept > write > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0114 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(175, 0);
      logInfo(`step1 accept(175, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 175');
      const step2: string = subject.accept(400, 105);
      logInfo(`step2 accept(400, 105): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 400');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`accept>accept>write>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0115
     * @tc.name      SerialCommunication_SppPageStateFlow_0115
     * @tc.desc      SppPageState call flow listen > listen > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0115 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(200, 0);
      logInfo(`step1 listen(200, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 200');
      const step2: string = subject.listen(300, 0);
      logInfo(`step2 listen(300, 0): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 300');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`listen>listen>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0116
     * @tc.name      SerialCommunication_SppPageStateFlow_0116
     * @tc.desc      SppPageState call flow connect > accept > close > close > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0116 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(1, 3);
      logInfo(`step1 connect(1, 3): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 1');
      const step2: string = subject.accept(0, 70);
      logInfo(`step2 accept(0, 70): step2=${step2}`);
      expect(step2).assertEqual('accept the client success');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      const step4: string = subject.close(true);
      logInfo(`step4 close(true): step4=${step4}`);
      expect(step4).assertEqual('sppCloseServerSocket success');
      const step5: string = subject.accept(100, 60);
      logInfo(`step5 accept(100, 60): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 100');
      logInfo(`connect>accept>close>close>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(70);
      logInfo(`connect>accept>close>close>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 100');
      logInfo(`${BUNDLE}SppPageStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0117
     * @tc.name      SerialCommunication_SppPageStateFlow_0117
     * @tc.desc      SppPageState call flow input > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0117 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('Hello World', ' a ', 'Hello');
      const step2: string = subject.connect(400, 115);
      logInfo(`step2 connect(400, 115): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 400');
      logInfo(`input>connect final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('Hello World');
      logInfo(`input>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`input>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 400');
      logInfo(`${BUNDLE}SppPageStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0118
     * @tc.name      SerialCommunication_SppPageStateFlow_0118
     * @tc.desc      SppPageState call flow write > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0118 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listen(0, 40);
      logInfo(`step2 listen(0, 40): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 40');
      logInfo(`write>listen final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(40);
      logInfo(`write>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 40');
      logInfo(`${BUNDLE}SppPageStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0119
     * @tc.name      SerialCommunication_SppPageStateFlow_0119
     * @tc.desc      SppPageState call flow close > accept > accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0119 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.accept(125, 0);
      logInfo(`step2 accept(125, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 125');
      const step3: string = subject.accept(0, 5);
      logInfo(`step3 accept(0, 5): step3=${step3}`);
      expect(step3).assertEqual('accept the client success');
      const step4: string = subject.accept(0, 40);
      logInfo(`step4 accept(0, 40): step4=${step4}`);
      expect(step4).assertEqual('accept the client success');
      logInfo(`close>accept>accept>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(40);
      logInfo(`close>accept>accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0120
     * @tc.name      SerialCommunication_SppPageStateFlow_0120
     * @tc.desc      SppPageState call flow listen > write > accept > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0120 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(10, 1);
      logInfo(`step1 listen(10, 1): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 10');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.accept(0, 90);
      logInfo(`step3 accept(0, 90): step3=${step3}`);
      expect(step3).assertEqual('accept the client success');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`listen>write>accept>write final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(90);
      logInfo(`listen>write>accept>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0121
     * @tc.name      SerialCommunication_SppPageStateFlow_0121
     * @tc.desc      SppPageState call flow listen > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0121 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(0, 60);
      logInfo(`step1 listen(0, 60): step1=${step1}`);
      expect(step1).assertEqual('sppListen success, serverNumber = 60');
      const step2: string = subject.connect(3, 0);
      logInfo(`step2 connect(3, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 3');
      logInfo(`listen>connect final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(60);
      logInfo(`listen>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 3');
      logInfo(`${BUNDLE}SppPageStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0122
     * @tc.name      SerialCommunication_SppPageStateFlow_0122
     * @tc.desc      SppPageState call flow write > listen > write > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0122 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listen(175, 90);
      logInfo(`step2 listen(175, 90): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 175');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.accept(0, 45);
      logInfo(`step4 accept(0, 45): step4=${step4}`);
      expect(step4).assertEqual('accept the client success');
      logInfo(`write>listen>write>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(45);
      logInfo(`write>listen>write>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0123
     * @tc.name      SerialCommunication_SppPageStateFlow_0123
     * @tc.desc      SppPageState call flow write > write > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0123 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.connect(375, 2);
      logInfo(`step3 connect(375, 2): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 375');
      logInfo(`write>write>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 375');
      logInfo(`${BUNDLE}SppPageStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0124
     * @tc.name      SerialCommunication_SppPageStateFlow_0124
     * @tc.desc      SppPageState call flow input > close > close > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0124 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('', 'Hello World', 'Hello');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      const step4: string = subject.listen(0, 100);
      logInfo(`step4 listen(0, 100): step4=${step4}`);
      expect(step4).assertEqual('sppListen success, serverNumber = 100');
      logInfo(`input>close>close>listen final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(100);
      logInfo(`input>close>close>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('Hello World');
      logInfo(`input>close>close>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>close>close>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 100');
      logInfo(`${BUNDLE}SppPageStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0125
     * @tc.name      SerialCommunication_SppPageStateFlow_0125
     * @tc.desc      SppPageState call flow accept > listen > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0125 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(10, 0);
      logInfo(`step1 accept(10, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 10');
      const step2: string = subject.listen(0, 55);
      logInfo(`step2 listen(0, 55): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 55');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      logInfo(`accept>listen>close final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(55);
      logInfo(`accept>listen>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0126
     * @tc.name      SerialCommunication_SppPageStateFlow_0126
     * @tc.desc      SppPageState call flow input > accept > write > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0126 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('a', 'Hello World', '');
      const step2: string = subject.accept(75, 0);
      logInfo(`step2 accept(75, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 75');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.accept(75, 60);
      logInfo(`step4 accept(75, 60): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 75');
      logInfo(`input>accept>write>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`input>accept>write>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('Hello World');
      logInfo(`input>accept>write>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 75');
      logInfo(`${BUNDLE}SppPageStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0127
     * @tc.name      SerialCommunication_SppPageStateFlow_0127
     * @tc.desc      SppPageState call flow connect > connect > close > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0127 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(475, 0);
      logInfo(`step1 connect(475, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 475');
      const step2: string = subject.connect(242, 50);
      logInfo(`step2 connect(242, 50): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 242');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`connect>connect>close>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0128
     * @tc.name      SerialCommunication_SppPageStateFlow_0128
     * @tc.desc      SppPageState call flow input > connect > write > close > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0128 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('', 'a_1', 'Hello');
      const step2: string = subject.connect(0, -1);
      logInfo(`step2 connect(0, -1): step2=${step2}`);
      expect(step2).assertEqual('sppConnect success, socketId = -1');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.close(true);
      logInfo(`step4 close(true): step4=${step4}`);
      expect(step4).assertEqual('sppCloseServerSocket success');
      const step5: string = subject.close(false);
      logInfo(`step5 close(false): step5=${step5}`);
      expect(step5).assertEqual('sppCloseClientSocket success');
      logInfo(`input>connect>write>close>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a_1');
      logInfo(`input>connect>write>close>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>connect>write>close>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`input>connect>write>close>close final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(5);
      logInfo(`${BUNDLE}SppPageStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0129
     * @tc.name      SerialCommunication_SppPageStateFlow_0129
     * @tc.desc      SppPageState call flow accept > connect > input > accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0129 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(2, 15);
      logInfo(`step1 accept(2, 15): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 2');
      const step2: string = subject.connect(125, 60);
      logInfo(`step2 connect(125, 60): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 125');
      subject.input('a_1', '', 'Hello');
      const step4: string = subject.accept(0, 75);
      logInfo(`step4 accept(0, 75): step4=${step4}`);
      expect(step4).assertEqual('accept the client success');
      const step5: string = subject.accept(0, 25);
      logInfo(`step5 accept(0, 25): step5=${step5}`);
      expect(step5).assertEqual('accept the client success');
      logInfo(`accept>connect>input>accept>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(25);
      logInfo(`accept>connect>input>accept>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`accept>connect>input>accept>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`accept>connect>input>accept>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`accept>connect>input>accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0130
     * @tc.name      SerialCommunication_SppPageStateFlow_0130
     * @tc.desc      SppPageState call flow close > connect > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0130 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.connect(459.14, 100);
      logInfo(`step2 connect(459.14, 100): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 459.14');
      const step3: string = subject.connect(2, 85);
      logInfo(`step3 connect(2, 85): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 2');
      logInfo(`close>connect>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 2');
      logInfo(`${BUNDLE}SppPageStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0131
     * @tc.name      SerialCommunication_SppPageStateFlow_0131
     * @tc.desc      SppPageState call flow close > write > accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0131 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.accept(1, 45);
      logInfo(`step3 accept(1, 45): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 1');
      const step4: string = subject.close(true);
      logInfo(`step4 close(true): step4=${step4}`);
      expect(step4).assertEqual('sppCloseServerSocket success');
      logInfo(`close>write>accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0132
     * @tc.name      SerialCommunication_SppPageStateFlow_0132
     * @tc.desc      SppPageState call flow write > write > write > accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0132 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.accept(212, 1);
      logInfo(`step4 accept(212, 1): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 212');
      const step5: string = subject.close(false);
      logInfo(`step5 close(false): step5=${step5}`);
      expect(step5).assertEqual('sppCloseClientSocket success');
      logInfo(`write>write>write>accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0133
     * @tc.name      SerialCommunication_SppPageStateFlow_0133
     * @tc.desc      SppPageState call flow input > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0133 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('xa', 'Hello World', ' ');
      subject.input('123', ' ', 'hello world');
      subject.input(' ', ' a ', 'hello world');
      logInfo(`input>input>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`input>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`input>input>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`${BUNDLE}SppPageStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0134
     * @tc.name      SerialCommunication_SppPageStateFlow_0134
     * @tc.desc      SppPageState call flow connect > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0134 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(100, 75);
      logInfo(`step1 connect(100, 75): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 100');
      subject.input(' ', 'a', 'A');
      subject.input('', '', 'hello world');
      logInfo(`connect>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`connect>input>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`connect>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 100');
      logInfo(`${BUNDLE}SppPageStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0135
     * @tc.name      SerialCommunication_SppPageStateFlow_0135
     * @tc.desc      SppPageState call flow listen > close > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0135 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(75, 55);
      logInfo(`step1 listen(75, 55): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 75');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      const step3: string = subject.accept(0, 1);
      logInfo(`step3 accept(0, 1): step3=${step3}`);
      expect(step3).assertEqual('accept the client success');
      logInfo(`listen>close>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0136
     * @tc.name      SerialCommunication_SppPageStateFlow_0136
     * @tc.desc      SppPageState call flow listen > listen > listen > write > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0136 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(0, -14);
      logInfo(`step1 listen(0, -14): step1=${step1}`);
      expect(step1).assertEqual('sppListen success, serverNumber = -14');
      const step2: string = subject.listen(3, 100);
      logInfo(`step2 listen(3, 100): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 3');
      const step3: string = subject.listen(450, 0);
      logInfo(`step3 listen(450, 0): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 450');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.accept(325, 60);
      logInfo(`step5 accept(325, 60): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 325');
      logInfo(`listen>listen>listen>write>accept final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(-14);
      logInfo(`listen>listen>listen>write>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 325');
      logInfo(`${BUNDLE}SppPageStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0137
     * @tc.name      SerialCommunication_SppPageStateFlow_0137
     * @tc.desc      SppPageState call flow close > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0137 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.connect(475, 0);
      logInfo(`step2 connect(475, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 475');
      logInfo(`close>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 475');
      logInfo(`${BUNDLE}SppPageStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0138
     * @tc.name      SerialCommunication_SppPageStateFlow_0138
     * @tc.desc      SppPageState call flow close > connect > accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0138 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.connect(425, 0);
      logInfo(`step2 connect(425, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 425');
      const step3: string = subject.accept(0, 20);
      logInfo(`step3 accept(0, 20): step3=${step3}`);
      expect(step3).assertEqual('accept the client success');
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      logInfo(`close>connect>accept>close final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(20);
      logInfo(`close>connect>accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0139
     * @tc.name      SerialCommunication_SppPageStateFlow_0139
     * @tc.desc      SppPageState call flow close > listen > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0139 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.listen(125, 5);
      logInfo(`step2 listen(125, 5): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 125');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`close>listen>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0140
     * @tc.name      SerialCommunication_SppPageStateFlow_0140
     * @tc.desc      SppPageState call flow write > connect > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0140 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.connect(10, 0);
      logInfo(`step2 connect(10, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 10');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`write>connect>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0141
     * @tc.name      SerialCommunication_SppPageStateFlow_0141
     * @tc.desc      SppPageState call flow accept > listen > close > input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0141 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(50, 64.95);
      logInfo(`step1 accept(50, 64.95): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 50');
      const step2: string = subject.listen(325, 60);
      logInfo(`step2 listen(325, 60): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 325');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      subject.input('xa', '', 'Hello');
      const step5: string = subject.accept(10, 64.95);
      logInfo(`step5 accept(10, 64.95): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 10');
      logInfo(`accept>listen>close>input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`accept>listen>close>input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`accept>listen>close>input>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`accept>listen>close>input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 10');
      logInfo(`${BUNDLE}SppPageStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0142
     * @tc.name      SerialCommunication_SppPageStateFlow_0142
     * @tc.desc      SppPageState call flow close > listen > input > connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0142 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.listen(175, 90);
      logInfo(`step2 listen(175, 90): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 175');
      subject.input('', 'a_1', 'abc');
      const step4: string = subject.connect(2, 85);
      logInfo(`step4 connect(2, 85): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 2');
      const step5: string = subject.accept(0, 65);
      logInfo(`step5 accept(0, 65): step5=${step5}`);
      expect(step5).assertEqual('accept the client success');
      logInfo(`close>listen>input>connect>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(65);
      logInfo(`close>listen>input>connect>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a_1');
      logInfo(`close>listen>input>connect>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('abc');
      logInfo(`close>listen>input>connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0143
     * @tc.name      SerialCommunication_SppPageStateFlow_0143
     * @tc.desc      SppPageState call flow accept > input > connect > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0143 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(250, 0);
      logInfo(`step1 accept(250, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 250');
      subject.input('a_1', ' a ', 'a');
      const step3: string = subject.connect(325, 100);
      logInfo(`step3 connect(325, 100): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 325');
      const step4: string = subject.connect(75, 0);
      logInfo(`step4 connect(75, 0): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 75');
      logInfo(`accept>input>connect>connect final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`accept>input>connect>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`accept>input>connect>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('a');
      logInfo(`accept>input>connect>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 75');
      logInfo(`${BUNDLE}SppPageStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0144
     * @tc.name      SerialCommunication_SppPageStateFlow_0144
     * @tc.desc      SppPageState call flow write > input > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0144 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.input('', 'a', 'Hello');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      logInfo(`write>input>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`write>input>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`write>input>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0145
     * @tc.name      SerialCommunication_SppPageStateFlow_0145
     * @tc.desc      SppPageState call flow listen > listen > input > accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0145 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(125, 85);
      logInfo(`step1 listen(125, 85): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 125');
      const step2: string = subject.listen(425, 70);
      logInfo(`step2 listen(425, 70): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 425');
      subject.input(' ', 'a', '');
      const step4: string = subject.accept(50, 100);
      logInfo(`step4 accept(50, 100): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 50');
      const step5: string = subject.accept(75, 55);
      logInfo(`step5 accept(75, 55): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 75');
      logInfo(`listen>listen>input>accept>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`listen>listen>input>accept>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`listen>listen>input>accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 75');
      logInfo(`${BUNDLE}SppPageStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0146
     * @tc.name      SerialCommunication_SppPageStateFlow_0146
     * @tc.desc      SppPageState call flow write > accept > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0146 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.accept(212, 1);
      logInfo(`step2 accept(212, 1): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 212');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`write>accept>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0147
     * @tc.name      SerialCommunication_SppPageStateFlow_0147
     * @tc.desc      SppPageState call flow close > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0147 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.connect(475, 0);
      logInfo(`step2 connect(475, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 475');
      logInfo(`close>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 475');
      logInfo(`${BUNDLE}SppPageStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0148
     * @tc.name      SerialCommunication_SppPageStateFlow_0148
     * @tc.desc      SppPageState call flow connect > close > close > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0148 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(50, 55);
      logInfo(`step1 connect(50, 55): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 50');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      const step4: string = subject.connect(375, 0);
      logInfo(`step4 connect(375, 0): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 375');
      logInfo(`connect>close>close>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 375');
      logInfo(`${BUNDLE}SppPageStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0149
     * @tc.name      SerialCommunication_SppPageStateFlow_0149
     * @tc.desc      SppPageState call flow listen > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0149 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(0, 65);
      logInfo(`step1 listen(0, 65): step1=${step1}`);
      expect(step1).assertEqual('sppListen success, serverNumber = 65');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`listen>write final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(65);
      logInfo(`listen>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0150
     * @tc.name      SerialCommunication_SppPageStateFlow_0150
     * @tc.desc      SppPageState call flow accept > listen > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0150 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(404, 55);
      logInfo(`step1 accept(404, 55): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 404');
      const step2: string = subject.listen(400, 5);
      logInfo(`step2 listen(400, 5): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 400');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`accept>listen>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0151
     * @tc.name      SerialCommunication_SppPageStateFlow_0151
     * @tc.desc      SppPageState call flow listen > accept > listen > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0151 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(75, 0);
      logInfo(`step1 listen(75, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 75');
      const step2: string = subject.accept(275, 0);
      logInfo(`step2 accept(275, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 275');
      const step3: string = subject.listen(400, 10);
      logInfo(`step3 listen(400, 10): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 400');
      const step4: string = subject.listen(0, 35);
      logInfo(`step4 listen(0, 35): step4=${step4}`);
      expect(step4).assertEqual('sppListen success, serverNumber = 35');
      logInfo(`listen>accept>listen>listen final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(35);
      logInfo(`listen>accept>listen>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 35');
      logInfo(`${BUNDLE}SppPageStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0152
     * @tc.name      SerialCommunication_SppPageStateFlow_0152
     * @tc.desc      SppPageState call flow listen > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0152 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(125, 0);
      logInfo(`step1 listen(125, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 125');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`listen>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0153
     * @tc.name      SerialCommunication_SppPageStateFlow_0153
     * @tc.desc      SppPageState call flow input > close > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0153 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('', '123', 'Hello World');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      subject.input('Hello World', '123', 'Hello World');
      logInfo(`input>close>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('Hello World');
      logInfo(`input>close>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('123');
      logInfo(`input>close>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello World');
      logInfo(`input>close>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0154
     * @tc.name      SerialCommunication_SppPageStateFlow_0154
     * @tc.desc      SppPageState call flow accept > listen > accept > connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0154 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(150, 110);
      logInfo(`step1 accept(150, 110): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 150');
      const step2: string = subject.listen(0, 110);
      logInfo(`step2 listen(0, 110): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 110');
      const step3: string = subject.accept(401, 0);
      logInfo(`step3 accept(401, 0): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 401');
      const step4: string = subject.connect(404, 5);
      logInfo(`step4 connect(404, 5): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 404');
      const step5: string = subject.accept(10, 45);
      logInfo(`step5 accept(10, 45): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 10');
      logInfo(`accept>listen>accept>connect>accept final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(110);
      logInfo(`accept>listen>accept>connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 10');
      logInfo(`${BUNDLE}SppPageStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0155
     * @tc.name      SerialCommunication_SppPageStateFlow_0155
     * @tc.desc      SppPageState call flow input > close > accept > write > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0155 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('a', '', 'Hello');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      const step3: string = subject.accept(25, 0);
      logInfo(`step3 accept(25, 0): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 25');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: string = subject.connect(125, 90);
      logInfo(`step5 connect(125, 90): step5=${step5}`);
      expect(step5).assertEqual('sppConnect error, code = 125');
      logInfo(`input>close>accept>write>connect final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`input>close>accept>write>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`input>close>accept>write>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>close>accept>write>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 125');
      logInfo(`input>close>accept>write>connect final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(5);
      logInfo(`${BUNDLE}SppPageStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0156
     * @tc.name      SerialCommunication_SppPageStateFlow_0156
     * @tc.desc      SppPageState call flow listen > write > listen > connect > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0156 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(500, 55);
      logInfo(`step1 listen(500, 55): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 500');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listen(425, 15);
      logInfo(`step3 listen(425, 15): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 425');
      const step4: string = subject.connect(350, 100);
      logInfo(`step4 connect(350, 100): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 350');
      const step5: string = subject.connect(401, 3);
      logInfo(`step5 connect(401, 3): step5=${step5}`);
      expect(step5).assertEqual('sppConnect error, code = 401');
      logInfo(`listen>write>listen>connect>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0157
     * @tc.name      SerialCommunication_SppPageStateFlow_0157
     * @tc.desc      SppPageState call flow listen > write > write > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0157 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(350, 44.34);
      logInfo(`step1 listen(350, 44.34): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 350');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.input('xa', 'a', 'hello world');
      logInfo(`listen>write>write>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`listen>write>write>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`listen>write>write>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`listen>write>write>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0158
     * @tc.name      SerialCommunication_SppPageStateFlow_0158
     * @tc.desc      SppPageState call flow close > connect > accept > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0158 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.connect(3, 15);
      logInfo(`step2 connect(3, 15): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 3');
      const step3: string = subject.accept(150, 15);
      logInfo(`step3 accept(150, 15): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 150');
      const step4: string = subject.connect(500, 0);
      logInfo(`step4 connect(500, 0): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 500');
      logInfo(`close>connect>accept>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0159
     * @tc.name      SerialCommunication_SppPageStateFlow_0159
     * @tc.desc      SppPageState call flow close > accept > accept > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0159 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.accept(404, 0);
      logInfo(`step2 accept(404, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 404');
      const step3: string = subject.accept(3, 70);
      logInfo(`step3 accept(3, 70): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 3');
      subject.input('a_1', ' a ', 'hello world');
      logInfo(`close>accept>accept>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`close>accept>accept>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`close>accept>accept>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`close>accept>accept>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 3');
      logInfo(`${BUNDLE}SppPageStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0160
     * @tc.name      SerialCommunication_SppPageStateFlow_0160
     * @tc.desc      SppPageState call flow connect > write > accept > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0160 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(404, 65);
      logInfo(`step1 connect(404, 65): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 404');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.accept(100, 0);
      logInfo(`step3 accept(100, 0): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 100');
      const step4: string = subject.listen(375, 50);
      logInfo(`step4 listen(375, 50): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is 375');
      logInfo(`connect>write>accept>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 375');
      logInfo(`${BUNDLE}SppPageStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0161
     * @tc.name      SerialCommunication_SppPageStateFlow_0161
     * @tc.desc      SppPageState call flow listen > input > connect > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0161 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(325, 0);
      logInfo(`step1 listen(325, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 325');
      subject.input(' a ', '123', 'a');
      const step3: string = subject.connect(3, 60);
      logInfo(`step3 connect(3, 60): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 3');
      const step4: string = subject.close(true);
      logInfo(`step4 close(true): step4=${step4}`);
      expect(step4).assertEqual('sppCloseServerSocket success');
      logInfo(`listen>input>connect>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' a ');
      logInfo(`listen>input>connect>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('123');
      logInfo(`listen>input>connect>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('a');
      logInfo(`listen>input>connect>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0162
     * @tc.name      SerialCommunication_SppPageStateFlow_0162
     * @tc.desc      SppPageState call flow close > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0162 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      subject.input('aa', 'a_1', '\u4e2d\u6587');
      logInfo(`close>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`close>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a_1');
      logInfo(`close>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`close>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0162 end`);
    });
  });
}
