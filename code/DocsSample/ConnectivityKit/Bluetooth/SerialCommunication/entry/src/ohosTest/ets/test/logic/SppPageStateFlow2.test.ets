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
export default function sppPageStateFlow2Test(): void {
  describe('SppPageStateFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0055
     * @tc.name      SerialCommunication_SppPageStateFlow_0055
     * @tc.desc      SppPageState call flow listen > accept > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0055 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(350, 2);
      logInfo(`step1 listen(350, 2): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 350');
      const step2: string = subject.accept(1, 5);
      logInfo(`step2 accept(1, 5): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 1');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`listen>accept>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0056
     * @tc.name      SerialCommunication_SppPageStateFlow_0056
     * @tc.desc      SppPageState call flow accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0056 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(325, 60);
      logInfo(`step1 accept(325, 60): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 325');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0057
     * @tc.name      SerialCommunication_SppPageStateFlow_0057
     * @tc.desc      SppPageState call flow input > accept > connect > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0057 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('Hello World', 'a', 'Hello');
      const step2: string = subject.accept(0, 5);
      logInfo(`step2 accept(0, 5): step2=${step2}`);
      expect(step2).assertEqual('accept the client success');
      const step3: string = subject.connect(150, 0);
      logInfo(`step3 connect(150, 0): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 150');
      subject.input('a_1', ' a ', 'a');
      logInfo(`input>accept>connect>input final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(5);
      logInfo(`input>accept>connect>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`input>accept>connect>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`input>accept>connect>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('a');
      logInfo(`input>accept>connect>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 150');
      logInfo(`${BUNDLE}SppPageStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0058
     * @tc.name      SerialCommunication_SppPageStateFlow_0058
     * @tc.desc      SppPageState call flow connect > close > accept > input > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0058 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(300, 95);
      logInfo(`step1 connect(300, 95): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 300');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      const step3: string = subject.accept(175, 15);
      logInfo(`step3 accept(175, 15): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 175');
      subject.input(' a ', '123', 'a');
      const step5: string = subject.connect(225, 50);
      logInfo(`step5 connect(225, 50): step5=${step5}`);
      expect(step5).assertEqual('sppConnect error, code = 225');
      logInfo(`connect>close>accept>input>connect final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' a ');
      logInfo(`connect>close>accept>input>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('123');
      logInfo(`connect>close>accept>input>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('a');
      logInfo(`connect>close>accept>input>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 225');
      logInfo(`${BUNDLE}SppPageStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0059
     * @tc.name      SerialCommunication_SppPageStateFlow_0059
     * @tc.desc      SppPageState call flow input > listen > input > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0059 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('', 'aa', 'a');
      const step2: string = subject.listen(325, 60);
      logInfo(`step2 listen(325, 60): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 325');
      subject.input('a_1', '', '');
      const step4: string = subject.close(true);
      logInfo(`step4 close(true): step4=${step4}`);
      expect(step4).assertEqual('sppCloseServerSocket success');
      logInfo(`input>listen>input>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`input>listen>input>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`input>listen>input>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0060
     * @tc.name      SerialCommunication_SppPageStateFlow_0060
     * @tc.desc      SppPageState call flow connect > connect > connect > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0060 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(425, 3);
      logInfo(`step1 connect(425, 3): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 425');
      const step2: string = subject.connect(450, 70);
      logInfo(`step2 connect(450, 70): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 450');
      const step3: string = subject.connect(325, 0);
      logInfo(`step3 connect(325, 0): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 325');
      const step4: string = subject.connect(325, 15);
      logInfo(`step4 connect(325, 15): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 325');
      logInfo(`connect>connect>connect>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 325');
      logInfo(`${BUNDLE}SppPageStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0061
     * @tc.name      SerialCommunication_SppPageStateFlow_0061
     * @tc.desc      SppPageState call flow close > connect > connect > accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0061 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.connect(300, 105);
      logInfo(`step2 connect(300, 105): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 300');
      const step3: string = subject.connect(0, 65);
      logInfo(`step3 connect(0, 65): step3=${step3}`);
      expect(step3).assertEqual('sppConnect success, socketId = 65');
      const step4: string = subject.accept(325, 75);
      logInfo(`step4 accept(325, 75): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 325');
      const step5: string = subject.close(true);
      logInfo(`step5 close(true): step5=${step5}`);
      expect(step5).assertEqual('sppCloseServerSocket success');
      logInfo(`close>connect>connect>accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0062
     * @tc.name      SerialCommunication_SppPageStateFlow_0062
     * @tc.desc      SppPageState call flow accept > listen > listen > input > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0062 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(150, 0);
      logInfo(`step1 accept(150, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 150');
      const step2: string = subject.listen(3, 50);
      logInfo(`step2 listen(3, 50): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 3');
      const step3: string = subject.listen(2, 110);
      logInfo(`step3 listen(2, 110): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 2');
      subject.input('aa', 'xa', 'hello world');
      const step5: string = subject.close(false);
      logInfo(`step5 close(false): step5=${step5}`);
      expect(step5).assertEqual('sppCloseClientSocket success');
      logInfo(`accept>listen>listen>input>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`accept>listen>listen>input>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`accept>listen>listen>input>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`accept>listen>listen>input>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0063
     * @tc.name      SerialCommunication_SppPageStateFlow_0063
     * @tc.desc      SppPageState call flow input > write > listen > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0063 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('abc', 'Hello World', 'hello world');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(11);
      const step3: string = subject.listen(75, 95);
      logInfo(`step3 listen(75, 95): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 75');
      const step4: string = subject.listen(0, 75);
      logInfo(`step4 listen(0, 75): step4=${step4}`);
      expect(step4).assertEqual('sppListen success, serverNumber = 75');
      logInfo(`input>write>listen>listen final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(75);
      logInfo(`input>write>listen>listen final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`input>write>listen>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('Hello World');
      logInfo(`input>write>listen>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`input>write>listen>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 75');
      logInfo(`input>write>listen>listen final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(11);
      logInfo(`${BUNDLE}SppPageStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0064
     * @tc.name      SerialCommunication_SppPageStateFlow_0064
     * @tc.desc      SppPageState call flow input > write > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0064 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input(' a ', 'xa', '');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.input('Hello World', '', 'Hello');
      logInfo(`input>write>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('Hello World');
      logInfo(`input>write>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`input>write>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>write>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0065
     * @tc.name      SerialCommunication_SppPageStateFlow_0065
     * @tc.desc      SppPageState call flow listen > listen > close > accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0065 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(404, 0);
      logInfo(`step1 listen(404, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 404');
      const step2: string = subject.listen(-1, 25);
      logInfo(`step2 listen(-1, 25): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is -1');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      const step4: string = subject.accept(175, 25);
      logInfo(`step4 accept(175, 25): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 175');
      const step5: string = subject.close(true);
      logInfo(`step5 close(true): step5=${step5}`);
      expect(step5).assertEqual('sppCloseServerSocket success');
      logInfo(`listen>listen>close>accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0066
     * @tc.name      SerialCommunication_SppPageStateFlow_0066
     * @tc.desc      SppPageState call flow write > input > write > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0066 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.input('abc', 'xa', 'a');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.input('xa', 'a', 'hello world');
      logInfo(`write>input>write>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`write>input>write>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`write>input>write>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`write>input>write>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`write>input>write>input final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(1);
      logInfo(`${BUNDLE}SppPageStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0067
     * @tc.name      SerialCommunication_SppPageStateFlow_0067
     * @tc.desc      SppPageState call flow close > connect > listen > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0067 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.connect(-1, 60);
      logInfo(`step2 connect(-1, 60): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = -1');
      const step3: string = subject.listen(3, 0);
      logInfo(`step3 listen(3, 0): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 3');
      subject.input(' ', 'a', '\u4e2d\u6587');
      logInfo(`close>connect>listen>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`close>connect>listen>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`close>connect>listen>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`close>connect>listen>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 3');
      logInfo(`${BUNDLE}SppPageStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0068
     * @tc.name      SerialCommunication_SppPageStateFlow_0068
     * @tc.desc      SppPageState call flow write > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0068 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.connect(242, 0);
      logInfo(`step2 connect(242, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 242');
      logInfo(`write>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 242');
      logInfo(`${BUNDLE}SppPageStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0069
     * @tc.name      SerialCommunication_SppPageStateFlow_0069
     * @tc.desc      SppPageState call flow write > accept > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0069 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.accept(10, 85);
      logInfo(`step2 accept(10, 85): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 10');
      const step3: string = subject.connect(300, 25);
      logInfo(`step3 connect(300, 25): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 300');
      logInfo(`write>accept>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 300');
      logInfo(`${BUNDLE}SppPageStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0070
     * @tc.name      SerialCommunication_SppPageStateFlow_0070
     * @tc.desc      SppPageState call flow accept > connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0070 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(150, 0);
      logInfo(`step1 accept(150, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 150');
      const step2: string = subject.connect(125, 60);
      logInfo(`step2 connect(125, 60): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 125');
      const step3: string = subject.accept(125, 45);
      logInfo(`step3 accept(125, 45): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 125');
      logInfo(`accept>connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 125');
      logInfo(`${BUNDLE}SppPageStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0071
     * @tc.name      SerialCommunication_SppPageStateFlow_0071
     * @tc.desc      SppPageState call flow write > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0071 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.input('Hello World', 'abc', 'Hello');
      logInfo(`write>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('Hello World');
      logInfo(`write>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`write>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`write>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0072
     * @tc.name      SerialCommunication_SppPageStateFlow_0072
     * @tc.desc      SppPageState call flow input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0072 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('123', '123', 'Hello World');
      const step2: string = subject.accept(125, 115);
      logInfo(`step2 accept(125, 115): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 125');
      logInfo(`input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('123');
      logInfo(`input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('123');
      logInfo(`input>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello World');
      logInfo(`input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 125');
      logInfo(`${BUNDLE}SppPageStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0073
     * @tc.name      SerialCommunication_SppPageStateFlow_0073
     * @tc.desc      SppPageState call flow input > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0073 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input(' ', '', 'A');
      const step2: string = subject.listen(100, 0);
      logInfo(`step2 listen(100, 0): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 100');
      logInfo(`input>listen final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`input>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`input>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`input>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 100');
      logInfo(`${BUNDLE}SppPageStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0074
     * @tc.name      SerialCommunication_SppPageStateFlow_0074
     * @tc.desc      SppPageState call flow close > write > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0074 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.accept(3, 64.95);
      logInfo(`step3 accept(3, 64.95): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 3');
      logInfo(`close>write>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 3');
      logInfo(`${BUNDLE}SppPageStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0075
     * @tc.name      SerialCommunication_SppPageStateFlow_0075
     * @tc.desc      SppPageState call flow close > listen > close > listen > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0075 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.listen(225, 40);
      logInfo(`step2 listen(225, 40): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 225');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      const step4: string = subject.listen(-1, 25);
      logInfo(`step4 listen(-1, 25): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is -1');
      const step5: number = subject.write();
      logInfo(`step5 write(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`close>listen>close>listen>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0076
     * @tc.name      SerialCommunication_SppPageStateFlow_0076
     * @tc.desc      SppPageState call flow input > listen > close > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0076 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('', ' ', 'Hello');
      const step2: string = subject.listen(0, 115);
      logInfo(`step2 listen(0, 115): step2=${step2}`);
      expect(step2).assertEqual('sppListen success, serverNumber = 115');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      logInfo(`input>listen>close>close final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(115);
      logInfo(`input>listen>close>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' ');
      logInfo(`input>listen>close>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>listen>close>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0077
     * @tc.name      SerialCommunication_SppPageStateFlow_0077
     * @tc.desc      SppPageState call flow input > write > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0077 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('abc', 'Hello World', 'hello world');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(11);
      const step3: string = subject.accept(175, 0);
      logInfo(`step3 accept(175, 0): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 175');
      logInfo(`input>write>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`input>write>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('Hello World');
      logInfo(`input>write>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`input>write>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 175');
      logInfo(`input>write>accept final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(11);
      logInfo(`${BUNDLE}SppPageStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0078
     * @tc.name      SerialCommunication_SppPageStateFlow_0078
     * @tc.desc      SppPageState call flow input > write > write > accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0078 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('aa', '123', '\u4e2d\u6587');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.accept(225, 50);
      logInfo(`step4 accept(225, 50): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 225');
      const step5: string = subject.accept(401, 0);
      logInfo(`step5 accept(401, 0): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 401');
      logInfo(`input>write>write>accept>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`input>write>write>accept>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('123');
      logInfo(`input>write>write>accept>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`input>write>write>accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`input>write>write>accept>accept final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(4);
      logInfo(`${BUNDLE}SppPageStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0079
     * @tc.name      SerialCommunication_SppPageStateFlow_0079
     * @tc.desc      SppPageState call flow input > input > connect > accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0079 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input(' ', 'xa', '\u4e2d\u6587');
      subject.input('Hello World', '123', 'hello world');
      const step3: string = subject.connect(25, 40);
      logInfo(`step3 connect(25, 40): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 25');
      const step4: string = subject.accept(450, 0);
      logInfo(`step4 accept(450, 0): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 450');
      const step5: string = subject.close(true);
      logInfo(`step5 close(true): step5=${step5}`);
      expect(step5).assertEqual('sppCloseServerSocket success');
      logInfo(`input>input>connect>accept>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('Hello World');
      logInfo(`input>input>connect>accept>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('123');
      logInfo(`input>input>connect>accept>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`input>input>connect>accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0080
     * @tc.name      SerialCommunication_SppPageStateFlow_0080
     * @tc.desc      SppPageState call flow listen > connect > listen > connect > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0080 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(0, 50);
      logInfo(`step1 listen(0, 50): step1=${step1}`);
      expect(step1).assertEqual('sppListen success, serverNumber = 50');
      const step2: string = subject.connect(425, 55);
      logInfo(`step2 connect(425, 55): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 425');
      const step3: string = subject.listen(25, 105);
      logInfo(`step3 listen(25, 105): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 25');
      const step4: string = subject.connect(250, 0);
      logInfo(`step4 connect(250, 0): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 250');
      subject.input('aa', 'abc', 'Hello World');
      logInfo(`listen>connect>listen>connect>input final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(50);
      logInfo(`listen>connect>listen>connect>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`listen>connect>listen>connect>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`listen>connect>listen>connect>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello World');
      logInfo(`listen>connect>listen>connect>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 250');
      logInfo(`${BUNDLE}SppPageStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0081
     * @tc.name      SerialCommunication_SppPageStateFlow_0081
     * @tc.desc      SppPageState call flow listen > listen > write > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0081 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(-1, 65);
      logInfo(`step1 listen(-1, 65): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is -1');
      const step2: string = subject.listen(-25, 85);
      logInfo(`step2 listen(-25, 85): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is -25');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      logInfo(`listen>listen>write>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0082
     * @tc.name      SerialCommunication_SppPageStateFlow_0082
     * @tc.desc      SppPageState call flow close > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0082 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      subject.input('', '', 'hello world');
      logInfo(`close>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`close>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('hello world');
      logInfo(`close>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0083
     * @tc.name      SerialCommunication_SppPageStateFlow_0083
     * @tc.desc      SppPageState call flow input > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0083 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('xa', ' a ', 'A');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`input>write final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`input>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`input>write final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`input>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`input>write final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(1);
      logInfo(`${BUNDLE}SppPageStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0084
     * @tc.name      SerialCommunication_SppPageStateFlow_0084
     * @tc.desc      SppPageState call flow write > accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0084 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.accept(125, 45);
      logInfo(`step2 accept(125, 45): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 125');
      const step3: string = subject.accept(200, 0);
      logInfo(`step3 accept(200, 0): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 200');
      logInfo(`write>accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0085
     * @tc.name      SerialCommunication_SppPageStateFlow_0085
     * @tc.desc      SppPageState call flow close > close > listen > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0085 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      const step3: string = subject.listen(500, 0);
      logInfo(`step3 listen(500, 0): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 500');
      subject.input('xa', 'abc', '\u4e2d\u6587');
      logInfo(`close>close>listen>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`close>close>listen>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`close>close>listen>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`close>close>listen>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0086
     * @tc.name      SerialCommunication_SppPageStateFlow_0086
     * @tc.desc      SppPageState call flow connect > write > listen > close > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0086 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(0, 65);
      logInfo(`step1 connect(0, 65): step1=${step1}`);
      expect(step1).assertEqual('sppConnect success, socketId = 65');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listen(350, 90);
      logInfo(`step3 listen(350, 90): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 350');
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      const step5: string = subject.accept(1, 50);
      logInfo(`step5 accept(1, 50): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 1');
      logInfo(`connect>write>listen>close>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0087
     * @tc.name      SerialCommunication_SppPageStateFlow_0087
     * @tc.desc      SppPageState call flow write > connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0087 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.connect(325, 105);
      logInfo(`step2 connect(325, 105): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 325');
      const step3: string = subject.accept(275, 90);
      logInfo(`step3 accept(275, 90): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 275');
      logInfo(`write>connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 275');
      logInfo(`${BUNDLE}SppPageStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0088
     * @tc.name      SerialCommunication_SppPageStateFlow_0088
     * @tc.desc      SppPageState call flow input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0088 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('a', '', '');
      const step2: string = subject.accept(50, 93);
      logInfo(`step2 accept(50, 93): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 50');
      logInfo(`input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 50');
      logInfo(`${BUNDLE}SppPageStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0089
     * @tc.name      SerialCommunication_SppPageStateFlow_0089
     * @tc.desc      SppPageState call flow accept > connect > write > listen > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0089 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(3, 64.95);
      logInfo(`step1 accept(3, 64.95): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 3');
      const step2: string = subject.connect(0, 55);
      logInfo(`step2 connect(0, 55): step2=${step2}`);
      expect(step2).assertEqual('sppConnect success, socketId = 55');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.listen(-1, 65);
      logInfo(`step4 listen(-1, 65): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is -1');
      const step5: string = subject.listen(475, 30);
      logInfo(`step5 listen(475, 30): step5=${step5}`);
      expect(step5).assertEqual('sppListen error, code is 475');
      logInfo(`accept>connect>write>listen>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 475');
      logInfo(`${BUNDLE}SppPageStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0090
     * @tc.name      SerialCommunication_SppPageStateFlow_0090
     * @tc.desc      SppPageState call flow close > accept > write > close > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0090 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.accept(225, 90);
      logInfo(`step2 accept(225, 90): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 225');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      const step5: number = subject.write();
      logInfo(`step5 write(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`close>accept>write>close>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0091
     * @tc.name      SerialCommunication_SppPageStateFlow_0091
     * @tc.desc      SppPageState call flow accept > close > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0091 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(0, 65);
      logInfo(`step1 accept(0, 65): step1=${step1}`);
      expect(step1).assertEqual('accept the client success');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      subject.input('aa', 'a_1', 'abc');
      logInfo(`accept>close>input final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(65);
      logInfo(`accept>close>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`accept>close>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a_1');
      logInfo(`accept>close>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('abc');
      logInfo(`accept>close>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0092
     * @tc.name      SerialCommunication_SppPageStateFlow_0092
     * @tc.desc      SppPageState call flow close > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0092 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.listen(25, 100);
      logInfo(`step2 listen(25, 100): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 25');
      logInfo(`close>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 25');
      logInfo(`${BUNDLE}SppPageStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0093
     * @tc.name      SerialCommunication_SppPageStateFlow_0093
     * @tc.desc      SppPageState call flow listen > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0093 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(450, 0);
      logInfo(`step1 listen(450, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 450');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      logInfo(`listen>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0094
     * @tc.name      SerialCommunication_SppPageStateFlow_0094
     * @tc.desc      SppPageState call flow write > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0094 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.input('a', ' ', 'Hello');
      logInfo(`write>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`write>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' ');
      logInfo(`write>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`write>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0095
     * @tc.name      SerialCommunication_SppPageStateFlow_0095
     * @tc.desc      SppPageState call flow close > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0095 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`close>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0096
     * @tc.name      SerialCommunication_SppPageStateFlow_0096
     * @tc.desc      SppPageState call flow accept > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0096 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(2, 0);
      logInfo(`step1 accept(2, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 2');
      subject.input('a_1', ' a ', 'hello world');
      subject.input('abc', 'xa', 'a');
      logInfo(`accept>input>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`accept>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`accept>input>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('a');
      logInfo(`accept>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 2');
      logInfo(`${BUNDLE}SppPageStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0097
     * @tc.name      SerialCommunication_SppPageStateFlow_0097
     * @tc.desc      SppPageState call flow accept > accept > listen > connect > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0097 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(404, 0);
      logInfo(`step1 accept(404, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 404');
      const step2: string = subject.accept(175, 15);
      logInfo(`step2 accept(175, 15): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 175');
      const step3: string = subject.listen(100, -14);
      logInfo(`step3 listen(100, -14): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 100');
      const step4: string = subject.connect(425, 0);
      logInfo(`step4 connect(425, 0): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 425');
      const step5: string = subject.listen(50, 0);
      logInfo(`step5 listen(50, 0): step5=${step5}`);
      expect(step5).assertEqual('sppListen error, code is 50');
      logInfo(`accept>accept>listen>connect>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 50');
      logInfo(`${BUNDLE}SppPageStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0098
     * @tc.name      SerialCommunication_SppPageStateFlow_0098
     * @tc.desc      SppPageState call flow accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0098 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(0, 85);
      logInfo(`step1 accept(0, 85): step1=${step1}`);
      expect(step1).assertEqual('accept the client success');
      const step2: string = subject.accept(10, 0);
      logInfo(`step2 accept(10, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 10');
      logInfo(`accept>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(85);
      logInfo(`accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 10');
      logInfo(`${BUNDLE}SppPageStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0099
     * @tc.name      SerialCommunication_SppPageStateFlow_0099
     * @tc.desc      SppPageState call flow connect > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0099 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(200, 85);
      logInfo(`step1 connect(200, 85): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 200');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`connect>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0100
     * @tc.name      SerialCommunication_SppPageStateFlow_0100
     * @tc.desc      SppPageState call flow listen > write > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0100 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(401, 0);
      logInfo(`step1 listen(401, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 401');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listen(0, 2);
      logInfo(`step3 listen(0, 2): step3=${step3}`);
      expect(step3).assertEqual('sppListen success, serverNumber = 2');
      logInfo(`listen>write>listen final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(2);
      logInfo(`listen>write>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 2');
      logInfo(`${BUNDLE}SppPageStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0101
     * @tc.name      SerialCommunication_SppPageStateFlow_0101
     * @tc.desc      SppPageState call flow listen > input > listen > write > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0101 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(3, 2);
      logInfo(`step1 listen(3, 2): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 3');
      subject.input('a', 'abc', '\u4e2d\u6587');
      const step3: string = subject.listen(400, 0);
      logInfo(`step3 listen(400, 0): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 400');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.input('xa', 'xa', 'Hello World');
      logInfo(`listen>input>listen>write>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`listen>input>listen>write>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`listen>input>listen>write>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello World');
      logInfo(`listen>input>listen>write>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`listen>input>listen>write>input final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(2);
      logInfo(`${BUNDLE}SppPageStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0102
     * @tc.name      SerialCommunication_SppPageStateFlow_0102
     * @tc.desc      SppPageState call flow input > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0102 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('a', 'Hello World', '');
      const step2: string = subject.connect(10, 75);
      logInfo(`step2 connect(10, 75): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 10');
      logInfo(`input>connect final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`input>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('Hello World');
      logInfo(`input>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 10');
      logInfo(`${BUNDLE}SppPageStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0103
     * @tc.name      SerialCommunication_SppPageStateFlow_0103
     * @tc.desc      SppPageState call flow write > connect > write > listen > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0103 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.connect(175, 79);
      logInfo(`step2 connect(175, 79): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 175');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.listen(447.61, 25);
      logInfo(`step4 listen(447.61, 25): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is 447.61');
      const step5: string = subject.close(false);
      logInfo(`step5 close(false): step5=${step5}`);
      expect(step5).assertEqual('sppCloseClientSocket success');
      logInfo(`write>connect>write>listen>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0104
     * @tc.name      SerialCommunication_SppPageStateFlow_0104
     * @tc.desc      SppPageState call flow accept > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0104 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(225, 0);
      logInfo(`step1 accept(225, 0): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 225');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`accept>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0105
     * @tc.name      SerialCommunication_SppPageStateFlow_0105
     * @tc.desc      SppPageState call flow listen > close > input > input > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0105 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(350, 44.34);
      logInfo(`step1 listen(350, 44.34): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 350');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      subject.input('a_1', '', '');
      subject.input('aa', 'xa', '');
      const step5: string = subject.close(true);
      logInfo(`step5 close(true): step5=${step5}`);
      expect(step5).assertEqual('sppCloseServerSocket success');
      logInfo(`listen>close>input>input>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`listen>close>input>input>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`listen>close>input>input>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0106
     * @tc.name      SerialCommunication_SppPageStateFlow_0106
     * @tc.desc      SppPageState call flow close > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0106 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      subject.input('aa', ' a ', '');
      logInfo(`close>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`close>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`close>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0107
     * @tc.name      SerialCommunication_SppPageStateFlow_0107
     * @tc.desc      SppPageState call flow write > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0107 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.input('abc', 'aa', 'Hello World');
      logInfo(`write>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`write>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('aa');
      logInfo(`write>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello World');
      logInfo(`write>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0108
     * @tc.name      SerialCommunication_SppPageStateFlow_0108
     * @tc.desc      SppPageState call flow listen > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0108 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(350, 2);
      logInfo(`step1 listen(350, 2): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 350');
      subject.input('a', 'aa', '\u4e2d\u6587');
      subject.input('a_1', ' a ', 'Hello');
      logInfo(`listen>input>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`listen>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`listen>input>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`listen>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 350');
      logInfo(`${BUNDLE}SppPageStateFlow_0108 end`);
    });
  });
}
