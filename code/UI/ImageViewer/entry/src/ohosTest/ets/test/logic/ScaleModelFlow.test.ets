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

/** Logic checks for ScaleModel flow (63 cases). */
export default function scaleModelFlowTest(): void {
  describe('ScaleModelFlowTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0001
     * @tc.name      ImageViewer_ScaleModelFlow_0001
     * @tc.desc      ScaleModel call flow toString > stash > reset > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_ScaleModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0001 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      subject.reset();
      subject.stash();
      logInfo(`toString>stash>reset>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0002
     * @tc.name      ImageViewer_ScaleModelFlow_0002
     * @tc.desc      ScaleModel call flow reset > toString > toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_ScaleModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0002 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      subject.stash();
      logInfo(`reset>toString>toString>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>toString>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0003
     * @tc.name      ImageViewer_ScaleModelFlow_0003
     * @tc.desc      ScaleModel call flow reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0003 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0004
     * @tc.name      ImageViewer_ScaleModelFlow_0004
     * @tc.desc      ScaleModel call flow toString > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0004 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0005
     * @tc.name      ImageViewer_ScaleModelFlow_0005
     * @tc.desc      ScaleModel call flow reset > reset > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0005 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      subject.reset();
      logInfo(`reset>reset>toString>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>toString>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0006
     * @tc.name      ImageViewer_ScaleModelFlow_0006
     * @tc.desc      ScaleModel call flow toString > reset > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0006 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0007
     * @tc.name      ImageViewer_ScaleModelFlow_0007
     * @tc.desc      ScaleModel call flow reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0007 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.reset();
      subject.reset();
      logInfo(`reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0008
     * @tc.name      ImageViewer_ScaleModelFlow_0008
     * @tc.desc      ScaleModel call flow toString > reset > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0008 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>toString>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0009
     * @tc.name      ImageViewer_ScaleModelFlow_0009
     * @tc.desc      ScaleModel call flow stash > toString > stash > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0009 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.stash();
      subject.reset();
      subject.reset();
      logInfo(`stash>toString>stash>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>stash>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0010
     * @tc.name      ImageViewer_ScaleModelFlow_0010
     * @tc.desc      ScaleModel call flow reset > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0010 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>stash>toString>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0011
     * @tc.name      ImageViewer_ScaleModelFlow_0011
     * @tc.desc      ScaleModel call flow toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0011 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0012
     * @tc.name      ImageViewer_ScaleModelFlow_0012
     * @tc.desc      ScaleModel call flow toString > toString > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0012 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0013
     * @tc.name      ImageViewer_ScaleModelFlow_0013
     * @tc.desc      ScaleModel call flow reset > toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0013 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
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
      logInfo(`reset>toString>toString>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0014
     * @tc.name      ImageViewer_ScaleModelFlow_0014
     * @tc.desc      ScaleModel call flow toString > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0014 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0015
     * @tc.name      ImageViewer_ScaleModelFlow_0015
     * @tc.desc      ScaleModel call flow stash > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0015 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0016
     * @tc.name      ImageViewer_ScaleModelFlow_0016
     * @tc.desc      ScaleModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0016 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      logInfo(`toString>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0017
     * @tc.name      ImageViewer_ScaleModelFlow_0017
     * @tc.desc      ScaleModel call flow reset > reset > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0017 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      subject.reset();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>reset>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>reset>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0018
     * @tc.name      ImageViewer_ScaleModelFlow_0018
     * @tc.desc      ScaleModel call flow stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0018 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.stash();
      logInfo(`stash>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0019
     * @tc.name      ImageViewer_ScaleModelFlow_0019
     * @tc.desc      ScaleModel call flow toString > stash > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0019 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`toString>stash>reset>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0020
     * @tc.name      ImageViewer_ScaleModelFlow_0020
     * @tc.desc      ScaleModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0020 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      logInfo(`toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0021
     * @tc.name      ImageViewer_ScaleModelFlow_0021
     * @tc.desc      ScaleModel call flow toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0021 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`toString>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0022
     * @tc.name      ImageViewer_ScaleModelFlow_0022
     * @tc.desc      ScaleModel call flow stash > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0022 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0023
     * @tc.name      ImageViewer_ScaleModelFlow_0023
     * @tc.desc      ScaleModel call flow toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0023 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`toString>toString>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0024
     * @tc.name      ImageViewer_ScaleModelFlow_0024
     * @tc.desc      ScaleModel call flow stash > toString > toString > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0024 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.reset();
      logInfo(`stash>toString>toString>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>toString>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0025
     * @tc.name      ImageViewer_ScaleModelFlow_0025
     * @tc.desc      ScaleModel call flow stash > stash > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0025 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`stash>stash>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>stash>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0026
     * @tc.name      ImageViewer_ScaleModelFlow_0026
     * @tc.desc      ScaleModel call flow reset > toString > stash > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0026 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      subject.reset();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString>stash>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>stash>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0027
     * @tc.name      ImageViewer_ScaleModelFlow_0027
     * @tc.desc      ScaleModel call flow stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0027 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`stash>stash>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0028
     * @tc.name      ImageViewer_ScaleModelFlow_0028
     * @tc.desc      ScaleModel call flow toString > toString > reset > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0028 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      subject.reset();
      logInfo(`toString>toString>reset>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0029
     * @tc.name      ImageViewer_ScaleModelFlow_0029
     * @tc.desc      ScaleModel call flow toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0029 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.stash();
      subject.reset();
      logInfo(`toString>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0030
     * @tc.name      ImageViewer_ScaleModelFlow_0030
     * @tc.desc      ScaleModel call flow toString > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0030 begin`);
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
      logInfo(`toString>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0031
     * @tc.name      ImageViewer_ScaleModelFlow_0031
     * @tc.desc      ScaleModel call flow toString > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0031 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0032
     * @tc.name      ImageViewer_ScaleModelFlow_0032
     * @tc.desc      ScaleModel call flow stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0032 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`stash>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0033
     * @tc.name      ImageViewer_ScaleModelFlow_0033
     * @tc.desc      ScaleModel call flow toString > reset > reset > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0033 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.stash();
      logInfo(`toString>reset>reset>toString>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>reset>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0034
     * @tc.name      ImageViewer_ScaleModelFlow_0034
     * @tc.desc      ScaleModel call flow toString > reset > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0034 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>stash>toString>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>stash>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0035
     * @tc.name      ImageViewer_ScaleModelFlow_0035
     * @tc.desc      ScaleModel call flow toString > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0035 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0036
     * @tc.name      ImageViewer_ScaleModelFlow_0036
     * @tc.desc      ScaleModel call flow toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0036 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0037
     * @tc.name      ImageViewer_ScaleModelFlow_0037
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0037 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0038
     * @tc.name      ImageViewer_ScaleModelFlow_0038
     * @tc.desc      ScaleModel call flow toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0038 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0039
     * @tc.name      ImageViewer_ScaleModelFlow_0039
     * @tc.desc      ScaleModel call flow toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0039 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.stash();
      logInfo(`toString>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0040
     * @tc.name      ImageViewer_ScaleModelFlow_0040
     * @tc.desc      ScaleModel call flow stash > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0040 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      logInfo(`stash>toString>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0041
     * @tc.name      ImageViewer_ScaleModelFlow_0041
     * @tc.desc      ScaleModel call flow reset > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0041 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.reset();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 1 lastValue: 1]');
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>toString>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>toString>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0042
     * @tc.name      ImageViewer_ScaleModelFlow_0042
     * @tc.desc      ScaleModel call flow toString > reset > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0042 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.5 lastValue: 0]');
      subject.reset();
      subject.reset();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`toString>reset>reset>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>reset>reset>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0043
     * @tc.name      ImageViewer_ScaleModelFlow_0043
     * @tc.desc      ScaleModel call flow toString > toString > reset > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0043 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.reset();
      subject.stash();
      subject.stash();
      logInfo(`toString>toString>reset>stash>stash final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`toString>toString>reset>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0044
     * @tc.name      ImageViewer_ScaleModelFlow_0044
     * @tc.desc      ScaleModel call flow stash > toString > toString > stash > reset keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0044 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.stash();
      subject.reset();
      logInfo(`stash>toString>toString>stash>reset final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`stash>toString>toString>stash>reset final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0045
     * @tc.name      ImageViewer_ScaleModelFlow_0045
     * @tc.desc      ScaleModel call flow stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0045 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0046
     * @tc.name      ImageViewer_ScaleModelFlow_0046
     * @tc.desc      ScaleModel call flow toString > toString > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0046 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0047
     * @tc.name      ImageViewer_ScaleModelFlow_0047
     * @tc.desc      ScaleModel call flow stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0047 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      subject.stash();
      logInfo(`stash>toString>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0048
     * @tc.name      ImageViewer_ScaleModelFlow_0048
     * @tc.desc      ScaleModel call flow stash > toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0048 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0049
     * @tc.name      ImageViewer_ScaleModelFlow_0049
     * @tc.desc      ScaleModel call flow stash > stash > stash > toString > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0049 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      subject.stash();
      logInfo(`${BUNDLE}ScaleModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0050
     * @tc.name      ImageViewer_ScaleModelFlow_0050
     * @tc.desc      ScaleModel call flow toString > stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0050 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`toString>stash>stash>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0051
     * @tc.name      ImageViewer_ScaleModelFlow_0051
     * @tc.desc      ScaleModel call flow toString > toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0051 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0.25 lastValue: 0.25]');
      logInfo(`toString>toString>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0052
     * @tc.name      ImageViewer_ScaleModelFlow_0052
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0052 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0.25 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0053
     * @tc.name      ImageViewer_ScaleModelFlow_0053
     * @tc.desc      ScaleModel call flow stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0053 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      subject.stash();
      subject.stash();
      logInfo(`stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0054
     * @tc.name      ImageViewer_ScaleModelFlow_0054
     * @tc.desc      ScaleModel call flow reset > stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0054 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 1 lastValue: 1]');
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>stash>stash>toString>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>stash>toString>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0055
     * @tc.name      ImageViewer_ScaleModelFlow_0055
     * @tc.desc      ScaleModel call flow reset > stash > stash > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0055 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.reset();
      subject.stash();
      subject.stash();
      subject.stash();
      const step5: string = subject.toString();
      logInfo(`step5 toString(): step5=${step5}`);
      expect(step5).assertEqual('[scaleValue: 1 lastValue: 1]');
      logInfo(`reset>stash>stash>stash>toString final: subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`reset>stash>stash>stash>toString final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0056
     * @tc.name      ImageViewer_ScaleModelFlow_0056
     * @tc.desc      ScaleModel call flow stash > stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0056 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step4: string = subject.toString();
      logInfo(`step4 toString(): step4=${step4}`);
      expect(step4).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0057
     * @tc.name      ImageViewer_ScaleModelFlow_0057
     * @tc.desc      ScaleModel call flow toString > reset > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0057 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0058
     * @tc.name      ImageViewer_ScaleModelFlow_0058
     * @tc.desc      ScaleModel call flow toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0058 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      const step1: string = subject.toString();
      logInfo(`step1 toString(): step1=${step1}`);
      expect(step1).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0059
     * @tc.name      ImageViewer_ScaleModelFlow_0059
     * @tc.desc      ScaleModel call flow toString > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0059 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0060
     * @tc.name      ImageViewer_ScaleModelFlow_0060
     * @tc.desc      ScaleModel call flow toString > stash > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0060 begin`);
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
      logInfo(`${BUNDLE}ScaleModelFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0061
     * @tc.name      ImageViewer_ScaleModelFlow_0061
     * @tc.desc      ScaleModel call flow stash > stash > toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0061 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      subject.stash();
      subject.stash();
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0.5 lastValue: 0.5]');
      subject.stash();
      subject.stash();
      logInfo(`stash>stash>toString>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0062
     * @tc.name      ImageViewer_ScaleModelFlow_0062
     * @tc.desc      ScaleModel call flow toString > toString > toString > stash > stash keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0062 begin`);
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
      subject.stash();
      logInfo(`toString>toString>toString>stash>stash final: subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}ScaleModelFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_FLOW_0063
     * @tc.name      ImageViewer_ScaleModelFlow_0063
     * @tc.desc      ScaleModel call flow stash > toString > toString keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelFlow_0063 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      subject.stash();
      const step2: string = subject.toString();
      logInfo(`step2 toString(): step2=${step2}`);
      expect(step2).assertEqual('[scaleValue: 0 lastValue: 0]');
      const step3: string = subject.toString();
      logInfo(`step3 toString(): step3=${step3}`);
      expect(step3).assertEqual('[scaleValue: 0 lastValue: 0]');
      logInfo(`${BUNDLE}ScaleModelFlow_0063 end`);
    });
  });
}
