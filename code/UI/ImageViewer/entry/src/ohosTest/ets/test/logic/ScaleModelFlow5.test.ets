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

/** Logic checks for ScaleModel flow (68 cases). */
export default function scaleModelFlow5Test(): void {
  describe('ScaleModelFlow5Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0250
     * @tc.name      ImageViewer_ScaleModelFlow_0250
     * @tc.desc      ScaleModel call flow toString > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0250 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      logInfo(`toString>reset>toString>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0251
     * @tc.name      ImageViewer_ScaleModelFlow_0251
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0251 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0252
     * @tc.name      ImageViewer_ScaleModelFlow_0252
     * @tc.desc      ScaleModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0252 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0253
     * @tc.name      ImageViewer_ScaleModelFlow_0253
     * @tc.desc      ScaleModel call flow toString > toString > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0253 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0254
     * @tc.name      ImageViewer_ScaleModelFlow_0254
     * @tc.desc      ScaleModel call flow stash > reset > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0254 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>reset>stash>stash>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>stash>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0255
     * @tc.name      ImageViewer_ScaleModelFlow_0255
     * @tc.desc      ScaleModel call flow reset > toString > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0255 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`reset>toString>stash>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>stash>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0256
     * @tc.name      ImageViewer_ScaleModelFlow_0256
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0256 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0257
     * @tc.name      ImageViewer_ScaleModelFlow_0257
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0257 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0258
     * @tc.name      ImageViewer_ScaleModelFlow_0258
     * @tc.desc      ScaleModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0258 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0259
     * @tc.name      ImageViewer_ScaleModelFlow_0259
     * @tc.desc      ScaleModel call flow reset > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0259 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      subject.reset();
      logInfo(`reset>toString>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0260
     * @tc.name      ImageViewer_ScaleModelFlow_0260
     * @tc.desc      ScaleModel call flow stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0260 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.reset();
      logInfo(`stash>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0260 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0261
     * @tc.name      ImageViewer_ScaleModelFlow_0261
     * @tc.desc      ScaleModel call flow stash > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0261 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0262
     * @tc.name      ImageViewer_ScaleModelFlow_0262
     * @tc.desc      ScaleModel call flow toString > toString > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0262 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`toString>toString>reset>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0262 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0263
     * @tc.name      ImageViewer_ScaleModelFlow_0263
     * @tc.desc      ScaleModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0263 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0263 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0264
     * @tc.name      ImageViewer_ScaleModelFlow_0264
     * @tc.desc      ScaleModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0264 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0264 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0265
     * @tc.name      ImageViewer_ScaleModelFlow_0265
     * @tc.desc      ScaleModel call flow reset > stash > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0265 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      subject.reset();
      logInfo(`reset>stash>toString>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>toString>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0265 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0266
     * @tc.name      ImageViewer_ScaleModelFlow_0266
     * @tc.desc      ScaleModel call flow toString > reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0266 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`toString>reset>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0266 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0267
     * @tc.name      ImageViewer_ScaleModelFlow_0267
     * @tc.desc      ScaleModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0267 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0267 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0268
     * @tc.name      ImageViewer_ScaleModelFlow_0268
     * @tc.desc      ScaleModel call flow toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0268 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      logInfo(`toString>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0268 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0269
     * @tc.name      ImageViewer_ScaleModelFlow_0269
     * @tc.desc      ScaleModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0269 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0269 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0270
     * @tc.name      ImageViewer_ScaleModelFlow_0270
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0270 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0270 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0271
     * @tc.name      ImageViewer_ScaleModelFlow_0271
     * @tc.desc      ScaleModel call flow stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0271 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0271 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0272
     * @tc.name      ImageViewer_ScaleModelFlow_0272
     * @tc.desc      ScaleModel call flow stash > reset > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0272 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`stash>reset>toString>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>toString>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0272 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0273
     * @tc.name      ImageViewer_ScaleModelFlow_0273
     * @tc.desc      ScaleModel call flow toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0273 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0273 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0274
     * @tc.name      ImageViewer_ScaleModelFlow_0274
     * @tc.desc      ScaleModel call flow stash > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0274 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>reset>toString>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0274 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0275
     * @tc.name      ImageViewer_ScaleModelFlow_0275
     * @tc.desc      ScaleModel call flow reset > toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0275 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`reset>toString>toString>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>toString>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0275 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0276
     * @tc.name      ImageViewer_ScaleModelFlow_0276
     * @tc.desc      ScaleModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0276 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0276 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0277
     * @tc.name      ImageViewer_ScaleModelFlow_0277
     * @tc.desc      ScaleModel call flow toString > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0277 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>toString>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0277 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0278
     * @tc.name      ImageViewer_ScaleModelFlow_0278
     * @tc.desc      ScaleModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0278 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0278 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0279
     * @tc.name      ImageViewer_ScaleModelFlow_0279
     * @tc.desc      ScaleModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0279 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0279 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0280
     * @tc.name      ImageViewer_ScaleModelFlow_0280
     * @tc.desc      ScaleModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0280 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0280 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0281
     * @tc.name      ImageViewer_ScaleModelFlow_0281
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0281 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0281 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0282
     * @tc.name      ImageViewer_ScaleModelFlow_0282
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0282 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0282 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0283
     * @tc.name      ImageViewer_ScaleModelFlow_0283
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0283 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0283 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0284
     * @tc.name      ImageViewer_ScaleModelFlow_0284
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0284 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0284 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0285
     * @tc.name      ImageViewer_ScaleModelFlow_0285
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0285 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0285 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0286
     * @tc.name      ImageViewer_ScaleModelFlow_0286
     * @tc.desc      ScaleModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0286 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0286 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0287
     * @tc.name      ImageViewer_ScaleModelFlow_0287
     * @tc.desc      ScaleModel call flow stash > reset > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0287 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`stash>reset>reset>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>reset>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0287 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0288
     * @tc.name      ImageViewer_ScaleModelFlow_0288
     * @tc.desc      ScaleModel call flow reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0288 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>stash>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0288 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0289
     * @tc.name      ImageViewer_ScaleModelFlow_0289
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0289 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0289 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0290
     * @tc.name      ImageViewer_ScaleModelFlow_0290
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0290 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0290 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0291
     * @tc.name      ImageViewer_ScaleModelFlow_0291
     * @tc.desc      ScaleModel call flow reset > toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0291 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      subject.stash();
      logInfo(`reset>toString>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0291 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0292
     * @tc.name      ImageViewer_ScaleModelFlow_0292
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0292 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0292 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0293
     * @tc.name      ImageViewer_ScaleModelFlow_0293
     * @tc.desc      ScaleModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0293 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0293 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0294
     * @tc.name      ImageViewer_ScaleModelFlow_0294
     * @tc.desc      ScaleModel call flow toString > reset > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0294 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`toString>reset>stash>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>stash>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0294 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0295
     * @tc.name      ImageViewer_ScaleModelFlow_0295
     * @tc.desc      ScaleModel call flow stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0295 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0295 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0296
     * @tc.name      ImageViewer_ScaleModelFlow_0296
     * @tc.desc      ScaleModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0296 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0296 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0297
     * @tc.name      ImageViewer_ScaleModelFlow_0297
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0297 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0297 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0298
     * @tc.name      ImageViewer_ScaleModelFlow_0298
     * @tc.desc      ScaleModel call flow reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0298 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0298 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0299
     * @tc.name      ImageViewer_ScaleModelFlow_0299
     * @tc.desc      ScaleModel call flow stash > stash > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0299 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>stash>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>stash>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0299 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0300
     * @tc.name      ImageViewer_ScaleModelFlow_0300
     * @tc.desc      ScaleModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0300 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0300 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0301
     * @tc.name      ImageViewer_ScaleModelFlow_0301
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0301 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0301 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0302
     * @tc.name      ImageViewer_ScaleModelFlow_0302
     * @tc.desc      ScaleModel call flow stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0302 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0302 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0303
     * @tc.name      ImageViewer_ScaleModelFlow_0303
     * @tc.desc      ScaleModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0303 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0303 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0304
     * @tc.name      ImageViewer_ScaleModelFlow_0304
     * @tc.desc      ScaleModel call flow reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0304 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0304 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0305
     * @tc.name      ImageViewer_ScaleModelFlow_0305
     * @tc.desc      ScaleModel call flow stash > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0305 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`stash>reset>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0305 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0306
     * @tc.name      ImageViewer_ScaleModelFlow_0306
     * @tc.desc      ScaleModel call flow stash > reset > toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0306 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      subject.stash();
      logInfo(`stash>reset>toString>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>toString>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0306 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0307
     * @tc.name      ImageViewer_ScaleModelFlow_0307
     * @tc.desc      ScaleModel call flow toString > reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0307 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`toString>reset>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0307 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0308
     * @tc.name      ImageViewer_ScaleModelFlow_0308
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0308 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0308 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0309
     * @tc.name      ImageViewer_ScaleModelFlow_0309
     * @tc.desc      ScaleModel call flow reset > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0309 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0309 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0310
     * @tc.name      ImageViewer_ScaleModelFlow_0310
     * @tc.desc      ScaleModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0310 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0310 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0311
     * @tc.name      ImageViewer_ScaleModelFlow_0311
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0311 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0311 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0312
     * @tc.name      ImageViewer_ScaleModelFlow_0312
     * @tc.desc      ScaleModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0312 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0312 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0313
     * @tc.name      ImageViewer_ScaleModelFlow_0313
     * @tc.desc      ScaleModel call flow stash > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0313 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`stash>reset>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0314
     * @tc.name      ImageViewer_ScaleModelFlow_0314
     * @tc.desc      ScaleModel call flow reset > stash > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0314 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`reset>stash>stash>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>stash>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0314 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0315
     * @tc.name      ImageViewer_ScaleModelFlow_0315
     * @tc.desc      ScaleModel call flow reset > stash > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0315 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      subject.reset();
      logInfo(`reset>stash>toString>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>toString>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0315 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0316
     * @tc.name      ImageViewer_ScaleModelFlow_0316
     * @tc.desc      ScaleModel call flow reset > toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0316 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`reset>toString>toString>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>toString>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0316 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0317
     * @tc.name      ImageViewer_ScaleModelFlow_0317
     * @tc.desc      ScaleModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0317 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0317 end`);
    });
  });
}
