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

/** Logic checks for callbackErrorOf (41 cases). */
export default function callbackErrorOf3Test(): void {
  describe('CallbackErrorOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0193
     * @tc.name      SerialCommunication_CallbackErrorOf_0193
     * @tc.desc      callbackErrorOf(operation="abc", code=50) returns "abc error, code is 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0193 begin`);
      const actual: string = callbackErrorOf('abc', 50);
      logInfo(`callbackErrorOf(operation="abc", code=50): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 50');
      logInfo(`${BUNDLE}CallbackErrorOf_0193 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0194
     * @tc.name      SerialCommunication_CallbackErrorOf_0194
     * @tc.desc      callbackErrorOf(operation="abc", code=75) returns "abc error, code is 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0194 begin`);
      const actual: string = callbackErrorOf('abc', 75);
      logInfo(`callbackErrorOf(operation="abc", code=75): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 75');
      logInfo(`${BUNDLE}CallbackErrorOf_0194 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0195
     * @tc.name      SerialCommunication_CallbackErrorOf_0195
     * @tc.desc      callbackErrorOf(operation="abc", code=125) returns "abc error, code is 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0195 begin`);
      const actual: string = callbackErrorOf('abc', 125);
      logInfo(`callbackErrorOf(operation="abc", code=125): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 125');
      logInfo(`${BUNDLE}CallbackErrorOf_0195 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0196
     * @tc.name      SerialCommunication_CallbackErrorOf_0196
     * @tc.desc      callbackErrorOf(operation="abc", code=150) returns "abc error, code is 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0196 begin`);
      const actual: string = callbackErrorOf('abc', 150);
      logInfo(`callbackErrorOf(operation="abc", code=150): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 150');
      logInfo(`${BUNDLE}CallbackErrorOf_0196 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0197
     * @tc.name      SerialCommunication_CallbackErrorOf_0197
     * @tc.desc      callbackErrorOf(operation="abc", code=175) returns "abc error, code is 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0197 begin`);
      const actual: string = callbackErrorOf('abc', 175);
      logInfo(`callbackErrorOf(operation="abc", code=175): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 175');
      logInfo(`${BUNDLE}CallbackErrorOf_0197 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0198
     * @tc.name      SerialCommunication_CallbackErrorOf_0198
     * @tc.desc      callbackErrorOf(operation="abc", code=225) returns "abc error, code is 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0198 begin`);
      const actual: string = callbackErrorOf('abc', 225);
      logInfo(`callbackErrorOf(operation="abc", code=225): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 225');
      logInfo(`${BUNDLE}CallbackErrorOf_0198 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0199
     * @tc.name      SerialCommunication_CallbackErrorOf_0199
     * @tc.desc      callbackErrorOf(operation="abc", code=250) returns "abc error, code is 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0199 begin`);
      const actual: string = callbackErrorOf('abc', 250);
      logInfo(`callbackErrorOf(operation="abc", code=250): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 250');
      logInfo(`${BUNDLE}CallbackErrorOf_0199 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0200
     * @tc.name      SerialCommunication_CallbackErrorOf_0200
     * @tc.desc      callbackErrorOf(operation="abc", code=275) returns "abc error, code is 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0200 begin`);
      const actual: string = callbackErrorOf('abc', 275);
      logInfo(`callbackErrorOf(operation="abc", code=275): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 275');
      logInfo(`${BUNDLE}CallbackErrorOf_0200 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0201
     * @tc.name      SerialCommunication_CallbackErrorOf_0201
     * @tc.desc      callbackErrorOf(operation="abc", code=300) returns "abc error, code is 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0201 begin`);
      const actual: string = callbackErrorOf('abc', 300);
      logInfo(`callbackErrorOf(operation="abc", code=300): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 300');
      logInfo(`${BUNDLE}CallbackErrorOf_0201 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0202
     * @tc.name      SerialCommunication_CallbackErrorOf_0202
     * @tc.desc      callbackErrorOf(operation="abc", code=325) returns "abc error, code is 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0202 begin`);
      const actual: string = callbackErrorOf('abc', 325);
      logInfo(`callbackErrorOf(operation="abc", code=325): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 325');
      logInfo(`${BUNDLE}CallbackErrorOf_0202 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0203
     * @tc.name      SerialCommunication_CallbackErrorOf_0203
     * @tc.desc      callbackErrorOf(operation="abc", code=350) returns "abc error, code is 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0203 begin`);
      const actual: string = callbackErrorOf('abc', 350);
      logInfo(`callbackErrorOf(operation="abc", code=350): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 350');
      logInfo(`${BUNDLE}CallbackErrorOf_0203 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0204
     * @tc.name      SerialCommunication_CallbackErrorOf_0204
     * @tc.desc      callbackErrorOf(operation="abc", code=375) returns "abc error, code is 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0204 begin`);
      const actual: string = callbackErrorOf('abc', 375);
      logInfo(`callbackErrorOf(operation="abc", code=375): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 375');
      logInfo(`${BUNDLE}CallbackErrorOf_0204 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0205
     * @tc.name      SerialCommunication_CallbackErrorOf_0205
     * @tc.desc      callbackErrorOf(operation="abc", code=400) returns "abc error, code is 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0205 begin`);
      const actual: string = callbackErrorOf('abc', 400);
      logInfo(`callbackErrorOf(operation="abc", code=400): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 400');
      logInfo(`${BUNDLE}CallbackErrorOf_0205 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0206
     * @tc.name      SerialCommunication_CallbackErrorOf_0206
     * @tc.desc      callbackErrorOf(operation="abc", code=425) returns "abc error, code is 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0206 begin`);
      const actual: string = callbackErrorOf('abc', 425);
      logInfo(`callbackErrorOf(operation="abc", code=425): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 425');
      logInfo(`${BUNDLE}CallbackErrorOf_0206 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0207
     * @tc.name      SerialCommunication_CallbackErrorOf_0207
     * @tc.desc      callbackErrorOf(operation="abc", code=450) returns "abc error, code is 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0207 begin`);
      const actual: string = callbackErrorOf('abc', 450);
      logInfo(`callbackErrorOf(operation="abc", code=450): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 450');
      logInfo(`${BUNDLE}CallbackErrorOf_0207 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0208
     * @tc.name      SerialCommunication_CallbackErrorOf_0208
     * @tc.desc      callbackErrorOf(operation="abc", code=475) returns "abc error, code is 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0208 begin`);
      const actual: string = callbackErrorOf('abc', 475);
      logInfo(`callbackErrorOf(operation="abc", code=475): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 475');
      logInfo(`${BUNDLE}CallbackErrorOf_0208 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0209
     * @tc.name      SerialCommunication_CallbackErrorOf_0209
     * @tc.desc      callbackErrorOf(operation="abc", code=459) returns "abc error, code is 459"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0209 begin`);
      const actual: string = callbackErrorOf('abc', 459);
      logInfo(`callbackErrorOf(operation="abc", code=459): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is 459');
      logInfo(`${BUNDLE}CallbackErrorOf_0209 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0210
     * @tc.name      SerialCommunication_CallbackErrorOf_0210
     * @tc.desc      callbackErrorOf(operation="abc", code=-76) returns "abc error, code is -76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0210 begin`);
      const actual: string = callbackErrorOf('abc', -76);
      logInfo(`callbackErrorOf(operation="abc", code=-76): actual=${actual}`);
      expect(actual).assertEqual('abc error, code is -76');
      logInfo(`${BUNDLE}CallbackErrorOf_0210 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0211
     * @tc.name      SerialCommunication_CallbackErrorOf_0211
     * @tc.desc      callbackErrorOf(operation="Hello World", code=0) returns "Hello World error, code is 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0211 begin`);
      const actual: string = callbackErrorOf('Hello World', 0);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 0');
      logInfo(`${BUNDLE}CallbackErrorOf_0211 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0212
     * @tc.name      SerialCommunication_CallbackErrorOf_0212
     * @tc.desc      callbackErrorOf(operation="Hello World", code=200) returns "Hello World error, code is 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0212 begin`);
      const actual: string = callbackErrorOf('Hello World', 200);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 200');
      logInfo(`${BUNDLE}CallbackErrorOf_0212 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0213
     * @tc.name      SerialCommunication_CallbackErrorOf_0213
     * @tc.desc      callbackErrorOf(operation="Hello World", code=401) returns "Hello World error, code is 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0213 begin`);
      const actual: string = callbackErrorOf('Hello World', 401);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 401');
      logInfo(`${BUNDLE}CallbackErrorOf_0213 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0214
     * @tc.name      SerialCommunication_CallbackErrorOf_0214
     * @tc.desc      callbackErrorOf(operation="Hello World", code=404) returns "Hello World error, code is 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0214 begin`);
      const actual: string = callbackErrorOf('Hello World', 404);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 404');
      logInfo(`${BUNDLE}CallbackErrorOf_0214 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0215
     * @tc.name      SerialCommunication_CallbackErrorOf_0215
     * @tc.desc      callbackErrorOf(operation="Hello World", code=500) returns "Hello World error, code is 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0215 begin`);
      const actual: string = callbackErrorOf('Hello World', 500);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 500');
      logInfo(`${BUNDLE}CallbackErrorOf_0215 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0216
     * @tc.name      SerialCommunication_CallbackErrorOf_0216
     * @tc.desc      callbackErrorOf(operation="Hello World", code=-1) returns "Hello World error, code is -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_CallbackErrorOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0216 begin`);
      const actual: string = callbackErrorOf('Hello World', -1);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is -1');
      logInfo(`${BUNDLE}CallbackErrorOf_0216 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0217
     * @tc.name      SerialCommunication_CallbackErrorOf_0217
     * @tc.desc      callbackErrorOf(operation="Hello World", code=1) returns "Hello World error, code is 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0217 begin`);
      const actual: string = callbackErrorOf('Hello World', 1);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 1');
      logInfo(`${BUNDLE}CallbackErrorOf_0217 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0218
     * @tc.name      SerialCommunication_CallbackErrorOf_0218
     * @tc.desc      callbackErrorOf(operation="Hello World", code=2) returns "Hello World error, code is 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0218 begin`);
      const actual: string = callbackErrorOf('Hello World', 2);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 2');
      logInfo(`${BUNDLE}CallbackErrorOf_0218 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0219
     * @tc.name      SerialCommunication_CallbackErrorOf_0219
     * @tc.desc      callbackErrorOf(operation="Hello World", code=3) returns "Hello World error, code is 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0219 begin`);
      const actual: string = callbackErrorOf('Hello World', 3);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 3');
      logInfo(`${BUNDLE}CallbackErrorOf_0219 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0220
     * @tc.name      SerialCommunication_CallbackErrorOf_0220
     * @tc.desc      callbackErrorOf(operation="Hello World", code=10) returns "Hello World error, code is 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0220 begin`);
      const actual: string = callbackErrorOf('Hello World', 10);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 10');
      logInfo(`${BUNDLE}CallbackErrorOf_0220 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0221
     * @tc.name      SerialCommunication_CallbackErrorOf_0221
     * @tc.desc      callbackErrorOf(operation="Hello World", code=100) returns "Hello World error, code is 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0221 begin`);
      const actual: string = callbackErrorOf('Hello World', 100);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 100');
      logInfo(`${BUNDLE}CallbackErrorOf_0221 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0222
     * @tc.name      SerialCommunication_CallbackErrorOf_0222
     * @tc.desc      callbackErrorOf(operation="Hello World", code=25) returns "Hello World error, code is 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0222 begin`);
      const actual: string = callbackErrorOf('Hello World', 25);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 25');
      logInfo(`${BUNDLE}CallbackErrorOf_0222 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0223
     * @tc.name      SerialCommunication_CallbackErrorOf_0223
     * @tc.desc      callbackErrorOf(operation="Hello World", code=50) returns "Hello World error, code is 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0223 begin`);
      const actual: string = callbackErrorOf('Hello World', 50);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 50');
      logInfo(`${BUNDLE}CallbackErrorOf_0223 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0224
     * @tc.name      SerialCommunication_CallbackErrorOf_0224
     * @tc.desc      callbackErrorOf(operation="Hello World", code=75) returns "Hello World error, code is 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0224 begin`);
      const actual: string = callbackErrorOf('Hello World', 75);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 75');
      logInfo(`${BUNDLE}CallbackErrorOf_0224 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0225
     * @tc.name      SerialCommunication_CallbackErrorOf_0225
     * @tc.desc      callbackErrorOf(operation="Hello World", code=125) returns "Hello World error, code is 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0225 begin`);
      const actual: string = callbackErrorOf('Hello World', 125);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 125');
      logInfo(`${BUNDLE}CallbackErrorOf_0225 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0226
     * @tc.name      SerialCommunication_CallbackErrorOf_0226
     * @tc.desc      callbackErrorOf(operation="Hello World", code=150) returns "Hello World error, code is 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0226 begin`);
      const actual: string = callbackErrorOf('Hello World', 150);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 150');
      logInfo(`${BUNDLE}CallbackErrorOf_0226 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0227
     * @tc.name      SerialCommunication_CallbackErrorOf_0227
     * @tc.desc      callbackErrorOf(operation="Hello World", code=175) returns "Hello World error, code is 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0227 begin`);
      const actual: string = callbackErrorOf('Hello World', 175);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 175');
      logInfo(`${BUNDLE}CallbackErrorOf_0227 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0228
     * @tc.name      SerialCommunication_CallbackErrorOf_0228
     * @tc.desc      callbackErrorOf(operation="Hello World", code=225) returns "Hello World error, code is 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0228 begin`);
      const actual: string = callbackErrorOf('Hello World', 225);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 225');
      logInfo(`${BUNDLE}CallbackErrorOf_0228 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0229
     * @tc.name      SerialCommunication_CallbackErrorOf_0229
     * @tc.desc      callbackErrorOf(operation="Hello World", code=250) returns "Hello World error, code is 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0229 begin`);
      const actual: string = callbackErrorOf('Hello World', 250);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 250');
      logInfo(`${BUNDLE}CallbackErrorOf_0229 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0230
     * @tc.name      SerialCommunication_CallbackErrorOf_0230
     * @tc.desc      callbackErrorOf(operation="Hello World", code=275) returns "Hello World error, code is 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0230 begin`);
      const actual: string = callbackErrorOf('Hello World', 275);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 275');
      logInfo(`${BUNDLE}CallbackErrorOf_0230 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0231
     * @tc.name      SerialCommunication_CallbackErrorOf_0231
     * @tc.desc      callbackErrorOf(operation="Hello World", code=300) returns "Hello World error, code is 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0231 begin`);
      const actual: string = callbackErrorOf('Hello World', 300);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 300');
      logInfo(`${BUNDLE}CallbackErrorOf_0231 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0232
     * @tc.name      SerialCommunication_CallbackErrorOf_0232
     * @tc.desc      callbackErrorOf(operation="Hello World", code=325) returns "Hello World error, code is 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0232 begin`);
      const actual: string = callbackErrorOf('Hello World', 325);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 325');
      logInfo(`${BUNDLE}CallbackErrorOf_0232 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_CALLBACK_ERROR_OF_0233
     * @tc.name      SerialCommunication_CallbackErrorOf_0233
     * @tc.desc      callbackErrorOf(operation="Hello World", code=350) returns "Hello World error, code is 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_CallbackErrorOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CallbackErrorOf_0233 begin`);
      const actual: string = callbackErrorOf('Hello World', 350);
      logInfo(`callbackErrorOf(operation="Hello World", ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World error, code is 350');
      logInfo(`${BUNDLE}CallbackErrorOf_0233 end`);
    });
  });
}
