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

/** Logic checks for SppPageState.listen (78 cases). */
export default function sppPageStateListenTest(): void {
  describe('SppPageStateListenTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0001
     * @tc.name      SerialCommunication_SppPageStateListen_0001
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=0) yields "sppListen success, serverNumber = 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateListen_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0001 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 0);
      logInfo(`listen(code=0, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 0');
      logInfo(`listen(code=0, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 0');
      logInfo(`${BUNDLE}SppPageStateListen_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0002
     * @tc.name      SerialCommunication_SppPageStateListen_0002
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=1) yields "sppListen success, serverNumber = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateListen_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0002 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 1);
      logInfo(`listen(code=0, serverSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 1');
      logInfo(`listen(code=0, serverSocketId=1) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(1);
      logInfo(`listen(code=0, serverSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 1');
      logInfo(`${BUNDLE}SppPageStateListen_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0003
     * @tc.name      SerialCommunication_SppPageStateListen_0003
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=-1) yields "sppListen success, serverNumber = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0003 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, -1);
      logInfo(`listen(code=0, serverSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = -1');
      logInfo(`listen(code=0, serverSocketId=-1) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(-1);
      logInfo(`listen(code=0, serverSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = -1');
      logInfo(`${BUNDLE}SppPageStateListen_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0004
     * @tc.name      SerialCommunication_SppPageStateListen_0004
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=100) yields "sppListen success, serverNumber = 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0004 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 100);
      logInfo(`listen(code=0, serverSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 100');
      logInfo(`listen(code=0, serverSocketId=100) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(100);
      logInfo(`listen(code=0, serverSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 100');
      logInfo(`${BUNDLE}SppPageStateListen_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0005
     * @tc.name      SerialCommunication_SppPageStateListen_0005
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=2) yields "sppListen success, serverNumber = 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0005 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 2);
      logInfo(`listen(code=0, serverSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 2');
      logInfo(`listen(code=0, serverSocketId=2) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(2);
      logInfo(`listen(code=0, serverSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 2');
      logInfo(`${BUNDLE}SppPageStateListen_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0006
     * @tc.name      SerialCommunication_SppPageStateListen_0006
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=3) yields "sppListen success, serverNumber = 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0006 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 3);
      logInfo(`listen(code=0, serverSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 3');
      logInfo(`listen(code=0, serverSocketId=3) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(3);
      logInfo(`listen(code=0, serverSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 3');
      logInfo(`${BUNDLE}SppPageStateListen_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0007
     * @tc.name      SerialCommunication_SppPageStateListen_0007
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=10) yields "sppListen success, serverNumber = 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0007 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 10);
      logInfo(`listen(code=0, serverSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 10');
      logInfo(`listen(code=0, serverSocketId=10) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(10);
      logInfo(`listen(code=0, serverSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 10');
      logInfo(`${BUNDLE}SppPageStateListen_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0008
     * @tc.name      SerialCommunication_SppPageStateListen_0008
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=5) yields "sppListen success, serverNumber = 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0008 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 5);
      logInfo(`listen(code=0, serverSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 5');
      logInfo(`listen(code=0, serverSocketId=5) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(5);
      logInfo(`listen(code=0, serverSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 5');
      logInfo(`${BUNDLE}SppPageStateListen_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0009
     * @tc.name      SerialCommunication_SppPageStateListen_0009
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=15) yields "sppListen success, serverNumber = 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0009 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 15);
      logInfo(`listen(code=0, serverSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 15');
      logInfo(`listen(code=0, serverSocketId=15) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(15);
      logInfo(`listen(code=0, serverSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 15');
      logInfo(`${BUNDLE}SppPageStateListen_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0010
     * @tc.name      SerialCommunication_SppPageStateListen_0010
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=20) yields "sppListen success, serverNumber = 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0010 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 20);
      logInfo(`listen(code=0, serverSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 20');
      logInfo(`listen(code=0, serverSocketId=20) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(20);
      logInfo(`listen(code=0, serverSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 20');
      logInfo(`${BUNDLE}SppPageStateListen_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0011
     * @tc.name      SerialCommunication_SppPageStateListen_0011
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=25) yields "sppListen success, serverNumber = 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0011 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 25);
      logInfo(`listen(code=0, serverSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 25');
      logInfo(`listen(code=0, serverSocketId=25) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(25);
      logInfo(`listen(code=0, serverSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 25');
      logInfo(`${BUNDLE}SppPageStateListen_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0012
     * @tc.name      SerialCommunication_SppPageStateListen_0012
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=30) yields "sppListen success, serverNumber = 30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0012 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 30);
      logInfo(`listen(code=0, serverSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 30');
      logInfo(`listen(code=0, serverSocketId=30) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(30);
      logInfo(`listen(code=0, serverSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 30');
      logInfo(`${BUNDLE}SppPageStateListen_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0013
     * @tc.name      SerialCommunication_SppPageStateListen_0013
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=35) yields "sppListen success, serverNumber = 35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0013 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 35);
      logInfo(`listen(code=0, serverSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 35');
      logInfo(`listen(code=0, serverSocketId=35) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(35);
      logInfo(`listen(code=0, serverSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 35');
      logInfo(`${BUNDLE}SppPageStateListen_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0014
     * @tc.name      SerialCommunication_SppPageStateListen_0014
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=40) yields "sppListen success, serverNumber = 40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0014 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 40);
      logInfo(`listen(code=0, serverSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 40');
      logInfo(`listen(code=0, serverSocketId=40) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(40);
      logInfo(`listen(code=0, serverSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 40');
      logInfo(`${BUNDLE}SppPageStateListen_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0015
     * @tc.name      SerialCommunication_SppPageStateListen_0015
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=45) yields "sppListen success, serverNumber = 45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0015 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 45);
      logInfo(`listen(code=0, serverSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 45');
      logInfo(`listen(code=0, serverSocketId=45) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(45);
      logInfo(`listen(code=0, serverSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 45');
      logInfo(`${BUNDLE}SppPageStateListen_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0016
     * @tc.name      SerialCommunication_SppPageStateListen_0016
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=50) yields "sppListen success, serverNumber = 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0016 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 50);
      logInfo(`listen(code=0, serverSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 50');
      logInfo(`listen(code=0, serverSocketId=50) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(50);
      logInfo(`listen(code=0, serverSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 50');
      logInfo(`${BUNDLE}SppPageStateListen_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0017
     * @tc.name      SerialCommunication_SppPageStateListen_0017
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=55) yields "sppListen success, serverNumber = 55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0017 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 55);
      logInfo(`listen(code=0, serverSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 55');
      logInfo(`listen(code=0, serverSocketId=55) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(55);
      logInfo(`listen(code=0, serverSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 55');
      logInfo(`${BUNDLE}SppPageStateListen_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0018
     * @tc.name      SerialCommunication_SppPageStateListen_0018
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=60) yields "sppListen success, serverNumber = 60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0018 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 60);
      logInfo(`listen(code=0, serverSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 60');
      logInfo(`listen(code=0, serverSocketId=60) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(60);
      logInfo(`listen(code=0, serverSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 60');
      logInfo(`${BUNDLE}SppPageStateListen_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0019
     * @tc.name      SerialCommunication_SppPageStateListen_0019
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=65) yields "sppListen success, serverNumber = 65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0019 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 65);
      logInfo(`listen(code=0, serverSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 65');
      logInfo(`listen(code=0, serverSocketId=65) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(65);
      logInfo(`listen(code=0, serverSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 65');
      logInfo(`${BUNDLE}SppPageStateListen_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0020
     * @tc.name      SerialCommunication_SppPageStateListen_0020
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=70) yields "sppListen success, serverNumber = 70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0020 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 70);
      logInfo(`listen(code=0, serverSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 70');
      logInfo(`listen(code=0, serverSocketId=70) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(70);
      logInfo(`listen(code=0, serverSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 70');
      logInfo(`${BUNDLE}SppPageStateListen_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0021
     * @tc.name      SerialCommunication_SppPageStateListen_0021
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=75) yields "sppListen success, serverNumber = 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0021 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 75);
      logInfo(`listen(code=0, serverSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 75');
      logInfo(`listen(code=0, serverSocketId=75) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(75);
      logInfo(`listen(code=0, serverSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 75');
      logInfo(`${BUNDLE}SppPageStateListen_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0022
     * @tc.name      SerialCommunication_SppPageStateListen_0022
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=80) yields "sppListen success, serverNumber = 80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0022 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 80);
      logInfo(`listen(code=0, serverSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 80');
      logInfo(`listen(code=0, serverSocketId=80) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(80);
      logInfo(`listen(code=0, serverSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 80');
      logInfo(`${BUNDLE}SppPageStateListen_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0023
     * @tc.name      SerialCommunication_SppPageStateListen_0023
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=85) yields "sppListen success, serverNumber = 85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0023 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 85);
      logInfo(`listen(code=0, serverSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 85');
      logInfo(`listen(code=0, serverSocketId=85) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(85);
      logInfo(`listen(code=0, serverSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 85');
      logInfo(`${BUNDLE}SppPageStateListen_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0024
     * @tc.name      SerialCommunication_SppPageStateListen_0024
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=90) yields "sppListen success, serverNumber = 90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0024 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 90);
      logInfo(`listen(code=0, serverSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 90');
      logInfo(`listen(code=0, serverSocketId=90) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(90);
      logInfo(`listen(code=0, serverSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 90');
      logInfo(`${BUNDLE}SppPageStateListen_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0025
     * @tc.name      SerialCommunication_SppPageStateListen_0025
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=95) yields "sppListen success, serverNumber = 95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0025 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 95);
      logInfo(`listen(code=0, serverSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 95');
      logInfo(`listen(code=0, serverSocketId=95) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(95);
      logInfo(`listen(code=0, serverSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 95');
      logInfo(`${BUNDLE}SppPageStateListen_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0026
     * @tc.name      SerialCommunication_SppPageStateListen_0026
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=105) yields "sppListen success, serverNumber = 105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0026 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 105);
      logInfo(`listen(code=0, serverSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 105');
      logInfo(`listen(code=0, serverSocketId=105) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(105);
      logInfo(`listen(code=0, serverSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 105');
      logInfo(`${BUNDLE}SppPageStateListen_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0027
     * @tc.name      SerialCommunication_SppPageStateListen_0027
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=110) yields "sppListen success, serverNumber = 110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0027 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 110);
      logInfo(`listen(code=0, serverSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 110');
      logInfo(`listen(code=0, serverSocketId=110) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(110);
      logInfo(`listen(code=0, serverSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 110');
      logInfo(`${BUNDLE}SppPageStateListen_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0028
     * @tc.name      SerialCommunication_SppPageStateListen_0028
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=115) yields "sppListen success, serverNumber = 115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0028 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 115);
      logInfo(`listen(code=0, serverSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 115');
      logInfo(`listen(code=0, serverSocketId=115) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(115);
      logInfo(`listen(code=0, serverSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 115');
      logInfo(`${BUNDLE}SppPageStateListen_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0029
     * @tc.name      SerialCommunication_SppPageStateListen_0029
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=44.34) yields "sppListen success, serverNumber = 44.34"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0029 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, 44.34);
      logInfo(`listen(code=0, serverSocketId=44.34): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 44.34');
      logInfo(`listen(code=0, serverSocketId=44.34) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertClose(44.34, PRECISION);
      logInfo(`listen(code=0, serverSocketId=44.34) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = 44.34');
      logInfo(`${BUNDLE}SppPageStateListen_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0030
     * @tc.name      SerialCommunication_SppPageStateListen_0030
     * @tc.desc      SppPageState.listen(code=0, serverSocketId=-14) yields "sppListen success, serverNumber = -14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateListen_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0030 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(0, -14);
      logInfo(`listen(code=0, serverSocketId=-14): actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = -14');
      logInfo(`listen(code=0, serverSocketId=-14) state: subject.serverNumber=${subject.serverNumber}`);
      expect(subject.serverNumber).assertEqual(-14);
      logInfo(`listen(code=0, serverSocketId=-14) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen success, serverNumber = -14');
      logInfo(`${BUNDLE}SppPageStateListen_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0031
     * @tc.name      SerialCommunication_SppPageStateListen_0031
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=0) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0031 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 0);
      logInfo(`listen(code=200, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0032
     * @tc.name      SerialCommunication_SppPageStateListen_0032
     * @tc.desc      SppPageState.listen(code=-1, serverSocketId=0) yields "sppListen error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0032 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(-1, 0);
      logInfo(`listen(code=-1, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is -1');
      logInfo(`listen(code=-1, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is -1');
      logInfo(`${BUNDLE}SppPageStateListen_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0033
     * @tc.name      SerialCommunication_SppPageStateListen_0033
     * @tc.desc      SppPageState.listen(code=1, serverSocketId=0) yields "sppListen error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0033 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(1, 0);
      logInfo(`listen(code=1, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 1');
      logInfo(`listen(code=1, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 1');
      logInfo(`${BUNDLE}SppPageStateListen_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0034
     * @tc.name      SerialCommunication_SppPageStateListen_0034
     * @tc.desc      SppPageState.listen(code=401, serverSocketId=0) yields "sppListen error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0034 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(401, 0);
      logInfo(`listen(code=401, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 401');
      logInfo(`listen(code=401, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 401');
      logInfo(`${BUNDLE}SppPageStateListen_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0035
     * @tc.name      SerialCommunication_SppPageStateListen_0035
     * @tc.desc      SppPageState.listen(code=404, serverSocketId=0) yields "sppListen error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0035 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(404, 0);
      logInfo(`listen(code=404, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 404');
      logInfo(`listen(code=404, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 404');
      logInfo(`${BUNDLE}SppPageStateListen_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0036
     * @tc.name      SerialCommunication_SppPageStateListen_0036
     * @tc.desc      SppPageState.listen(code=500, serverSocketId=0) yields "sppListen error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0036 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(500, 0);
      logInfo(`listen(code=500, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 500');
      logInfo(`listen(code=500, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 500');
      logInfo(`${BUNDLE}SppPageStateListen_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0037
     * @tc.name      SerialCommunication_SppPageStateListen_0037
     * @tc.desc      SppPageState.listen(code=2, serverSocketId=0) yields "sppListen error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0037 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(2, 0);
      logInfo(`listen(code=2, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 2');
      logInfo(`listen(code=2, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 2');
      logInfo(`${BUNDLE}SppPageStateListen_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0038
     * @tc.name      SerialCommunication_SppPageStateListen_0038
     * @tc.desc      SppPageState.listen(code=3, serverSocketId=0) yields "sppListen error, code is 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0038 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(3, 0);
      logInfo(`listen(code=3, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 3');
      logInfo(`listen(code=3, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 3');
      logInfo(`${BUNDLE}SppPageStateListen_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0039
     * @tc.name      SerialCommunication_SppPageStateListen_0039
     * @tc.desc      SppPageState.listen(code=10, serverSocketId=0) yields "sppListen error, code is 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0039 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(10, 0);
      logInfo(`listen(code=10, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 10');
      logInfo(`listen(code=10, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 10');
      logInfo(`${BUNDLE}SppPageStateListen_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0040
     * @tc.name      SerialCommunication_SppPageStateListen_0040
     * @tc.desc      SppPageState.listen(code=100, serverSocketId=0) yields "sppListen error, code is 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0040 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(100, 0);
      logInfo(`listen(code=100, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 100');
      logInfo(`listen(code=100, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 100');
      logInfo(`${BUNDLE}SppPageStateListen_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0041
     * @tc.name      SerialCommunication_SppPageStateListen_0041
     * @tc.desc      SppPageState.listen(code=25, serverSocketId=0) yields "sppListen error, code is 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0041 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(25, 0);
      logInfo(`listen(code=25, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 25');
      logInfo(`listen(code=25, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 25');
      logInfo(`${BUNDLE}SppPageStateListen_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0042
     * @tc.name      SerialCommunication_SppPageStateListen_0042
     * @tc.desc      SppPageState.listen(code=50, serverSocketId=0) yields "sppListen error, code is 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0042 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(50, 0);
      logInfo(`listen(code=50, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 50');
      logInfo(`listen(code=50, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 50');
      logInfo(`${BUNDLE}SppPageStateListen_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0043
     * @tc.name      SerialCommunication_SppPageStateListen_0043
     * @tc.desc      SppPageState.listen(code=75, serverSocketId=0) yields "sppListen error, code is 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0043 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(75, 0);
      logInfo(`listen(code=75, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 75');
      logInfo(`listen(code=75, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 75');
      logInfo(`${BUNDLE}SppPageStateListen_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0044
     * @tc.name      SerialCommunication_SppPageStateListen_0044
     * @tc.desc      SppPageState.listen(code=125, serverSocketId=0) yields "sppListen error, code is 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0044 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(125, 0);
      logInfo(`listen(code=125, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 125');
      logInfo(`listen(code=125, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 125');
      logInfo(`${BUNDLE}SppPageStateListen_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0045
     * @tc.name      SerialCommunication_SppPageStateListen_0045
     * @tc.desc      SppPageState.listen(code=150, serverSocketId=0) yields "sppListen error, code is 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0045 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(150, 0);
      logInfo(`listen(code=150, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 150');
      logInfo(`listen(code=150, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 150');
      logInfo(`${BUNDLE}SppPageStateListen_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0046
     * @tc.name      SerialCommunication_SppPageStateListen_0046
     * @tc.desc      SppPageState.listen(code=175, serverSocketId=0) yields "sppListen error, code is 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0046 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(175, 0);
      logInfo(`listen(code=175, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 175');
      logInfo(`listen(code=175, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 175');
      logInfo(`${BUNDLE}SppPageStateListen_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0047
     * @tc.name      SerialCommunication_SppPageStateListen_0047
     * @tc.desc      SppPageState.listen(code=225, serverSocketId=0) yields "sppListen error, code is 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0047 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(225, 0);
      logInfo(`listen(code=225, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 225');
      logInfo(`listen(code=225, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 225');
      logInfo(`${BUNDLE}SppPageStateListen_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0048
     * @tc.name      SerialCommunication_SppPageStateListen_0048
     * @tc.desc      SppPageState.listen(code=250, serverSocketId=0) yields "sppListen error, code is 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0048 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(250, 0);
      logInfo(`listen(code=250, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 250');
      logInfo(`listen(code=250, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 250');
      logInfo(`${BUNDLE}SppPageStateListen_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0049
     * @tc.name      SerialCommunication_SppPageStateListen_0049
     * @tc.desc      SppPageState.listen(code=275, serverSocketId=0) yields "sppListen error, code is 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0049 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(275, 0);
      logInfo(`listen(code=275, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 275');
      logInfo(`listen(code=275, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 275');
      logInfo(`${BUNDLE}SppPageStateListen_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0050
     * @tc.name      SerialCommunication_SppPageStateListen_0050
     * @tc.desc      SppPageState.listen(code=300, serverSocketId=0) yields "sppListen error, code is 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0050 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(300, 0);
      logInfo(`listen(code=300, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 300');
      logInfo(`listen(code=300, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 300');
      logInfo(`${BUNDLE}SppPageStateListen_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0051
     * @tc.name      SerialCommunication_SppPageStateListen_0051
     * @tc.desc      SppPageState.listen(code=325, serverSocketId=0) yields "sppListen error, code is 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0051 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(325, 0);
      logInfo(`listen(code=325, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 325');
      logInfo(`listen(code=325, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 325');
      logInfo(`${BUNDLE}SppPageStateListen_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0052
     * @tc.name      SerialCommunication_SppPageStateListen_0052
     * @tc.desc      SppPageState.listen(code=350, serverSocketId=0) yields "sppListen error, code is 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0052 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(350, 0);
      logInfo(`listen(code=350, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 350');
      logInfo(`listen(code=350, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 350');
      logInfo(`${BUNDLE}SppPageStateListen_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0053
     * @tc.name      SerialCommunication_SppPageStateListen_0053
     * @tc.desc      SppPageState.listen(code=375, serverSocketId=0) yields "sppListen error, code is 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0053 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(375, 0);
      logInfo(`listen(code=375, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 375');
      logInfo(`listen(code=375, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 375');
      logInfo(`${BUNDLE}SppPageStateListen_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0054
     * @tc.name      SerialCommunication_SppPageStateListen_0054
     * @tc.desc      SppPageState.listen(code=400, serverSocketId=0) yields "sppListen error, code is 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0054 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(400, 0);
      logInfo(`listen(code=400, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 400');
      logInfo(`listen(code=400, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 400');
      logInfo(`${BUNDLE}SppPageStateListen_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0055
     * @tc.name      SerialCommunication_SppPageStateListen_0055
     * @tc.desc      SppPageState.listen(code=425, serverSocketId=0) yields "sppListen error, code is 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0055 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(425, 0);
      logInfo(`listen(code=425, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 425');
      logInfo(`listen(code=425, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 425');
      logInfo(`${BUNDLE}SppPageStateListen_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0056
     * @tc.name      SerialCommunication_SppPageStateListen_0056
     * @tc.desc      SppPageState.listen(code=450, serverSocketId=0) yields "sppListen error, code is 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0056 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(450, 0);
      logInfo(`listen(code=450, serverSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 450');
      logInfo(`listen(code=450, serverSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 450');
      logInfo(`${BUNDLE}SppPageStateListen_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0057
     * @tc.name      SerialCommunication_SppPageStateListen_0057
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=1) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0057 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 1);
      logInfo(`listen(code=200, serverSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0058
     * @tc.name      SerialCommunication_SppPageStateListen_0058
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=-1) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateListen_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0058 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, -1);
      logInfo(`listen(code=200, serverSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0059
     * @tc.name      SerialCommunication_SppPageStateListen_0059
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=100) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0059 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 100);
      logInfo(`listen(code=200, serverSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0060
     * @tc.name      SerialCommunication_SppPageStateListen_0060
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=2) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0060 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 2);
      logInfo(`listen(code=200, serverSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0061
     * @tc.name      SerialCommunication_SppPageStateListen_0061
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=3) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0061 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 3);
      logInfo(`listen(code=200, serverSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0062
     * @tc.name      SerialCommunication_SppPageStateListen_0062
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=10) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0062 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 10);
      logInfo(`listen(code=200, serverSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0063
     * @tc.name      SerialCommunication_SppPageStateListen_0063
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=5) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0063 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 5);
      logInfo(`listen(code=200, serverSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0064
     * @tc.name      SerialCommunication_SppPageStateListen_0064
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=15) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0064 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 15);
      logInfo(`listen(code=200, serverSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0065
     * @tc.name      SerialCommunication_SppPageStateListen_0065
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=20) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0065 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 20);
      logInfo(`listen(code=200, serverSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0066
     * @tc.name      SerialCommunication_SppPageStateListen_0066
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=25) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0066 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 25);
      logInfo(`listen(code=200, serverSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0067
     * @tc.name      SerialCommunication_SppPageStateListen_0067
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=30) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0067 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 30);
      logInfo(`listen(code=200, serverSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0068
     * @tc.name      SerialCommunication_SppPageStateListen_0068
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=35) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0068 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 35);
      logInfo(`listen(code=200, serverSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0069
     * @tc.name      SerialCommunication_SppPageStateListen_0069
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=40) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0069 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 40);
      logInfo(`listen(code=200, serverSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0070
     * @tc.name      SerialCommunication_SppPageStateListen_0070
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=45) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0070 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 45);
      logInfo(`listen(code=200, serverSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0071
     * @tc.name      SerialCommunication_SppPageStateListen_0071
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=50) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0071 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 50);
      logInfo(`listen(code=200, serverSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0072
     * @tc.name      SerialCommunication_SppPageStateListen_0072
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=55) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0072 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 55);
      logInfo(`listen(code=200, serverSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0073
     * @tc.name      SerialCommunication_SppPageStateListen_0073
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=60) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0073 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 60);
      logInfo(`listen(code=200, serverSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0074
     * @tc.name      SerialCommunication_SppPageStateListen_0074
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=65) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0074 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 65);
      logInfo(`listen(code=200, serverSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0075
     * @tc.name      SerialCommunication_SppPageStateListen_0075
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=70) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0075 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 70);
      logInfo(`listen(code=200, serverSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0076
     * @tc.name      SerialCommunication_SppPageStateListen_0076
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=75) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0076 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 75);
      logInfo(`listen(code=200, serverSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0077
     * @tc.name      SerialCommunication_SppPageStateListen_0077
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=80) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0077 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 80);
      logInfo(`listen(code=200, serverSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_LISTEN_0078
     * @tc.name      SerialCommunication_SppPageStateListen_0078
     * @tc.desc      SppPageState.listen(code=200, serverSocketId=85) yields "sppListen error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateListen_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateListen_0078 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.listen(200, 85);
      logInfo(`listen(code=200, serverSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppListen error, code is 200');
      logInfo(`listen(code=200, serverSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppListen error, code is 200');
      logInfo(`${BUNDLE}SppPageStateListen_0078 end`);
    });
  });
}
