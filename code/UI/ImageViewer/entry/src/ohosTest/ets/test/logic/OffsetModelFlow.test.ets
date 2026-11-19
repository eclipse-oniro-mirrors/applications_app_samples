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

/** Logic checks for OffsetModel flow (66 cases). */
export default function offsetModelFlowTest(): void {
  describe('OffsetModelFlowTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0001
     * @tc.name      ImageViewer_OffsetModelFlow_0001
     * @tc.desc      OffsetModel call flow toString > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_OffsetModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0001 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0002
     * @tc.name      ImageViewer_OffsetModelFlow_0002
     * @tc.desc      OffsetModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_OffsetModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0002 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0003
     * @tc.name      ImageViewer_OffsetModelFlow_0003
     * @tc.desc      OffsetModel call flow stash > stash > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0003 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.reset();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>stash>reset>reset>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0004
     * @tc.name      ImageViewer_OffsetModelFlow_0004
     * @tc.desc      OffsetModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0004 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0005
     * @tc.name      ImageViewer_OffsetModelFlow_0005
     * @tc.desc      OffsetModel call flow reset > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0005 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0006
     * @tc.name      ImageViewer_OffsetModelFlow_0006
     * @tc.desc      OffsetModel call flow toString > stash > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0006 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`toString>stash>stash>stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0007
     * @tc.name      ImageViewer_OffsetModelFlow_0007
     * @tc.desc      OffsetModel call flow toString > stash > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0007 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0008
     * @tc.name      ImageViewer_OffsetModelFlow_0008
     * @tc.desc      OffsetModel call flow reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0008 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`reset>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0009
     * @tc.name      ImageViewer_OffsetModelFlow_0009
     * @tc.desc      OffsetModel call flow reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0009 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0010
     * @tc.name      ImageViewer_OffsetModelFlow_0010
     * @tc.desc      OffsetModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0010 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0011
     * @tc.name      ImageViewer_OffsetModelFlow_0011
     * @tc.desc      OffsetModel call flow toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0011 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0012
     * @tc.name      ImageViewer_OffsetModelFlow_0012
     * @tc.desc      OffsetModel call flow toString > stash > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0012 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0013
     * @tc.name      ImageViewer_OffsetModelFlow_0013
     * @tc.desc      OffsetModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0013 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0014
     * @tc.name      ImageViewer_OffsetModelFlow_0014
     * @tc.desc      OffsetModel call flow toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0014 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0015
     * @tc.name      ImageViewer_OffsetModelFlow_0015
     * @tc.desc      OffsetModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0015 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0016
     * @tc.name      ImageViewer_OffsetModelFlow_0016
     * @tc.desc      OffsetModel call flow stash > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0016 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0017
     * @tc.name      ImageViewer_OffsetModelFlow_0017
     * @tc.desc      OffsetModel call flow stash > stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0017 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>stash>toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0018
     * @tc.name      ImageViewer_OffsetModelFlow_0018
     * @tc.desc      OffsetModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0018 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0019
     * @tc.name      ImageViewer_OffsetModelFlow_0019
     * @tc.desc      OffsetModel call flow toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0019 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0020
     * @tc.name      ImageViewer_OffsetModelFlow_0020
     * @tc.desc      OffsetModel call flow stash > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0020 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>stash>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0021
     * @tc.name      ImageViewer_OffsetModelFlow_0021
     * @tc.desc      OffsetModel call flow toString > stash > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0021 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.reset();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0022
     * @tc.name      ImageViewer_OffsetModelFlow_0022
     * @tc.desc      OffsetModel call flow toString > reset > toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0022 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      logInfo(`toString>reset>toString>stash>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0023
     * @tc.name      ImageViewer_OffsetModelFlow_0023
     * @tc.desc      OffsetModel call flow stash > reset > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0023 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0024
     * @tc.name      ImageViewer_OffsetModelFlow_0024
     * @tc.desc      OffsetModel call flow reset > reset > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0024 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>reset>toString>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0025
     * @tc.name      ImageViewer_OffsetModelFlow_0025
     * @tc.desc      OffsetModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0025 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0026
     * @tc.name      ImageViewer_OffsetModelFlow_0026
     * @tc.desc      OffsetModel call flow toString > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0026 begin`);
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
      logInfo(`toString>stash>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0027
     * @tc.name      ImageViewer_OffsetModelFlow_0027
     * @tc.desc      OffsetModel call flow reset > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0027 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0028
     * @tc.name      ImageViewer_OffsetModelFlow_0028
     * @tc.desc      OffsetModel call flow stash > toString > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0028 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0029
     * @tc.name      ImageViewer_OffsetModelFlow_0029
     * @tc.desc      OffsetModel call flow toString > reset > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0029 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`${BUNDLE}OffsetModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0030
     * @tc.name      ImageViewer_OffsetModelFlow_0030
     * @tc.desc      OffsetModel call flow reset > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0030 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0031
     * @tc.name      ImageViewer_OffsetModelFlow_0031
     * @tc.desc      OffsetModel call flow toString > toString > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0031 begin`);
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
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0032
     * @tc.name      ImageViewer_OffsetModelFlow_0032
     * @tc.desc      OffsetModel call flow toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0032 begin`);
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
      logInfo(`toString>toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0033
     * @tc.name      ImageViewer_OffsetModelFlow_0033
     * @tc.desc      OffsetModel call flow toString > toString > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0033 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`toString>toString>reset>stash>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0034
     * @tc.name      ImageViewer_OffsetModelFlow_0034
     * @tc.desc      OffsetModel call flow toString > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0034 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 999 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0035
     * @tc.name      ImageViewer_OffsetModelFlow_0035
     * @tc.desc      OffsetModel call flow stash > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0035 begin`);
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
      logInfo(`stash>toString>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0036
     * @tc.name      ImageViewer_OffsetModelFlow_0036
     * @tc.desc      OffsetModel call flow toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0036 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0037
     * @tc.name      ImageViewer_OffsetModelFlow_0037
     * @tc.desc      OffsetModel call flow toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0037 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`toString>toString>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0038
     * @tc.name      ImageViewer_OffsetModelFlow_0038
     * @tc.desc      OffsetModel call flow stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0038 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0039
     * @tc.name      ImageViewer_OffsetModelFlow_0039
     * @tc.desc      OffsetModel call flow toString > reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0039 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      logInfo(`toString>reset>toString>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0040
     * @tc.name      ImageViewer_OffsetModelFlow_0040
     * @tc.desc      OffsetModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0040 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0041
     * @tc.name      ImageViewer_OffsetModelFlow_0041
     * @tc.desc      OffsetModel call flow toString > toString > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0041 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0042
     * @tc.name      ImageViewer_OffsetModelFlow_0042
     * @tc.desc      OffsetModel call flow toString > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0042 begin`);
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
      subject.stash();
      logInfo(`toString>toString>toString>stash final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0043
     * @tc.name      ImageViewer_OffsetModelFlow_0043
     * @tc.desc      OffsetModel call flow stash > toString > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0043 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>toString>stash>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0044
     * @tc.name      ImageViewer_OffsetModelFlow_0044
     * @tc.desc      OffsetModel call flow reset > reset > toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0044 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.stash();
      logInfo(`reset>reset>toString>toString>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0045
     * @tc.name      ImageViewer_OffsetModelFlow_0045
     * @tc.desc      OffsetModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0045 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0046
     * @tc.name      ImageViewer_OffsetModelFlow_0046
     * @tc.desc      OffsetModel call flow stash > stash > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0046 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0047
     * @tc.name      ImageViewer_OffsetModelFlow_0047
     * @tc.desc      OffsetModel call flow stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0047 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0048
     * @tc.name      ImageViewer_OffsetModelFlow_0048
     * @tc.desc      OffsetModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0048 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0049
     * @tc.name      ImageViewer_OffsetModelFlow_0049
     * @tc.desc      OffsetModel call flow toString > toString > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0049 begin`);
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
      subject.reset();
      subject.reset();
      logInfo(`toString>toString>toString>reset>reset final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0050
     * @tc.name      ImageViewer_OffsetModelFlow_0050
     * @tc.desc      OffsetModel call flow stash > toString > toString > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0050 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      subject.stash();
      logInfo(`stash>toString>toString>reset>stash final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0051
     * @tc.name      ImageViewer_OffsetModelFlow_0051
     * @tc.desc      OffsetModel call flow reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0051 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0052
     * @tc.name      ImageViewer_OffsetModelFlow_0052
     * @tc.desc      OffsetModel call flow reset > toString > reset > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0052 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>toString>reset>stash>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0053
     * @tc.name      ImageViewer_OffsetModelFlow_0053
     * @tc.desc      OffsetModel call flow stash > toString > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0053 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0054
     * @tc.name      ImageViewer_OffsetModelFlow_0054
     * @tc.desc      OffsetModel call flow toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0054 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0055
     * @tc.name      ImageViewer_OffsetModelFlow_0055
     * @tc.desc      OffsetModel call flow toString > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0055 begin`);
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
      subject.reset();
      logInfo(`${BUNDLE}OffsetModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0056
     * @tc.name      ImageViewer_OffsetModelFlow_0056
     * @tc.desc      OffsetModel call flow stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0056 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>stash>toString>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0057
     * @tc.name      ImageViewer_OffsetModelFlow_0057
     * @tc.desc      OffsetModel call flow reset > stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0057 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`reset>stash>stash>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0058
     * @tc.name      ImageViewer_OffsetModelFlow_0058
     * @tc.desc      OffsetModel call flow stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0058 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 500 currentY: 0 lastX: 500 lastY: 0]');
      logInfo(`stash>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(500);
      logInfo(`${BUNDLE}OffsetModelFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0059
     * @tc.name      ImageViewer_OffsetModelFlow_0059
     * @tc.desc      OffsetModel call flow toString > stash > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0059 begin`);
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
      logInfo(`${BUNDLE}OffsetModelFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0060
     * @tc.name      ImageViewer_OffsetModelFlow_0060
     * @tc.desc      OffsetModel call flow stash > toString > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0060 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`stash>toString>reset>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0061
     * @tc.name      ImageViewer_OffsetModelFlow_0061
     * @tc.desc      OffsetModel call flow stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0061 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0062
     * @tc.name      ImageViewer_OffsetModelFlow_0062
     * @tc.desc      OffsetModel call flow toString > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0062 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`toString>reset>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0063
     * @tc.name      ImageViewer_OffsetModelFlow_0063
     * @tc.desc      OffsetModel call flow reset > stash > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0063 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0064
     * @tc.name      ImageViewer_OffsetModelFlow_0064
     * @tc.desc      OffsetModel call flow reset > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0064 begin`);
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
      logInfo(`reset>toString>toString>toString final: subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0065
     * @tc.name      ImageViewer_OffsetModelFlow_0065
     * @tc.desc      OffsetModel call flow stash > toString > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0065 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      subject.stash();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[currentX: 999 currentY: 0 lastX: 999 lastY: 0]');
      logInfo(`stash>toString>stash>stash>toString final: subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(999);
      logInfo(`${BUNDLE}OffsetModelFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_FLOW_0066
     * @tc.name      ImageViewer_OffsetModelFlow_0066
     * @tc.desc      OffsetModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelFlow_0066 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[currentX: 500 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelFlow_0066 end`);
    });
  });
}
