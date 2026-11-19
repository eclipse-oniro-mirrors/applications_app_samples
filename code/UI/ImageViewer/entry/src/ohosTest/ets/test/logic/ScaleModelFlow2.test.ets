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
import { ScaleModel } from '../../../../main/ets/model/ScaleModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ScaleModel flow (58 cases). */
export default function scaleModelFlow2Test(): void {
  describe('ScaleModelFlow2Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0064
     * @tc.name      ImageViewer_ScaleModelFlow_0064
     * @tc.desc      ScaleModel call flow toString > toString > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0064 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>toString>toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0065
     * @tc.name      ImageViewer_ScaleModelFlow_0065
     * @tc.desc      ScaleModel call flow toString > stash > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0065 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.reset();
      logInfo(`toString>stash>toString>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>toString>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0066
     * @tc.name      ImageViewer_ScaleModelFlow_0066
     * @tc.desc      ScaleModel call flow toString > reset > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0066 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0067
     * @tc.name      ImageViewer_ScaleModelFlow_0067
     * @tc.desc      ScaleModel call flow toString > toString > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0067 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>toString>toString>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>toString>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0068
     * @tc.name      ImageViewer_ScaleModelFlow_0068
     * @tc.desc      ScaleModel call flow toString > stash > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0068 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>stash>stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0069
     * @tc.name      ImageViewer_ScaleModelFlow_0069
     * @tc.desc      ScaleModel call flow stash > toString > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0069 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`stash>toString>toString>toString>toString...: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0070
     * @tc.name      ImageViewer_ScaleModelFlow_0070
     * @tc.desc      ScaleModel call flow toString > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0070 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0071
     * @tc.name      ImageViewer_ScaleModelFlow_0071
     * @tc.desc      ScaleModel call flow toString > toString > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0071 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      subject.reset();
      logInfo(`toString>toString>toString>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>toString>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0072
     * @tc.name      ImageViewer_ScaleModelFlow_0072
     * @tc.desc      ScaleModel call flow toString > toString > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0072 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>toString>reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0073
     * @tc.name      ImageViewer_ScaleModelFlow_0073
     * @tc.desc      ScaleModel call flow toString > stash > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0073 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0074
     * @tc.name      ImageViewer_ScaleModelFlow_0074
     * @tc.desc      ScaleModel call flow toString > toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0074 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0075
     * @tc.name      ImageViewer_ScaleModelFlow_0075
     * @tc.desc      ScaleModel call flow stash > stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0075 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`stash>stash>stash>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0076
     * @tc.name      ImageViewer_ScaleModelFlow_0076
     * @tc.desc      ScaleModel call flow toString > stash > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0076 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.reset();
      subject.reset();
      logInfo(`toString>stash>toString>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>toString>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0077
     * @tc.name      ImageViewer_ScaleModelFlow_0077
     * @tc.desc      ScaleModel call flow stash > stash > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0077 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.reset();
      subject.stash();
      logInfo(`stash>stash>toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0078
     * @tc.name      ImageViewer_ScaleModelFlow_0078
     * @tc.desc      ScaleModel call flow stash > toString > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0078 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      subject.reset();
      logInfo(`stash>toString>toString>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>toString>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0079
     * @tc.name      ImageViewer_ScaleModelFlow_0079
     * @tc.desc      ScaleModel call flow stash > toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0079 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`stash>toString>toString>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>toString>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0080
     * @tc.name      ImageViewer_ScaleModelFlow_0080
     * @tc.desc      ScaleModel call flow toString > stash > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0080 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.stash();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`toString>stash>stash>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0081
     * @tc.name      ImageViewer_ScaleModelFlow_0081
     * @tc.desc      ScaleModel call flow toString > stash > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0081 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>stash>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0082
     * @tc.name      ImageViewer_ScaleModelFlow_0082
     * @tc.desc      ScaleModel call flow stash > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0082 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0083
     * @tc.name      ImageViewer_ScaleModelFlow_0083
     * @tc.desc      ScaleModel call flow stash > toString > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0083 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>toString>stash>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>stash>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0084
     * @tc.name      ImageViewer_ScaleModelFlow_0084
     * @tc.desc      ScaleModel call flow toString > stash > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0084 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      subject.stash();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`toString>stash>stash>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0085
     * @tc.name      ImageViewer_ScaleModelFlow_0085
     * @tc.desc      ScaleModel call flow stash > stash > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0085 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>toString>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>toString>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0086
     * @tc.name      ImageViewer_ScaleModelFlow_0086
     * @tc.desc      ScaleModel call flow stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0086 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`stash>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0087
     * @tc.name      ImageViewer_ScaleModelFlow_0087
     * @tc.desc      ScaleModel call flow stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0087 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`stash>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0088
     * @tc.name      ImageViewer_ScaleModelFlow_0088
     * @tc.desc      ScaleModel call flow stash > stash > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0088 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`stash>stash>stash>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>stash>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0089
     * @tc.name      ImageViewer_ScaleModelFlow_0089
     * @tc.desc      ScaleModel call flow toString > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0089 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0090
     * @tc.name      ImageViewer_ScaleModelFlow_0090
     * @tc.desc      ScaleModel call flow toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0090 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0091
     * @tc.name      ImageViewer_ScaleModelFlow_0091
     * @tc.desc      ScaleModel call flow stash > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0091 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`stash>stash>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0092
     * @tc.name      ImageViewer_ScaleModelFlow_0092
     * @tc.desc      ScaleModel call flow toString > toString > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0092 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>toString>toString>reset>toString...: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>toString>reset>toString...: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0093
     * @tc.name      ImageViewer_ScaleModelFlow_0093
     * @tc.desc      ScaleModel call flow toString > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0093 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      logInfo(`toString>toString>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0094
     * @tc.name      ImageViewer_ScaleModelFlow_0094
     * @tc.desc      ScaleModel call flow toString > reset > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0094 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0095
     * @tc.name      ImageViewer_ScaleModelFlow_0095
     * @tc.desc      ScaleModel call flow stash > stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0095 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0096
     * @tc.name      ImageViewer_ScaleModelFlow_0096
     * @tc.desc      ScaleModel call flow toString > toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0096 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`toString>toString>toString>stash>toString...: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0097
     * @tc.name      ImageViewer_ScaleModelFlow_0097
     * @tc.desc      ScaleModel call flow toString > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0097 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0098
     * @tc.name      ImageViewer_ScaleModelFlow_0098
     * @tc.desc      ScaleModel call flow toString > toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0098 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      logInfo(`toString>toString>toString>toString>reset...: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>toString>toString>reset...: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0099
     * @tc.name      ImageViewer_ScaleModelFlow_0099
     * @tc.desc      ScaleModel call flow stash > toString > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0099 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.reset();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>toString>reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0100
     * @tc.name      ImageViewer_ScaleModelFlow_0100
     * @tc.desc      ScaleModel call flow stash > toString > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0100 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`stash>toString>toString>toString>toString...: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0101
     * @tc.name      ImageViewer_ScaleModelFlow_0101
     * @tc.desc      ScaleModel call flow toString > stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0101 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`toString>stash>stash>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0102
     * @tc.name      ImageViewer_ScaleModelFlow_0102
     * @tc.desc      ScaleModel call flow toString > toString > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0102 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>toString>toString>reset>toString...: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>toString>reset>toString...: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0103
     * @tc.name      ImageViewer_ScaleModelFlow_0103
     * @tc.desc      ScaleModel call flow toString > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0103 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`toString>stash>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0104
     * @tc.name      ImageViewer_ScaleModelFlow_0104
     * @tc.desc      ScaleModel call flow stash > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0104 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`stash>toString>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0105
     * @tc.name      ImageViewer_ScaleModelFlow_0105
     * @tc.desc      ScaleModel call flow stash > reset > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0105 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>reset>toString>toString>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>toString>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0106
     * @tc.name      ImageViewer_ScaleModelFlow_0106
     * @tc.desc      ScaleModel call flow toString > stash > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0106 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.reset();
      subject.stash();
      logInfo(`toString>stash>toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0107
     * @tc.name      ImageViewer_ScaleModelFlow_0107
     * @tc.desc      ScaleModel call flow toString > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0107 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`toString>stash>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0108
     * @tc.name      ImageViewer_ScaleModelFlow_0108
     * @tc.desc      ScaleModel call flow stash > stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0108 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0109
     * @tc.name      ImageViewer_ScaleModelFlow_0109
     * @tc.desc      ScaleModel call flow toString > toString > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0109 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>toString>reset>stash>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0110
     * @tc.name      ImageViewer_ScaleModelFlow_0110
     * @tc.desc      ScaleModel call flow reset > toString > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0110 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0111
     * @tc.name      ImageViewer_ScaleModelFlow_0111
     * @tc.desc      ScaleModel call flow stash > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0111 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0112
     * @tc.name      ImageViewer_ScaleModelFlow_0112
     * @tc.desc      ScaleModel call flow stash > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0112 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`stash>stash>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0113
     * @tc.name      ImageViewer_ScaleModelFlow_0113
     * @tc.desc      ScaleModel call flow toString > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0113 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0114
     * @tc.name      ImageViewer_ScaleModelFlow_0114
     * @tc.desc      ScaleModel call flow stash > toString > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0114 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.stash();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`stash>toString>stash>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0115
     * @tc.name      ImageViewer_ScaleModelFlow_0115
     * @tc.desc      ScaleModel call flow toString > toString > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0115 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0116
     * @tc.name      ImageViewer_ScaleModelFlow_0116
     * @tc.desc      ScaleModel call flow toString > stash > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0116 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.stash();
      logInfo(`toString>stash>toString>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0117
     * @tc.name      ImageViewer_ScaleModelFlow_0117
     * @tc.desc      ScaleModel call flow toString > reset > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0117 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>toString>toString>toString...: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString>toString>toString...: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0118
     * @tc.name      ImageViewer_ScaleModelFlow_0118
     * @tc.desc      ScaleModel call flow toString > stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0118 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`toString>stash>toString>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0119
     * @tc.name      ImageViewer_ScaleModelFlow_0119
     * @tc.desc      ScaleModel call flow toString > stash > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0119 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>stash>stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0120
     * @tc.name      ImageViewer_ScaleModelFlow_0120
     * @tc.desc      ScaleModel call flow stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0120 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`stash>toString>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0121
     * @tc.name      ImageViewer_ScaleModelFlow_0121
     * @tc.desc      ScaleModel call flow toString > toString > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0121 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>toString>reset>toString>toString...: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>toString>toString...: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0121 end`);
    });
  });
}
