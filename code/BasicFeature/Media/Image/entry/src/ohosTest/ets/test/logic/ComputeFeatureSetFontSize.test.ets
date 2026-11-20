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

/** Logic checks for ComputeFeature.setFontSize (90 cases). */
export default function computeFeatureSetFontSizeTest(): void {
  describe('ComputeFeatureSetFontSizeTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0001
     * @tc.name      Image_ComputeFeatureSetFontSize_0001
     * @tc.desc      ComputeFeature.setFontSize(fontSize=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureSetFontSize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0001 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(1);
      logInfo(`setFontSize(fontSize=1) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0002
     * @tc.name      Image_ComputeFeatureSetFontSize_0002
     * @tc.desc      ComputeFeature.setFontSize(fontSize=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureSetFontSize_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0002 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(2);
      logInfo(`setFontSize(fontSize=2) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0003
     * @tc.name      Image_ComputeFeatureSetFontSize_0003
     * @tc.desc      ComputeFeature.setFontSize(fontSize=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetFontSize_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0003 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(3);
      logInfo(`setFontSize(fontSize=3) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0004
     * @tc.name      Image_ComputeFeatureSetFontSize_0004
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetFontSize_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0004 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-1);
      logInfo(`setFontSize(fontSize=-1) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0005
     * @tc.name      Image_ComputeFeatureSetFontSize_0005
     * @tc.desc      ComputeFeature.setFontSize(fontSize=4) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetFontSize_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0005 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(4);
      logInfo(`setFontSize(fontSize=4) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0006
     * @tc.name      Image_ComputeFeatureSetFontSize_0006
     * @tc.desc      ComputeFeature.setFontSize(fontSize=5) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0006 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(5);
      logInfo(`setFontSize(fontSize=5) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0007
     * @tc.name      Image_ComputeFeatureSetFontSize_0007
     * @tc.desc      ComputeFeature.setFontSize(fontSize=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0007 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(10);
      logInfo(`setFontSize(fontSize=10) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0008
     * @tc.name      Image_ComputeFeatureSetFontSize_0008
     * @tc.desc      ComputeFeature.setFontSize(fontSize=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0008 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(100);
      logInfo(`setFontSize(fontSize=100) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0009
     * @tc.name      Image_ComputeFeatureSetFontSize_0009
     * @tc.desc      ComputeFeature.setFontSize(fontSize=15) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0009 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(15);
      logInfo(`setFontSize(fontSize=15) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0010
     * @tc.name      Image_ComputeFeatureSetFontSize_0010
     * @tc.desc      ComputeFeature.setFontSize(fontSize=20) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0010 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(20);
      logInfo(`setFontSize(fontSize=20) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0011
     * @tc.name      Image_ComputeFeatureSetFontSize_0011
     * @tc.desc      ComputeFeature.setFontSize(fontSize=25) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0011 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(25);
      logInfo(`setFontSize(fontSize=25) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0012
     * @tc.name      Image_ComputeFeatureSetFontSize_0012
     * @tc.desc      ComputeFeature.setFontSize(fontSize=30) yields 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0012 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(30);
      logInfo(`setFontSize(fontSize=30) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0013
     * @tc.name      Image_ComputeFeatureSetFontSize_0013
     * @tc.desc      ComputeFeature.setFontSize(fontSize=35) yields 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0013 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(35);
      logInfo(`setFontSize(fontSize=35) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0014
     * @tc.name      Image_ComputeFeatureSetFontSize_0014
     * @tc.desc      ComputeFeature.setFontSize(fontSize=40) yields 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0014 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(40);
      logInfo(`setFontSize(fontSize=40) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0015
     * @tc.name      Image_ComputeFeatureSetFontSize_0015
     * @tc.desc      ComputeFeature.setFontSize(fontSize=45) yields 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0015 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(45);
      logInfo(`setFontSize(fontSize=45) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0016
     * @tc.name      Image_ComputeFeatureSetFontSize_0016
     * @tc.desc      ComputeFeature.setFontSize(fontSize=50) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0016 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(50);
      logInfo(`setFontSize(fontSize=50) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0017
     * @tc.name      Image_ComputeFeatureSetFontSize_0017
     * @tc.desc      ComputeFeature.setFontSize(fontSize=55) yields 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0017 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(55);
      logInfo(`setFontSize(fontSize=55) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0018
     * @tc.name      Image_ComputeFeatureSetFontSize_0018
     * @tc.desc      ComputeFeature.setFontSize(fontSize=60) yields 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0018 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(60);
      logInfo(`setFontSize(fontSize=60) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(60);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0019
     * @tc.name      Image_ComputeFeatureSetFontSize_0019
     * @tc.desc      ComputeFeature.setFontSize(fontSize=65) yields 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0019 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(65);
      logInfo(`setFontSize(fontSize=65) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(65);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0020
     * @tc.name      Image_ComputeFeatureSetFontSize_0020
     * @tc.desc      ComputeFeature.setFontSize(fontSize=70) yields 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0020 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(70);
      logInfo(`setFontSize(fontSize=70) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(70);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0021
     * @tc.name      Image_ComputeFeatureSetFontSize_0021
     * @tc.desc      ComputeFeature.setFontSize(fontSize=75) yields 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0021 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(75);
      logInfo(`setFontSize(fontSize=75) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0022
     * @tc.name      Image_ComputeFeatureSetFontSize_0022
     * @tc.desc      ComputeFeature.setFontSize(fontSize=80) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0022 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(80);
      logInfo(`setFontSize(fontSize=80) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0023
     * @tc.name      Image_ComputeFeatureSetFontSize_0023
     * @tc.desc      ComputeFeature.setFontSize(fontSize=85) yields 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0023 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(85);
      logInfo(`setFontSize(fontSize=85) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0024
     * @tc.name      Image_ComputeFeatureSetFontSize_0024
     * @tc.desc      ComputeFeature.setFontSize(fontSize=90) yields 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0024 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(90);
      logInfo(`setFontSize(fontSize=90) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(90);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0025
     * @tc.name      Image_ComputeFeatureSetFontSize_0025
     * @tc.desc      ComputeFeature.setFontSize(fontSize=95) yields 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0025 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(95);
      logInfo(`setFontSize(fontSize=95) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0026
     * @tc.name      Image_ComputeFeatureSetFontSize_0026
     * @tc.desc      ComputeFeature.setFontSize(fontSize=105) yields 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0026 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(105);
      logInfo(`setFontSize(fontSize=105) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(105);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0027
     * @tc.name      Image_ComputeFeatureSetFontSize_0027
     * @tc.desc      ComputeFeature.setFontSize(fontSize=110) yields 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0027 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(110);
      logInfo(`setFontSize(fontSize=110) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(110);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0028
     * @tc.name      Image_ComputeFeatureSetFontSize_0028
     * @tc.desc      ComputeFeature.setFontSize(fontSize=115) yields 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0028 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(115);
      logInfo(`setFontSize(fontSize=115) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(115);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0029
     * @tc.name      Image_ComputeFeatureSetFontSize_0029
     * @tc.desc      ComputeFeature.setFontSize(fontSize=120) yields 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0029 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(120);
      logInfo(`setFontSize(fontSize=120) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(120);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0030
     * @tc.name      Image_ComputeFeatureSetFontSize_0030
     * @tc.desc      ComputeFeature.setFontSize(fontSize=125) yields 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0030 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(125);
      logInfo(`setFontSize(fontSize=125) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(125);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0031
     * @tc.name      Image_ComputeFeatureSetFontSize_0031
     * @tc.desc      ComputeFeature.setFontSize(fontSize=130) yields 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0031 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(130);
      logInfo(`setFontSize(fontSize=130) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(130);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0032
     * @tc.name      Image_ComputeFeatureSetFontSize_0032
     * @tc.desc      ComputeFeature.setFontSize(fontSize=135) yields 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0032 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(135);
      logInfo(`setFontSize(fontSize=135) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(135);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0033
     * @tc.name      Image_ComputeFeatureSetFontSize_0033
     * @tc.desc      ComputeFeature.setFontSize(fontSize=140) yields 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0033 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(140);
      logInfo(`setFontSize(fontSize=140) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(140);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0034
     * @tc.name      Image_ComputeFeatureSetFontSize_0034
     * @tc.desc      ComputeFeature.setFontSize(fontSize=145) yields 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0034 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(145);
      logInfo(`setFontSize(fontSize=145) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(145);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0035
     * @tc.name      Image_ComputeFeatureSetFontSize_0035
     * @tc.desc      ComputeFeature.setFontSize(fontSize=150) yields 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0035 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(150);
      logInfo(`setFontSize(fontSize=150) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(150);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0036
     * @tc.name      Image_ComputeFeatureSetFontSize_0036
     * @tc.desc      ComputeFeature.setFontSize(fontSize=155) yields 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0036 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(155);
      logInfo(`setFontSize(fontSize=155) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(155);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0037
     * @tc.name      Image_ComputeFeatureSetFontSize_0037
     * @tc.desc      ComputeFeature.setFontSize(fontSize=160) yields 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0037 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(160);
      logInfo(`setFontSize(fontSize=160) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(160);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0038
     * @tc.name      Image_ComputeFeatureSetFontSize_0038
     * @tc.desc      ComputeFeature.setFontSize(fontSize=165) yields 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0038 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(165);
      logInfo(`setFontSize(fontSize=165) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(165);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0039
     * @tc.name      Image_ComputeFeatureSetFontSize_0039
     * @tc.desc      ComputeFeature.setFontSize(fontSize=170) yields 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0039 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(170);
      logInfo(`setFontSize(fontSize=170) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(170);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0040
     * @tc.name      Image_ComputeFeatureSetFontSize_0040
     * @tc.desc      ComputeFeature.setFontSize(fontSize=175) yields 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0040 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(175);
      logInfo(`setFontSize(fontSize=175) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(175);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0041
     * @tc.name      Image_ComputeFeatureSetFontSize_0041
     * @tc.desc      ComputeFeature.setFontSize(fontSize=180) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0041 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(180);
      logInfo(`setFontSize(fontSize=180) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(180);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0042
     * @tc.name      Image_ComputeFeatureSetFontSize_0042
     * @tc.desc      ComputeFeature.setFontSize(fontSize=185) yields 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0042 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(185);
      logInfo(`setFontSize(fontSize=185) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(185);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0043
     * @tc.name      Image_ComputeFeatureSetFontSize_0043
     * @tc.desc      ComputeFeature.setFontSize(fontSize=190) yields 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0043 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(190);
      logInfo(`setFontSize(fontSize=190) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(190);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0044
     * @tc.name      Image_ComputeFeatureSetFontSize_0044
     * @tc.desc      ComputeFeature.setFontSize(fontSize=195) yields 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0044 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(195);
      logInfo(`setFontSize(fontSize=195) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(195);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0045
     * @tc.name      Image_ComputeFeatureSetFontSize_0045
     * @tc.desc      ComputeFeature.setFontSize(fontSize=200) yields 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0045 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(200);
      logInfo(`setFontSize(fontSize=200) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(200);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0046
     * @tc.name      Image_ComputeFeatureSetFontSize_0046
     * @tc.desc      ComputeFeature.setFontSize(fontSize=171) yields 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0046 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(171);
      logInfo(`setFontSize(fontSize=171) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(171);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0047
     * @tc.name      Image_ComputeFeatureSetFontSize_0047
     * @tc.desc      ComputeFeature.setFontSize(fontSize=136) yields 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0047 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(136);
      logInfo(`setFontSize(fontSize=136) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(136);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0048
     * @tc.name      Image_ComputeFeatureSetFontSize_0048
     * @tc.desc      ComputeFeature.setFontSize(fontSize=53) yields 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0048 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(53);
      logInfo(`setFontSize(fontSize=53) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(53);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0049
     * @tc.name      Image_ComputeFeatureSetFontSize_0049
     * @tc.desc      ComputeFeature.setFontSize(fontSize=88.26) yields 88.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0049 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(88.26);
      logInfo(`setFontSize(fontSize=88.26) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(88.26, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0050
     * @tc.name      Image_ComputeFeatureSetFontSize_0050
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-33) yields -33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0050 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-33);
      logInfo(`setFontSize(fontSize=-33) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-33);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0051
     * @tc.name      Image_ComputeFeatureSetFontSize_0051
     * @tc.desc      ComputeFeature.setFontSize(fontSize=6) yields 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0051 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(6);
      logInfo(`setFontSize(fontSize=6) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0052
     * @tc.name      Image_ComputeFeatureSetFontSize_0052
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-46) yields -46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0052 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-46);
      logInfo(`setFontSize(fontSize=-46) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-46);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0053
     * @tc.name      Image_ComputeFeatureSetFontSize_0053
     * @tc.desc      ComputeFeature.setFontSize(fontSize=82.21) yields 82.21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0053 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(82.21);
      logInfo(`setFontSize(fontSize=82.21) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(82.21, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0054
     * @tc.name      Image_ComputeFeatureSetFontSize_0054
     * @tc.desc      ComputeFeature.setFontSize(fontSize=23) yields 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0054 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(23);
      logInfo(`setFontSize(fontSize=23) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(23);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0055
     * @tc.name      Image_ComputeFeatureSetFontSize_0055
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-12) yields -12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0055 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-12);
      logInfo(`setFontSize(fontSize=-12) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-12);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0056
     * @tc.name      Image_ComputeFeatureSetFontSize_0056
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-18) yields -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0056 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-18);
      logInfo(`setFontSize(fontSize=-18) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-18);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0057
     * @tc.name      Image_ComputeFeatureSetFontSize_0057
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-49) yields -49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0057 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-49);
      logInfo(`setFontSize(fontSize=-49) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-49);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0058
     * @tc.name      Image_ComputeFeatureSetFontSize_0058
     * @tc.desc      ComputeFeature.setFontSize(fontSize=43) yields 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0058 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(43);
      logInfo(`setFontSize(fontSize=43) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(43);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0059
     * @tc.name      Image_ComputeFeatureSetFontSize_0059
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-20) yields -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0059 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-20);
      logInfo(`setFontSize(fontSize=-20) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-20);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0060
     * @tc.name      Image_ComputeFeatureSetFontSize_0060
     * @tc.desc      ComputeFeature.setFontSize(fontSize=49) yields 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0060 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(49);
      logInfo(`setFontSize(fontSize=49) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(49);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0061
     * @tc.name      Image_ComputeFeatureSetFontSize_0061
     * @tc.desc      ComputeFeature.setFontSize(fontSize=45.7) yields 45.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0061 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(45.7);
      logInfo(`setFontSize(fontSize=45.7) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(45.7, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0062
     * @tc.name      Image_ComputeFeatureSetFontSize_0062
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-11) yields -11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0062 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-11);
      logInfo(`setFontSize(fontSize=-11) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-11);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0063
     * @tc.name      Image_ComputeFeatureSetFontSize_0063
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-9) yields -9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0063 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-9);
      logInfo(`setFontSize(fontSize=-9) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-9);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0064
     * @tc.name      Image_ComputeFeatureSetFontSize_0064
     * @tc.desc      ComputeFeature.setFontSize(fontSize=199) yields 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0064 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(199);
      logInfo(`setFontSize(fontSize=199) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(199);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0065
     * @tc.name      Image_ComputeFeatureSetFontSize_0065
     * @tc.desc      ComputeFeature.setFontSize(fontSize=144) yields 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0065 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(144);
      logInfo(`setFontSize(fontSize=144) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(144);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0066
     * @tc.name      Image_ComputeFeatureSetFontSize_0066
     * @tc.desc      ComputeFeature.setFontSize(fontSize=133) yields 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0066 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(133);
      logInfo(`setFontSize(fontSize=133) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(133);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0067
     * @tc.name      Image_ComputeFeatureSetFontSize_0067
     * @tc.desc      ComputeFeature.setFontSize(fontSize=98.42) yields 98.42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0067 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(98.42);
      logInfo(`setFontSize(fontSize=98.42) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(98.42, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0068
     * @tc.name      Image_ComputeFeatureSetFontSize_0068
     * @tc.desc      ComputeFeature.setFontSize(fontSize=3.3) yields 3.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0068 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(3.3);
      logInfo(`setFontSize(fontSize=3.3) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(3.3, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0069
     * @tc.name      Image_ComputeFeatureSetFontSize_0069
     * @tc.desc      ComputeFeature.setFontSize(fontSize=18) yields 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0069 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(18);
      logInfo(`setFontSize(fontSize=18) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(18);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0070
     * @tc.name      Image_ComputeFeatureSetFontSize_0070
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-83) yields -83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0070 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-83);
      logInfo(`setFontSize(fontSize=-83) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-83);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0071
     * @tc.name      Image_ComputeFeatureSetFontSize_0071
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-15) yields -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0071 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-15);
      logInfo(`setFontSize(fontSize=-15) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-15);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0072
     * @tc.name      Image_ComputeFeatureSetFontSize_0072
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-82) yields -82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0072 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-82);
      logInfo(`setFontSize(fontSize=-82) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-82);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0073
     * @tc.name      Image_ComputeFeatureSetFontSize_0073
     * @tc.desc      ComputeFeature.setFontSize(fontSize=97) yields 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0073 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(97);
      logInfo(`setFontSize(fontSize=97) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(97);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0074
     * @tc.name      Image_ComputeFeatureSetFontSize_0074
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-31) yields -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0074 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-31);
      logInfo(`setFontSize(fontSize=-31) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-31);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0075
     * @tc.name      Image_ComputeFeatureSetFontSize_0075
     * @tc.desc      ComputeFeature.setFontSize(fontSize=197) yields 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0075 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(197);
      logInfo(`setFontSize(fontSize=197) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(197);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0076
     * @tc.name      Image_ComputeFeatureSetFontSize_0076
     * @tc.desc      ComputeFeature.setFontSize(fontSize=71.57) yields 71.57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0076 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(71.57);
      logInfo(`setFontSize(fontSize=71.57) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(71.57, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0077
     * @tc.name      Image_ComputeFeatureSetFontSize_0077
     * @tc.desc      ComputeFeature.setFontSize(fontSize=173) yields 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0077 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(173);
      logInfo(`setFontSize(fontSize=173) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(173);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0078
     * @tc.name      Image_ComputeFeatureSetFontSize_0078
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-97) yields -97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0078 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-97);
      logInfo(`setFontSize(fontSize=-97) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-97);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0079
     * @tc.name      Image_ComputeFeatureSetFontSize_0079
     * @tc.desc      ComputeFeature.setFontSize(fontSize=24) yields 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0079 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(24);
      logInfo(`setFontSize(fontSize=24) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(24);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0080
     * @tc.name      Image_ComputeFeatureSetFontSize_0080
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-36) yields -36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0080 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-36);
      logInfo(`setFontSize(fontSize=-36) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-36);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0081
     * @tc.name      Image_ComputeFeatureSetFontSize_0081
     * @tc.desc      ComputeFeature.setFontSize(fontSize=42) yields 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0081 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(42);
      logInfo(`setFontSize(fontSize=42) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(42);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0082
     * @tc.name      Image_ComputeFeatureSetFontSize_0082
     * @tc.desc      ComputeFeature.setFontSize(fontSize=-16) yields -16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetFontSize_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0082 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-16);
      logInfo(`setFontSize(fontSize=-16) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-16);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0083
     * @tc.name      Image_ComputeFeatureSetFontSize_0083
     * @tc.desc      ComputeFeature.setFontSize(fontSize=183) yields 183
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0083 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(183);
      logInfo(`setFontSize(fontSize=183) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(183);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0084
     * @tc.name      Image_ComputeFeatureSetFontSize_0084
     * @tc.desc      ComputeFeature.setFontSize(fontSize=22.55) yields 22.55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0084 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(22.55);
      logInfo(`setFontSize(fontSize=22.55) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(22.55, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0085
     * @tc.name      Image_ComputeFeatureSetFontSize_0085
     * @tc.desc      ComputeFeature.setFontSize(fontSize=17) yields 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0085 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(17);
      logInfo(`setFontSize(fontSize=17) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(17);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0086
     * @tc.name      Image_ComputeFeatureSetFontSize_0086
     * @tc.desc      ComputeFeature.setFontSize(fontSize=96) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0086 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(96);
      logInfo(`setFontSize(fontSize=96) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(96);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0087
     * @tc.name      Image_ComputeFeatureSetFontSize_0087
     * @tc.desc      ComputeFeature.setFontSize(fontSize=174) yields 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0087 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(174);
      logInfo(`setFontSize(fontSize=174) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(174);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0088
     * @tc.name      Image_ComputeFeatureSetFontSize_0088
     * @tc.desc      ComputeFeature.setFontSize(fontSize=27) yields 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0088 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(27);
      logInfo(`setFontSize(fontSize=27) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(27);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0089
     * @tc.name      Image_ComputeFeatureSetFontSize_0089
     * @tc.desc      ComputeFeature.setFontSize(fontSize=123) yields 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0089 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(123);
      logInfo(`setFontSize(fontSize=123) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(123);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_FONT_SIZE_0090
     * @tc.name      Image_ComputeFeatureSetFontSize_0090
     * @tc.desc      ComputeFeature.setFontSize(fontSize=37.4) yields 37.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetFontSize_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0090 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(37.4);
      logInfo(`setFontSize(fontSize=37.4) state: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(37.4, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetFontSize_0090 end`);
    });
  });
}
