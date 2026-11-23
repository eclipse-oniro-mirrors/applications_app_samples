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
export default function successMessageOf2Test(): void {
  describe('SuccessMessageOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0097
     * @tc.name      SerialCommunication_SuccessMessageOf_0097
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=50) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0097 begin`);
      const actual: string = successMessageOf('sppAccept', 50);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0097 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0098
     * @tc.name      SerialCommunication_SuccessMessageOf_0098
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=55) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0098 begin`);
      const actual: string = successMessageOf('sppAccept', 55);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0098 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0099
     * @tc.name      SerialCommunication_SuccessMessageOf_0099
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=60) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0099 begin`);
      const actual: string = successMessageOf('sppAccept', 60);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0099 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0100
     * @tc.name      SerialCommunication_SuccessMessageOf_0100
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=65) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0100 begin`);
      const actual: string = successMessageOf('sppAccept', 65);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0100 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0101
     * @tc.name      SerialCommunication_SuccessMessageOf_0101
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=70) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0101 begin`);
      const actual: string = successMessageOf('sppAccept', 70);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0101 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0102
     * @tc.name      SerialCommunication_SuccessMessageOf_0102
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=75) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0102 begin`);
      const actual: string = successMessageOf('sppAccept', 75);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0102 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0103
     * @tc.name      SerialCommunication_SuccessMessageOf_0103
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=80) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0103 begin`);
      const actual: string = successMessageOf('sppAccept', 80);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0103 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0104
     * @tc.name      SerialCommunication_SuccessMessageOf_0104
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=85) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0104 begin`);
      const actual: string = successMessageOf('sppAccept', 85);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0104 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0105
     * @tc.name      SerialCommunication_SuccessMessageOf_0105
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=90) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0105 begin`);
      const actual: string = successMessageOf('sppAccept', 90);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0105 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0106
     * @tc.name      SerialCommunication_SuccessMessageOf_0106
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=95) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0106 begin`);
      const actual: string = successMessageOf('sppAccept', 95);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0106 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0107
     * @tc.name      SerialCommunication_SuccessMessageOf_0107
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=105) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0107 begin`);
      const actual: string = successMessageOf('sppAccept', 105);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0107 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0108
     * @tc.name      SerialCommunication_SuccessMessageOf_0108
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=110) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0108 begin`);
      const actual: string = successMessageOf('sppAccept', 110);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0108 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0109
     * @tc.name      SerialCommunication_SuccessMessageOf_0109
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=115) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0109 begin`);
      const actual: string = successMessageOf('sppAccept', 115);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0109 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0110
     * @tc.name      SerialCommunication_SuccessMessageOf_0110
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=5.18) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0110 begin`);
      const actual: string = successMessageOf('sppAccept', 5.18);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0110 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0111
     * @tc.name      SerialCommunication_SuccessMessageOf_0111
     * @tc.desc      successMessageOf(operation="sppAccept", socketId=11.29) returns "accept the client success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0111 begin`);
      const actual: string = successMessageOf('sppAccept', 11.29);
      logInfo(`successMessageOf(operation="sppAccept", s...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success');
      logInfo(`${BUNDLE}SuccessMessageOf_0111 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0112
     * @tc.name      SerialCommunication_SuccessMessageOf_0112
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=1) returns "accept the client s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0112 begin`);
      const actual: string = successMessageOf('accept the client success', 1);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0112 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0113
     * @tc.name      SerialCommunication_SuccessMessageOf_0113
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=100) returns "accept the client...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0113 begin`);
      const actual: string = successMessageOf('accept the client success', 100);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0113 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0114
     * @tc.name      SerialCommunication_SuccessMessageOf_0114
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=-1) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0114 begin`);
      const actual: string = successMessageOf('accept the client success', -1);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0114 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0115
     * @tc.name      SerialCommunication_SuccessMessageOf_0115
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=2) returns "accept the client s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0115 begin`);
      const actual: string = successMessageOf('accept the client success', 2);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0115 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0116
     * @tc.name      SerialCommunication_SuccessMessageOf_0116
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=3) returns "accept the client s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0116 begin`);
      const actual: string = successMessageOf('accept the client success', 3);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0116 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0117
     * @tc.name      SerialCommunication_SuccessMessageOf_0117
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=10) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0117 begin`);
      const actual: string = successMessageOf('accept the client success', 10);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0117 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0118
     * @tc.name      SerialCommunication_SuccessMessageOf_0118
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=5) returns "accept the client s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0118 begin`);
      const actual: string = successMessageOf('accept the client success', 5);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0118 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0119
     * @tc.name      SerialCommunication_SuccessMessageOf_0119
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=15) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0119 begin`);
      const actual: string = successMessageOf('accept the client success', 15);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0119 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0120
     * @tc.name      SerialCommunication_SuccessMessageOf_0120
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=20) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0120 begin`);
      const actual: string = successMessageOf('accept the client success', 20);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0120 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0121
     * @tc.name      SerialCommunication_SuccessMessageOf_0121
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=25) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0121 begin`);
      const actual: string = successMessageOf('accept the client success', 25);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0121 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0122
     * @tc.name      SerialCommunication_SuccessMessageOf_0122
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=30) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0122 begin`);
      const actual: string = successMessageOf('accept the client success', 30);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0122 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0123
     * @tc.name      SerialCommunication_SuccessMessageOf_0123
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=35) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0123 begin`);
      const actual: string = successMessageOf('accept the client success', 35);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0123 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0124
     * @tc.name      SerialCommunication_SuccessMessageOf_0124
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=40) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0124 begin`);
      const actual: string = successMessageOf('accept the client success', 40);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0124 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0125
     * @tc.name      SerialCommunication_SuccessMessageOf_0125
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=45) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0125 begin`);
      const actual: string = successMessageOf('accept the client success', 45);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0125 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0126
     * @tc.name      SerialCommunication_SuccessMessageOf_0126
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=50) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0126 begin`);
      const actual: string = successMessageOf('accept the client success', 50);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0126 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0127
     * @tc.name      SerialCommunication_SuccessMessageOf_0127
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=55) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0127 begin`);
      const actual: string = successMessageOf('accept the client success', 55);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0127 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0128
     * @tc.name      SerialCommunication_SuccessMessageOf_0128
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=60) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0128 begin`);
      const actual: string = successMessageOf('accept the client success', 60);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0128 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0129
     * @tc.name      SerialCommunication_SuccessMessageOf_0129
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=65) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0129 begin`);
      const actual: string = successMessageOf('accept the client success', 65);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0129 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0130
     * @tc.name      SerialCommunication_SuccessMessageOf_0130
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=70) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0130 begin`);
      const actual: string = successMessageOf('accept the client success', 70);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0130 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0131
     * @tc.name      SerialCommunication_SuccessMessageOf_0131
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=75) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0131 begin`);
      const actual: string = successMessageOf('accept the client success', 75);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0131 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0132
     * @tc.name      SerialCommunication_SuccessMessageOf_0132
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=80) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0132 begin`);
      const actual: string = successMessageOf('accept the client success', 80);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0132 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0133
     * @tc.name      SerialCommunication_SuccessMessageOf_0133
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=85) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0133 begin`);
      const actual: string = successMessageOf('accept the client success', 85);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0133 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0134
     * @tc.name      SerialCommunication_SuccessMessageOf_0134
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=90) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0134 begin`);
      const actual: string = successMessageOf('accept the client success', 90);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0134 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0135
     * @tc.name      SerialCommunication_SuccessMessageOf_0135
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=95) returns "accept the client ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0135 begin`);
      const actual: string = successMessageOf('accept the client success', 95);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0135 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0136
     * @tc.name      SerialCommunication_SuccessMessageOf_0136
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=105) returns "accept the client...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0136 begin`);
      const actual: string = successMessageOf('accept the client success', 105);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0136 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0137
     * @tc.name      SerialCommunication_SuccessMessageOf_0137
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=110) returns "accept the client...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0137 begin`);
      const actual: string = successMessageOf('accept the client success', 110);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0137 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0138
     * @tc.name      SerialCommunication_SuccessMessageOf_0138
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=115) returns "accept the client...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0138 begin`);
      const actual: string = successMessageOf('accept the client success', 115);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0138 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0139
     * @tc.name      SerialCommunication_SuccessMessageOf_0139
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=5.18) returns "accept the clien...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0139 begin`);
      const actual: string = successMessageOf('accept the client success', 5.18);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0139 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0140
     * @tc.name      SerialCommunication_SuccessMessageOf_0140
     * @tc.desc      successMessageOf(operation="accept the client success", socketId=11.29) returns "accept the clie...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SerialCommunication_SuccessMessageOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0140 begin`);
      const actual: string = successMessageOf('accept the client success', 11.29);
      logInfo(`successMessageOf(operation="accept the cl...: actual=${actual}`);
      expect(actual).assertEqual('accept the client success success');
      logInfo(`${BUNDLE}SuccessMessageOf_0140 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0141
     * @tc.name      SerialCommunication_SuccessMessageOf_0141
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=1) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0141 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 1);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0141 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0142
     * @tc.name      SerialCommunication_SuccessMessageOf_0142
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=100) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0142 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 100);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0142 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0143
     * @tc.name      SerialCommunication_SuccessMessageOf_0143
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=-1) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0143 begin`);
      const actual: string = successMessageOf('SPPLISTEN', -1);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0143 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0144
     * @tc.name      SerialCommunication_SuccessMessageOf_0144
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=2) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0144 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 2);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0144 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0145
     * @tc.name      SerialCommunication_SuccessMessageOf_0145
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=3) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0145 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 3);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0145 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0146
     * @tc.name      SerialCommunication_SuccessMessageOf_0146
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=10) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0146 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 10);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0146 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0147
     * @tc.name      SerialCommunication_SuccessMessageOf_0147
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=5) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0147 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 5);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0147 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0148
     * @tc.name      SerialCommunication_SuccessMessageOf_0148
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=15) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0148 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 15);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0148 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0149
     * @tc.name      SerialCommunication_SuccessMessageOf_0149
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=20) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0149 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 20);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0149 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0150
     * @tc.name      SerialCommunication_SuccessMessageOf_0150
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=25) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0150 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 25);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0150 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0151
     * @tc.name      SerialCommunication_SuccessMessageOf_0151
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=30) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0151 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 30);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0151 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0152
     * @tc.name      SerialCommunication_SuccessMessageOf_0152
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=35) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0152 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 35);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0152 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0153
     * @tc.name      SerialCommunication_SuccessMessageOf_0153
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=40) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0153 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 40);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0153 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0154
     * @tc.name      SerialCommunication_SuccessMessageOf_0154
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=45) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0154 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 45);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0154 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0155
     * @tc.name      SerialCommunication_SuccessMessageOf_0155
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=50) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0155 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 50);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0155 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0156
     * @tc.name      SerialCommunication_SuccessMessageOf_0156
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=55) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0156 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 55);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0156 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0157
     * @tc.name      SerialCommunication_SuccessMessageOf_0157
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=60) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0157 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 60);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0157 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0158
     * @tc.name      SerialCommunication_SuccessMessageOf_0158
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=65) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0158 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 65);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0158 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0159
     * @tc.name      SerialCommunication_SuccessMessageOf_0159
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=70) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0159 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 70);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0159 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0160
     * @tc.name      SerialCommunication_SuccessMessageOf_0160
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=75) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0160 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 75);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0160 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0161
     * @tc.name      SerialCommunication_SuccessMessageOf_0161
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=80) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0161 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 80);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0161 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0162
     * @tc.name      SerialCommunication_SuccessMessageOf_0162
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=85) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0162 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 85);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0162 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0163
     * @tc.name      SerialCommunication_SuccessMessageOf_0163
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=90) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0163 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 90);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0163 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0164
     * @tc.name      SerialCommunication_SuccessMessageOf_0164
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=95) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0164 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 95);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0164 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0165
     * @tc.name      SerialCommunication_SuccessMessageOf_0165
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=105) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0165 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 105);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0165 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0166
     * @tc.name      SerialCommunication_SuccessMessageOf_0166
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=110) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0166 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 110);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0166 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0167
     * @tc.name      SerialCommunication_SuccessMessageOf_0167
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=115) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0167 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 115);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0167 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0168
     * @tc.name      SerialCommunication_SuccessMessageOf_0168
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=5.18) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0168 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 5.18);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0168 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0169
     * @tc.name      SerialCommunication_SuccessMessageOf_0169
     * @tc.desc      successMessageOf(operation="SPPLISTEN", socketId=11.29) returns "SPPLISTEN success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0169 begin`);
      const actual: string = successMessageOf('SPPLISTEN', 11.29);
      logInfo(`successMessageOf(operation="SPPLISTEN", s...: actual=${actual}`);
      expect(actual).assertEqual('SPPLISTEN success');
      logInfo(`${BUNDLE}SuccessMessageOf_0169 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0170
     * @tc.name      SerialCommunication_SuccessMessageOf_0170
     * @tc.desc      successMessageOf(operation="sppListe", socketId=1) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0170 begin`);
      const actual: string = successMessageOf('sppListe', 1);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0170 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0171
     * @tc.name      SerialCommunication_SuccessMessageOf_0171
     * @tc.desc      successMessageOf(operation="sppListe", socketId=100) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0171 begin`);
      const actual: string = successMessageOf('sppListe', 100);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0171 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0172
     * @tc.name      SerialCommunication_SuccessMessageOf_0172
     * @tc.desc      successMessageOf(operation="sppListe", socketId=-1) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0172 begin`);
      const actual: string = successMessageOf('sppListe', -1);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0172 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0173
     * @tc.name      SerialCommunication_SuccessMessageOf_0173
     * @tc.desc      successMessageOf(operation="sppListe", socketId=2) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0173 begin`);
      const actual: string = successMessageOf('sppListe', 2);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0173 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0174
     * @tc.name      SerialCommunication_SuccessMessageOf_0174
     * @tc.desc      successMessageOf(operation="sppListe", socketId=3) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0174 begin`);
      const actual: string = successMessageOf('sppListe', 3);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0174 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0175
     * @tc.name      SerialCommunication_SuccessMessageOf_0175
     * @tc.desc      successMessageOf(operation="sppListe", socketId=10) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0175 begin`);
      const actual: string = successMessageOf('sppListe', 10);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0175 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0176
     * @tc.name      SerialCommunication_SuccessMessageOf_0176
     * @tc.desc      successMessageOf(operation="sppListe", socketId=5) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0176 begin`);
      const actual: string = successMessageOf('sppListe', 5);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0176 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0177
     * @tc.name      SerialCommunication_SuccessMessageOf_0177
     * @tc.desc      successMessageOf(operation="sppListe", socketId=15) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0177 begin`);
      const actual: string = successMessageOf('sppListe', 15);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0177 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0178
     * @tc.name      SerialCommunication_SuccessMessageOf_0178
     * @tc.desc      successMessageOf(operation="sppListe", socketId=20) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0178 begin`);
      const actual: string = successMessageOf('sppListe', 20);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0178 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0179
     * @tc.name      SerialCommunication_SuccessMessageOf_0179
     * @tc.desc      successMessageOf(operation="sppListe", socketId=25) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0179 begin`);
      const actual: string = successMessageOf('sppListe', 25);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0179 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0180
     * @tc.name      SerialCommunication_SuccessMessageOf_0180
     * @tc.desc      successMessageOf(operation="sppListe", socketId=30) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0180 begin`);
      const actual: string = successMessageOf('sppListe', 30);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0180 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0181
     * @tc.name      SerialCommunication_SuccessMessageOf_0181
     * @tc.desc      successMessageOf(operation="sppListe", socketId=35) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0181 begin`);
      const actual: string = successMessageOf('sppListe', 35);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0181 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0182
     * @tc.name      SerialCommunication_SuccessMessageOf_0182
     * @tc.desc      successMessageOf(operation="sppListe", socketId=40) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0182 begin`);
      const actual: string = successMessageOf('sppListe', 40);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0182 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0183
     * @tc.name      SerialCommunication_SuccessMessageOf_0183
     * @tc.desc      successMessageOf(operation="sppListe", socketId=45) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0183 begin`);
      const actual: string = successMessageOf('sppListe', 45);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0183 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0184
     * @tc.name      SerialCommunication_SuccessMessageOf_0184
     * @tc.desc      successMessageOf(operation="sppListe", socketId=50) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0184 begin`);
      const actual: string = successMessageOf('sppListe', 50);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0184 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0185
     * @tc.name      SerialCommunication_SuccessMessageOf_0185
     * @tc.desc      successMessageOf(operation="sppListe", socketId=55) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0185 begin`);
      const actual: string = successMessageOf('sppListe', 55);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0185 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0186
     * @tc.name      SerialCommunication_SuccessMessageOf_0186
     * @tc.desc      successMessageOf(operation="sppListe", socketId=60) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0186 begin`);
      const actual: string = successMessageOf('sppListe', 60);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0186 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0187
     * @tc.name      SerialCommunication_SuccessMessageOf_0187
     * @tc.desc      successMessageOf(operation="sppListe", socketId=65) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0187 begin`);
      const actual: string = successMessageOf('sppListe', 65);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0187 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0188
     * @tc.name      SerialCommunication_SuccessMessageOf_0188
     * @tc.desc      successMessageOf(operation="sppListe", socketId=70) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0188 begin`);
      const actual: string = successMessageOf('sppListe', 70);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0188 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0189
     * @tc.name      SerialCommunication_SuccessMessageOf_0189
     * @tc.desc      successMessageOf(operation="sppListe", socketId=75) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0189 begin`);
      const actual: string = successMessageOf('sppListe', 75);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0189 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0190
     * @tc.name      SerialCommunication_SuccessMessageOf_0190
     * @tc.desc      successMessageOf(operation="sppListe", socketId=80) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0190 begin`);
      const actual: string = successMessageOf('sppListe', 80);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0190 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0191
     * @tc.name      SerialCommunication_SuccessMessageOf_0191
     * @tc.desc      successMessageOf(operation="sppListe", socketId=85) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0191 begin`);
      const actual: string = successMessageOf('sppListe', 85);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0191 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SUCCESS_MESSAGE_OF_0192
     * @tc.name      SerialCommunication_SuccessMessageOf_0192
     * @tc.desc      successMessageOf(operation="sppListe", socketId=90) returns "sppListe success"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SuccessMessageOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SuccessMessageOf_0192 begin`);
      const actual: string = successMessageOf('sppListe', 90);
      logInfo(`successMessageOf(operation="sppListe", so...: actual=${actual}`);
      expect(actual).assertEqual('sppListe success');
      logInfo(`${BUNDLE}SuccessMessageOf_0192 end`);
    });
  });
}
