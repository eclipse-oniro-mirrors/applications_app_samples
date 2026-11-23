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

/** Logic checks for SppPageState.accept (78 cases). */
export default function sppPageStateAcceptTest(): void {
  describe('SppPageStateAcceptTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0001
     * @tc.name      SerialCommunication_SppPageStateAccept_0001
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=0) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateAccept_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0001 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 0);
      logInfo(`accept(code=0, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=0) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(0);
      logInfo(`accept(code=0, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0002
     * @tc.name      SerialCommunication_SppPageStateAccept_0002
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=1) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppPageStateAccept_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0002 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 1);
      logInfo(`accept(code=0, clientSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0003
     * @tc.name      SerialCommunication_SppPageStateAccept_0003
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=-1) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0003 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, -1);
      logInfo(`accept(code=0, clientSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=-1) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(-1);
      logInfo(`accept(code=0, clientSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0004
     * @tc.name      SerialCommunication_SppPageStateAccept_0004
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=100) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0004 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 100);
      logInfo(`accept(code=0, clientSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=100) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(100);
      logInfo(`accept(code=0, clientSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0005
     * @tc.name      SerialCommunication_SppPageStateAccept_0005
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=2) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0005 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 2);
      logInfo(`accept(code=0, clientSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=2) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(2);
      logInfo(`accept(code=0, clientSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0006
     * @tc.name      SerialCommunication_SppPageStateAccept_0006
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=3) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0006 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 3);
      logInfo(`accept(code=0, clientSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=3) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(3);
      logInfo(`accept(code=0, clientSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0007
     * @tc.name      SerialCommunication_SppPageStateAccept_0007
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=10) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0007 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 10);
      logInfo(`accept(code=0, clientSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=10) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(10);
      logInfo(`accept(code=0, clientSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0008
     * @tc.name      SerialCommunication_SppPageStateAccept_0008
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=5) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0008 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 5);
      logInfo(`accept(code=0, clientSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=5) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(5);
      logInfo(`accept(code=0, clientSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0009
     * @tc.name      SerialCommunication_SppPageStateAccept_0009
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=15) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0009 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 15);
      logInfo(`accept(code=0, clientSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=15) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(15);
      logInfo(`accept(code=0, clientSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0010
     * @tc.name      SerialCommunication_SppPageStateAccept_0010
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=20) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0010 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 20);
      logInfo(`accept(code=0, clientSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=20) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(20);
      logInfo(`accept(code=0, clientSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0011
     * @tc.name      SerialCommunication_SppPageStateAccept_0011
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=25) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0011 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 25);
      logInfo(`accept(code=0, clientSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=25) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(25);
      logInfo(`accept(code=0, clientSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0012
     * @tc.name      SerialCommunication_SppPageStateAccept_0012
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=30) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0012 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 30);
      logInfo(`accept(code=0, clientSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=30) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(30);
      logInfo(`accept(code=0, clientSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0013
     * @tc.name      SerialCommunication_SppPageStateAccept_0013
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=35) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0013 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 35);
      logInfo(`accept(code=0, clientSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=35) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(35);
      logInfo(`accept(code=0, clientSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0014
     * @tc.name      SerialCommunication_SppPageStateAccept_0014
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=40) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0014 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 40);
      logInfo(`accept(code=0, clientSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=40) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(40);
      logInfo(`accept(code=0, clientSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0015
     * @tc.name      SerialCommunication_SppPageStateAccept_0015
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=45) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0015 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 45);
      logInfo(`accept(code=0, clientSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=45) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(45);
      logInfo(`accept(code=0, clientSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0016
     * @tc.name      SerialCommunication_SppPageStateAccept_0016
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=50) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0016 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 50);
      logInfo(`accept(code=0, clientSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=50) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(50);
      logInfo(`accept(code=0, clientSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0017
     * @tc.name      SerialCommunication_SppPageStateAccept_0017
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=55) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0017 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 55);
      logInfo(`accept(code=0, clientSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=55) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(55);
      logInfo(`accept(code=0, clientSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0018
     * @tc.name      SerialCommunication_SppPageStateAccept_0018
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=60) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0018 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 60);
      logInfo(`accept(code=0, clientSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=60) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(60);
      logInfo(`accept(code=0, clientSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0019
     * @tc.name      SerialCommunication_SppPageStateAccept_0019
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=65) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0019 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 65);
      logInfo(`accept(code=0, clientSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=65) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(65);
      logInfo(`accept(code=0, clientSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0020
     * @tc.name      SerialCommunication_SppPageStateAccept_0020
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=70) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0020 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 70);
      logInfo(`accept(code=0, clientSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=70) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(70);
      logInfo(`accept(code=0, clientSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0021
     * @tc.name      SerialCommunication_SppPageStateAccept_0021
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=75) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0021 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 75);
      logInfo(`accept(code=0, clientSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=75) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(75);
      logInfo(`accept(code=0, clientSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0022
     * @tc.name      SerialCommunication_SppPageStateAccept_0022
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=80) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0022 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 80);
      logInfo(`accept(code=0, clientSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=80) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(80);
      logInfo(`accept(code=0, clientSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0023
     * @tc.name      SerialCommunication_SppPageStateAccept_0023
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=85) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0023 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 85);
      logInfo(`accept(code=0, clientSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=85) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(85);
      logInfo(`accept(code=0, clientSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0024
     * @tc.name      SerialCommunication_SppPageStateAccept_0024
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=90) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0024 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 90);
      logInfo(`accept(code=0, clientSocketId=90): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=90) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(90);
      logInfo(`accept(code=0, clientSocketId=90) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0025
     * @tc.name      SerialCommunication_SppPageStateAccept_0025
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=95) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0025 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 95);
      logInfo(`accept(code=0, clientSocketId=95): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=95) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(95);
      logInfo(`accept(code=0, clientSocketId=95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0026
     * @tc.name      SerialCommunication_SppPageStateAccept_0026
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=105) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0026 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 105);
      logInfo(`accept(code=0, clientSocketId=105): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=105) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(105);
      logInfo(`accept(code=0, clientSocketId=105) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0027
     * @tc.name      SerialCommunication_SppPageStateAccept_0027
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=110) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0027 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 110);
      logInfo(`accept(code=0, clientSocketId=110): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=110) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(110);
      logInfo(`accept(code=0, clientSocketId=110) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0028
     * @tc.name      SerialCommunication_SppPageStateAccept_0028
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=115) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0028 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 115);
      logInfo(`accept(code=0, clientSocketId=115): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=115) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(115);
      logInfo(`accept(code=0, clientSocketId=115) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0029
     * @tc.name      SerialCommunication_SppPageStateAccept_0029
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=93) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0029 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 93);
      logInfo(`accept(code=0, clientSocketId=93): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=93) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertEqual(93);
      logInfo(`accept(code=0, clientSocketId=93) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0030
     * @tc.name      SerialCommunication_SppPageStateAccept_0030
     * @tc.desc      SppPageState.accept(code=0, clientSocketId=64.95) yields "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0030 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(0, 64.95);
      logInfo(`accept(code=0, clientSocketId=64.95): actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`accept(code=0, clientSocketId=64.95) state: subject.clientNumber=${subject.clientNumber}`);
      expect(subject.clientNumber).assertClose(64.95, PRECISION);
      logInfo(`accept(code=0, clientSocketId=64.95) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SppPageStateAccept_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0031
     * @tc.name      SerialCommunication_SppPageStateAccept_0031
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=0) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0031 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 0);
      logInfo(`accept(code=200, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0032
     * @tc.name      SerialCommunication_SppPageStateAccept_0032
     * @tc.desc      SppPageState.accept(code=-1, clientSocketId=0) yields "sppAccept error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0032 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(-1, 0);
      logInfo(`accept(code=-1, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is -1');
      logInfo(`accept(code=-1, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is -1');
      logInfo(`${BUNDLE}SppPageStateAccept_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0033
     * @tc.name      SerialCommunication_SppPageStateAccept_0033
     * @tc.desc      SppPageState.accept(code=1, clientSocketId=0) yields "sppAccept error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0033 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(1, 0);
      logInfo(`accept(code=1, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 1');
      logInfo(`accept(code=1, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 1');
      logInfo(`${BUNDLE}SppPageStateAccept_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0034
     * @tc.name      SerialCommunication_SppPageStateAccept_0034
     * @tc.desc      SppPageState.accept(code=401, clientSocketId=0) yields "sppAccept error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0034 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(401, 0);
      logInfo(`accept(code=401, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 401');
      logInfo(`accept(code=401, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 401');
      logInfo(`${BUNDLE}SppPageStateAccept_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0035
     * @tc.name      SerialCommunication_SppPageStateAccept_0035
     * @tc.desc      SppPageState.accept(code=404, clientSocketId=0) yields "sppAccept error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0035 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(404, 0);
      logInfo(`accept(code=404, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 404');
      logInfo(`accept(code=404, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 404');
      logInfo(`${BUNDLE}SppPageStateAccept_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0036
     * @tc.name      SerialCommunication_SppPageStateAccept_0036
     * @tc.desc      SppPageState.accept(code=500, clientSocketId=0) yields "sppAccept error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0036 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(500, 0);
      logInfo(`accept(code=500, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 500');
      logInfo(`accept(code=500, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 500');
      logInfo(`${BUNDLE}SppPageStateAccept_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0037
     * @tc.name      SerialCommunication_SppPageStateAccept_0037
     * @tc.desc      SppPageState.accept(code=2, clientSocketId=0) yields "sppAccept error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0037 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(2, 0);
      logInfo(`accept(code=2, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 2');
      logInfo(`accept(code=2, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 2');
      logInfo(`${BUNDLE}SppPageStateAccept_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0038
     * @tc.name      SerialCommunication_SppPageStateAccept_0038
     * @tc.desc      SppPageState.accept(code=3, clientSocketId=0) yields "sppAccept error, code is 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0038 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(3, 0);
      logInfo(`accept(code=3, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 3');
      logInfo(`accept(code=3, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 3');
      logInfo(`${BUNDLE}SppPageStateAccept_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0039
     * @tc.name      SerialCommunication_SppPageStateAccept_0039
     * @tc.desc      SppPageState.accept(code=10, clientSocketId=0) yields "sppAccept error, code is 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0039 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(10, 0);
      logInfo(`accept(code=10, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 10');
      logInfo(`accept(code=10, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 10');
      logInfo(`${BUNDLE}SppPageStateAccept_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0040
     * @tc.name      SerialCommunication_SppPageStateAccept_0040
     * @tc.desc      SppPageState.accept(code=100, clientSocketId=0) yields "sppAccept error, code is 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0040 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(100, 0);
      logInfo(`accept(code=100, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 100');
      logInfo(`accept(code=100, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 100');
      logInfo(`${BUNDLE}SppPageStateAccept_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0041
     * @tc.name      SerialCommunication_SppPageStateAccept_0041
     * @tc.desc      SppPageState.accept(code=25, clientSocketId=0) yields "sppAccept error, code is 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0041 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(25, 0);
      logInfo(`accept(code=25, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 25');
      logInfo(`accept(code=25, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 25');
      logInfo(`${BUNDLE}SppPageStateAccept_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0042
     * @tc.name      SerialCommunication_SppPageStateAccept_0042
     * @tc.desc      SppPageState.accept(code=50, clientSocketId=0) yields "sppAccept error, code is 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0042 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(50, 0);
      logInfo(`accept(code=50, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 50');
      logInfo(`accept(code=50, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 50');
      logInfo(`${BUNDLE}SppPageStateAccept_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0043
     * @tc.name      SerialCommunication_SppPageStateAccept_0043
     * @tc.desc      SppPageState.accept(code=75, clientSocketId=0) yields "sppAccept error, code is 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0043 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(75, 0);
      logInfo(`accept(code=75, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 75');
      logInfo(`accept(code=75, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 75');
      logInfo(`${BUNDLE}SppPageStateAccept_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0044
     * @tc.name      SerialCommunication_SppPageStateAccept_0044
     * @tc.desc      SppPageState.accept(code=125, clientSocketId=0) yields "sppAccept error, code is 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0044 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(125, 0);
      logInfo(`accept(code=125, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 125');
      logInfo(`accept(code=125, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 125');
      logInfo(`${BUNDLE}SppPageStateAccept_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0045
     * @tc.name      SerialCommunication_SppPageStateAccept_0045
     * @tc.desc      SppPageState.accept(code=150, clientSocketId=0) yields "sppAccept error, code is 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0045 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(150, 0);
      logInfo(`accept(code=150, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 150');
      logInfo(`accept(code=150, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 150');
      logInfo(`${BUNDLE}SppPageStateAccept_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0046
     * @tc.name      SerialCommunication_SppPageStateAccept_0046
     * @tc.desc      SppPageState.accept(code=175, clientSocketId=0) yields "sppAccept error, code is 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0046 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(175, 0);
      logInfo(`accept(code=175, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 175');
      logInfo(`accept(code=175, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 175');
      logInfo(`${BUNDLE}SppPageStateAccept_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0047
     * @tc.name      SerialCommunication_SppPageStateAccept_0047
     * @tc.desc      SppPageState.accept(code=225, clientSocketId=0) yields "sppAccept error, code is 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0047 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(225, 0);
      logInfo(`accept(code=225, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 225');
      logInfo(`accept(code=225, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 225');
      logInfo(`${BUNDLE}SppPageStateAccept_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0048
     * @tc.name      SerialCommunication_SppPageStateAccept_0048
     * @tc.desc      SppPageState.accept(code=250, clientSocketId=0) yields "sppAccept error, code is 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0048 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(250, 0);
      logInfo(`accept(code=250, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 250');
      logInfo(`accept(code=250, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 250');
      logInfo(`${BUNDLE}SppPageStateAccept_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0049
     * @tc.name      SerialCommunication_SppPageStateAccept_0049
     * @tc.desc      SppPageState.accept(code=275, clientSocketId=0) yields "sppAccept error, code is 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0049 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(275, 0);
      logInfo(`accept(code=275, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 275');
      logInfo(`accept(code=275, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 275');
      logInfo(`${BUNDLE}SppPageStateAccept_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0050
     * @tc.name      SerialCommunication_SppPageStateAccept_0050
     * @tc.desc      SppPageState.accept(code=300, clientSocketId=0) yields "sppAccept error, code is 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0050 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(300, 0);
      logInfo(`accept(code=300, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 300');
      logInfo(`accept(code=300, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 300');
      logInfo(`${BUNDLE}SppPageStateAccept_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0051
     * @tc.name      SerialCommunication_SppPageStateAccept_0051
     * @tc.desc      SppPageState.accept(code=325, clientSocketId=0) yields "sppAccept error, code is 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0051 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(325, 0);
      logInfo(`accept(code=325, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 325');
      logInfo(`accept(code=325, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 325');
      logInfo(`${BUNDLE}SppPageStateAccept_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0052
     * @tc.name      SerialCommunication_SppPageStateAccept_0052
     * @tc.desc      SppPageState.accept(code=350, clientSocketId=0) yields "sppAccept error, code is 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0052 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(350, 0);
      logInfo(`accept(code=350, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 350');
      logInfo(`accept(code=350, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 350');
      logInfo(`${BUNDLE}SppPageStateAccept_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0053
     * @tc.name      SerialCommunication_SppPageStateAccept_0053
     * @tc.desc      SppPageState.accept(code=375, clientSocketId=0) yields "sppAccept error, code is 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0053 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(375, 0);
      logInfo(`accept(code=375, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 375');
      logInfo(`accept(code=375, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 375');
      logInfo(`${BUNDLE}SppPageStateAccept_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0054
     * @tc.name      SerialCommunication_SppPageStateAccept_0054
     * @tc.desc      SppPageState.accept(code=400, clientSocketId=0) yields "sppAccept error, code is 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0054 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(400, 0);
      logInfo(`accept(code=400, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 400');
      logInfo(`accept(code=400, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 400');
      logInfo(`${BUNDLE}SppPageStateAccept_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0055
     * @tc.name      SerialCommunication_SppPageStateAccept_0055
     * @tc.desc      SppPageState.accept(code=425, clientSocketId=0) yields "sppAccept error, code is 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0055 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(425, 0);
      logInfo(`accept(code=425, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 425');
      logInfo(`accept(code=425, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 425');
      logInfo(`${BUNDLE}SppPageStateAccept_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0056
     * @tc.name      SerialCommunication_SppPageStateAccept_0056
     * @tc.desc      SppPageState.accept(code=450, clientSocketId=0) yields "sppAccept error, code is 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0056 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(450, 0);
      logInfo(`accept(code=450, clientSocketId=0): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 450');
      logInfo(`accept(code=450, clientSocketId=0) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 450');
      logInfo(`${BUNDLE}SppPageStateAccept_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0057
     * @tc.name      SerialCommunication_SppPageStateAccept_0057
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=1) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0057 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 1);
      logInfo(`accept(code=200, clientSocketId=1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0058
     * @tc.name      SerialCommunication_SppPageStateAccept_0058
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=-1) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SppPageStateAccept_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0058 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, -1);
      logInfo(`accept(code=200, clientSocketId=-1): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=-1) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0059
     * @tc.name      SerialCommunication_SppPageStateAccept_0059
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=100) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0059 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 100);
      logInfo(`accept(code=200, clientSocketId=100): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=100) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0060
     * @tc.name      SerialCommunication_SppPageStateAccept_0060
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=2) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0060 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 2);
      logInfo(`accept(code=200, clientSocketId=2): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=2) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0061
     * @tc.name      SerialCommunication_SppPageStateAccept_0061
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=3) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0061 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 3);
      logInfo(`accept(code=200, clientSocketId=3): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=3) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0062
     * @tc.name      SerialCommunication_SppPageStateAccept_0062
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=10) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0062 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 10);
      logInfo(`accept(code=200, clientSocketId=10): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=10) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0063
     * @tc.name      SerialCommunication_SppPageStateAccept_0063
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=5) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0063 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 5);
      logInfo(`accept(code=200, clientSocketId=5): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=5) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0064
     * @tc.name      SerialCommunication_SppPageStateAccept_0064
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=15) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0064 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 15);
      logInfo(`accept(code=200, clientSocketId=15): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=15) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0065
     * @tc.name      SerialCommunication_SppPageStateAccept_0065
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=20) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0065 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 20);
      logInfo(`accept(code=200, clientSocketId=20): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=20) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0066
     * @tc.name      SerialCommunication_SppPageStateAccept_0066
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=25) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0066 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 25);
      logInfo(`accept(code=200, clientSocketId=25): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=25) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0067
     * @tc.name      SerialCommunication_SppPageStateAccept_0067
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=30) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0067 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 30);
      logInfo(`accept(code=200, clientSocketId=30): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=30) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0068
     * @tc.name      SerialCommunication_SppPageStateAccept_0068
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=35) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0068 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 35);
      logInfo(`accept(code=200, clientSocketId=35): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=35) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0069
     * @tc.name      SerialCommunication_SppPageStateAccept_0069
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=40) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0069 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 40);
      logInfo(`accept(code=200, clientSocketId=40): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=40) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0070
     * @tc.name      SerialCommunication_SppPageStateAccept_0070
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=45) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0070 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 45);
      logInfo(`accept(code=200, clientSocketId=45): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=45) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0071
     * @tc.name      SerialCommunication_SppPageStateAccept_0071
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=50) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0071 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 50);
      logInfo(`accept(code=200, clientSocketId=50): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=50) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0072
     * @tc.name      SerialCommunication_SppPageStateAccept_0072
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=55) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0072 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 55);
      logInfo(`accept(code=200, clientSocketId=55): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=55) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0073
     * @tc.name      SerialCommunication_SppPageStateAccept_0073
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=60) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0073 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 60);
      logInfo(`accept(code=200, clientSocketId=60): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=60) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0074
     * @tc.name      SerialCommunication_SppPageStateAccept_0074
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=65) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0074 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 65);
      logInfo(`accept(code=200, clientSocketId=65): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=65) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0075
     * @tc.name      SerialCommunication_SppPageStateAccept_0075
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=70) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0075 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 70);
      logInfo(`accept(code=200, clientSocketId=70): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=70) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0076
     * @tc.name      SerialCommunication_SppPageStateAccept_0076
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=75) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0076 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 75);
      logInfo(`accept(code=200, clientSocketId=75): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=75) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0077
     * @tc.name      SerialCommunication_SppPageStateAccept_0077
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=80) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0077 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 80);
      logInfo(`accept(code=200, clientSocketId=80): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=80) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_PAGE_STATE_ACCEPT_0078
     * @tc.name      SerialCommunication_SppPageStateAccept_0078
     * @tc.desc      SppPageState.accept(code=200, clientSocketId=85) yields "sppAccept error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppPageStateAccept_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppPageStateAccept_0078 begin`);
      const subject: SppPageState = new SppPageState();
      const actual: string = subject.accept(200, 85);
      logInfo(`accept(code=200, clientSocketId=85): actual=${actual}`);
      expect(actual).assertEqual('sppAccept error, code is 200');
      logInfo(`accept(code=200, clientSocketId=85) state: subject.lastToast=${subject.lastToast}`);
      expect(subject.lastToast).assertEqual('sppAccept error, code is 200');
      logInfo(`${BUNDLE}SppPageStateAccept_0078 end`);
    });
  });
}
