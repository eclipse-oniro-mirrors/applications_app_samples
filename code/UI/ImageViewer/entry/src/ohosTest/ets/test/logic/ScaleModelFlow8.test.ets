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

/** Logic checks for ScaleModel flow (69 cases). */
export default function scaleModelFlow8Test(): void {
  describe('ScaleModelFlow8Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0453
     * @tc.name      ImageViewer_ScaleModelFlow_0453
     * @tc.desc      ScaleModel call flow stash > stash > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0453 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`stash>stash>reset>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>reset>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0453 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0454
     * @tc.name      ImageViewer_ScaleModelFlow_0454
     * @tc.desc      ScaleModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0454 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0454 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0455
     * @tc.name      ImageViewer_ScaleModelFlow_0455
     * @tc.desc      ScaleModel call flow reset > reset > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0455 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>reset>reset>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>reset>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0455 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0456
     * @tc.name      ImageViewer_ScaleModelFlow_0456
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0456 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0456 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0457
     * @tc.name      ImageViewer_ScaleModelFlow_0457
     * @tc.desc      ScaleModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0457 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0457 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0458
     * @tc.name      ImageViewer_ScaleModelFlow_0458
     * @tc.desc      ScaleModel call flow toString > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0458 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0458 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0459
     * @tc.name      ImageViewer_ScaleModelFlow_0459
     * @tc.desc      ScaleModel call flow reset > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0459 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`reset>stash>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0459 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0460
     * @tc.name      ImageViewer_ScaleModelFlow_0460
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0460 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0460 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0461
     * @tc.name      ImageViewer_ScaleModelFlow_0461
     * @tc.desc      ScaleModel call flow stash > reset > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0461 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>reset>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0461 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0462
     * @tc.name      ImageViewer_ScaleModelFlow_0462
     * @tc.desc      ScaleModel call flow toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0462 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0462 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0463
     * @tc.name      ImageViewer_ScaleModelFlow_0463
     * @tc.desc      ScaleModel call flow toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0463 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0463 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0464
     * @tc.name      ImageViewer_ScaleModelFlow_0464
     * @tc.desc      ScaleModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0464 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0464 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0465
     * @tc.name      ImageViewer_ScaleModelFlow_0465
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0465 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0465 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0466
     * @tc.name      ImageViewer_ScaleModelFlow_0466
     * @tc.desc      ScaleModel call flow reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0466 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0466 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0467
     * @tc.name      ImageViewer_ScaleModelFlow_0467
     * @tc.desc      ScaleModel call flow reset > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0467 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>reset>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0467 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0468
     * @tc.name      ImageViewer_ScaleModelFlow_0468
     * @tc.desc      ScaleModel call flow toString > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0468 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0468 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0469
     * @tc.name      ImageViewer_ScaleModelFlow_0469
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0469 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0469 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0470
     * @tc.name      ImageViewer_ScaleModelFlow_0470
     * @tc.desc      ScaleModel call flow reset > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0470 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>reset>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0470 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0471
     * @tc.name      ImageViewer_ScaleModelFlow_0471
     * @tc.desc      ScaleModel call flow stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0471 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0471 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0472
     * @tc.name      ImageViewer_ScaleModelFlow_0472
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0472 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0472 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0473
     * @tc.name      ImageViewer_ScaleModelFlow_0473
     * @tc.desc      ScaleModel call flow stash > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0473 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0473 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0474
     * @tc.name      ImageViewer_ScaleModelFlow_0474
     * @tc.desc      ScaleModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0474 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0474 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0475
     * @tc.name      ImageViewer_ScaleModelFlow_0475
     * @tc.desc      ScaleModel call flow toString > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0475 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0475 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0476
     * @tc.name      ImageViewer_ScaleModelFlow_0476
     * @tc.desc      ScaleModel call flow stash > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0476 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0476 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0477
     * @tc.name      ImageViewer_ScaleModelFlow_0477
     * @tc.desc      ScaleModel call flow reset > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0477 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      logInfo(`reset>reset>toString>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0477 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0478
     * @tc.name      ImageViewer_ScaleModelFlow_0478
     * @tc.desc      ScaleModel call flow toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0478 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0478 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0479
     * @tc.name      ImageViewer_ScaleModelFlow_0479
     * @tc.desc      ScaleModel call flow stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0479 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0479 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0480
     * @tc.name      ImageViewer_ScaleModelFlow_0480
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0480 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0480 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0481
     * @tc.name      ImageViewer_ScaleModelFlow_0481
     * @tc.desc      ScaleModel call flow toString > reset > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0481 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`toString>reset>stash>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>stash>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0481 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0482
     * @tc.name      ImageViewer_ScaleModelFlow_0482
     * @tc.desc      ScaleModel call flow stash > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0482 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0482 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0483
     * @tc.name      ImageViewer_ScaleModelFlow_0483
     * @tc.desc      ScaleModel call flow stash > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0483 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0483 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0484
     * @tc.name      ImageViewer_ScaleModelFlow_0484
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0484 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0484 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0485
     * @tc.name      ImageViewer_ScaleModelFlow_0485
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0485 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0485 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0486
     * @tc.name      ImageViewer_ScaleModelFlow_0486
     * @tc.desc      ScaleModel call flow stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0486 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0486 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0487
     * @tc.name      ImageViewer_ScaleModelFlow_0487
     * @tc.desc      ScaleModel call flow stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0487 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0487 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0488
     * @tc.name      ImageViewer_ScaleModelFlow_0488
     * @tc.desc      ScaleModel call flow toString > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0488 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0488 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0489
     * @tc.name      ImageViewer_ScaleModelFlow_0489
     * @tc.desc      ScaleModel call flow toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0489 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0489 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0490
     * @tc.name      ImageViewer_ScaleModelFlow_0490
     * @tc.desc      ScaleModel call flow reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0490 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0490 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0491
     * @tc.name      ImageViewer_ScaleModelFlow_0491
     * @tc.desc      ScaleModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0491 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0491 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0492
     * @tc.name      ImageViewer_ScaleModelFlow_0492
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0492 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0492 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0493
     * @tc.name      ImageViewer_ScaleModelFlow_0493
     * @tc.desc      ScaleModel call flow reset > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0493 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`reset>stash>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0493 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0494
     * @tc.name      ImageViewer_ScaleModelFlow_0494
     * @tc.desc      ScaleModel call flow reset > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0494 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      logInfo(`reset>stash>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0494 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0495
     * @tc.name      ImageViewer_ScaleModelFlow_0495
     * @tc.desc      ScaleModel call flow stash > stash > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0495 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>stash>stash>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>stash>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0495 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0496
     * @tc.name      ImageViewer_ScaleModelFlow_0496
     * @tc.desc      ScaleModel call flow toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0496 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0496 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0497
     * @tc.name      ImageViewer_ScaleModelFlow_0497
     * @tc.desc      ScaleModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0497 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0497 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0498
     * @tc.name      ImageViewer_ScaleModelFlow_0498
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0498 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0498 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0499
     * @tc.name      ImageViewer_ScaleModelFlow_0499
     * @tc.desc      ScaleModel call flow toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0499 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0499 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0500
     * @tc.name      ImageViewer_ScaleModelFlow_0500
     * @tc.desc      ScaleModel call flow reset > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0500 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0500 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0501
     * @tc.name      ImageViewer_ScaleModelFlow_0501
     * @tc.desc      ScaleModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0501 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0501 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0502
     * @tc.name      ImageViewer_ScaleModelFlow_0502
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0502 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0502 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0503
     * @tc.name      ImageViewer_ScaleModelFlow_0503
     * @tc.desc      ScaleModel call flow stash > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0503 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0503 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0504
     * @tc.name      ImageViewer_ScaleModelFlow_0504
     * @tc.desc      ScaleModel call flow toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0504 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0504 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0505
     * @tc.name      ImageViewer_ScaleModelFlow_0505
     * @tc.desc      ScaleModel call flow stash > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0505 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.reset();
      subject.stash();
      logInfo(`stash>toString>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0505 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0506
     * @tc.name      ImageViewer_ScaleModelFlow_0506
     * @tc.desc      ScaleModel call flow toString > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0506 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`toString>reset>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0506 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0507
     * @tc.name      ImageViewer_ScaleModelFlow_0507
     * @tc.desc      ScaleModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0507 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      logInfo(`toString>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0507 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0508
     * @tc.name      ImageViewer_ScaleModelFlow_0508
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0508 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0508 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0509
     * @tc.name      ImageViewer_ScaleModelFlow_0509
     * @tc.desc      ScaleModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0509 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0509 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0510
     * @tc.name      ImageViewer_ScaleModelFlow_0510
     * @tc.desc      ScaleModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0510 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0510 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0511
     * @tc.name      ImageViewer_ScaleModelFlow_0511
     * @tc.desc      ScaleModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0511 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0511 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0512
     * @tc.name      ImageViewer_ScaleModelFlow_0512
     * @tc.desc      ScaleModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0512 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0512 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0513
     * @tc.name      ImageViewer_ScaleModelFlow_0513
     * @tc.desc      ScaleModel call flow toString > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0513 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>stash>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0513 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0514
     * @tc.name      ImageViewer_ScaleModelFlow_0514
     * @tc.desc      ScaleModel call flow stash > reset > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0514 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`stash>reset>reset>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>reset>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0514 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0515
     * @tc.name      ImageViewer_ScaleModelFlow_0515
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0515 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0515 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0516
     * @tc.name      ImageViewer_ScaleModelFlow_0516
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0516 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0516 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0517
     * @tc.name      ImageViewer_ScaleModelFlow_0517
     * @tc.desc      ScaleModel call flow reset > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0517 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0517 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0518
     * @tc.name      ImageViewer_ScaleModelFlow_0518
     * @tc.desc      ScaleModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0518 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0518 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0519
     * @tc.name      ImageViewer_ScaleModelFlow_0519
     * @tc.desc      ScaleModel call flow toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0519 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      subject.stash();
      logInfo(`toString>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0519 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0520
     * @tc.name      ImageViewer_ScaleModelFlow_0520
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0520 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0520 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0521
     * @tc.name      ImageViewer_ScaleModelFlow_0521
     * @tc.desc      ScaleModel call flow toString > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0521 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`toString>stash>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0521 end`);
    });
  });
}
