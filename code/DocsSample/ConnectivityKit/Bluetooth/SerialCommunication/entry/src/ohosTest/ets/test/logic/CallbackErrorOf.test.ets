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
export default function callbackErrorOfTest(): void {
  describe('CallbackErrorOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0001
     * @tc.name      SerialCommunication_CallbackErrorOf_0001
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=0) returns "sppConnect error, code = 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_CallbackErrorOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0001 begin`);
      const actual: string = callbackErrorOf('sppConnect', 0);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 0');
      logInfo(`${BUNDLE}CallbackErrorOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0002
     * @tc.name      SerialCommunication_CallbackErrorOf_0002
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=200) returns "sppConnect error, code = 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_CallbackErrorOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0002 begin`);
      const actual: string = callbackErrorOf('sppConnect', 200);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 200');
      logInfo(`${BUNDLE}CallbackErrorOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0003
     * @tc.name      SerialCommunication_CallbackErrorOf_0003
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=401) returns "sppConnect error, code = 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0003 begin`);
      const actual: string = callbackErrorOf('sppConnect', 401);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 401');
      logInfo(`${BUNDLE}CallbackErrorOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0004
     * @tc.name      SerialCommunication_CallbackErrorOf_0004
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=404) returns "sppConnect error, code = 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0004 begin`);
      const actual: string = callbackErrorOf('sppConnect', 404);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 404');
      logInfo(`${BUNDLE}CallbackErrorOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0005
     * @tc.name      SerialCommunication_CallbackErrorOf_0005
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=500) returns "sppConnect error, code = 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0005 begin`);
      const actual: string = callbackErrorOf('sppConnect', 500);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 500');
      logInfo(`${BUNDLE}CallbackErrorOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0006
     * @tc.name      SerialCommunication_CallbackErrorOf_0006
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=-1) returns "sppConnect error, code = -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0006 begin`);
      const actual: string = callbackErrorOf('sppConnect', -1);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -1');
      logInfo(`${BUNDLE}CallbackErrorOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0007
     * @tc.name      SerialCommunication_CallbackErrorOf_0007
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=1) returns "sppConnect error, code = 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0007 begin`);
      const actual: string = callbackErrorOf('sppConnect', 1);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 1');
      logInfo(`${BUNDLE}CallbackErrorOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0008
     * @tc.name      SerialCommunication_CallbackErrorOf_0008
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=2) returns "sppConnect error, code = 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0008 begin`);
      const actual: string = callbackErrorOf('sppConnect', 2);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 2');
      logInfo(`${BUNDLE}CallbackErrorOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0009
     * @tc.name      SerialCommunication_CallbackErrorOf_0009
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=3) returns "sppConnect error, code = 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0009 begin`);
      const actual: string = callbackErrorOf('sppConnect', 3);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 3');
      logInfo(`${BUNDLE}CallbackErrorOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0010
     * @tc.name      SerialCommunication_CallbackErrorOf_0010
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=10) returns "sppConnect error, code = 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0010 begin`);
      const actual: string = callbackErrorOf('sppConnect', 10);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 10');
      logInfo(`${BUNDLE}CallbackErrorOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0011
     * @tc.name      SerialCommunication_CallbackErrorOf_0011
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=100) returns "sppConnect error, code = 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0011 begin`);
      const actual: string = callbackErrorOf('sppConnect', 100);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 100');
      logInfo(`${BUNDLE}CallbackErrorOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0012
     * @tc.name      SerialCommunication_CallbackErrorOf_0012
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=25) returns "sppConnect error, code = 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0012 begin`);
      const actual: string = callbackErrorOf('sppConnect', 25);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 25');
      logInfo(`${BUNDLE}CallbackErrorOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0013
     * @tc.name      SerialCommunication_CallbackErrorOf_0013
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=50) returns "sppConnect error, code = 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0013 begin`);
      const actual: string = callbackErrorOf('sppConnect', 50);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 50');
      logInfo(`${BUNDLE}CallbackErrorOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0014
     * @tc.name      SerialCommunication_CallbackErrorOf_0014
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=75) returns "sppConnect error, code = 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0014 begin`);
      const actual: string = callbackErrorOf('sppConnect', 75);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 75');
      logInfo(`${BUNDLE}CallbackErrorOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0015
     * @tc.name      SerialCommunication_CallbackErrorOf_0015
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=125) returns "sppConnect error, code = 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0015 begin`);
      const actual: string = callbackErrorOf('sppConnect', 125);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 125');
      logInfo(`${BUNDLE}CallbackErrorOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0016
     * @tc.name      SerialCommunication_CallbackErrorOf_0016
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=150) returns "sppConnect error, code = 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0016 begin`);
      const actual: string = callbackErrorOf('sppConnect', 150);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 150');
      logInfo(`${BUNDLE}CallbackErrorOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0017
     * @tc.name      SerialCommunication_CallbackErrorOf_0017
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=175) returns "sppConnect error, code = 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0017 begin`);
      const actual: string = callbackErrorOf('sppConnect', 175);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 175');
      logInfo(`${BUNDLE}CallbackErrorOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0018
     * @tc.name      SerialCommunication_CallbackErrorOf_0018
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=225) returns "sppConnect error, code = 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0018 begin`);
      const actual: string = callbackErrorOf('sppConnect', 225);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 225');
      logInfo(`${BUNDLE}CallbackErrorOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0019
     * @tc.name      SerialCommunication_CallbackErrorOf_0019
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=250) returns "sppConnect error, code = 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0019 begin`);
      const actual: string = callbackErrorOf('sppConnect', 250);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 250');
      logInfo(`${BUNDLE}CallbackErrorOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0020
     * @tc.name      SerialCommunication_CallbackErrorOf_0020
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=275) returns "sppConnect error, code = 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0020 begin`);
      const actual: string = callbackErrorOf('sppConnect', 275);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 275');
      logInfo(`${BUNDLE}CallbackErrorOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0021
     * @tc.name      SerialCommunication_CallbackErrorOf_0021
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=300) returns "sppConnect error, code = 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0021 begin`);
      const actual: string = callbackErrorOf('sppConnect', 300);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 300');
      logInfo(`${BUNDLE}CallbackErrorOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0022
     * @tc.name      SerialCommunication_CallbackErrorOf_0022
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=325) returns "sppConnect error, code = 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0022 begin`);
      const actual: string = callbackErrorOf('sppConnect', 325);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 325');
      logInfo(`${BUNDLE}CallbackErrorOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0023
     * @tc.name      SerialCommunication_CallbackErrorOf_0023
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=350) returns "sppConnect error, code = 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0023 begin`);
      const actual: string = callbackErrorOf('sppConnect', 350);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 350');
      logInfo(`${BUNDLE}CallbackErrorOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0024
     * @tc.name      SerialCommunication_CallbackErrorOf_0024
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=375) returns "sppConnect error, code = 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0024 begin`);
      const actual: string = callbackErrorOf('sppConnect', 375);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 375');
      logInfo(`${BUNDLE}CallbackErrorOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0025
     * @tc.name      SerialCommunication_CallbackErrorOf_0025
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=400) returns "sppConnect error, code = 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0025 begin`);
      const actual: string = callbackErrorOf('sppConnect', 400);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 400');
      logInfo(`${BUNDLE}CallbackErrorOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0026
     * @tc.name      SerialCommunication_CallbackErrorOf_0026
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=425) returns "sppConnect error, code = 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0026 begin`);
      const actual: string = callbackErrorOf('sppConnect', 425);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 425');
      logInfo(`${BUNDLE}CallbackErrorOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0027
     * @tc.name      SerialCommunication_CallbackErrorOf_0027
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=450) returns "sppConnect error, code = 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0027 begin`);
      const actual: string = callbackErrorOf('sppConnect', 450);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 450');
      logInfo(`${BUNDLE}CallbackErrorOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0028
     * @tc.name      SerialCommunication_CallbackErrorOf_0028
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=475) returns "sppConnect error, code = 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0028 begin`);
      const actual: string = callbackErrorOf('sppConnect', 475);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 475');
      logInfo(`${BUNDLE}CallbackErrorOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0029
     * @tc.name      SerialCommunication_CallbackErrorOf_0029
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=459) returns "sppConnect error, code = 459"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_CallbackErrorOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0029 begin`);
      const actual: string = callbackErrorOf('sppConnect', 459);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = 459');
      logInfo(`${BUNDLE}CallbackErrorOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0030
     * @tc.name      SerialCommunication_CallbackErrorOf_0030
     * @tc.desc      callbackErrorOf(operation="sppConnect", code=-76) returns "sppConnect error, code = -76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0030 begin`);
      const actual: string = callbackErrorOf('sppConnect', -76);
      logInfo(`callbackErrorOf(operation="sppConnect", c...: actual=${actual}`);
      expect(actual).assertEqual('sppConnect error, code = -76');
      logInfo(`${BUNDLE}CallbackErrorOf_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0031
     * @tc.name      SerialCommunication_CallbackErrorOf_0031
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=0) returns "SPPCONNECT error, code is 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0031 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 0);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 0');
      logInfo(`${BUNDLE}CallbackErrorOf_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0032
     * @tc.name      SerialCommunication_CallbackErrorOf_0032
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=200) returns "SPPCONNECT error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0032 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 200);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 200');
      logInfo(`${BUNDLE}CallbackErrorOf_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0033
     * @tc.name      SerialCommunication_CallbackErrorOf_0033
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=401) returns "SPPCONNECT error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0033 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 401);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 401');
      logInfo(`${BUNDLE}CallbackErrorOf_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0034
     * @tc.name      SerialCommunication_CallbackErrorOf_0034
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=404) returns "SPPCONNECT error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0034 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 404);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 404');
      logInfo(`${BUNDLE}CallbackErrorOf_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0035
     * @tc.name      SerialCommunication_CallbackErrorOf_0035
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=500) returns "SPPCONNECT error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0035 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 500);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 500');
      logInfo(`${BUNDLE}CallbackErrorOf_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0036
     * @tc.name      SerialCommunication_CallbackErrorOf_0036
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=-1) returns "SPPCONNECT error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0036 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', -1);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is -1');
      logInfo(`${BUNDLE}CallbackErrorOf_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0037
     * @tc.name      SerialCommunication_CallbackErrorOf_0037
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=1) returns "SPPCONNECT error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0037 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 1);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 1');
      logInfo(`${BUNDLE}CallbackErrorOf_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0038
     * @tc.name      SerialCommunication_CallbackErrorOf_0038
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=2) returns "SPPCONNECT error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0038 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 2);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 2');
      logInfo(`${BUNDLE}CallbackErrorOf_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0039
     * @tc.name      SerialCommunication_CallbackErrorOf_0039
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=3) returns "SPPCONNECT error, code is 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0039 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 3);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 3');
      logInfo(`${BUNDLE}CallbackErrorOf_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0040
     * @tc.name      SerialCommunication_CallbackErrorOf_0040
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=10) returns "SPPCONNECT error, code is 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0040 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 10);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 10');
      logInfo(`${BUNDLE}CallbackErrorOf_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0041
     * @tc.name      SerialCommunication_CallbackErrorOf_0041
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=100) returns "SPPCONNECT error, code is 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0041 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 100);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 100');
      logInfo(`${BUNDLE}CallbackErrorOf_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0042
     * @tc.name      SerialCommunication_CallbackErrorOf_0042
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=25) returns "SPPCONNECT error, code is 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0042 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 25);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 25');
      logInfo(`${BUNDLE}CallbackErrorOf_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0043
     * @tc.name      SerialCommunication_CallbackErrorOf_0043
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=50) returns "SPPCONNECT error, code is 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0043 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 50);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 50');
      logInfo(`${BUNDLE}CallbackErrorOf_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0044
     * @tc.name      SerialCommunication_CallbackErrorOf_0044
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=75) returns "SPPCONNECT error, code is 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0044 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 75);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 75');
      logInfo(`${BUNDLE}CallbackErrorOf_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0045
     * @tc.name      SerialCommunication_CallbackErrorOf_0045
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=125) returns "SPPCONNECT error, code is 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0045 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 125);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 125');
      logInfo(`${BUNDLE}CallbackErrorOf_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0046
     * @tc.name      SerialCommunication_CallbackErrorOf_0046
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=150) returns "SPPCONNECT error, code is 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0046 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 150);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 150');
      logInfo(`${BUNDLE}CallbackErrorOf_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0047
     * @tc.name      SerialCommunication_CallbackErrorOf_0047
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=175) returns "SPPCONNECT error, code is 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0047 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 175);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 175');
      logInfo(`${BUNDLE}CallbackErrorOf_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0048
     * @tc.name      SerialCommunication_CallbackErrorOf_0048
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=225) returns "SPPCONNECT error, code is 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0048 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 225);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 225');
      logInfo(`${BUNDLE}CallbackErrorOf_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0049
     * @tc.name      SerialCommunication_CallbackErrorOf_0049
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=250) returns "SPPCONNECT error, code is 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0049 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 250);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 250');
      logInfo(`${BUNDLE}CallbackErrorOf_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0050
     * @tc.name      SerialCommunication_CallbackErrorOf_0050
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=275) returns "SPPCONNECT error, code is 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0050 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 275);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 275');
      logInfo(`${BUNDLE}CallbackErrorOf_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0051
     * @tc.name      SerialCommunication_CallbackErrorOf_0051
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=300) returns "SPPCONNECT error, code is 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0051 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 300);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 300');
      logInfo(`${BUNDLE}CallbackErrorOf_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0052
     * @tc.name      SerialCommunication_CallbackErrorOf_0052
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=325) returns "SPPCONNECT error, code is 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0052 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 325);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 325');
      logInfo(`${BUNDLE}CallbackErrorOf_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0053
     * @tc.name      SerialCommunication_CallbackErrorOf_0053
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=350) returns "SPPCONNECT error, code is 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0053 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 350);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 350');
      logInfo(`${BUNDLE}CallbackErrorOf_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0054
     * @tc.name      SerialCommunication_CallbackErrorOf_0054
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=375) returns "SPPCONNECT error, code is 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0054 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 375);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 375');
      logInfo(`${BUNDLE}CallbackErrorOf_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0055
     * @tc.name      SerialCommunication_CallbackErrorOf_0055
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=400) returns "SPPCONNECT error, code is 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0055 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 400);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 400');
      logInfo(`${BUNDLE}CallbackErrorOf_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0056
     * @tc.name      SerialCommunication_CallbackErrorOf_0056
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=425) returns "SPPCONNECT error, code is 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0056 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 425);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 425');
      logInfo(`${BUNDLE}CallbackErrorOf_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0057
     * @tc.name      SerialCommunication_CallbackErrorOf_0057
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=450) returns "SPPCONNECT error, code is 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0057 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 450);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 450');
      logInfo(`${BUNDLE}CallbackErrorOf_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0058
     * @tc.name      SerialCommunication_CallbackErrorOf_0058
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=475) returns "SPPCONNECT error, code is 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0058 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 475);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 475');
      logInfo(`${BUNDLE}CallbackErrorOf_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0059
     * @tc.name      SerialCommunication_CallbackErrorOf_0059
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=459) returns "SPPCONNECT error, code is 459"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0059 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', 459);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is 459');
      logInfo(`${BUNDLE}CallbackErrorOf_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0060
     * @tc.name      SerialCommunication_CallbackErrorOf_0060
     * @tc.desc      callbackErrorOf(operation="SPPCONNECT", code=-76) returns "SPPCONNECT error, code is -76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0060 begin`);
      const actual: string = callbackErrorOf('SPPCONNECT', -76);
      logInfo(`callbackErrorOf(operation="SPPCONNECT", c...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT error, code is -76');
      logInfo(`${BUNDLE}CallbackErrorOf_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0061
     * @tc.name      SerialCommunication_CallbackErrorOf_0061
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=0) returns "sppConnec error, code is 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0061 begin`);
      const actual: string = callbackErrorOf('sppConnec', 0);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 0');
      logInfo(`${BUNDLE}CallbackErrorOf_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0062
     * @tc.name      SerialCommunication_CallbackErrorOf_0062
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=200) returns "sppConnec error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0062 begin`);
      const actual: string = callbackErrorOf('sppConnec', 200);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 200');
      logInfo(`${BUNDLE}CallbackErrorOf_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0063
     * @tc.name      SerialCommunication_CallbackErrorOf_0063
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=401) returns "sppConnec error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0063 begin`);
      const actual: string = callbackErrorOf('sppConnec', 401);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 401');
      logInfo(`${BUNDLE}CallbackErrorOf_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0064
     * @tc.name      SerialCommunication_CallbackErrorOf_0064
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=404) returns "sppConnec error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0064 begin`);
      const actual: string = callbackErrorOf('sppConnec', 404);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 404');
      logInfo(`${BUNDLE}CallbackErrorOf_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0065
     * @tc.name      SerialCommunication_CallbackErrorOf_0065
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=500) returns "sppConnec error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0065 begin`);
      const actual: string = callbackErrorOf('sppConnec', 500);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 500');
      logInfo(`${BUNDLE}CallbackErrorOf_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0066
     * @tc.name      SerialCommunication_CallbackErrorOf_0066
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=-1) returns "sppConnec error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0066 begin`);
      const actual: string = callbackErrorOf('sppConnec', -1);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is -1');
      logInfo(`${BUNDLE}CallbackErrorOf_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0067
     * @tc.name      SerialCommunication_CallbackErrorOf_0067
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=1) returns "sppConnec error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0067 begin`);
      const actual: string = callbackErrorOf('sppConnec', 1);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 1');
      logInfo(`${BUNDLE}CallbackErrorOf_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0068
     * @tc.name      SerialCommunication_CallbackErrorOf_0068
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=2) returns "sppConnec error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0068 begin`);
      const actual: string = callbackErrorOf('sppConnec', 2);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 2');
      logInfo(`${BUNDLE}CallbackErrorOf_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0069
     * @tc.name      SerialCommunication_CallbackErrorOf_0069
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=3) returns "sppConnec error, code is 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0069 begin`);
      const actual: string = callbackErrorOf('sppConnec', 3);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 3');
      logInfo(`${BUNDLE}CallbackErrorOf_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0070
     * @tc.name      SerialCommunication_CallbackErrorOf_0070
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=10) returns "sppConnec error, code is 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0070 begin`);
      const actual: string = callbackErrorOf('sppConnec', 10);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 10');
      logInfo(`${BUNDLE}CallbackErrorOf_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0071
     * @tc.name      SerialCommunication_CallbackErrorOf_0071
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=100) returns "sppConnec error, code is 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0071 begin`);
      const actual: string = callbackErrorOf('sppConnec', 100);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 100');
      logInfo(`${BUNDLE}CallbackErrorOf_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0072
     * @tc.name      SerialCommunication_CallbackErrorOf_0072
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=25) returns "sppConnec error, code is 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0072 begin`);
      const actual: string = callbackErrorOf('sppConnec', 25);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 25');
      logInfo(`${BUNDLE}CallbackErrorOf_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0073
     * @tc.name      SerialCommunication_CallbackErrorOf_0073
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=50) returns "sppConnec error, code is 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0073 begin`);
      const actual: string = callbackErrorOf('sppConnec', 50);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 50');
      logInfo(`${BUNDLE}CallbackErrorOf_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0074
     * @tc.name      SerialCommunication_CallbackErrorOf_0074
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=75) returns "sppConnec error, code is 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0074 begin`);
      const actual: string = callbackErrorOf('sppConnec', 75);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 75');
      logInfo(`${BUNDLE}CallbackErrorOf_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0075
     * @tc.name      SerialCommunication_CallbackErrorOf_0075
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=125) returns "sppConnec error, code is 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0075 begin`);
      const actual: string = callbackErrorOf('sppConnec', 125);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 125');
      logInfo(`${BUNDLE}CallbackErrorOf_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0076
     * @tc.name      SerialCommunication_CallbackErrorOf_0076
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=150) returns "sppConnec error, code is 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0076 begin`);
      const actual: string = callbackErrorOf('sppConnec', 150);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 150');
      logInfo(`${BUNDLE}CallbackErrorOf_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0077
     * @tc.name      SerialCommunication_CallbackErrorOf_0077
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=175) returns "sppConnec error, code is 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0077 begin`);
      const actual: string = callbackErrorOf('sppConnec', 175);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 175');
      logInfo(`${BUNDLE}CallbackErrorOf_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0078
     * @tc.name      SerialCommunication_CallbackErrorOf_0078
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=225) returns "sppConnec error, code is 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0078 begin`);
      const actual: string = callbackErrorOf('sppConnec', 225);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 225');
      logInfo(`${BUNDLE}CallbackErrorOf_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0079
     * @tc.name      SerialCommunication_CallbackErrorOf_0079
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=250) returns "sppConnec error, code is 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0079 begin`);
      const actual: string = callbackErrorOf('sppConnec', 250);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 250');
      logInfo(`${BUNDLE}CallbackErrorOf_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0080
     * @tc.name      SerialCommunication_CallbackErrorOf_0080
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=275) returns "sppConnec error, code is 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0080 begin`);
      const actual: string = callbackErrorOf('sppConnec', 275);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 275');
      logInfo(`${BUNDLE}CallbackErrorOf_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0081
     * @tc.name      SerialCommunication_CallbackErrorOf_0081
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=300) returns "sppConnec error, code is 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0081 begin`);
      const actual: string = callbackErrorOf('sppConnec', 300);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 300');
      logInfo(`${BUNDLE}CallbackErrorOf_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0082
     * @tc.name      SerialCommunication_CallbackErrorOf_0082
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=325) returns "sppConnec error, code is 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0082 begin`);
      const actual: string = callbackErrorOf('sppConnec', 325);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 325');
      logInfo(`${BUNDLE}CallbackErrorOf_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0083
     * @tc.name      SerialCommunication_CallbackErrorOf_0083
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=350) returns "sppConnec error, code is 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0083 begin`);
      const actual: string = callbackErrorOf('sppConnec', 350);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 350');
      logInfo(`${BUNDLE}CallbackErrorOf_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0084
     * @tc.name      SerialCommunication_CallbackErrorOf_0084
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=375) returns "sppConnec error, code is 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0084 begin`);
      const actual: string = callbackErrorOf('sppConnec', 375);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 375');
      logInfo(`${BUNDLE}CallbackErrorOf_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0085
     * @tc.name      SerialCommunication_CallbackErrorOf_0085
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=400) returns "sppConnec error, code is 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0085 begin`);
      const actual: string = callbackErrorOf('sppConnec', 400);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 400');
      logInfo(`${BUNDLE}CallbackErrorOf_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0086
     * @tc.name      SerialCommunication_CallbackErrorOf_0086
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=425) returns "sppConnec error, code is 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0086 begin`);
      const actual: string = callbackErrorOf('sppConnec', 425);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 425');
      logInfo(`${BUNDLE}CallbackErrorOf_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0087
     * @tc.name      SerialCommunication_CallbackErrorOf_0087
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=450) returns "sppConnec error, code is 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0087 begin`);
      const actual: string = callbackErrorOf('sppConnec', 450);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 450');
      logInfo(`${BUNDLE}CallbackErrorOf_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0088
     * @tc.name      SerialCommunication_CallbackErrorOf_0088
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=475) returns "sppConnec error, code is 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0088 begin`);
      const actual: string = callbackErrorOf('sppConnec', 475);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 475');
      logInfo(`${BUNDLE}CallbackErrorOf_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0089
     * @tc.name      SerialCommunication_CallbackErrorOf_0089
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=459) returns "sppConnec error, code is 459"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0089 begin`);
      const actual: string = callbackErrorOf('sppConnec', 459);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is 459');
      logInfo(`${BUNDLE}CallbackErrorOf_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0090
     * @tc.name      SerialCommunication_CallbackErrorOf_0090
     * @tc.desc      callbackErrorOf(operation="sppConnec", code=-76) returns "sppConnec error, code is -76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0090 begin`);
      const actual: string = callbackErrorOf('sppConnec', -76);
      logInfo(`callbackErrorOf(operation="sppConnec", co...: actual=${actual}`);
      expect(actual).assertEqual('sppConnec error, code is -76');
      logInfo(`${BUNDLE}CallbackErrorOf_0090 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0091
     * @tc.name      SerialCommunication_CallbackErrorOf_0091
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=0) returns "sppConnectx error, code is 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0091 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 0);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 0');
      logInfo(`${BUNDLE}CallbackErrorOf_0091 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0092
     * @tc.name      SerialCommunication_CallbackErrorOf_0092
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=200) returns "sppConnectx error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0092 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 200);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 200');
      logInfo(`${BUNDLE}CallbackErrorOf_0092 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0093
     * @tc.name      SerialCommunication_CallbackErrorOf_0093
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=401) returns "sppConnectx error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0093 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 401);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 401');
      logInfo(`${BUNDLE}CallbackErrorOf_0093 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0094
     * @tc.name      SerialCommunication_CallbackErrorOf_0094
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=404) returns "sppConnectx error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0094 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 404);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 404');
      logInfo(`${BUNDLE}CallbackErrorOf_0094 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0095
     * @tc.name      SerialCommunication_CallbackErrorOf_0095
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=500) returns "sppConnectx error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0095 begin`);
      const actual: string = callbackErrorOf('sppConnectx', 500);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is 500');
      logInfo(`${BUNDLE}CallbackErrorOf_0095 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0096
     * @tc.name      SerialCommunication_CallbackErrorOf_0096
     * @tc.desc      callbackErrorOf(operation="sppConnectx", code=-1) returns "sppConnectx error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0096 begin`);
      const actual: string = callbackErrorOf('sppConnectx', -1);
      logInfo(`callbackErrorOf(operation="sppConnectx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppConnectx error, code is -1');
      logInfo(`${BUNDLE}CallbackErrorOf_0096 end`);
    });
  });
}
