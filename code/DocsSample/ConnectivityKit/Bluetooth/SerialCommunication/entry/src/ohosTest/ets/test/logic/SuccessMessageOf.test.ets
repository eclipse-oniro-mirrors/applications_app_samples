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
import { successMessageOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for successMessageOf (96 cases). */
export default function successMessageOfTest(): void {
  describe('SuccessMessageOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0001
     * @tc.name      SerialCommunication_SuccessMessageOf_0001
     * @tc.desc      successMessageOf(operation="sppListen", socketId=0) returns "sppListen success, serverNumber = 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SuccessMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0001 begin`);
      const actual: string = successMessageOf('sppListen', 0);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 0');
      logInfo(`${BUNDLE}SuccessMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0002
     * @tc.name      SerialCommunication_SuccessMessageOf_0002
     * @tc.desc      successMessageOf(operation="sppListen", socketId=1) returns "sppListen success, serverNumber = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SuccessMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0002 begin`);
      const actual: string = successMessageOf('sppListen', 1);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 1');
      logInfo(`${BUNDLE}SuccessMessageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0003
     * @tc.name      SerialCommunication_SuccessMessageOf_0003
     * @tc.desc      successMessageOf(operation="sppListen", socketId=100) returns "sppListen success, serverNumber =...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0003 begin`);
      const actual: string = successMessageOf('sppListen', 100);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 100');
      logInfo(`${BUNDLE}SuccessMessageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0004
     * @tc.name      SerialCommunication_SuccessMessageOf_0004
     * @tc.desc      successMessageOf(operation="sppListen", socketId=-1) returns "sppListen success, serverNumber = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0004 begin`);
      const actual: string = successMessageOf('sppListen', -1);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = -1');
      logInfo(`${BUNDLE}SuccessMessageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0005
     * @tc.name      SerialCommunication_SuccessMessageOf_0005
     * @tc.desc      successMessageOf(operation="sppListen", socketId=2) returns "sppListen success, serverNumber = 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0005 begin`);
      const actual: string = successMessageOf('sppListen', 2);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 2');
      logInfo(`${BUNDLE}SuccessMessageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0006
     * @tc.name      SerialCommunication_SuccessMessageOf_0006
     * @tc.desc      successMessageOf(operation="sppListen", socketId=3) returns "sppListen success, serverNumber = 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0006 begin`);
      const actual: string = successMessageOf('sppListen', 3);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 3');
      logInfo(`${BUNDLE}SuccessMessageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0007
     * @tc.name      SerialCommunication_SuccessMessageOf_0007
     * @tc.desc      successMessageOf(operation="sppListen", socketId=10) returns "sppListen success, serverNumber = 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0007 begin`);
      const actual: string = successMessageOf('sppListen', 10);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 10');
      logInfo(`${BUNDLE}SuccessMessageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0008
     * @tc.name      SerialCommunication_SuccessMessageOf_0008
     * @tc.desc      successMessageOf(operation="sppListen", socketId=5) returns "sppListen success, serverNumber = 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0008 begin`);
      const actual: string = successMessageOf('sppListen', 5);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 5');
      logInfo(`${BUNDLE}SuccessMessageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0009
     * @tc.name      SerialCommunication_SuccessMessageOf_0009
     * @tc.desc      successMessageOf(operation="sppListen", socketId=15) returns "sppListen success, serverNumber = 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0009 begin`);
      const actual: string = successMessageOf('sppListen', 15);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 15');
      logInfo(`${BUNDLE}SuccessMessageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0010
     * @tc.name      SerialCommunication_SuccessMessageOf_0010
     * @tc.desc      successMessageOf(operation="sppListen", socketId=20) returns "sppListen success, serverNumber = 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0010 begin`);
      const actual: string = successMessageOf('sppListen', 20);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 20');
      logInfo(`${BUNDLE}SuccessMessageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0011
     * @tc.name      SerialCommunication_SuccessMessageOf_0011
     * @tc.desc      successMessageOf(operation="sppListen", socketId=25) returns "sppListen success, serverNumber = 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0011 begin`);
      const actual: string = successMessageOf('sppListen', 25);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 25');
      logInfo(`${BUNDLE}SuccessMessageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0012
     * @tc.name      SerialCommunication_SuccessMessageOf_0012
     * @tc.desc      successMessageOf(operation="sppListen", socketId=30) returns "sppListen success, serverNumber = 30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0012 begin`);
      const actual: string = successMessageOf('sppListen', 30);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 30');
      logInfo(`${BUNDLE}SuccessMessageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0013
     * @tc.name      SerialCommunication_SuccessMessageOf_0013
     * @tc.desc      successMessageOf(operation="sppListen", socketId=35) returns "sppListen success, serverNumber = 35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0013 begin`);
      const actual: string = successMessageOf('sppListen', 35);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 35');
      logInfo(`${BUNDLE}SuccessMessageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0014
     * @tc.name      SerialCommunication_SuccessMessageOf_0014
     * @tc.desc      successMessageOf(operation="sppListen", socketId=40) returns "sppListen success, serverNumber = 40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0014 begin`);
      const actual: string = successMessageOf('sppListen', 40);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 40');
      logInfo(`${BUNDLE}SuccessMessageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0015
     * @tc.name      SerialCommunication_SuccessMessageOf_0015
     * @tc.desc      successMessageOf(operation="sppListen", socketId=45) returns "sppListen success, serverNumber = 45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0015 begin`);
      const actual: string = successMessageOf('sppListen', 45);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 45');
      logInfo(`${BUNDLE}SuccessMessageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0016
     * @tc.name      SerialCommunication_SuccessMessageOf_0016
     * @tc.desc      successMessageOf(operation="sppListen", socketId=50) returns "sppListen success, serverNumber = 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0016 begin`);
      const actual: string = successMessageOf('sppListen', 50);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 50');
      logInfo(`${BUNDLE}SuccessMessageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0017
     * @tc.name      SerialCommunication_SuccessMessageOf_0017
     * @tc.desc      successMessageOf(operation="sppListen", socketId=55) returns "sppListen success, serverNumber = 55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0017 begin`);
      const actual: string = successMessageOf('sppListen', 55);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 55');
      logInfo(`${BUNDLE}SuccessMessageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0018
     * @tc.name      SerialCommunication_SuccessMessageOf_0018
     * @tc.desc      successMessageOf(operation="sppListen", socketId=60) returns "sppListen success, serverNumber = 60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0018 begin`);
      const actual: string = successMessageOf('sppListen', 60);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 60');
      logInfo(`${BUNDLE}SuccessMessageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0019
     * @tc.name      SerialCommunication_SuccessMessageOf_0019
     * @tc.desc      successMessageOf(operation="sppListen", socketId=65) returns "sppListen success, serverNumber = 65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0019 begin`);
      const actual: string = successMessageOf('sppListen', 65);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 65');
      logInfo(`${BUNDLE}SuccessMessageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0020
     * @tc.name      SerialCommunication_SuccessMessageOf_0020
     * @tc.desc      successMessageOf(operation="sppListen", socketId=70) returns "sppListen success, serverNumber = 70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0020 begin`);
      const actual: string = successMessageOf('sppListen', 70);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 70');
      logInfo(`${BUNDLE}SuccessMessageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0021
     * @tc.name      SerialCommunication_SuccessMessageOf_0021
     * @tc.desc      successMessageOf(operation="sppListen", socketId=75) returns "sppListen success, serverNumber = 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0021 begin`);
      const actual: string = successMessageOf('sppListen', 75);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 75');
      logInfo(`${BUNDLE}SuccessMessageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0022
     * @tc.name      SerialCommunication_SuccessMessageOf_0022
     * @tc.desc      successMessageOf(operation="sppListen", socketId=80) returns "sppListen success, serverNumber = 80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0022 begin`);
      const actual: string = successMessageOf('sppListen', 80);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 80');
      logInfo(`${BUNDLE}SuccessMessageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0023
     * @tc.name      SerialCommunication_SuccessMessageOf_0023
     * @tc.desc      successMessageOf(operation="sppListen", socketId=85) returns "sppListen success, serverNumber = 85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0023 begin`);
      const actual: string = successMessageOf('sppListen', 85);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 85');
      logInfo(`${BUNDLE}SuccessMessageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0024
     * @tc.name      SerialCommunication_SuccessMessageOf_0024
     * @tc.desc      successMessageOf(operation="sppListen", socketId=90) returns "sppListen success, serverNumber = 90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0024 begin`);
      const actual: string = successMessageOf('sppListen', 90);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 90');
      logInfo(`${BUNDLE}SuccessMessageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0025
     * @tc.name      SerialCommunication_SuccessMessageOf_0025
     * @tc.desc      successMessageOf(operation="sppListen", socketId=95) returns "sppListen success, serverNumber = 95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0025 begin`);
      const actual: string = successMessageOf('sppListen', 95);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 95');
      logInfo(`${BUNDLE}SuccessMessageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0026
     * @tc.name      SerialCommunication_SuccessMessageOf_0026
     * @tc.desc      successMessageOf(operation="sppListen", socketId=105) returns "sppListen success, serverNumber =...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0026 begin`);
      const actual: string = successMessageOf('sppListen', 105);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 105');
      logInfo(`${BUNDLE}SuccessMessageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0027
     * @tc.name      SerialCommunication_SuccessMessageOf_0027
     * @tc.desc      successMessageOf(operation="sppListen", socketId=110) returns "sppListen success, serverNumber =...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0027 begin`);
      const actual: string = successMessageOf('sppListen', 110);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 110');
      logInfo(`${BUNDLE}SuccessMessageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0028
     * @tc.name      SerialCommunication_SuccessMessageOf_0028
     * @tc.desc      successMessageOf(operation="sppListen", socketId=115) returns "sppListen success, serverNumber =...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0028 begin`);
      const actual: string = successMessageOf('sppListen', 115);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 115');
      logInfo(`${BUNDLE}SuccessMessageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0029
     * @tc.name      SerialCommunication_SuccessMessageOf_0029
     * @tc.desc      successMessageOf(operation="sppListen", socketId=5.18) returns "sppListen success, serverNumber ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0029 begin`);
      const actual: string = successMessageOf('sppListen', 5.18);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 5.18');
      logInfo(`${BUNDLE}SuccessMessageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0030
     * @tc.name      SerialCommunication_SuccessMessageOf_0030
     * @tc.desc      successMessageOf(operation="sppListen", socketId=11.29) returns "sppListen success, serverNumber...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0030 begin`);
      const actual: string = successMessageOf('sppListen', 11.29);
      logInfo(`successMessageOf(operation="sppListen", s...: actual=${actual}`);
      expect(actual).assertEqual('sppListen success, serverNumber = 11.29');
      logInfo(`${BUNDLE}SuccessMessageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0031
     * @tc.name      SerialCommunication_SuccessMessageOf_0031
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=0) returns "sppConnect success, socketId = 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0031 begin`);
      const actual: string = successMessageOf('sppConnect', 0);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 0');
      logInfo(`${BUNDLE}SuccessMessageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0032
     * @tc.name      SerialCommunication_SuccessMessageOf_0032
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=1) returns "sppConnect success, socketId = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0032 begin`);
      const actual: string = successMessageOf('sppConnect', 1);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 1');
      logInfo(`${BUNDLE}SuccessMessageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0033
     * @tc.name      SerialCommunication_SuccessMessageOf_0033
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=100) returns "sppConnect success, socketId = 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0033 begin`);
      const actual: string = successMessageOf('sppConnect', 100);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 100');
      logInfo(`${BUNDLE}SuccessMessageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0034
     * @tc.name      SerialCommunication_SuccessMessageOf_0034
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=-1) returns "sppConnect success, socketId = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0034 begin`);
      const actual: string = successMessageOf('sppConnect', -1);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = -1');
      logInfo(`${BUNDLE}SuccessMessageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0035
     * @tc.name      SerialCommunication_SuccessMessageOf_0035
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=2) returns "sppConnect success, socketId = 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0035 begin`);
      const actual: string = successMessageOf('sppConnect', 2);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 2');
      logInfo(`${BUNDLE}SuccessMessageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0036
     * @tc.name      SerialCommunication_SuccessMessageOf_0036
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=3) returns "sppConnect success, socketId = 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0036 begin`);
      const actual: string = successMessageOf('sppConnect', 3);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 3');
      logInfo(`${BUNDLE}SuccessMessageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0037
     * @tc.name      SerialCommunication_SuccessMessageOf_0037
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=10) returns "sppConnect success, socketId = 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0037 begin`);
      const actual: string = successMessageOf('sppConnect', 10);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 10');
      logInfo(`${BUNDLE}SuccessMessageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0038
     * @tc.name      SerialCommunication_SuccessMessageOf_0038
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=5) returns "sppConnect success, socketId = 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0038 begin`);
      const actual: string = successMessageOf('sppConnect', 5);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 5');
      logInfo(`${BUNDLE}SuccessMessageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0039
     * @tc.name      SerialCommunication_SuccessMessageOf_0039
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=15) returns "sppConnect success, socketId = 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0039 begin`);
      const actual: string = successMessageOf('sppConnect', 15);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 15');
      logInfo(`${BUNDLE}SuccessMessageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0040
     * @tc.name      SerialCommunication_SuccessMessageOf_0040
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=20) returns "sppConnect success, socketId = 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0040 begin`);
      const actual: string = successMessageOf('sppConnect', 20);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 20');
      logInfo(`${BUNDLE}SuccessMessageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0041
     * @tc.name      SerialCommunication_SuccessMessageOf_0041
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=25) returns "sppConnect success, socketId = 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0041 begin`);
      const actual: string = successMessageOf('sppConnect', 25);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 25');
      logInfo(`${BUNDLE}SuccessMessageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0042
     * @tc.name      SerialCommunication_SuccessMessageOf_0042
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=30) returns "sppConnect success, socketId = 30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0042 begin`);
      const actual: string = successMessageOf('sppConnect', 30);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 30');
      logInfo(`${BUNDLE}SuccessMessageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0043
     * @tc.name      SerialCommunication_SuccessMessageOf_0043
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=35) returns "sppConnect success, socketId = 35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0043 begin`);
      const actual: string = successMessageOf('sppConnect', 35);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 35');
      logInfo(`${BUNDLE}SuccessMessageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0044
     * @tc.name      SerialCommunication_SuccessMessageOf_0044
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=40) returns "sppConnect success, socketId = 40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0044 begin`);
      const actual: string = successMessageOf('sppConnect', 40);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 40');
      logInfo(`${BUNDLE}SuccessMessageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0045
     * @tc.name      SerialCommunication_SuccessMessageOf_0045
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=45) returns "sppConnect success, socketId = 45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0045 begin`);
      const actual: string = successMessageOf('sppConnect', 45);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 45');
      logInfo(`${BUNDLE}SuccessMessageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0046
     * @tc.name      SerialCommunication_SuccessMessageOf_0046
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=50) returns "sppConnect success, socketId = 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0046 begin`);
      const actual: string = successMessageOf('sppConnect', 50);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 50');
      logInfo(`${BUNDLE}SuccessMessageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0047
     * @tc.name      SerialCommunication_SuccessMessageOf_0047
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=55) returns "sppConnect success, socketId = 55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0047 begin`);
      const actual: string = successMessageOf('sppConnect', 55);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 55');
      logInfo(`${BUNDLE}SuccessMessageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0048
     * @tc.name      SerialCommunication_SuccessMessageOf_0048
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=60) returns "sppConnect success, socketId = 60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0048 begin`);
      const actual: string = successMessageOf('sppConnect', 60);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 60');
      logInfo(`${BUNDLE}SuccessMessageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0049
     * @tc.name      SerialCommunication_SuccessMessageOf_0049
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=65) returns "sppConnect success, socketId = 65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0049 begin`);
      const actual: string = successMessageOf('sppConnect', 65);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 65');
      logInfo(`${BUNDLE}SuccessMessageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0050
     * @tc.name      SerialCommunication_SuccessMessageOf_0050
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=70) returns "sppConnect success, socketId = 70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0050 begin`);
      const actual: string = successMessageOf('sppConnect', 70);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 70');
      logInfo(`${BUNDLE}SuccessMessageOf_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0051
     * @tc.name      SerialCommunication_SuccessMessageOf_0051
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=75) returns "sppConnect success, socketId = 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0051 begin`);
      const actual: string = successMessageOf('sppConnect', 75);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 75');
      logInfo(`${BUNDLE}SuccessMessageOf_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0052
     * @tc.name      SerialCommunication_SuccessMessageOf_0052
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=80) returns "sppConnect success, socketId = 80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0052 begin`);
      const actual: string = successMessageOf('sppConnect', 80);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 80');
      logInfo(`${BUNDLE}SuccessMessageOf_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0053
     * @tc.name      SerialCommunication_SuccessMessageOf_0053
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=85) returns "sppConnect success, socketId = 85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0053 begin`);
      const actual: string = successMessageOf('sppConnect', 85);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 85');
      logInfo(`${BUNDLE}SuccessMessageOf_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0054
     * @tc.name      SerialCommunication_SuccessMessageOf_0054
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=90) returns "sppConnect success, socketId = 90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0054 begin`);
      const actual: string = successMessageOf('sppConnect', 90);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 90');
      logInfo(`${BUNDLE}SuccessMessageOf_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0055
     * @tc.name      SerialCommunication_SuccessMessageOf_0055
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=95) returns "sppConnect success, socketId = 95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0055 begin`);
      const actual: string = successMessageOf('sppConnect', 95);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 95');
      logInfo(`${BUNDLE}SuccessMessageOf_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0056
     * @tc.name      SerialCommunication_SuccessMessageOf_0056
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=105) returns "sppConnect success, socketId = 105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0056 begin`);
      const actual: string = successMessageOf('sppConnect', 105);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 105');
      logInfo(`${BUNDLE}SuccessMessageOf_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0057
     * @tc.name      SerialCommunication_SuccessMessageOf_0057
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=110) returns "sppConnect success, socketId = 110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0057 begin`);
      const actual: string = successMessageOf('sppConnect', 110);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 110');
      logInfo(`${BUNDLE}SuccessMessageOf_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0058
     * @tc.name      SerialCommunication_SuccessMessageOf_0058
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=115) returns "sppConnect success, socketId = 115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0058 begin`);
      const actual: string = successMessageOf('sppConnect', 115);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 115');
      logInfo(`${BUNDLE}SuccessMessageOf_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0059
     * @tc.name      SerialCommunication_SuccessMessageOf_0059
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=5.18) returns "sppConnect success, socketId = ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0059 begin`);
      const actual: string = successMessageOf('sppConnect', 5.18);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 5.18');
      logInfo(`${BUNDLE}SuccessMessageOf_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0060
     * @tc.name      SerialCommunication_SuccessMessageOf_0060
     * @tc.desc      successMessageOf(operation="sppConnect", socketId=11.29) returns "sppConnect success, socketId =...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0060 begin`);
      const actual: string = successMessageOf('sppConnect', 11.29);
      logInfo(`successMessageOf(operation="sppConnect", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect success, socketId = 11.29');
      logInfo(`${BUNDLE}SuccessMessageOf_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0061
     * @tc.name      SerialCommunication_SuccessMessageOf_0061
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=0) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0061 begin`);
      const actual: string = successMessageOf('sppAccept', 0);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0062
     * @tc.name      SerialCommunication_SuccessMessageOf_0062
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=0) returns "accept the client s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0062 begin`);
      const actual: string = successMessageOf('accept the client success', 0);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0063
     * @tc.name      SerialCommunication_SuccessMessageOf_0063
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=0) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0063 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 0);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0064
     * @tc.name      SerialCommunication_SuccessMessageOf_0064
     * @tc.desc      successMessageOf(operation="sppListe", socketId=0) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0064 begin`);
      const actual: string = successMessageOf('sppListe', 0);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0065
     * @tc.name      SerialCommunication_SuccessMessageOf_0065
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=0) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0065 begin`);
      const actual: string = successMessageOf('sppListenx', 0);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0066
     * @tc.name      SerialCommunication_SuccessMessageOf_0066
     * @tc.desc      successMessageOf(operation="SPPCONNECT", socketId=0) returns "SPPCONNECT success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0066 begin`);
      const actual: string = successMessageOf('SPPCONNECT', 0);
      logInfo(`successMessageOf(operation="SPPCONNECT", ...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT success');
      logInfo(`${BUNDLE}SuccessMessageOf_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0067
     * @tc.name      SerialCommunication_SuccessMessageOf_0067
     * @tc.desc      successMessageOf(operation="sppConnec", socketId=0) returns "sppConnec success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0067 begin`);
      const actual: string = successMessageOf('sppConnec', 0);
      logInfo(`successMessageOf(operation="sppConnec", s...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec success');
      logInfo(`${BUNDLE}SuccessMessageOf_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0068
     * @tc.name      SerialCommunication_SuccessMessageOf_0068
     * @tc.desc      successMessageOf(operation="sppConnectx", socketId=0) returns "sppConnectx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0068 begin`);
      const actual: string = successMessageOf('sppConnectx', 0);
      logInfo(`successMessageOf(operation="sppConnectx",...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0069
     * @tc.name      SerialCommunication_SuccessMessageOf_0069
     * @tc.desc      successMessageOf(operation="SPPACCEPT", socketId=0) returns "SPPACCEPT success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0069 begin`);
      const actual: string = successMessageOf('SPPACCEPT', 0);
      logInfo(`successMessageOf(operation="SPPACCEPT", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPACCEPT success');
      logInfo(`${BUNDLE}SuccessMessageOf_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0070
     * @tc.name      SerialCommunication_SuccessMessageOf_0070
     * @tc.desc      successMessageOf(operation="sppAccep", socketId=0) returns "sppAccep success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0070 begin`);
      const actual: string = successMessageOf('sppAccep', 0);
      logInfo(`successMessageOf(operation="sppAccep", so...: actual=${actual}`);
      expect(actual).assertEqual('sppAccep success');
      logInfo(`${BUNDLE}SuccessMessageOf_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0071
     * @tc.name      SerialCommunication_SuccessMessageOf_0071
     * @tc.desc      successMessageOf(operation="sppAcceptx", socketId=0) returns "sppAcceptx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0071 begin`);
      const actual: string = successMessageOf('sppAcceptx', 0);
      logInfo(`successMessageOf(operation="sppAcceptx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppAcceptx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0072
     * @tc.name      SerialCommunication_SuccessMessageOf_0072
     * @tc.desc      successMessageOf(operation="ACCEPT THE CLIENT SUCCESS", socketId=0) returns "ACCEPT THE CLIENT S...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0072 begin`);
      const actual: string = successMessageOf('ACCEPT THE CLIENT SUCCESS', 0);
      logInfo(`successMessageOf(operation="ACCEPT THE CL...: actual=${actual}`);
      expect(actual).assertEqual('ACCEPT THE CLIENT SUCCESS success');
      logInfo(`${BUNDLE}SuccessMessageOf_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0073
     * @tc.name      SerialCommunication_SuccessMessageOf_0073
     * @tc.desc      successMessageOf(operation="accept the client succes", socketId=0) returns "accept the client su...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0073 begin`);
      const actual: string = successMessageOf('accept the client succes', 0);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client succes success');
      logInfo(`${BUNDLE}SuccessMessageOf_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0074
     * @tc.name      SerialCommunication_SuccessMessageOf_0074
     * @tc.desc      successMessageOf(operation="accept the client successx", socketId=0) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0074 begin`);
      const actual: string = successMessageOf('accept the client successx', 0);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client successx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0075
     * @tc.name      SerialCommunication_SuccessMessageOf_0075
     * @tc.desc      successMessageOf(operation="", socketId=0) returns " success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0075 begin`);
      const actual: string = successMessageOf('', 0);
      logInfo(`successMessageOf(operation="", socketId=0): actual=${actual}`);
      expect(actual).assertEqual(' success');
      logInfo(`${BUNDLE}SuccessMessageOf_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0076
     * @tc.name      SerialCommunication_SuccessMessageOf_0076
     * @tc.desc      successMessageOf(operation="a", socketId=0) returns "a success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SuccessMessageOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0076 begin`);
      const actual: string = successMessageOf('a', 0);
      logInfo(`successMessageOf(operation="a", socketId=0): actual=${actual}`);
      expect(actual).assertEqual('a success');
      logInfo(`${BUNDLE}SuccessMessageOf_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0077
     * @tc.name      SerialCommunication_SuccessMessageOf_0077
     * @tc.desc      successMessageOf(operation="abc", socketId=0) returns "abc success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SuccessMessageOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0077 begin`);
      const actual: string = successMessageOf('abc', 0);
      logInfo(`successMessageOf(operation="abc", socketI...: actual=${actual}`);
      expect(actual).assertEqual('abc success');
      logInfo(`${BUNDLE}SuccessMessageOf_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0078
     * @tc.name      SerialCommunication_SuccessMessageOf_0078
     * @tc.desc      successMessageOf(operation="Hello World", socketId=0) returns "Hello World success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SuccessMessageOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0078 begin`);
      const actual: string = successMessageOf('Hello World', 0);
      logInfo(`successMessageOf(operation="Hello World",...: actual=${actual}`);
      expect(actual).assertEqual('Hello World success');
      logInfo(`${BUNDLE}SuccessMessageOf_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0079
     * @tc.name      SerialCommunication_SuccessMessageOf_0079
     * @tc.desc      successMessageOf(operation=" ", socketId=0) returns "  success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SuccessMessageOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0079 begin`);
      const actual: string = successMessageOf(' ', 0);
      logInfo(`successMessageOf(operation=" ", socketId=0): actual=${actual}`);
      expect(actual).assertEqual('  success');
      logInfo(`${BUNDLE}SuccessMessageOf_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0080
     * @tc.name      SerialCommunication_SuccessMessageOf_0080
     * @tc.desc      successMessageOf(operation="123", socketId=0) returns "123 success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SuccessMessageOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0080 begin`);
      const actual: string = successMessageOf('123', 0);
      logInfo(`successMessageOf(operation="123", socketI...: actual=${actual}`);
      expect(actual).assertEqual('123 success');
      logInfo(`${BUNDLE}SuccessMessageOf_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0081
     * @tc.name      SerialCommunication_SuccessMessageOf_0081
     * @tc.desc      successMessageOf(operation=" sppListen ", socketId=0) returns " sppListen  success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0081 begin`);
      const actual: string = successMessageOf(' sppListen ', 0);
      logInfo(`successMessageOf(operation=" sppListen ",...: actual=${actual}`);
      expect(actual).assertEqual(' sppListen  success');
      logInfo(`${BUNDLE}SuccessMessageOf_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0082
     * @tc.name      SerialCommunication_SuccessMessageOf_0082
     * @tc.desc      successMessageOf(operation="sppListensppListen", socketId=0) returns "sppListensppListen success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SuccessMessageOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0082 begin`);
      const actual: string = successMessageOf('sppListensppListen', 0);
      logInfo(`successMessageOf(operation="sppListensppL...: actual=${actual}`);
      expect(actual).assertEqual('sppListensppListen success');
      logInfo(`${BUNDLE}SuccessMessageOf_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0083
     * @tc.name      SerialCommunication_SuccessMessageOf_0083
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=1) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0083 begin`);
      const actual: string = successMessageOf('sppAccept', 1);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0084
     * @tc.name      SerialCommunication_SuccessMessageOf_0084
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=100) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0084 begin`);
      const actual: string = successMessageOf('sppAccept', 100);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0085
     * @tc.name      SerialCommunication_SuccessMessageOf_0085
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=-1) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0085 begin`);
      const actual: string = successMessageOf('sppAccept', -1);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0086
     * @tc.name      SerialCommunication_SuccessMessageOf_0086
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=2) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0086 begin`);
      const actual: string = successMessageOf('sppAccept', 2);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0087
     * @tc.name      SerialCommunication_SuccessMessageOf_0087
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=3) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0087 begin`);
      const actual: string = successMessageOf('sppAccept', 3);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0088
     * @tc.name      SerialCommunication_SuccessMessageOf_0088
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=10) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0088 begin`);
      const actual: string = successMessageOf('sppAccept', 10);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0089
     * @tc.name      SerialCommunication_SuccessMessageOf_0089
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=5) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0089 begin`);
      const actual: string = successMessageOf('sppAccept', 5);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0090
     * @tc.name      SerialCommunication_SuccessMessageOf_0090
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=15) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0090 begin`);
      const actual: string = successMessageOf('sppAccept', 15);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0090 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0091
     * @tc.name      SerialCommunication_SuccessMessageOf_0091
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=20) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0091 begin`);
      const actual: string = successMessageOf('sppAccept', 20);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0091 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0092
     * @tc.name      SerialCommunication_SuccessMessageOf_0092
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=25) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0092 begin`);
      const actual: string = successMessageOf('sppAccept', 25);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0092 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0093
     * @tc.name      SerialCommunication_SuccessMessageOf_0093
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=30) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0093 begin`);
      const actual: string = successMessageOf('sppAccept', 30);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0093 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0094
     * @tc.name      SerialCommunication_SuccessMessageOf_0094
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=35) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0094 begin`);
      const actual: string = successMessageOf('sppAccept', 35);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0094 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0095
     * @tc.name      SerialCommunication_SuccessMessageOf_0095
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=40) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0095 begin`);
      const actual: string = successMessageOf('sppAccept', 40);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0095 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0096
     * @tc.name      SerialCommunication_SuccessMessageOf_0096
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=45) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0096 begin`);
      const actual: string = successMessageOf('sppAccept', 45);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0096 end`);
    });
  });
}
