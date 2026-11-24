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
import { callbackErrorOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for callbackErrorOf (96 cases). */
export default function callbackErrorOf2Test(): void {
  describe('CallbackErrorOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0097
     * @tc.name      SerialCommunication_CallbackErrorOf_0097
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=1) returns "sppConnectx error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0097 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 1);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 1');
      logInfo(`${BUNDLE}CallbackErrorOf_0097 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0098
     * @tc.name      SerialCommunication_CallbackErrorOf_0098
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=2) returns "sppConnectx error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0098 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 2);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 2');
      logInfo(`${BUNDLE}CallbackErrorOf_0098 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0099
     * @tc.name      SerialCommunication_CallbackErrorOf_0099
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=3) returns "sppConnectx error, code is 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0099 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 3);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 3');
      logInfo(`${BUNDLE}CallbackErrorOf_0099 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0100
     * @tc.name      SerialCommunication_CallbackErrorOf_0100
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=10) returns "sppConnectx error, code is 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0100 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 10);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 10');
      logInfo(`${BUNDLE}CallbackErrorOf_0100 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0101
     * @tc.name      SerialCommunication_CallbackErrorOf_0101
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=100) returns "sppConnectx error, code is 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0101 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 100);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 100');
      logInfo(`${BUNDLE}CallbackErrorOf_0101 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0102
     * @tc.name      SerialCommunication_CallbackErrorOf_0102
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=25) returns "sppConnectx error, code is 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0102 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 25);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 25');
      logInfo(`${BUNDLE}CallbackErrorOf_0102 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0103
     * @tc.name      SerialCommunication_CallbackErrorOf_0103
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=50) returns "sppConnectx error, code is 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0103 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 50);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 50');
      logInfo(`${BUNDLE}CallbackErrorOf_0103 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0104
     * @tc.name      SerialCommunication_CallbackErrorOf_0104
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=75) returns "sppConnectx error, code is 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0104 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 75);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 75');
      logInfo(`${BUNDLE}CallbackErrorOf_0104 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0105
     * @tc.name      SerialCommunication_CallbackErrorOf_0105
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=125) returns "sppConnectx error, code is 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0105 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 125);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 125');
      logInfo(`${BUNDLE}CallbackErrorOf_0105 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0106
     * @tc.name      SerialCommunication_CallbackErrorOf_0106
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=150) returns "sppConnectx error, code is 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0106 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 150);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 150');
      logInfo(`${BUNDLE}CallbackErrorOf_0106 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0107
     * @tc.name      SerialCommunication_CallbackErrorOf_0107
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=175) returns "sppConnectx error, code is 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0107 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 175);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 175');
      logInfo(`${BUNDLE}CallbackErrorOf_0107 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0108
     * @tc.name      SerialCommunication_CallbackErrorOf_0108
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=225) returns "sppConnectx error, code is 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0108 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 225);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 225');
      logInfo(`${BUNDLE}CallbackErrorOf_0108 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0109
     * @tc.name      SerialCommunication_CallbackErrorOf_0109
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=250) returns "sppConnectx error, code is 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0109 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 250);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 250');
      logInfo(`${BUNDLE}CallbackErrorOf_0109 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0110
     * @tc.name      SerialCommunication_CallbackErrorOf_0110
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=275) returns "sppConnectx error, code is 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0110 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 275);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 275');
      logInfo(`${BUNDLE}CallbackErrorOf_0110 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0111
     * @tc.name      SerialCommunication_CallbackErrorOf_0111
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=300) returns "sppConnectx error, code is 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0111 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 300);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 300');
      logInfo(`${BUNDLE}CallbackErrorOf_0111 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0112
     * @tc.name      SerialCommunication_CallbackErrorOf_0112
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=325) returns "sppConnectx error, code is 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0112 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 325);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 325');
      logInfo(`${BUNDLE}CallbackErrorOf_0112 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0113
     * @tc.name      SerialCommunication_CallbackErrorOf_0113
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=350) returns "sppConnectx error, code is 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0113 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 350);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 350');
      logInfo(`${BUNDLE}CallbackErrorOf_0113 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0114
     * @tc.name      SerialCommunication_CallbackErrorOf_0114
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=375) returns "sppConnectx error, code is 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0114 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 375);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 375');
      logInfo(`${BUNDLE}CallbackErrorOf_0114 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0115
     * @tc.name      SerialCommunication_CallbackErrorOf_0115
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=400) returns "sppConnectx error, code is 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0115 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 400);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 400');
      logInfo(`${BUNDLE}CallbackErrorOf_0115 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0116
     * @tc.name      SerialCommunication_CallbackErrorOf_0116
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=425) returns "sppConnectx error, code is 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0116 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 425);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 425');
      logInfo(`${BUNDLE}CallbackErrorOf_0116 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0117
     * @tc.name      SerialCommunication_CallbackErrorOf_0117
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=450) returns "sppConnectx error, code is 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0117 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 450);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 450');
      logInfo(`${BUNDLE}CallbackErrorOf_0117 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0118
     * @tc.name      SerialCommunication_CallbackErrorOf_0118
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=475) returns "sppConnectx error, code is 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0118 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 475);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 475');
      logInfo(`${BUNDLE}CallbackErrorOf_0118 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0119
     * @tc.name      SerialCommunication_CallbackErrorOf_0119
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=459) returns "sppConnectx error, code is 459"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0119 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 459);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 459');
      logInfo(`${BUNDLE}CallbackErrorOf_0119 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0120
     * @tc.name      SerialCommunication_CallbackErrorOf_0120
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=-76) returns "sppConnectx error, code is -76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0120 begin`);
      const actual: string = callbackErrorOf('sppConnectx', -76);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is -76');
      logInfo(`${BUNDLE}CallbackErrorOf_0120 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0121
     * @tc.name      SerialCommunication_CallbackErrorOf_0121
     * @tc.desc      callbackErrorOf(operation="", code=0) returns " error, code is 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0121 begin`);
      const actual: string = callbackErrorOf('', 0);
      logInfo(`callbackErrorOf(operation="", code=0): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 0');
      logInfo(`${BUNDLE}CallbackErrorOf_0121 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0122
     * @tc.name      SerialCommunication_CallbackErrorOf_0122
     * @tc.desc      callbackErrorOf(operation="", code=200) returns " error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0122 begin`);
      const actual: string = callbackErrorOf('', 200);
      logInfo(`callbackErrorOf(operation="", code=200): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 200');
      logInfo(`${BUNDLE}CallbackErrorOf_0122 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0123
     * @tc.name      SerialCommunication_CallbackErrorOf_0123
     * @tc.desc      callbackErrorOf(operation="", code=401) returns " error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0123 begin`);
      const actual: string = callbackErrorOf('', 401);
      logInfo(`callbackErrorOf(operation="", code=401): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 401');
      logInfo(`${BUNDLE}CallbackErrorOf_0123 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0124
     * @tc.name      SerialCommunication_CallbackErrorOf_0124
     * @tc.desc      callbackErrorOf(operation="", code=404) returns " error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0124 begin`);
      const actual: string = callbackErrorOf('', 404);
      logInfo(`callbackErrorOf(operation="", code=404): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 404');
      logInfo(`${BUNDLE}CallbackErrorOf_0124 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0125
     * @tc.name      SerialCommunication_CallbackErrorOf_0125
     * @tc.desc      callbackErrorOf(operation="", code=500) returns " error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0125 begin`);
      const actual: string = callbackErrorOf('', 500);
      logInfo(`callbackErrorOf(operation="", code=500): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 500');
      logInfo(`${BUNDLE}CallbackErrorOf_0125 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0126
     * @tc.name      SerialCommunication_CallbackErrorOf_0126
     * @tc.desc      callbackErrorOf(operation="", code=-1) returns " error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0126 begin`);
      const actual: string = callbackErrorOf('', -1);
      logInfo(`callbackErrorOf(operation="", code=-1): actual=${actual}`);
      expect(actual).assertEqual(' error, code is -1');
      logInfo(`${BUNDLE}CallbackErrorOf_0126 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0127
     * @tc.name      SerialCommunication_CallbackErrorOf_0127
     * @tc.desc      callbackErrorOf(operation="", code=1) returns " error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0127 begin`);
      const actual: string = callbackErrorOf('', 1);
      logInfo(`callbackErrorOf(operation="", code=1): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 1');
      logInfo(`${BUNDLE}CallbackErrorOf_0127 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0128
     * @tc.name      SerialCommunication_CallbackErrorOf_0128
     * @tc.desc      callbackErrorOf(operation="", code=2) returns " error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0128 begin`);
      const actual: string = callbackErrorOf('', 2);
      logInfo(`callbackErrorOf(operation="", code=2): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 2');
      logInfo(`${BUNDLE}CallbackErrorOf_0128 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0129
     * @tc.name      SerialCommunication_CallbackErrorOf_0129
     * @tc.desc      callbackErrorOf(operation="", code=3) returns " error, code is 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0129 begin`);
      const actual: string = callbackErrorOf('', 3);
      logInfo(`callbackErrorOf(operation="", code=3): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 3');
      logInfo(`${BUNDLE}CallbackErrorOf_0129 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0130
     * @tc.name      SerialCommunication_CallbackErrorOf_0130
     * @tc.desc      callbackErrorOf(operation="", code=10) returns " error, code is 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0130 begin`);
      const actual: string = callbackErrorOf('', 10);
      logInfo(`callbackErrorOf(operation="", code=10): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 10');
      logInfo(`${BUNDLE}CallbackErrorOf_0130 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0131
     * @tc.name      SerialCommunication_CallbackErrorOf_0131
     * @tc.desc      callbackErrorOf(operation="", code=100) returns " error, code is 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0131 begin`);
      const actual: string = callbackErrorOf('', 100);
      logInfo(`callbackErrorOf(operation="", code=100): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 100');
      logInfo(`${BUNDLE}CallbackErrorOf_0131 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0132
     * @tc.name      SerialCommunication_CallbackErrorOf_0132
     * @tc.desc      callbackErrorOf(operation="", code=25) returns " error, code is 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0132 begin`);
      const actual: string = callbackErrorOf('', 25);
      logInfo(`callbackErrorOf(operation="", code=25): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 25');
      logInfo(`${BUNDLE}CallbackErrorOf_0132 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0133
     * @tc.name      SerialCommunication_CallbackErrorOf_0133
     * @tc.desc      callbackErrorOf(operation="", code=50) returns " error, code is 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0133 begin`);
      const actual: string = callbackErrorOf('', 50);
      logInfo(`callbackErrorOf(operation="", code=50): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 50');
      logInfo(`${BUNDLE}CallbackErrorOf_0133 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0134
     * @tc.name      SerialCommunication_CallbackErrorOf_0134
     * @tc.desc      callbackErrorOf(operation="", code=75) returns " error, code is 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0134 begin`);
      const actual: string = callbackErrorOf('', 75);
      logInfo(`callbackErrorOf(operation="", code=75): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 75');
      logInfo(`${BUNDLE}CallbackErrorOf_0134 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0135
     * @tc.name      SerialCommunication_CallbackErrorOf_0135
     * @tc.desc      callbackErrorOf(operation="", code=125) returns " error, code is 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0135 begin`);
      const actual: string = callbackErrorOf('', 125);
      logInfo(`callbackErrorOf(operation="", code=125): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 125');
      logInfo(`${BUNDLE}CallbackErrorOf_0135 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0136
     * @tc.name      SerialCommunication_CallbackErrorOf_0136
     * @tc.desc      callbackErrorOf(operation="", code=150) returns " error, code is 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0136 begin`);
      const actual: string = callbackErrorOf('', 150);
      logInfo(`callbackErrorOf(operation="", code=150): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 150');
      logInfo(`${BUNDLE}CallbackErrorOf_0136 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0137
     * @tc.name      SerialCommunication_CallbackErrorOf_0137
     * @tc.desc      callbackErrorOf(operation="", code=175) returns " error, code is 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0137 begin`);
      const actual: string = callbackErrorOf('', 175);
      logInfo(`callbackErrorOf(operation="", code=175): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 175');
      logInfo(`${BUNDLE}CallbackErrorOf_0137 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0138
     * @tc.name      SerialCommunication_CallbackErrorOf_0138
     * @tc.desc      callbackErrorOf(operation="", code=225) returns " error, code is 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0138 begin`);
      const actual: string = callbackErrorOf('', 225);
      logInfo(`callbackErrorOf(operation="", code=225): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 225');
      logInfo(`${BUNDLE}CallbackErrorOf_0138 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0139
     * @tc.name      SerialCommunication_CallbackErrorOf_0139
     * @tc.desc      callbackErrorOf(operation="", code=250) returns " error, code is 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0139 begin`);
      const actual: string = callbackErrorOf('', 250);
      logInfo(`callbackErrorOf(operation="", code=250): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 250');
      logInfo(`${BUNDLE}CallbackErrorOf_0139 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0140
     * @tc.name      SerialCommunication_CallbackErrorOf_0140
     * @tc.desc      callbackErrorOf(operation="", code=275) returns " error, code is 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0140 begin`);
      const actual: string = callbackErrorOf('', 275);
      logInfo(`callbackErrorOf(operation="", code=275): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 275');
      logInfo(`${BUNDLE}CallbackErrorOf_0140 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0141
     * @tc.name      SerialCommunication_CallbackErrorOf_0141
     * @tc.desc      callbackErrorOf(operation="", code=300) returns " error, code is 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0141 begin`);
      const actual: string = callbackErrorOf('', 300);
      logInfo(`callbackErrorOf(operation="", code=300): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 300');
      logInfo(`${BUNDLE}CallbackErrorOf_0141 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0142
     * @tc.name      SerialCommunication_CallbackErrorOf_0142
     * @tc.desc      callbackErrorOf(operation="", code=325) returns " error, code is 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0142 begin`);
      const actual: string = callbackErrorOf('', 325);
      logInfo(`callbackErrorOf(operation="", code=325): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 325');
      logInfo(`${BUNDLE}CallbackErrorOf_0142 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0143
     * @tc.name      SerialCommunication_CallbackErrorOf_0143
     * @tc.desc      callbackErrorOf(operation="", code=350) returns " error, code is 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0143 begin`);
      const actual: string = callbackErrorOf('', 350);
      logInfo(`callbackErrorOf(operation="", code=350): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 350');
      logInfo(`${BUNDLE}CallbackErrorOf_0143 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0144
     * @tc.name      SerialCommunication_CallbackErrorOf_0144
     * @tc.desc      callbackErrorOf(operation="", code=375) returns " error, code is 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0144 begin`);
      const actual: string = callbackErrorOf('', 375);
      logInfo(`callbackErrorOf(operation="", code=375): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 375');
      logInfo(`${BUNDLE}CallbackErrorOf_0144 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0145
     * @tc.name      SerialCommunication_CallbackErrorOf_0145
     * @tc.desc      callbackErrorOf(operation="", code=400) returns " error, code is 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0145 begin`);
      const actual: string = callbackErrorOf('', 400);
      logInfo(`callbackErrorOf(operation="", code=400): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 400');
      logInfo(`${BUNDLE}CallbackErrorOf_0145 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0146
     * @tc.name      SerialCommunication_CallbackErrorOf_0146
     * @tc.desc      callbackErrorOf(operation="", code=425) returns " error, code is 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0146 begin`);
      const actual: string = callbackErrorOf('', 425);
      logInfo(`callbackErrorOf(operation="", code=425): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 425');
      logInfo(`${BUNDLE}CallbackErrorOf_0146 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0147
     * @tc.name      SerialCommunication_CallbackErrorOf_0147
     * @tc.desc      callbackErrorOf(operation="", code=450) returns " error, code is 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0147 begin`);
      const actual: string = callbackErrorOf('', 450);
      logInfo(`callbackErrorOf(operation="", code=450): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 450');
      logInfo(`${BUNDLE}CallbackErrorOf_0147 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0148
     * @tc.name      SerialCommunication_CallbackErrorOf_0148
     * @tc.desc      callbackErrorOf(operation="", code=475) returns " error, code is 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0148 begin`);
      const actual: string = callbackErrorOf('', 475);
      logInfo(`callbackErrorOf(operation="", code=475): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 475');
      logInfo(`${BUNDLE}CallbackErrorOf_0148 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0149
     * @tc.name      SerialCommunication_CallbackErrorOf_0149
     * @tc.desc      callbackErrorOf(operation="", code=459) returns " error, code is 459"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0149 begin`);
      const actual: string = callbackErrorOf('', 459);
      logInfo(`callbackErrorOf(operation="", code=459): actual=${actual}`);
      expect(actual).assertEqual(' error, code is 459');
      logInfo(`${BUNDLE}CallbackErrorOf_0149 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0150
     * @tc.name      SerialCommunication_CallbackErrorOf_0150
     * @tc.desc      callbackErrorOf(operation="", code=-76) returns " error, code is -76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0150 begin`);
      const actual: string = callbackErrorOf('', -76);
      logInfo(`callbackErrorOf(operation="", code=-76): actual=${actual}`);
      expect(actual).assertEqual(' error, code is -76');
      logInfo(`${BUNDLE}CallbackErrorOf_0150 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0151
     * @tc.name      SerialCommunication_CallbackErrorOf_0151
     * @tc.desc      callbackErrorOf(operation="a", code=0) returns "a error, code is 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0151 begin`);
      const actual: string = callbackErrorOf('a', 0);
      logInfo(`callbackErrorOf(operation="a", code=0): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 0');
      logInfo(`${BUNDLE}CallbackErrorOf_0151 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0152
     * @tc.name      SerialCommunication_CallbackErrorOf_0152
     * @tc.desc      callbackErrorOf(operation="a", code=200) returns "a error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0152 begin`);
      const actual: string = callbackErrorOf('a', 200);
      logInfo(`callbackErrorOf(operation="a", code=200): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 200');
      logInfo(`${BUNDLE}CallbackErrorOf_0152 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0153
     * @tc.name      SerialCommunication_CallbackErrorOf_0153
     * @tc.desc      callbackErrorOf(operation="a", code=401) returns "a error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0153 begin`);
      const actual: string = callbackErrorOf('a', 401);
      logInfo(`callbackErrorOf(operation="a", code=401): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 401');
      logInfo(`${BUNDLE}CallbackErrorOf_0153 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0154
     * @tc.name      SerialCommunication_CallbackErrorOf_0154
     * @tc.desc      callbackErrorOf(operation="a", code=404) returns "a error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0154 begin`);
      const actual: string = callbackErrorOf('a', 404);
      logInfo(`callbackErrorOf(operation="a", code=404): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 404');
      logInfo(`${BUNDLE}CallbackErrorOf_0154 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0155
     * @tc.name      SerialCommunication_CallbackErrorOf_0155
     * @tc.desc      callbackErrorOf(operation="a", code=500) returns "a error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0155 begin`);
      const actual: string = callbackErrorOf('a', 500);
      logInfo(`callbackErrorOf(operation="a", code=500): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 500');
      logInfo(`${BUNDLE}CallbackErrorOf_0155 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0156
     * @tc.name      SerialCommunication_CallbackErrorOf_0156
     * @tc.desc      callbackErrorOf(operation="a", code=-1) returns "a error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0156 begin`);
      const actual: string = callbackErrorOf('a', -1);
      logInfo(`callbackErrorOf(operation="a", code=-1): actual=${actual}`);
      expect(actual).assertEqual('a error, code is -1');
      logInfo(`${BUNDLE}CallbackErrorOf_0156 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0157
     * @tc.name      SerialCommunication_CallbackErrorOf_0157
     * @tc.desc      callbackErrorOf(operation="a", code=1) returns "a error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0157 begin`);
      const actual: string = callbackErrorOf('a', 1);
      logInfo(`callbackErrorOf(operation="a", code=1): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 1');
      logInfo(`${BUNDLE}CallbackErrorOf_0157 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0158
     * @tc.name      SerialCommunication_CallbackErrorOf_0158
     * @tc.desc      callbackErrorOf(operation="a", code=2) returns "a error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0158 begin`);
      const actual: string = callbackErrorOf('a', 2);
      logInfo(`callbackErrorOf(operation="a", code=2): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 2');
      logInfo(`${BUNDLE}CallbackErrorOf_0158 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0159
     * @tc.name      SerialCommunication_CallbackErrorOf_0159
     * @tc.desc      callbackErrorOf(operation="a", code=3) returns "a error, code is 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0159 begin`);
      const actual: string = callbackErrorOf('a', 3);
      logInfo(`callbackErrorOf(operation="a", code=3): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 3');
      logInfo(`${BUNDLE}CallbackErrorOf_0159 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0160
     * @tc.name      SerialCommunication_CallbackErrorOf_0160
     * @tc.desc      callbackErrorOf(operation="a", code=10) returns "a error, code is 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0160 begin`);
      const actual: string = callbackErrorOf('a', 10);
      logInfo(`callbackErrorOf(operation="a", code=10): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 10');
      logInfo(`${BUNDLE}CallbackErrorOf_0160 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0161
     * @tc.name      SerialCommunication_CallbackErrorOf_0161
     * @tc.desc      callbackErrorOf(operation="a", code=100) returns "a error, code is 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0161 begin`);
      const actual: string = callbackErrorOf('a', 100);
      logInfo(`callbackErrorOf(operation="a", code=100): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 100');
      logInfo(`${BUNDLE}CallbackErrorOf_0161 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0162
     * @tc.name      SerialCommunication_CallbackErrorOf_0162
     * @tc.desc      callbackErrorOf(operation="a", code=25) returns "a error, code is 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0162 begin`);
      const actual: string = callbackErrorOf('a', 25);
      logInfo(`callbackErrorOf(operation="a", code=25): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 25');
      logInfo(`${BUNDLE}CallbackErrorOf_0162 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0163
     * @tc.name      SerialCommunication_CallbackErrorOf_0163
     * @tc.desc      callbackErrorOf(operation="a", code=50) returns "a error, code is 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0163 begin`);
      const actual: string = callbackErrorOf('a', 50);
      logInfo(`callbackErrorOf(operation="a", code=50): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 50');
      logInfo(`${BUNDLE}CallbackErrorOf_0163 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0164
     * @tc.name      SerialCommunication_CallbackErrorOf_0164
     * @tc.desc      callbackErrorOf(operation="a", code=75) returns "a error, code is 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0164 begin`);
      const actual: string = callbackErrorOf('a', 75);
      logInfo(`callbackErrorOf(operation="a", code=75): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 75');
      logInfo(`${BUNDLE}CallbackErrorOf_0164 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0165
     * @tc.name      SerialCommunication_CallbackErrorOf_0165
     * @tc.desc      callbackErrorOf(operation="a", code=125) returns "a error, code is 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0165 begin`);
      const actual: string = callbackErrorOf('a', 125);
      logInfo(`callbackErrorOf(operation="a", code=125): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 125');
      logInfo(`${BUNDLE}CallbackErrorOf_0165 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0166
     * @tc.name      SerialCommunication_CallbackErrorOf_0166
     * @tc.desc      callbackErrorOf(operation="a", code=150) returns "a error, code is 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0166 begin`);
      const actual: string = callbackErrorOf('a', 150);
      logInfo(`callbackErrorOf(operation="a", code=150): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 150');
      logInfo(`${BUNDLE}CallbackErrorOf_0166 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0167
     * @tc.name      SerialCommunication_CallbackErrorOf_0167
     * @tc.desc      callbackErrorOf(operation="a", code=175) returns "a error, code is 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0167 begin`);
      const actual: string = callbackErrorOf('a', 175);
      logInfo(`callbackErrorOf(operation="a", code=175): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 175');
      logInfo(`${BUNDLE}CallbackErrorOf_0167 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0168
     * @tc.name      SerialCommunication_CallbackErrorOf_0168
     * @tc.desc      callbackErrorOf(operation="a", code=225) returns "a error, code is 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0168 begin`);
      const actual: string = callbackErrorOf('a', 225);
      logInfo(`callbackErrorOf(operation="a", code=225): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 225');
      logInfo(`${BUNDLE}CallbackErrorOf_0168 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0169
     * @tc.name      SerialCommunication_CallbackErrorOf_0169
     * @tc.desc      callbackErrorOf(operation="a", code=250) returns "a error, code is 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0169 begin`);
      const actual: string = callbackErrorOf('a', 250);
      logInfo(`callbackErrorOf(operation="a", code=250): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 250');
      logInfo(`${BUNDLE}CallbackErrorOf_0169 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0170
     * @tc.name      SerialCommunication_CallbackErrorOf_0170
     * @tc.desc      callbackErrorOf(operation="a", code=275) returns "a error, code is 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0170 begin`);
      const actual: string = callbackErrorOf('a', 275);
      logInfo(`callbackErrorOf(operation="a", code=275): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 275');
      logInfo(`${BUNDLE}CallbackErrorOf_0170 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0171
     * @tc.name      SerialCommunication_CallbackErrorOf_0171
     * @tc.desc      callbackErrorOf(operation="a", code=300) returns "a error, code is 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0171 begin`);
      const actual: string = callbackErrorOf('a', 300);
      logInfo(`callbackErrorOf(operation="a", code=300): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 300');
      logInfo(`${BUNDLE}CallbackErrorOf_0171 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0172
     * @tc.name      SerialCommunication_CallbackErrorOf_0172
     * @tc.desc      callbackErrorOf(operation="a", code=325) returns "a error, code is 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0172 begin`);
      const actual: string = callbackErrorOf('a', 325);
      logInfo(`callbackErrorOf(operation="a", code=325): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 325');
      logInfo(`${BUNDLE}CallbackErrorOf_0172 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0173
     * @tc.name      SerialCommunication_CallbackErrorOf_0173
     * @tc.desc      callbackErrorOf(operation="a", code=350) returns "a error, code is 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0173 begin`);
      const actual: string = callbackErrorOf('a', 350);
      logInfo(`callbackErrorOf(operation="a", code=350): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 350');
      logInfo(`${BUNDLE}CallbackErrorOf_0173 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0174
     * @tc.name      SerialCommunication_CallbackErrorOf_0174
     * @tc.desc      callbackErrorOf(operation="a", code=375) returns "a error, code is 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0174 begin`);
      const actual: string = callbackErrorOf('a', 375);
      logInfo(`callbackErrorOf(operation="a", code=375): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 375');
      logInfo(`${BUNDLE}CallbackErrorOf_0174 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0175
     * @tc.name      SerialCommunication_CallbackErrorOf_0175
     * @tc.desc      callbackErrorOf(operation="a", code=400) returns "a error, code is 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0175 begin`);
      const actual: string = callbackErrorOf('a', 400);
      logInfo(`callbackErrorOf(operation="a", code=400): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 400');
      logInfo(`${BUNDLE}CallbackErrorOf_0175 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0176
     * @tc.name      SerialCommunication_CallbackErrorOf_0176
     * @tc.desc      callbackErrorOf(operation="a", code=425) returns "a error, code is 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0176 begin`);
      const actual: string = callbackErrorOf('a', 425);
      logInfo(`callbackErrorOf(operation="a", code=425): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 425');
      logInfo(`${BUNDLE}CallbackErrorOf_0176 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0177
     * @tc.name      SerialCommunication_CallbackErrorOf_0177
     * @tc.desc      callbackErrorOf(operation="a", code=450) returns "a error, code is 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0177 begin`);
      const actual: string = callbackErrorOf('a', 450);
      logInfo(`callbackErrorOf(operation="a", code=450): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 450');
      logInfo(`${BUNDLE}CallbackErrorOf_0177 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0178
     * @tc.name      SerialCommunication_CallbackErrorOf_0178
     * @tc.desc      callbackErrorOf(operation="a", code=475) returns "a error, code is 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0178 begin`);
      const actual: string = callbackErrorOf('a', 475);
      logInfo(`callbackErrorOf(operation="a", code=475): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 475');
      logInfo(`${BUNDLE}CallbackErrorOf_0178 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0179
     * @tc.name      SerialCommunication_CallbackErrorOf_0179
     * @tc.desc      callbackErrorOf(operation="a", code=459) returns "a error, code is 459"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0179 begin`);
      const actual: string = callbackErrorOf('a', 459);
      logInfo(`callbackErrorOf(operation="a", code=459): actual=${actual}`);
      expect(actual).assertEqual('a error, code is 459');
      logInfo(`${BUNDLE}CallbackErrorOf_0179 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0180
     * @tc.name      SerialCommunication_CallbackErrorOf_0180
     * @tc.desc      callbackErrorOf(operation="a", code=-76) returns "a error, code is -76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0180 begin`);
      const actual: string = callbackErrorOf('a', -76);
      logInfo(`callbackErrorOf(operation="a", code=-76): actual=${actual}`);
      expect(actual).assertEqual('a error, code is -76');
      logInfo(`${BUNDLE}CallbackErrorOf_0180 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0181
     * @tc.name      SerialCommunication_CallbackErrorOf_0181
     * @tc.desc      callbackErrorOf(operation="abc", code=0) returns "abc error, code is 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0181 begin`);
      const actual: string = callbackErrorOf('abc', 0);
      logInfo(`callbackErrorOf(operation="abc", code=0): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 0');
      logInfo(`${BUNDLE}CallbackErrorOf_0181 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0182
     * @tc.name      SerialCommunication_CallbackErrorOf_0182
     * @tc.desc      callbackErrorOf(operation="abc", code=200) returns "abc error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0182 begin`);
      const actual: string = callbackErrorOf('abc', 200);
      logInfo(`callbackErrorOf(operation="abc", code=200): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 200');
      logInfo(`${BUNDLE}CallbackErrorOf_0182 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0183
     * @tc.name      SerialCommunication_CallbackErrorOf_0183
     * @tc.desc      callbackErrorOf(operation="abc", code=401) returns "abc error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0183 begin`);
      const actual: string = callbackErrorOf('abc', 401);
      logInfo(`callbackErrorOf(operation="abc", code=401): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 401');
      logInfo(`${BUNDLE}CallbackErrorOf_0183 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0184
     * @tc.name      SerialCommunication_CallbackErrorOf_0184
     * @tc.desc      callbackErrorOf(operation="abc", code=404) returns "abc error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0184 begin`);
      const actual: string = callbackErrorOf('abc', 404);
      logInfo(`callbackErrorOf(operation="abc", code=404): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 404');
      logInfo(`${BUNDLE}CallbackErrorOf_0184 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0185
     * @tc.name      SerialCommunication_CallbackErrorOf_0185
     * @tc.desc      callbackErrorOf(operation="abc", code=500) returns "abc error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0185 begin`);
      const actual: string = callbackErrorOf('abc', 500);
      logInfo(`callbackErrorOf(operation="abc", code=500): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 500');
      logInfo(`${BUNDLE}CallbackErrorOf_0185 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0186
     * @tc.name      SerialCommunication_CallbackErrorOf_0186
     * @tc.desc      callbackErrorOf(operation="abc", code=-1) returns "abc error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0186 begin`);
      const actual: string = callbackErrorOf('abc', -1);
      logInfo(`callbackErrorOf(operation="abc", code=-1): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is -1');
      logInfo(`${BUNDLE}CallbackErrorOf_0186 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0187
     * @tc.name      SerialCommunication_CallbackErrorOf_0187
     * @tc.desc      callbackErrorOf(operation="abc", code=1) returns "abc error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0187 begin`);
      const actual: string = callbackErrorOf('abc', 1);
      logInfo(`callbackErrorOf(operation="abc", code=1): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 1');
      logInfo(`${BUNDLE}CallbackErrorOf_0187 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0188
     * @tc.name      SerialCommunication_CallbackErrorOf_0188
     * @tc.desc      callbackErrorOf(operation="abc", code=2) returns "abc error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0188 begin`);
      const actual: string = callbackErrorOf('abc', 2);
      logInfo(`callbackErrorOf(operation="abc", code=2): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 2');
      logInfo(`${BUNDLE}CallbackErrorOf_0188 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0189
     * @tc.name      SerialCommunication_CallbackErrorOf_0189
     * @tc.desc      callbackErrorOf(operation="abc", code=3) returns "abc error, code is 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0189 begin`);
      const actual: string = callbackErrorOf('abc', 3);
      logInfo(`callbackErrorOf(operation="abc", code=3): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 3');
      logInfo(`${BUNDLE}CallbackErrorOf_0189 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0190
     * @tc.name      SerialCommunication_CallbackErrorOf_0190
     * @tc.desc      callbackErrorOf(operation="abc", code=10) returns "abc error, code is 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0190 begin`);
      const actual: string = callbackErrorOf('abc', 10);
      logInfo(`callbackErrorOf(operation="abc", code=10): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 10');
      logInfo(`${BUNDLE}CallbackErrorOf_0190 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0191
     * @tc.name      SerialCommunication_CallbackErrorOf_0191
     * @tc.desc      callbackErrorOf(operation="abc", code=100) returns "abc error, code is 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0191 begin`);
      const actual: string = callbackErrorOf('abc', 100);
      logInfo(`callbackErrorOf(operation="abc", code=100): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 100');
      logInfo(`${BUNDLE}CallbackErrorOf_0191 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0192
     * @tc.name      SerialCommunication_CallbackErrorOf_0192
     * @tc.desc      callbackErrorOf(operation="abc", code=25) returns "abc error, code is 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0192 begin`);
      const actual: string = callbackErrorOf('abc', 25);
      logInfo(`callbackErrorOf(operation="abc", code=25): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 25');
      logInfo(`${BUNDLE}CallbackErrorOf_0192 end`);
    });
  });
}
