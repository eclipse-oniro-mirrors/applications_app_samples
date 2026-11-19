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
import { simplestRotationQuarter } from '../../../../main/ets/utils/FuncUtils';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for simplestRotationQuarter (79 cases). */
export default function simplestRotationQuarter2Test(): void {
  describe('SimplestRotationQuarter2Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0097
     * @tc.name      ImageViewer_SimplestRotationQuarter_0097
     * @tc.desc      simplestRotationQuarter(angle=-480) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0097 begin`);
      const actual: number = simplestRotationQuarter(-480);
      logInfo(`simplestRotationQuarter(angle=-480): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0098
     * @tc.name      ImageViewer_SimplestRotationQuarter_0098
     * @tc.desc      simplestRotationQuarter(angle=-91) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0098 begin`);
      const actual: number = simplestRotationQuarter(-91);
      logInfo(`simplestRotationQuarter(angle=-91): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0099
     * @tc.name      ImageViewer_SimplestRotationQuarter_0099
     * @tc.desc      simplestRotationQuarter(angle=383.94) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0099 begin`);
      const actual: number = simplestRotationQuarter(383.94);
      logInfo(`simplestRotationQuarter(angle=383.94): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0100
     * @tc.name      ImageViewer_SimplestRotationQuarter_0100
     * @tc.desc      simplestRotationQuarter(angle=1172) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0100 begin`);
      const actual: number = simplestRotationQuarter(1172);
      logInfo(`simplestRotationQuarter(angle=1172): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0101
     * @tc.name      ImageViewer_SimplestRotationQuarter_0101
     * @tc.desc      simplestRotationQuarter(angle=774) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0101 begin`);
      const actual: number = simplestRotationQuarter(774);
      logInfo(`simplestRotationQuarter(angle=774): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0102
     * @tc.name      ImageViewer_SimplestRotationQuarter_0102
     * @tc.desc      simplestRotationQuarter(angle=127.3) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0102 begin`);
      const actual: number = simplestRotationQuarter(127.3);
      logInfo(`simplestRotationQuarter(angle=127.3): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0103
     * @tc.name      ImageViewer_SimplestRotationQuarter_0103
     * @tc.desc      simplestRotationQuarter(angle=702.69) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0103 begin`);
      const actual: number = simplestRotationQuarter(702.69);
      logInfo(`simplestRotationQuarter(angle=702.69): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0104
     * @tc.name      ImageViewer_SimplestRotationQuarter_0104
     * @tc.desc      simplestRotationQuarter(angle=727) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0104 begin`);
      const actual: number = simplestRotationQuarter(727);
      logInfo(`simplestRotationQuarter(angle=727): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0105
     * @tc.name      ImageViewer_SimplestRotationQuarter_0105
     * @tc.desc      simplestRotationQuarter(angle=927) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0105 begin`);
      const actual: number = simplestRotationQuarter(927);
      logInfo(`simplestRotationQuarter(angle=927): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0106
     * @tc.name      ImageViewer_SimplestRotationQuarter_0106
     * @tc.desc      simplestRotationQuarter(angle=-42) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0106 begin`);
      const actual: number = simplestRotationQuarter(-42);
      logInfo(`simplestRotationQuarter(angle=-42): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0107
     * @tc.name      ImageViewer_SimplestRotationQuarter_0107
     * @tc.desc      simplestRotationQuarter(angle=1087) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0107 begin`);
      const actual: number = simplestRotationQuarter(1087);
      logInfo(`simplestRotationQuarter(angle=1087): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0108
     * @tc.name      ImageViewer_SimplestRotationQuarter_0108
     * @tc.desc      simplestRotationQuarter(angle=535) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0108 begin`);
      const actual: number = simplestRotationQuarter(535);
      logInfo(`simplestRotationQuarter(angle=535): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0109
     * @tc.name      ImageViewer_SimplestRotationQuarter_0109
     * @tc.desc      simplestRotationQuarter(angle=-133) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0109 begin`);
      const actual: number = simplestRotationQuarter(-133);
      logInfo(`simplestRotationQuarter(angle=-133): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0110
     * @tc.name      ImageViewer_SimplestRotationQuarter_0110
     * @tc.desc      simplestRotationQuarter(angle=-139) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0110 begin`);
      const actual: number = simplestRotationQuarter(-139);
      logInfo(`simplestRotationQuarter(angle=-139): actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0111
     * @tc.name      ImageViewer_SimplestRotationQuarter_0111
     * @tc.desc      simplestRotationQuarter(angle=-680) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0111 begin`);
      const actual: number = simplestRotationQuarter(-680);
      logInfo(`simplestRotationQuarter(angle=-680): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0112
     * @tc.name      ImageViewer_SimplestRotationQuarter_0112
     * @tc.desc      simplestRotationQuarter(angle=769) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0112 begin`);
      const actual: number = simplestRotationQuarter(769);
      logInfo(`simplestRotationQuarter(angle=769): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0113
     * @tc.name      ImageViewer_SimplestRotationQuarter_0113
     * @tc.desc      simplestRotationQuarter(angle=270.97) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0113 begin`);
      const actual: number = simplestRotationQuarter(270.97);
      logInfo(`simplestRotationQuarter(angle=270.97): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0114
     * @tc.name      ImageViewer_SimplestRotationQuarter_0114
     * @tc.desc      simplestRotationQuarter(angle=-568) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0114 begin`);
      const actual: number = simplestRotationQuarter(-568);
      logInfo(`simplestRotationQuarter(angle=-568): actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0115
     * @tc.name      ImageViewer_SimplestRotationQuarter_0115
     * @tc.desc      simplestRotationQuarter(angle=315) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0115 begin`);
      const actual: number = simplestRotationQuarter(315);
      logInfo(`simplestRotationQuarter(angle=315): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0116
     * @tc.name      ImageViewer_SimplestRotationQuarter_0116
     * @tc.desc      simplestRotationQuarter(angle=81.81) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0116 begin`);
      const actual: number = simplestRotationQuarter(81.81);
      logInfo(`simplestRotationQuarter(angle=81.81): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0117
     * @tc.name      ImageViewer_SimplestRotationQuarter_0117
     * @tc.desc      simplestRotationQuarter(angle=831) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0117 begin`);
      const actual: number = simplestRotationQuarter(831);
      logInfo(`simplestRotationQuarter(angle=831): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0118
     * @tc.name      ImageViewer_SimplestRotationQuarter_0118
     * @tc.desc      simplestRotationQuarter(angle=622) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0118 begin`);
      const actual: number = simplestRotationQuarter(622);
      logInfo(`simplestRotationQuarter(angle=622): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0119
     * @tc.name      ImageViewer_SimplestRotationQuarter_0119
     * @tc.desc      simplestRotationQuarter(angle=-21) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0119 begin`);
      const actual: number = simplestRotationQuarter(-21);
      logInfo(`simplestRotationQuarter(angle=-21): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0120
     * @tc.name      ImageViewer_SimplestRotationQuarter_0120
     * @tc.desc      simplestRotationQuarter(angle=190) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0120 begin`);
      const actual: number = simplestRotationQuarter(190);
      logInfo(`simplestRotationQuarter(angle=190): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0121
     * @tc.name      ImageViewer_SimplestRotationQuarter_0121
     * @tc.desc      simplestRotationQuarter(angle=445) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0121 begin`);
      const actual: number = simplestRotationQuarter(445);
      logInfo(`simplestRotationQuarter(angle=445): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0122
     * @tc.name      ImageViewer_SimplestRotationQuarter_0122
     * @tc.desc      simplestRotationQuarter(angle=446) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0122 begin`);
      const actual: number = simplestRotationQuarter(446);
      logInfo(`simplestRotationQuarter(angle=446): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0123
     * @tc.name      ImageViewer_SimplestRotationQuarter_0123
     * @tc.desc      simplestRotationQuarter(angle=-250) returns -270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0123 begin`);
      const actual: number = simplestRotationQuarter(-250);
      logInfo(`simplestRotationQuarter(angle=-250): actual=${actual}`);
      expect(actual).assertEqual(-270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0124
     * @tc.name      ImageViewer_SimplestRotationQuarter_0124
     * @tc.desc      simplestRotationQuarter(angle=660) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0124 begin`);
      const actual: number = simplestRotationQuarter(660);
      logInfo(`simplestRotationQuarter(angle=660): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0125
     * @tc.name      ImageViewer_SimplestRotationQuarter_0125
     * @tc.desc      simplestRotationQuarter(angle=-116) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0125 begin`);
      const actual: number = simplestRotationQuarter(-116);
      logInfo(`simplestRotationQuarter(angle=-116): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0126
     * @tc.name      ImageViewer_SimplestRotationQuarter_0126
     * @tc.desc      simplestRotationQuarter(angle=307) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0126 begin`);
      const actual: number = simplestRotationQuarter(307);
      logInfo(`simplestRotationQuarter(angle=307): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0126 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0127
     * @tc.name      ImageViewer_SimplestRotationQuarter_0127
     * @tc.desc      simplestRotationQuarter(angle=-699) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0127 begin`);
      const actual: number = simplestRotationQuarter(-699);
      logInfo(`simplestRotationQuarter(angle=-699): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0127 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0128
     * @tc.name      ImageViewer_SimplestRotationQuarter_0128
     * @tc.desc      simplestRotationQuarter(angle=-14) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0128 begin`);
      const actual: number = simplestRotationQuarter(-14);
      logInfo(`simplestRotationQuarter(angle=-14): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0128 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0129
     * @tc.name      ImageViewer_SimplestRotationQuarter_0129
     * @tc.desc      simplestRotationQuarter(angle=208.98) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0129 begin`);
      const actual: number = simplestRotationQuarter(208.98);
      logInfo(`simplestRotationQuarter(angle=208.98): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0129 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0130
     * @tc.name      ImageViewer_SimplestRotationQuarter_0130
     * @tc.desc      simplestRotationQuarter(angle=655.11) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0130 begin`);
      const actual: number = simplestRotationQuarter(655.11);
      logInfo(`simplestRotationQuarter(angle=655.11): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0130 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0131
     * @tc.name      ImageViewer_SimplestRotationQuarter_0131
     * @tc.desc      simplestRotationQuarter(angle=146) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0131 begin`);
      const actual: number = simplestRotationQuarter(146);
      logInfo(`simplestRotationQuarter(angle=146): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0131 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0132
     * @tc.name      ImageViewer_SimplestRotationQuarter_0132
     * @tc.desc      simplestRotationQuarter(angle=650) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0132 begin`);
      const actual: number = simplestRotationQuarter(650);
      logInfo(`simplestRotationQuarter(angle=650): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0132 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0133
     * @tc.name      ImageViewer_SimplestRotationQuarter_0133
     * @tc.desc      simplestRotationQuarter(angle=145) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0133 begin`);
      const actual: number = simplestRotationQuarter(145);
      logInfo(`simplestRotationQuarter(angle=145): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0133 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0134
     * @tc.name      ImageViewer_SimplestRotationQuarter_0134
     * @tc.desc      simplestRotationQuarter(angle=608.47) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0134 begin`);
      const actual: number = simplestRotationQuarter(608.47);
      logInfo(`simplestRotationQuarter(angle=608.47): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0134 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0135
     * @tc.name      ImageViewer_SimplestRotationQuarter_0135
     * @tc.desc      simplestRotationQuarter(angle=100.37) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0135 begin`);
      const actual: number = simplestRotationQuarter(100.37);
      logInfo(`simplestRotationQuarter(angle=100.37): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0135 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0136
     * @tc.name      ImageViewer_SimplestRotationQuarter_0136
     * @tc.desc      simplestRotationQuarter(angle=-677) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0136 begin`);
      const actual: number = simplestRotationQuarter(-677);
      logInfo(`simplestRotationQuarter(angle=-677): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0136 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0137
     * @tc.name      ImageViewer_SimplestRotationQuarter_0137
     * @tc.desc      simplestRotationQuarter(angle=1081) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0137 begin`);
      const actual: number = simplestRotationQuarter(1081);
      logInfo(`simplestRotationQuarter(angle=1081): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0137 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0138
     * @tc.name      ImageViewer_SimplestRotationQuarter_0138
     * @tc.desc      simplestRotationQuarter(angle=846) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0138 begin`);
      const actual: number = simplestRotationQuarter(846);
      logInfo(`simplestRotationQuarter(angle=846): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0138 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0139
     * @tc.name      ImageViewer_SimplestRotationQuarter_0139
     * @tc.desc      simplestRotationQuarter(angle=-226) returns -270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0139 begin`);
      const actual: number = simplestRotationQuarter(-226);
      logInfo(`simplestRotationQuarter(angle=-226): actual=${actual}`);
      expect(actual).assertEqual(-270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0139 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0140
     * @tc.name      ImageViewer_SimplestRotationQuarter_0140
     * @tc.desc      simplestRotationQuarter(angle=-185) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0140 begin`);
      const actual: number = simplestRotationQuarter(-185);
      logInfo(`simplestRotationQuarter(angle=-185): actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0140 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0141
     * @tc.name      ImageViewer_SimplestRotationQuarter_0141
     * @tc.desc      simplestRotationQuarter(angle=357.88) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0141 begin`);
      const actual: number = simplestRotationQuarter(357.88);
      logInfo(`simplestRotationQuarter(angle=357.88): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0141 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0142
     * @tc.name      ImageViewer_SimplestRotationQuarter_0142
     * @tc.desc      simplestRotationQuarter(angle=417) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0142 begin`);
      const actual: number = simplestRotationQuarter(417);
      logInfo(`simplestRotationQuarter(angle=417): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0142 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0143
     * @tc.name      ImageViewer_SimplestRotationQuarter_0143
     * @tc.desc      simplestRotationQuarter(angle=227) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0143 begin`);
      const actual: number = simplestRotationQuarter(227);
      logInfo(`simplestRotationQuarter(angle=227): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0143 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0144
     * @tc.name      ImageViewer_SimplestRotationQuarter_0144
     * @tc.desc      simplestRotationQuarter(angle=911) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0144 begin`);
      const actual: number = simplestRotationQuarter(911);
      logInfo(`simplestRotationQuarter(angle=911): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0144 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0145
     * @tc.name      ImageViewer_SimplestRotationQuarter_0145
     * @tc.desc      simplestRotationQuarter(angle=1076) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0145 begin`);
      const actual: number = simplestRotationQuarter(1076);
      logInfo(`simplestRotationQuarter(angle=1076): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0145 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0146
     * @tc.name      ImageViewer_SimplestRotationQuarter_0146
     * @tc.desc      simplestRotationQuarter(angle=-47) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0146 begin`);
      const actual: number = simplestRotationQuarter(-47);
      logInfo(`simplestRotationQuarter(angle=-47): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0146 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0147
     * @tc.name      ImageViewer_SimplestRotationQuarter_0147
     * @tc.desc      simplestRotationQuarter(angle=1264) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0147 begin`);
      const actual: number = simplestRotationQuarter(1264);
      logInfo(`simplestRotationQuarter(angle=1264): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0147 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0148
     * @tc.name      ImageViewer_SimplestRotationQuarter_0148
     * @tc.desc      simplestRotationQuarter(angle=205.99) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0148 begin`);
      const actual: number = simplestRotationQuarter(205.99);
      logInfo(`simplestRotationQuarter(angle=205.99): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0148 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0149
     * @tc.name      ImageViewer_SimplestRotationQuarter_0149
     * @tc.desc      simplestRotationQuarter(angle=-61) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0149 begin`);
      const actual: number = simplestRotationQuarter(-61);
      logInfo(`simplestRotationQuarter(angle=-61): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0149 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0150
     * @tc.name      ImageViewer_SimplestRotationQuarter_0150
     * @tc.desc      simplestRotationQuarter(angle=928) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0150 begin`);
      const actual: number = simplestRotationQuarter(928);
      logInfo(`simplestRotationQuarter(angle=928): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0150 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0151
     * @tc.name      ImageViewer_SimplestRotationQuarter_0151
     * @tc.desc      simplestRotationQuarter(angle=-476) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0151 begin`);
      const actual: number = simplestRotationQuarter(-476);
      logInfo(`simplestRotationQuarter(angle=-476): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0151 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0152
     * @tc.name      ImageViewer_SimplestRotationQuarter_0152
     * @tc.desc      simplestRotationQuarter(angle=1353) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0152 begin`);
      const actual: number = simplestRotationQuarter(1353);
      logInfo(`simplestRotationQuarter(angle=1353): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0152 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0153
     * @tc.name      ImageViewer_SimplestRotationQuarter_0153
     * @tc.desc      simplestRotationQuarter(angle=494.72) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0153 begin`);
      const actual: number = simplestRotationQuarter(494.72);
      logInfo(`simplestRotationQuarter(angle=494.72): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0153 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0154
     * @tc.name      ImageViewer_SimplestRotationQuarter_0154
     * @tc.desc      simplestRotationQuarter(angle=502) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0154 begin`);
      const actual: number = simplestRotationQuarter(502);
      logInfo(`simplestRotationQuarter(angle=502): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0154 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0155
     * @tc.name      ImageViewer_SimplestRotationQuarter_0155
     * @tc.desc      simplestRotationQuarter(angle=414.46) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0155 begin`);
      const actual: number = simplestRotationQuarter(414.46);
      logInfo(`simplestRotationQuarter(angle=414.46): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0155 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0156
     * @tc.name      ImageViewer_SimplestRotationQuarter_0156
     * @tc.desc      simplestRotationQuarter(angle=445.46) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0156 begin`);
      const actual: number = simplestRotationQuarter(445.46);
      logInfo(`simplestRotationQuarter(angle=445.46): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0156 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0157
     * @tc.name      ImageViewer_SimplestRotationQuarter_0157
     * @tc.desc      simplestRotationQuarter(angle=131) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0157 begin`);
      const actual: number = simplestRotationQuarter(131);
      logInfo(`simplestRotationQuarter(angle=131): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0157 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0158
     * @tc.name      ImageViewer_SimplestRotationQuarter_0158
     * @tc.desc      simplestRotationQuarter(angle=87) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0158 begin`);
      const actual: number = simplestRotationQuarter(87);
      logInfo(`simplestRotationQuarter(angle=87): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0158 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0159
     * @tc.name      ImageViewer_SimplestRotationQuarter_0159
     * @tc.desc      simplestRotationQuarter(angle=482.84) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0159 begin`);
      const actual: number = simplestRotationQuarter(482.84);
      logInfo(`simplestRotationQuarter(angle=482.84): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0159 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0160
     * @tc.name      ImageViewer_SimplestRotationQuarter_0160
     * @tc.desc      simplestRotationQuarter(angle=-304) returns -270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0160 begin`);
      const actual: number = simplestRotationQuarter(-304);
      logInfo(`simplestRotationQuarter(angle=-304): actual=${actual}`);
      expect(actual).assertEqual(-270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0160 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0161
     * @tc.name      ImageViewer_SimplestRotationQuarter_0161
     * @tc.desc      simplestRotationQuarter(angle=1254) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0161 begin`);
      const actual: number = simplestRotationQuarter(1254);
      logInfo(`simplestRotationQuarter(angle=1254): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0161 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0162
     * @tc.name      ImageViewer_SimplestRotationQuarter_0162
     * @tc.desc      simplestRotationQuarter(angle=585) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0162 begin`);
      const actual: number = simplestRotationQuarter(585);
      logInfo(`simplestRotationQuarter(angle=585): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0162 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0163
     * @tc.name      ImageViewer_SimplestRotationQuarter_0163
     * @tc.desc      simplestRotationQuarter(angle=1262) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0163 begin`);
      const actual: number = simplestRotationQuarter(1262);
      logInfo(`simplestRotationQuarter(angle=1262): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0163 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0164
     * @tc.name      ImageViewer_SimplestRotationQuarter_0164
     * @tc.desc      simplestRotationQuarter(angle=398.2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0164 begin`);
      const actual: number = simplestRotationQuarter(398.2);
      logInfo(`simplestRotationQuarter(angle=398.2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0164 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0165
     * @tc.name      ImageViewer_SimplestRotationQuarter_0165
     * @tc.desc      simplestRotationQuarter(angle=-208) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0165 begin`);
      const actual: number = simplestRotationQuarter(-208);
      logInfo(`simplestRotationQuarter(angle=-208): actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0165 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0166
     * @tc.name      ImageViewer_SimplestRotationQuarter_0166
     * @tc.desc      simplestRotationQuarter(angle=1145) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0166 begin`);
      const actual: number = simplestRotationQuarter(1145);
      logInfo(`simplestRotationQuarter(angle=1145): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0166 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0167
     * @tc.name      ImageViewer_SimplestRotationQuarter_0167
     * @tc.desc      simplestRotationQuarter(angle=254.96) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0167 begin`);
      const actual: number = simplestRotationQuarter(254.96);
      logInfo(`simplestRotationQuarter(angle=254.96): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0167 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0168
     * @tc.name      ImageViewer_SimplestRotationQuarter_0168
     * @tc.desc      simplestRotationQuarter(angle=1312) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0168 begin`);
      const actual: number = simplestRotationQuarter(1312);
      logInfo(`simplestRotationQuarter(angle=1312): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0168 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0169
     * @tc.name      ImageViewer_SimplestRotationQuarter_0169
     * @tc.desc      simplestRotationQuarter(angle=1372) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0169 begin`);
      const actual: number = simplestRotationQuarter(1372);
      logInfo(`simplestRotationQuarter(angle=1372): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0169 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0170
     * @tc.name      ImageViewer_SimplestRotationQuarter_0170
     * @tc.desc      simplestRotationQuarter(angle=1305) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0170 begin`);
      const actual: number = simplestRotationQuarter(1305);
      logInfo(`simplestRotationQuarter(angle=1305): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0170 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0171
     * @tc.name      ImageViewer_SimplestRotationQuarter_0171
     * @tc.desc      simplestRotationQuarter(angle=690.84) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0171 begin`);
      const actual: number = simplestRotationQuarter(690.84);
      logInfo(`simplestRotationQuarter(angle=690.84): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0171 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0172
     * @tc.name      ImageViewer_SimplestRotationQuarter_0172
     * @tc.desc      simplestRotationQuarter(angle=118) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0172 begin`);
      const actual: number = simplestRotationQuarter(118);
      logInfo(`simplestRotationQuarter(angle=118): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0172 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0173
     * @tc.name      ImageViewer_SimplestRotationQuarter_0173
     * @tc.desc      simplestRotationQuarter(angle=-75) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0173 begin`);
      const actual: number = simplestRotationQuarter(-75);
      logInfo(`simplestRotationQuarter(angle=-75): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0173 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0174
     * @tc.name      ImageViewer_SimplestRotationQuarter_0174
     * @tc.desc      simplestRotationQuarter(angle=481) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0174 begin`);
      const actual: number = simplestRotationQuarter(481);
      logInfo(`simplestRotationQuarter(angle=481): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0174 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0175
     * @tc.name      ImageViewer_SimplestRotationQuarter_0175
     * @tc.desc      simplestRotationQuarter(angle=-331) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0175 begin`);
      const actual: number = simplestRotationQuarter(-331);
      logInfo(`simplestRotationQuarter(angle=-331): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0175 end`);
    });
  });
}
