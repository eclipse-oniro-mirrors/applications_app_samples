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

/** Logic checks for SppPageState.connect (81 cases). */
export default function sppPageStateConnect2Test(): void {
  describe('SppPageStateConnect2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0082
     * @tc.name      SerialCommunication_SppPageStateConnect_0082
     * @tc.desc      SppPageState.connect(code=200, socketId=110) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0082 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 110);
      logInfo(`connect(code=200, socketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0083
     * @tc.name      SerialCommunication_SppPageStateConnect_0083
     * @tc.desc      SppPageState.connect(code=200, socketId=115) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0083 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 115);
      logInfo(`connect(code=200, socketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0084
     * @tc.name      SerialCommunication_SppPageStateConnect_0084
     * @tc.desc      SppPageState.connect(code=200, socketId=79) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0084 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 79);
      logInfo(`connect(code=200, socketId=79): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=79) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0085
     * @tc.name      SerialCommunication_SppPageStateConnect_0085
     * @tc.desc      SppPageState.connect(code=200, socketId=-10) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateConnect_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0085 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, -10);
      logInfo(`connect(code=200, socketId=-10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=-10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0086
     * @tc.name      SerialCommunication_SppPageStateConnect_0086
     * @tc.desc      SppPageState.connect(code=-1, socketId=1) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0086 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 1);
      logInfo(`connect(code=-1, socketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0087
     * @tc.name      SerialCommunication_SppPageStateConnect_0087
     * @tc.desc      SppPageState.connect(code=-1, socketId=-1) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0087 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, -1);
      logInfo(`connect(code=-1, socketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0088
     * @tc.name      SerialCommunication_SppPageStateConnect_0088
     * @tc.desc      SppPageState.connect(code=-1, socketId=100) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0088 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 100);
      logInfo(`connect(code=-1, socketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0089
     * @tc.name      SerialCommunication_SppPageStateConnect_0089
     * @tc.desc      SppPageState.connect(code=-1, socketId=2) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0089 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 2);
      logInfo(`connect(code=-1, socketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0090
     * @tc.name      SerialCommunication_SppPageStateConnect_0090
     * @tc.desc      SppPageState.connect(code=-1, socketId=3) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0090 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 3);
      logInfo(`connect(code=-1, socketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0090 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0091
     * @tc.name      SerialCommunication_SppPageStateConnect_0091
     * @tc.desc      SppPageState.connect(code=-1, socketId=10) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0091 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 10);
      logInfo(`connect(code=-1, socketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0091 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0092
     * @tc.name      SerialCommunication_SppPageStateConnect_0092
     * @tc.desc      SppPageState.connect(code=-1, socketId=5) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0092 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 5);
      logInfo(`connect(code=-1, socketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0092 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0093
     * @tc.name      SerialCommunication_SppPageStateConnect_0093
     * @tc.desc      SppPageState.connect(code=-1, socketId=15) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0093 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 15);
      logInfo(`connect(code=-1, socketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0093 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0094
     * @tc.name      SerialCommunication_SppPageStateConnect_0094
     * @tc.desc      SppPageState.connect(code=-1, socketId=20) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0094 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 20);
      logInfo(`connect(code=-1, socketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0094 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0095
     * @tc.name      SerialCommunication_SppPageStateConnect_0095
     * @tc.desc      SppPageState.connect(code=-1, socketId=25) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0095 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 25);
      logInfo(`connect(code=-1, socketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0095 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0096
     * @tc.name      SerialCommunication_SppPageStateConnect_0096
     * @tc.desc      SppPageState.connect(code=-1, socketId=30) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0096 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 30);
      logInfo(`connect(code=-1, socketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0096 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0097
     * @tc.name      SerialCommunication_SppPageStateConnect_0097
     * @tc.desc      SppPageState.connect(code=-1, socketId=35) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0097 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 35);
      logInfo(`connect(code=-1, socketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0097 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0098
     * @tc.name      SerialCommunication_SppPageStateConnect_0098
     * @tc.desc      SppPageState.connect(code=-1, socketId=40) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0098 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 40);
      logInfo(`connect(code=-1, socketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0098 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0099
     * @tc.name      SerialCommunication_SppPageStateConnect_0099
     * @tc.desc      SppPageState.connect(code=-1, socketId=45) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0099 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 45);
      logInfo(`connect(code=-1, socketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0099 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0100
     * @tc.name      SerialCommunication_SppPageStateConnect_0100
     * @tc.desc      SppPageState.connect(code=-1, socketId=50) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0100 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 50);
      logInfo(`connect(code=-1, socketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0100 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0101
     * @tc.name      SerialCommunication_SppPageStateConnect_0101
     * @tc.desc      SppPageState.connect(code=-1, socketId=55) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0101 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 55);
      logInfo(`connect(code=-1, socketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0101 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0102
     * @tc.name      SerialCommunication_SppPageStateConnect_0102
     * @tc.desc      SppPageState.connect(code=-1, socketId=60) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0102 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 60);
      logInfo(`connect(code=-1, socketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0102 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0103
     * @tc.name      SerialCommunication_SppPageStateConnect_0103
     * @tc.desc      SppPageState.connect(code=-1, socketId=65) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0103 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 65);
      logInfo(`connect(code=-1, socketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0103 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0104
     * @tc.name      SerialCommunication_SppPageStateConnect_0104
     * @tc.desc      SppPageState.connect(code=-1, socketId=70) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0104 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 70);
      logInfo(`connect(code=-1, socketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0104 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0105
     * @tc.name      SerialCommunication_SppPageStateConnect_0105
     * @tc.desc      SppPageState.connect(code=-1, socketId=75) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0105 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 75);
      logInfo(`connect(code=-1, socketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0105 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0106
     * @tc.name      SerialCommunication_SppPageStateConnect_0106
     * @tc.desc      SppPageState.connect(code=-1, socketId=80) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0106 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 80);
      logInfo(`connect(code=-1, socketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0106 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0107
     * @tc.name      SerialCommunication_SppPageStateConnect_0107
     * @tc.desc      SppPageState.connect(code=-1, socketId=85) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0107 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 85);
      logInfo(`connect(code=-1, socketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0107 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0108
     * @tc.name      SerialCommunication_SppPageStateConnect_0108
     * @tc.desc      SppPageState.connect(code=-1, socketId=90) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0108 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 90);
      logInfo(`connect(code=-1, socketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0108 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0109
     * @tc.name      SerialCommunication_SppPageStateConnect_0109
     * @tc.desc      SppPageState.connect(code=-1, socketId=95) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0109 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 95);
      logInfo(`connect(code=-1, socketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0109 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0110
     * @tc.name      SerialCommunication_SppPageStateConnect_0110
     * @tc.desc      SppPageState.connect(code=-1, socketId=105) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0110 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 105);
      logInfo(`connect(code=-1, socketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0110 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0111
     * @tc.name      SerialCommunication_SppPageStateConnect_0111
     * @tc.desc      SppPageState.connect(code=-1, socketId=110) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0111 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 110);
      logInfo(`connect(code=-1, socketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0111 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0112
     * @tc.name      SerialCommunication_SppPageStateConnect_0112
     * @tc.desc      SppPageState.connect(code=-1, socketId=115) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0112 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 115);
      logInfo(`connect(code=-1, socketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0112 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0113
     * @tc.name      SerialCommunication_SppPageStateConnect_0113
     * @tc.desc      SppPageState.connect(code=-1, socketId=79) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0113 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 79);
      logInfo(`connect(code=-1, socketId=79): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=79) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0113 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0114
     * @tc.name      SerialCommunication_SppPageStateConnect_0114
     * @tc.desc      SppPageState.connect(code=-1, socketId=-10) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateConnect_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0114 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, -10);
      logInfo(`connect(code=-1, socketId=-10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=-10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0114 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0115
     * @tc.name      SerialCommunication_SppPageStateConnect_0115
     * @tc.desc      SppPageState.connect(code=1, socketId=1) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0115 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 1);
      logInfo(`connect(code=1, socketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0115 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0116
     * @tc.name      SerialCommunication_SppPageStateConnect_0116
     * @tc.desc      SppPageState.connect(code=1, socketId=-1) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0116 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, -1);
      logInfo(`connect(code=1, socketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0116 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0117
     * @tc.name      SerialCommunication_SppPageStateConnect_0117
     * @tc.desc      SppPageState.connect(code=1, socketId=100) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0117 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 100);
      logInfo(`connect(code=1, socketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0117 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0118
     * @tc.name      SerialCommunication_SppPageStateConnect_0118
     * @tc.desc      SppPageState.connect(code=1, socketId=2) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0118 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 2);
      logInfo(`connect(code=1, socketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0118 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0119
     * @tc.name      SerialCommunication_SppPageStateConnect_0119
     * @tc.desc      SppPageState.connect(code=1, socketId=3) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0119 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 3);
      logInfo(`connect(code=1, socketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0119 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0120
     * @tc.name      SerialCommunication_SppPageStateConnect_0120
     * @tc.desc      SppPageState.connect(code=1, socketId=10) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0120 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 10);
      logInfo(`connect(code=1, socketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0120 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0121
     * @tc.name      SerialCommunication_SppPageStateConnect_0121
     * @tc.desc      SppPageState.connect(code=1, socketId=5) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0121 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 5);
      logInfo(`connect(code=1, socketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0121 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0122
     * @tc.name      SerialCommunication_SppPageStateConnect_0122
     * @tc.desc      SppPageState.connect(code=1, socketId=15) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0122 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 15);
      logInfo(`connect(code=1, socketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0122 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0123
     * @tc.name      SerialCommunication_SppPageStateConnect_0123
     * @tc.desc      SppPageState.connect(code=1, socketId=20) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0123 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 20);
      logInfo(`connect(code=1, socketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0123 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0124
     * @tc.name      SerialCommunication_SppPageStateConnect_0124
     * @tc.desc      SppPageState.connect(code=1, socketId=25) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0124 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 25);
      logInfo(`connect(code=1, socketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0124 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0125
     * @tc.name      SerialCommunication_SppPageStateConnect_0125
     * @tc.desc      SppPageState.connect(code=1, socketId=30) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0125 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 30);
      logInfo(`connect(code=1, socketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0125 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0126
     * @tc.name      SerialCommunication_SppPageStateConnect_0126
     * @tc.desc      SppPageState.connect(code=1, socketId=35) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0126 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 35);
      logInfo(`connect(code=1, socketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0126 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0127
     * @tc.name      SerialCommunication_SppPageStateConnect_0127
     * @tc.desc      SppPageState.connect(code=1, socketId=40) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0127 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 40);
      logInfo(`connect(code=1, socketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0127 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0128
     * @tc.name      SerialCommunication_SppPageStateConnect_0128
     * @tc.desc      SppPageState.connect(code=1, socketId=45) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0128 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 45);
      logInfo(`connect(code=1, socketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0128 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0129
     * @tc.name      SerialCommunication_SppPageStateConnect_0129
     * @tc.desc      SppPageState.connect(code=1, socketId=50) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0129 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 50);
      logInfo(`connect(code=1, socketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0129 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0130
     * @tc.name      SerialCommunication_SppPageStateConnect_0130
     * @tc.desc      SppPageState.connect(code=1, socketId=55) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0130 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 55);
      logInfo(`connect(code=1, socketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0130 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0131
     * @tc.name      SerialCommunication_SppPageStateConnect_0131
     * @tc.desc      SppPageState.connect(code=1, socketId=60) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0131 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 60);
      logInfo(`connect(code=1, socketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0131 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0132
     * @tc.name      SerialCommunication_SppPageStateConnect_0132
     * @tc.desc      SppPageState.connect(code=1, socketId=65) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0132 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 65);
      logInfo(`connect(code=1, socketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0132 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0133
     * @tc.name      SerialCommunication_SppPageStateConnect_0133
     * @tc.desc      SppPageState.connect(code=1, socketId=70) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0133 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 70);
      logInfo(`connect(code=1, socketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0133 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0134
     * @tc.name      SerialCommunication_SppPageStateConnect_0134
     * @tc.desc      SppPageState.connect(code=1, socketId=75) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0134 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 75);
      logInfo(`connect(code=1, socketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0134 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0135
     * @tc.name      SerialCommunication_SppPageStateConnect_0135
     * @tc.desc      SppPageState.connect(code=1, socketId=80) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0135 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 80);
      logInfo(`connect(code=1, socketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0135 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0136
     * @tc.name      SerialCommunication_SppPageStateConnect_0136
     * @tc.desc      SppPageState.connect(code=1, socketId=85) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0136 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 85);
      logInfo(`connect(code=1, socketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0136 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0137
     * @tc.name      SerialCommunication_SppPageStateConnect_0137
     * @tc.desc      SppPageState.connect(code=1, socketId=90) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0137 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 90);
      logInfo(`connect(code=1, socketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0137 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0138
     * @tc.name      SerialCommunication_SppPageStateConnect_0138
     * @tc.desc      SppPageState.connect(code=1, socketId=95) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0138 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 95);
      logInfo(`connect(code=1, socketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0138 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0139
     * @tc.name      SerialCommunication_SppPageStateConnect_0139
     * @tc.desc      SppPageState.connect(code=1, socketId=105) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0139 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 105);
      logInfo(`connect(code=1, socketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0139 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0140
     * @tc.name      SerialCommunication_SppPageStateConnect_0140
     * @tc.desc      SppPageState.connect(code=1, socketId=110) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0140 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 110);
      logInfo(`connect(code=1, socketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0140 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0141
     * @tc.name      SerialCommunication_SppPageStateConnect_0141
     * @tc.desc      SppPageState.connect(code=1, socketId=115) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0141 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 115);
      logInfo(`connect(code=1, socketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0141 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0142
     * @tc.name      SerialCommunication_SppPageStateConnect_0142
     * @tc.desc      SppPageState.connect(code=1, socketId=79) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0142 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 79);
      logInfo(`connect(code=1, socketId=79): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=79) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0142 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0143
     * @tc.name      SerialCommunication_SppPageStateConnect_0143
     * @tc.desc      SppPageState.connect(code=1, socketId=-10) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateConnect_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0143 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, -10);
      logInfo(`connect(code=1, socketId=-10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=-10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0143 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0144
     * @tc.name      SerialCommunication_SppPageStateConnect_0144
     * @tc.desc      SppPageState.connect(code=401, socketId=1) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0144 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 1);
      logInfo(`connect(code=401, socketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0144 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0145
     * @tc.name      SerialCommunication_SppPageStateConnect_0145
     * @tc.desc      SppPageState.connect(code=401, socketId=-1) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0145 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, -1);
      logInfo(`connect(code=401, socketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0145 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0146
     * @tc.name      SerialCommunication_SppPageStateConnect_0146
     * @tc.desc      SppPageState.connect(code=401, socketId=100) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0146 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 100);
      logInfo(`connect(code=401, socketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0146 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0147
     * @tc.name      SerialCommunication_SppPageStateConnect_0147
     * @tc.desc      SppPageState.connect(code=401, socketId=2) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0147 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 2);
      logInfo(`connect(code=401, socketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0147 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0148
     * @tc.name      SerialCommunication_SppPageStateConnect_0148
     * @tc.desc      SppPageState.connect(code=401, socketId=3) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0148 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 3);
      logInfo(`connect(code=401, socketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0148 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0149
     * @tc.name      SerialCommunication_SppPageStateConnect_0149
     * @tc.desc      SppPageState.connect(code=401, socketId=10) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0149 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 10);
      logInfo(`connect(code=401, socketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0149 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0150
     * @tc.name      SerialCommunication_SppPageStateConnect_0150
     * @tc.desc      SppPageState.connect(code=401, socketId=5) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0150 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 5);
      logInfo(`connect(code=401, socketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0150 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0151
     * @tc.name      SerialCommunication_SppPageStateConnect_0151
     * @tc.desc      SppPageState.connect(code=401, socketId=15) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0151 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 15);
      logInfo(`connect(code=401, socketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0151 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0152
     * @tc.name      SerialCommunication_SppPageStateConnect_0152
     * @tc.desc      SppPageState.connect(code=401, socketId=20) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0152 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 20);
      logInfo(`connect(code=401, socketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0152 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0153
     * @tc.name      SerialCommunication_SppPageStateConnect_0153
     * @tc.desc      SppPageState.connect(code=401, socketId=25) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0153 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 25);
      logInfo(`connect(code=401, socketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0153 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0154
     * @tc.name      SerialCommunication_SppPageStateConnect_0154
     * @tc.desc      SppPageState.connect(code=401, socketId=30) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0154 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 30);
      logInfo(`connect(code=401, socketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0154 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0155
     * @tc.name      SerialCommunication_SppPageStateConnect_0155
     * @tc.desc      SppPageState.connect(code=401, socketId=35) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0155 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 35);
      logInfo(`connect(code=401, socketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0155 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0156
     * @tc.name      SerialCommunication_SppPageStateConnect_0156
     * @tc.desc      SppPageState.connect(code=401, socketId=40) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0156 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 40);
      logInfo(`connect(code=401, socketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0156 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0157
     * @tc.name      SerialCommunication_SppPageStateConnect_0157
     * @tc.desc      SppPageState.connect(code=401, socketId=45) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0157 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 45);
      logInfo(`connect(code=401, socketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0157 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0158
     * @tc.name      SerialCommunication_SppPageStateConnect_0158
     * @tc.desc      SppPageState.connect(code=401, socketId=50) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0158 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 50);
      logInfo(`connect(code=401, socketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0158 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0159
     * @tc.name      SerialCommunication_SppPageStateConnect_0159
     * @tc.desc      SppPageState.connect(code=401, socketId=55) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0159 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 55);
      logInfo(`connect(code=401, socketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0159 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0160
     * @tc.name      SerialCommunication_SppPageStateConnect_0160
     * @tc.desc      SppPageState.connect(code=401, socketId=60) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0160 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 60);
      logInfo(`connect(code=401, socketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0160 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0161
     * @tc.name      SerialCommunication_SppPageStateConnect_0161
     * @tc.desc      SppPageState.connect(code=401, socketId=65) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0161 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 65);
      logInfo(`connect(code=401, socketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0161 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0162
     * @tc.name      SerialCommunication_SppPageStateConnect_0162
     * @tc.desc      SppPageState.connect(code=401, socketId=70) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0162 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 70);
      logInfo(`connect(code=401, socketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0162 end`);
    });
  });
}
