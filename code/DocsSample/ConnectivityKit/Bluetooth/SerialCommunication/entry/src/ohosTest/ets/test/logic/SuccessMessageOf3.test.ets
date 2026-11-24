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

/** Logic checks for successMessageOf (41 cases). */
export default function successMessageOf3Test(): void {
  describe('SuccessMessageOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0193
     * @tc.name      SerialCommunication_SuccessMessageOf_0193
     * @tc.desc      successMessageOf(operation="sppListe", socketId=95) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0193 begin`);
      const actual: string = successMessageOf('sppListe', 95);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0193 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0194
     * @tc.name      SerialCommunication_SuccessMessageOf_0194
     * @tc.desc      successMessageOf(operation="sppListe", socketId=105) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0194 begin`);
      const actual: string = successMessageOf('sppListe', 105);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0194 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0195
     * @tc.name      SerialCommunication_SuccessMessageOf_0195
     * @tc.desc      successMessageOf(operation="sppListe", socketId=110) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0195 begin`);
      const actual: string = successMessageOf('sppListe', 110);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0195 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0196
     * @tc.name      SerialCommunication_SuccessMessageOf_0196
     * @tc.desc      successMessageOf(operation="sppListe", socketId=115) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0196 begin`);
      const actual: string = successMessageOf('sppListe', 115);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0196 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0197
     * @tc.name      SerialCommunication_SuccessMessageOf_0197
     * @tc.desc      successMessageOf(operation="sppListe", socketId=5.18) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0197 begin`);
      const actual: string = successMessageOf('sppListe', 5.18);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0197 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0198
     * @tc.name      SerialCommunication_SuccessMessageOf_0198
     * @tc.desc      successMessageOf(operation="sppListe", socketId=11.29) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0198 begin`);
      const actual: string = successMessageOf('sppListe', 11.29);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0198 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0199
     * @tc.name      SerialCommunication_SuccessMessageOf_0199
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=1) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0199 begin`);
      const actual: string = successMessageOf('sppListenx', 1);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0199 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0200
     * @tc.name      SerialCommunication_SuccessMessageOf_0200
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=100) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0200 begin`);
      const actual: string = successMessageOf('sppListenx', 100);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0200 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0201
     * @tc.name      SerialCommunication_SuccessMessageOf_0201
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=-1) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0201 begin`);
      const actual: string = successMessageOf('sppListenx', -1);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0201 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0202
     * @tc.name      SerialCommunication_SuccessMessageOf_0202
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=2) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0202 begin`);
      const actual: string = successMessageOf('sppListenx', 2);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0202 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0203
     * @tc.name      SerialCommunication_SuccessMessageOf_0203
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=3) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0203 begin`);
      const actual: string = successMessageOf('sppListenx', 3);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0203 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0204
     * @tc.name      SerialCommunication_SuccessMessageOf_0204
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=10) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0204 begin`);
      const actual: string = successMessageOf('sppListenx', 10);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0204 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0205
     * @tc.name      SerialCommunication_SuccessMessageOf_0205
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=5) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0205 begin`);
      const actual: string = successMessageOf('sppListenx', 5);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0205 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0206
     * @tc.name      SerialCommunication_SuccessMessageOf_0206
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=15) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0206 begin`);
      const actual: string = successMessageOf('sppListenx', 15);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0206 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0207
     * @tc.name      SerialCommunication_SuccessMessageOf_0207
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=20) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0207 begin`);
      const actual: string = successMessageOf('sppListenx', 20);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0207 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0208
     * @tc.name      SerialCommunication_SuccessMessageOf_0208
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=25) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0208 begin`);
      const actual: string = successMessageOf('sppListenx', 25);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0208 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0209
     * @tc.name      SerialCommunication_SuccessMessageOf_0209
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=30) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0209 begin`);
      const actual: string = successMessageOf('sppListenx', 30);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0209 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0210
     * @tc.name      SerialCommunication_SuccessMessageOf_0210
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=35) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0210 begin`);
      const actual: string = successMessageOf('sppListenx', 35);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0210 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0211
     * @tc.name      SerialCommunication_SuccessMessageOf_0211
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=40) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0211 begin`);
      const actual: string = successMessageOf('sppListenx', 40);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0211 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0212
     * @tc.name      SerialCommunication_SuccessMessageOf_0212
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=45) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0212 begin`);
      const actual: string = successMessageOf('sppListenx', 45);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0212 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0213
     * @tc.name      SerialCommunication_SuccessMessageOf_0213
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=50) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0213 begin`);
      const actual: string = successMessageOf('sppListenx', 50);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0213 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0214
     * @tc.name      SerialCommunication_SuccessMessageOf_0214
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=55) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0214 begin`);
      const actual: string = successMessageOf('sppListenx', 55);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0214 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0215
     * @tc.name      SerialCommunication_SuccessMessageOf_0215
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=60) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0215 begin`);
      const actual: string = successMessageOf('sppListenx', 60);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0215 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0216
     * @tc.name      SerialCommunication_SuccessMessageOf_0216
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=65) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0216 begin`);
      const actual: string = successMessageOf('sppListenx', 65);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0216 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0217
     * @tc.name      SerialCommunication_SuccessMessageOf_0217
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=70) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0217 begin`);
      const actual: string = successMessageOf('sppListenx', 70);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0217 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0218
     * @tc.name      SerialCommunication_SuccessMessageOf_0218
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=75) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0218 begin`);
      const actual: string = successMessageOf('sppListenx', 75);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0218 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0219
     * @tc.name      SerialCommunication_SuccessMessageOf_0219
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=80) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0219 begin`);
      const actual: string = successMessageOf('sppListenx', 80);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0219 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0220
     * @tc.name      SerialCommunication_SuccessMessageOf_0220
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=85) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0220 begin`);
      const actual: string = successMessageOf('sppListenx', 85);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0220 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0221
     * @tc.name      SerialCommunication_SuccessMessageOf_0221
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=90) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0221 begin`);
      const actual: string = successMessageOf('sppListenx', 90);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0221 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0222
     * @tc.name      SerialCommunication_SuccessMessageOf_0222
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=95) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0222 begin`);
      const actual: string = successMessageOf('sppListenx', 95);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0222 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0223
     * @tc.name      SerialCommunication_SuccessMessageOf_0223
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=105) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0223 begin`);
      const actual: string = successMessageOf('sppListenx', 105);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0223 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0224
     * @tc.name      SerialCommunication_SuccessMessageOf_0224
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=110) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0224 begin`);
      const actual: string = successMessageOf('sppListenx', 110);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0224 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0225
     * @tc.name      SerialCommunication_SuccessMessageOf_0225
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=115) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0225 begin`);
      const actual: string = successMessageOf('sppListenx', 115);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0225 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0226
     * @tc.name      SerialCommunication_SuccessMessageOf_0226
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=5.18) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0226 begin`);
      const actual: string = successMessageOf('sppListenx', 5.18);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0226 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0227
     * @tc.name      SerialCommunication_SuccessMessageOf_0227
     * @tc.desc      successMessageOf(operation="sppListenx", socketId=11.29) returns "sppListenx success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0227 begin`);
      const actual: string = successMessageOf('sppListenx', 11.29);
      logInfo(`successMessageOf(operation="sppListenx", ...: actual=${actual}`);
      expect(actual).assertEqual('sppListenx success');
      logInfo(`${BUNDLE}SuccessMessageOf_0227 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0228
     * @tc.name      SerialCommunication_SuccessMessageOf_0228
     * @tc.desc      successMessageOf(operation="SPPCONNECT", socketId=1) returns "SPPCONNECT success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0228 begin`);
      const actual: string = successMessageOf('SPPCONNECT', 1);
      logInfo(`successMessageOf(operation="SPPCONNECT", ...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT success');
      logInfo(`${BUNDLE}SuccessMessageOf_0228 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0229
     * @tc.name      SerialCommunication_SuccessMessageOf_0229
     * @tc.desc      successMessageOf(operation="SPPCONNECT", socketId=100) returns "SPPCONNECT success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0229 begin`);
      const actual: string = successMessageOf('SPPCONNECT', 100);
      logInfo(`successMessageOf(operation="SPPCONNECT", ...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT success');
      logInfo(`${BUNDLE}SuccessMessageOf_0229 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0230
     * @tc.name      SerialCommunication_SuccessMessageOf_0230
     * @tc.desc      successMessageOf(operation="SPPCONNECT", socketId=-1) returns "SPPCONNECT success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0230 begin`);
      const actual: string = successMessageOf('SPPCONNECT', -1);
      logInfo(`successMessageOf(operation="SPPCONNECT", ...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT success');
      logInfo(`${BUNDLE}SuccessMessageOf_0230 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0231
     * @tc.name      SerialCommunication_SuccessMessageOf_0231
     * @tc.desc      successMessageOf(operation="SPPCONNECT", socketId=2) returns "SPPCONNECT success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0231 begin`);
      const actual: string = successMessageOf('SPPCONNECT', 2);
      logInfo(`successMessageOf(operation="SPPCONNECT", ...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT success');
      logInfo(`${BUNDLE}SuccessMessageOf_0231 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0232
     * @tc.name      SerialCommunication_SuccessMessageOf_0232
     * @tc.desc      successMessageOf(operation="SPPCONNECT", socketId=3) returns "SPPCONNECT success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0232 begin`);
      const actual: string = successMessageOf('SPPCONNECT', 3);
      logInfo(`successMessageOf(operation="SPPCONNECT", ...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT success');
      logInfo(`${BUNDLE}SuccessMessageOf_0232 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0233
     * @tc.name      SerialCommunication_SuccessMessageOf_0233
     * @tc.desc      successMessageOf(operation="SPPCONNECT", socketId=10) returns "SPPCONNECT success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0233 begin`);
      const actual: string = successMessageOf('SPPCONNECT', 10);
      logInfo(`successMessageOf(operation="SPPCONNECT", ...: actual=${actual}`);
      expect(actual).assertEqual('SPPCONNECT success');
      logInfo(`${BUNDLE}SuccessMessageOf_0233 end`);
    });
  });
}
