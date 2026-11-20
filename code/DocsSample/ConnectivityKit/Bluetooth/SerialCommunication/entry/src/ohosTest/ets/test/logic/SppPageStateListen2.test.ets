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

/** Logic checks for SppPageState.listen (81 cases). */
export default function sppPageStateListen2Test(): void {
  describe('SppPageStateListen2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0079
     * @tc.name      SerialCommunication_SppPageStateListen_0079
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=90) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0079 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 90);
      logInfo(`listen(code=200, serverSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0080
     * @tc.name      SerialCommunication_SppPageStateListen_0080
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=95) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0080 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 95);
      logInfo(`listen(code=200, serverSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0081
     * @tc.name      SerialCommunication_SppPageStateListen_0081
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=105) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0081 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 105);
      logInfo(`listen(code=200, serverSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0082
     * @tc.name      SerialCommunication_SppPageStateListen_0082
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=110) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0082 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 110);
      logInfo(`listen(code=200, serverSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0083
     * @tc.name      SerialCommunication_SppPageStateListen_0083
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=115) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0083 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 115);
      logInfo(`listen(code=200, serverSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0084
     * @tc.name      SerialCommunication_SppPageStateListen_0084
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=44.34) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0084 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 44.34);
      logInfo(`listen(code=200, serverSocketId=44.34): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=44.34) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0085
     * @tc.name      SerialCommunication_SppPageStateListen_0085
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=-14) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateListen_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0085 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, -14);
      logInfo(`listen(code=200, serverSocketId=-14): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=-14) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0086
     * @tc.name      SerialCommunication_SppPageStateListen_0086
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=1) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0086 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 1);
      logInfo(`listen(code=-1, serverSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0087
     * @tc.name      SerialCommunication_SppPageStateListen_0087
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=-1) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0087 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, -1);
      logInfo(`listen(code=-1, serverSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0088
     * @tc.name      SerialCommunication_SppPageStateListen_0088
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=100) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0088 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 100);
      logInfo(`listen(code=-1, serverSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0089
     * @tc.name      SerialCommunication_SppPageStateListen_0089
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=2) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0089 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 2);
      logInfo(`listen(code=-1, serverSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0090
     * @tc.name      SerialCommunication_SppPageStateListen_0090
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=3) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0090 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 3);
      logInfo(`listen(code=-1, serverSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0090 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0091
     * @tc.name      SerialCommunication_SppPageStateListen_0091
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=10) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0091 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 10);
      logInfo(`listen(code=-1, serverSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0091 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0092
     * @tc.name      SerialCommunication_SppPageStateListen_0092
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=5) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0092 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 5);
      logInfo(`listen(code=-1, serverSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0092 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0093
     * @tc.name      SerialCommunication_SppPageStateListen_0093
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=15) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0093 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 15);
      logInfo(`listen(code=-1, serverSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0093 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0094
     * @tc.name      SerialCommunication_SppPageStateListen_0094
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=20) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0094 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 20);
      logInfo(`listen(code=-1, serverSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0094 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0095
     * @tc.name      SerialCommunication_SppPageStateListen_0095
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=25) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0095 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 25);
      logInfo(`listen(code=-1, serverSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0095 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0096
     * @tc.name      SerialCommunication_SppPageStateListen_0096
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=30) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0096 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 30);
      logInfo(`listen(code=-1, serverSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0096 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0097
     * @tc.name      SerialCommunication_SppPageStateListen_0097
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=35) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0097 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 35);
      logInfo(`listen(code=-1, serverSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0097 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0098
     * @tc.name      SerialCommunication_SppPageStateListen_0098
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=40) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0098 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 40);
      logInfo(`listen(code=-1, serverSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0098 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0099
     * @tc.name      SerialCommunication_SppPageStateListen_0099
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=45) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0099 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 45);
      logInfo(`listen(code=-1, serverSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0099 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0100
     * @tc.name      SerialCommunication_SppPageStateListen_0100
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=50) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0100 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 50);
      logInfo(`listen(code=-1, serverSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0100 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0101
     * @tc.name      SerialCommunication_SppPageStateListen_0101
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=55) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0101 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 55);
      logInfo(`listen(code=-1, serverSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0101 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0102
     * @tc.name      SerialCommunication_SppPageStateListen_0102
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=60) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0102 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 60);
      logInfo(`listen(code=-1, serverSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0102 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0103
     * @tc.name      SerialCommunication_SppPageStateListen_0103
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=65) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0103 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 65);
      logInfo(`listen(code=-1, serverSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0103 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0104
     * @tc.name      SerialCommunication_SppPageStateListen_0104
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=70) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0104 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 70);
      logInfo(`listen(code=-1, serverSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0104 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0105
     * @tc.name      SerialCommunication_SppPageStateListen_0105
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=75) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0105 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 75);
      logInfo(`listen(code=-1, serverSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0105 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0106
     * @tc.name      SerialCommunication_SppPageStateListen_0106
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=80) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0106 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 80);
      logInfo(`listen(code=-1, serverSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0106 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0107
     * @tc.name      SerialCommunication_SppPageStateListen_0107
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=85) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0107 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 85);
      logInfo(`listen(code=-1, serverSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0107 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0108
     * @tc.name      SerialCommunication_SppPageStateListen_0108
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=90) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0108 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 90);
      logInfo(`listen(code=-1, serverSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0108 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0109
     * @tc.name      SerialCommunication_SppPageStateListen_0109
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=95) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0109 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 95);
      logInfo(`listen(code=-1, serverSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0109 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0110
     * @tc.name      SerialCommunication_SppPageStateListen_0110
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=105) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0110 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 105);
      logInfo(`listen(code=-1, serverSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0110 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0111
     * @tc.name      SerialCommunication_SppPageStateListen_0111
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=110) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0111 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 110);
      logInfo(`listen(code=-1, serverSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0111 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0112
     * @tc.name      SerialCommunication_SppPageStateListen_0112
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=115) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0112 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 115);
      logInfo(`listen(code=-1, serverSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0112 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0113
     * @tc.name      SerialCommunication_SppPageStateListen_0113
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=44.34) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0113 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 44.34);
      logInfo(`listen(code=-1, serverSocketId=44.34): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=44.34) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0113 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0114
     * @tc.name      SerialCommunication_SppPageStateListen_0114
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=-14) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateListen_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0114 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, -14);
      logInfo(`listen(code=-1, serverSocketId=-14): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=-14) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0114 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0115
     * @tc.name      SerialCommunication_SppPageStateListen_0115
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=1) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0115 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 1);
      logInfo(`listen(code=1, serverSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0115 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0116
     * @tc.name      SerialCommunication_SppPageStateListen_0116
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=-1) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0116 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, -1);
      logInfo(`listen(code=1, serverSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0116 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0117
     * @tc.name      SerialCommunication_SppPageStateListen_0117
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=100) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0117 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 100);
      logInfo(`listen(code=1, serverSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0117 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0118
     * @tc.name      SerialCommunication_SppPageStateListen_0118
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=2) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0118 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 2);
      logInfo(`listen(code=1, serverSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0118 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0119
     * @tc.name      SerialCommunication_SppPageStateListen_0119
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=3) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0119 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 3);
      logInfo(`listen(code=1, serverSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0119 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0120
     * @tc.name      SerialCommunication_SppPageStateListen_0120
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=10) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0120 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 10);
      logInfo(`listen(code=1, serverSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0120 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0121
     * @tc.name      SerialCommunication_SppPageStateListen_0121
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=5) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0121 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 5);
      logInfo(`listen(code=1, serverSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0121 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0122
     * @tc.name      SerialCommunication_SppPageStateListen_0122
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=15) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0122 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 15);
      logInfo(`listen(code=1, serverSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0122 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0123
     * @tc.name      SerialCommunication_SppPageStateListen_0123
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=20) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0123 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 20);
      logInfo(`listen(code=1, serverSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0123 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0124
     * @tc.name      SerialCommunication_SppPageStateListen_0124
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=25) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0124 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 25);
      logInfo(`listen(code=1, serverSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0124 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0125
     * @tc.name      SerialCommunication_SppPageStateListen_0125
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=30) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0125 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 30);
      logInfo(`listen(code=1, serverSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0125 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0126
     * @tc.name      SerialCommunication_SppPageStateListen_0126
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=35) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0126 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 35);
      logInfo(`listen(code=1, serverSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0126 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0127
     * @tc.name      SerialCommunication_SppPageStateListen_0127
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=40) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0127 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 40);
      logInfo(`listen(code=1, serverSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0127 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0128
     * @tc.name      SerialCommunication_SppPageStateListen_0128
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=45) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0128 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 45);
      logInfo(`listen(code=1, serverSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0128 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0129
     * @tc.name      SerialCommunication_SppPageStateListen_0129
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=50) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0129 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 50);
      logInfo(`listen(code=1, serverSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0129 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0130
     * @tc.name      SerialCommunication_SppPageStateListen_0130
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=55) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0130 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 55);
      logInfo(`listen(code=1, serverSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0130 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0131
     * @tc.name      SerialCommunication_SppPageStateListen_0131
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=60) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0131 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 60);
      logInfo(`listen(code=1, serverSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0131 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0132
     * @tc.name      SerialCommunication_SppPageStateListen_0132
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=65) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0132 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 65);
      logInfo(`listen(code=1, serverSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0132 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0133
     * @tc.name      SerialCommunication_SppPageStateListen_0133
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=70) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0133 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 70);
      logInfo(`listen(code=1, serverSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0133 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0134
     * @tc.name      SerialCommunication_SppPageStateListen_0134
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=75) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0134 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 75);
      logInfo(`listen(code=1, serverSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0134 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0135
     * @tc.name      SerialCommunication_SppPageStateListen_0135
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=80) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0135 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 80);
      logInfo(`listen(code=1, serverSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0135 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0136
     * @tc.name      SerialCommunication_SppPageStateListen_0136
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=85) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0136 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 85);
      logInfo(`listen(code=1, serverSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0136 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0137
     * @tc.name      SerialCommunication_SppPageStateListen_0137
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=90) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0137 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 90);
      logInfo(`listen(code=1, serverSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0137 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0138
     * @tc.name      SerialCommunication_SppPageStateListen_0138
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=95) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0138 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 95);
      logInfo(`listen(code=1, serverSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0138 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0139
     * @tc.name      SerialCommunication_SppPageStateListen_0139
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=105) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0139 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 105);
      logInfo(`listen(code=1, serverSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0139 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0140
     * @tc.name      SerialCommunication_SppPageStateListen_0140
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=110) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0140 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 110);
      logInfo(`listen(code=1, serverSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0140 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0141
     * @tc.name      SerialCommunication_SppPageStateListen_0141
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=115) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0141 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 115);
      logInfo(`listen(code=1, serverSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0141 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0142
     * @tc.name      SerialCommunication_SppPageStateListen_0142
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=44.34) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0142 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 44.34);
      logInfo(`listen(code=1, serverSocketId=44.34): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=44.34) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0142 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0143
     * @tc.name      SerialCommunication_SppPageStateListen_0143
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=-14) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateListen_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0143 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, -14);
      logInfo(`listen(code=1, serverSocketId=-14): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=-14) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0143 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0144
     * @tc.name      SerialCommunication_SppPageStateListen_0144
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=1) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0144 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 1);
      logInfo(`listen(code=401, serverSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0144 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0145
     * @tc.name      SerialCommunication_SppPageStateListen_0145
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=-1) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0145 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, -1);
      logInfo(`listen(code=401, serverSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0145 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0146
     * @tc.name      SerialCommunication_SppPageStateListen_0146
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=100) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0146 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 100);
      logInfo(`listen(code=401, serverSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0146 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0147
     * @tc.name      SerialCommunication_SppPageStateListen_0147
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=2) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0147 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 2);
      logInfo(`listen(code=401, serverSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0147 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0148
     * @tc.name      SerialCommunication_SppPageStateListen_0148
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=3) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0148 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 3);
      logInfo(`listen(code=401, serverSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0148 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0149
     * @tc.name      SerialCommunication_SppPageStateListen_0149
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=10) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0149 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 10);
      logInfo(`listen(code=401, serverSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0149 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0150
     * @tc.name      SerialCommunication_SppPageStateListen_0150
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=5) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0150 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 5);
      logInfo(`listen(code=401, serverSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0150 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0151
     * @tc.name      SerialCommunication_SppPageStateListen_0151
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=15) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0151 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 15);
      logInfo(`listen(code=401, serverSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0151 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0152
     * @tc.name      SerialCommunication_SppPageStateListen_0152
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=20) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0152 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 20);
      logInfo(`listen(code=401, serverSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0152 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0153
     * @tc.name      SerialCommunication_SppPageStateListen_0153
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=25) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0153 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 25);
      logInfo(`listen(code=401, serverSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0153 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0154
     * @tc.name      SerialCommunication_SppPageStateListen_0154
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=30) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0154 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 30);
      logInfo(`listen(code=401, serverSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0154 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0155
     * @tc.name      SerialCommunication_SppPageStateListen_0155
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=35) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0155 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 35);
      logInfo(`listen(code=401, serverSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0155 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0156
     * @tc.name      SerialCommunication_SppPageStateListen_0156
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=40) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0156 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 40);
      logInfo(`listen(code=401, serverSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0156 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0157
     * @tc.name      SerialCommunication_SppPageStateListen_0157
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=45) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0157 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 45);
      logInfo(`listen(code=401, serverSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0157 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0158
     * @tc.name      SerialCommunication_SppPageStateListen_0158
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=50) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0158 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 50);
      logInfo(`listen(code=401, serverSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0158 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0159
     * @tc.name      SerialCommunication_SppPageStateListen_0159
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=55) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0159 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 55);
      logInfo(`listen(code=401, serverSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0159 end`);
    });
  });
}
