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
import {
  DEFAULT_CLIENT_NUMBER, DEFAULT_SERVER_NUMBER, DEFAULT_UUID, SERVER_NAME, SPP_RFCOMM, SPP_SECURE, TOAST_BOTTOM,
  TOAST_DURATION
} from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SppSerialLogic (8 cases). */
export default function sppSerialLogicConstantsTest(): void {
  describe('SppSerialLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_SERIAL_LOGIC_CONSTANTS_0001
     * @tc.name      SerialCommunication_SppSerialLogicConstants_0001
     * @tc.desc      DEFAULT_UUID keeps value "00001101-0000-1000-8000-00805f9b34fb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppSerialLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppSerialLogicConstants_0001 begin`);
      const actual: string = DEFAULT_UUID;
      logInfo(`DEFAULT_UUID: actual=${actual}`);
      expect(actual).assertEqual('00001101-0000-1000-8000-00805f9b34fb');
      logInfo(`${BUNDLE}SppSerialLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_SERIAL_LOGIC_CONSTANTS_0002
     * @tc.name      SerialCommunication_SppSerialLogicConstants_0002
     * @tc.desc      DEFAULT_SERVER_NUMBER keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppSerialLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppSerialLogicConstants_0002 begin`);
      const actual: number = DEFAULT_SERVER_NUMBER;
      logInfo(`DEFAULT_SERVER_NUMBER: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SppSerialLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_SERIAL_LOGIC_CONSTANTS_0003
     * @tc.name      SerialCommunication_SppSerialLogicConstants_0003
     * @tc.desc      DEFAULT_CLIENT_NUMBER keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppSerialLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppSerialLogicConstants_0003 begin`);
      const actual: number = DEFAULT_CLIENT_NUMBER;
      logInfo(`DEFAULT_CLIENT_NUMBER: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SppSerialLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_SERIAL_LOGIC_CONSTANTS_0004
     * @tc.name      SerialCommunication_SppSerialLogicConstants_0004
     * @tc.desc      SERVER_NAME keeps value "server1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppSerialLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppSerialLogicConstants_0004 begin`);
      const actual: string = SERVER_NAME;
      logInfo(`SERVER_NAME: actual=${actual}`);
      expect(actual).assertEqual('server1');
      logInfo(`${BUNDLE}SppSerialLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_SERIAL_LOGIC_CONSTANTS_0005
     * @tc.name      SerialCommunication_SppSerialLogicConstants_0005
     * @tc.desc      SPP_SECURE keeps value true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppSerialLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppSerialLogicConstants_0005 begin`);
      const actual: boolean = SPP_SECURE;
      logInfo(`SPP_SECURE: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SppSerialLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_SERIAL_LOGIC_CONSTANTS_0006
     * @tc.name      SerialCommunication_SppSerialLogicConstants_0006
     * @tc.desc      TOAST_DURATION keeps value 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppSerialLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppSerialLogicConstants_0006 begin`);
      const actual: number = TOAST_DURATION;
      logInfo(`TOAST_DURATION: actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}SppSerialLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_SERIAL_LOGIC_CONSTANTS_0007
     * @tc.name      SerialCommunication_SppSerialLogicConstants_0007
     * @tc.desc      TOAST_BOTTOM keeps value 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppSerialLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppSerialLogicConstants_0007 begin`);
      const actual: number = TOAST_BOTTOM;
      logInfo(`TOAST_BOTTOM: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SppSerialLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_SERIAL_LOGIC_CONSTANTS_0008
     * @tc.name      SerialCommunication_SppSerialLogicConstants_0008
     * @tc.desc      SPP_RFCOMM keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppSerialLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppSerialLogicConstants_0008 begin`);
      const actual: number = SPP_RFCOMM;
      logInfo(`SPP_RFCOMM: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SppSerialLogicConstants_0008 end`);
    });
  });
}
