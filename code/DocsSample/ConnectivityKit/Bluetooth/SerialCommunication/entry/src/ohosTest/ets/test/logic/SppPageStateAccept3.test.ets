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

/** Logic checks for SppPageState.accept (73 cases). */
export default function sppPageStateAccept3Test(): void {
  describe('SppPageStateAccept3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0160
     * @tc.name      SerialCommunication_SppPageStateAccept_0160
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=60) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0160 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 60);
      logInfo(`accept(code=401, clientSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0160 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0161
     * @tc.name      SerialCommunication_SppPageStateAccept_0161
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=65) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0161 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 65);
      logInfo(`accept(code=401, clientSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0161 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0162
     * @tc.name      SerialCommunication_SppPageStateAccept_0162
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=70) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0162 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 70);
      logInfo(`accept(code=401, clientSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0162 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0163
     * @tc.name      SerialCommunication_SppPageStateAccept_0163
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=75) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0163 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 75);
      logInfo(`accept(code=401, clientSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0163 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0164
     * @tc.name      SerialCommunication_SppPageStateAccept_0164
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=80) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0164 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 80);
      logInfo(`accept(code=401, clientSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0164 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0165
     * @tc.name      SerialCommunication_SppPageStateAccept_0165
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=85) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0165 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 85);
      logInfo(`accept(code=401, clientSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0165 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0166
     * @tc.name      SerialCommunication_SppPageStateAccept_0166
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=90) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0166 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 90);
      logInfo(`accept(code=401, clientSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0166 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0167
     * @tc.name      SerialCommunication_SppPageStateAccept_0167
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=95) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0167 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 95);
      logInfo(`accept(code=401, clientSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0167 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0168
     * @tc.name      SerialCommunication_SppPageStateAccept_0168
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=105) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0168 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 105);
      logInfo(`accept(code=401, clientSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0168 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0169
     * @tc.name      SerialCommunication_SppPageStateAccept_0169
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=110) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0169 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 110);
      logInfo(`accept(code=401, clientSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0169 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0170
     * @tc.name      SerialCommunication_SppPageStateAccept_0170
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=115) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0170 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 115);
      logInfo(`accept(code=401, clientSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0170 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0171
     * @tc.name      SerialCommunication_SppPageStateAccept_0171
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=93) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0171 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 93);
      logInfo(`accept(code=401, clientSocketId=93): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=93) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0171 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0172
     * @tc.name      SerialCommunication_SppPageStateAccept_0172
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=64.95) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0172 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 64.95);
      logInfo(`accept(code=401, clientSocketId=64.95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=64.95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0172 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0173
     * @tc.name      SerialCommunication_SppPageStateAccept_0173
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=1) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0173 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 1);
      logInfo(`accept(code=404, clientSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0173 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0174
     * @tc.name      SerialCommunication_SppPageStateAccept_0174
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=-1) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0174 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, -1);
      logInfo(`accept(code=404, clientSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0174 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0175
     * @tc.name      SerialCommunication_SppPageStateAccept_0175
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=100) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0175 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 100);
      logInfo(`accept(code=404, clientSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0175 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0176
     * @tc.name      SerialCommunication_SppPageStateAccept_0176
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=2) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0176 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 2);
      logInfo(`accept(code=404, clientSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0176 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0177
     * @tc.name      SerialCommunication_SppPageStateAccept_0177
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=3) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0177 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 3);
      logInfo(`accept(code=404, clientSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0177 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0178
     * @tc.name      SerialCommunication_SppPageStateAccept_0178
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=10) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0178 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 10);
      logInfo(`accept(code=404, clientSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0178 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0179
     * @tc.name      SerialCommunication_SppPageStateAccept_0179
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=5) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0179 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 5);
      logInfo(`accept(code=404, clientSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0179 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0180
     * @tc.name      SerialCommunication_SppPageStateAccept_0180
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=15) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0180 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 15);
      logInfo(`accept(code=404, clientSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0180 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0181
     * @tc.name      SerialCommunication_SppPageStateAccept_0181
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=20) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0181 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 20);
      logInfo(`accept(code=404, clientSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0181 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0182
     * @tc.name      SerialCommunication_SppPageStateAccept_0182
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=25) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0182 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 25);
      logInfo(`accept(code=404, clientSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0182 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0183
     * @tc.name      SerialCommunication_SppPageStateAccept_0183
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=30) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0183 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 30);
      logInfo(`accept(code=404, clientSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0183 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0184
     * @tc.name      SerialCommunication_SppPageStateAccept_0184
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=35) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0184 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 35);
      logInfo(`accept(code=404, clientSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0184 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0185
     * @tc.name      SerialCommunication_SppPageStateAccept_0185
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=40) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0185 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 40);
      logInfo(`accept(code=404, clientSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0185 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0186
     * @tc.name      SerialCommunication_SppPageStateAccept_0186
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=45) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0186 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 45);
      logInfo(`accept(code=404, clientSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0186 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0187
     * @tc.name      SerialCommunication_SppPageStateAccept_0187
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=50) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0187 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 50);
      logInfo(`accept(code=404, clientSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0187 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0188
     * @tc.name      SerialCommunication_SppPageStateAccept_0188
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=55) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0188 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 55);
      logInfo(`accept(code=404, clientSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0188 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0189
     * @tc.name      SerialCommunication_SppPageStateAccept_0189
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=60) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0189 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 60);
      logInfo(`accept(code=404, clientSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0189 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0190
     * @tc.name      SerialCommunication_SppPageStateAccept_0190
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=65) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0190 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 65);
      logInfo(`accept(code=404, clientSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0190 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0191
     * @tc.name      SerialCommunication_SppPageStateAccept_0191
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=70) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0191 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 70);
      logInfo(`accept(code=404, clientSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0191 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0192
     * @tc.name      SerialCommunication_SppPageStateAccept_0192
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=75) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0192 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 75);
      logInfo(`accept(code=404, clientSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0192 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0193
     * @tc.name      SerialCommunication_SppPageStateAccept_0193
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=80) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0193 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 80);
      logInfo(`accept(code=404, clientSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0193 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0194
     * @tc.name      SerialCommunication_SppPageStateAccept_0194
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=85) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0194 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 85);
      logInfo(`accept(code=404, clientSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0194 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0195
     * @tc.name      SerialCommunication_SppPageStateAccept_0195
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=90) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0195 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 90);
      logInfo(`accept(code=404, clientSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0195 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0196
     * @tc.name      SerialCommunication_SppPageStateAccept_0196
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=95) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0196 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 95);
      logInfo(`accept(code=404, clientSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0196 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0197
     * @tc.name      SerialCommunication_SppPageStateAccept_0197
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=105) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0197 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 105);
      logInfo(`accept(code=404, clientSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0197 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0198
     * @tc.name      SerialCommunication_SppPageStateAccept_0198
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=110) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0198 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 110);
      logInfo(`accept(code=404, clientSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0198 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0199
     * @tc.name      SerialCommunication_SppPageStateAccept_0199
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=115) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0199 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 115);
      logInfo(`accept(code=404, clientSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0199 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0200
     * @tc.name      SerialCommunication_SppPageStateAccept_0200
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=93) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0200 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 93);
      logInfo(`accept(code=404, clientSocketId=93): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=93) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0200 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0201
     * @tc.name      SerialCommunication_SppPageStateAccept_0201
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=64.95) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0201 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 64.95);
      logInfo(`accept(code=404, clientSocketId=64.95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=64.95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0201 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0202
     * @tc.name      SerialCommunication_SppPageStateAccept_0202
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=1) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0202 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 1);
      logInfo(`accept(code=500, clientSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0202 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0203
     * @tc.name      SerialCommunication_SppPageStateAccept_0203
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=-1) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0203 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, -1);
      logInfo(`accept(code=500, clientSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0203 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0204
     * @tc.name      SerialCommunication_SppPageStateAccept_0204
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=100) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0204 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 100);
      logInfo(`accept(code=500, clientSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0204 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0205
     * @tc.name      SerialCommunication_SppPageStateAccept_0205
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=2) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0205 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 2);
      logInfo(`accept(code=500, clientSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0205 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0206
     * @tc.name      SerialCommunication_SppPageStateAccept_0206
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=3) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0206 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 3);
      logInfo(`accept(code=500, clientSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0206 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0207
     * @tc.name      SerialCommunication_SppPageStateAccept_0207
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=10) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0207 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 10);
      logInfo(`accept(code=500, clientSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0207 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0208
     * @tc.name      SerialCommunication_SppPageStateAccept_0208
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=5) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0208 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 5);
      logInfo(`accept(code=500, clientSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0208 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0209
     * @tc.name      SerialCommunication_SppPageStateAccept_0209
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=15) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0209 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 15);
      logInfo(`accept(code=500, clientSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0209 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0210
     * @tc.name      SerialCommunication_SppPageStateAccept_0210
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=20) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0210 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 20);
      logInfo(`accept(code=500, clientSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0210 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0211
     * @tc.name      SerialCommunication_SppPageStateAccept_0211
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=25) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0211 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 25);
      logInfo(`accept(code=500, clientSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0211 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0212
     * @tc.name      SerialCommunication_SppPageStateAccept_0212
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=30) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0212 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 30);
      logInfo(`accept(code=500, clientSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0212 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0213
     * @tc.name      SerialCommunication_SppPageStateAccept_0213
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=35) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0213 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 35);
      logInfo(`accept(code=500, clientSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0213 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0214
     * @tc.name      SerialCommunication_SppPageStateAccept_0214
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=40) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0214 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 40);
      logInfo(`accept(code=500, clientSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0214 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0215
     * @tc.name      SerialCommunication_SppPageStateAccept_0215
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=45) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0215 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 45);
      logInfo(`accept(code=500, clientSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0215 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0216
     * @tc.name      SerialCommunication_SppPageStateAccept_0216
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=50) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0216 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 50);
      logInfo(`accept(code=500, clientSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0216 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0217
     * @tc.name      SerialCommunication_SppPageStateAccept_0217
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=55) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0217 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 55);
      logInfo(`accept(code=500, clientSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0217 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0218
     * @tc.name      SerialCommunication_SppPageStateAccept_0218
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=60) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0218 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 60);
      logInfo(`accept(code=500, clientSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0218 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0219
     * @tc.name      SerialCommunication_SppPageStateAccept_0219
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=65) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0219 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 65);
      logInfo(`accept(code=500, clientSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0219 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0220
     * @tc.name      SerialCommunication_SppPageStateAccept_0220
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=70) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0220 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 70);
      logInfo(`accept(code=500, clientSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0220 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0221
     * @tc.name      SerialCommunication_SppPageStateAccept_0221
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=75) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0221 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 75);
      logInfo(`accept(code=500, clientSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0221 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0222
     * @tc.name      SerialCommunication_SppPageStateAccept_0222
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=80) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0222 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 80);
      logInfo(`accept(code=500, clientSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0222 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0223
     * @tc.name      SerialCommunication_SppPageStateAccept_0223
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=85) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0223 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 85);
      logInfo(`accept(code=500, clientSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0223 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0224
     * @tc.name      SerialCommunication_SppPageStateAccept_0224
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=90) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0224 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 90);
      logInfo(`accept(code=500, clientSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0224 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0225
     * @tc.name      SerialCommunication_SppPageStateAccept_0225
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=95) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0225 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 95);
      logInfo(`accept(code=500, clientSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0225 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0226
     * @tc.name      SerialCommunication_SppPageStateAccept_0226
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=105) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0226 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 105);
      logInfo(`accept(code=500, clientSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0226 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0227
     * @tc.name      SerialCommunication_SppPageStateAccept_0227
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=110) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0227 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 110);
      logInfo(`accept(code=500, clientSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0227 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0228
     * @tc.name      SerialCommunication_SppPageStateAccept_0228
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=115) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0228 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 115);
      logInfo(`accept(code=500, clientSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0228 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0229
     * @tc.name      SerialCommunication_SppPageStateAccept_0229
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=93) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0229 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 93);
      logInfo(`accept(code=500, clientSocketId=93): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=93) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0229 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0230
     * @tc.name      SerialCommunication_SppPageStateAccept_0230
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=64.95) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0230 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 64.95);
      logInfo(`accept(code=500, clientSocketId=64.95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=64.95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0230 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0231
     * @tc.name      SerialCommunication_SppPageStateAccept_0231
     * @tc.desc      SppPageState.accept(code=2, clientSocketId=1) yields "sppAccept error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0231 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(2, 1);
      logInfo(`accept(code=2, clientSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 2');
      logInfo(`accept(code=2, clientSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 2');
      logInfo(`${BUNDLE}SppPageStateAccept_0231 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0232
     * @tc.name      SerialCommunication_SppPageStateAccept_0232
     * @tc.desc      SppPageState.accept(code=2, clientSocketId=-1) yields "sppAccept error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0232 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(2, -1);
      logInfo(`accept(code=2, clientSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 2');
      logInfo(`accept(code=2, clientSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 2');
      logInfo(`${BUNDLE}SppPageStateAccept_0232 end`);
    });
  });
}
