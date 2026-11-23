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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SppPageState flow (55 cases). */
export default function sppPageStateFlow4Test(): void {
  describe('SppPageStateFlow4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0163
     * @tc.name      SerialCommunication_SppPageStateFlow_0163
     * @tc.desc      SppPageState call flow connect > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0163 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(-1, 1);
      logInfo(`step1 connect(-1, 1): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = -1');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`connect>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0164
     * @tc.name      SerialCommunication_SppPageStateFlow_0164
     * @tc.desc      SppPageState call flow write > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0164 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.connect(0, 10);
      logInfo(`step2 connect(0, 10): step2=${step2}`);
      expect(step2).assertEqual('sppConnect success, socketId = 10');
      logInfo(`write>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 10');
      logInfo(`${BUNDLE}SppPageStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0165
     * @tc.name      SerialCommunication_SppPageStateFlow_0165
     * @tc.desc      SppPageState call flow accept > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0165 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(10, 80);
      logInfo(`step1 accept(10, 80): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 10');
      subject.input('a', '', '');
      logInfo(`accept>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`accept>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`accept>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 10');
      logInfo(`${BUNDLE}SppPageStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0166
     * @tc.name      SerialCommunication_SppPageStateFlow_0166
     * @tc.desc      SppPageState call flow accept > accept > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0166 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(404, 55);
      logInfo(`step1 accept(404, 55): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 404');
      const step2: string = subject.accept(375, 40);
      logInfo(`step2 accept(375, 40): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 375');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`accept>accept>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0167
     * @tc.name      SerialCommunication_SppPageStateFlow_0167
     * @tc.desc      SppPageState call flow close > accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0167 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.accept(50, 0);
      logInfo(`step2 accept(50, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 50');
      const step3: string = subject.accept(325, 60);
      logInfo(`step3 accept(325, 60): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 325');
      logInfo(`close>accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 325');
      logInfo(`${BUNDLE}SppPageStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0168
     * @tc.name      SerialCommunication_SppPageStateFlow_0168
     * @tc.desc      SppPageState call flow connect > write > input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0168 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(0, 2);
      logInfo(`step1 connect(0, 2): step1=${step1}`);
      expect(step1).assertEqual('sppConnect success, socketId = 2');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.input('a_1', 'a', ' ');
      const step4: string = subject.accept(1, 5);
      logInfo(`step4 accept(1, 5): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 1');
      logInfo(`connect>write>input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`connect>write>input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`connect>write>input>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual(' ');
      logInfo(`connect>write>input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0169
     * @tc.name      SerialCommunication_SppPageStateFlow_0169
     * @tc.desc      SppPageState call flow close > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0169 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      logInfo(`close>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0170
     * @tc.name      SerialCommunication_SppPageStateFlow_0170
     * @tc.desc      SppPageState call flow connect > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0170 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(125, 5);
      logInfo(`step1 connect(125, 5): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 125');
      subject.input('123', '123', '\u4e2d\u6587');
      subject.input('', '', '\u4e2d\u6587');
      logInfo(`connect>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`connect>input>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`connect>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 125');
      logInfo(`${BUNDLE}SppPageStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0171
     * @tc.name      SerialCommunication_SppPageStateFlow_0171
     * @tc.desc      SppPageState call flow connect > write > write > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0171 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(10, 20);
      logInfo(`step1 connect(10, 20): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 10');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.input('', 'aa', '');
      subject.input('a', 'Hello World', '');
      logInfo(`connect>write>write>input>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`connect>write>write>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('Hello World');
      logInfo(`connect>write>write>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0172
     * @tc.name      SerialCommunication_SppPageStateFlow_0172
     * @tc.desc      SppPageState call flow accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0172 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(1, 20);
      logInfo(`step1 accept(1, 20): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 1');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0173
     * @tc.name      SerialCommunication_SppPageStateFlow_0173
     * @tc.desc      SppPageState call flow close > input > input > write > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0173 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      subject.input('a_1', '', '');
      subject.input('abc', 'abc', '');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.accept(212, -1);
      logInfo(`step5 accept(212, -1): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 212');
      logInfo(`close>input>input>write>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`close>input>input>write>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`close>input>input>write>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 212');
      logInfo(`${BUNDLE}SppPageStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0174
     * @tc.name      SerialCommunication_SppPageStateFlow_0174
     * @tc.desc      SppPageState call flow close > connect > input > accept > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0174 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.connect(0, 0);
      logInfo(`step2 connect(0, 0): step2=${step2}`);
      expect(step2).assertEqual('sppConnect success, socketId = 0');
      subject.input('', '', 'Hello');
      const step4: string = subject.accept(125, 115);
      logInfo(`step4 accept(125, 115): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 125');
      const step5: string = subject.connect(1, 3);
      logInfo(`step5 connect(1, 3): step5=${step5}`);
      expect(step5).assertEqual('sppConnect error, code = 1');
      logInfo(`close>connect>input>accept>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`close>connect>input>accept>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`close>connect>input>accept>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0175
     * @tc.name      SerialCommunication_SppPageStateFlow_0175
     * @tc.desc      SppPageState call flow connect > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0175 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(400, 0);
      logInfo(`step1 connect(400, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 400');
      const step2: string = subject.listen(75, 0);
      logInfo(`step2 listen(75, 0): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 75');
      logInfo(`connect>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 75');
      logInfo(`${BUNDLE}SppPageStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0176
     * @tc.name      SerialCommunication_SppPageStateFlow_0176
     * @tc.desc      SppPageState call flow connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0176 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(375, 2);
      logInfo(`step1 connect(375, 2): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 375');
      const step2: string = subject.accept(2, 0);
      logInfo(`step2 accept(2, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 2');
      logInfo(`connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 2');
      logInfo(`${BUNDLE}SppPageStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0177
     * @tc.name      SerialCommunication_SppPageStateFlow_0177
     * @tc.desc      SppPageState call flow connect > close > input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0177 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(200, 85);
      logInfo(`step1 connect(200, 85): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 200');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      subject.input('aa', 'a', 'Hello');
      const step4: string = subject.accept(475, 0);
      logInfo(`step4 accept(475, 0): step4=${step4}`);
      expect(step4).assertEqual('sppAccept error, code is 475');
      logInfo(`connect>close>input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('aa');
      logInfo(`connect>close>input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`connect>close>input>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`connect>close>input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 475');
      logInfo(`${BUNDLE}SppPageStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0178
     * @tc.name      SerialCommunication_SppPageStateFlow_0178
     * @tc.desc      SppPageState call flow connect > connect > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0178 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(425, 70);
      logInfo(`step1 connect(425, 70): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 425');
      const step2: string = subject.connect(459.14, 50);
      logInfo(`step2 connect(459.14, 50): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 459.14');
      subject.input(' ', 'a', '\u4e2d\u6587');
      logInfo(`connect>connect>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`connect>connect>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`connect>connect>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`connect>connect>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 459.14');
      logInfo(`${BUNDLE}SppPageStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0179
     * @tc.name      SerialCommunication_SppPageStateFlow_0179
     * @tc.desc      SppPageState call flow listen > close > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0179 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(447.61, 55);
      logInfo(`step1 listen(447.61, 55): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 447.61');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      logInfo(`listen>close>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0180
     * @tc.name      SerialCommunication_SppPageStateFlow_0180
     * @tc.desc      SppPageState call flow connect > input > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0180 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(350, 0);
      logInfo(`step1 connect(350, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 350');
      subject.input('xa', '', ' ');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      logInfo(`connect>input>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`connect>input>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`connect>input>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual(' ');
      logInfo(`connect>input>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0181
     * @tc.name      SerialCommunication_SppPageStateFlow_0181
     * @tc.desc      SppPageState call flow close > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0181 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(false);
      logInfo(`step1 close(false): step1=${step1}`);
      expect(step1).assertEqual('sppCloseClientSocket success');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`close>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0182
     * @tc.name      SerialCommunication_SppPageStateFlow_0182
     * @tc.desc      SppPageState call flow input > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0182 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('', 'aa', 'Hello');
      const step2: string = subject.listen(401, -14);
      logInfo(`step2 listen(401, -14): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 401');
      logInfo(`input>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('aa');
      logInfo(`input>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0183
     * @tc.name      SerialCommunication_SppPageStateFlow_0183
     * @tc.desc      SppPageState call flow close > connect > write > close > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0183 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.connect(450, 2);
      logInfo(`step2 connect(450, 2): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 450');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      const step5: string = subject.close(false);
      logInfo(`step5 close(false): step5=${step5}`);
      expect(step5).assertEqual('sppCloseClientSocket success');
      logInfo(`close>connect>write>close>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0184
     * @tc.name      SerialCommunication_SppPageStateFlow_0184
     * @tc.desc      SppPageState call flow connect > input > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0184 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(2, 85);
      logInfo(`step1 connect(2, 85): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 2');
      subject.input('', '', '');
      subject.input('abc', ' ', 'A');
      logInfo(`connect>input>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`connect>input>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' ');
      logInfo(`connect>input>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`connect>input>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 2');
      logInfo(`${BUNDLE}SppPageStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0185
     * @tc.name      SerialCommunication_SppPageStateFlow_0185
     * @tc.desc      SppPageState call flow accept > connect > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0185 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(100, 95);
      logInfo(`step1 accept(100, 95): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 100');
      const step2: string = subject.connect(325, 80);
      logInfo(`step2 connect(325, 80): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 325');
      subject.input('a', ' a ', 'a');
      logInfo(`accept>connect>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`accept>connect>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`accept>connect>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('a');
      logInfo(`accept>connect>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 325');
      logInfo(`${BUNDLE}SppPageStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0186
     * @tc.name      SerialCommunication_SppPageStateFlow_0186
     * @tc.desc      SppPageState call flow listen > write > listen > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0186 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(200, 65);
      logInfo(`step1 listen(200, 65): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 200');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listen(225, 115);
      logInfo(`step3 listen(225, 115): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 225');
      const step4: string = subject.connect(175, 85);
      logInfo(`step4 connect(175, 85): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 175');
      logInfo(`listen>write>listen>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 175');
      logInfo(`${BUNDLE}SppPageStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0187
     * @tc.name      SerialCommunication_SppPageStateFlow_0187
     * @tc.desc      SppPageState call flow close > close > close > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0187 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      logInfo(`close>close>close>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0188
     * @tc.name      SerialCommunication_SppPageStateFlow_0188
     * @tc.desc      SppPageState call flow write > connect > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0188 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.connect(0, 60);
      logInfo(`step2 connect(0, 60): step2=${step2}`);
      expect(step2).assertEqual('sppConnect success, socketId = 60');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      logInfo(`write>connect>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0189
     * @tc.name      SerialCommunication_SppPageStateFlow_0189
     * @tc.desc      SppPageState call flow accept > close > input > input > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0189 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(0, 64.95);
      logInfo(`step1 accept(0, 64.95): step1=${step1}`);
      expect(step1).assertEqual('accept the client success');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      subject.input('a', ' ', 'Hello');
      subject.input('a_1', 'a_1', '\u4e2d\u6587');
      const step5: string = subject.listen(300, 60);
      logInfo(`step5 listen(300, 60): step5=${step5}`);
      expect(step5).assertEqual('sppListen error, code is 300');
      logInfo(`accept>close>input>input>listen final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertClose(64.95, PRECISION);
      logInfo(`accept>close>input>input>listen final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`accept>close>input>input>listen final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a_1');
      logInfo(`accept>close>input>input>listen final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`accept>close>input>input>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 300');
      logInfo(`${BUNDLE}SppPageStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0190
     * @tc.name      SerialCommunication_SppPageStateFlow_0190
     * @tc.desc      SppPageState call flow listen > accept > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0190 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(500, 0);
      logInfo(`step1 listen(500, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 500');
      const step2: string = subject.accept(275, 95);
      logInfo(`step2 accept(275, 95): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 275');
      const step3: string = subject.listen(0, -14);
      logInfo(`step3 listen(0, -14): step3=${step3}`);
      expect(step3).assertEqual('sppListen success, serverNumber = -14');
      logInfo(`listen>accept>listen final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(-14);
      logInfo(`listen>accept>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = -14');
      logInfo(`${BUNDLE}SppPageStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0191
     * @tc.name      SerialCommunication_SppPageStateFlow_0191
     * @tc.desc      SppPageState call flow connect > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0191 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(10, 75);
      logInfo(`step1 connect(10, 75): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 10');
      const step2: string = subject.listen(475, 70);
      logInfo(`step2 listen(475, 70): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 475');
      logInfo(`connect>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 475');
      logInfo(`${BUNDLE}SppPageStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0192
     * @tc.name      SerialCommunication_SppPageStateFlow_0192
     * @tc.desc      SppPageState call flow connect > write > listen > close > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0192 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(125, -1);
      logInfo(`step1 connect(125, -1): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 125');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listen(250, 60);
      logInfo(`step3 listen(250, 60): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 250');
      const step4: string = subject.close(false);
      logInfo(`step4 close(false): step4=${step4}`);
      expect(step4).assertEqual('sppCloseClientSocket success');
      const step5: string = subject.accept(100, 60);
      logInfo(`step5 accept(100, 60): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 100');
      logInfo(`connect>write>listen>close>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 100');
      logInfo(`${BUNDLE}SppPageStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0193
     * @tc.name      SerialCommunication_SppPageStateFlow_0193
     * @tc.desc      SppPageState call flow connect > close > close > connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0193 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(100, 0);
      logInfo(`step1 connect(100, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 100');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      const step4: string = subject.connect(325, 15);
      logInfo(`step4 connect(325, 15): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 325');
      const step5: string = subject.accept(0, 115);
      logInfo(`step5 accept(0, 115): step5=${step5}`);
      expect(step5).assertEqual('accept the client success');
      logInfo(`connect>close>close>connect>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(115);
      logInfo(`connect>close>close>connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0194
     * @tc.name      SerialCommunication_SppPageStateFlow_0194
     * @tc.desc      SppPageState call flow input > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0194 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('Hello World', '', 'Hello');
      const step2: string = subject.accept(0, 45);
      logInfo(`step2 accept(0, 45): step2=${step2}`);
      expect(step2).assertEqual('accept the client success');
      logInfo(`input>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(45);
      logInfo(`input>accept final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('Hello World');
      logInfo(`input>accept final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('');
      logInfo(`input>accept final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0195
     * @tc.name      SerialCommunication_SppPageStateFlow_0195
     * @tc.desc      SppPageState call flow accept > write > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0195 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(325, 105);
      logInfo(`step1 accept(325, 105): step1=${step1}`);
      expect(step1).assertEqual('sppAccept error, code is 325');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listen(225, 45);
      logInfo(`step3 listen(225, 45): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 225');
      logInfo(`accept>write>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 225');
      logInfo(`${BUNDLE}SppPageStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0196
     * @tc.name      SerialCommunication_SppPageStateFlow_0196
     * @tc.desc      SppPageState call flow input > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0196 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('', ' ', 'Hello');
      const step2: string = subject.connect(500, 5);
      logInfo(`step2 connect(500, 5): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 500');
      logInfo(`input>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' ');
      logInfo(`input>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0197
     * @tc.name      SerialCommunication_SppPageStateFlow_0197
     * @tc.desc      SppPageState call flow listen > accept > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0197 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(200, 40);
      logInfo(`step1 listen(200, 40): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 200');
      const step2: string = subject.accept(250, 0);
      logInfo(`step2 accept(250, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 250');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`listen>accept>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0198
     * @tc.name      SerialCommunication_SppPageStateFlow_0198
     * @tc.desc      SppPageState call flow close > close > write > input > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0198 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.close(true);
      logInfo(`step1 close(true): step1=${step1}`);
      expect(step1).assertEqual('sppCloseServerSocket success');
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.input('xa', 'abc', '\u4e2d\u6587');
      const step5: number = subject.write();
      logInfo(`step5 write(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`close>close>write>input>write final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`close>close>write>input>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`close>close>write>input>write final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('\u4e2d\u6587');
      logInfo(`close>close>write>input>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`close>close>write>input>write final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(2);
      logInfo(`${BUNDLE}SppPageStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0199
     * @tc.name      SerialCommunication_SppPageStateFlow_0199
     * @tc.desc      SppPageState call flow input > connect > close > connect > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0199 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('a', 'a', 'hello world');
      const step2: string = subject.connect(0, -10);
      logInfo(`step2 connect(0, -10): step2=${step2}`);
      expect(step2).assertEqual('sppConnect success, socketId = -10');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      const step4: string = subject.connect(125, 5);
      logInfo(`step4 connect(125, 5): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 125');
      subject.input(' ', 'a', '');
      logInfo(`input>connect>close>connect>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' ');
      logInfo(`input>connect>close>connect>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`input>connect>close>connect>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 125');
      logInfo(`${BUNDLE}SppPageStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0200
     * @tc.name      SerialCommunication_SppPageStateFlow_0200
     * @tc.desc      SppPageState call flow input > input > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0200 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('123', '123', '\u4e2d\u6587');
      subject.input('Hello World', 'abc', 'Hello');
      const step3: number = subject.write();
      logInfo(`step3 write(): step3=${step3}`);
      expect(step3).assertEqual(5);
      logInfo(`input>input>write final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('Hello World');
      logInfo(`input>input>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`input>input>write final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>input>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`input>input>write final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(5);
      logInfo(`${BUNDLE}SppPageStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0201
     * @tc.name      SerialCommunication_SppPageStateFlow_0201
     * @tc.desc      SppPageState call flow input > accept > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0201 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input(' ', ' a ', 'A');
      const step2: string = subject.accept(3, 64.95);
      logInfo(`step2 accept(3, 64.95): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 3');
      subject.input(' a ', ' a ', 'A');
      logInfo(`input>accept>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual(' a ');
      logInfo(`input>accept>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual(' a ');
      logInfo(`input>accept>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('A');
      logInfo(`input>accept>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 3');
      logInfo(`${BUNDLE}SppPageStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0202
     * @tc.name      SerialCommunication_SppPageStateFlow_0202
     * @tc.desc      SppPageState call flow write > accept > connect > listen > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0202 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.accept(0, 5);
      logInfo(`step2 accept(0, 5): step2=${step2}`);
      expect(step2).assertEqual('accept the client success');
      const step3: string = subject.connect(200, 0);
      logInfo(`step3 connect(200, 0): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 200');
      const step4: string = subject.listen(0, 1);
      logInfo(`step4 listen(0, 1): step4=${step4}`);
      expect(step4).assertEqual('sppListen success, serverNumber = 1');
      const step5: string = subject.listen(75, 95);
      logInfo(`step5 listen(75, 95): step5=${step5}`);
      expect(step5).assertEqual('sppListen error, code is 75');
      logInfo(`write>accept>connect>listen>listen final: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(1);
      logInfo(`write>accept>connect>listen>listen final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(5);
      logInfo(`write>accept>connect>listen>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 75');
      logInfo(`${BUNDLE}SppPageStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0203
     * @tc.name      SerialCommunication_SppPageStateFlow_0203
     * @tc.desc      SppPageState call flow write > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0203 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      logInfo(`write>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0204
     * @tc.name      SerialCommunication_SppPageStateFlow_0204
     * @tc.desc      SppPageState call flow listen > listen > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0204 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(-1, 0);
      logInfo(`step1 listen(-1, 0): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is -1');
      const step2: string = subject.listen(350, 44.34);
      logInfo(`step2 listen(350, 44.34): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 350');
      const step3: string = subject.connect(175, 85);
      logInfo(`step3 connect(175, 85): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 175');
      logInfo(`listen>listen>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 175');
      logInfo(`${BUNDLE}SppPageStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0205
     * @tc.name      SerialCommunication_SppPageStateFlow_0205
     * @tc.desc      SppPageState call flow connect > accept > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0205 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(475, 0);
      logInfo(`step1 connect(475, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 475');
      const step2: string = subject.accept(225, 0);
      logInfo(`step2 accept(225, 0): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 225');
      const step3: string = subject.accept(404, 60);
      logInfo(`step3 accept(404, 60): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 404');
      logInfo(`connect>accept>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0206
     * @tc.name      SerialCommunication_SppPageStateFlow_0206
     * @tc.desc      SppPageState call flow listen > input > close > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0206 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(75, 115);
      logInfo(`step1 listen(75, 115): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 75');
      subject.input('a', 'abc', ' ');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      const step4: string = subject.connect(500, 25);
      logInfo(`step4 connect(500, 25): step4=${step4}`);
      expect(step4).assertEqual('sppConnect error, code = 500');
      logInfo(`listen>input>close>connect final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`listen>input>close>connect final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`listen>input>close>connect final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual(' ');
      logInfo(`listen>input>close>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0207
     * @tc.name      SerialCommunication_SppPageStateFlow_0207
     * @tc.desc      SppPageState call flow input > write > listen > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0207 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('a', 'Hello World', '');
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listen(375, 50);
      logInfo(`step3 listen(375, 50): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 375');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`input>write>listen>write final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a');
      logInfo(`input>write>listen>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('Hello World');
      logInfo(`input>write>listen>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0208
     * @tc.name      SerialCommunication_SppPageStateFlow_0208
     * @tc.desc      SppPageState call flow connect > connect > accept > listen keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0208 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(350, 0);
      logInfo(`step1 connect(350, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 350');
      const step2: string = subject.connect(175, 75);
      logInfo(`step2 connect(175, 75): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 175');
      const step3: string = subject.accept(200, 105);
      logInfo(`step3 accept(200, 105): step3=${step3}`);
      expect(step3).assertEqual('sppAccept error, code is 200');
      const step4: string = subject.listen(350, 50);
      logInfo(`step4 listen(350, 50): step4=${step4}`);
      expect(step4).assertEqual('sppListen error, code is 350');
      logInfo(`connect>connect>accept>listen final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 350');
      logInfo(`${BUNDLE}SppPageStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0209
     * @tc.name      SerialCommunication_SppPageStateFlow_0209
     * @tc.desc      SppPageState call flow connect > close > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0209 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(0, 0);
      logInfo(`step1 connect(0, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect success, socketId = 0');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      const step3: string = subject.accept(0, 0);
      logInfo(`step3 accept(0, 0): step3=${step3}`);
      expect(step3).assertEqual('accept the client success');
      logInfo(`connect>close>accept final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(0);
      logInfo(`connect>close>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0210
     * @tc.name      SerialCommunication_SppPageStateFlow_0210
     * @tc.desc      SppPageState call flow write > write > listen > connect > accept keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0210 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.write();
      logInfo(`step2 write(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listen(10, 2);
      logInfo(`step3 listen(10, 2): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 10');
      const step4: string = subject.connect(0, 10);
      logInfo(`step4 connect(0, 10): step4=${step4}`);
      expect(step4).assertEqual('sppConnect success, socketId = 10');
      const step5: string = subject.accept(400, 115);
      logInfo(`step5 accept(400, 115): step5=${step5}`);
      expect(step5).assertEqual('sppAccept error, code is 400');
      logInfo(`write>write>listen>connect>accept final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 400');
      logInfo(`${BUNDLE}SppPageStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0211
     * @tc.name      SerialCommunication_SppPageStateFlow_0211
     * @tc.desc      SppPageState call flow connect > connect > listen > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0211 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(50, 0);
      logInfo(`step1 connect(50, 0): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 50');
      const step2: string = subject.connect(404, 79);
      logInfo(`step2 connect(404, 79): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 404');
      const step3: string = subject.listen(1, 25);
      logInfo(`step3 listen(1, 25): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 1');
      const step4: number = subject.write();
      logInfo(`step4 write(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`connect>connect>listen>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`${BUNDLE}SppPageStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0212
     * @tc.name      SerialCommunication_SppPageStateFlow_0212
     * @tc.desc      SppPageState call flow connect > connect > connect keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0212 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.connect(175, 75);
      logInfo(`step1 connect(175, 75): step1=${step1}`);
      expect(step1).assertEqual('sppConnect error, code = 175');
      const step2: string = subject.connect(25, -10);
      logInfo(`step2 connect(25, -10): step2=${step2}`);
      expect(step2).assertEqual('sppConnect error, code = 25');
      const step3: string = subject.connect(425, 0);
      logInfo(`step3 connect(425, 0): step3=${step3}`);
      expect(step3).assertEqual('sppConnect error, code = 425');
      logInfo(`connect>connect>connect final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 425');
      logInfo(`${BUNDLE}SppPageStateFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0213
     * @tc.name      SerialCommunication_SppPageStateFlow_0213
     * @tc.desc      SppPageState call flow write > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0213 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: number = subject.write();
      logInfo(`step1 write(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.close(false);
      logInfo(`step2 close(false): step2=${step2}`);
      expect(step2).assertEqual('sppCloseClientSocket success');
      logInfo(`write>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseClientSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0214
     * @tc.name      SerialCommunication_SppPageStateFlow_0214
     * @tc.desc      SppPageState call flow input > listen > listen > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0214 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('xa', 'aa', 'Sample Title 123');
      const step2: string = subject.listen(450, 0);
      logInfo(`step2 listen(450, 0): step2=${step2}`);
      expect(step2).assertEqual('sppListen error, code is 450');
      const step3: string = subject.listen(401, 15);
      logInfo(`step3 listen(401, 15): step3=${step3}`);
      expect(step3).assertEqual('sppListen error, code is 401');
      const step4: string = subject.close(true);
      logInfo(`step4 close(true): step4=${step4}`);
      expect(step4).assertEqual('sppCloseServerSocket success');
      logInfo(`input>listen>listen>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('xa');
      logInfo(`input>listen>listen>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('aa');
      logInfo(`input>listen>listen>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Sample Title 123');
      logInfo(`input>listen>listen>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0215
     * @tc.name      SerialCommunication_SppPageStateFlow_0215
     * @tc.desc      SppPageState call flow input > accept > close keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0215 begin`);
      const subject: SppPageState = new SppPageState();
      subject.input('Hello World', 'abc', 'Hello');
      const step2: string = subject.accept(75, 50);
      logInfo(`step2 accept(75, 50): step2=${step2}`);
      expect(step2).assertEqual('sppAccept error, code is 75');
      const step3: string = subject.close(true);
      logInfo(`step3 close(true): step3=${step3}`);
      expect(step3).assertEqual('sppCloseServerSocket success');
      logInfo(`input>accept>close final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('Hello World');
      logInfo(`input>accept>close final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('abc');
      logInfo(`input>accept>close final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('Hello');
      logInfo(`input>accept>close final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppCloseServerSocket success');
      logInfo(`${BUNDLE}SppPageStateFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0216
     * @tc.name      SerialCommunication_SppPageStateFlow_0216
     * @tc.desc      SppPageState call flow listen > input keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0216 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.listen(275, -1);
      logInfo(`step1 listen(275, -1): step1=${step1}`);
      expect(step1).assertEqual('sppListen error, code is 275');
      subject.input('a_1', 'a', ' ');
      logInfo(`listen>input final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('a_1');
      logInfo(`listen>input final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('a');
      logInfo(`listen>input final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual(' ');
      logInfo(`listen>input final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 275');
      logInfo(`${BUNDLE}SppPageStateFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_FLOW_0217
     * @tc.name      SerialCommunication_SppPageStateFlow_0217
     * @tc.desc      SppPageState call flow accept > close > close > input > write keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateFlow_0217 begin`);
      const subject: SppPageState = new SppPageState();
      const step1: string = subject.accept(0, 110);
      logInfo(`step1 accept(0, 110): step1=${step1}`);
      expect(step1).assertEqual('accept the client success');
      const step2: string = subject.close(true);
      logInfo(`step2 close(true): step2=${step2}`);
      expect(step2).assertEqual('sppCloseServerSocket success');
      const step3: string = subject.close(false);
      logInfo(`step3 close(false): step3=${step3}`);
      expect(step3).assertEqual('sppCloseClientSocket success');
      subject.input('abc', 'xa', 'a');
      const step5: number = subject.write();
      logInfo(`step5 write(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`accept>close>close>input>write final: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(110);
      logInfo(`accept>close>close>input>write final: subject.deviceId=${subject.deviceId}`);
      expect(subject.deviceId).assertEqual('abc');
      logInfo(`accept>close>close>input>write final: subject.uuid=${subject.uuid}`);
      expect(subject.uuid).assertEqual('xa');
      logInfo(`accept>close>close>input>write final: subject.dataValue=${subject.dataValue}`);
      expect(subject.dataValue).assertEqual('a');
      logInfo(`accept>close>close>input>write final: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppWrite success');
      logInfo(`accept>close>close>input>write final: subject.written=${subject.written}`);
      expect(subject.written).assertEqual(1);
      logInfo(`${BUNDLE}SppPageStateFlow_0217 end`);
    });
  });
}
