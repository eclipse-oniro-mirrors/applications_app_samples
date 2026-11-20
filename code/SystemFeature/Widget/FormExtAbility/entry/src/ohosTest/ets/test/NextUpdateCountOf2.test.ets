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
import { nextUpdateCountOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextUpdateCountOf (24 cases). */
export default function nextUpdateCountOf2Test(): void {
  describe('NextUpdateCountOf2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0097
     * @tc.name      FormExtAbility_NextUpdateCountOf_0097
     * @tc.desc      nextUpdateCountOf(updateCount=5.65) returns 6.65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0097 begin`);
      const actual: number = nextUpdateCountOf(5.65);
      logInfo(`nextUpdateCountOf(updateCount=5.65): actual=${actual}`);
      expect(actual).assertClose(6.65, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0098
     * @tc.name      FormExtAbility_NextUpdateCountOf_0098
     * @tc.desc      nextUpdateCountOf(updateCount=42.86) returns 43.86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0098 begin`);
      const actual: number = nextUpdateCountOf(42.86);
      logInfo(`nextUpdateCountOf(updateCount=42.86): actual=${actual}`);
      expect(actual).assertClose(43.86, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0099
     * @tc.name      FormExtAbility_NextUpdateCountOf_0099
     * @tc.desc      nextUpdateCountOf(updateCount=-50) returns -49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0099 begin`);
      const actual: number = nextUpdateCountOf(-50);
      logInfo(`nextUpdateCountOf(updateCount=-50): actual=${actual}`);
      expect(actual).assertEqual(-49);
      logInfo(`${BUNDLE}NextUpdateCountOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0100
     * @tc.name      FormExtAbility_NextUpdateCountOf_0100
     * @tc.desc      nextUpdateCountOf(updateCount=-13) returns -12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0100 begin`);
      const actual: number = nextUpdateCountOf(-13);
      logInfo(`nextUpdateCountOf(updateCount=-13): actual=${actual}`);
      expect(actual).assertEqual(-12);
      logInfo(`${BUNDLE}NextUpdateCountOf_0100 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0101
     * @tc.name      FormExtAbility_NextUpdateCountOf_0101
     * @tc.desc      nextUpdateCountOf(updateCount=-90) returns -89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0101 begin`);
      const actual: number = nextUpdateCountOf(-90);
      logInfo(`nextUpdateCountOf(updateCount=-90): actual=${actual}`);
      expect(actual).assertEqual(-89);
      logInfo(`${BUNDLE}NextUpdateCountOf_0101 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0102
     * @tc.name      FormExtAbility_NextUpdateCountOf_0102
     * @tc.desc      nextUpdateCountOf(updateCount=191) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0102 begin`);
      const actual: number = nextUpdateCountOf(191);
      logInfo(`nextUpdateCountOf(updateCount=191): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}NextUpdateCountOf_0102 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0103
     * @tc.name      FormExtAbility_NextUpdateCountOf_0103
     * @tc.desc      nextUpdateCountOf(updateCount=121) returns 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0103 begin`);
      const actual: number = nextUpdateCountOf(121);
      logInfo(`nextUpdateCountOf(updateCount=121): actual=${actual}`);
      expect(actual).assertEqual(122);
      logInfo(`${BUNDLE}NextUpdateCountOf_0103 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0104
     * @tc.name      FormExtAbility_NextUpdateCountOf_0104
     * @tc.desc      nextUpdateCountOf(updateCount=16) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0104 begin`);
      const actual: number = nextUpdateCountOf(16);
      logInfo(`nextUpdateCountOf(updateCount=16): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}NextUpdateCountOf_0104 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0105
     * @tc.name      FormExtAbility_NextUpdateCountOf_0105
     * @tc.desc      nextUpdateCountOf(updateCount=168) returns 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0105 begin`);
      const actual: number = nextUpdateCountOf(168);
      logInfo(`nextUpdateCountOf(updateCount=168): actual=${actual}`);
      expect(actual).assertEqual(169);
      logInfo(`${BUNDLE}NextUpdateCountOf_0105 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0106
     * @tc.name      FormExtAbility_NextUpdateCountOf_0106
     * @tc.desc      nextUpdateCountOf(updateCount=12.34) returns 13.34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0106 begin`);
      const actual: number = nextUpdateCountOf(12.34);
      logInfo(`nextUpdateCountOf(updateCount=12.34): actual=${actual}`);
      expect(actual).assertClose(13.34, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0106 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0107
     * @tc.name      FormExtAbility_NextUpdateCountOf_0107
     * @tc.desc      nextUpdateCountOf(updateCount=172) returns 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0107 begin`);
      const actual: number = nextUpdateCountOf(172);
      logInfo(`nextUpdateCountOf(updateCount=172): actual=${actual}`);
      expect(actual).assertEqual(173);
      logInfo(`${BUNDLE}NextUpdateCountOf_0107 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0108
     * @tc.name      FormExtAbility_NextUpdateCountOf_0108
     * @tc.desc      nextUpdateCountOf(updateCount=62.17) returns 63.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0108 begin`);
      const actual: number = nextUpdateCountOf(62.17);
      logInfo(`nextUpdateCountOf(updateCount=62.17): actual=${actual}`);
      expect(actual).assertClose(63.17, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0108 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0109
     * @tc.name      FormExtAbility_NextUpdateCountOf_0109
     * @tc.desc      nextUpdateCountOf(updateCount=50.83) returns 51.83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0109 begin`);
      const actual: number = nextUpdateCountOf(50.83);
      logInfo(`nextUpdateCountOf(updateCount=50.83): actual=${actual}`);
      expect(actual).assertClose(51.83, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0109 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0110
     * @tc.name      FormExtAbility_NextUpdateCountOf_0110
     * @tc.desc      nextUpdateCountOf(updateCount=9) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0110 begin`);
      const actual: number = nextUpdateCountOf(9);
      logInfo(`nextUpdateCountOf(updateCount=9): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextUpdateCountOf_0110 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0111
     * @tc.name      FormExtAbility_NextUpdateCountOf_0111
     * @tc.desc      nextUpdateCountOf(updateCount=-47) returns -46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0111 begin`);
      const actual: number = nextUpdateCountOf(-47);
      logInfo(`nextUpdateCountOf(updateCount=-47): actual=${actual}`);
      expect(actual).assertEqual(-46);
      logInfo(`${BUNDLE}NextUpdateCountOf_0111 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0112
     * @tc.name      FormExtAbility_NextUpdateCountOf_0112
     * @tc.desc      nextUpdateCountOf(updateCount=36) returns 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0112 begin`);
      const actual: number = nextUpdateCountOf(36);
      logInfo(`nextUpdateCountOf(updateCount=36): actual=${actual}`);
      expect(actual).assertEqual(37);
      logInfo(`${BUNDLE}NextUpdateCountOf_0112 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0113
     * @tc.name      FormExtAbility_NextUpdateCountOf_0113
     * @tc.desc      nextUpdateCountOf(updateCount=108) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0113 begin`);
      const actual: number = nextUpdateCountOf(108);
      logInfo(`nextUpdateCountOf(updateCount=108): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextUpdateCountOf_0113 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0114
     * @tc.name      FormExtAbility_NextUpdateCountOf_0114
     * @tc.desc      nextUpdateCountOf(updateCount=128) returns 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0114 begin`);
      const actual: number = nextUpdateCountOf(128);
      logInfo(`nextUpdateCountOf(updateCount=128): actual=${actual}`);
      expect(actual).assertEqual(129);
      logInfo(`${BUNDLE}NextUpdateCountOf_0114 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0115
     * @tc.name      FormExtAbility_NextUpdateCountOf_0115
     * @tc.desc      nextUpdateCountOf(updateCount=193) returns 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0115 begin`);
      const actual: number = nextUpdateCountOf(193);
      logInfo(`nextUpdateCountOf(updateCount=193): actual=${actual}`);
      expect(actual).assertEqual(194);
      logInfo(`${BUNDLE}NextUpdateCountOf_0115 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0116
     * @tc.name      FormExtAbility_NextUpdateCountOf_0116
     * @tc.desc      nextUpdateCountOf(updateCount=-67) returns -66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0116 begin`);
      const actual: number = nextUpdateCountOf(-67);
      logInfo(`nextUpdateCountOf(updateCount=-67): actual=${actual}`);
      expect(actual).assertEqual(-66);
      logInfo(`${BUNDLE}NextUpdateCountOf_0116 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0117
     * @tc.name      FormExtAbility_NextUpdateCountOf_0117
     * @tc.desc      nextUpdateCountOf(updateCount=-19) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0117 begin`);
      const actual: number = nextUpdateCountOf(-19);
      logInfo(`nextUpdateCountOf(updateCount=-19): actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NextUpdateCountOf_0117 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0118
     * @tc.name      FormExtAbility_NextUpdateCountOf_0118
     * @tc.desc      nextUpdateCountOf(updateCount=-43) returns -42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0118 begin`);
      const actual: number = nextUpdateCountOf(-43);
      logInfo(`nextUpdateCountOf(updateCount=-43): actual=${actual}`);
      expect(actual).assertEqual(-42);
      logInfo(`${BUNDLE}NextUpdateCountOf_0118 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0119
     * @tc.name      FormExtAbility_NextUpdateCountOf_0119
     * @tc.desc      nextUpdateCountOf(updateCount=-18) returns -17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0119 begin`);
      const actual: number = nextUpdateCountOf(-18);
      logInfo(`nextUpdateCountOf(updateCount=-18): actual=${actual}`);
      expect(actual).assertEqual(-17);
      logInfo(`${BUNDLE}NextUpdateCountOf_0119 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0120
     * @tc.name      FormExtAbility_NextUpdateCountOf_0120
     * @tc.desc      nextUpdateCountOf(updateCount=151) returns 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0120 begin`);
      const actual: number = nextUpdateCountOf(151);
      logInfo(`nextUpdateCountOf(updateCount=151): actual=${actual}`);
      expect(actual).assertEqual(152);
      logInfo(`${BUNDLE}NextUpdateCountOf_0120 end`);
    });
  });
}
