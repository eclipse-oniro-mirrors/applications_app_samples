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
  focusFrameX,
  focusFrameY,
} from '../model/CameraLogic';

/** FocusFrameOffsetTest logic checks (48 cases). */
export default function focusFrameOffsetTest(): void {
  describe('FocusFrameOffsetTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0001
     * @tc.name      Camera_FocusFrameOffset_0001
     * @tc.desc      focusFrameX/Y(2) offsets the focus box to -58,-58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusFrameOffset_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0001 begin`);
      logInfo("focusFrameX(2) + ',' + focusFrameY(2)");
      const actual: string = focusFrameX(2) + ',' + focusFrameY(2);
      logInfo('actual=' + String(actual) + ', expected=' + "-58,-58");
      expect(actual).assertEqual("-58,-58");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0002
     * @tc.name      Camera_FocusFrameOffset_0002
     * @tc.desc      focusFrameX/Y(3) offsets the focus box to -57,-57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0002 begin`);
      logInfo("focusFrameX(3) + ',' + focusFrameY(3)");
      const actual: string = focusFrameX(3) + ',' + focusFrameY(3);
      logInfo('actual=' + String(actual) + ', expected=' + "-57,-57");
      expect(actual).assertEqual("-57,-57");
      logInfo(`${BUNDLE}FocusFrameOffset_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0003
     * @tc.name      Camera_FocusFrameOffset_0003
     * @tc.desc      focusFrameX/Y(4) offsets the focus box to -56,-56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0003 begin`);
      logInfo("focusFrameX(4) + ',' + focusFrameY(4)");
      const actual: string = focusFrameX(4) + ',' + focusFrameY(4);
      logInfo('actual=' + String(actual) + ', expected=' + "-56,-56");
      expect(actual).assertEqual("-56,-56");
      logInfo(`${BUNDLE}FocusFrameOffset_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0004
     * @tc.name      Camera_FocusFrameOffset_0004
     * @tc.desc      focusFrameX/Y(5) offsets the focus box to -55,-55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0004 begin`);
      logInfo("focusFrameX(5) + ',' + focusFrameY(5)");
      const actual: string = focusFrameX(5) + ',' + focusFrameY(5);
      logInfo('actual=' + String(actual) + ', expected=' + "-55,-55");
      expect(actual).assertEqual("-55,-55");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0005
     * @tc.name      Camera_FocusFrameOffset_0005
     * @tc.desc      focusFrameX/Y(6) offsets the focus box to -54,-54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0005 begin`);
      logInfo("focusFrameX(6) + ',' + focusFrameY(6)");
      const actual: string = focusFrameX(6) + ',' + focusFrameY(6);
      logInfo('actual=' + String(actual) + ', expected=' + "-54,-54");
      expect(actual).assertEqual("-54,-54");
      logInfo(`${BUNDLE}FocusFrameOffset_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0006
     * @tc.name      Camera_FocusFrameOffset_0006
     * @tc.desc      focusFrameX/Y(7) offsets the focus box to -53,-53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0006 begin`);
      logInfo("focusFrameX(7) + ',' + focusFrameY(7)");
      const actual: string = focusFrameX(7) + ',' + focusFrameY(7);
      logInfo('actual=' + String(actual) + ', expected=' + "-53,-53");
      expect(actual).assertEqual("-53,-53");
      logInfo(`${BUNDLE}FocusFrameOffset_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0007
     * @tc.name      Camera_FocusFrameOffset_0007
     * @tc.desc      focusFrameX/Y(8) offsets the focus box to -52,-52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0007 begin`);
      logInfo("focusFrameX(8) + ',' + focusFrameY(8)");
      const actual: string = focusFrameX(8) + ',' + focusFrameY(8);
      logInfo('actual=' + String(actual) + ', expected=' + "-52,-52");
      expect(actual).assertEqual("-52,-52");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0008
     * @tc.name      Camera_FocusFrameOffset_0008
     * @tc.desc      focusFrameX/Y(9) offsets the focus box to -51,-51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0008 begin`);
      logInfo("focusFrameX(9) + ',' + focusFrameY(9)");
      const actual: string = focusFrameX(9) + ',' + focusFrameY(9);
      logInfo('actual=' + String(actual) + ', expected=' + "-51,-51");
      expect(actual).assertEqual("-51,-51");
      logInfo(`${BUNDLE}FocusFrameOffset_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0009
     * @tc.name      Camera_FocusFrameOffset_0009
     * @tc.desc      focusFrameX/Y(10) offsets the focus box to -50,-50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0009 begin`);
      logInfo("focusFrameX(10) + ',' + focusFrameY(10)");
      const actual: string = focusFrameX(10) + ',' + focusFrameY(10);
      logInfo('actual=' + String(actual) + ', expected=' + "-50,-50");
      expect(actual).assertEqual("-50,-50");
      logInfo(`${BUNDLE}FocusFrameOffset_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0010
     * @tc.name      Camera_FocusFrameOffset_0010
     * @tc.desc      focusFrameX/Y(11) offsets the focus box to -49,-49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0010 begin`);
      logInfo("focusFrameX(11) + ',' + focusFrameY(11)");
      const actual: string = focusFrameX(11) + ',' + focusFrameY(11);
      logInfo('actual=' + String(actual) + ', expected=' + "-49,-49");
      expect(actual).assertEqual("-49,-49");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0011
     * @tc.name      Camera_FocusFrameOffset_0011
     * @tc.desc      focusFrameX/Y(12) offsets the focus box to -48,-48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0011 begin`);
      logInfo("focusFrameX(12) + ',' + focusFrameY(12)");
      const actual: string = focusFrameX(12) + ',' + focusFrameY(12);
      logInfo('actual=' + String(actual) + ', expected=' + "-48,-48");
      expect(actual).assertEqual("-48,-48");
      logInfo(`${BUNDLE}FocusFrameOffset_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0012
     * @tc.name      Camera_FocusFrameOffset_0012
     * @tc.desc      focusFrameX/Y(14) offsets the focus box to -46,-46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusFrameOffset_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0012 begin`);
      logInfo("focusFrameX(14) + ',' + focusFrameY(14)");
      const actual: string = focusFrameX(14) + ',' + focusFrameY(14);
      logInfo('actual=' + String(actual) + ', expected=' + "-46,-46");
      expect(actual).assertEqual("-46,-46");
      logInfo(`${BUNDLE}FocusFrameOffset_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0013
     * @tc.name      Camera_FocusFrameOffset_0013
     * @tc.desc      focusFrameX/Y(15) offsets the focus box to -45,-45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0013 begin`);
      logInfo("focusFrameX(15) + ',' + focusFrameY(15)");
      const actual: string = focusFrameX(15) + ',' + focusFrameY(15);
      logInfo('actual=' + String(actual) + ', expected=' + "-45,-45");
      expect(actual).assertEqual("-45,-45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0014
     * @tc.name      Camera_FocusFrameOffset_0014
     * @tc.desc      focusFrameX/Y(20) offsets the focus box to -40,-40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0014 begin`);
      logInfo("focusFrameX(20) + ',' + focusFrameY(20)");
      const actual: string = focusFrameX(20) + ',' + focusFrameY(20);
      logInfo('actual=' + String(actual) + ', expected=' + "-40,-40");
      expect(actual).assertEqual("-40,-40");
      logInfo(`${BUNDLE}FocusFrameOffset_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0015
     * @tc.name      Camera_FocusFrameOffset_0015
     * @tc.desc      focusFrameX/Y(24) offsets the focus box to -36,-36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0015 begin`);
      logInfo("focusFrameX(24) + ',' + focusFrameY(24)");
      const actual: string = focusFrameX(24) + ',' + focusFrameY(24);
      logInfo('actual=' + String(actual) + ', expected=' + "-36,-36");
      expect(actual).assertEqual("-36,-36");
      logInfo(`${BUNDLE}FocusFrameOffset_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0016
     * @tc.name      Camera_FocusFrameOffset_0016
     * @tc.desc      focusFrameX/Y(25) offsets the focus box to -35,-35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0016 begin`);
      logInfo("focusFrameX(25) + ',' + focusFrameY(25)");
      const actual: string = focusFrameX(25) + ',' + focusFrameY(25);
      logInfo('actual=' + String(actual) + ', expected=' + "-35,-35");
      expect(actual).assertEqual("-35,-35");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0017
     * @tc.name      Camera_FocusFrameOffset_0017
     * @tc.desc      focusFrameX/Y(28) offsets the focus box to -32,-32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0017 begin`);
      logInfo("focusFrameX(28) + ',' + focusFrameY(28)");
      const actual: string = focusFrameX(28) + ',' + focusFrameY(28);
      logInfo('actual=' + String(actual) + ', expected=' + "-32,-32");
      expect(actual).assertEqual("-32,-32");
      logInfo(`${BUNDLE}FocusFrameOffset_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0018
     * @tc.name      Camera_FocusFrameOffset_0018
     * @tc.desc      focusFrameX/Y(30) offsets the focus box to -30,-30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FocusFrameOffset_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0018 begin`);
      logInfo("focusFrameX(30) + ',' + focusFrameY(30)");
      const actual: string = focusFrameX(30) + ',' + focusFrameY(30);
      logInfo('actual=' + String(actual) + ', expected=' + "-30,-30");
      expect(actual).assertEqual("-30,-30");
      logInfo(`${BUNDLE}FocusFrameOffset_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0019
     * @tc.name      Camera_FocusFrameOffset_0019
     * @tc.desc      focusFrameX/Y(40) offsets the focus box to -20,-20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0019 begin`);
      logInfo("focusFrameX(40) + ',' + focusFrameY(40)");
      const actual: string = focusFrameX(40) + ',' + focusFrameY(40);
      logInfo('actual=' + String(actual) + ', expected=' + "-20,-20");
      expect(actual).assertEqual("-20,-20");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0020
     * @tc.name      Camera_FocusFrameOffset_0020
     * @tc.desc      focusFrameX/Y(45) offsets the focus box to -15,-15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0020 begin`);
      logInfo("focusFrameX(45) + ',' + focusFrameY(45)");
      const actual: string = focusFrameX(45) + ',' + focusFrameY(45);
      logInfo('actual=' + String(actual) + ', expected=' + "-15,-15");
      expect(actual).assertEqual("-15,-15");
      logInfo(`${BUNDLE}FocusFrameOffset_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0021
     * @tc.name      Camera_FocusFrameOffset_0021
     * @tc.desc      focusFrameX/Y(48) offsets the focus box to -12,-12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0021 begin`);
      logInfo("focusFrameX(48) + ',' + focusFrameY(48)");
      const actual: string = focusFrameX(48) + ',' + focusFrameY(48);
      logInfo('actual=' + String(actual) + ', expected=' + "-12,-12");
      expect(actual).assertEqual("-12,-12");
      logInfo(`${BUNDLE}FocusFrameOffset_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0022
     * @tc.name      Camera_FocusFrameOffset_0022
     * @tc.desc      focusFrameX/Y(50) offsets the focus box to -10,-10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0022 begin`);
      logInfo("focusFrameX(50) + ',' + focusFrameY(50)");
      const actual: string = focusFrameX(50) + ',' + focusFrameY(50);
      logInfo('actual=' + String(actual) + ', expected=' + "-10,-10");
      expect(actual).assertEqual("-10,-10");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0023
     * @tc.name      Camera_FocusFrameOffset_0023
     * @tc.desc      focusFrameX/Y(60) offsets the focus box to 0,0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusFrameOffset_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0023 begin`);
      logInfo("focusFrameX(60) + ',' + focusFrameY(60)");
      const actual: string = focusFrameX(60) + ',' + focusFrameY(60);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0");
      expect(actual).assertEqual("0,0");
      logInfo(`${BUNDLE}FocusFrameOffset_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0024
     * @tc.name      Camera_FocusFrameOffset_0024
     * @tc.desc      focusFrameX/Y(70) offsets the focus box to 10,10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0024 begin`);
      logInfo("focusFrameX(70) + ',' + focusFrameY(70)");
      const actual: string = focusFrameX(70) + ',' + focusFrameY(70);
      logInfo('actual=' + String(actual) + ', expected=' + "10,10");
      expect(actual).assertEqual("10,10");
      logInfo(`${BUNDLE}FocusFrameOffset_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0025
     * @tc.name      Camera_FocusFrameOffset_0025
     * @tc.desc      focusFrameX/Y(75) offsets the focus box to 15,15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0025 begin`);
      logInfo("focusFrameX(75) + ',' + focusFrameY(75)");
      const actual: string = focusFrameX(75) + ',' + focusFrameY(75);
      logInfo('actual=' + String(actual) + ', expected=' + "15,15");
      expect(actual).assertEqual("15,15");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0026
     * @tc.name      Camera_FocusFrameOffset_0026
     * @tc.desc      focusFrameX/Y(80) offsets the focus box to 20,20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0026 begin`);
      logInfo("focusFrameX(80) + ',' + focusFrameY(80)");
      const actual: string = focusFrameX(80) + ',' + focusFrameY(80);
      logInfo('actual=' + String(actual) + ', expected=' + "20,20");
      expect(actual).assertEqual("20,20");
      logInfo(`${BUNDLE}FocusFrameOffset_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0027
     * @tc.name      Camera_FocusFrameOffset_0027
     * @tc.desc      focusFrameX/Y(85) offsets the focus box to 25,25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0027 begin`);
      logInfo("focusFrameX(85) + ',' + focusFrameY(85)");
      const actual: string = focusFrameX(85) + ',' + focusFrameY(85);
      logInfo('actual=' + String(actual) + ', expected=' + "25,25");
      expect(actual).assertEqual("25,25");
      logInfo(`${BUNDLE}FocusFrameOffset_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0028
     * @tc.name      Camera_FocusFrameOffset_0028
     * @tc.desc      focusFrameX/Y(90) offsets the focus box to 30,30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0028 begin`);
      logInfo("focusFrameX(90) + ',' + focusFrameY(90)");
      const actual: string = focusFrameX(90) + ',' + focusFrameY(90);
      logInfo('actual=' + String(actual) + ', expected=' + "30,30");
      expect(actual).assertEqual("30,30");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0029
     * @tc.name      Camera_FocusFrameOffset_0029
     * @tc.desc      focusFrameX/Y(99) offsets the focus box to 39,39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0029 begin`);
      logInfo("focusFrameX(99) + ',' + focusFrameY(99)");
      const actual: string = focusFrameX(99) + ',' + focusFrameY(99);
      logInfo('actual=' + String(actual) + ', expected=' + "39,39");
      expect(actual).assertEqual("39,39");
      logInfo(`${BUNDLE}FocusFrameOffset_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0030
     * @tc.name      Camera_FocusFrameOffset_0030
     * @tc.desc      focusFrameX/Y(100) offsets the focus box to 40,40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0030 begin`);
      logInfo("focusFrameX(100) + ',' + focusFrameY(100)");
      const actual: string = focusFrameX(100) + ',' + focusFrameY(100);
      logInfo('actual=' + String(actual) + ', expected=' + "40,40");
      expect(actual).assertEqual("40,40");
      logInfo(`${BUNDLE}FocusFrameOffset_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0031
     * @tc.name      Camera_FocusFrameOffset_0031
     * @tc.desc      focusFrameX/Y(105) offsets the focus box to 45,45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0031 begin`);
      logInfo("focusFrameX(105) + ',' + focusFrameY(105)");
      const actual: string = focusFrameX(105) + ',' + focusFrameY(105);
      logInfo('actual=' + String(actual) + ', expected=' + "45,45");
      expect(actual).assertEqual("45,45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0032
     * @tc.name      Camera_FocusFrameOffset_0032
     * @tc.desc      focusFrameX/Y(108) offsets the focus box to 48,48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0032 begin`);
      logInfo("focusFrameX(108) + ',' + focusFrameY(108)");
      const actual: string = focusFrameX(108) + ',' + focusFrameY(108);
      logInfo('actual=' + String(actual) + ', expected=' + "48,48");
      expect(actual).assertEqual("48,48");
      logInfo(`${BUNDLE}FocusFrameOffset_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0033
     * @tc.name      Camera_FocusFrameOffset_0033
     * @tc.desc      focusFrameX/Y(120) offsets the focus box to 60,60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0033 begin`);
      logInfo("focusFrameX(120) + ',' + focusFrameY(120)");
      const actual: string = focusFrameX(120) + ',' + focusFrameY(120);
      logInfo('actual=' + String(actual) + ', expected=' + "60,60");
      expect(actual).assertEqual("60,60");
      logInfo(`${BUNDLE}FocusFrameOffset_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0034
     * @tc.name      Camera_FocusFrameOffset_0034
     * @tc.desc      focusFrameX/Y(150) offsets the focus box to 90,90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusFrameOffset_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0034 begin`);
      logInfo("focusFrameX(150) + ',' + focusFrameY(150)");
      const actual: string = focusFrameX(150) + ',' + focusFrameY(150);
      logInfo('actual=' + String(actual) + ', expected=' + "90,90");
      expect(actual).assertEqual("90,90");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0035
     * @tc.name      Camera_FocusFrameOffset_0035
     * @tc.desc      focusFrameX/Y(180) offsets the focus box to 120,120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FocusFrameOffset_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0035 begin`);
      logInfo("focusFrameX(180) + ',' + focusFrameY(180)");
      const actual: string = focusFrameX(180) + ',' + focusFrameY(180);
      logInfo('actual=' + String(actual) + ', expected=' + "120,120");
      expect(actual).assertEqual("120,120");
      logInfo(`${BUNDLE}FocusFrameOffset_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0036
     * @tc.name      Camera_FocusFrameOffset_0036
     * @tc.desc      focusFrameX/Y(200) offsets the focus box to 140,140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0036 begin`);
      logInfo("focusFrameX(200) + ',' + focusFrameY(200)");
      const actual: string = focusFrameX(200) + ',' + focusFrameY(200);
      logInfo('actual=' + String(actual) + ', expected=' + "140,140");
      expect(actual).assertEqual("140,140");
      logInfo(`${BUNDLE}FocusFrameOffset_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0037
     * @tc.name      Camera_FocusFrameOffset_0037
     * @tc.desc      focusFrameX/Y(255) offsets the focus box to 195,195.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0037 begin`);
      logInfo("focusFrameX(255) + ',' + focusFrameY(255)");
      const actual: string = focusFrameX(255) + ',' + focusFrameY(255);
      logInfo('actual=' + String(actual) + ', expected=' + "195,195");
      expect(actual).assertEqual("195,195");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0038
     * @tc.name      Camera_FocusFrameOffset_0038
     * @tc.desc      focusFrameX/Y(270) offsets the focus box to 210,210.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0038 begin`);
      logInfo("focusFrameX(270) + ',' + focusFrameY(270)");
      const actual: string = focusFrameX(270) + ',' + focusFrameY(270);
      logInfo('actual=' + String(actual) + ', expected=' + "210,210");
      expect(actual).assertEqual("210,210");
      logInfo(`${BUNDLE}FocusFrameOffset_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0039
     * @tc.name      Camera_FocusFrameOffset_0039
     * @tc.desc      focusFrameX/Y(300) offsets the focus box to 240,240.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0039 begin`);
      logInfo("focusFrameX(300) + ',' + focusFrameY(300)");
      const actual: string = focusFrameX(300) + ',' + focusFrameY(300);
      logInfo('actual=' + String(actual) + ', expected=' + "240,240");
      expect(actual).assertEqual("240,240");
      logInfo(`${BUNDLE}FocusFrameOffset_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0040
     * @tc.name      Camera_FocusFrameOffset_0040
     * @tc.desc      focusFrameX/Y(360) offsets the focus box to 300,300.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0040 begin`);
      logInfo("focusFrameX(360) + ',' + focusFrameY(360)");
      const actual: string = focusFrameX(360) + ',' + focusFrameY(360);
      logInfo('actual=' + String(actual) + ', expected=' + "300,300");
      expect(actual).assertEqual("300,300");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0041
     * @tc.name      Camera_FocusFrameOffset_0041
     * @tc.desc      focusFrameX/Y(480) offsets the focus box to 420,420.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0041 begin`);
      logInfo("focusFrameX(480) + ',' + focusFrameY(480)");
      const actual: string = focusFrameX(480) + ',' + focusFrameY(480);
      logInfo('actual=' + String(actual) + ', expected=' + "420,420");
      expect(actual).assertEqual("420,420");
      logInfo(`${BUNDLE}FocusFrameOffset_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0042
     * @tc.name      Camera_FocusFrameOffset_0042
     * @tc.desc      focusFrameX/Y(512) offsets the focus box to 452,452.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0042 begin`);
      logInfo("focusFrameX(512) + ',' + focusFrameY(512)");
      const actual: string = focusFrameX(512) + ',' + focusFrameY(512);
      logInfo('actual=' + String(actual) + ', expected=' + "452,452");
      expect(actual).assertEqual("452,452");
      logInfo(`${BUNDLE}FocusFrameOffset_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0043
     * @tc.name      Camera_FocusFrameOffset_0043
     * @tc.desc      focusFrameX/Y(540) offsets the focus box to 480,480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0043 begin`);
      logInfo("focusFrameX(540) + ',' + focusFrameY(540)");
      const actual: string = focusFrameX(540) + ',' + focusFrameY(540);
      logInfo('actual=' + String(actual) + ', expected=' + "480,480");
      expect(actual).assertEqual("480,480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0044
     * @tc.name      Camera_FocusFrameOffset_0044
     * @tc.desc      focusFrameX/Y(600) offsets the focus box to 540,540.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0044 begin`);
      logInfo("focusFrameX(600) + ',' + focusFrameY(600)");
      const actual: string = focusFrameX(600) + ',' + focusFrameY(600);
      logInfo('actual=' + String(actual) + ', expected=' + "540,540");
      expect(actual).assertEqual("540,540");
      logInfo(`${BUNDLE}FocusFrameOffset_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0045
     * @tc.name      Camera_FocusFrameOffset_0045
     * @tc.desc      focusFrameX/Y(720) offsets the focus box to 660,660.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusFrameOffset_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0045 begin`);
      logInfo("focusFrameX(720) + ',' + focusFrameY(720)");
      const actual: string = focusFrameX(720) + ',' + focusFrameY(720);
      logInfo('actual=' + String(actual) + ', expected=' + "660,660");
      expect(actual).assertEqual("660,660");
      logInfo(`${BUNDLE}FocusFrameOffset_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0046
     * @tc.name      Camera_FocusFrameOffset_0046
     * @tc.desc      focusFrameX/Y(750) offsets the focus box to 690,690.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0046 begin`);
      logInfo("focusFrameX(750) + ',' + focusFrameY(750)");
      const actual: string = focusFrameX(750) + ',' + focusFrameY(750);
      logInfo('actual=' + String(actual) + ', expected=' + "690,690");
      expect(actual).assertEqual("690,690");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FocusFrameOffset_0046 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0047
     * @tc.name      Camera_FocusFrameOffset_0047
     * @tc.desc      focusFrameX/Y(900) offsets the focus box to 840,840.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0047 begin`);
      logInfo("focusFrameX(900) + ',' + focusFrameY(900)");
      const actual: string = focusFrameX(900) + ',' + focusFrameY(900);
      logInfo('actual=' + String(actual) + ', expected=' + "840,840");
      expect(actual).assertEqual("840,840");
      logInfo(`${BUNDLE}FocusFrameOffset_0047 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_FRAME_OFFSET_0048
     * @tc.name      Camera_FocusFrameOffset_0048
     * @tc.desc      focusFrameX/Y(999) offsets the focus box to 939,939.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusFrameOffset_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusFrameOffset_0048 begin`);
      logInfo("focusFrameX(999) + ',' + focusFrameY(999)");
      const actual: string = focusFrameX(999) + ',' + focusFrameY(999);
      logInfo('actual=' + String(actual) + ', expected=' + "939,939");
      expect(actual).assertEqual("939,939");
      logInfo(`${BUNDLE}FocusFrameOffset_0048 end`);
    });
  });
}
