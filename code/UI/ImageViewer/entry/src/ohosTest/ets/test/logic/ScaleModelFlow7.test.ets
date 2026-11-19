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
export default function scaleModelFlow7Test(): void {
  describe('ScaleModelFlow7Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0385
     * @tc.name      ImageViewer_ScaleModelFlow_0385
     * @tc.desc      ScaleModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0385 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0385 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0386
     * @tc.name      ImageViewer_ScaleModelFlow_0386
     * @tc.desc      ScaleModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0386 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0386 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0387
     * @tc.name      ImageViewer_ScaleModelFlow_0387
     * @tc.desc      ScaleModel call flow reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0387 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`reset>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0387 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0388
     * @tc.name      ImageViewer_ScaleModelFlow_0388
     * @tc.desc      ScaleModel call flow toString > stash > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0388 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`toString>stash>reset>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0388 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0389
     * @tc.name      ImageViewer_ScaleModelFlow_0389
     * @tc.desc      ScaleModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0389 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0389 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0390
     * @tc.name      ImageViewer_ScaleModelFlow_0390
     * @tc.desc      ScaleModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0390 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0390 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0391
     * @tc.name      ImageViewer_ScaleModelFlow_0391
     * @tc.desc      ScaleModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0391 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0391 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0392
     * @tc.name      ImageViewer_ScaleModelFlow_0392
     * @tc.desc      ScaleModel call flow stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0392 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`stash>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0392 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0393
     * @tc.name      ImageViewer_ScaleModelFlow_0393
     * @tc.desc      ScaleModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0393 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0393 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0394
     * @tc.name      ImageViewer_ScaleModelFlow_0394
     * @tc.desc      ScaleModel call flow toString > toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0394 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0394 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0395
     * @tc.name      ImageViewer_ScaleModelFlow_0395
     * @tc.desc      ScaleModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0395 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0395 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0396
     * @tc.name      ImageViewer_ScaleModelFlow_0396
     * @tc.desc      ScaleModel call flow toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0396 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`toString>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0396 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0397
     * @tc.name      ImageViewer_ScaleModelFlow_0397
     * @tc.desc      ScaleModel call flow toString > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0397 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      subject.reset();
      logInfo(`toString>toString>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0397 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0398
     * @tc.name      ImageViewer_ScaleModelFlow_0398
     * @tc.desc      ScaleModel call flow toString > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0398 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0398 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0399
     * @tc.name      ImageViewer_ScaleModelFlow_0399
     * @tc.desc      ScaleModel call flow stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0399 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0399 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0400
     * @tc.name      ImageViewer_ScaleModelFlow_0400
     * @tc.desc      ScaleModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0400 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0400 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0401
     * @tc.name      ImageViewer_ScaleModelFlow_0401
     * @tc.desc      ScaleModel call flow stash > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0401 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.reset();
      logInfo(`stash>stash>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0401 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0402
     * @tc.name      ImageViewer_ScaleModelFlow_0402
     * @tc.desc      ScaleModel call flow reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0402 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0402 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0403
     * @tc.name      ImageViewer_ScaleModelFlow_0403
     * @tc.desc      ScaleModel call flow reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0403 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0403 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0404
     * @tc.name      ImageViewer_ScaleModelFlow_0404
     * @tc.desc      ScaleModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0404 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0404 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0405
     * @tc.name      ImageViewer_ScaleModelFlow_0405
     * @tc.desc      ScaleModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0405 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0405 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0406
     * @tc.name      ImageViewer_ScaleModelFlow_0406
     * @tc.desc      ScaleModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0406 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0406 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0407
     * @tc.name      ImageViewer_ScaleModelFlow_0407
     * @tc.desc      ScaleModel call flow reset > stash > stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0407 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      logInfo(`reset>stash>stash>toString>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>stash>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0407 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0408
     * @tc.name      ImageViewer_ScaleModelFlow_0408
     * @tc.desc      ScaleModel call flow reset > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0408 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0408 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0409
     * @tc.name      ImageViewer_ScaleModelFlow_0409
     * @tc.desc      ScaleModel call flow reset > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0409 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0409 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0410
     * @tc.name      ImageViewer_ScaleModelFlow_0410
     * @tc.desc      ScaleModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0410 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0410 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0411
     * @tc.name      ImageViewer_ScaleModelFlow_0411
     * @tc.desc      ScaleModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0411 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0411 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0412
     * @tc.name      ImageViewer_ScaleModelFlow_0412
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0412 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0412 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0413
     * @tc.name      ImageViewer_ScaleModelFlow_0413
     * @tc.desc      ScaleModel call flow reset > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0413 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      subject.stash();
      logInfo(`reset>toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0413 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0414
     * @tc.name      ImageViewer_ScaleModelFlow_0414
     * @tc.desc      ScaleModel call flow toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0414 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0414 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0415
     * @tc.name      ImageViewer_ScaleModelFlow_0415
     * @tc.desc      ScaleModel call flow toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0415 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.reset();
      logInfo(`toString>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0415 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0416
     * @tc.name      ImageViewer_ScaleModelFlow_0416
     * @tc.desc      ScaleModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0416 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0416 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0417
     * @tc.name      ImageViewer_ScaleModelFlow_0417
     * @tc.desc      ScaleModel call flow toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0417 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0417 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0418
     * @tc.name      ImageViewer_ScaleModelFlow_0418
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0418 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0418 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0419
     * @tc.name      ImageViewer_ScaleModelFlow_0419
     * @tc.desc      ScaleModel call flow reset > reset > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0419 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`reset>reset>stash>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>stash>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0419 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0420
     * @tc.name      ImageViewer_ScaleModelFlow_0420
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0420 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0420 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0421
     * @tc.name      ImageViewer_ScaleModelFlow_0421
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0421 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0421 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0422
     * @tc.name      ImageViewer_ScaleModelFlow_0422
     * @tc.desc      ScaleModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0422 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0422 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0423
     * @tc.name      ImageViewer_ScaleModelFlow_0423
     * @tc.desc      ScaleModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0423 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0423 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0424
     * @tc.name      ImageViewer_ScaleModelFlow_0424
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0424 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0424 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0425
     * @tc.name      ImageViewer_ScaleModelFlow_0425
     * @tc.desc      ScaleModel call flow toString > toString > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0425 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`toString>toString>stash>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>stash>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0425 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0426
     * @tc.name      ImageViewer_ScaleModelFlow_0426
     * @tc.desc      ScaleModel call flow reset > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0426 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`reset>stash>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0426 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0427
     * @tc.name      ImageViewer_ScaleModelFlow_0427
     * @tc.desc      ScaleModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0427 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0427 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0428
     * @tc.name      ImageViewer_ScaleModelFlow_0428
     * @tc.desc      ScaleModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0428 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0428 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0429
     * @tc.name      ImageViewer_ScaleModelFlow_0429
     * @tc.desc      ScaleModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0429 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0429 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0430
     * @tc.name      ImageViewer_ScaleModelFlow_0430
     * @tc.desc      ScaleModel call flow stash > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0430 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      logInfo(`stash>reset>toString>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0430 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0431
     * @tc.name      ImageViewer_ScaleModelFlow_0431
     * @tc.desc      ScaleModel call flow reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0431 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      logInfo(`reset>toString>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0431 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0432
     * @tc.name      ImageViewer_ScaleModelFlow_0432
     * @tc.desc      ScaleModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0432 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0432 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0433
     * @tc.name      ImageViewer_ScaleModelFlow_0433
     * @tc.desc      ScaleModel call flow stash > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0433 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.stash();
      logInfo(`stash>toString>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0433 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0434
     * @tc.name      ImageViewer_ScaleModelFlow_0434
     * @tc.desc      ScaleModel call flow reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0434 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0434 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0435
     * @tc.name      ImageViewer_ScaleModelFlow_0435
     * @tc.desc      ScaleModel call flow toString > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0435 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`toString>reset>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0435 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0436
     * @tc.name      ImageViewer_ScaleModelFlow_0436
     * @tc.desc      ScaleModel call flow stash > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0436 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0436 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0437
     * @tc.name      ImageViewer_ScaleModelFlow_0437
     * @tc.desc      ScaleModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0437 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0437 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0438
     * @tc.name      ImageViewer_ScaleModelFlow_0438
     * @tc.desc      ScaleModel call flow toString > toString > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0438 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>toString>stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0438 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0439
     * @tc.name      ImageViewer_ScaleModelFlow_0439
     * @tc.desc      ScaleModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0439 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0439 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0440
     * @tc.name      ImageViewer_ScaleModelFlow_0440
     * @tc.desc      ScaleModel call flow reset > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0440 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`reset>toString>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0440 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0441
     * @tc.name      ImageViewer_ScaleModelFlow_0441
     * @tc.desc      ScaleModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0441 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0441 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0442
     * @tc.name      ImageViewer_ScaleModelFlow_0442
     * @tc.desc      ScaleModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0442 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0442 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0443
     * @tc.name      ImageViewer_ScaleModelFlow_0443
     * @tc.desc      ScaleModel call flow reset > toString > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0443 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>toString>reset>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>reset>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0443 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0444
     * @tc.name      ImageViewer_ScaleModelFlow_0444
     * @tc.desc      ScaleModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0444 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0444 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0445
     * @tc.name      ImageViewer_ScaleModelFlow_0445
     * @tc.desc      ScaleModel call flow reset > stash > stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0445 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      logInfo(`reset>stash>stash>toString>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>stash>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0445 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0446
     * @tc.name      ImageViewer_ScaleModelFlow_0446
     * @tc.desc      ScaleModel call flow toString > reset > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0446 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0446 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0447
     * @tc.name      ImageViewer_ScaleModelFlow_0447
     * @tc.desc      ScaleModel call flow toString > stash > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0447 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      logInfo(`toString>stash>reset>toString>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0447 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0448
     * @tc.name      ImageViewer_ScaleModelFlow_0448
     * @tc.desc      ScaleModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0448 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0448 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0449
     * @tc.name      ImageViewer_ScaleModelFlow_0449
     * @tc.desc      ScaleModel call flow reset > toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0449 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0449 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0450
     * @tc.name      ImageViewer_ScaleModelFlow_0450
     * @tc.desc      ScaleModel call flow reset > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0450 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0450 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0451
     * @tc.name      ImageViewer_ScaleModelFlow_0451
     * @tc.desc      ScaleModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0451 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0451 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0452
     * @tc.name      ImageViewer_ScaleModelFlow_0452
     * @tc.desc      ScaleModel call flow reset > stash > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0452 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0452 end`);
    });
  });
}
