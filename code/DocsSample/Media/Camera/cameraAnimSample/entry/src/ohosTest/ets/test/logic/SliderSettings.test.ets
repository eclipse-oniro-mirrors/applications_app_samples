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
  sliderStep,
  sliderMax,
} from '../model/CameraLogic';

/** SliderSettingsTest logic checks (46 cases). */
export default function sliderSettingsTest(): void {
  describe('SliderSettingsTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0001
     * @tc.name      Camera_SliderSettings_0001
     * @tc.desc      slider settings for 4 -> step 0.01, max 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SliderSettings_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderSettings_0001 begin`);
      logInfo("sliderStep(4) + ',' + sliderMax(4)");
      const actual: string = sliderStep(4) + ',' + sliderMax(4);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,4");
      expect(actual).assertEqual("0.01,4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0002
     * @tc.name      Camera_SliderSettings_0002
     * @tc.desc      slider settings for 5 -> step 0.01, max 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0002 begin`);
      logInfo("sliderStep(5) + ',' + sliderMax(5)");
      const actual: string = sliderStep(5) + ',' + sliderMax(5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,5");
      expect(actual).assertEqual("0.01,5");
      logInfo(`${BUNDLE}SliderSettings_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0003
     * @tc.name      Camera_SliderSettings_0003
     * @tc.desc      slider settings for 6 -> step 0.01, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0003 begin`);
      logInfo("sliderStep(6) + ',' + sliderMax(6)");
      const actual: string = sliderStep(6) + ',' + sliderMax(6);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,6");
      expect(actual).assertEqual("0.01,6");
      logInfo(`${BUNDLE}SliderSettings_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0004
     * @tc.name      Camera_SliderSettings_0004
     * @tc.desc      slider settings for 6.1 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0004 begin`);
      logInfo("sliderStep(6.1) + ',' + sliderMax(6.1)");
      const actual: string = sliderStep(6.1) + ',' + sliderMax(6.1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0005
     * @tc.name      Camera_SliderSettings_0005
     * @tc.desc      slider settings for 7 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0005 begin`);
      logInfo("sliderStep(7) + ',' + sliderMax(7)");
      const actual: string = sliderStep(7) + ',' + sliderMax(7);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0006
     * @tc.name      Camera_SliderSettings_0006
     * @tc.desc      slider settings for 8 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0006 begin`);
      logInfo("sliderStep(8) + ',' + sliderMax(8)");
      const actual: string = sliderStep(8) + ',' + sliderMax(8);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0007
     * @tc.name      Camera_SliderSettings_0007
     * @tc.desc      slider settings for 9 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0007 begin`);
      logInfo("sliderStep(9) + ',' + sliderMax(9)");
      const actual: string = sliderStep(9) + ',' + sliderMax(9);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0008
     * @tc.name      Camera_SliderSettings_0008
     * @tc.desc      slider settings for 10 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0008 begin`);
      logInfo("sliderStep(10) + ',' + sliderMax(10)");
      const actual: string = sliderStep(10) + ',' + sliderMax(10);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0009
     * @tc.name      Camera_SliderSettings_0009
     * @tc.desc      slider settings for 12 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0009 begin`);
      logInfo("sliderStep(12) + ',' + sliderMax(12)");
      const actual: string = sliderStep(12) + ',' + sliderMax(12);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0010
     * @tc.name      Camera_SliderSettings_0010
     * @tc.desc      slider settings for 15 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0010 begin`);
      logInfo("sliderStep(15) + ',' + sliderMax(15)");
      const actual: string = sliderStep(15) + ',' + sliderMax(15);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0011
     * @tc.name      Camera_SliderSettings_0011
     * @tc.desc      slider settings for 20 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0011 begin`);
      logInfo("sliderStep(20) + ',' + sliderMax(20)");
      const actual: string = sliderStep(20) + ',' + sliderMax(20);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0012
     * @tc.name      Camera_SliderSettings_0012
     * @tc.desc      slider settings for 24 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SliderSettings_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderSettings_0012 begin`);
      logInfo("sliderStep(24) + ',' + sliderMax(24)");
      const actual: string = sliderStep(24) + ',' + sliderMax(24);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0013
     * @tc.name      Camera_SliderSettings_0013
     * @tc.desc      slider settings for 30 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0013 begin`);
      logInfo("sliderStep(30) + ',' + sliderMax(30)");
      const actual: string = sliderStep(30) + ',' + sliderMax(30);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0014
     * @tc.name      Camera_SliderSettings_0014
     * @tc.desc      slider settings for 40 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0014 begin`);
      logInfo("sliderStep(40) + ',' + sliderMax(40)");
      const actual: string = sliderStep(40) + ',' + sliderMax(40);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0015
     * @tc.name      Camera_SliderSettings_0015
     * @tc.desc      slider settings for 50 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0015 begin`);
      logInfo("sliderStep(50) + ',' + sliderMax(50)");
      const actual: string = sliderStep(50) + ',' + sliderMax(50);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0016
     * @tc.name      Camera_SliderSettings_0016
     * @tc.desc      slider settings for 60 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0016 begin`);
      logInfo("sliderStep(60) + ',' + sliderMax(60)");
      const actual: string = sliderStep(60) + ',' + sliderMax(60);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0017
     * @tc.name      Camera_SliderSettings_0017
     * @tc.desc      slider settings for 70 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0017 begin`);
      logInfo("sliderStep(70) + ',' + sliderMax(70)");
      const actual: string = sliderStep(70) + ',' + sliderMax(70);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0018
     * @tc.name      Camera_SliderSettings_0018
     * @tc.desc      slider settings for 80 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SliderSettings_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SliderSettings_0018 begin`);
      logInfo("sliderStep(80) + ',' + sliderMax(80)");
      const actual: string = sliderStep(80) + ',' + sliderMax(80);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0019
     * @tc.name      Camera_SliderSettings_0019
     * @tc.desc      slider settings for 90 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0019 begin`);
      logInfo("sliderStep(90) + ',' + sliderMax(90)");
      const actual: string = sliderStep(90) + ',' + sliderMax(90);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0020
     * @tc.name      Camera_SliderSettings_0020
     * @tc.desc      slider settings for 99 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0020 begin`);
      logInfo("sliderStep(99) + ',' + sliderMax(99)");
      const actual: string = sliderStep(99) + ',' + sliderMax(99);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0021
     * @tc.name      Camera_SliderSettings_0021
     * @tc.desc      slider settings for 100 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0021 begin`);
      logInfo("sliderStep(100) + ',' + sliderMax(100)");
      const actual: string = sliderStep(100) + ',' + sliderMax(100);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0022
     * @tc.name      Camera_SliderSettings_0022
     * @tc.desc      slider settings for 120 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0022 begin`);
      logInfo("sliderStep(120) + ',' + sliderMax(120)");
      const actual: string = sliderStep(120) + ',' + sliderMax(120);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0023
     * @tc.name      Camera_SliderSettings_0023
     * @tc.desc      slider settings for 150 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SliderSettings_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderSettings_0023 begin`);
      logInfo("sliderStep(150) + ',' + sliderMax(150)");
      const actual: string = sliderStep(150) + ',' + sliderMax(150);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0024
     * @tc.name      Camera_SliderSettings_0024
     * @tc.desc      slider settings for 180 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0024 begin`);
      logInfo("sliderStep(180) + ',' + sliderMax(180)");
      const actual: string = sliderStep(180) + ',' + sliderMax(180);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0025
     * @tc.name      Camera_SliderSettings_0025
     * @tc.desc      slider settings for 200 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0025 begin`);
      logInfo("sliderStep(200) + ',' + sliderMax(200)");
      const actual: string = sliderStep(200) + ',' + sliderMax(200);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0026
     * @tc.name      Camera_SliderSettings_0026
     * @tc.desc      slider settings for 255 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0026 begin`);
      logInfo("sliderStep(255) + ',' + sliderMax(255)");
      const actual: string = sliderStep(255) + ',' + sliderMax(255);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0027
     * @tc.name      Camera_SliderSettings_0027
     * @tc.desc      slider settings for 300 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0027 begin`);
      logInfo("sliderStep(300) + ',' + sliderMax(300)");
      const actual: string = sliderStep(300) + ',' + sliderMax(300);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0028
     * @tc.name      Camera_SliderSettings_0028
     * @tc.desc      slider settings for 360 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0028 begin`);
      logInfo("sliderStep(360) + ',' + sliderMax(360)");
      const actual: string = sliderStep(360) + ',' + sliderMax(360);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0029
     * @tc.name      Camera_SliderSettings_0029
     * @tc.desc      slider settings for 500 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0029 begin`);
      logInfo("sliderStep(500) + ',' + sliderMax(500)");
      const actual: string = sliderStep(500) + ',' + sliderMax(500);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0030
     * @tc.name      Camera_SliderSettings_0030
     * @tc.desc      slider settings for 1000 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0030 begin`);
      logInfo("sliderStep(1000) + ',' + sliderMax(1000)");
      const actual: string = sliderStep(1000) + ',' + sliderMax(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0031
     * @tc.name      Camera_SliderSettings_0031
     * @tc.desc      slider settings for 1920 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0031 begin`);
      logInfo("sliderStep(1920) + ',' + sliderMax(1920)");
      const actual: string = sliderStep(1920) + ',' + sliderMax(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0032
     * @tc.name      Camera_SliderSettings_0032
     * @tc.desc      slider settings for 0.5 -> step 0.01, max 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0032 begin`);
      logInfo("sliderStep(0.5) + ',' + sliderMax(0.5)");
      const actual: string = sliderStep(0.5) + ',' + sliderMax(0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,0.5");
      expect(actual).assertEqual("0.01,0.5");
      logInfo(`${BUNDLE}SliderSettings_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0033
     * @tc.name      Camera_SliderSettings_0033
     * @tc.desc      slider settings for 0.9 -> step 0.01, max 0.9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0033 begin`);
      logInfo("sliderStep(0.9) + ',' + sliderMax(0.9)");
      const actual: string = sliderStep(0.9) + ',' + sliderMax(0.9);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,0.9");
      expect(actual).assertEqual("0.01,0.9");
      logInfo(`${BUNDLE}SliderSettings_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0034
     * @tc.name      Camera_SliderSettings_0034
     * @tc.desc      slider settings for 0.99 -> step 0.01, max 0.99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SliderSettings_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderSettings_0034 begin`);
      logInfo("sliderStep(0.99) + ',' + sliderMax(0.99)");
      const actual: string = sliderStep(0.99) + ',' + sliderMax(0.99);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,0.99");
      expect(actual).assertEqual("0.01,0.99");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0035
     * @tc.name      Camera_SliderSettings_0035
     * @tc.desc      slider settings for 1.5 -> step 0.01, max 1.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SliderSettings_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SliderSettings_0035 begin`);
      logInfo("sliderStep(1.5) + ',' + sliderMax(1.5)");
      const actual: string = sliderStep(1.5) + ',' + sliderMax(1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,1.5");
      expect(actual).assertEqual("0.01,1.5");
      logInfo(`${BUNDLE}SliderSettings_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0036
     * @tc.name      Camera_SliderSettings_0036
     * @tc.desc      slider settings for 2.5 -> step 0.01, max 2.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0036 begin`);
      logInfo("sliderStep(2.5) + ',' + sliderMax(2.5)");
      const actual: string = sliderStep(2.5) + ',' + sliderMax(2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,2.5");
      expect(actual).assertEqual("0.01,2.5");
      logInfo(`${BUNDLE}SliderSettings_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0037
     * @tc.name      Camera_SliderSettings_0037
     * @tc.desc      slider settings for 5.5 -> step 0.01, max 5.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0037 begin`);
      logInfo("sliderStep(5.5) + ',' + sliderMax(5.5)");
      const actual: string = sliderStep(5.5) + ',' + sliderMax(5.5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,5.5");
      expect(actual).assertEqual("0.01,5.5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0038
     * @tc.name      Camera_SliderSettings_0038
     * @tc.desc      slider settings for 5.9 -> step 0.01, max 5.9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0038 begin`);
      logInfo("sliderStep(5.9) + ',' + sliderMax(5.9)");
      const actual: string = sliderStep(5.9) + ',' + sliderMax(5.9);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,5.9");
      expect(actual).assertEqual("0.01,5.9");
      logInfo(`${BUNDLE}SliderSettings_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0039
     * @tc.name      Camera_SliderSettings_0039
     * @tc.desc      slider settings for -1 -> step 0.01, max -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0039 begin`);
      logInfo("sliderStep(-1) + ',' + sliderMax(-1)");
      const actual: string = sliderStep(-1) + ',' + sliderMax(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,-1");
      expect(actual).assertEqual("0.01,-1");
      logInfo(`${BUNDLE}SliderSettings_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0040
     * @tc.name      Camera_SliderSettings_0040
     * @tc.desc      slider settings for -6 -> step 0.01, max -6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0040 begin`);
      logInfo("sliderStep(-6) + ',' + sliderMax(-6)");
      const actual: string = sliderStep(-6) + ',' + sliderMax(-6);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,-6");
      expect(actual).assertEqual("0.01,-6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0041
     * @tc.name      Camera_SliderSettings_0041
     * @tc.desc      slider settings for -100 -> step 0.01, max -100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0041 begin`);
      logInfo("sliderStep(-100) + ',' + sliderMax(-100)");
      const actual: string = sliderStep(-100) + ',' + sliderMax(-100);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,-100");
      expect(actual).assertEqual("0.01,-100");
      logInfo(`${BUNDLE}SliderSettings_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0042
     * @tc.name      Camera_SliderSettings_0042
     * @tc.desc      slider settings for 1000000 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0042 begin`);
      logInfo("sliderStep(1000000) + ',' + sliderMax(1000000)");
      const actual: string = sliderStep(1000000) + ',' + sliderMax(1000000);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0043
     * @tc.name      Camera_SliderSettings_0043
     * @tc.desc      slider settings for 0 -> step 0.01, max 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0043 begin`);
      logInfo("sliderStep(0) + ',' + sliderMax(0)");
      const actual: string = sliderStep(0) + ',' + sliderMax(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,0");
      expect(actual).assertEqual("0.01,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0044
     * @tc.name      Camera_SliderSettings_0044
     * @tc.desc      slider settings for 1 -> step 0.01, max 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0044 begin`);
      logInfo("sliderStep(1) + ',' + sliderMax(1)");
      const actual: string = sliderStep(1) + ',' + sliderMax(1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,1");
      expect(actual).assertEqual("0.01,1");
      logInfo(`${BUNDLE}SliderSettings_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0045
     * @tc.name      Camera_SliderSettings_0045
     * @tc.desc      slider settings for 2 -> step 0.01, max 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SliderSettings_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderSettings_0045 begin`);
      logInfo("sliderStep(2) + ',' + sliderMax(2)");
      const actual: string = sliderStep(2) + ',' + sliderMax(2);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,2");
      expect(actual).assertEqual("0.01,2");
      logInfo(`${BUNDLE}SliderSettings_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0046
     * @tc.name      Camera_SliderSettings_0046
     * @tc.desc      slider settings for 3 -> step 0.01, max 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0046 begin`);
      logInfo("sliderStep(3) + ',' + sliderMax(3)");
      const actual: string = sliderStep(3) + ',' + sliderMax(3);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,3");
      expect(actual).assertEqual("0.01,3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0046 end`);
    });
  });
}
