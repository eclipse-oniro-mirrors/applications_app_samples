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
import { logInfo, BUNDLE } from '../common/CameraTestSupport';
import {
  SlideModel,
} from '../model/CameraLogic';

/** SlideModelFlowTest logic checks (46 cases). */
export default function slideModelFlowTest(): void {
  describe('SlideModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0001
     * @tc.name      Camera_SlideModelFlow_0001
     * @tc.desc      slider change -0.5 under range 1-6 lands on 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SlideModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0001 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6);
      logInfo("change(-0.5) range=1-6");
      const actual: number = subject.change(-0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0002
     * @tc.name      Camera_SlideModelFlow_0002
     * @tc.desc      slider change -0.19 under range 1-8 lands on 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0002 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 8);
      logInfo("change(-0.19) range=1-8");
      const actual: number = subject.change(-0.19);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0003
     * @tc.name      Camera_SlideModelFlow_0003
     * @tc.desc      slider change 0.12 under range 1-10 lands on 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0003 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 10);
      logInfo("change(0.12) range=1-10");
      const actual: number = subject.change(0.12);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0004
     * @tc.name      Camera_SlideModelFlow_0004
     * @tc.desc      slider change 0.43 under range 0.5-5 lands on 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0004 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(0.5, 5);
      logInfo("change(0.43) range=0.5-5");
      const actual: number = subject.change(0.43);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0005
     * @tc.name      Camera_SlideModelFlow_0005
     * @tc.desc      slider change 0.74 under range 1-3 lands on 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0005 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 3);
      logInfo("change(0.74) range=1-3");
      const actual: number = subject.change(0.74);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0006
     * @tc.name      Camera_SlideModelFlow_0006
     * @tc.desc      slider change 1.05 under range 1-6.5 lands on 1.05.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0006 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6.5);
      logInfo("change(1.05) range=1-6.5");
      const actual: number = subject.change(1.05);
      logInfo('actual=' + String(actual) + ', expected=' + "1.05");
      expect(actual).assertEqual(1.05);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0007
     * @tc.name      Camera_SlideModelFlow_0007
     * @tc.desc      slider change 1.36 under range 1-6 lands on 1.36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0007 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6);
      logInfo("change(1.36) range=1-6");
      const actual: number = subject.change(1.36);
      logInfo('actual=' + String(actual) + ', expected=' + "1.36");
      expect(actual).assertEqual(1.36);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0008
     * @tc.name      Camera_SlideModelFlow_0008
     * @tc.desc      slider change 1.67 under range 1-8 lands on 1.67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0008 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 8);
      logInfo("change(1.67) range=1-8");
      const actual: number = subject.change(1.67);
      logInfo('actual=' + String(actual) + ', expected=' + "1.67");
      expect(actual).assertEqual(1.67);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0009
     * @tc.name      Camera_SlideModelFlow_0009
     * @tc.desc      slider change 1.98 under range 1-10 lands on 1.98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0009 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 10);
      logInfo("change(1.98) range=1-10");
      const actual: number = subject.change(1.98);
      logInfo('actual=' + String(actual) + ', expected=' + "1.98");
      expect(actual).assertEqual(1.98);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0010
     * @tc.name      Camera_SlideModelFlow_0010
     * @tc.desc      slider change 2.29 under range 0.5-5 lands on 2.29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0010 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(0.5, 5);
      logInfo("change(2.29) range=0.5-5");
      const actual: number = subject.change(2.29);
      logInfo('actual=' + String(actual) + ', expected=' + "2.29");
      expect(actual).assertEqual(2.29);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0011
     * @tc.name      Camera_SlideModelFlow_0011
     * @tc.desc      slider change 2.6 under range 1-3 lands on 2.6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0011 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 3);
      logInfo("change(2.6) range=1-3");
      const actual: number = subject.change(2.6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.6");
      expect(actual).assertEqual(2.6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0012
     * @tc.name      Camera_SlideModelFlow_0012
     * @tc.desc      slider change 2.91 under range 1-6.5 lands on 2.91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SlideModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0012 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6.5);
      logInfo("change(2.91) range=1-6.5");
      const actual: number = subject.change(2.91);
      logInfo('actual=' + String(actual) + ', expected=' + "2.91");
      expect(actual).assertEqual(2.91);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0013
     * @tc.name      Camera_SlideModelFlow_0013
     * @tc.desc      slider change 3.22 under range 1-6 lands on 3.22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0013 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6);
      logInfo("change(3.22) range=1-6");
      const actual: number = subject.change(3.22);
      logInfo('actual=' + String(actual) + ', expected=' + "3.22");
      expect(actual).assertEqual(3.22);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0014
     * @tc.name      Camera_SlideModelFlow_0014
     * @tc.desc      slider change 3.53 under range 1-8 lands on 3.53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0014 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 8);
      logInfo("change(3.53) range=1-8");
      const actual: number = subject.change(3.53);
      logInfo('actual=' + String(actual) + ', expected=' + "3.53");
      expect(actual).assertEqual(3.53);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0015
     * @tc.name      Camera_SlideModelFlow_0015
     * @tc.desc      slider change 3.84 under range 1-10 lands on 3.84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0015 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 10);
      logInfo("change(3.84) range=1-10");
      const actual: number = subject.change(3.84);
      logInfo('actual=' + String(actual) + ', expected=' + "3.84");
      expect(actual).assertEqual(3.84);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0016
     * @tc.name      Camera_SlideModelFlow_0016
     * @tc.desc      slider change 4.15 under range 0.5-5 lands on 4.15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0016 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(0.5, 5);
      logInfo("change(4.15) range=0.5-5");
      const actual: number = subject.change(4.15);
      logInfo('actual=' + String(actual) + ', expected=' + "4.15");
      expect(actual).assertEqual(4.15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0017
     * @tc.name      Camera_SlideModelFlow_0017
     * @tc.desc      slider change 4.46 under range 1-3 lands on 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0017 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 3);
      logInfo("change(4.46) range=1-3");
      const actual: number = subject.change(4.46);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0018
     * @tc.name      Camera_SlideModelFlow_0018
     * @tc.desc      slider change 4.77 under range 1-6.5 lands on 4.77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SlideModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0018 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6.5);
      logInfo("change(4.77) range=1-6.5");
      const actual: number = subject.change(4.77);
      logInfo('actual=' + String(actual) + ', expected=' + "4.77");
      expect(actual).assertEqual(4.77);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0019
     * @tc.name      Camera_SlideModelFlow_0019
     * @tc.desc      slider change 5.08 under range 1-6 lands on 5.08.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0019 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6);
      logInfo("change(5.08) range=1-6");
      const actual: number = subject.change(5.08);
      logInfo('actual=' + String(actual) + ', expected=' + "5.08");
      expect(actual).assertEqual(5.08);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0020
     * @tc.name      Camera_SlideModelFlow_0020
     * @tc.desc      slider change 5.39 under range 1-8 lands on 5.39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0020 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 8);
      logInfo("change(5.39) range=1-8");
      const actual: number = subject.change(5.39);
      logInfo('actual=' + String(actual) + ', expected=' + "5.39");
      expect(actual).assertEqual(5.39);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0021
     * @tc.name      Camera_SlideModelFlow_0021
     * @tc.desc      slider change 5.7 under range 1-10 lands on 5.7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0021 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 10);
      logInfo("change(5.7) range=1-10");
      const actual: number = subject.change(5.7);
      logInfo('actual=' + String(actual) + ', expected=' + "5.7");
      expect(actual).assertEqual(5.7);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0022
     * @tc.name      Camera_SlideModelFlow_0022
     * @tc.desc      slider change 6.01 under range 0.5-5 lands on 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0022 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(0.5, 5);
      logInfo("change(6.01) range=0.5-5");
      const actual: number = subject.change(6.01);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0023
     * @tc.name      Camera_SlideModelFlow_0023
     * @tc.desc      slider change 6.32 under range 1-3 lands on 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SlideModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0023 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 3);
      logInfo("change(6.32) range=1-3");
      const actual: number = subject.change(6.32);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0024
     * @tc.name      Camera_SlideModelFlow_0024
     * @tc.desc      slider change 6.63 under range 1-6.5 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0024 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6.5);
      logInfo("change(6.63) range=1-6.5");
      const actual: number = subject.change(6.63);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0025
     * @tc.name      Camera_SlideModelFlow_0025
     * @tc.desc      slider change 6.94 under range 1-6 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0025 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6);
      logInfo("change(6.94) range=1-6");
      const actual: number = subject.change(6.94);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0026
     * @tc.name      Camera_SlideModelFlow_0026
     * @tc.desc      slider change 7.25 under range 1-8 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0026 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 8);
      logInfo("change(7.25) range=1-8");
      const actual: number = subject.change(7.25);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0027
     * @tc.name      Camera_SlideModelFlow_0027
     * @tc.desc      slider change 7.56 under range 1-10 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0027 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 10);
      logInfo("change(7.56) range=1-10");
      const actual: number = subject.change(7.56);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0028
     * @tc.name      Camera_SlideModelFlow_0028
     * @tc.desc      slider change 7.87 under range 0.5-5 lands on 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0028 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(0.5, 5);
      logInfo("change(7.87) range=0.5-5");
      const actual: number = subject.change(7.87);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0029
     * @tc.name      Camera_SlideModelFlow_0029
     * @tc.desc      slider change 8.18 under range 1-3 lands on 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0029 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 3);
      logInfo("change(8.18) range=1-3");
      const actual: number = subject.change(8.18);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0030
     * @tc.name      Camera_SlideModelFlow_0030
     * @tc.desc      slider change 8.49 under range 1-6.5 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0030 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6.5);
      logInfo("change(8.49) range=1-6.5");
      const actual: number = subject.change(8.49);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0031
     * @tc.name      Camera_SlideModelFlow_0031
     * @tc.desc      slider change 8.8 under range 1-6 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0031 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6);
      logInfo("change(8.8) range=1-6");
      const actual: number = subject.change(8.8);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0032
     * @tc.name      Camera_SlideModelFlow_0032
     * @tc.desc      slider change 9.11 under range 1-8 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0032 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 8);
      logInfo("change(9.11) range=1-8");
      const actual: number = subject.change(9.11);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0033
     * @tc.name      Camera_SlideModelFlow_0033
     * @tc.desc      slider change 9.42 under range 1-10 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0033 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 10);
      logInfo("change(9.42) range=1-10");
      const actual: number = subject.change(9.42);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0034
     * @tc.name      Camera_SlideModelFlow_0034
     * @tc.desc      slider change 9.73 under range 0.5-5 lands on 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SlideModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0034 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(0.5, 5);
      logInfo("change(9.73) range=0.5-5");
      const actual: number = subject.change(9.73);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0035
     * @tc.name      Camera_SlideModelFlow_0035
     * @tc.desc      slider change 10.04 under range 1-3 lands on 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SlideModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0035 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 3);
      logInfo("change(10.04) range=1-3");
      const actual: number = subject.change(10.04);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0036
     * @tc.name      Camera_SlideModelFlow_0036
     * @tc.desc      slider change 10.35 under range 1-6.5 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0036 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6.5);
      logInfo("change(10.35) range=1-6.5");
      const actual: number = subject.change(10.35);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0037
     * @tc.name      Camera_SlideModelFlow_0037
     * @tc.desc      slider change 10.66 under range 1-6 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0037 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6);
      logInfo("change(10.66) range=1-6");
      const actual: number = subject.change(10.66);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0038
     * @tc.name      Camera_SlideModelFlow_0038
     * @tc.desc      slider change 10.97 under range 1-8 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0038 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 8);
      logInfo("change(10.97) range=1-8");
      const actual: number = subject.change(10.97);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0039
     * @tc.name      Camera_SlideModelFlow_0039
     * @tc.desc      slider change 11.28 under range 1-10 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0039 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 10);
      logInfo("change(11.28) range=1-10");
      const actual: number = subject.change(11.28);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0040
     * @tc.name      Camera_SlideModelFlow_0040
     * @tc.desc      slider change 11.59 under range 0.5-5 lands on 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0040 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(0.5, 5);
      logInfo("change(11.59) range=0.5-5");
      const actual: number = subject.change(11.59);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0041
     * @tc.name      Camera_SlideModelFlow_0041
     * @tc.desc      slider change 11.9 under range 1-3 lands on 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0041 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 3);
      logInfo("change(11.9) range=1-3");
      const actual: number = subject.change(11.9);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0042
     * @tc.name      Camera_SlideModelFlow_0042
     * @tc.desc      slider change 12.21 under range 1-6.5 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0042 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6.5);
      logInfo("change(12.21) range=1-6.5");
      const actual: number = subject.change(12.21);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0043
     * @tc.name      Camera_SlideModelFlow_0043
     * @tc.desc      slider change 12.52 under range 1-6 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0043 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 6);
      logInfo("change(12.52) range=1-6");
      const actual: number = subject.change(12.52);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0044
     * @tc.name      Camera_SlideModelFlow_0044
     * @tc.desc      slider change 12.83 under range 1-8 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0044 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 8);
      logInfo("change(12.83) range=1-8");
      const actual: number = subject.change(12.83);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0045
     * @tc.name      Camera_SlideModelFlow_0045
     * @tc.desc      slider change 13.14 under range 1-10 lands on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SlideModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0045 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(1, 10);
      logInfo("change(13.14) range=1-10");
      const actual: number = subject.change(13.14);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDE_MODEL_FLOW_0046
     * @tc.name      Camera_SlideModelFlow_0046
     * @tc.desc      slider change 13.45 under range 0.5-5 lands on 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SlideModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SlideModelFlow_0046 begin`);
      const subject: SlideModel = new SlideModel();
      subject.setRange(0.5, 5);
      logInfo("change(13.45) range=0.5-5");
      const actual: number = subject.change(13.45);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SlideModelFlow_0046 end`);
    });
  });
}
