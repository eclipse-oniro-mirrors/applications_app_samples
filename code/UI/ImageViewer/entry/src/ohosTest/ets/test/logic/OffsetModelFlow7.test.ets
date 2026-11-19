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
import { OffsetModel } from '../../../../main/ets/model/OffsetModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for OffsetModel flow (72 cases). */
export default function offsetModelFlow7Test(): void {
  describe('OffsetModelFlow7Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0416
     * @tc.name      ImageViewer_OffsetModelFlow_0416
     * @tc.desc      OffsetModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0416 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0416 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0417
     * @tc.name      ImageViewer_OffsetModelFlow_0417
     * @tc.desc      OffsetModel call flow reset > toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0417 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      logInfo(`reset>toString>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0417 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0418
     * @tc.name      ImageViewer_OffsetModelFlow_0418
     * @tc.desc      OffsetModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0418 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0418 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0419
     * @tc.name      ImageViewer_OffsetModelFlow_0419
     * @tc.desc      OffsetModel call flow toString > stash > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0419 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0419 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0420
     * @tc.name      ImageViewer_OffsetModelFlow_0420
     * @tc.desc      OffsetModel call flow reset > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0420 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0420 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0421
     * @tc.name      ImageViewer_OffsetModelFlow_0421
     * @tc.desc      OffsetModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0421 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0421 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0422
     * @tc.name      ImageViewer_OffsetModelFlow_0422
     * @tc.desc      OffsetModel call flow stash > stash > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0422 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>stash>stash>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0422 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0423
     * @tc.name      ImageViewer_OffsetModelFlow_0423
     * @tc.desc      OffsetModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0423 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0423 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0424
     * @tc.name      ImageViewer_OffsetModelFlow_0424
     * @tc.desc      OffsetModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0424 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0424 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0425
     * @tc.name      ImageViewer_OffsetModelFlow_0425
     * @tc.desc      OffsetModel call flow toString > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0425 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0425 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0426
     * @tc.name      ImageViewer_OffsetModelFlow_0426
     * @tc.desc      OffsetModel call flow toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0426 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`toString>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0426 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0427
     * @tc.name      ImageViewer_OffsetModelFlow_0427
     * @tc.desc      OffsetModel call flow stash > stash > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0427 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.stash();
      logInfo(`stash>stash>toString>toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0427 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0428
     * @tc.name      ImageViewer_OffsetModelFlow_0428
     * @tc.desc      OffsetModel call flow stash > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0428 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0428 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0429
     * @tc.name      ImageViewer_OffsetModelFlow_0429
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0429 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0429 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0430
     * @tc.name      ImageViewer_OffsetModelFlow_0430
     * @tc.desc      OffsetModel call flow toString > stash > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0430 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>stash>reset>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0430 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0431
     * @tc.name      ImageViewer_OffsetModelFlow_0431
     * @tc.desc      OffsetModel call flow reset > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0431 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>reset>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0431 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0432
     * @tc.name      ImageViewer_OffsetModelFlow_0432
     * @tc.desc      OffsetModel call flow stash > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0432 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0432 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0433
     * @tc.name      ImageViewer_OffsetModelFlow_0433
     * @tc.desc      OffsetModel call flow toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0433 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0433 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0434
     * @tc.name      ImageViewer_OffsetModelFlow_0434
     * @tc.desc      OffsetModel call flow stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0434 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.stash();
      logInfo(`stash>toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0434 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0435
     * @tc.name      ImageViewer_OffsetModelFlow_0435
     * @tc.desc      OffsetModel call flow reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0435 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0435 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0436
     * @tc.name      ImageViewer_OffsetModelFlow_0436
     * @tc.desc      OffsetModel call flow stash > reset > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0436 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0436 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0437
     * @tc.name      ImageViewer_OffsetModelFlow_0437
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0437 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0437 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0438
     * @tc.name      ImageViewer_OffsetModelFlow_0438
     * @tc.desc      OffsetModel call flow stash > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0438 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>reset>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0438 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0439
     * @tc.name      ImageViewer_OffsetModelFlow_0439
     * @tc.desc      OffsetModel call flow stash > toString > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0439 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0439 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0440
     * @tc.name      ImageViewer_OffsetModelFlow_0440
     * @tc.desc      OffsetModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0440 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0440 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0441
     * @tc.name      ImageViewer_OffsetModelFlow_0441
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0441 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0441 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0442
     * @tc.name      ImageViewer_OffsetModelFlow_0442
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0442 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0442 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0443
     * @tc.name      ImageViewer_OffsetModelFlow_0443
     * @tc.desc      OffsetModel call flow reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0443 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0443 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0444
     * @tc.name      ImageViewer_OffsetModelFlow_0444
     * @tc.desc      OffsetModel call flow toString > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0444 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0444 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0445
     * @tc.name      ImageViewer_OffsetModelFlow_0445
     * @tc.desc      OffsetModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0445 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0445 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0446
     * @tc.name      ImageViewer_OffsetModelFlow_0446
     * @tc.desc      OffsetModel call flow reset > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0446 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>stash>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0446 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0447
     * @tc.name      ImageViewer_OffsetModelFlow_0447
     * @tc.desc      OffsetModel call flow toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0447 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0447 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0448
     * @tc.name      ImageViewer_OffsetModelFlow_0448
     * @tc.desc      OffsetModel call flow toString > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0448 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>toString>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0448 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0449
     * @tc.name      ImageViewer_OffsetModelFlow_0449
     * @tc.desc      OffsetModel call flow stash > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0449 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>stash>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0449 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0450
     * @tc.name      ImageViewer_OffsetModelFlow_0450
     * @tc.desc      OffsetModel call flow toString > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0450 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0450 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0451
     * @tc.name      ImageViewer_OffsetModelFlow_0451
     * @tc.desc      OffsetModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0451 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0451 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0452
     * @tc.name      ImageViewer_OffsetModelFlow_0452
     * @tc.desc      OffsetModel call flow stash > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0452 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0452 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0453
     * @tc.name      ImageViewer_OffsetModelFlow_0453
     * @tc.desc      OffsetModel call flow reset > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0453 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0453 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0454
     * @tc.name      ImageViewer_OffsetModelFlow_0454
     * @tc.desc      OffsetModel call flow stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0454 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0454 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0455
     * @tc.name      ImageViewer_OffsetModelFlow_0455
     * @tc.desc      OffsetModel call flow reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0455 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0455 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0456
     * @tc.name      ImageViewer_OffsetModelFlow_0456
     * @tc.desc      OffsetModel call flow reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0456 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`reset>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0456 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0457
     * @tc.name      ImageViewer_OffsetModelFlow_0457
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0457 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0457 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0458
     * @tc.name      ImageViewer_OffsetModelFlow_0458
     * @tc.desc      OffsetModel call flow stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0458 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0458 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0459
     * @tc.name      ImageViewer_OffsetModelFlow_0459
     * @tc.desc      OffsetModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0459 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0459 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0460
     * @tc.name      ImageViewer_OffsetModelFlow_0460
     * @tc.desc      OffsetModel call flow toString > stash > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0460 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.stash();
      logInfo(`toString>stash>toString>toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0460 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0461
     * @tc.name      ImageViewer_OffsetModelFlow_0461
     * @tc.desc      OffsetModel call flow reset > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0461 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0461 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0462
     * @tc.name      ImageViewer_OffsetModelFlow_0462
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0462 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0462 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0463
     * @tc.name      ImageViewer_OffsetModelFlow_0463
     * @tc.desc      OffsetModel call flow stash > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0463 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>stash>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0463 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0464
     * @tc.name      ImageViewer_OffsetModelFlow_0464
     * @tc.desc      OffsetModel call flow reset > toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0464 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0464 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0465
     * @tc.name      ImageViewer_OffsetModelFlow_0465
     * @tc.desc      OffsetModel call flow reset > stash > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0465 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`reset>stash>stash>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0465 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0466
     * @tc.name      ImageViewer_OffsetModelFlow_0466
     * @tc.desc      OffsetModel call flow stash > stash > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0466 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>reset>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0466 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0467
     * @tc.name      ImageViewer_OffsetModelFlow_0467
     * @tc.desc      OffsetModel call flow toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0467 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0467 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0468
     * @tc.name      ImageViewer_OffsetModelFlow_0468
     * @tc.desc      OffsetModel call flow toString > stash > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0468 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>stash>toString>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0468 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0469
     * @tc.name      ImageViewer_OffsetModelFlow_0469
     * @tc.desc      OffsetModel call flow reset > reset > reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0469 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0469 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0470
     * @tc.name      ImageViewer_OffsetModelFlow_0470
     * @tc.desc      OffsetModel call flow toString > reset > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0470 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>reset>reset>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0470 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0471
     * @tc.name      ImageViewer_OffsetModelFlow_0471
     * @tc.desc      OffsetModel call flow toString > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0471 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0471 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0472
     * @tc.name      ImageViewer_OffsetModelFlow_0472
     * @tc.desc      OffsetModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0472 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0472 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0473
     * @tc.name      ImageViewer_OffsetModelFlow_0473
     * @tc.desc      OffsetModel call flow toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0473 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0473 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0474
     * @tc.name      ImageViewer_OffsetModelFlow_0474
     * @tc.desc      OffsetModel call flow reset > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0474 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0474 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0475
     * @tc.name      ImageViewer_OffsetModelFlow_0475
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0475 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0475 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0476
     * @tc.name      ImageViewer_OffsetModelFlow_0476
     * @tc.desc      OffsetModel call flow stash > toString > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0476 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`stash>toString>reset>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0476 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0477
     * @tc.name      ImageViewer_OffsetModelFlow_0477
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0477 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0477 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0478
     * @tc.name      ImageViewer_OffsetModelFlow_0478
     * @tc.desc      OffsetModel call flow stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0478 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.reset();
      logInfo(`stash>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0478 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0479
     * @tc.name      ImageViewer_OffsetModelFlow_0479
     * @tc.desc      OffsetModel call flow reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0479 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0479 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0480
     * @tc.name      ImageViewer_OffsetModelFlow_0480
     * @tc.desc      OffsetModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0480 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0480 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0481
     * @tc.name      ImageViewer_OffsetModelFlow_0481
     * @tc.desc      OffsetModel call flow reset > stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0481 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`reset>stash>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0481 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0482
     * @tc.name      ImageViewer_OffsetModelFlow_0482
     * @tc.desc      OffsetModel call flow toString > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0482 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`toString>reset>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0482 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0483
     * @tc.name      ImageViewer_OffsetModelFlow_0483
     * @tc.desc      OffsetModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0483 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0483 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0484
     * @tc.name      ImageViewer_OffsetModelFlow_0484
     * @tc.desc      OffsetModel call flow reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0484 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0484 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0485
     * @tc.name      ImageViewer_OffsetModelFlow_0485
     * @tc.desc      OffsetModel call flow reset > toString > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0485 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`reset>toString>toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0485 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0486
     * @tc.name      ImageViewer_OffsetModelFlow_0486
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0486 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0486 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0487
     * @tc.name      ImageViewer_OffsetModelFlow_0487
     * @tc.desc      OffsetModel call flow toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0487 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0487 end`);
    });
  });
}
