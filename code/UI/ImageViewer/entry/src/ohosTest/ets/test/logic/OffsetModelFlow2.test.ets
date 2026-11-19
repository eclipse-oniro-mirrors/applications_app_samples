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

/** Logic checks for OffsetModel flow (60 cases). */
export default function offsetModelFlow2Test(): void {
  describe('OffsetModelFlow2Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0067
     * @tc.name      ImageViewer_OffsetModelFlow_0067
     * @tc.desc      OffsetModel call flow toString > toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0067 begin`);
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
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>toString>toString>toString>reset...: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0068
     * @tc.name      ImageViewer_OffsetModelFlow_0068
     * @tc.desc      OffsetModel call flow stash > toString > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0068 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0069
     * @tc.name      ImageViewer_OffsetModelFlow_0069
     * @tc.desc      OffsetModel call flow stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0069 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.reset();
      logInfo(`stash>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0070
     * @tc.name      ImageViewer_OffsetModelFlow_0070
     * @tc.desc      OffsetModel call flow reset > toString > stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0070 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`reset>toString>stash>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0071
     * @tc.name      ImageViewer_OffsetModelFlow_0071
     * @tc.desc      OffsetModel call flow stash > stash > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0071 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0072
     * @tc.name      ImageViewer_OffsetModelFlow_0072
     * @tc.desc      OffsetModel call flow stash > stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0072 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>stash>stash>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0073
     * @tc.name      ImageViewer_OffsetModelFlow_0073
     * @tc.desc      OffsetModel call flow toString > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0073 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`toString>toString>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0074
     * @tc.name      ImageViewer_OffsetModelFlow_0074
     * @tc.desc      OffsetModel call flow toString > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0074 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>toString>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0075
     * @tc.name      ImageViewer_OffsetModelFlow_0075
     * @tc.desc      OffsetModel call flow toString > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0075 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`toString>stash>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0076
     * @tc.name      ImageViewer_OffsetModelFlow_0076
     * @tc.desc      OffsetModel call flow reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0076 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0077
     * @tc.name      ImageViewer_OffsetModelFlow_0077
     * @tc.desc      OffsetModel call flow toString > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0077 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0078
     * @tc.name      ImageViewer_OffsetModelFlow_0078
     * @tc.desc      OffsetModel call flow reset > reset > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0078 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0079
     * @tc.name      ImageViewer_OffsetModelFlow_0079
     * @tc.desc      OffsetModel call flow toString > reset > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0079 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>reset>reset>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0080
     * @tc.name      ImageViewer_OffsetModelFlow_0080
     * @tc.desc      OffsetModel call flow stash > toString > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0080 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>toString>reset>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0081
     * @tc.name      ImageViewer_OffsetModelFlow_0081
     * @tc.desc      OffsetModel call flow toString > toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0081 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>toString>toString>toString>reset...: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0082
     * @tc.name      ImageViewer_OffsetModelFlow_0082
     * @tc.desc      OffsetModel call flow stash > stash > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0082 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`stash>stash>toString>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0083
     * @tc.name      ImageViewer_OffsetModelFlow_0083
     * @tc.desc      OffsetModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0083 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0084
     * @tc.name      ImageViewer_OffsetModelFlow_0084
     * @tc.desc      OffsetModel call flow toString > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0084 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0085
     * @tc.name      ImageViewer_OffsetModelFlow_0085
     * @tc.desc      OffsetModel call flow reset > toString > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0085 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0086
     * @tc.name      ImageViewer_OffsetModelFlow_0086
     * @tc.desc      OffsetModel call flow toString > stash > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0086 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0087
     * @tc.name      ImageViewer_OffsetModelFlow_0087
     * @tc.desc      OffsetModel call flow stash > toString > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0087 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.reset();
      logInfo(`stash>toString>stash>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0088
     * @tc.name      ImageViewer_OffsetModelFlow_0088
     * @tc.desc      OffsetModel call flow stash > toString > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0088 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`stash>toString>toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0089
     * @tc.name      ImageViewer_OffsetModelFlow_0089
     * @tc.desc      OffsetModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0089 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0090
     * @tc.name      ImageViewer_OffsetModelFlow_0090
     * @tc.desc      OffsetModel call flow stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0090 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0091
     * @tc.name      ImageViewer_OffsetModelFlow_0091
     * @tc.desc      OffsetModel call flow toString > toString > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0091 begin`);
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
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>toString>toString>toString>stash...: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0092
     * @tc.name      ImageViewer_OffsetModelFlow_0092
     * @tc.desc      OffsetModel call flow stash > toString > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0092 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>toString>toString>toString>toString...: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0093
     * @tc.name      ImageViewer_OffsetModelFlow_0093
     * @tc.desc      OffsetModel call flow stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0093 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0094
     * @tc.name      ImageViewer_OffsetModelFlow_0094
     * @tc.desc      OffsetModel call flow toString > toString > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0094 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>toString>reset>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0095
     * @tc.name      ImageViewer_OffsetModelFlow_0095
     * @tc.desc      OffsetModel call flow toString > stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0095 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0096
     * @tc.name      ImageViewer_OffsetModelFlow_0096
     * @tc.desc      OffsetModel call flow toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0096 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0097
     * @tc.name      ImageViewer_OffsetModelFlow_0097
     * @tc.desc      OffsetModel call flow toString > stash > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0097 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>stash>reset>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0098
     * @tc.name      ImageViewer_OffsetModelFlow_0098
     * @tc.desc      OffsetModel call flow stash > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0098 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>stash>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0099
     * @tc.name      ImageViewer_OffsetModelFlow_0099
     * @tc.desc      OffsetModel call flow stash > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0099 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>toString>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0100
     * @tc.name      ImageViewer_OffsetModelFlow_0100
     * @tc.desc      OffsetModel call flow toString > reset > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0100 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset>toString>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0101
     * @tc.name      ImageViewer_OffsetModelFlow_0101
     * @tc.desc      OffsetModel call flow toString > toString > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0101 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`toString>toString>stash>toString>toString...: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0102
     * @tc.name      ImageViewer_OffsetModelFlow_0102
     * @tc.desc      OffsetModel call flow stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0102 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0103
     * @tc.name      ImageViewer_OffsetModelFlow_0103
     * @tc.desc      OffsetModel call flow stash > toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0103 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>toString>toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0104
     * @tc.name      ImageViewer_OffsetModelFlow_0104
     * @tc.desc      OffsetModel call flow stash > stash > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0104 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      subject.reset();
      logInfo(`stash>stash>toString>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0105
     * @tc.name      ImageViewer_OffsetModelFlow_0105
     * @tc.desc      OffsetModel call flow toString > toString > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0105 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>toString>toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0106
     * @tc.name      ImageViewer_OffsetModelFlow_0106
     * @tc.desc      OffsetModel call flow stash > stash > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0106 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0107
     * @tc.name      ImageViewer_OffsetModelFlow_0107
     * @tc.desc      OffsetModel call flow stash > toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0107 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.reset();
      logInfo(`stash>toString>toString>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0108
     * @tc.name      ImageViewer_OffsetModelFlow_0108
     * @tc.desc      OffsetModel call flow toString > toString > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0108 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>toString>toString>reset>toString...: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0109
     * @tc.name      ImageViewer_OffsetModelFlow_0109
     * @tc.desc      OffsetModel call flow reset > toString > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0109 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString>stash>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0110
     * @tc.name      ImageViewer_OffsetModelFlow_0110
     * @tc.desc      OffsetModel call flow toString > toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0110 begin`);
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
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0111
     * @tc.name      ImageViewer_OffsetModelFlow_0111
     * @tc.desc      OffsetModel call flow stash > toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0111 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      logInfo(`stash>toString>toString>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0112
     * @tc.name      ImageViewer_OffsetModelFlow_0112
     * @tc.desc      OffsetModel call flow reset > toString > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0112 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
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
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString>toString>toString>toString...: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0113
     * @tc.name      ImageViewer_OffsetModelFlow_0113
     * @tc.desc      OffsetModel call flow toString > stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0113 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`toString>stash>toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0114
     * @tc.name      ImageViewer_OffsetModelFlow_0114
     * @tc.desc      OffsetModel call flow toString > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0114 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`toString>stash>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0115
     * @tc.name      ImageViewer_OffsetModelFlow_0115
     * @tc.desc      OffsetModel call flow stash > stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0115 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>stash>stash>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0116
     * @tc.name      ImageViewer_OffsetModelFlow_0116
     * @tc.desc      OffsetModel call flow toString > stash > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0116 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      subject.reset();
      logInfo(`toString>stash>stash>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0117
     * @tc.name      ImageViewer_OffsetModelFlow_0117
     * @tc.desc      OffsetModel call flow stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0117 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0118
     * @tc.name      ImageViewer_OffsetModelFlow_0118
     * @tc.desc      OffsetModel call flow toString > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0118 begin`);
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
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0119
     * @tc.name      ImageViewer_OffsetModelFlow_0119
     * @tc.desc      OffsetModel call flow toString > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0119 begin`);
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
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0120
     * @tc.name      ImageViewer_OffsetModelFlow_0120
     * @tc.desc      OffsetModel call flow stash > stash > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0120 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      logInfo(`stash>stash>toString>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0121
     * @tc.name      ImageViewer_OffsetModelFlow_0121
     * @tc.desc      OffsetModel call flow toString > stash > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0121 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`toString>stash>stash>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0122
     * @tc.name      ImageViewer_OffsetModelFlow_0122
     * @tc.desc      OffsetModel call flow toString > stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0122 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`toString>stash>toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0123
     * @tc.name      ImageViewer_OffsetModelFlow_0123
     * @tc.desc      OffsetModel call flow stash > stash > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0123 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>stash>toString>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0124
     * @tc.name      ImageViewer_OffsetModelFlow_0124
     * @tc.desc      OffsetModel call flow toString > reset > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0124 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>reset>stash>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0125
     * @tc.name      ImageViewer_OffsetModelFlow_0125
     * @tc.desc      OffsetModel call flow toString > toString > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0125 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      logInfo(`toString>toString>stash>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0126
     * @tc.name      ImageViewer_OffsetModelFlow_0126
     * @tc.desc      OffsetModel call flow reset > toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0126 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
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
      logInfo(`reset>toString>toString>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0126 end`);
    });
  });
}
