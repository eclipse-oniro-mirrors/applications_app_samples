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

/** Logic checks for SppPageState.connect (70 cases). */
export default function sppPageStateConnect3Test(): void {
  describe('SppPageStateConnect3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0163
     * @tc.name      SerialCommunication_SppPageStateConnect_0163
     * @tc.desc      SppPageState.connect(code=401, socketId=75) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0163 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 75);
      logInfo(`connect(code=401, socketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0163 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0164
     * @tc.name      SerialCommunication_SppPageStateConnect_0164
     * @tc.desc      SppPageState.connect(code=401, socketId=80) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0164 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 80);
      logInfo(`connect(code=401, socketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0164 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0165
     * @tc.name      SerialCommunication_SppPageStateConnect_0165
     * @tc.desc      SppPageState.connect(code=401, socketId=85) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0165 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 85);
      logInfo(`connect(code=401, socketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0165 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0166
     * @tc.name      SerialCommunication_SppPageStateConnect_0166
     * @tc.desc      SppPageState.connect(code=401, socketId=90) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0166 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 90);
      logInfo(`connect(code=401, socketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0166 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0167
     * @tc.name      SerialCommunication_SppPageStateConnect_0167
     * @tc.desc      SppPageState.connect(code=401, socketId=95) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0167 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 95);
      logInfo(`connect(code=401, socketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0167 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0168
     * @tc.name      SerialCommunication_SppPageStateConnect_0168
     * @tc.desc      SppPageState.connect(code=401, socketId=105) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0168 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 105);
      logInfo(`connect(code=401, socketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0168 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0169
     * @tc.name      SerialCommunication_SppPageStateConnect_0169
     * @tc.desc      SppPageState.connect(code=401, socketId=110) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0169 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 110);
      logInfo(`connect(code=401, socketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0169 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0170
     * @tc.name      SerialCommunication_SppPageStateConnect_0170
     * @tc.desc      SppPageState.connect(code=401, socketId=115) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0170 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 115);
      logInfo(`connect(code=401, socketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0170 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0171
     * @tc.name      SerialCommunication_SppPageStateConnect_0171
     * @tc.desc      SppPageState.connect(code=401, socketId=79) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0171 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 79);
      logInfo(`connect(code=401, socketId=79): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=79) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0171 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0172
     * @tc.name      SerialCommunication_SppPageStateConnect_0172
     * @tc.desc      SppPageState.connect(code=401, socketId=-10) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateConnect_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0172 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, -10);
      logInfo(`connect(code=401, socketId=-10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=-10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0172 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0173
     * @tc.name      SerialCommunication_SppPageStateConnect_0173
     * @tc.desc      SppPageState.connect(code=404, socketId=1) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0173 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 1);
      logInfo(`connect(code=404, socketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0173 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0174
     * @tc.name      SerialCommunication_SppPageStateConnect_0174
     * @tc.desc      SppPageState.connect(code=404, socketId=-1) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0174 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, -1);
      logInfo(`connect(code=404, socketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0174 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0175
     * @tc.name      SerialCommunication_SppPageStateConnect_0175
     * @tc.desc      SppPageState.connect(code=404, socketId=100) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0175 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 100);
      logInfo(`connect(code=404, socketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0175 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0176
     * @tc.name      SerialCommunication_SppPageStateConnect_0176
     * @tc.desc      SppPageState.connect(code=404, socketId=2) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0176 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 2);
      logInfo(`connect(code=404, socketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0176 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0177
     * @tc.name      SerialCommunication_SppPageStateConnect_0177
     * @tc.desc      SppPageState.connect(code=404, socketId=3) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0177 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 3);
      logInfo(`connect(code=404, socketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0177 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0178
     * @tc.name      SerialCommunication_SppPageStateConnect_0178
     * @tc.desc      SppPageState.connect(code=404, socketId=10) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0178 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 10);
      logInfo(`connect(code=404, socketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0178 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0179
     * @tc.name      SerialCommunication_SppPageStateConnect_0179
     * @tc.desc      SppPageState.connect(code=404, socketId=5) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0179 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 5);
      logInfo(`connect(code=404, socketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0179 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0180
     * @tc.name      SerialCommunication_SppPageStateConnect_0180
     * @tc.desc      SppPageState.connect(code=404, socketId=15) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0180 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 15);
      logInfo(`connect(code=404, socketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0180 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0181
     * @tc.name      SerialCommunication_SppPageStateConnect_0181
     * @tc.desc      SppPageState.connect(code=404, socketId=20) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0181 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 20);
      logInfo(`connect(code=404, socketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0181 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0182
     * @tc.name      SerialCommunication_SppPageStateConnect_0182
     * @tc.desc      SppPageState.connect(code=404, socketId=25) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0182 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 25);
      logInfo(`connect(code=404, socketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0182 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0183
     * @tc.name      SerialCommunication_SppPageStateConnect_0183
     * @tc.desc      SppPageState.connect(code=404, socketId=30) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0183 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 30);
      logInfo(`connect(code=404, socketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0183 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0184
     * @tc.name      SerialCommunication_SppPageStateConnect_0184
     * @tc.desc      SppPageState.connect(code=404, socketId=35) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0184 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 35);
      logInfo(`connect(code=404, socketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0184 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0185
     * @tc.name      SerialCommunication_SppPageStateConnect_0185
     * @tc.desc      SppPageState.connect(code=404, socketId=40) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0185 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 40);
      logInfo(`connect(code=404, socketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0185 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0186
     * @tc.name      SerialCommunication_SppPageStateConnect_0186
     * @tc.desc      SppPageState.connect(code=404, socketId=45) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0186 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 45);
      logInfo(`connect(code=404, socketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0186 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0187
     * @tc.name      SerialCommunication_SppPageStateConnect_0187
     * @tc.desc      SppPageState.connect(code=404, socketId=50) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0187 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 50);
      logInfo(`connect(code=404, socketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0187 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0188
     * @tc.name      SerialCommunication_SppPageStateConnect_0188
     * @tc.desc      SppPageState.connect(code=404, socketId=55) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0188 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 55);
      logInfo(`connect(code=404, socketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0188 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0189
     * @tc.name      SerialCommunication_SppPageStateConnect_0189
     * @tc.desc      SppPageState.connect(code=404, socketId=60) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0189 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 60);
      logInfo(`connect(code=404, socketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0189 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0190
     * @tc.name      SerialCommunication_SppPageStateConnect_0190
     * @tc.desc      SppPageState.connect(code=404, socketId=65) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0190 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 65);
      logInfo(`connect(code=404, socketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0190 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0191
     * @tc.name      SerialCommunication_SppPageStateConnect_0191
     * @tc.desc      SppPageState.connect(code=404, socketId=70) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0191 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 70);
      logInfo(`connect(code=404, socketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0191 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0192
     * @tc.name      SerialCommunication_SppPageStateConnect_0192
     * @tc.desc      SppPageState.connect(code=404, socketId=75) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0192 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 75);
      logInfo(`connect(code=404, socketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0192 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0193
     * @tc.name      SerialCommunication_SppPageStateConnect_0193
     * @tc.desc      SppPageState.connect(code=404, socketId=80) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0193 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 80);
      logInfo(`connect(code=404, socketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0193 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0194
     * @tc.name      SerialCommunication_SppPageStateConnect_0194
     * @tc.desc      SppPageState.connect(code=404, socketId=85) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0194 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 85);
      logInfo(`connect(code=404, socketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0194 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0195
     * @tc.name      SerialCommunication_SppPageStateConnect_0195
     * @tc.desc      SppPageState.connect(code=404, socketId=90) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0195 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 90);
      logInfo(`connect(code=404, socketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0195 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0196
     * @tc.name      SerialCommunication_SppPageStateConnect_0196
     * @tc.desc      SppPageState.connect(code=404, socketId=95) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0196 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 95);
      logInfo(`connect(code=404, socketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0196 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0197
     * @tc.name      SerialCommunication_SppPageStateConnect_0197
     * @tc.desc      SppPageState.connect(code=404, socketId=105) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0197 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 105);
      logInfo(`connect(code=404, socketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0197 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0198
     * @tc.name      SerialCommunication_SppPageStateConnect_0198
     * @tc.desc      SppPageState.connect(code=404, socketId=110) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0198 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 110);
      logInfo(`connect(code=404, socketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0198 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0199
     * @tc.name      SerialCommunication_SppPageStateConnect_0199
     * @tc.desc      SppPageState.connect(code=404, socketId=115) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0199 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 115);
      logInfo(`connect(code=404, socketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0199 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0200
     * @tc.name      SerialCommunication_SppPageStateConnect_0200
     * @tc.desc      SppPageState.connect(code=404, socketId=79) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0200 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 79);
      logInfo(`connect(code=404, socketId=79): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=79) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0200 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0201
     * @tc.name      SerialCommunication_SppPageStateConnect_0201
     * @tc.desc      SppPageState.connect(code=404, socketId=-10) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateConnect_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0201 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, -10);
      logInfo(`connect(code=404, socketId=-10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=-10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0201 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0202
     * @tc.name      SerialCommunication_SppPageStateConnect_0202
     * @tc.desc      SppPageState.connect(code=500, socketId=1) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0202 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 1);
      logInfo(`connect(code=500, socketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0202 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0203
     * @tc.name      SerialCommunication_SppPageStateConnect_0203
     * @tc.desc      SppPageState.connect(code=500, socketId=-1) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0203 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, -1);
      logInfo(`connect(code=500, socketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0203 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0204
     * @tc.name      SerialCommunication_SppPageStateConnect_0204
     * @tc.desc      SppPageState.connect(code=500, socketId=100) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0204 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 100);
      logInfo(`connect(code=500, socketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0204 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0205
     * @tc.name      SerialCommunication_SppPageStateConnect_0205
     * @tc.desc      SppPageState.connect(code=500, socketId=2) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0205 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 2);
      logInfo(`connect(code=500, socketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0205 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0206
     * @tc.name      SerialCommunication_SppPageStateConnect_0206
     * @tc.desc      SppPageState.connect(code=500, socketId=3) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0206 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 3);
      logInfo(`connect(code=500, socketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0206 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0207
     * @tc.name      SerialCommunication_SppPageStateConnect_0207
     * @tc.desc      SppPageState.connect(code=500, socketId=10) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0207 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 10);
      logInfo(`connect(code=500, socketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0207 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0208
     * @tc.name      SerialCommunication_SppPageStateConnect_0208
     * @tc.desc      SppPageState.connect(code=500, socketId=5) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0208 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 5);
      logInfo(`connect(code=500, socketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0208 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0209
     * @tc.name      SerialCommunication_SppPageStateConnect_0209
     * @tc.desc      SppPageState.connect(code=500, socketId=15) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0209 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 15);
      logInfo(`connect(code=500, socketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0209 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0210
     * @tc.name      SerialCommunication_SppPageStateConnect_0210
     * @tc.desc      SppPageState.connect(code=500, socketId=20) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0210 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 20);
      logInfo(`connect(code=500, socketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0210 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0211
     * @tc.name      SerialCommunication_SppPageStateConnect_0211
     * @tc.desc      SppPageState.connect(code=500, socketId=25) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0211 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 25);
      logInfo(`connect(code=500, socketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0211 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0212
     * @tc.name      SerialCommunication_SppPageStateConnect_0212
     * @tc.desc      SppPageState.connect(code=500, socketId=30) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0212 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 30);
      logInfo(`connect(code=500, socketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0212 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0213
     * @tc.name      SerialCommunication_SppPageStateConnect_0213
     * @tc.desc      SppPageState.connect(code=500, socketId=35) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0213 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 35);
      logInfo(`connect(code=500, socketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0213 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0214
     * @tc.name      SerialCommunication_SppPageStateConnect_0214
     * @tc.desc      SppPageState.connect(code=500, socketId=40) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0214 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 40);
      logInfo(`connect(code=500, socketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0214 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0215
     * @tc.name      SerialCommunication_SppPageStateConnect_0215
     * @tc.desc      SppPageState.connect(code=500, socketId=45) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0215 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 45);
      logInfo(`connect(code=500, socketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0215 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0216
     * @tc.name      SerialCommunication_SppPageStateConnect_0216
     * @tc.desc      SppPageState.connect(code=500, socketId=50) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0216 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 50);
      logInfo(`connect(code=500, socketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0216 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0217
     * @tc.name      SerialCommunication_SppPageStateConnect_0217
     * @tc.desc      SppPageState.connect(code=500, socketId=55) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0217 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 55);
      logInfo(`connect(code=500, socketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0217 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0218
     * @tc.name      SerialCommunication_SppPageStateConnect_0218
     * @tc.desc      SppPageState.connect(code=500, socketId=60) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0218 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 60);
      logInfo(`connect(code=500, socketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0218 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0219
     * @tc.name      SerialCommunication_SppPageStateConnect_0219
     * @tc.desc      SppPageState.connect(code=500, socketId=65) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0219 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 65);
      logInfo(`connect(code=500, socketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0219 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0220
     * @tc.name      SerialCommunication_SppPageStateConnect_0220
     * @tc.desc      SppPageState.connect(code=500, socketId=70) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0220 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 70);
      logInfo(`connect(code=500, socketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0220 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0221
     * @tc.name      SerialCommunication_SppPageStateConnect_0221
     * @tc.desc      SppPageState.connect(code=500, socketId=75) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0221 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 75);
      logInfo(`connect(code=500, socketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0221 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0222
     * @tc.name      SerialCommunication_SppPageStateConnect_0222
     * @tc.desc      SppPageState.connect(code=500, socketId=80) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0222 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 80);
      logInfo(`connect(code=500, socketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0222 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0223
     * @tc.name      SerialCommunication_SppPageStateConnect_0223
     * @tc.desc      SppPageState.connect(code=500, socketId=85) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0223 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 85);
      logInfo(`connect(code=500, socketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0223 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0224
     * @tc.name      SerialCommunication_SppPageStateConnect_0224
     * @tc.desc      SppPageState.connect(code=500, socketId=90) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0224 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 90);
      logInfo(`connect(code=500, socketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0224 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0225
     * @tc.name      SerialCommunication_SppPageStateConnect_0225
     * @tc.desc      SppPageState.connect(code=500, socketId=95) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0225 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 95);
      logInfo(`connect(code=500, socketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0225 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0226
     * @tc.name      SerialCommunication_SppPageStateConnect_0226
     * @tc.desc      SppPageState.connect(code=500, socketId=105) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0226 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 105);
      logInfo(`connect(code=500, socketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0226 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0227
     * @tc.name      SerialCommunication_SppPageStateConnect_0227
     * @tc.desc      SppPageState.connect(code=500, socketId=110) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0227 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 110);
      logInfo(`connect(code=500, socketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0227 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0228
     * @tc.name      SerialCommunication_SppPageStateConnect_0228
     * @tc.desc      SppPageState.connect(code=500, socketId=115) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0228 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 115);
      logInfo(`connect(code=500, socketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0228 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0229
     * @tc.name      SerialCommunication_SppPageStateConnect_0229
     * @tc.desc      SppPageState.connect(code=500, socketId=79) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0229 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 79);
      logInfo(`connect(code=500, socketId=79): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=79) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0229 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0230
     * @tc.name      SerialCommunication_SppPageStateConnect_0230
     * @tc.desc      SppPageState.connect(code=500, socketId=-10) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateConnect_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0230 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, -10);
      logInfo(`connect(code=500, socketId=-10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=-10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0230 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0231
     * @tc.name      SerialCommunication_SppPageStateConnect_0231
     * @tc.desc      SppPageState.connect(code=2, socketId=1) yields "sppConnect error, code = 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0231 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(2, 1);
      logInfo(`connect(code=2, socketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 2');
      logInfo(`connect(code=2, socketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 2');
      logInfo(`${BUNDLE}SppPageStateConnect_0231 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0232
     * @tc.name      SerialCommunication_SppPageStateConnect_0232
     * @tc.desc      SppPageState.connect(code=2, socketId=-1) yields "sppConnect error, code = 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0232 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(2, -1);
      logInfo(`connect(code=2, socketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 2');
      logInfo(`connect(code=2, socketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 2');
      logInfo(`${BUNDLE}SppPageStateConnect_0232 end`);
    });
  });
}
