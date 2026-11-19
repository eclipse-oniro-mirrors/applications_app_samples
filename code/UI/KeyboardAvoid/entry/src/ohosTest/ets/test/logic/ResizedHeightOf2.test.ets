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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resizedHeightOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for resizedHeightOf (96 cases). */
export default function resizedHeightOf2Test(): void {
  describe('ResizedHeightOf2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0097
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0097
     * @tc.desc      resizedHeightOf(windowHeightVp=192, keyboardHeightVp=10) returns 182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0097 begin`);
      const actual: number = resizedHeightOf(192, 10);
      logInfo(`resizedHeightOf(windowHeightVp=192, keybo...: actual=${actual}`);
      expect(actual).assertEqual(182);
      logInfo(`${BUNDLE}ResizedHeightOf_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0098
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0098
     * @tc.desc      resizedHeightOf(windowHeightVp=288, keyboardHeightVp=1) returns 287
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0098 begin`);
      const actual: number = resizedHeightOf(288, 1);
      logInfo(`resizedHeightOf(windowHeightVp=288, keybo...: actual=${actual}`);
      expect(actual).assertEqual(287);
      logInfo(`${BUNDLE}ResizedHeightOf_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0099
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0099
     * @tc.desc      resizedHeightOf(windowHeightVp=288, keyboardHeightVp=-1) returns 289
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0099 begin`);
      const actual: number = resizedHeightOf(288, -1);
      logInfo(`resizedHeightOf(windowHeightVp=288, keybo...: actual=${actual}`);
      expect(actual).assertEqual(289);
      logInfo(`${BUNDLE}ResizedHeightOf_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0100
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0100
     * @tc.desc      resizedHeightOf(windowHeightVp=288, keyboardHeightVp=100) returns 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0100 begin`);
      const actual: number = resizedHeightOf(288, 100);
      logInfo(`resizedHeightOf(windowHeightVp=288, keybo...: actual=${actual}`);
      expect(actual).assertEqual(188);
      logInfo(`${BUNDLE}ResizedHeightOf_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0101
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0101
     * @tc.desc      resizedHeightOf(windowHeightVp=288, keyboardHeightVp=2) returns 286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0101 begin`);
      const actual: number = resizedHeightOf(288, 2);
      logInfo(`resizedHeightOf(windowHeightVp=288, keybo...: actual=${actual}`);
      expect(actual).assertEqual(286);
      logInfo(`${BUNDLE}ResizedHeightOf_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0102
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0102
     * @tc.desc      resizedHeightOf(windowHeightVp=288, keyboardHeightVp=3) returns 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0102 begin`);
      const actual: number = resizedHeightOf(288, 3);
      logInfo(`resizedHeightOf(windowHeightVp=288, keybo...: actual=${actual}`);
      expect(actual).assertEqual(285);
      logInfo(`${BUNDLE}ResizedHeightOf_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0103
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0103
     * @tc.desc      resizedHeightOf(windowHeightVp=288, keyboardHeightVp=10) returns 278
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0103 begin`);
      const actual: number = resizedHeightOf(288, 10);
      logInfo(`resizedHeightOf(windowHeightVp=288, keybo...: actual=${actual}`);
      expect(actual).assertEqual(278);
      logInfo(`${BUNDLE}ResizedHeightOf_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0104
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0104
     * @tc.desc      resizedHeightOf(windowHeightVp=384, keyboardHeightVp=1) returns 383
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0104 begin`);
      const actual: number = resizedHeightOf(384, 1);
      logInfo(`resizedHeightOf(windowHeightVp=384, keybo...: actual=${actual}`);
      expect(actual).assertEqual(383);
      logInfo(`${BUNDLE}ResizedHeightOf_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0105
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0105
     * @tc.desc      resizedHeightOf(windowHeightVp=384, keyboardHeightVp=-1) returns 385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0105 begin`);
      const actual: number = resizedHeightOf(384, -1);
      logInfo(`resizedHeightOf(windowHeightVp=384, keybo...: actual=${actual}`);
      expect(actual).assertEqual(385);
      logInfo(`${BUNDLE}ResizedHeightOf_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0106
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0106
     * @tc.desc      resizedHeightOf(windowHeightVp=384, keyboardHeightVp=100) returns 284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0106 begin`);
      const actual: number = resizedHeightOf(384, 100);
      logInfo(`resizedHeightOf(windowHeightVp=384, keybo...: actual=${actual}`);
      expect(actual).assertEqual(284);
      logInfo(`${BUNDLE}ResizedHeightOf_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0107
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0107
     * @tc.desc      resizedHeightOf(windowHeightVp=384, keyboardHeightVp=2) returns 382
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0107 begin`);
      const actual: number = resizedHeightOf(384, 2);
      logInfo(`resizedHeightOf(windowHeightVp=384, keybo...: actual=${actual}`);
      expect(actual).assertEqual(382);
      logInfo(`${BUNDLE}ResizedHeightOf_0107 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0108
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0108
     * @tc.desc      resizedHeightOf(windowHeightVp=384, keyboardHeightVp=3) returns 381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0108 begin`);
      const actual: number = resizedHeightOf(384, 3);
      logInfo(`resizedHeightOf(windowHeightVp=384, keybo...: actual=${actual}`);
      expect(actual).assertEqual(381);
      logInfo(`${BUNDLE}ResizedHeightOf_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0109
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0109
     * @tc.desc      resizedHeightOf(windowHeightVp=384, keyboardHeightVp=10) returns 374
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0109 begin`);
      const actual: number = resizedHeightOf(384, 10);
      logInfo(`resizedHeightOf(windowHeightVp=384, keybo...: actual=${actual}`);
      expect(actual).assertEqual(374);
      logInfo(`${BUNDLE}ResizedHeightOf_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0110
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0110
     * @tc.desc      resizedHeightOf(windowHeightVp=480, keyboardHeightVp=1) returns 479
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0110 begin`);
      const actual: number = resizedHeightOf(480, 1);
      logInfo(`resizedHeightOf(windowHeightVp=480, keybo...: actual=${actual}`);
      expect(actual).assertEqual(479);
      logInfo(`${BUNDLE}ResizedHeightOf_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0111
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0111
     * @tc.desc      resizedHeightOf(windowHeightVp=480, keyboardHeightVp=-1) returns 481
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0111 begin`);
      const actual: number = resizedHeightOf(480, -1);
      logInfo(`resizedHeightOf(windowHeightVp=480, keybo...: actual=${actual}`);
      expect(actual).assertEqual(481);
      logInfo(`${BUNDLE}ResizedHeightOf_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0112
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0112
     * @tc.desc      resizedHeightOf(windowHeightVp=480, keyboardHeightVp=100) returns 380
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0112 begin`);
      const actual: number = resizedHeightOf(480, 100);
      logInfo(`resizedHeightOf(windowHeightVp=480, keybo...: actual=${actual}`);
      expect(actual).assertEqual(380);
      logInfo(`${BUNDLE}ResizedHeightOf_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0113
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0113
     * @tc.desc      resizedHeightOf(windowHeightVp=480, keyboardHeightVp=2) returns 478
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0113 begin`);
      const actual: number = resizedHeightOf(480, 2);
      logInfo(`resizedHeightOf(windowHeightVp=480, keybo...: actual=${actual}`);
      expect(actual).assertEqual(478);
      logInfo(`${BUNDLE}ResizedHeightOf_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0114
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0114
     * @tc.desc      resizedHeightOf(windowHeightVp=480, keyboardHeightVp=3) returns 477
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0114 begin`);
      const actual: number = resizedHeightOf(480, 3);
      logInfo(`resizedHeightOf(windowHeightVp=480, keybo...: actual=${actual}`);
      expect(actual).assertEqual(477);
      logInfo(`${BUNDLE}ResizedHeightOf_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0115
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0115
     * @tc.desc      resizedHeightOf(windowHeightVp=480, keyboardHeightVp=10) returns 470
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0115 begin`);
      const actual: number = resizedHeightOf(480, 10);
      logInfo(`resizedHeightOf(windowHeightVp=480, keybo...: actual=${actual}`);
      expect(actual).assertEqual(470);
      logInfo(`${BUNDLE}ResizedHeightOf_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0116
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0116
     * @tc.desc      resizedHeightOf(windowHeightVp=576, keyboardHeightVp=1) returns 575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0116 begin`);
      const actual: number = resizedHeightOf(576, 1);
      logInfo(`resizedHeightOf(windowHeightVp=576, keybo...: actual=${actual}`);
      expect(actual).assertEqual(575);
      logInfo(`${BUNDLE}ResizedHeightOf_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0117
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0117
     * @tc.desc      resizedHeightOf(windowHeightVp=576, keyboardHeightVp=-1) returns 577
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0117 begin`);
      const actual: number = resizedHeightOf(576, -1);
      logInfo(`resizedHeightOf(windowHeightVp=576, keybo...: actual=${actual}`);
      expect(actual).assertEqual(577);
      logInfo(`${BUNDLE}ResizedHeightOf_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0118
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0118
     * @tc.desc      resizedHeightOf(windowHeightVp=576, keyboardHeightVp=100) returns 476
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0118 begin`);
      const actual: number = resizedHeightOf(576, 100);
      logInfo(`resizedHeightOf(windowHeightVp=576, keybo...: actual=${actual}`);
      expect(actual).assertEqual(476);
      logInfo(`${BUNDLE}ResizedHeightOf_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0119
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0119
     * @tc.desc      resizedHeightOf(windowHeightVp=576, keyboardHeightVp=2) returns 574
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0119 begin`);
      const actual: number = resizedHeightOf(576, 2);
      logInfo(`resizedHeightOf(windowHeightVp=576, keybo...: actual=${actual}`);
      expect(actual).assertEqual(574);
      logInfo(`${BUNDLE}ResizedHeightOf_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0120
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0120
     * @tc.desc      resizedHeightOf(windowHeightVp=576, keyboardHeightVp=3) returns 573
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0120 begin`);
      const actual: number = resizedHeightOf(576, 3);
      logInfo(`resizedHeightOf(windowHeightVp=576, keybo...: actual=${actual}`);
      expect(actual).assertEqual(573);
      logInfo(`${BUNDLE}ResizedHeightOf_0120 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0121
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0121
     * @tc.desc      resizedHeightOf(windowHeightVp=576, keyboardHeightVp=10) returns 566
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0121 begin`);
      const actual: number = resizedHeightOf(576, 10);
      logInfo(`resizedHeightOf(windowHeightVp=576, keybo...: actual=${actual}`);
      expect(actual).assertEqual(566);
      logInfo(`${BUNDLE}ResizedHeightOf_0121 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0122
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0122
     * @tc.desc      resizedHeightOf(windowHeightVp=672, keyboardHeightVp=1) returns 671
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0122 begin`);
      const actual: number = resizedHeightOf(672, 1);
      logInfo(`resizedHeightOf(windowHeightVp=672, keybo...: actual=${actual}`);
      expect(actual).assertEqual(671);
      logInfo(`${BUNDLE}ResizedHeightOf_0122 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0123
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0123
     * @tc.desc      resizedHeightOf(windowHeightVp=672, keyboardHeightVp=-1) returns 673
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0123 begin`);
      const actual: number = resizedHeightOf(672, -1);
      logInfo(`resizedHeightOf(windowHeightVp=672, keybo...: actual=${actual}`);
      expect(actual).assertEqual(673);
      logInfo(`${BUNDLE}ResizedHeightOf_0123 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0124
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0124
     * @tc.desc      resizedHeightOf(windowHeightVp=672, keyboardHeightVp=100) returns 572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0124 begin`);
      const actual: number = resizedHeightOf(672, 100);
      logInfo(`resizedHeightOf(windowHeightVp=672, keybo...: actual=${actual}`);
      expect(actual).assertEqual(572);
      logInfo(`${BUNDLE}ResizedHeightOf_0124 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0125
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0125
     * @tc.desc      resizedHeightOf(windowHeightVp=672, keyboardHeightVp=2) returns 670
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0125 begin`);
      const actual: number = resizedHeightOf(672, 2);
      logInfo(`resizedHeightOf(windowHeightVp=672, keybo...: actual=${actual}`);
      expect(actual).assertEqual(670);
      logInfo(`${BUNDLE}ResizedHeightOf_0125 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0126
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0126
     * @tc.desc      resizedHeightOf(windowHeightVp=672, keyboardHeightVp=3) returns 669
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0126 begin`);
      const actual: number = resizedHeightOf(672, 3);
      logInfo(`resizedHeightOf(windowHeightVp=672, keybo...: actual=${actual}`);
      expect(actual).assertEqual(669);
      logInfo(`${BUNDLE}ResizedHeightOf_0126 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0127
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0127
     * @tc.desc      resizedHeightOf(windowHeightVp=672, keyboardHeightVp=10) returns 662
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0127 begin`);
      const actual: number = resizedHeightOf(672, 10);
      logInfo(`resizedHeightOf(windowHeightVp=672, keybo...: actual=${actual}`);
      expect(actual).assertEqual(662);
      logInfo(`${BUNDLE}ResizedHeightOf_0127 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0128
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0128
     * @tc.desc      resizedHeightOf(windowHeightVp=768, keyboardHeightVp=1) returns 767
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0128 begin`);
      const actual: number = resizedHeightOf(768, 1);
      logInfo(`resizedHeightOf(windowHeightVp=768, keybo...: actual=${actual}`);
      expect(actual).assertEqual(767);
      logInfo(`${BUNDLE}ResizedHeightOf_0128 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0129
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0129
     * @tc.desc      resizedHeightOf(windowHeightVp=768, keyboardHeightVp=-1) returns 769
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0129 begin`);
      const actual: number = resizedHeightOf(768, -1);
      logInfo(`resizedHeightOf(windowHeightVp=768, keybo...: actual=${actual}`);
      expect(actual).assertEqual(769);
      logInfo(`${BUNDLE}ResizedHeightOf_0129 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0130
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0130
     * @tc.desc      resizedHeightOf(windowHeightVp=768, keyboardHeightVp=100) returns 668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0130 begin`);
      const actual: number = resizedHeightOf(768, 100);
      logInfo(`resizedHeightOf(windowHeightVp=768, keybo...: actual=${actual}`);
      expect(actual).assertEqual(668);
      logInfo(`${BUNDLE}ResizedHeightOf_0130 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0131
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0131
     * @tc.desc      resizedHeightOf(windowHeightVp=768, keyboardHeightVp=2) returns 766
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0131 begin`);
      const actual: number = resizedHeightOf(768, 2);
      logInfo(`resizedHeightOf(windowHeightVp=768, keybo...: actual=${actual}`);
      expect(actual).assertEqual(766);
      logInfo(`${BUNDLE}ResizedHeightOf_0131 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0132
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0132
     * @tc.desc      resizedHeightOf(windowHeightVp=768, keyboardHeightVp=3) returns 765
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0132 begin`);
      const actual: number = resizedHeightOf(768, 3);
      logInfo(`resizedHeightOf(windowHeightVp=768, keybo...: actual=${actual}`);
      expect(actual).assertEqual(765);
      logInfo(`${BUNDLE}ResizedHeightOf_0132 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0133
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0133
     * @tc.desc      resizedHeightOf(windowHeightVp=768, keyboardHeightVp=10) returns 758
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0133 begin`);
      const actual: number = resizedHeightOf(768, 10);
      logInfo(`resizedHeightOf(windowHeightVp=768, keybo...: actual=${actual}`);
      expect(actual).assertEqual(758);
      logInfo(`${BUNDLE}ResizedHeightOf_0133 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0134
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0134
     * @tc.desc      resizedHeightOf(windowHeightVp=864, keyboardHeightVp=1) returns 863
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0134 begin`);
      const actual: number = resizedHeightOf(864, 1);
      logInfo(`resizedHeightOf(windowHeightVp=864, keybo...: actual=${actual}`);
      expect(actual).assertEqual(863);
      logInfo(`${BUNDLE}ResizedHeightOf_0134 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0135
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0135
     * @tc.desc      resizedHeightOf(windowHeightVp=864, keyboardHeightVp=-1) returns 865
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0135 begin`);
      const actual: number = resizedHeightOf(864, -1);
      logInfo(`resizedHeightOf(windowHeightVp=864, keybo...: actual=${actual}`);
      expect(actual).assertEqual(865);
      logInfo(`${BUNDLE}ResizedHeightOf_0135 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0136
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0136
     * @tc.desc      resizedHeightOf(windowHeightVp=864, keyboardHeightVp=100) returns 764
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0136 begin`);
      const actual: number = resizedHeightOf(864, 100);
      logInfo(`resizedHeightOf(windowHeightVp=864, keybo...: actual=${actual}`);
      expect(actual).assertEqual(764);
      logInfo(`${BUNDLE}ResizedHeightOf_0136 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0137
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0137
     * @tc.desc      resizedHeightOf(windowHeightVp=864, keyboardHeightVp=2) returns 862
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0137 begin`);
      const actual: number = resizedHeightOf(864, 2);
      logInfo(`resizedHeightOf(windowHeightVp=864, keybo...: actual=${actual}`);
      expect(actual).assertEqual(862);
      logInfo(`${BUNDLE}ResizedHeightOf_0137 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0138
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0138
     * @tc.desc      resizedHeightOf(windowHeightVp=864, keyboardHeightVp=3) returns 861
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0138 begin`);
      const actual: number = resizedHeightOf(864, 3);
      logInfo(`resizedHeightOf(windowHeightVp=864, keybo...: actual=${actual}`);
      expect(actual).assertEqual(861);
      logInfo(`${BUNDLE}ResizedHeightOf_0138 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0139
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0139
     * @tc.desc      resizedHeightOf(windowHeightVp=864, keyboardHeightVp=10) returns 854
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0139 begin`);
      const actual: number = resizedHeightOf(864, 10);
      logInfo(`resizedHeightOf(windowHeightVp=864, keybo...: actual=${actual}`);
      expect(actual).assertEqual(854);
      logInfo(`${BUNDLE}ResizedHeightOf_0139 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0140
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0140
     * @tc.desc      resizedHeightOf(windowHeightVp=960, keyboardHeightVp=1) returns 959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0140 begin`);
      const actual: number = resizedHeightOf(960, 1);
      logInfo(`resizedHeightOf(windowHeightVp=960, keybo...: actual=${actual}`);
      expect(actual).assertEqual(959);
      logInfo(`${BUNDLE}ResizedHeightOf_0140 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0141
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0141
     * @tc.desc      resizedHeightOf(windowHeightVp=960, keyboardHeightVp=-1) returns 961
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0141 begin`);
      const actual: number = resizedHeightOf(960, -1);
      logInfo(`resizedHeightOf(windowHeightVp=960, keybo...: actual=${actual}`);
      expect(actual).assertEqual(961);
      logInfo(`${BUNDLE}ResizedHeightOf_0141 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0142
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0142
     * @tc.desc      resizedHeightOf(windowHeightVp=960, keyboardHeightVp=100) returns 860
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0142 begin`);
      const actual: number = resizedHeightOf(960, 100);
      logInfo(`resizedHeightOf(windowHeightVp=960, keybo...: actual=${actual}`);
      expect(actual).assertEqual(860);
      logInfo(`${BUNDLE}ResizedHeightOf_0142 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0143
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0143
     * @tc.desc      resizedHeightOf(windowHeightVp=960, keyboardHeightVp=2) returns 958
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0143 begin`);
      const actual: number = resizedHeightOf(960, 2);
      logInfo(`resizedHeightOf(windowHeightVp=960, keybo...: actual=${actual}`);
      expect(actual).assertEqual(958);
      logInfo(`${BUNDLE}ResizedHeightOf_0143 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0144
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0144
     * @tc.desc      resizedHeightOf(windowHeightVp=960, keyboardHeightVp=3) returns 957
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0144 begin`);
      const actual: number = resizedHeightOf(960, 3);
      logInfo(`resizedHeightOf(windowHeightVp=960, keybo...: actual=${actual}`);
      expect(actual).assertEqual(957);
      logInfo(`${BUNDLE}ResizedHeightOf_0144 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0145
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0145
     * @tc.desc      resizedHeightOf(windowHeightVp=960, keyboardHeightVp=10) returns 950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0145 begin`);
      const actual: number = resizedHeightOf(960, 10);
      logInfo(`resizedHeightOf(windowHeightVp=960, keybo...: actual=${actual}`);
      expect(actual).assertEqual(950);
      logInfo(`${BUNDLE}ResizedHeightOf_0145 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0146
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0146
     * @tc.desc      resizedHeightOf(windowHeightVp=1056, keyboardHeightVp=1) returns 1055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0146 begin`);
      const actual: number = resizedHeightOf(1056, 1);
      logInfo(`resizedHeightOf(windowHeightVp=1056, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1055);
      logInfo(`${BUNDLE}ResizedHeightOf_0146 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0147
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0147
     * @tc.desc      resizedHeightOf(windowHeightVp=1056, keyboardHeightVp=-1) returns 1057
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0147 begin`);
      const actual: number = resizedHeightOf(1056, -1);
      logInfo(`resizedHeightOf(windowHeightVp=1056, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1057);
      logInfo(`${BUNDLE}ResizedHeightOf_0147 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0148
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0148
     * @tc.desc      resizedHeightOf(windowHeightVp=1056, keyboardHeightVp=100) returns 956
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0148 begin`);
      const actual: number = resizedHeightOf(1056, 100);
      logInfo(`resizedHeightOf(windowHeightVp=1056, keyb...: actual=${actual}`);
      expect(actual).assertEqual(956);
      logInfo(`${BUNDLE}ResizedHeightOf_0148 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0149
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0149
     * @tc.desc      resizedHeightOf(windowHeightVp=1056, keyboardHeightVp=2) returns 1054
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0149 begin`);
      const actual: number = resizedHeightOf(1056, 2);
      logInfo(`resizedHeightOf(windowHeightVp=1056, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1054);
      logInfo(`${BUNDLE}ResizedHeightOf_0149 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0150
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0150
     * @tc.desc      resizedHeightOf(windowHeightVp=1056, keyboardHeightVp=3) returns 1053
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0150 begin`);
      const actual: number = resizedHeightOf(1056, 3);
      logInfo(`resizedHeightOf(windowHeightVp=1056, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1053);
      logInfo(`${BUNDLE}ResizedHeightOf_0150 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0151
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0151
     * @tc.desc      resizedHeightOf(windowHeightVp=1056, keyboardHeightVp=10) returns 1046
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0151 begin`);
      const actual: number = resizedHeightOf(1056, 10);
      logInfo(`resizedHeightOf(windowHeightVp=1056, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1046);
      logInfo(`${BUNDLE}ResizedHeightOf_0151 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0152
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0152
     * @tc.desc      resizedHeightOf(windowHeightVp=1152, keyboardHeightVp=1) returns 1151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0152 begin`);
      const actual: number = resizedHeightOf(1152, 1);
      logInfo(`resizedHeightOf(windowHeightVp=1152, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1151);
      logInfo(`${BUNDLE}ResizedHeightOf_0152 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0153
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0153
     * @tc.desc      resizedHeightOf(windowHeightVp=1152, keyboardHeightVp=-1) returns 1153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0153 begin`);
      const actual: number = resizedHeightOf(1152, -1);
      logInfo(`resizedHeightOf(windowHeightVp=1152, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1153);
      logInfo(`${BUNDLE}ResizedHeightOf_0153 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0154
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0154
     * @tc.desc      resizedHeightOf(windowHeightVp=1152, keyboardHeightVp=100) returns 1052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0154 begin`);
      const actual: number = resizedHeightOf(1152, 100);
      logInfo(`resizedHeightOf(windowHeightVp=1152, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1052);
      logInfo(`${BUNDLE}ResizedHeightOf_0154 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0155
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0155
     * @tc.desc      resizedHeightOf(windowHeightVp=1152, keyboardHeightVp=2) returns 1150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0155 begin`);
      const actual: number = resizedHeightOf(1152, 2);
      logInfo(`resizedHeightOf(windowHeightVp=1152, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1150);
      logInfo(`${BUNDLE}ResizedHeightOf_0155 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0156
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0156
     * @tc.desc      resizedHeightOf(windowHeightVp=1152, keyboardHeightVp=3) returns 1149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0156 begin`);
      const actual: number = resizedHeightOf(1152, 3);
      logInfo(`resizedHeightOf(windowHeightVp=1152, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1149);
      logInfo(`${BUNDLE}ResizedHeightOf_0156 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0157
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0157
     * @tc.desc      resizedHeightOf(windowHeightVp=1152, keyboardHeightVp=10) returns 1142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0157 begin`);
      const actual: number = resizedHeightOf(1152, 10);
      logInfo(`resizedHeightOf(windowHeightVp=1152, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1142);
      logInfo(`${BUNDLE}ResizedHeightOf_0157 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0158
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0158
     * @tc.desc      resizedHeightOf(windowHeightVp=1248, keyboardHeightVp=1) returns 1247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0158 begin`);
      const actual: number = resizedHeightOf(1248, 1);
      logInfo(`resizedHeightOf(windowHeightVp=1248, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1247);
      logInfo(`${BUNDLE}ResizedHeightOf_0158 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0159
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0159
     * @tc.desc      resizedHeightOf(windowHeightVp=1248, keyboardHeightVp=-1) returns 1249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0159 begin`);
      const actual: number = resizedHeightOf(1248, -1);
      logInfo(`resizedHeightOf(windowHeightVp=1248, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1249);
      logInfo(`${BUNDLE}ResizedHeightOf_0159 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0160
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0160
     * @tc.desc      resizedHeightOf(windowHeightVp=1248, keyboardHeightVp=100) returns 1148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0160 begin`);
      const actual: number = resizedHeightOf(1248, 100);
      logInfo(`resizedHeightOf(windowHeightVp=1248, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1148);
      logInfo(`${BUNDLE}ResizedHeightOf_0160 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0161
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0161
     * @tc.desc      resizedHeightOf(windowHeightVp=1248, keyboardHeightVp=2) returns 1246
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0161 begin`);
      const actual: number = resizedHeightOf(1248, 2);
      logInfo(`resizedHeightOf(windowHeightVp=1248, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1246);
      logInfo(`${BUNDLE}ResizedHeightOf_0161 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0162
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0162
     * @tc.desc      resizedHeightOf(windowHeightVp=1248, keyboardHeightVp=3) returns 1245
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0162 begin`);
      const actual: number = resizedHeightOf(1248, 3);
      logInfo(`resizedHeightOf(windowHeightVp=1248, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1245);
      logInfo(`${BUNDLE}ResizedHeightOf_0162 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0163
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0163
     * @tc.desc      resizedHeightOf(windowHeightVp=1248, keyboardHeightVp=10) returns 1238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0163 begin`);
      const actual: number = resizedHeightOf(1248, 10);
      logInfo(`resizedHeightOf(windowHeightVp=1248, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1238);
      logInfo(`${BUNDLE}ResizedHeightOf_0163 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0164
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0164
     * @tc.desc      resizedHeightOf(windowHeightVp=1344, keyboardHeightVp=1) returns 1343
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0164 begin`);
      const actual: number = resizedHeightOf(1344, 1);
      logInfo(`resizedHeightOf(windowHeightVp=1344, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1343);
      logInfo(`${BUNDLE}ResizedHeightOf_0164 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0165
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0165
     * @tc.desc      resizedHeightOf(windowHeightVp=1344, keyboardHeightVp=-1) returns 1345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0165 begin`);
      const actual: number = resizedHeightOf(1344, -1);
      logInfo(`resizedHeightOf(windowHeightVp=1344, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1345);
      logInfo(`${BUNDLE}ResizedHeightOf_0165 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0166
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0166
     * @tc.desc      resizedHeightOf(windowHeightVp=1344, keyboardHeightVp=100) returns 1244
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0166 begin`);
      const actual: number = resizedHeightOf(1344, 100);
      logInfo(`resizedHeightOf(windowHeightVp=1344, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1244);
      logInfo(`${BUNDLE}ResizedHeightOf_0166 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0167
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0167
     * @tc.desc      resizedHeightOf(windowHeightVp=1344, keyboardHeightVp=2) returns 1342
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0167 begin`);
      const actual: number = resizedHeightOf(1344, 2);
      logInfo(`resizedHeightOf(windowHeightVp=1344, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1342);
      logInfo(`${BUNDLE}ResizedHeightOf_0167 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0168
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0168
     * @tc.desc      resizedHeightOf(windowHeightVp=1344, keyboardHeightVp=3) returns 1341
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0168 begin`);
      const actual: number = resizedHeightOf(1344, 3);
      logInfo(`resizedHeightOf(windowHeightVp=1344, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1341);
      logInfo(`${BUNDLE}ResizedHeightOf_0168 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0169
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0169
     * @tc.desc      resizedHeightOf(windowHeightVp=1344, keyboardHeightVp=10) returns 1334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0169 begin`);
      const actual: number = resizedHeightOf(1344, 10);
      logInfo(`resizedHeightOf(windowHeightVp=1344, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1334);
      logInfo(`${BUNDLE}ResizedHeightOf_0169 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0170
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0170
     * @tc.desc      resizedHeightOf(windowHeightVp=1440, keyboardHeightVp=1) returns 1439
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0170 begin`);
      const actual: number = resizedHeightOf(1440, 1);
      logInfo(`resizedHeightOf(windowHeightVp=1440, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1439);
      logInfo(`${BUNDLE}ResizedHeightOf_0170 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0171
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0171
     * @tc.desc      resizedHeightOf(windowHeightVp=1440, keyboardHeightVp=-1) returns 1441
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0171 begin`);
      const actual: number = resizedHeightOf(1440, -1);
      logInfo(`resizedHeightOf(windowHeightVp=1440, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1441);
      logInfo(`${BUNDLE}ResizedHeightOf_0171 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0172
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0172
     * @tc.desc      resizedHeightOf(windowHeightVp=1440, keyboardHeightVp=100) returns 1340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0172 begin`);
      const actual: number = resizedHeightOf(1440, 100);
      logInfo(`resizedHeightOf(windowHeightVp=1440, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1340);
      logInfo(`${BUNDLE}ResizedHeightOf_0172 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0173
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0173
     * @tc.desc      resizedHeightOf(windowHeightVp=1440, keyboardHeightVp=2) returns 1438
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0173 begin`);
      const actual: number = resizedHeightOf(1440, 2);
      logInfo(`resizedHeightOf(windowHeightVp=1440, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1438);
      logInfo(`${BUNDLE}ResizedHeightOf_0173 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0174
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0174
     * @tc.desc      resizedHeightOf(windowHeightVp=1440, keyboardHeightVp=3) returns 1437
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0174 begin`);
      const actual: number = resizedHeightOf(1440, 3);
      logInfo(`resizedHeightOf(windowHeightVp=1440, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1437);
      logInfo(`${BUNDLE}ResizedHeightOf_0174 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0175
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0175
     * @tc.desc      resizedHeightOf(windowHeightVp=1440, keyboardHeightVp=10) returns 1430
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0175 begin`);
      const actual: number = resizedHeightOf(1440, 10);
      logInfo(`resizedHeightOf(windowHeightVp=1440, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1430);
      logInfo(`${BUNDLE}ResizedHeightOf_0175 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0176
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0176
     * @tc.desc      resizedHeightOf(windowHeightVp=1536, keyboardHeightVp=1) returns 1535
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0176 begin`);
      const actual: number = resizedHeightOf(1536, 1);
      logInfo(`resizedHeightOf(windowHeightVp=1536, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1535);
      logInfo(`${BUNDLE}ResizedHeightOf_0176 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0177
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0177
     * @tc.desc      resizedHeightOf(windowHeightVp=1536, keyboardHeightVp=-1) returns 1537
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0177 begin`);
      const actual: number = resizedHeightOf(1536, -1);
      logInfo(`resizedHeightOf(windowHeightVp=1536, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1537);
      logInfo(`${BUNDLE}ResizedHeightOf_0177 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0178
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0178
     * @tc.desc      resizedHeightOf(windowHeightVp=1536, keyboardHeightVp=100) returns 1436
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0178 begin`);
      const actual: number = resizedHeightOf(1536, 100);
      logInfo(`resizedHeightOf(windowHeightVp=1536, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1436);
      logInfo(`${BUNDLE}ResizedHeightOf_0178 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0179
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0179
     * @tc.desc      resizedHeightOf(windowHeightVp=1536, keyboardHeightVp=360) returns 1176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0179 begin`);
      const actual: number = resizedHeightOf(1536, 360);
      logInfo(`resizedHeightOf(windowHeightVp=1536, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1176);
      logInfo(`${BUNDLE}ResizedHeightOf_0179 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0180
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0180
     * @tc.desc      resizedHeightOf(windowHeightVp=1536, keyboardHeightVp=720) returns 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0180 begin`);
      const actual: number = resizedHeightOf(1536, 720);
      logInfo(`resizedHeightOf(windowHeightVp=1536, keyb...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`${BUNDLE}ResizedHeightOf_0180 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0181
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0181
     * @tc.desc      resizedHeightOf(windowHeightVp=1536, keyboardHeightVp=1080) returns 456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0181 begin`);
      const actual: number = resizedHeightOf(1536, 1080);
      logInfo(`resizedHeightOf(windowHeightVp=1536, keyb...: actual=${actual}`);
      expect(actual).assertEqual(456);
      logInfo(`${BUNDLE}ResizedHeightOf_0181 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0182
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0182
     * @tc.desc      resizedHeightOf(windowHeightVp=1536, keyboardHeightVp=2) returns 1534
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0182 begin`);
      const actual: number = resizedHeightOf(1536, 2);
      logInfo(`resizedHeightOf(windowHeightVp=1536, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1534);
      logInfo(`${BUNDLE}ResizedHeightOf_0182 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0183
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0183
     * @tc.desc      resizedHeightOf(windowHeightVp=1536, keyboardHeightVp=3) returns 1533
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0183 begin`);
      const actual: number = resizedHeightOf(1536, 3);
      logInfo(`resizedHeightOf(windowHeightVp=1536, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1533);
      logInfo(`${BUNDLE}ResizedHeightOf_0183 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0184
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0184
     * @tc.desc      resizedHeightOf(windowHeightVp=1536, keyboardHeightVp=10) returns 1526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0184 begin`);
      const actual: number = resizedHeightOf(1536, 10);
      logInfo(`resizedHeightOf(windowHeightVp=1536, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1526);
      logInfo(`${BUNDLE}ResizedHeightOf_0184 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0185
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0185
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0185 begin`);
      const actual: number = resizedHeightOf(0, 1);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0185 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0186
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0186
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0186 begin`);
      const actual: number = resizedHeightOf(0, 100);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0186 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0187
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0187
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0187 begin`);
      const actual: number = resizedHeightOf(0, 360);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0187 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0188
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0188
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0188 begin`);
      const actual: number = resizedHeightOf(0, 720);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0188 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0189
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0189
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0189 begin`);
      const actual: number = resizedHeightOf(0, 1080);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0189 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0190
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0190
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0190 begin`);
      const actual: number = resizedHeightOf(0, 1920);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0190 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0191
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0191
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0191 begin`);
      const actual: number = resizedHeightOf(0, 2);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0191 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0192
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0192
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0192 begin`);
      const actual: number = resizedHeightOf(0, 3);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0192 end`);
    });
  });
}
