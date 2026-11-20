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

/** Logic checks for SppPageState.listen (74 cases). */
export default function sppPageStateListen3Test(): void {
  describe('SppPageStateListen3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0160
     * @tc.name      SerialCommunication_SppPageStateListen_0160
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=60) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0160 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 60);
      logInfo(`listen(code=401, serverSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0160 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0161
     * @tc.name      SerialCommunication_SppPageStateListen_0161
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=65) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0161 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 65);
      logInfo(`listen(code=401, serverSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0161 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0162
     * @tc.name      SerialCommunication_SppPageStateListen_0162
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=70) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0162 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 70);
      logInfo(`listen(code=401, serverSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0162 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0163
     * @tc.name      SerialCommunication_SppPageStateListen_0163
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=75) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0163 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 75);
      logInfo(`listen(code=401, serverSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0163 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0164
     * @tc.name      SerialCommunication_SppPageStateListen_0164
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=80) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0164 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 80);
      logInfo(`listen(code=401, serverSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0164 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0165
     * @tc.name      SerialCommunication_SppPageStateListen_0165
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=85) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0165 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 85);
      logInfo(`listen(code=401, serverSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0165 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0166
     * @tc.name      SerialCommunication_SppPageStateListen_0166
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=90) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0166 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 90);
      logInfo(`listen(code=401, serverSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0166 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0167
     * @tc.name      SerialCommunication_SppPageStateListen_0167
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=95) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0167 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 95);
      logInfo(`listen(code=401, serverSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0167 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0168
     * @tc.name      SerialCommunication_SppPageStateListen_0168
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=105) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0168 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 105);
      logInfo(`listen(code=401, serverSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0168 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0169
     * @tc.name      SerialCommunication_SppPageStateListen_0169
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=110) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0169 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 110);
      logInfo(`listen(code=401, serverSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0169 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0170
     * @tc.name      SerialCommunication_SppPageStateListen_0170
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=115) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0170 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 115);
      logInfo(`listen(code=401, serverSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0170 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0171
     * @tc.name      SerialCommunication_SppPageStateListen_0171
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=44.34) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0171 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 44.34);
      logInfo(`listen(code=401, serverSocketId=44.34): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=44.34) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0171 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0172
     * @tc.name      SerialCommunication_SppPageStateListen_0172
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=-14) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateListen_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0172 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, -14);
      logInfo(`listen(code=401, serverSocketId=-14): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=-14) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0172 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0173
     * @tc.name      SerialCommunication_SppPageStateListen_0173
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=1) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0173 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 1);
      logInfo(`listen(code=404, serverSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0173 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0174
     * @tc.name      SerialCommunication_SppPageStateListen_0174
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=-1) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0174 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, -1);
      logInfo(`listen(code=404, serverSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0174 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0175
     * @tc.name      SerialCommunication_SppPageStateListen_0175
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=100) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0175 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 100);
      logInfo(`listen(code=404, serverSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0175 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0176
     * @tc.name      SerialCommunication_SppPageStateListen_0176
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=2) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0176 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 2);
      logInfo(`listen(code=404, serverSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0176 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0177
     * @tc.name      SerialCommunication_SppPageStateListen_0177
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=3) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0177 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 3);
      logInfo(`listen(code=404, serverSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0177 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0178
     * @tc.name      SerialCommunication_SppPageStateListen_0178
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=10) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0178 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 10);
      logInfo(`listen(code=404, serverSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0178 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0179
     * @tc.name      SerialCommunication_SppPageStateListen_0179
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=5) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0179 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 5);
      logInfo(`listen(code=404, serverSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0179 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0180
     * @tc.name      SerialCommunication_SppPageStateListen_0180
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=15) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0180 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 15);
      logInfo(`listen(code=404, serverSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0180 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0181
     * @tc.name      SerialCommunication_SppPageStateListen_0181
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=20) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0181 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 20);
      logInfo(`listen(code=404, serverSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0181 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0182
     * @tc.name      SerialCommunication_SppPageStateListen_0182
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=25) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0182 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 25);
      logInfo(`listen(code=404, serverSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0182 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0183
     * @tc.name      SerialCommunication_SppPageStateListen_0183
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=30) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0183 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 30);
      logInfo(`listen(code=404, serverSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0183 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0184
     * @tc.name      SerialCommunication_SppPageStateListen_0184
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=35) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0184 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 35);
      logInfo(`listen(code=404, serverSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0184 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0185
     * @tc.name      SerialCommunication_SppPageStateListen_0185
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=40) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0185 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 40);
      logInfo(`listen(code=404, serverSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0185 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0186
     * @tc.name      SerialCommunication_SppPageStateListen_0186
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=45) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0186 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 45);
      logInfo(`listen(code=404, serverSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0186 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0187
     * @tc.name      SerialCommunication_SppPageStateListen_0187
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=50) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0187 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 50);
      logInfo(`listen(code=404, serverSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0187 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0188
     * @tc.name      SerialCommunication_SppPageStateListen_0188
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=55) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0188 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 55);
      logInfo(`listen(code=404, serverSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0188 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0189
     * @tc.name      SerialCommunication_SppPageStateListen_0189
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=60) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0189 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 60);
      logInfo(`listen(code=404, serverSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0189 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0190
     * @tc.name      SerialCommunication_SppPageStateListen_0190
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=65) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0190 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 65);
      logInfo(`listen(code=404, serverSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0190 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0191
     * @tc.name      SerialCommunication_SppPageStateListen_0191
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=70) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0191 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 70);
      logInfo(`listen(code=404, serverSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0191 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0192
     * @tc.name      SerialCommunication_SppPageStateListen_0192
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=75) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0192 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 75);
      logInfo(`listen(code=404, serverSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0192 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0193
     * @tc.name      SerialCommunication_SppPageStateListen_0193
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=80) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0193 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 80);
      logInfo(`listen(code=404, serverSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0193 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0194
     * @tc.name      SerialCommunication_SppPageStateListen_0194
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=85) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0194 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 85);
      logInfo(`listen(code=404, serverSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0194 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0195
     * @tc.name      SerialCommunication_SppPageStateListen_0195
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=90) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0195 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 90);
      logInfo(`listen(code=404, serverSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0195 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0196
     * @tc.name      SerialCommunication_SppPageStateListen_0196
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=95) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0196 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 95);
      logInfo(`listen(code=404, serverSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0196 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0197
     * @tc.name      SerialCommunication_SppPageStateListen_0197
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=105) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0197 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 105);
      logInfo(`listen(code=404, serverSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0197 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0198
     * @tc.name      SerialCommunication_SppPageStateListen_0198
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=110) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0198 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 110);
      logInfo(`listen(code=404, serverSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0198 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0199
     * @tc.name      SerialCommunication_SppPageStateListen_0199
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=115) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0199 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 115);
      logInfo(`listen(code=404, serverSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0199 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0200
     * @tc.name      SerialCommunication_SppPageStateListen_0200
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=44.34) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0200 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 44.34);
      logInfo(`listen(code=404, serverSocketId=44.34): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=44.34) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0200 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0201
     * @tc.name      SerialCommunication_SppPageStateListen_0201
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=-14) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateListen_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0201 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, -14);
      logInfo(`listen(code=404, serverSocketId=-14): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=-14) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0201 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0202
     * @tc.name      SerialCommunication_SppPageStateListen_0202
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=1) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0202 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 1);
      logInfo(`listen(code=500, serverSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0202 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0203
     * @tc.name      SerialCommunication_SppPageStateListen_0203
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=-1) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0203 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, -1);
      logInfo(`listen(code=500, serverSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0203 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0204
     * @tc.name      SerialCommunication_SppPageStateListen_0204
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=100) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0204 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 100);
      logInfo(`listen(code=500, serverSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0204 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0205
     * @tc.name      SerialCommunication_SppPageStateListen_0205
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=2) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0205 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 2);
      logInfo(`listen(code=500, serverSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0205 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0206
     * @tc.name      SerialCommunication_SppPageStateListen_0206
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=3) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0206 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 3);
      logInfo(`listen(code=500, serverSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0206 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0207
     * @tc.name      SerialCommunication_SppPageStateListen_0207
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=10) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0207 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 10);
      logInfo(`listen(code=500, serverSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0207 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0208
     * @tc.name      SerialCommunication_SppPageStateListen_0208
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=5) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0208 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 5);
      logInfo(`listen(code=500, serverSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0208 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0209
     * @tc.name      SerialCommunication_SppPageStateListen_0209
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=15) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0209 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 15);
      logInfo(`listen(code=500, serverSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0209 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0210
     * @tc.name      SerialCommunication_SppPageStateListen_0210
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=20) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0210 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 20);
      logInfo(`listen(code=500, serverSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0210 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0211
     * @tc.name      SerialCommunication_SppPageStateListen_0211
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=25) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0211 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 25);
      logInfo(`listen(code=500, serverSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0211 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0212
     * @tc.name      SerialCommunication_SppPageStateListen_0212
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=30) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0212 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 30);
      logInfo(`listen(code=500, serverSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0212 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0213
     * @tc.name      SerialCommunication_SppPageStateListen_0213
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=35) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0213 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 35);
      logInfo(`listen(code=500, serverSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0213 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0214
     * @tc.name      SerialCommunication_SppPageStateListen_0214
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=40) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0214 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 40);
      logInfo(`listen(code=500, serverSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0214 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0215
     * @tc.name      SerialCommunication_SppPageStateListen_0215
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=45) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0215 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 45);
      logInfo(`listen(code=500, serverSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0215 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0216
     * @tc.name      SerialCommunication_SppPageStateListen_0216
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=50) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0216 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 50);
      logInfo(`listen(code=500, serverSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0216 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0217
     * @tc.name      SerialCommunication_SppPageStateListen_0217
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=55) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0217 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 55);
      logInfo(`listen(code=500, serverSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0217 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0218
     * @tc.name      SerialCommunication_SppPageStateListen_0218
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=60) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0218 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 60);
      logInfo(`listen(code=500, serverSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0218 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0219
     * @tc.name      SerialCommunication_SppPageStateListen_0219
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=65) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0219 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 65);
      logInfo(`listen(code=500, serverSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0219 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0220
     * @tc.name      SerialCommunication_SppPageStateListen_0220
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=70) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0220 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 70);
      logInfo(`listen(code=500, serverSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0220 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0221
     * @tc.name      SerialCommunication_SppPageStateListen_0221
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=75) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0221 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 75);
      logInfo(`listen(code=500, serverSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0221 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0222
     * @tc.name      SerialCommunication_SppPageStateListen_0222
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=80) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0222 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 80);
      logInfo(`listen(code=500, serverSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0222 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0223
     * @tc.name      SerialCommunication_SppPageStateListen_0223
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=85) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0223 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 85);
      logInfo(`listen(code=500, serverSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0223 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0224
     * @tc.name      SerialCommunication_SppPageStateListen_0224
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=90) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0224 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 90);
      logInfo(`listen(code=500, serverSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0224 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0225
     * @tc.name      SerialCommunication_SppPageStateListen_0225
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=95) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0225 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 95);
      logInfo(`listen(code=500, serverSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0225 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0226
     * @tc.name      SerialCommunication_SppPageStateListen_0226
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=105) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0226 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 105);
      logInfo(`listen(code=500, serverSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0226 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0227
     * @tc.name      SerialCommunication_SppPageStateListen_0227
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=110) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0227 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 110);
      logInfo(`listen(code=500, serverSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0227 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0228
     * @tc.name      SerialCommunication_SppPageStateListen_0228
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=115) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0228 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 115);
      logInfo(`listen(code=500, serverSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0228 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0229
     * @tc.name      SerialCommunication_SppPageStateListen_0229
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=44.34) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0229 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 44.34);
      logInfo(`listen(code=500, serverSocketId=44.34): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=44.34) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0229 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0230
     * @tc.name      SerialCommunication_SppPageStateListen_0230
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=-14) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateListen_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0230 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, -14);
      logInfo(`listen(code=500, serverSocketId=-14): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=-14) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0230 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0231
     * @tc.name      SerialCommunication_SppPageStateListen_0231
     * @tc.desc      SppPageState.listen(code=2, serverSocketId=1) yields "sppListen error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0231 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(2, 1);
      logInfo(`listen(code=2, serverSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 2');
      logInfo(`listen(code=2, serverSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 2');
      logInfo(`${BUNDLE}SppPageStateListen_0231 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0232
     * @tc.name      SerialCommunication_SppPageStateListen_0232
     * @tc.desc      SppPageState.listen(code=2, serverSocketId=-1) yields "sppListen error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0232 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(2, -1);
      logInfo(`listen(code=2, serverSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 2');
      logInfo(`listen(code=2, serverSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 2');
      logInfo(`${BUNDLE}SppPageStateListen_0232 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0233
     * @tc.name      SerialCommunication_SppPageStateListen_0233
     * @tc.desc      SppPageState.listen(code=2, serverSocketId=100) yields "sppListen error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0233 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(2, 100);
      logInfo(`listen(code=2, serverSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 2');
      logInfo(`listen(code=2, serverSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 2');
      logInfo(`${BUNDLE}SppPageStateListen_0233 end`);
    });
  });
}
