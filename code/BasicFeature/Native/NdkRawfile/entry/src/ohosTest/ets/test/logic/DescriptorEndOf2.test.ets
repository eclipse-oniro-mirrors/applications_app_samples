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
import { yieldToEventLoop } from '../EventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { descriptorEndOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for descriptorEndOf (70 cases). */
export default function descriptorEndOf2Test(): void {
  describe('DescriptorEndOf2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0097
     * @tc.name      NdkRawfile_DescriptorEndOf_0097
     * @tc.desc      descriptorEndOf(offset=1, length=70) returns 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0097 begin`);
      const actual: number = descriptorEndOf(1, 70);
      logInfo(`descriptorEndOf(offset=1, length=70): actual=${actual}`);
      expect(actual).assertEqual(71);
      logInfo(`${BUNDLE}DescriptorEndOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0098
     * @tc.name      NdkRawfile_DescriptorEndOf_0098
     * @tc.desc      descriptorEndOf(offset=1, length=75) returns 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0098 begin`);
      const actual: number = descriptorEndOf(1, 75);
      logInfo(`descriptorEndOf(offset=1, length=75): actual=${actual}`);
      expect(actual).assertEqual(76);
      logInfo(`${BUNDLE}DescriptorEndOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0099
     * @tc.name      NdkRawfile_DescriptorEndOf_0099
     * @tc.desc      descriptorEndOf(offset=1, length=80) returns 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0099 begin`);
      const actual: number = descriptorEndOf(1, 80);
      logInfo(`descriptorEndOf(offset=1, length=80): actual=${actual}`);
      expect(actual).assertEqual(81);
      logInfo(`${BUNDLE}DescriptorEndOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0100
     * @tc.name      NdkRawfile_DescriptorEndOf_0100
     * @tc.desc      descriptorEndOf(offset=1, length=85) returns 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0100 begin`);
      const actual: number = descriptorEndOf(1, 85);
      logInfo(`descriptorEndOf(offset=1, length=85): actual=${actual}`);
      expect(actual).assertEqual(86);
      logInfo(`${BUNDLE}DescriptorEndOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0101
     * @tc.name      NdkRawfile_DescriptorEndOf_0101
     * @tc.desc      descriptorEndOf(offset=1, length=90) returns 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0101 begin`);
      const actual: number = descriptorEndOf(1, 90);
      logInfo(`descriptorEndOf(offset=1, length=90): actual=${actual}`);
      expect(actual).assertEqual(91);
      logInfo(`${BUNDLE}DescriptorEndOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0102
     * @tc.name      NdkRawfile_DescriptorEndOf_0102
     * @tc.desc      descriptorEndOf(offset=1, length=95) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0102 begin`);
      const actual: number = descriptorEndOf(1, 95);
      logInfo(`descriptorEndOf(offset=1, length=95): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}DescriptorEndOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0103
     * @tc.name      NdkRawfile_DescriptorEndOf_0103
     * @tc.desc      descriptorEndOf(offset=1, length=105) returns 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0103 begin`);
      const actual: number = descriptorEndOf(1, 105);
      logInfo(`descriptorEndOf(offset=1, length=105): actual=${actual}`);
      expect(actual).assertEqual(106);
      logInfo(`${BUNDLE}DescriptorEndOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0104
     * @tc.name      NdkRawfile_DescriptorEndOf_0104
     * @tc.desc      descriptorEndOf(offset=1, length=110) returns 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0104 begin`);
      const actual: number = descriptorEndOf(1, 110);
      logInfo(`descriptorEndOf(offset=1, length=110): actual=${actual}`);
      expect(actual).assertEqual(111);
      logInfo(`${BUNDLE}DescriptorEndOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0105
     * @tc.name      NdkRawfile_DescriptorEndOf_0105
     * @tc.desc      descriptorEndOf(offset=1, length=-65) returns -64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0105 begin`);
      const actual: number = descriptorEndOf(1, -65);
      logInfo(`descriptorEndOf(offset=1, length=-65): actual=${actual}`);
      expect(actual).assertEqual(-64);
      logInfo(`${BUNDLE}DescriptorEndOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0106
     * @tc.name      NdkRawfile_DescriptorEndOf_0106
     * @tc.desc      descriptorEndOf(offset=1, length=127) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0106 begin`);
      const actual: number = descriptorEndOf(1, 127);
      logInfo(`descriptorEndOf(offset=1, length=127): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}DescriptorEndOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0107
     * @tc.name      NdkRawfile_DescriptorEndOf_0107
     * @tc.desc      descriptorEndOf(offset=50, length=2) returns 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0107 begin`);
      const actual: number = descriptorEndOf(50, 2);
      logInfo(`descriptorEndOf(offset=50, length=2): actual=${actual}`);
      expect(actual).assertEqual(52);
      logInfo(`${BUNDLE}DescriptorEndOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0108
     * @tc.name      NdkRawfile_DescriptorEndOf_0108
     * @tc.desc      descriptorEndOf(offset=50, length=100) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0108 begin`);
      const actual: number = descriptorEndOf(50, 100);
      logInfo(`descriptorEndOf(offset=50, length=100): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}DescriptorEndOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0109
     * @tc.name      NdkRawfile_DescriptorEndOf_0109
     * @tc.desc      descriptorEndOf(offset=50, length=3) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0109 begin`);
      const actual: number = descriptorEndOf(50, 3);
      logInfo(`descriptorEndOf(offset=50, length=3): actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}DescriptorEndOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0110
     * @tc.name      NdkRawfile_DescriptorEndOf_0110
     * @tc.desc      descriptorEndOf(offset=50, length=65) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0110 begin`);
      const actual: number = descriptorEndOf(50, 65);
      logInfo(`descriptorEndOf(offset=50, length=65): actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}DescriptorEndOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0111
     * @tc.name      NdkRawfile_DescriptorEndOf_0111
     * @tc.desc      descriptorEndOf(offset=50, length=70) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0111 begin`);
      const actual: number = descriptorEndOf(50, 70);
      logInfo(`descriptorEndOf(offset=50, length=70): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}DescriptorEndOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0112
     * @tc.name      NdkRawfile_DescriptorEndOf_0112
     * @tc.desc      descriptorEndOf(offset=50, length=75) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0112 begin`);
      const actual: number = descriptorEndOf(50, 75);
      logInfo(`descriptorEndOf(offset=50, length=75): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}DescriptorEndOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0113
     * @tc.name      NdkRawfile_DescriptorEndOf_0113
     * @tc.desc      descriptorEndOf(offset=50, length=80) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0113 begin`);
      const actual: number = descriptorEndOf(50, 80);
      logInfo(`descriptorEndOf(offset=50, length=80): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}DescriptorEndOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0114
     * @tc.name      NdkRawfile_DescriptorEndOf_0114
     * @tc.desc      descriptorEndOf(offset=50, length=85) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0114 begin`);
      const actual: number = descriptorEndOf(50, 85);
      logInfo(`descriptorEndOf(offset=50, length=85): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}DescriptorEndOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0115
     * @tc.name      NdkRawfile_DescriptorEndOf_0115
     * @tc.desc      descriptorEndOf(offset=50, length=90) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0115 begin`);
      const actual: number = descriptorEndOf(50, 90);
      logInfo(`descriptorEndOf(offset=50, length=90): actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}DescriptorEndOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0116
     * @tc.name      NdkRawfile_DescriptorEndOf_0116
     * @tc.desc      descriptorEndOf(offset=50, length=95) returns 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0116 begin`);
      const actual: number = descriptorEndOf(50, 95);
      logInfo(`descriptorEndOf(offset=50, length=95): actual=${actual}`);
      expect(actual).assertEqual(145);
      logInfo(`${BUNDLE}DescriptorEndOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0117
     * @tc.name      NdkRawfile_DescriptorEndOf_0117
     * @tc.desc      descriptorEndOf(offset=50, length=105) returns 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0117 begin`);
      const actual: number = descriptorEndOf(50, 105);
      logInfo(`descriptorEndOf(offset=50, length=105): actual=${actual}`);
      expect(actual).assertEqual(155);
      logInfo(`${BUNDLE}DescriptorEndOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0118
     * @tc.name      NdkRawfile_DescriptorEndOf_0118
     * @tc.desc      descriptorEndOf(offset=50, length=110) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0118 begin`);
      const actual: number = descriptorEndOf(50, 110);
      logInfo(`descriptorEndOf(offset=50, length=110): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}DescriptorEndOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0119
     * @tc.name      NdkRawfile_DescriptorEndOf_0119
     * @tc.desc      descriptorEndOf(offset=50, length=127) returns 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0119 begin`);
      const actual: number = descriptorEndOf(50, 127);
      logInfo(`descriptorEndOf(offset=50, length=127): actual=${actual}`);
      expect(actual).assertEqual(177);
      logInfo(`${BUNDLE}DescriptorEndOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0120
     * @tc.name      NdkRawfile_DescriptorEndOf_0120
     * @tc.desc      descriptorEndOf(offset=100, length=2) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0120 begin`);
      const actual: number = descriptorEndOf(100, 2);
      logInfo(`descriptorEndOf(offset=100, length=2): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}DescriptorEndOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0121
     * @tc.name      NdkRawfile_DescriptorEndOf_0121
     * @tc.desc      descriptorEndOf(offset=100, length=100) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0121 begin`);
      const actual: number = descriptorEndOf(100, 100);
      logInfo(`descriptorEndOf(offset=100, length=100): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}DescriptorEndOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0122
     * @tc.name      NdkRawfile_DescriptorEndOf_0122
     * @tc.desc      descriptorEndOf(offset=100, length=3) returns 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0122 begin`);
      const actual: number = descriptorEndOf(100, 3);
      logInfo(`descriptorEndOf(offset=100, length=3): actual=${actual}`);
      expect(actual).assertEqual(103);
      logInfo(`${BUNDLE}DescriptorEndOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0123
     * @tc.name      NdkRawfile_DescriptorEndOf_0123
     * @tc.desc      descriptorEndOf(offset=100, length=65) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0123 begin`);
      const actual: number = descriptorEndOf(100, 65);
      logInfo(`descriptorEndOf(offset=100, length=65): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}DescriptorEndOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0124
     * @tc.name      NdkRawfile_DescriptorEndOf_0124
     * @tc.desc      descriptorEndOf(offset=100, length=70) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0124 begin`);
      const actual: number = descriptorEndOf(100, 70);
      logInfo(`descriptorEndOf(offset=100, length=70): actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}DescriptorEndOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0125
     * @tc.name      NdkRawfile_DescriptorEndOf_0125
     * @tc.desc      descriptorEndOf(offset=100, length=75) returns 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0125 begin`);
      const actual: number = descriptorEndOf(100, 75);
      logInfo(`descriptorEndOf(offset=100, length=75): actual=${actual}`);
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}DescriptorEndOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0126
     * @tc.name      NdkRawfile_DescriptorEndOf_0126
     * @tc.desc      descriptorEndOf(offset=100, length=80) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0126 begin`);
      const actual: number = descriptorEndOf(100, 80);
      logInfo(`descriptorEndOf(offset=100, length=80): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}DescriptorEndOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0127
     * @tc.name      NdkRawfile_DescriptorEndOf_0127
     * @tc.desc      descriptorEndOf(offset=100, length=85) returns 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0127 begin`);
      const actual: number = descriptorEndOf(100, 85);
      logInfo(`descriptorEndOf(offset=100, length=85): actual=${actual}`);
      expect(actual).assertEqual(185);
      logInfo(`${BUNDLE}DescriptorEndOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0128
     * @tc.name      NdkRawfile_DescriptorEndOf_0128
     * @tc.desc      descriptorEndOf(offset=100, length=90) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0128 begin`);
      const actual: number = descriptorEndOf(100, 90);
      logInfo(`descriptorEndOf(offset=100, length=90): actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}DescriptorEndOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0129
     * @tc.name      NdkRawfile_DescriptorEndOf_0129
     * @tc.desc      descriptorEndOf(offset=100, length=95) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0129 begin`);
      const actual: number = descriptorEndOf(100, 95);
      logInfo(`descriptorEndOf(offset=100, length=95): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}DescriptorEndOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0130
     * @tc.name      NdkRawfile_DescriptorEndOf_0130
     * @tc.desc      descriptorEndOf(offset=100, length=105) returns 205
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0130 begin`);
      const actual: number = descriptorEndOf(100, 105);
      logInfo(`descriptorEndOf(offset=100, length=105): actual=${actual}`);
      expect(actual).assertEqual(205);
      logInfo(`${BUNDLE}DescriptorEndOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0131
     * @tc.name      NdkRawfile_DescriptorEndOf_0131
     * @tc.desc      descriptorEndOf(offset=100, length=110) returns 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0131 begin`);
      const actual: number = descriptorEndOf(100, 110);
      logInfo(`descriptorEndOf(offset=100, length=110): actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}DescriptorEndOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0132
     * @tc.name      NdkRawfile_DescriptorEndOf_0132
     * @tc.desc      descriptorEndOf(offset=100, length=127) returns 227
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0132 begin`);
      const actual: number = descriptorEndOf(100, 127);
      logInfo(`descriptorEndOf(offset=100, length=127): actual=${actual}`);
      expect(actual).assertEqual(227);
      logInfo(`${BUNDLE}DescriptorEndOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0133
     * @tc.name      NdkRawfile_DescriptorEndOf_0133
     * @tc.desc      descriptorEndOf(offset=2, length=5) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0133 begin`);
      const actual: number = descriptorEndOf(2, 5);
      logInfo(`descriptorEndOf(offset=2, length=5): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}DescriptorEndOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0134
     * @tc.name      NdkRawfile_DescriptorEndOf_0134
     * @tc.desc      descriptorEndOf(offset=2, length=10) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0134 begin`);
      const actual: number = descriptorEndOf(2, 10);
      logInfo(`descriptorEndOf(offset=2, length=10): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}DescriptorEndOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0135
     * @tc.name      NdkRawfile_DescriptorEndOf_0135
     * @tc.desc      descriptorEndOf(offset=2, length=15) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0135 begin`);
      const actual: number = descriptorEndOf(2, 15);
      logInfo(`descriptorEndOf(offset=2, length=15): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}DescriptorEndOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0136
     * @tc.name      NdkRawfile_DescriptorEndOf_0136
     * @tc.desc      descriptorEndOf(offset=2, length=20) returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0136 begin`);
      const actual: number = descriptorEndOf(2, 20);
      logInfo(`descriptorEndOf(offset=2, length=20): actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}DescriptorEndOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0137
     * @tc.name      NdkRawfile_DescriptorEndOf_0137
     * @tc.desc      descriptorEndOf(offset=2, length=30) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0137 begin`);
      const actual: number = descriptorEndOf(2, 30);
      logInfo(`descriptorEndOf(offset=2, length=30): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}DescriptorEndOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0138
     * @tc.name      NdkRawfile_DescriptorEndOf_0138
     * @tc.desc      descriptorEndOf(offset=2, length=35) returns 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0138 begin`);
      const actual: number = descriptorEndOf(2, 35);
      logInfo(`descriptorEndOf(offset=2, length=35): actual=${actual}`);
      expect(actual).assertEqual(37);
      logInfo(`${BUNDLE}DescriptorEndOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0139
     * @tc.name      NdkRawfile_DescriptorEndOf_0139
     * @tc.desc      descriptorEndOf(offset=2, length=40) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0139 begin`);
      const actual: number = descriptorEndOf(2, 40);
      logInfo(`descriptorEndOf(offset=2, length=40): actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}DescriptorEndOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0140
     * @tc.name      NdkRawfile_DescriptorEndOf_0140
     * @tc.desc      descriptorEndOf(offset=2, length=45) returns 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0140 begin`);
      const actual: number = descriptorEndOf(2, 45);
      logInfo(`descriptorEndOf(offset=2, length=45): actual=${actual}`);
      expect(actual).assertEqual(47);
      logInfo(`${BUNDLE}DescriptorEndOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0141
     * @tc.name      NdkRawfile_DescriptorEndOf_0141
     * @tc.desc      descriptorEndOf(offset=2, length=55) returns 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0141 begin`);
      const actual: number = descriptorEndOf(2, 55);
      logInfo(`descriptorEndOf(offset=2, length=55): actual=${actual}`);
      expect(actual).assertEqual(57);
      logInfo(`${BUNDLE}DescriptorEndOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0142
     * @tc.name      NdkRawfile_DescriptorEndOf_0142
     * @tc.desc      descriptorEndOf(offset=2, length=60) returns 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0142 begin`);
      const actual: number = descriptorEndOf(2, 60);
      logInfo(`descriptorEndOf(offset=2, length=60): actual=${actual}`);
      expect(actual).assertEqual(62);
      logInfo(`${BUNDLE}DescriptorEndOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0143
     * @tc.name      NdkRawfile_DescriptorEndOf_0143
     * @tc.desc      descriptorEndOf(offset=2, length=65) returns 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0143 begin`);
      const actual: number = descriptorEndOf(2, 65);
      logInfo(`descriptorEndOf(offset=2, length=65): actual=${actual}`);
      expect(actual).assertEqual(67);
      logInfo(`${BUNDLE}DescriptorEndOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0144
     * @tc.name      NdkRawfile_DescriptorEndOf_0144
     * @tc.desc      descriptorEndOf(offset=2, length=70) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0144 begin`);
      const actual: number = descriptorEndOf(2, 70);
      logInfo(`descriptorEndOf(offset=2, length=70): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}DescriptorEndOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0145
     * @tc.name      NdkRawfile_DescriptorEndOf_0145
     * @tc.desc      descriptorEndOf(offset=2, length=75) returns 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0145 begin`);
      const actual: number = descriptorEndOf(2, 75);
      logInfo(`descriptorEndOf(offset=2, length=75): actual=${actual}`);
      expect(actual).assertEqual(77);
      logInfo(`${BUNDLE}DescriptorEndOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0146
     * @tc.name      NdkRawfile_DescriptorEndOf_0146
     * @tc.desc      descriptorEndOf(offset=2, length=80) returns 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0146 begin`);
      const actual: number = descriptorEndOf(2, 80);
      logInfo(`descriptorEndOf(offset=2, length=80): actual=${actual}`);
      expect(actual).assertEqual(82);
      logInfo(`${BUNDLE}DescriptorEndOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0147
     * @tc.name      NdkRawfile_DescriptorEndOf_0147
     * @tc.desc      descriptorEndOf(offset=2, length=85) returns 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0147 begin`);
      const actual: number = descriptorEndOf(2, 85);
      logInfo(`descriptorEndOf(offset=2, length=85): actual=${actual}`);
      expect(actual).assertEqual(87);
      logInfo(`${BUNDLE}DescriptorEndOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0148
     * @tc.name      NdkRawfile_DescriptorEndOf_0148
     * @tc.desc      descriptorEndOf(offset=2, length=90) returns 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0148 begin`);
      const actual: number = descriptorEndOf(2, 90);
      logInfo(`descriptorEndOf(offset=2, length=90): actual=${actual}`);
      expect(actual).assertEqual(92);
      logInfo(`${BUNDLE}DescriptorEndOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0149
     * @tc.name      NdkRawfile_DescriptorEndOf_0149
     * @tc.desc      descriptorEndOf(offset=2, length=95) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0149 begin`);
      const actual: number = descriptorEndOf(2, 95);
      logInfo(`descriptorEndOf(offset=2, length=95): actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}DescriptorEndOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0150
     * @tc.name      NdkRawfile_DescriptorEndOf_0150
     * @tc.desc      descriptorEndOf(offset=2, length=105) returns 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0150 begin`);
      const actual: number = descriptorEndOf(2, 105);
      logInfo(`descriptorEndOf(offset=2, length=105): actual=${actual}`);
      expect(actual).assertEqual(107);
      logInfo(`${BUNDLE}DescriptorEndOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0151
     * @tc.name      NdkRawfile_DescriptorEndOf_0151
     * @tc.desc      descriptorEndOf(offset=2, length=110) returns 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0151 begin`);
      const actual: number = descriptorEndOf(2, 110);
      logInfo(`descriptorEndOf(offset=2, length=110): actual=${actual}`);
      expect(actual).assertEqual(112);
      logInfo(`${BUNDLE}DescriptorEndOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0152
     * @tc.name      NdkRawfile_DescriptorEndOf_0152
     * @tc.desc      descriptorEndOf(offset=2, length=-65) returns -63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0152 begin`);
      const actual: number = descriptorEndOf(2, -65);
      logInfo(`descriptorEndOf(offset=2, length=-65): actual=${actual}`);
      expect(actual).assertEqual(-63);
      logInfo(`${BUNDLE}DescriptorEndOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0153
     * @tc.name      NdkRawfile_DescriptorEndOf_0153
     * @tc.desc      descriptorEndOf(offset=2, length=-26) returns -24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0153 begin`);
      const actual: number = descriptorEndOf(2, -26);
      logInfo(`descriptorEndOf(offset=2, length=-26): actual=${actual}`);
      expect(actual).assertEqual(-24);
      logInfo(`${BUNDLE}DescriptorEndOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0154
     * @tc.name      NdkRawfile_DescriptorEndOf_0154
     * @tc.desc      descriptorEndOf(offset=2, length=127) returns 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0154 begin`);
      const actual: number = descriptorEndOf(2, 127);
      logInfo(`descriptorEndOf(offset=2, length=127): actual=${actual}`);
      expect(actual).assertEqual(129);
      logInfo(`${BUNDLE}DescriptorEndOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0155
     * @tc.name      NdkRawfile_DescriptorEndOf_0155
     * @tc.desc      descriptorEndOf(offset=3, length=5) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0155 begin`);
      const actual: number = descriptorEndOf(3, 5);
      logInfo(`descriptorEndOf(offset=3, length=5): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}DescriptorEndOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0156
     * @tc.name      NdkRawfile_DescriptorEndOf_0156
     * @tc.desc      descriptorEndOf(offset=3, length=10) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0156 begin`);
      const actual: number = descriptorEndOf(3, 10);
      logInfo(`descriptorEndOf(offset=3, length=10): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}DescriptorEndOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0157
     * @tc.name      NdkRawfile_DescriptorEndOf_0157
     * @tc.desc      descriptorEndOf(offset=3, length=15) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0157 begin`);
      const actual: number = descriptorEndOf(3, 15);
      logInfo(`descriptorEndOf(offset=3, length=15): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}DescriptorEndOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0158
     * @tc.name      NdkRawfile_DescriptorEndOf_0158
     * @tc.desc      descriptorEndOf(offset=3, length=20) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0158 begin`);
      const actual: number = descriptorEndOf(3, 20);
      logInfo(`descriptorEndOf(offset=3, length=20): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}DescriptorEndOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0159
     * @tc.name      NdkRawfile_DescriptorEndOf_0159
     * @tc.desc      descriptorEndOf(offset=3, length=25) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0159 begin`);
      const actual: number = descriptorEndOf(3, 25);
      logInfo(`descriptorEndOf(offset=3, length=25): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}DescriptorEndOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0160
     * @tc.name      NdkRawfile_DescriptorEndOf_0160
     * @tc.desc      descriptorEndOf(offset=3, length=30) returns 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0160 begin`);
      const actual: number = descriptorEndOf(3, 30);
      logInfo(`descriptorEndOf(offset=3, length=30): actual=${actual}`);
      expect(actual).assertEqual(33);
      logInfo(`${BUNDLE}DescriptorEndOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0161
     * @tc.name      NdkRawfile_DescriptorEndOf_0161
     * @tc.desc      descriptorEndOf(offset=3, length=35) returns 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0161 begin`);
      const actual: number = descriptorEndOf(3, 35);
      logInfo(`descriptorEndOf(offset=3, length=35): actual=${actual}`);
      expect(actual).assertEqual(38);
      logInfo(`${BUNDLE}DescriptorEndOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0162
     * @tc.name      NdkRawfile_DescriptorEndOf_0162
     * @tc.desc      descriptorEndOf(offset=3, length=40) returns 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0162 begin`);
      const actual: number = descriptorEndOf(3, 40);
      logInfo(`descriptorEndOf(offset=3, length=40): actual=${actual}`);
      expect(actual).assertEqual(43);
      logInfo(`${BUNDLE}DescriptorEndOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0163
     * @tc.name      NdkRawfile_DescriptorEndOf_0163
     * @tc.desc      descriptorEndOf(offset=3, length=45) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0163 begin`);
      const actual: number = descriptorEndOf(3, 45);
      logInfo(`descriptorEndOf(offset=3, length=45): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}DescriptorEndOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0164
     * @tc.name      NdkRawfile_DescriptorEndOf_0164
     * @tc.desc      descriptorEndOf(offset=3, length=55) returns 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0164 begin`);
      const actual: number = descriptorEndOf(3, 55);
      logInfo(`descriptorEndOf(offset=3, length=55): actual=${actual}`);
      expect(actual).assertEqual(58);
      logInfo(`${BUNDLE}DescriptorEndOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0165
     * @tc.name      NdkRawfile_DescriptorEndOf_0165
     * @tc.desc      descriptorEndOf(offset=3, length=60) returns 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0165 begin`);
      const actual: number = descriptorEndOf(3, 60);
      logInfo(`descriptorEndOf(offset=3, length=60): actual=${actual}`);
      expect(actual).assertEqual(63);
      logInfo(`${BUNDLE}DescriptorEndOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0166
     * @tc.name      NdkRawfile_DescriptorEndOf_0166
     * @tc.desc      descriptorEndOf(offset=3, length=65) returns 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0166 begin`);
      const actual: number = descriptorEndOf(3, 65);
      logInfo(`descriptorEndOf(offset=3, length=65): actual=${actual}`);
      expect(actual).assertEqual(68);
      logInfo(`${BUNDLE}DescriptorEndOf_0166 end`);
    });
  });
}
