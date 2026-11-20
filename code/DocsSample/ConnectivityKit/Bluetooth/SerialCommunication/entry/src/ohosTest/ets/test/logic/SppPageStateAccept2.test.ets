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

/** Logic checks for SppPageState.accept (81 cases). */
export default function sppPageStateAccept2Test(): void {
  describe('SppPageStateAccept2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0079
     * @tc.name      SerialCommunication_SppPageStateAccept_0079
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=90) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0079 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 90);
      logInfo(`accept(code=200, clientSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0080
     * @tc.name      SerialCommunication_SppPageStateAccept_0080
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=95) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0080 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 95);
      logInfo(`accept(code=200, clientSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0081
     * @tc.name      SerialCommunication_SppPageStateAccept_0081
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=105) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0081 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 105);
      logInfo(`accept(code=200, clientSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0082
     * @tc.name      SerialCommunication_SppPageStateAccept_0082
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=110) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0082 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 110);
      logInfo(`accept(code=200, clientSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0083
     * @tc.name      SerialCommunication_SppPageStateAccept_0083
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=115) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0083 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 115);
      logInfo(`accept(code=200, clientSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0084
     * @tc.name      SerialCommunication_SppPageStateAccept_0084
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=93) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0084 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 93);
      logInfo(`accept(code=200, clientSocketId=93): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=93) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0085
     * @tc.name      SerialCommunication_SppPageStateAccept_0085
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=64.95) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0085 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 64.95);
      logInfo(`accept(code=200, clientSocketId=64.95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=64.95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0086
     * @tc.name      SerialCommunication_SppPageStateAccept_0086
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=1) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0086 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 1);
      logInfo(`accept(code=-1, clientSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0087
     * @tc.name      SerialCommunication_SppPageStateAccept_0087
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=-1) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0087 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, -1);
      logInfo(`accept(code=-1, clientSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0088
     * @tc.name      SerialCommunication_SppPageStateAccept_0088
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=100) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0088 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 100);
      logInfo(`accept(code=-1, clientSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0089
     * @tc.name      SerialCommunication_SppPageStateAccept_0089
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=2) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0089 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 2);
      logInfo(`accept(code=-1, clientSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0090
     * @tc.name      SerialCommunication_SppPageStateAccept_0090
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=3) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0090 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 3);
      logInfo(`accept(code=-1, clientSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0090 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0091
     * @tc.name      SerialCommunication_SppPageStateAccept_0091
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=10) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0091 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 10);
      logInfo(`accept(code=-1, clientSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0091 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0092
     * @tc.name      SerialCommunication_SppPageStateAccept_0092
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=5) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0092 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 5);
      logInfo(`accept(code=-1, clientSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0092 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0093
     * @tc.name      SerialCommunication_SppPageStateAccept_0093
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=15) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0093 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 15);
      logInfo(`accept(code=-1, clientSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0093 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0094
     * @tc.name      SerialCommunication_SppPageStateAccept_0094
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=20) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0094 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 20);
      logInfo(`accept(code=-1, clientSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0094 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0095
     * @tc.name      SerialCommunication_SppPageStateAccept_0095
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=25) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0095 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 25);
      logInfo(`accept(code=-1, clientSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0095 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0096
     * @tc.name      SerialCommunication_SppPageStateAccept_0096
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=30) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0096 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 30);
      logInfo(`accept(code=-1, clientSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0096 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0097
     * @tc.name      SerialCommunication_SppPageStateAccept_0097
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=35) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0097 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 35);
      logInfo(`accept(code=-1, clientSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0097 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0098
     * @tc.name      SerialCommunication_SppPageStateAccept_0098
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=40) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0098 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 40);
      logInfo(`accept(code=-1, clientSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0098 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0099
     * @tc.name      SerialCommunication_SppPageStateAccept_0099
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=45) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0099 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 45);
      logInfo(`accept(code=-1, clientSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0099 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0100
     * @tc.name      SerialCommunication_SppPageStateAccept_0100
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=50) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0100 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 50);
      logInfo(`accept(code=-1, clientSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0100 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0101
     * @tc.name      SerialCommunication_SppPageStateAccept_0101
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=55) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0101 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 55);
      logInfo(`accept(code=-1, clientSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0101 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0102
     * @tc.name      SerialCommunication_SppPageStateAccept_0102
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=60) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0102 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 60);
      logInfo(`accept(code=-1, clientSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0102 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0103
     * @tc.name      SerialCommunication_SppPageStateAccept_0103
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=65) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0103 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 65);
      logInfo(`accept(code=-1, clientSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0103 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0104
     * @tc.name      SerialCommunication_SppPageStateAccept_0104
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=70) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0104 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 70);
      logInfo(`accept(code=-1, clientSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0104 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0105
     * @tc.name      SerialCommunication_SppPageStateAccept_0105
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=75) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0105 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 75);
      logInfo(`accept(code=-1, clientSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0105 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0106
     * @tc.name      SerialCommunication_SppPageStateAccept_0106
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=80) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0106 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 80);
      logInfo(`accept(code=-1, clientSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0106 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0107
     * @tc.name      SerialCommunication_SppPageStateAccept_0107
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=85) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0107 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 85);
      logInfo(`accept(code=-1, clientSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0107 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0108
     * @tc.name      SerialCommunication_SppPageStateAccept_0108
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=90) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0108 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 90);
      logInfo(`accept(code=-1, clientSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0108 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0109
     * @tc.name      SerialCommunication_SppPageStateAccept_0109
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=95) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0109 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 95);
      logInfo(`accept(code=-1, clientSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0109 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0110
     * @tc.name      SerialCommunication_SppPageStateAccept_0110
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=105) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0110 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 105);
      logInfo(`accept(code=-1, clientSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0110 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0111
     * @tc.name      SerialCommunication_SppPageStateAccept_0111
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=110) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0111 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 110);
      logInfo(`accept(code=-1, clientSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0111 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0112
     * @tc.name      SerialCommunication_SppPageStateAccept_0112
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=115) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0112 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 115);
      logInfo(`accept(code=-1, clientSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0112 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0113
     * @tc.name      SerialCommunication_SppPageStateAccept_0113
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=93) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0113 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 93);
      logInfo(`accept(code=-1, clientSocketId=93): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=93) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0113 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0114
     * @tc.name      SerialCommunication_SppPageStateAccept_0114
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=64.95) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0114 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 64.95);
      logInfo(`accept(code=-1, clientSocketId=64.95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=64.95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0114 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0115
     * @tc.name      SerialCommunication_SppPageStateAccept_0115
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=1) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0115 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 1);
      logInfo(`accept(code=1, clientSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0115 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0116
     * @tc.name      SerialCommunication_SppPageStateAccept_0116
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=-1) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0116 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, -1);
      logInfo(`accept(code=1, clientSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0116 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0117
     * @tc.name      SerialCommunication_SppPageStateAccept_0117
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=100) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0117 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 100);
      logInfo(`accept(code=1, clientSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0117 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0118
     * @tc.name      SerialCommunication_SppPageStateAccept_0118
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=2) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0118 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 2);
      logInfo(`accept(code=1, clientSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0118 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0119
     * @tc.name      SerialCommunication_SppPageStateAccept_0119
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=3) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0119 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 3);
      logInfo(`accept(code=1, clientSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0119 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0120
     * @tc.name      SerialCommunication_SppPageStateAccept_0120
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=10) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0120 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 10);
      logInfo(`accept(code=1, clientSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0120 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0121
     * @tc.name      SerialCommunication_SppPageStateAccept_0121
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=5) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0121 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 5);
      logInfo(`accept(code=1, clientSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0121 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0122
     * @tc.name      SerialCommunication_SppPageStateAccept_0122
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=15) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0122 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 15);
      logInfo(`accept(code=1, clientSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0122 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0123
     * @tc.name      SerialCommunication_SppPageStateAccept_0123
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=20) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0123 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 20);
      logInfo(`accept(code=1, clientSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0123 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0124
     * @tc.name      SerialCommunication_SppPageStateAccept_0124
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=25) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0124 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 25);
      logInfo(`accept(code=1, clientSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0124 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0125
     * @tc.name      SerialCommunication_SppPageStateAccept_0125
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=30) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0125 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 30);
      logInfo(`accept(code=1, clientSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0125 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0126
     * @tc.name      SerialCommunication_SppPageStateAccept_0126
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=35) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0126 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 35);
      logInfo(`accept(code=1, clientSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0126 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0127
     * @tc.name      SerialCommunication_SppPageStateAccept_0127
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=40) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0127 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 40);
      logInfo(`accept(code=1, clientSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0127 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0128
     * @tc.name      SerialCommunication_SppPageStateAccept_0128
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=45) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0128 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 45);
      logInfo(`accept(code=1, clientSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0128 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0129
     * @tc.name      SerialCommunication_SppPageStateAccept_0129
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=50) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0129 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 50);
      logInfo(`accept(code=1, clientSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0129 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0130
     * @tc.name      SerialCommunication_SppPageStateAccept_0130
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=55) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0130 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 55);
      logInfo(`accept(code=1, clientSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0130 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0131
     * @tc.name      SerialCommunication_SppPageStateAccept_0131
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=60) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0131 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 60);
      logInfo(`accept(code=1, clientSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0131 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0132
     * @tc.name      SerialCommunication_SppPageStateAccept_0132
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=65) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0132 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 65);
      logInfo(`accept(code=1, clientSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0132 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0133
     * @tc.name      SerialCommunication_SppPageStateAccept_0133
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=70) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0133 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 70);
      logInfo(`accept(code=1, clientSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0133 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0134
     * @tc.name      SerialCommunication_SppPageStateAccept_0134
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=75) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0134 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 75);
      logInfo(`accept(code=1, clientSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0134 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0135
     * @tc.name      SerialCommunication_SppPageStateAccept_0135
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=80) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0135 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 80);
      logInfo(`accept(code=1, clientSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0135 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0136
     * @tc.name      SerialCommunication_SppPageStateAccept_0136
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=85) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0136 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 85);
      logInfo(`accept(code=1, clientSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0136 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0137
     * @tc.name      SerialCommunication_SppPageStateAccept_0137
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=90) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0137 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 90);
      logInfo(`accept(code=1, clientSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0137 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0138
     * @tc.name      SerialCommunication_SppPageStateAccept_0138
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=95) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0138 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 95);
      logInfo(`accept(code=1, clientSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0138 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0139
     * @tc.name      SerialCommunication_SppPageStateAccept_0139
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=105) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0139 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 105);
      logInfo(`accept(code=1, clientSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0139 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0140
     * @tc.name      SerialCommunication_SppPageStateAccept_0140
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=110) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0140 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 110);
      logInfo(`accept(code=1, clientSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0140 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0141
     * @tc.name      SerialCommunication_SppPageStateAccept_0141
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=115) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0141 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 115);
      logInfo(`accept(code=1, clientSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0141 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0142
     * @tc.name      SerialCommunication_SppPageStateAccept_0142
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=93) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0142 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 93);
      logInfo(`accept(code=1, clientSocketId=93): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=93) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0142 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0143
     * @tc.name      SerialCommunication_SppPageStateAccept_0143
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=64.95) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0143 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 64.95);
      logInfo(`accept(code=1, clientSocketId=64.95): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=64.95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0143 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0144
     * @tc.name      SerialCommunication_SppPageStateAccept_0144
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=1) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0144 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 1);
      logInfo(`accept(code=401, clientSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0144 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0145
     * @tc.name      SerialCommunication_SppPageStateAccept_0145
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=-1) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0145 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, -1);
      logInfo(`accept(code=401, clientSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0145 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0146
     * @tc.name      SerialCommunication_SppPageStateAccept_0146
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=100) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0146 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 100);
      logInfo(`accept(code=401, clientSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0146 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0147
     * @tc.name      SerialCommunication_SppPageStateAccept_0147
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=2) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0147 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 2);
      logInfo(`accept(code=401, clientSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0147 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0148
     * @tc.name      SerialCommunication_SppPageStateAccept_0148
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=3) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0148 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 3);
      logInfo(`accept(code=401, clientSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0148 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0149
     * @tc.name      SerialCommunication_SppPageStateAccept_0149
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=10) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0149 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 10);
      logInfo(`accept(code=401, clientSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0149 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0150
     * @tc.name      SerialCommunication_SppPageStateAccept_0150
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=5) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0150 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 5);
      logInfo(`accept(code=401, clientSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0150 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0151
     * @tc.name      SerialCommunication_SppPageStateAccept_0151
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=15) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0151 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 15);
      logInfo(`accept(code=401, clientSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0151 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0152
     * @tc.name      SerialCommunication_SppPageStateAccept_0152
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=20) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0152 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 20);
      logInfo(`accept(code=401, clientSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0152 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0153
     * @tc.name      SerialCommunication_SppPageStateAccept_0153
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=25) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0153 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 25);
      logInfo(`accept(code=401, clientSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0153 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0154
     * @tc.name      SerialCommunication_SppPageStateAccept_0154
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=30) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0154 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 30);
      logInfo(`accept(code=401, clientSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0154 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0155
     * @tc.name      SerialCommunication_SppPageStateAccept_0155
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=35) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0155 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 35);
      logInfo(`accept(code=401, clientSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0155 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0156
     * @tc.name      SerialCommunication_SppPageStateAccept_0156
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=40) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0156 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 40);
      logInfo(`accept(code=401, clientSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0156 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0157
     * @tc.name      SerialCommunication_SppPageStateAccept_0157
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=45) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0157 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 45);
      logInfo(`accept(code=401, clientSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0157 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0158
     * @tc.name      SerialCommunication_SppPageStateAccept_0158
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=50) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0158 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 50);
      logInfo(`accept(code=401, clientSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0158 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0159
     * @tc.name      SerialCommunication_SppPageStateAccept_0159
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=55) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0159 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 55);
      logInfo(`accept(code=401, clientSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0159 end`);
    });
  });
}
