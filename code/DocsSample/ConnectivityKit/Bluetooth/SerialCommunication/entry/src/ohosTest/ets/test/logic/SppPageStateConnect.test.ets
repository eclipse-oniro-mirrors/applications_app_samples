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
export default function sppPageStateConnectTest(): void {
  describe('SppPageStateConnectTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0001
     * @tc.name      SerialCommunication_SppPageStateConnect_0001
     * @tc.desc      SppPageState.connect(code=0, socketId=0) yields "sppConnect success, socketId = 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateConnect_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0001 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 0);
      logInfo(`connect(code=0, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 0');
      logInfo(`connect(code=0, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 0');
      logInfo(`${BUNDLE}SppPageStateConnect_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0002
     * @tc.name      SerialCommunication_SppPageStateConnect_0002
     * @tc.desc      SppPageState.connect(code=0, socketId=1) yields "sppConnect success, socketId = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateConnect_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0002 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 1);
      logInfo(`connect(code=0, socketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 1');
      logInfo(`connect(code=0, socketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0003
     * @tc.name      SerialCommunication_SppPageStateConnect_0003
     * @tc.desc      SppPageState.connect(code=0, socketId=-1) yields "sppConnect success, socketId = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0003 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, -1);
      logInfo(`connect(code=0, socketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = -1');
      logInfo(`connect(code=0, socketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0004
     * @tc.name      SerialCommunication_SppPageStateConnect_0004
     * @tc.desc      SppPageState.connect(code=0, socketId=100) yields "sppConnect success, socketId = 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0004 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 100);
      logInfo(`connect(code=0, socketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 100');
      logInfo(`connect(code=0, socketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 100');
      logInfo(`${BUNDLE}SppPageStateConnect_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0005
     * @tc.name      SerialCommunication_SppPageStateConnect_0005
     * @tc.desc      SppPageState.connect(code=0, socketId=2) yields "sppConnect success, socketId = 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0005 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 2);
      logInfo(`connect(code=0, socketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 2');
      logInfo(`connect(code=0, socketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 2');
      logInfo(`${BUNDLE}SppPageStateConnect_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0006
     * @tc.name      SerialCommunication_SppPageStateConnect_0006
     * @tc.desc      SppPageState.connect(code=0, socketId=3) yields "sppConnect success, socketId = 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0006 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 3);
      logInfo(`connect(code=0, socketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 3');
      logInfo(`connect(code=0, socketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 3');
      logInfo(`${BUNDLE}SppPageStateConnect_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0007
     * @tc.name      SerialCommunication_SppPageStateConnect_0007
     * @tc.desc      SppPageState.connect(code=0, socketId=10) yields "sppConnect success, socketId = 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0007 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 10);
      logInfo(`connect(code=0, socketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 10');
      logInfo(`connect(code=0, socketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 10');
      logInfo(`${BUNDLE}SppPageStateConnect_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0008
     * @tc.name      SerialCommunication_SppPageStateConnect_0008
     * @tc.desc      SppPageState.connect(code=0, socketId=5) yields "sppConnect success, socketId = 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0008 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 5);
      logInfo(`connect(code=0, socketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 5');
      logInfo(`connect(code=0, socketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 5');
      logInfo(`${BUNDLE}SppPageStateConnect_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0009
     * @tc.name      SerialCommunication_SppPageStateConnect_0009
     * @tc.desc      SppPageState.connect(code=0, socketId=15) yields "sppConnect success, socketId = 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0009 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 15);
      logInfo(`connect(code=0, socketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 15');
      logInfo(`connect(code=0, socketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 15');
      logInfo(`${BUNDLE}SppPageStateConnect_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0010
     * @tc.name      SerialCommunication_SppPageStateConnect_0010
     * @tc.desc      SppPageState.connect(code=0, socketId=20) yields "sppConnect success, socketId = 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0010 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 20);
      logInfo(`connect(code=0, socketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 20');
      logInfo(`connect(code=0, socketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 20');
      logInfo(`${BUNDLE}SppPageStateConnect_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0011
     * @tc.name      SerialCommunication_SppPageStateConnect_0011
     * @tc.desc      SppPageState.connect(code=0, socketId=25) yields "sppConnect success, socketId = 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0011 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 25);
      logInfo(`connect(code=0, socketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 25');
      logInfo(`connect(code=0, socketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 25');
      logInfo(`${BUNDLE}SppPageStateConnect_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0012
     * @tc.name      SerialCommunication_SppPageStateConnect_0012
     * @tc.desc      SppPageState.connect(code=0, socketId=30) yields "sppConnect success, socketId = 30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0012 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 30);
      logInfo(`connect(code=0, socketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 30');
      logInfo(`connect(code=0, socketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 30');
      logInfo(`${BUNDLE}SppPageStateConnect_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0013
     * @tc.name      SerialCommunication_SppPageStateConnect_0013
     * @tc.desc      SppPageState.connect(code=0, socketId=35) yields "sppConnect success, socketId = 35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0013 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 35);
      logInfo(`connect(code=0, socketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 35');
      logInfo(`connect(code=0, socketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 35');
      logInfo(`${BUNDLE}SppPageStateConnect_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0014
     * @tc.name      SerialCommunication_SppPageStateConnect_0014
     * @tc.desc      SppPageState.connect(code=0, socketId=40) yields "sppConnect success, socketId = 40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0014 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 40);
      logInfo(`connect(code=0, socketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 40');
      logInfo(`connect(code=0, socketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 40');
      logInfo(`${BUNDLE}SppPageStateConnect_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0015
     * @tc.name      SerialCommunication_SppPageStateConnect_0015
     * @tc.desc      SppPageState.connect(code=0, socketId=45) yields "sppConnect success, socketId = 45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0015 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 45);
      logInfo(`connect(code=0, socketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 45');
      logInfo(`connect(code=0, socketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 45');
      logInfo(`${BUNDLE}SppPageStateConnect_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0016
     * @tc.name      SerialCommunication_SppPageStateConnect_0016
     * @tc.desc      SppPageState.connect(code=0, socketId=50) yields "sppConnect success, socketId = 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0016 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 50);
      logInfo(`connect(code=0, socketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 50');
      logInfo(`connect(code=0, socketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 50');
      logInfo(`${BUNDLE}SppPageStateConnect_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0017
     * @tc.name      SerialCommunication_SppPageStateConnect_0017
     * @tc.desc      SppPageState.connect(code=0, socketId=55) yields "sppConnect success, socketId = 55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0017 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 55);
      logInfo(`connect(code=0, socketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 55');
      logInfo(`connect(code=0, socketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 55');
      logInfo(`${BUNDLE}SppPageStateConnect_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0018
     * @tc.name      SerialCommunication_SppPageStateConnect_0018
     * @tc.desc      SppPageState.connect(code=0, socketId=60) yields "sppConnect success, socketId = 60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0018 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 60);
      logInfo(`connect(code=0, socketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 60');
      logInfo(`connect(code=0, socketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 60');
      logInfo(`${BUNDLE}SppPageStateConnect_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0019
     * @tc.name      SerialCommunication_SppPageStateConnect_0019
     * @tc.desc      SppPageState.connect(code=0, socketId=65) yields "sppConnect success, socketId = 65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0019 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 65);
      logInfo(`connect(code=0, socketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 65');
      logInfo(`connect(code=0, socketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 65');
      logInfo(`${BUNDLE}SppPageStateConnect_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0020
     * @tc.name      SerialCommunication_SppPageStateConnect_0020
     * @tc.desc      SppPageState.connect(code=0, socketId=70) yields "sppConnect success, socketId = 70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0020 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 70);
      logInfo(`connect(code=0, socketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 70');
      logInfo(`connect(code=0, socketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 70');
      logInfo(`${BUNDLE}SppPageStateConnect_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0021
     * @tc.name      SerialCommunication_SppPageStateConnect_0021
     * @tc.desc      SppPageState.connect(code=0, socketId=75) yields "sppConnect success, socketId = 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0021 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 75);
      logInfo(`connect(code=0, socketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 75');
      logInfo(`connect(code=0, socketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 75');
      logInfo(`${BUNDLE}SppPageStateConnect_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0022
     * @tc.name      SerialCommunication_SppPageStateConnect_0022
     * @tc.desc      SppPageState.connect(code=0, socketId=80) yields "sppConnect success, socketId = 80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0022 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 80);
      logInfo(`connect(code=0, socketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 80');
      logInfo(`connect(code=0, socketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 80');
      logInfo(`${BUNDLE}SppPageStateConnect_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0023
     * @tc.name      SerialCommunication_SppPageStateConnect_0023
     * @tc.desc      SppPageState.connect(code=0, socketId=85) yields "sppConnect success, socketId = 85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0023 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 85);
      logInfo(`connect(code=0, socketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 85');
      logInfo(`connect(code=0, socketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 85');
      logInfo(`${BUNDLE}SppPageStateConnect_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0024
     * @tc.name      SerialCommunication_SppPageStateConnect_0024
     * @tc.desc      SppPageState.connect(code=0, socketId=90) yields "sppConnect success, socketId = 90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0024 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 90);
      logInfo(`connect(code=0, socketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 90');
      logInfo(`connect(code=0, socketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 90');
      logInfo(`${BUNDLE}SppPageStateConnect_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0025
     * @tc.name      SerialCommunication_SppPageStateConnect_0025
     * @tc.desc      SppPageState.connect(code=0, socketId=95) yields "sppConnect success, socketId = 95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0025 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 95);
      logInfo(`connect(code=0, socketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 95');
      logInfo(`connect(code=0, socketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 95');
      logInfo(`${BUNDLE}SppPageStateConnect_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0026
     * @tc.name      SerialCommunication_SppPageStateConnect_0026
     * @tc.desc      SppPageState.connect(code=0, socketId=105) yields "sppConnect success, socketId = 105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0026 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 105);
      logInfo(`connect(code=0, socketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 105');
      logInfo(`connect(code=0, socketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 105');
      logInfo(`${BUNDLE}SppPageStateConnect_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0027
     * @tc.name      SerialCommunication_SppPageStateConnect_0027
     * @tc.desc      SppPageState.connect(code=0, socketId=110) yields "sppConnect success, socketId = 110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0027 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 110);
      logInfo(`connect(code=0, socketId=110): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 110');
      logInfo(`connect(code=0, socketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 110');
      logInfo(`${BUNDLE}SppPageStateConnect_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0028
     * @tc.name      SerialCommunication_SppPageStateConnect_0028
     * @tc.desc      SppPageState.connect(code=0, socketId=115) yields "sppConnect success, socketId = 115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0028 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 115);
      logInfo(`connect(code=0, socketId=115): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 115');
      logInfo(`connect(code=0, socketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 115');
      logInfo(`${BUNDLE}SppPageStateConnect_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0029
     * @tc.name      SerialCommunication_SppPageStateConnect_0029
     * @tc.desc      SppPageState.connect(code=0, socketId=79) yields "sppConnect success, socketId = 79"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0029 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, 79);
      logInfo(`connect(code=0, socketId=79): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 79');
      logInfo(`connect(code=0, socketId=79) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = 79');
      logInfo(`${BUNDLE}SppPageStateConnect_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0030
     * @tc.name      SerialCommunication_SppPageStateConnect_0030
     * @tc.desc      SppPageState.connect(code=0, socketId=-10) yields "sppConnect success, socketId = -10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppPageStateConnect_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0030 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(0, -10);
      logInfo(`connect(code=0, socketId=-10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = -10');
      logInfo(`connect(code=0, socketId=-10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect success, socketId = -10');
      logInfo(`${BUNDLE}SppPageStateConnect_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0031
     * @tc.name      SerialCommunication_SppPageStateConnect_0031
     * @tc.desc      SppPageState.connect(code=200, socketId=0) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0031 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 0);
      logInfo(`connect(code=200, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0032
     * @tc.name      SerialCommunication_SppPageStateConnect_0032
     * @tc.desc      SppPageState.connect(code=-1, socketId=0) yields "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0032 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(-1, 0);
      logInfo(`connect(code=-1, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`connect(code=-1, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}SppPageStateConnect_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0033
     * @tc.name      SerialCommunication_SppPageStateConnect_0033
     * @tc.desc      SppPageState.connect(code=1, socketId=0) yields "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0033 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(1, 0);
      logInfo(`connect(code=1, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`connect(code=1, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}SppPageStateConnect_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0034
     * @tc.name      SerialCommunication_SppPageStateConnect_0034
     * @tc.desc      SppPageState.connect(code=401, socketId=0) yields "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0034 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(401, 0);
      logInfo(`connect(code=401, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`connect(code=401, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}SppPageStateConnect_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0035
     * @tc.name      SerialCommunication_SppPageStateConnect_0035
     * @tc.desc      SppPageState.connect(code=404, socketId=0) yields "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0035 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(404, 0);
      logInfo(`connect(code=404, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`connect(code=404, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}SppPageStateConnect_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0036
     * @tc.name      SerialCommunication_SppPageStateConnect_0036
     * @tc.desc      SppPageState.connect(code=500, socketId=0) yields "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0036 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(500, 0);
      logInfo(`connect(code=500, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`connect(code=500, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}SppPageStateConnect_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0037
     * @tc.name      SerialCommunication_SppPageStateConnect_0037
     * @tc.desc      SppPageState.connect(code=2, socketId=0) yields "sppConnect error, code = 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0037 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(2, 0);
      logInfo(`connect(code=2, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 2');
      logInfo(`connect(code=2, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 2');
      logInfo(`${BUNDLE}SppPageStateConnect_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0038
     * @tc.name      SerialCommunication_SppPageStateConnect_0038
     * @tc.desc      SppPageState.connect(code=3, socketId=0) yields "sppConnect error, code = 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0038 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(3, 0);
      logInfo(`connect(code=3, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 3');
      logInfo(`connect(code=3, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 3');
      logInfo(`${BUNDLE}SppPageStateConnect_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0039
     * @tc.name      SerialCommunication_SppPageStateConnect_0039
     * @tc.desc      SppPageState.connect(code=10, socketId=0) yields "sppConnect error, code = 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0039 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(10, 0);
      logInfo(`connect(code=10, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 10');
      logInfo(`connect(code=10, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 10');
      logInfo(`${BUNDLE}SppPageStateConnect_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0040
     * @tc.name      SerialCommunication_SppPageStateConnect_0040
     * @tc.desc      SppPageState.connect(code=100, socketId=0) yields "sppConnect error, code = 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0040 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(100, 0);
      logInfo(`connect(code=100, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 100');
      logInfo(`connect(code=100, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 100');
      logInfo(`${BUNDLE}SppPageStateConnect_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0041
     * @tc.name      SerialCommunication_SppPageStateConnect_0041
     * @tc.desc      SppPageState.connect(code=25, socketId=0) yields "sppConnect error, code = 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0041 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(25, 0);
      logInfo(`connect(code=25, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 25');
      logInfo(`connect(code=25, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 25');
      logInfo(`${BUNDLE}SppPageStateConnect_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0042
     * @tc.name      SerialCommunication_SppPageStateConnect_0042
     * @tc.desc      SppPageState.connect(code=50, socketId=0) yields "sppConnect error, code = 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0042 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(50, 0);
      logInfo(`connect(code=50, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 50');
      logInfo(`connect(code=50, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 50');
      logInfo(`${BUNDLE}SppPageStateConnect_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0043
     * @tc.name      SerialCommunication_SppPageStateConnect_0043
     * @tc.desc      SppPageState.connect(code=75, socketId=0) yields "sppConnect error, code = 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0043 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(75, 0);
      logInfo(`connect(code=75, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 75');
      logInfo(`connect(code=75, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 75');
      logInfo(`${BUNDLE}SppPageStateConnect_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0044
     * @tc.name      SerialCommunication_SppPageStateConnect_0044
     * @tc.desc      SppPageState.connect(code=125, socketId=0) yields "sppConnect error, code = 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0044 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(125, 0);
      logInfo(`connect(code=125, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 125');
      logInfo(`connect(code=125, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 125');
      logInfo(`${BUNDLE}SppPageStateConnect_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0045
     * @tc.name      SerialCommunication_SppPageStateConnect_0045
     * @tc.desc      SppPageState.connect(code=150, socketId=0) yields "sppConnect error, code = 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0045 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(150, 0);
      logInfo(`connect(code=150, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 150');
      logInfo(`connect(code=150, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 150');
      logInfo(`${BUNDLE}SppPageStateConnect_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0046
     * @tc.name      SerialCommunication_SppPageStateConnect_0046
     * @tc.desc      SppPageState.connect(code=175, socketId=0) yields "sppConnect error, code = 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0046 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(175, 0);
      logInfo(`connect(code=175, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 175');
      logInfo(`connect(code=175, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 175');
      logInfo(`${BUNDLE}SppPageStateConnect_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0047
     * @tc.name      SerialCommunication_SppPageStateConnect_0047
     * @tc.desc      SppPageState.connect(code=225, socketId=0) yields "sppConnect error, code = 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0047 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(225, 0);
      logInfo(`connect(code=225, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 225');
      logInfo(`connect(code=225, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 225');
      logInfo(`${BUNDLE}SppPageStateConnect_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0048
     * @tc.name      SerialCommunication_SppPageStateConnect_0048
     * @tc.desc      SppPageState.connect(code=250, socketId=0) yields "sppConnect error, code = 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0048 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(250, 0);
      logInfo(`connect(code=250, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 250');
      logInfo(`connect(code=250, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 250');
      logInfo(`${BUNDLE}SppPageStateConnect_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0049
     * @tc.name      SerialCommunication_SppPageStateConnect_0049
     * @tc.desc      SppPageState.connect(code=275, socketId=0) yields "sppConnect error, code = 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0049 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(275, 0);
      logInfo(`connect(code=275, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 275');
      logInfo(`connect(code=275, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 275');
      logInfo(`${BUNDLE}SppPageStateConnect_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0050
     * @tc.name      SerialCommunication_SppPageStateConnect_0050
     * @tc.desc      SppPageState.connect(code=300, socketId=0) yields "sppConnect error, code = 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0050 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(300, 0);
      logInfo(`connect(code=300, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 300');
      logInfo(`connect(code=300, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 300');
      logInfo(`${BUNDLE}SppPageStateConnect_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0051
     * @tc.name      SerialCommunication_SppPageStateConnect_0051
     * @tc.desc      SppPageState.connect(code=325, socketId=0) yields "sppConnect error, code = 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0051 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(325, 0);
      logInfo(`connect(code=325, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 325');
      logInfo(`connect(code=325, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 325');
      logInfo(`${BUNDLE}SppPageStateConnect_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0052
     * @tc.name      SerialCommunication_SppPageStateConnect_0052
     * @tc.desc      SppPageState.connect(code=350, socketId=0) yields "sppConnect error, code = 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0052 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(350, 0);
      logInfo(`connect(code=350, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 350');
      logInfo(`connect(code=350, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 350');
      logInfo(`${BUNDLE}SppPageStateConnect_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0053
     * @tc.name      SerialCommunication_SppPageStateConnect_0053
     * @tc.desc      SppPageState.connect(code=375, socketId=0) yields "sppConnect error, code = 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0053 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(375, 0);
      logInfo(`connect(code=375, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 375');
      logInfo(`connect(code=375, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 375');
      logInfo(`${BUNDLE}SppPageStateConnect_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0054
     * @tc.name      SerialCommunication_SppPageStateConnect_0054
     * @tc.desc      SppPageState.connect(code=400, socketId=0) yields "sppConnect error, code = 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0054 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(400, 0);
      logInfo(`connect(code=400, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 400');
      logInfo(`connect(code=400, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 400');
      logInfo(`${BUNDLE}SppPageStateConnect_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0055
     * @tc.name      SerialCommunication_SppPageStateConnect_0055
     * @tc.desc      SppPageState.connect(code=425, socketId=0) yields "sppConnect error, code = 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0055 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(425, 0);
      logInfo(`connect(code=425, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 425');
      logInfo(`connect(code=425, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 425');
      logInfo(`${BUNDLE}SppPageStateConnect_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0056
     * @tc.name      SerialCommunication_SppPageStateConnect_0056
     * @tc.desc      SppPageState.connect(code=450, socketId=0) yields "sppConnect error, code = 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0056 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(450, 0);
      logInfo(`connect(code=450, socketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 450');
      logInfo(`connect(code=450, socketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 450');
      logInfo(`${BUNDLE}SppPageStateConnect_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0057
     * @tc.name      SerialCommunication_SppPageStateConnect_0057
     * @tc.desc      SppPageState.connect(code=200, socketId=1) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0057 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 1);
      logInfo(`connect(code=200, socketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0058
     * @tc.name      SerialCommunication_SppPageStateConnect_0058
     * @tc.desc      SppPageState.connect(code=200, socketId=-1) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateConnect_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0058 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, -1);
      logInfo(`connect(code=200, socketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0059
     * @tc.name      SerialCommunication_SppPageStateConnect_0059
     * @tc.desc      SppPageState.connect(code=200, socketId=100) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0059 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 100);
      logInfo(`connect(code=200, socketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0060
     * @tc.name      SerialCommunication_SppPageStateConnect_0060
     * @tc.desc      SppPageState.connect(code=200, socketId=2) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0060 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 2);
      logInfo(`connect(code=200, socketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0061
     * @tc.name      SerialCommunication_SppPageStateConnect_0061
     * @tc.desc      SppPageState.connect(code=200, socketId=3) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0061 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 3);
      logInfo(`connect(code=200, socketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0062
     * @tc.name      SerialCommunication_SppPageStateConnect_0062
     * @tc.desc      SppPageState.connect(code=200, socketId=10) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0062 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 10);
      logInfo(`connect(code=200, socketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0063
     * @tc.name      SerialCommunication_SppPageStateConnect_0063
     * @tc.desc      SppPageState.connect(code=200, socketId=5) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0063 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 5);
      logInfo(`connect(code=200, socketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0064
     * @tc.name      SerialCommunication_SppPageStateConnect_0064
     * @tc.desc      SppPageState.connect(code=200, socketId=15) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0064 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 15);
      logInfo(`connect(code=200, socketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0065
     * @tc.name      SerialCommunication_SppPageStateConnect_0065
     * @tc.desc      SppPageState.connect(code=200, socketId=20) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0065 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 20);
      logInfo(`connect(code=200, socketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0066
     * @tc.name      SerialCommunication_SppPageStateConnect_0066
     * @tc.desc      SppPageState.connect(code=200, socketId=25) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0066 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 25);
      logInfo(`connect(code=200, socketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0067
     * @tc.name      SerialCommunication_SppPageStateConnect_0067
     * @tc.desc      SppPageState.connect(code=200, socketId=30) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0067 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 30);
      logInfo(`connect(code=200, socketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0068
     * @tc.name      SerialCommunication_SppPageStateConnect_0068
     * @tc.desc      SppPageState.connect(code=200, socketId=35) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0068 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 35);
      logInfo(`connect(code=200, socketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0069
     * @tc.name      SerialCommunication_SppPageStateConnect_0069
     * @tc.desc      SppPageState.connect(code=200, socketId=40) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0069 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 40);
      logInfo(`connect(code=200, socketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0070
     * @tc.name      SerialCommunication_SppPageStateConnect_0070
     * @tc.desc      SppPageState.connect(code=200, socketId=45) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0070 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 45);
      logInfo(`connect(code=200, socketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0071
     * @tc.name      SerialCommunication_SppPageStateConnect_0071
     * @tc.desc      SppPageState.connect(code=200, socketId=50) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0071 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 50);
      logInfo(`connect(code=200, socketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0072
     * @tc.name      SerialCommunication_SppPageStateConnect_0072
     * @tc.desc      SppPageState.connect(code=200, socketId=55) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0072 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 55);
      logInfo(`connect(code=200, socketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0073
     * @tc.name      SerialCommunication_SppPageStateConnect_0073
     * @tc.desc      SppPageState.connect(code=200, socketId=60) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0073 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 60);
      logInfo(`connect(code=200, socketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0074
     * @tc.name      SerialCommunication_SppPageStateConnect_0074
     * @tc.desc      SppPageState.connect(code=200, socketId=65) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0074 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 65);
      logInfo(`connect(code=200, socketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0075
     * @tc.name      SerialCommunication_SppPageStateConnect_0075
     * @tc.desc      SppPageState.connect(code=200, socketId=70) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0075 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 70);
      logInfo(`connect(code=200, socketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0076
     * @tc.name      SerialCommunication_SppPageStateConnect_0076
     * @tc.desc      SppPageState.connect(code=200, socketId=75) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0076 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 75);
      logInfo(`connect(code=200, socketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0077
     * @tc.name      SerialCommunication_SppPageStateConnect_0077
     * @tc.desc      SppPageState.connect(code=200, socketId=80) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0077 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 80);
      logInfo(`connect(code=200, socketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0078
     * @tc.name      SerialCommunication_SppPageStateConnect_0078
     * @tc.desc      SppPageState.connect(code=200, socketId=85) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0078 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 85);
      logInfo(`connect(code=200, socketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0079
     * @tc.name      SerialCommunication_SppPageStateConnect_0079
     * @tc.desc      SppPageState.connect(code=200, socketId=90) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0079 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 90);
      logInfo(`connect(code=200, socketId=90): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0080
     * @tc.name      SerialCommunication_SppPageStateConnect_0080
     * @tc.desc      SppPageState.connect(code=200, socketId=95) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0080 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 95);
      logInfo(`connect(code=200, socketId=95): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_CONNECT_0081
     * @tc.name      SerialCommunication_SppPageStateConnect_0081
     * @tc.desc      SppPageState.connect(code=200, socketId=105) yields "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateConnect_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateConnect_0081 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.connect(200, 105);
      logInfo(`connect(code=200, socketId=105): actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`connect(code=200, socketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}SppPageStateConnect_0081 end`);
    });
  });
}
