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
import { ComputeFeature } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ComputeFeature.setFontSize (29 cases). */
export default function computeFeatureSetFontSize2Test(): void {
  describe('ComputeFeatureSetFontSize2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0091
     * @tc.name      Image_ComputeFeatureSetFontSize_0091
     * @tc.desc      ComputeFeature.setFontSize(fontSize=179) yields 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0091 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(179);
      logInfo(`setFontSize(fontSize=179) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(179);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0092
     * @tc.name      Image_ComputeFeatureSetFontSize_0092
     * @tc.desc      ComputeFeature.setFontSize(fontSize=67) yields 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0092 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(67);
      logInfo(`setFontSize(fontSize=67) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(67);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0093
     * @tc.name      Image_ComputeFeatureSetFontSize_0093
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-5) yields -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0093 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-5);
      logInfo(`setFontSize(fontSize=-5) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-5);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0094
     * @tc.name      Image_ComputeFeatureSetFontSize_0094
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-28) yields -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0094 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-28);
      logInfo(`setFontSize(fontSize=-28) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-28);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0095
     * @tc.name      Image_ComputeFeatureSetFontSize_0095
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-19) yields -19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0095 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-19);
      logInfo(`setFontSize(fontSize=-19) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-19);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0096
     * @tc.name      Image_ComputeFeatureSetFontSize_0096
     * @tc.desc      ComputeFeature.setFontSize(fontSize=124) yields 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0096 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(124);
      logInfo(`setFontSize(fontSize=124) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(124);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0097
     * @tc.name      Image_ComputeFeatureSetFontSize_0097
     * @tc.desc      ComputeFeature.setFontSize(fontSize=58) yields 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0097 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(58);
      logInfo(`setFontSize(fontSize=58) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(58);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0098
     * @tc.name      Image_ComputeFeatureSetFontSize_0098
     * @tc.desc      ComputeFeature.setFontSize(fontSize=21.64) yields 21.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0098 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(21.64);
      logInfo(`setFontSize(fontSize=21.64) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(21.64, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0099
     * @tc.name      Image_ComputeFeatureSetFontSize_0099
     * @tc.desc      ComputeFeature.setFontSize(fontSize=24.92) yields 24.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0099 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(24.92);
      logInfo(`setFontSize(fontSize=24.92) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(24.92, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0100
     * @tc.name      Image_ComputeFeatureSetFontSize_0100
     * @tc.desc      ComputeFeature.setFontSize(fontSize=116) yields 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0100 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(116);
      logInfo(`setFontSize(fontSize=116) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(116);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0101
     * @tc.name      Image_ComputeFeatureSetFontSize_0101
     * @tc.desc      ComputeFeature.setFontSize(fontSize=22) yields 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0101 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(22);
      logInfo(`setFontSize(fontSize=22) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(22);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0102
     * @tc.name      Image_ComputeFeatureSetFontSize_0102
     * @tc.desc      ComputeFeature.setFontSize(fontSize=61.08) yields 61.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0102 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(61.08);
      logInfo(`setFontSize(fontSize=61.08) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(61.08, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0103
     * @tc.name      Image_ComputeFeatureSetFontSize_0103
     * @tc.desc      ComputeFeature.setFontSize(fontSize=58.25) yields 58.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0103 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(58.25);
      logInfo(`setFontSize(fontSize=58.25) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(58.25, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0104
     * @tc.name      Image_ComputeFeatureSetFontSize_0104
     * @tc.desc      ComputeFeature.setFontSize(fontSize=154) yields 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0104 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(154);
      logInfo(`setFontSize(fontSize=154) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(154);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0105
     * @tc.name      Image_ComputeFeatureSetFontSize_0105
     * @tc.desc      ComputeFeature.setFontSize(fontSize=153) yields 153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0105 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(153);
      logInfo(`setFontSize(fontSize=153) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(153);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0106
     * @tc.name      Image_ComputeFeatureSetFontSize_0106
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-7) yields -7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0106 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-7);
      logInfo(`setFontSize(fontSize=-7) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-7);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0107
     * @tc.name      Image_ComputeFeatureSetFontSize_0107
     * @tc.desc      ComputeFeature.setFontSize(fontSize=84.5) yields 84.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0107 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(84.5);
      logInfo(`setFontSize(fontSize=84.5) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(84.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0108
     * @tc.name      Image_ComputeFeatureSetFontSize_0108
     * @tc.desc      ComputeFeature.setFontSize(fontSize=31) yields 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0108 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(31);
      logInfo(`setFontSize(fontSize=31) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(31);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0109
     * @tc.name      Image_ComputeFeatureSetFontSize_0109
     * @tc.desc      ComputeFeature.setFontSize(fontSize=122) yields 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0109 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(122);
      logInfo(`setFontSize(fontSize=122) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(122);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0110
     * @tc.name      Image_ComputeFeatureSetFontSize_0110
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-39) yields -39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0110 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-39);
      logInfo(`setFontSize(fontSize=-39) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-39);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0111
     * @tc.name      Image_ComputeFeatureSetFontSize_0111
     * @tc.desc      ComputeFeature.setFontSize(fontSize=3.13) yields 3.13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0111 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(3.13);
      logInfo(`setFontSize(fontSize=3.13) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(3.13, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0112
     * @tc.name      Image_ComputeFeatureSetFontSize_0112
     * @tc.desc      ComputeFeature.setFontSize(fontSize=39) yields 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0112 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(39);
      logInfo(`setFontSize(fontSize=39) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(39);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0113
     * @tc.name      Image_ComputeFeatureSetFontSize_0113
     * @tc.desc      ComputeFeature.setFontSize(fontSize=86.96) yields 86.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0113 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(86.96);
      logInfo(`setFontSize(fontSize=86.96) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(86.96, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0114
     * @tc.name      Image_ComputeFeatureSetFontSize_0114
     * @tc.desc      ComputeFeature.setFontSize(fontSize=132) yields 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0114 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(132);
      logInfo(`setFontSize(fontSize=132) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(132);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0115
     * @tc.name      Image_ComputeFeatureSetFontSize_0115
     * @tc.desc      ComputeFeature.setFontSize(fontSize=16.21) yields 16.21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0115 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(16.21);
      logInfo(`setFontSize(fontSize=16.21) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(16.21, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0116
     * @tc.name      Image_ComputeFeatureSetFontSize_0116
     * @tc.desc      ComputeFeature.setFontSize(fontSize=96.32) yields 96.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0116 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(96.32);
      logInfo(`setFontSize(fontSize=96.32) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(96.32, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0117
     * @tc.name      Image_ComputeFeatureSetFontSize_0117
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-24) yields -24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0117 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-24);
      logInfo(`setFontSize(fontSize=-24) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-24);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0118
     * @tc.name      Image_ComputeFeatureSetFontSize_0118
     * @tc.desc      ComputeFeature.setFontSize(fontSize=6.55) yields 6.55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0118 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(6.55);
      logInfo(`setFontSize(fontSize=6.55) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(6.55, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0119
     * @tc.name      Image_ComputeFeatureSetFontSize_0119
     * @tc.desc      ComputeFeature.setFontSize(fontSize=10.76) yields 10.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0119 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(10.76);
      logInfo(`setFontSize(fontSize=10.76) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(10.76, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0119 end`);
    });
  });
}
