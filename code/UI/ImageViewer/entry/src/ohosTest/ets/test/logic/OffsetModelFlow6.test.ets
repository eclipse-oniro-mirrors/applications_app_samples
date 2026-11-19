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

/** Logic checks for OffsetModel flow (74 cases). */
export default function offsetModelFlow6Test(): void {
  describe('OffsetModelFlow6Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0342
     * @tc.name      ImageViewer_OffsetModelFlow_0342
     * @tc.desc      OffsetModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0342 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0342 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0343
     * @tc.name      ImageViewer_OffsetModelFlow_0343
     * @tc.desc      OffsetModel call flow stash > toString > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0343 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0343 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0344
     * @tc.name      ImageViewer_OffsetModelFlow_0344
     * @tc.desc      OffsetModel call flow reset > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0344 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>stash>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0344 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0345
     * @tc.name      ImageViewer_OffsetModelFlow_0345
     * @tc.desc      OffsetModel call flow reset > reset > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0345 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>toString>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0345 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0346
     * @tc.name      ImageViewer_OffsetModelFlow_0346
     * @tc.desc      OffsetModel call flow stash > reset > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0346 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0346 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0347
     * @tc.name      ImageViewer_OffsetModelFlow_0347
     * @tc.desc      OffsetModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0347 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0347 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0348
     * @tc.name      ImageViewer_OffsetModelFlow_0348
     * @tc.desc      OffsetModel call flow toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0348 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`toString>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0348 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0349
     * @tc.name      ImageViewer_OffsetModelFlow_0349
     * @tc.desc      OffsetModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0349 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0349 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0350
     * @tc.name      ImageViewer_OffsetModelFlow_0350
     * @tc.desc      OffsetModel call flow reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0350 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`reset>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0350 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0351
     * @tc.name      ImageViewer_OffsetModelFlow_0351
     * @tc.desc      OffsetModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0351 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0351 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0352
     * @tc.name      ImageViewer_OffsetModelFlow_0352
     * @tc.desc      OffsetModel call flow reset > stash > stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0352 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0352 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0353
     * @tc.name      ImageViewer_OffsetModelFlow_0353
     * @tc.desc      OffsetModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0353 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0353 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0354
     * @tc.name      ImageViewer_OffsetModelFlow_0354
     * @tc.desc      OffsetModel call flow toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0354 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0354 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0355
     * @tc.name      ImageViewer_OffsetModelFlow_0355
     * @tc.desc      OffsetModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0355 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0355 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0356
     * @tc.name      ImageViewer_OffsetModelFlow_0356
     * @tc.desc      OffsetModel call flow reset > reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0356 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`reset>reset>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0356 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0357
     * @tc.name      ImageViewer_OffsetModelFlow_0357
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0357 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0357 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0358
     * @tc.name      ImageViewer_OffsetModelFlow_0358
     * @tc.desc      OffsetModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0358 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0358 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0359
     * @tc.name      ImageViewer_OffsetModelFlow_0359
     * @tc.desc      OffsetModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0359 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0359 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0360
     * @tc.name      ImageViewer_OffsetModelFlow_0360
     * @tc.desc      OffsetModel call flow stash > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0360 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0360 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0361
     * @tc.name      ImageViewer_OffsetModelFlow_0361
     * @tc.desc      OffsetModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0361 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0361 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0362
     * @tc.name      ImageViewer_OffsetModelFlow_0362
     * @tc.desc      OffsetModel call flow stash > reset > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0362 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>reset>stash>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0362 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0363
     * @tc.name      ImageViewer_OffsetModelFlow_0363
     * @tc.desc      OffsetModel call flow reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0363 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`reset>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0363 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0364
     * @tc.name      ImageViewer_OffsetModelFlow_0364
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0364 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0364 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0365
     * @tc.name      ImageViewer_OffsetModelFlow_0365
     * @tc.desc      OffsetModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0365 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0365 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0366
     * @tc.name      ImageViewer_OffsetModelFlow_0366
     * @tc.desc      OffsetModel call flow stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0366 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0366 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0367
     * @tc.name      ImageViewer_OffsetModelFlow_0367
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0367 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0367 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0368
     * @tc.name      ImageViewer_OffsetModelFlow_0368
     * @tc.desc      OffsetModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0368 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0368 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0369
     * @tc.name      ImageViewer_OffsetModelFlow_0369
     * @tc.desc      OffsetModel call flow toString > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0369 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`toString>toString>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0369 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0370
     * @tc.name      ImageViewer_OffsetModelFlow_0370
     * @tc.desc      OffsetModel call flow toString > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0370 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0370 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0371
     * @tc.name      ImageViewer_OffsetModelFlow_0371
     * @tc.desc      OffsetModel call flow toString > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0371 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0371 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0372
     * @tc.name      ImageViewer_OffsetModelFlow_0372
     * @tc.desc      OffsetModel call flow toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0372 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      logInfo(`toString>stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0372 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0373
     * @tc.name      ImageViewer_OffsetModelFlow_0373
     * @tc.desc      OffsetModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0373 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0373 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0374
     * @tc.name      ImageViewer_OffsetModelFlow_0374
     * @tc.desc      OffsetModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0374 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0374 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0375
     * @tc.name      ImageViewer_OffsetModelFlow_0375
     * @tc.desc      OffsetModel call flow stash > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0375 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>reset>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0375 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0376
     * @tc.name      ImageViewer_OffsetModelFlow_0376
     * @tc.desc      OffsetModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0376 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0376 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0377
     * @tc.name      ImageViewer_OffsetModelFlow_0377
     * @tc.desc      OffsetModel call flow toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0377 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0377 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0378
     * @tc.name      ImageViewer_OffsetModelFlow_0378
     * @tc.desc      OffsetModel call flow reset > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0378 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0378 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0379
     * @tc.name      ImageViewer_OffsetModelFlow_0379
     * @tc.desc      OffsetModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0379 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0379 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0380
     * @tc.name      ImageViewer_OffsetModelFlow_0380
     * @tc.desc      OffsetModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0380 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0380 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0381
     * @tc.name      ImageViewer_OffsetModelFlow_0381
     * @tc.desc      OffsetModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0381 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0381 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0382
     * @tc.name      ImageViewer_OffsetModelFlow_0382
     * @tc.desc      OffsetModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0382 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0382 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0383
     * @tc.name      ImageViewer_OffsetModelFlow_0383
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0383 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0383 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0384
     * @tc.name      ImageViewer_OffsetModelFlow_0384
     * @tc.desc      OffsetModel call flow toString > stash > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0384 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`toString>stash>toString>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0384 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0385
     * @tc.name      ImageViewer_OffsetModelFlow_0385
     * @tc.desc      OffsetModel call flow stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0385 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0385 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0386
     * @tc.name      ImageViewer_OffsetModelFlow_0386
     * @tc.desc      OffsetModel call flow reset > reset > stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0386 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`reset>reset>stash>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0386 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0387
     * @tc.name      ImageViewer_OffsetModelFlow_0387
     * @tc.desc      OffsetModel call flow stash > toString > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0387 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>toString>stash>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0387 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0388
     * @tc.name      ImageViewer_OffsetModelFlow_0388
     * @tc.desc      OffsetModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0388 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0388 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0389
     * @tc.name      ImageViewer_OffsetModelFlow_0389
     * @tc.desc      OffsetModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0389 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0389 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0390
     * @tc.name      ImageViewer_OffsetModelFlow_0390
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0390 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0390 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0391
     * @tc.name      ImageViewer_OffsetModelFlow_0391
     * @tc.desc      OffsetModel call flow stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0391 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0391 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0392
     * @tc.name      ImageViewer_OffsetModelFlow_0392
     * @tc.desc      OffsetModel call flow toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0392 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0392 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0393
     * @tc.name      ImageViewer_OffsetModelFlow_0393
     * @tc.desc      OffsetModel call flow reset > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0393 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`reset>toString>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0393 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0394
     * @tc.name      ImageViewer_OffsetModelFlow_0394
     * @tc.desc      OffsetModel call flow reset > reset > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0394 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`reset>reset>stash>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0394 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0395
     * @tc.name      ImageViewer_OffsetModelFlow_0395
     * @tc.desc      OffsetModel call flow reset > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0395 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`reset>toString>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0395 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0396
     * @tc.name      ImageViewer_OffsetModelFlow_0396
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0396 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0396 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0397
     * @tc.name      ImageViewer_OffsetModelFlow_0397
     * @tc.desc      OffsetModel call flow reset > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0397 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>reset>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0397 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0398
     * @tc.name      ImageViewer_OffsetModelFlow_0398
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0398 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0398 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0399
     * @tc.name      ImageViewer_OffsetModelFlow_0399
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0399 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0399 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0400
     * @tc.name      ImageViewer_OffsetModelFlow_0400
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0400 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0400 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0401
     * @tc.name      ImageViewer_OffsetModelFlow_0401
     * @tc.desc      OffsetModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0401 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0401 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0402
     * @tc.name      ImageViewer_OffsetModelFlow_0402
     * @tc.desc      OffsetModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0402 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0402 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0403
     * @tc.name      ImageViewer_OffsetModelFlow_0403
     * @tc.desc      OffsetModel call flow reset > toString > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0403 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString>stash>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0403 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0404
     * @tc.name      ImageViewer_OffsetModelFlow_0404
     * @tc.desc      OffsetModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0404 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0404 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0405
     * @tc.name      ImageViewer_OffsetModelFlow_0405
     * @tc.desc      OffsetModel call flow toString > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0405 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0405 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0406
     * @tc.name      ImageViewer_OffsetModelFlow_0406
     * @tc.desc      OffsetModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0406 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0406 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0407
     * @tc.name      ImageViewer_OffsetModelFlow_0407
     * @tc.desc      OffsetModel call flow stash > reset > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0407 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>reset>toString>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0407 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0408
     * @tc.name      ImageViewer_OffsetModelFlow_0408
     * @tc.desc      OffsetModel call flow stash > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0408 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`stash>toString>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0408 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0409
     * @tc.name      ImageViewer_OffsetModelFlow_0409
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0409 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0409 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0410
     * @tc.name      ImageViewer_OffsetModelFlow_0410
     * @tc.desc      OffsetModel call flow stash > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0410 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`stash>toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0410 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0411
     * @tc.name      ImageViewer_OffsetModelFlow_0411
     * @tc.desc      OffsetModel call flow reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0411 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`reset>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0411 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0412
     * @tc.name      ImageViewer_OffsetModelFlow_0412
     * @tc.desc      OffsetModel call flow reset > stash > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0412 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0412 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0413
     * @tc.name      ImageViewer_OffsetModelFlow_0413
     * @tc.desc      OffsetModel call flow stash > reset > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0413 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>reset>stash>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0413 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0414
     * @tc.name      ImageViewer_OffsetModelFlow_0414
     * @tc.desc      OffsetModel call flow reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0414 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0414 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0415
     * @tc.name      ImageViewer_OffsetModelFlow_0415
     * @tc.desc      OffsetModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0415 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0415 end`);
    });
  });
}
