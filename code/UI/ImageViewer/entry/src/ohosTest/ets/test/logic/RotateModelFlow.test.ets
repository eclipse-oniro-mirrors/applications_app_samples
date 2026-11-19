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
import { RotateModel } from '../../../../main/ets/model/RotateModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for RotateModel flow (75 cases). */
export default function rotateModelFlowTest(): void {
  describe('RotateModelFlowTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0001
     * @tc.name      ImageViewer_RotateModelFlow_0001
     * @tc.desc      RotateModel call flow stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_RotateModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0001 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0002
     * @tc.name      ImageViewer_RotateModelFlow_0002
     * @tc.desc      RotateModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_RotateModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0002 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(140);
      logInfo(`${BUNDLE}RotateModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0003
     * @tc.name      ImageViewer_RotateModelFlow_0003
     * @tc.desc      RotateModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0003 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(279);
      logInfo(`${BUNDLE}RotateModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0004
     * @tc.name      ImageViewer_RotateModelFlow_0004
     * @tc.desc      RotateModel call flow stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0004 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0005
     * @tc.name      ImageViewer_RotateModelFlow_0005
     * @tc.desc      RotateModel call flow stash > reset > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0005 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`stash>reset>reset>stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0006
     * @tc.name      ImageViewer_RotateModelFlow_0006
     * @tc.desc      RotateModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0006 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0007
     * @tc.name      ImageViewer_RotateModelFlow_0007
     * @tc.desc      RotateModel call flow stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0007 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0008
     * @tc.name      ImageViewer_RotateModelFlow_0008
     * @tc.desc      RotateModel call flow reset > stash > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0008 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.stash();
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`reset>stash>stash>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0009
     * @tc.name      ImageViewer_RotateModelFlow_0009
     * @tc.desc      RotateModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0009 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0010
     * @tc.name      ImageViewer_RotateModelFlow_0010
     * @tc.desc      RotateModel call flow stash > reset > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0010 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`stash>reset>reset>stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0011
     * @tc.name      ImageViewer_RotateModelFlow_0011
     * @tc.desc      RotateModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0011 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0012
     * @tc.name      ImageViewer_RotateModelFlow_0012
     * @tc.desc      RotateModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0012 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0013
     * @tc.name      ImageViewer_RotateModelFlow_0013
     * @tc.desc      RotateModel call flow reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0013 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0014
     * @tc.name      ImageViewer_RotateModelFlow_0014
     * @tc.desc      RotateModel call flow reset > reset > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0014 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>stash>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0015
     * @tc.name      ImageViewer_RotateModelFlow_0015
     * @tc.desc      RotateModel call flow reset > stash > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0015 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.stash();
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`reset>stash>stash>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0016
     * @tc.name      ImageViewer_RotateModelFlow_0016
     * @tc.desc      RotateModel call flow stash > reset > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0016 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`stash>reset>reset>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0017
     * @tc.name      ImageViewer_RotateModelFlow_0017
     * @tc.desc      RotateModel call flow reset > reset > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0017 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>reset>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0018
     * @tc.name      ImageViewer_RotateModelFlow_0018
     * @tc.desc      RotateModel call flow reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0018 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0019
     * @tc.name      ImageViewer_RotateModelFlow_0019
     * @tc.desc      RotateModel call flow reset > reset > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0019 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`reset>reset>stash>stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0020
     * @tc.name      ImageViewer_RotateModelFlow_0020
     * @tc.desc      RotateModel call flow stash > reset > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0020 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`stash>reset>reset>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0021
     * @tc.name      ImageViewer_RotateModelFlow_0021
     * @tc.desc      RotateModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0021 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0022
     * @tc.name      ImageViewer_RotateModelFlow_0022
     * @tc.desc      RotateModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0022 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0023
     * @tc.name      ImageViewer_RotateModelFlow_0023
     * @tc.desc      RotateModel call flow reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0023 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0024
     * @tc.name      ImageViewer_RotateModelFlow_0024
     * @tc.desc      RotateModel call flow reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0024 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0025
     * @tc.name      ImageViewer_RotateModelFlow_0025
     * @tc.desc      RotateModel call flow stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0025 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0026
     * @tc.name      ImageViewer_RotateModelFlow_0026
     * @tc.desc      RotateModel call flow stash > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0026 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`stash>reset>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0027
     * @tc.name      ImageViewer_RotateModelFlow_0027
     * @tc.desc      RotateModel call flow reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0027 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0028
     * @tc.name      ImageViewer_RotateModelFlow_0028
     * @tc.desc      RotateModel call flow reset > reset > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0028 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0029
     * @tc.name      ImageViewer_RotateModelFlow_0029
     * @tc.desc      RotateModel call flow reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0029 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0030
     * @tc.name      ImageViewer_RotateModelFlow_0030
     * @tc.desc      RotateModel call flow stash > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0030 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`stash>reset>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0031
     * @tc.name      ImageViewer_RotateModelFlow_0031
     * @tc.desc      RotateModel call flow reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0031 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0032
     * @tc.name      ImageViewer_RotateModelFlow_0032
     * @tc.desc      RotateModel call flow stash > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0032 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>stash>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0033
     * @tc.name      ImageViewer_RotateModelFlow_0033
     * @tc.desc      RotateModel call flow stash > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0033 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`stash>reset>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0034
     * @tc.name      ImageViewer_RotateModelFlow_0034
     * @tc.desc      RotateModel call flow stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0034 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0035
     * @tc.name      ImageViewer_RotateModelFlow_0035
     * @tc.desc      RotateModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0035 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(140);
      logInfo(`${BUNDLE}RotateModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0036
     * @tc.name      ImageViewer_RotateModelFlow_0036
     * @tc.desc      RotateModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0036 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0037
     * @tc.name      ImageViewer_RotateModelFlow_0037
     * @tc.desc      RotateModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0037 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0038
     * @tc.name      ImageViewer_RotateModelFlow_0038
     * @tc.desc      RotateModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0038 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0039
     * @tc.name      ImageViewer_RotateModelFlow_0039
     * @tc.desc      RotateModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0039 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0040
     * @tc.name      ImageViewer_RotateModelFlow_0040
     * @tc.desc      RotateModel call flow stash > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0040 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(279);
      logInfo(`${BUNDLE}RotateModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0041
     * @tc.name      ImageViewer_RotateModelFlow_0041
     * @tc.desc      RotateModel call flow reset > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0041 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0042
     * @tc.name      ImageViewer_RotateModelFlow_0042
     * @tc.desc      RotateModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0042 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(279);
      logInfo(`${BUNDLE}RotateModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0043
     * @tc.name      ImageViewer_RotateModelFlow_0043
     * @tc.desc      RotateModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0043 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(140);
      logInfo(`${BUNDLE}RotateModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0044
     * @tc.name      ImageViewer_RotateModelFlow_0044
     * @tc.desc      RotateModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0044 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0045
     * @tc.name      ImageViewer_RotateModelFlow_0045
     * @tc.desc      RotateModel call flow reset > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0045 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0046
     * @tc.name      ImageViewer_RotateModelFlow_0046
     * @tc.desc      RotateModel call flow reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0046 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.stash();
      logInfo(`reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0047
     * @tc.name      ImageViewer_RotateModelFlow_0047
     * @tc.desc      RotateModel call flow stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0047 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0048
     * @tc.name      ImageViewer_RotateModelFlow_0048
     * @tc.desc      RotateModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0048 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0049
     * @tc.name      ImageViewer_RotateModelFlow_0049
     * @tc.desc      RotateModel call flow reset > reset > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0049 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0050
     * @tc.name      ImageViewer_RotateModelFlow_0050
     * @tc.desc      RotateModel call flow stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0050 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0051
     * @tc.name      ImageViewer_RotateModelFlow_0051
     * @tc.desc      RotateModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0051 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0052
     * @tc.name      ImageViewer_RotateModelFlow_0052
     * @tc.desc      RotateModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0052 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(279);
      logInfo(`${BUNDLE}RotateModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0053
     * @tc.name      ImageViewer_RotateModelFlow_0053
     * @tc.desc      RotateModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0053 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0054
     * @tc.name      ImageViewer_RotateModelFlow_0054
     * @tc.desc      RotateModel call flow reset > stash > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0054 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.stash();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`reset>stash>reset>stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0055
     * @tc.name      ImageViewer_RotateModelFlow_0055
     * @tc.desc      RotateModel call flow reset > reset > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0055 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>reset>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0056
     * @tc.name      ImageViewer_RotateModelFlow_0056
     * @tc.desc      RotateModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0056 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(279);
      logInfo(`${BUNDLE}RotateModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0057
     * @tc.name      ImageViewer_RotateModelFlow_0057
     * @tc.desc      RotateModel call flow stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0057 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0058
     * @tc.name      ImageViewer_RotateModelFlow_0058
     * @tc.desc      RotateModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0058 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(279);
      logInfo(`${BUNDLE}RotateModelFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0059
     * @tc.name      ImageViewer_RotateModelFlow_0059
     * @tc.desc      RotateModel call flow reset > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0059 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`reset>stash>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0060
     * @tc.name      ImageViewer_RotateModelFlow_0060
     * @tc.desc      RotateModel call flow stash > reset > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0060 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>reset>stash>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0061
     * @tc.name      ImageViewer_RotateModelFlow_0061
     * @tc.desc      RotateModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0061 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0062
     * @tc.name      ImageViewer_RotateModelFlow_0062
     * @tc.desc      RotateModel call flow reset > stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0062 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0063
     * @tc.name      ImageViewer_RotateModelFlow_0063
     * @tc.desc      RotateModel call flow stash > reset > stash > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0063 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.stash();
      subject.reset();
      logInfo(`stash>reset>stash>stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0064
     * @tc.name      ImageViewer_RotateModelFlow_0064
     * @tc.desc      RotateModel call flow reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0064 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0065
     * @tc.name      ImageViewer_RotateModelFlow_0065
     * @tc.desc      RotateModel call flow reset > stash > reset > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0065 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.stash();
      subject.reset();
      subject.reset();
      subject.reset();
      logInfo(`reset>stash>reset>reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0066
     * @tc.name      ImageViewer_RotateModelFlow_0066
     * @tc.desc      RotateModel call flow stash > reset > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0066 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>reset>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0067
     * @tc.name      ImageViewer_RotateModelFlow_0067
     * @tc.desc      RotateModel call flow stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0067 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0068
     * @tc.name      ImageViewer_RotateModelFlow_0068
     * @tc.desc      RotateModel call flow stash > reset > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0068 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      subject.stash();
      subject.reset();
      logInfo(`stash>reset>stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0069
     * @tc.name      ImageViewer_RotateModelFlow_0069
     * @tc.desc      RotateModel call flow stash > stash > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0069 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.stash();
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`stash>stash>stash>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0070
     * @tc.name      ImageViewer_RotateModelFlow_0070
     * @tc.desc      RotateModel call flow reset > reset > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0070 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.reset();
      subject.reset();
      subject.stash();
      logInfo(`reset>reset>reset>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0071
     * @tc.name      ImageViewer_RotateModelFlow_0071
     * @tc.desc      RotateModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0071 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(140);
      logInfo(`${BUNDLE}RotateModelFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0072
     * @tc.name      ImageViewer_RotateModelFlow_0072
     * @tc.desc      RotateModel call flow stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0072 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.stash();
      subject.reset();
      logInfo(`stash>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0073
     * @tc.name      ImageViewer_RotateModelFlow_0073
     * @tc.desc      RotateModel call flow reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0073 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0074
     * @tc.name      ImageViewer_RotateModelFlow_0074
     * @tc.desc      RotateModel call flow reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0074 begin`);
      const subject: RotateModel = new RotateModel(999);
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`reset>stash>stash final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_FLOW_0075
     * @tc.name      ImageViewer_RotateModelFlow_0075
     * @tc.desc      RotateModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelFlow_0075 begin`);
      const subject: RotateModel = new RotateModel(500);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`${BUNDLE}RotateModelFlow_0075 end`);
    });
  });
}
