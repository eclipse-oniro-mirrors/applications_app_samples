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
export default function offsetModelFlow4Test(): void {
  describe('OffsetModelFlow4Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0196
     * @tc.name      ImageViewer_OffsetModelFlow_0196
     * @tc.desc      OffsetModel call flow toString > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0196 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0197
     * @tc.name      ImageViewer_OffsetModelFlow_0197
     * @tc.desc      OffsetModel call flow toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0197 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0198
     * @tc.name      ImageViewer_OffsetModelFlow_0198
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0198 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0199
     * @tc.name      ImageViewer_OffsetModelFlow_0199
     * @tc.desc      OffsetModel call flow reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0199 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0200
     * @tc.name      ImageViewer_OffsetModelFlow_0200
     * @tc.desc      OffsetModel call flow toString > reset > stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0200 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>reset>stash>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0201
     * @tc.name      ImageViewer_OffsetModelFlow_0201
     * @tc.desc      OffsetModel call flow toString > reset > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0201 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0202
     * @tc.name      ImageViewer_OffsetModelFlow_0202
     * @tc.desc      OffsetModel call flow stash > reset > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0202 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>reset>stash>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0203
     * @tc.name      ImageViewer_OffsetModelFlow_0203
     * @tc.desc      OffsetModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0203 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0204
     * @tc.name      ImageViewer_OffsetModelFlow_0204
     * @tc.desc      OffsetModel call flow reset > toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0204 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0205
     * @tc.name      ImageViewer_OffsetModelFlow_0205
     * @tc.desc      OffsetModel call flow reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0205 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`reset>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0206
     * @tc.name      ImageViewer_OffsetModelFlow_0206
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0206 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0207
     * @tc.name      ImageViewer_OffsetModelFlow_0207
     * @tc.desc      OffsetModel call flow toString > reset > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0207 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`toString>reset>stash>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0208
     * @tc.name      ImageViewer_OffsetModelFlow_0208
     * @tc.desc      OffsetModel call flow toString > reset > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0208 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>reset>toString>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0209
     * @tc.name      ImageViewer_OffsetModelFlow_0209
     * @tc.desc      OffsetModel call flow toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0209 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0210
     * @tc.name      ImageViewer_OffsetModelFlow_0210
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0210 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0211
     * @tc.name      ImageViewer_OffsetModelFlow_0211
     * @tc.desc      OffsetModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0211 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0212
     * @tc.name      ImageViewer_OffsetModelFlow_0212
     * @tc.desc      OffsetModel call flow reset > stash > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0212 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>stash>reset>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0213
     * @tc.name      ImageViewer_OffsetModelFlow_0213
     * @tc.desc      OffsetModel call flow toString > stash > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0213 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0214
     * @tc.name      ImageViewer_OffsetModelFlow_0214
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0214 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0215
     * @tc.name      ImageViewer_OffsetModelFlow_0215
     * @tc.desc      OffsetModel call flow reset > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0215 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>stash>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0216
     * @tc.name      ImageViewer_OffsetModelFlow_0216
     * @tc.desc      OffsetModel call flow reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0216 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0217
     * @tc.name      ImageViewer_OffsetModelFlow_0217
     * @tc.desc      OffsetModel call flow reset > reset > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0217 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>reset>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0218
     * @tc.name      ImageViewer_OffsetModelFlow_0218
     * @tc.desc      OffsetModel call flow toString > stash > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0218 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>stash>reset>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0219
     * @tc.name      ImageViewer_OffsetModelFlow_0219
     * @tc.desc      OffsetModel call flow toString > reset > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0219 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0220
     * @tc.name      ImageViewer_OffsetModelFlow_0220
     * @tc.desc      OffsetModel call flow toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0220 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0221
     * @tc.name      ImageViewer_OffsetModelFlow_0221
     * @tc.desc      OffsetModel call flow reset > stash > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0221 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.stash();
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>stash>reset>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0222
     * @tc.name      ImageViewer_OffsetModelFlow_0222
     * @tc.desc      OffsetModel call flow toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0222 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0223
     * @tc.name      ImageViewer_OffsetModelFlow_0223
     * @tc.desc      OffsetModel call flow reset > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0223 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>reset>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0224
     * @tc.name      ImageViewer_OffsetModelFlow_0224
     * @tc.desc      OffsetModel call flow reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0224 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`reset>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0225
     * @tc.name      ImageViewer_OffsetModelFlow_0225
     * @tc.desc      OffsetModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0225 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0226
     * @tc.name      ImageViewer_OffsetModelFlow_0226
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0226 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0227
     * @tc.name      ImageViewer_OffsetModelFlow_0227
     * @tc.desc      OffsetModel call flow toString > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0227 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0228
     * @tc.name      ImageViewer_OffsetModelFlow_0228
     * @tc.desc      OffsetModel call flow stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0228 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0229
     * @tc.name      ImageViewer_OffsetModelFlow_0229
     * @tc.desc      OffsetModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0229 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0230
     * @tc.name      ImageViewer_OffsetModelFlow_0230
     * @tc.desc      OffsetModel call flow stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0230 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0231
     * @tc.name      ImageViewer_OffsetModelFlow_0231
     * @tc.desc      OffsetModel call flow toString > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0231 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`toString>reset>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0232
     * @tc.name      ImageViewer_OffsetModelFlow_0232
     * @tc.desc      OffsetModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0232 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0233
     * @tc.name      ImageViewer_OffsetModelFlow_0233
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0233 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0234
     * @tc.name      ImageViewer_OffsetModelFlow_0234
     * @tc.desc      OffsetModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0234 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0235
     * @tc.name      ImageViewer_OffsetModelFlow_0235
     * @tc.desc      OffsetModel call flow stash > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0235 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0236
     * @tc.name      ImageViewer_OffsetModelFlow_0236
     * @tc.desc      OffsetModel call flow stash > toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0236 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
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
      logInfo(`${BUNDLE}OffsetModelFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0237
     * @tc.name      ImageViewer_OffsetModelFlow_0237
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0237 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0238
     * @tc.name      ImageViewer_OffsetModelFlow_0238
     * @tc.desc      OffsetModel call flow stash > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0238 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>stash>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0239
     * @tc.name      ImageViewer_OffsetModelFlow_0239
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0239 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0240
     * @tc.name      ImageViewer_OffsetModelFlow_0240
     * @tc.desc      OffsetModel call flow toString > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0240 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0241
     * @tc.name      ImageViewer_OffsetModelFlow_0241
     * @tc.desc      OffsetModel call flow toString > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0241 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.reset();
      logInfo(`toString>stash>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0242
     * @tc.name      ImageViewer_OffsetModelFlow_0242
     * @tc.desc      OffsetModel call flow toString > reset > reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0242 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset>reset>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0243
     * @tc.name      ImageViewer_OffsetModelFlow_0243
     * @tc.desc      OffsetModel call flow reset > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0243 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`reset>toString>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0244
     * @tc.name      ImageViewer_OffsetModelFlow_0244
     * @tc.desc      OffsetModel call flow stash > reset > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0244 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0245
     * @tc.name      ImageViewer_OffsetModelFlow_0245
     * @tc.desc      OffsetModel call flow toString > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0245 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0246
     * @tc.name      ImageViewer_OffsetModelFlow_0246
     * @tc.desc      OffsetModel call flow stash > reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0246 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0247
     * @tc.name      ImageViewer_OffsetModelFlow_0247
     * @tc.desc      OffsetModel call flow stash > reset > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0247 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`stash>reset>reset>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0248
     * @tc.name      ImageViewer_OffsetModelFlow_0248
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0248 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0249
     * @tc.name      ImageViewer_OffsetModelFlow_0249
     * @tc.desc      OffsetModel call flow toString > reset > reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0249 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0250
     * @tc.name      ImageViewer_OffsetModelFlow_0250
     * @tc.desc      OffsetModel call flow reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0250 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0251
     * @tc.name      ImageViewer_OffsetModelFlow_0251
     * @tc.desc      OffsetModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0251 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0252
     * @tc.name      ImageViewer_OffsetModelFlow_0252
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0252 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0253
     * @tc.name      ImageViewer_OffsetModelFlow_0253
     * @tc.desc      OffsetModel call flow reset > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0253 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0254
     * @tc.name      ImageViewer_OffsetModelFlow_0254
     * @tc.desc      OffsetModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0254 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0255
     * @tc.name      ImageViewer_OffsetModelFlow_0255
     * @tc.desc      OffsetModel call flow reset > toString > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0255 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>toString>reset>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0256
     * @tc.name      ImageViewer_OffsetModelFlow_0256
     * @tc.desc      OffsetModel call flow reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0256 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0257
     * @tc.name      ImageViewer_OffsetModelFlow_0257
     * @tc.desc      OffsetModel call flow reset > reset > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0257 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>reset>reset>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0258
     * @tc.name      ImageViewer_OffsetModelFlow_0258
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0258 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0259
     * @tc.name      ImageViewer_OffsetModelFlow_0259
     * @tc.desc      OffsetModel call flow reset > reset > toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0259 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0260
     * @tc.name      ImageViewer_OffsetModelFlow_0260
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0260 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0260 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0261
     * @tc.name      ImageViewer_OffsetModelFlow_0261
     * @tc.desc      OffsetModel call flow stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0261 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      logInfo(`stash>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0262
     * @tc.name      ImageViewer_OffsetModelFlow_0262
     * @tc.desc      OffsetModel call flow stash > toString > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0262 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0262 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0263
     * @tc.name      ImageViewer_OffsetModelFlow_0263
     * @tc.desc      OffsetModel call flow stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0263 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0263 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0264
     * @tc.name      ImageViewer_OffsetModelFlow_0264
     * @tc.desc      OffsetModel call flow reset > stash > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0264 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0264 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0265
     * @tc.name      ImageViewer_OffsetModelFlow_0265
     * @tc.desc      OffsetModel call flow stash > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0265 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`stash>reset>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0265 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0266
     * @tc.name      ImageViewer_OffsetModelFlow_0266
     * @tc.desc      OffsetModel call flow toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0266 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0266 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0267
     * @tc.name      ImageViewer_OffsetModelFlow_0267
     * @tc.desc      OffsetModel call flow reset > stash > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0267 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0267 end`);
    });
  });
}
