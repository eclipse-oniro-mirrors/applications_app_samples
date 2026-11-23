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

/** Logic checks for SppPageState flow (15 cases). */
export default function sppPageStateFlow5Test(): void {
  describe('SppPageStateFlow5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0218
     * @tc.name      SerialCommunication_SppPageStateFlow_0218
     * @tc.desc      SppPageState call flow input > input > write > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0218 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input(' a ', '', 'Hello');
      subject.input('xa', 'Hello World', 'A');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.input('Hello World', 'a', 'a');
      subject.input('', 'a_1', 'Hello');
      logInfo(`input>input>write>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a_1');
      logInfo(`input>input>write>input>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>input>write>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`input>input>write>input>input final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(1);
      logInfo(`${BUNDLE}SppPageStateFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0219
     * @tc.name      SerialCommunication_SppPageStateFlow_0219
     * @tc.desc      SppPageState call flow close > input > accept > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0219 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      subject.input('xa', 'abc', '\u4e2d\u6587');
      const step3: string = subject.accept(150, 110);
      logInfo(`step3 accept(150, 110): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 150');
      const step4: string = subject.listen(401, 0);
      logInfo(`step4 listen(401, 0): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is 401');
      logInfo(`close>input>accept>listen final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`close>input>accept>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`close>input>accept>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`close>input>accept>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0220
     * @tc.name      SerialCommunication_SppPageStateFlow_0220
     * @tc.desc      SppPageState call flow listen > accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0220 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(-25, 0);
      logInfo(`step1 listen(-25, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is -25');
      const step2: string = subject.accept(2, 0);
      logInfo(`step2 accept(2, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 2');
      const step3: string = subject.accept(0, 20);
      logInfo(`step3 accept(0, 20): step3=${step3}`);
      expect(step3).assertEqual('accept the client success');
      logInfo(`listen>accept>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(20);
      logInfo(`listen>accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0221
     * @tc.name      SerialCommunication_SppPageStateFlow_0221
     * @tc.desc      SppPageState call flow input > write > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0221 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input(' ', 'a', '\u4e2d\u6587');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.connect(50, 5);
      logInfo(`step3 connect(50, 5): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 50');
      logInfo(`input>write>connect final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`input>write>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`input>write>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`input>write>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 50');
      logInfo(`input>write>connect final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(2);
      logInfo(`${BUNDLE}SppPageStateFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0222
     * @tc.name      SerialCommunication_SppPageStateFlow_0222
     * @tc.desc      SppPageState call flow listen > close > listen > connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0222 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(200, 40);
      logInfo(`step1 listen(200, 40): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 200');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      const step3: string = subject.listen(75, 0);
      logInfo(`step3 listen(75, 0): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 75');
      const step4: string = subject.connect(1, 30);
      logInfo(`step4 connect(1, 30): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 1');
      const step5: string = subject.accept(404, 60);
      logInfo(`step5 accept(404, 60): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 404');
      logInfo(`listen>close>listen>connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0223
     * @tc.name      SerialCommunication_SppPageStateFlow_0223
     * @tc.desc      SppPageState call flow accept > connect > write > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0223 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(450, 0);
      logInfo(`step1 accept(450, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 450');
      const step2: string = subject.connect(50, 0);
      logInfo(`step2 connect(50, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 50');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.connect(500, 0);
      logInfo(`step4 connect(500, 0): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 500');
      logInfo(`accept>connect>write>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0224
     * @tc.name      SerialCommunication_SppPageStateFlow_0224
     * @tc.desc      SppPageState call flow listen > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0224 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(75, 105);
      logInfo(`step1 listen(75, 105): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 75');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`listen>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0225
     * @tc.name      SerialCommunication_SppPageStateFlow_0225
     * @tc.desc      SppPageState call flow connect > input > listen > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0225 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(225, 0);
      logInfo(`step1 connect(225, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 225');
      subject.input('', 'abc', 'Sample Title 123');
      const step3: string = subject.listen(2, 0);
      logInfo(`step3 listen(2, 0): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 2');
      const step4: string = subject.connect(125, -1);
      logInfo(`step4 connect(125, -1): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 125');
      logInfo(`connect>input>listen>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`connect>input>listen>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Sample Title 123');
      logInfo(`connect>input>listen>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 125');
      logInfo(`${BUNDLE}SppPageStateFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0226
     * @tc.name      SerialCommunication_SppPageStateFlow_0226
     * @tc.desc      SppPageState call flow input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0226 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('aa', 'xa', '');
      const step2: string = subject.accept(325, 3);
      logInfo(`step2 accept(325, 3): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 325');
      logInfo(`input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 325');
      logInfo(`${BUNDLE}SppPageStateFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0227
     * @tc.name      SerialCommunication_SppPageStateFlow_0227
     * @tc.desc      SppPageState call flow close > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0227 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      subject.input(' a ', ' a ', 'A');
      logInfo(`close>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' a ');
      logInfo(`close>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`close>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`close>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0228
     * @tc.name      SerialCommunication_SppPageStateFlow_0228
     * @tc.desc      SppPageState call flow input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0228 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input(' a ', 'xa', '');
      const step2: string = subject.accept(500, 0);
      logInfo(`step2 accept(500, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 500');
      logInfo(`input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' a ');
      logInfo(`input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0229
     * @tc.name      SerialCommunication_SppPageStateFlow_0229
     * @tc.desc      SppPageState call flow connect > connect > write > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0229 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(10, 0);
      logInfo(`step1 connect(10, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 10');
      const step2: string = subject.connect(125, 5);
      logInfo(`step2 connect(125, 5): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 125');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.input('', 'aa', '');
      logInfo(`connect>connect>write>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('aa');
      logInfo(`connect>connect>write>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0230
     * @tc.name      SerialCommunication_SppPageStateFlow_0230
     * @tc.desc      SppPageState call flow listen > listen > write > close > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0230 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(50, 55);
      logInfo(`step1 listen(50, 55): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 50');
      const step2: string = subject.listen(0, 55);
      logInfo(`step2 listen(0, 55): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 55');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      const step5: number = subject.write();
      logInfo(`step5 write(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`listen>listen>write>close>write final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(55);
      logInfo(`listen>listen>write>close>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0231
     * @tc.name      SerialCommunication_SppPageStateFlow_0231
     * @tc.desc      SppPageState call flow accept > accept > accept > write > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0231 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(2, -1);
      logInfo(`step1 accept(2, -1): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 2');
      const step2: string = subject.accept(325, 3);
      logInfo(`step2 accept(325, 3): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 325');
      const step3: string = subject.accept(275, 90);
      logInfo(`step3 accept(275, 90): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 275');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.close(true);
      logInfo(`step5 close(true): step5=${step5}`);
      expect(step5).assertEqual('sppCloseServerSocket success');
      logInfo(`accept>accept>accept>write>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0232
     * @tc.name      SerialCommunication_SppPageStateFlow_0232
     * @tc.desc      SppPageState call flow write > input > accept > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0232 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.input('a_1', '123', 'hello world');
      const step3: string = subject.accept(325, 60);
      logInfo(`step3 accept(325, 60): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 325');
      subject.input('a', 'Hello World', '');
      subject.input('Hello World', 'aa', 'a');
      logInfo(`write>input>accept>input>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('Hello World');
      logInfo(`write>input>accept>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('aa');
      logInfo(`write>input>accept>input>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('a');
      logInfo(`write>input>accept>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 325');
      logInfo(`${BUNDLE}SppPageStateFlow_0232 end`);
    });
  });
}
