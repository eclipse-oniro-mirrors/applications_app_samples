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
  positionName,
  rotationAngleOf,
  initialFlipOf,
  firstFlipTargetOf,
  secondFlipStartOf,
  secondFlipTargetOf,
} from '../model/CameraLogic';

/** CameraPositionTest logic checks (46 cases). */
export default function cameraPositionTest(): void {
  describe('CameraPositionTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0001
     * @tc.name      Camera_CameraPosition_0001
     * @tc.desc      position 0 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPosition_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPosition_0001 begin`);
      logInfo("positionName(0) + ':' + rotationAngleOf(0) + ':' + initialFlipOf(0) + ':' + firstFlipTargetOf(0) + ':' + secondFlipStartOf(0) + ':' + secondFlipTargetOf(0)");
      const actual: string = positionName(0) + ':' + rotationAngleOf(0) + ':' + initialFlipOf(0) + ':' + firstFlipTargetOf(0) + ':' + secondFlipStartOf(0) + ':' + secondFlipTargetOf(0);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0002
     * @tc.name      Camera_CameraPosition_0002
     * @tc.desc      position 2 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0002 begin`);
      logInfo("positionName(2) + ':' + rotationAngleOf(2) + ':' + initialFlipOf(2) + ':' + firstFlipTargetOf(2) + ':' + secondFlipStartOf(2) + ':' + secondFlipTargetOf(2)");
      const actual: string = positionName(2) + ':' + rotationAngleOf(2) + ':' + initialFlipOf(2) + ':' + firstFlipTargetOf(2) + ':' + secondFlipStartOf(2) + ':' + secondFlipTargetOf(2);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0003
     * @tc.name      Camera_CameraPosition_0003
     * @tc.desc      position 3 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0003 begin`);
      logInfo("positionName(3) + ':' + rotationAngleOf(3) + ':' + initialFlipOf(3) + ':' + firstFlipTargetOf(3) + ':' + secondFlipStartOf(3) + ':' + secondFlipTargetOf(3)");
      const actual: string = positionName(3) + ':' + rotationAngleOf(3) + ':' + initialFlipOf(3) + ':' + firstFlipTargetOf(3) + ':' + secondFlipStartOf(3) + ':' + secondFlipTargetOf(3);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0004
     * @tc.name      Camera_CameraPosition_0004
     * @tc.desc      position -1 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0004 begin`);
      logInfo("positionName(-1) + ':' + rotationAngleOf(-1) + ':' + initialFlipOf(-1) + ':' + firstFlipTargetOf(-1) + ':' + secondFlipStartOf(-1) + ':' + secondFlipTargetOf(-1)");
      const actual: string = positionName(-1) + ':' + rotationAngleOf(-1) + ':' + initialFlipOf(-1) + ':' + firstFlipTargetOf(-1) + ':' + secondFlipStartOf(-1) + ':' + secondFlipTargetOf(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0005
     * @tc.name      Camera_CameraPosition_0005
     * @tc.desc      position 7 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0005 begin`);
      logInfo("positionName(7) + ':' + rotationAngleOf(7) + ':' + initialFlipOf(7) + ':' + firstFlipTargetOf(7) + ':' + secondFlipStartOf(7) + ':' + secondFlipTargetOf(7)");
      const actual: string = positionName(7) + ':' + rotationAngleOf(7) + ':' + initialFlipOf(7) + ':' + firstFlipTargetOf(7) + ':' + secondFlipStartOf(7) + ':' + secondFlipTargetOf(7);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0006
     * @tc.name      Camera_CameraPosition_0006
     * @tc.desc      position 100 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0006 begin`);
      logInfo("positionName(100) + ':' + rotationAngleOf(100) + ':' + initialFlipOf(100) + ':' + firstFlipTargetOf(100) + ':' + secondFlipStartOf(100) + ':' + secondFlipTargetOf(100)");
      const actual: string = positionName(100) + ':' + rotationAngleOf(100) + ':' + initialFlipOf(100) + ':' + firstFlipTargetOf(100) + ':' + secondFlipStartOf(100) + ':' + secondFlipTargetOf(100);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0007
     * @tc.name      Camera_CameraPosition_0007
     * @tc.desc      position -45 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0007 begin`);
      logInfo("positionName(-45) + ':' + rotationAngleOf(-45) + ':' + initialFlipOf(-45) + ':' + firstFlipTargetOf(-45) + ':' + secondFlipStartOf(-45) + ':' + secondFlipTargetOf(-45)");
      const actual: string = positionName(-45) + ':' + rotationAngleOf(-45) + ':' + initialFlipOf(-45) + ':' + firstFlipTargetOf(-45) + ':' + secondFlipStartOf(-45) + ':' + secondFlipTargetOf(-45);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0008
     * @tc.name      Camera_CameraPosition_0008
     * @tc.desc      position 1.5 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0008 begin`);
      logInfo("positionName(1.5) + ':' + rotationAngleOf(1.5) + ':' + initialFlipOf(1.5) + ':' + firstFlipTargetOf(1.5) + ':' + secondFlipStartOf(1.5) + ':' + secondFlipTargetOf(1.5)");
      const actual: string = positionName(1.5) + ':' + rotationAngleOf(1.5) + ':' + initialFlipOf(1.5) + ':' + firstFlipTargetOf(1.5) + ':' + secondFlipStartOf(1.5) + ':' + secondFlipTargetOf(1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0009
     * @tc.name      Camera_CameraPosition_0009
     * @tc.desc      position 2.5 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0009 begin`);
      logInfo("positionName(2.5) + ':' + rotationAngleOf(2.5) + ':' + initialFlipOf(2.5) + ':' + firstFlipTargetOf(2.5) + ':' + secondFlipStartOf(2.5) + ':' + secondFlipTargetOf(2.5)");
      const actual: string = positionName(2.5) + ':' + rotationAngleOf(2.5) + ':' + initialFlipOf(2.5) + ':' + firstFlipTargetOf(2.5) + ':' + secondFlipStartOf(2.5) + ':' + secondFlipTargetOf(2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0010
     * @tc.name      Camera_CameraPosition_0010
     * @tc.desc      position -0.5 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0010 begin`);
      logInfo("positionName(-0.5) + ':' + rotationAngleOf(-0.5) + ':' + initialFlipOf(-0.5) + ':' + firstFlipTargetOf(-0.5) + ':' + secondFlipStartOf(-0.5) + ':' + secondFlipTargetOf(-0.5)");
      const actual: string = positionName(-0.5) + ':' + rotationAngleOf(-0.5) + ':' + initialFlipOf(-0.5) + ':' + firstFlipTargetOf(-0.5) + ':' + secondFlipStartOf(-0.5) + ':' + secondFlipTargetOf(-0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0011
     * @tc.name      Camera_CameraPosition_0011
     * @tc.desc      position 6 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0011 begin`);
      logInfo("positionName(6) + ':' + rotationAngleOf(6) + ':' + initialFlipOf(6) + ':' + firstFlipTargetOf(6) + ':' + secondFlipStartOf(6) + ':' + secondFlipTargetOf(6)");
      const actual: string = positionName(6) + ':' + rotationAngleOf(6) + ':' + initialFlipOf(6) + ':' + firstFlipTargetOf(6) + ':' + secondFlipStartOf(6) + ':' + secondFlipTargetOf(6);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0012
     * @tc.name      Camera_CameraPosition_0012
     * @tc.desc      position 9 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPosition_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPosition_0012 begin`);
      logInfo("positionName(9) + ':' + rotationAngleOf(9) + ':' + initialFlipOf(9) + ':' + firstFlipTargetOf(9) + ':' + secondFlipStartOf(9) + ':' + secondFlipTargetOf(9)");
      const actual: string = positionName(9) + ':' + rotationAngleOf(9) + ':' + initialFlipOf(9) + ':' + firstFlipTargetOf(9) + ':' + secondFlipStartOf(9) + ':' + secondFlipTargetOf(9);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0013
     * @tc.name      Camera_CameraPosition_0013
     * @tc.desc      position 13 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0013 begin`);
      logInfo("positionName(13) + ':' + rotationAngleOf(13) + ':' + initialFlipOf(13) + ':' + firstFlipTargetOf(13) + ':' + secondFlipStartOf(13) + ':' + secondFlipTargetOf(13)");
      const actual: string = positionName(13) + ':' + rotationAngleOf(13) + ':' + initialFlipOf(13) + ':' + firstFlipTargetOf(13) + ':' + secondFlipStartOf(13) + ':' + secondFlipTargetOf(13);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0014
     * @tc.name      Camera_CameraPosition_0014
     * @tc.desc      position 21 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0014 begin`);
      logInfo("positionName(21) + ':' + rotationAngleOf(21) + ':' + initialFlipOf(21) + ':' + firstFlipTargetOf(21) + ':' + secondFlipStartOf(21) + ':' + secondFlipTargetOf(21)");
      const actual: string = positionName(21) + ':' + rotationAngleOf(21) + ':' + initialFlipOf(21) + ':' + firstFlipTargetOf(21) + ':' + secondFlipStartOf(21) + ':' + secondFlipTargetOf(21);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0015
     * @tc.name      Camera_CameraPosition_0015
     * @tc.desc      position 33 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0015 begin`);
      logInfo("positionName(33) + ':' + rotationAngleOf(33) + ':' + initialFlipOf(33) + ':' + firstFlipTargetOf(33) + ':' + secondFlipStartOf(33) + ':' + secondFlipTargetOf(33)");
      const actual: string = positionName(33) + ':' + rotationAngleOf(33) + ':' + initialFlipOf(33) + ':' + firstFlipTargetOf(33) + ':' + secondFlipStartOf(33) + ':' + secondFlipTargetOf(33);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0016
     * @tc.name      Camera_CameraPosition_0016
     * @tc.desc      position 44 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0016 begin`);
      logInfo("positionName(44) + ':' + rotationAngleOf(44) + ':' + initialFlipOf(44) + ':' + firstFlipTargetOf(44) + ':' + secondFlipStartOf(44) + ':' + secondFlipTargetOf(44)");
      const actual: string = positionName(44) + ':' + rotationAngleOf(44) + ':' + initialFlipOf(44) + ':' + firstFlipTargetOf(44) + ':' + secondFlipStartOf(44) + ':' + secondFlipTargetOf(44);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0017
     * @tc.name      Camera_CameraPosition_0017
     * @tc.desc      position 55 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0017 begin`);
      logInfo("positionName(55) + ':' + rotationAngleOf(55) + ':' + initialFlipOf(55) + ':' + firstFlipTargetOf(55) + ':' + secondFlipStartOf(55) + ':' + secondFlipTargetOf(55)");
      const actual: string = positionName(55) + ':' + rotationAngleOf(55) + ':' + initialFlipOf(55) + ':' + firstFlipTargetOf(55) + ':' + secondFlipStartOf(55) + ':' + secondFlipTargetOf(55);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0018
     * @tc.name      Camera_CameraPosition_0018
     * @tc.desc      position 66 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_CameraPosition_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CameraPosition_0018 begin`);
      logInfo("positionName(66) + ':' + rotationAngleOf(66) + ':' + initialFlipOf(66) + ':' + firstFlipTargetOf(66) + ':' + secondFlipStartOf(66) + ':' + secondFlipTargetOf(66)");
      const actual: string = positionName(66) + ':' + rotationAngleOf(66) + ':' + initialFlipOf(66) + ':' + firstFlipTargetOf(66) + ':' + secondFlipStartOf(66) + ':' + secondFlipTargetOf(66);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0019
     * @tc.name      Camera_CameraPosition_0019
     * @tc.desc      position 77 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0019 begin`);
      logInfo("positionName(77) + ':' + rotationAngleOf(77) + ':' + initialFlipOf(77) + ':' + firstFlipTargetOf(77) + ':' + secondFlipStartOf(77) + ':' + secondFlipTargetOf(77)");
      const actual: string = positionName(77) + ':' + rotationAngleOf(77) + ':' + initialFlipOf(77) + ':' + firstFlipTargetOf(77) + ':' + secondFlipStartOf(77) + ':' + secondFlipTargetOf(77);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0020
     * @tc.name      Camera_CameraPosition_0020
     * @tc.desc      position 88 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0020 begin`);
      logInfo("positionName(88) + ':' + rotationAngleOf(88) + ':' + initialFlipOf(88) + ':' + firstFlipTargetOf(88) + ':' + secondFlipStartOf(88) + ':' + secondFlipTargetOf(88)");
      const actual: string = positionName(88) + ':' + rotationAngleOf(88) + ':' + initialFlipOf(88) + ':' + firstFlipTargetOf(88) + ':' + secondFlipStartOf(88) + ':' + secondFlipTargetOf(88);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0021
     * @tc.name      Camera_CameraPosition_0021
     * @tc.desc      position 91 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0021 begin`);
      logInfo("positionName(91) + ':' + rotationAngleOf(91) + ':' + initialFlipOf(91) + ':' + firstFlipTargetOf(91) + ':' + secondFlipStartOf(91) + ':' + secondFlipTargetOf(91)");
      const actual: string = positionName(91) + ':' + rotationAngleOf(91) + ':' + initialFlipOf(91) + ':' + firstFlipTargetOf(91) + ':' + secondFlipStartOf(91) + ':' + secondFlipTargetOf(91);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0022
     * @tc.name      Camera_CameraPosition_0022
     * @tc.desc      position 101 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0022 begin`);
      logInfo("positionName(101) + ':' + rotationAngleOf(101) + ':' + initialFlipOf(101) + ':' + firstFlipTargetOf(101) + ':' + secondFlipStartOf(101) + ':' + secondFlipTargetOf(101)");
      const actual: string = positionName(101) + ':' + rotationAngleOf(101) + ':' + initialFlipOf(101) + ':' + firstFlipTargetOf(101) + ':' + secondFlipStartOf(101) + ':' + secondFlipTargetOf(101);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0023
     * @tc.name      Camera_CameraPosition_0023
     * @tc.desc      position 111 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPosition_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPosition_0023 begin`);
      logInfo("positionName(111) + ':' + rotationAngleOf(111) + ':' + initialFlipOf(111) + ':' + firstFlipTargetOf(111) + ':' + secondFlipStartOf(111) + ':' + secondFlipTargetOf(111)");
      const actual: string = positionName(111) + ':' + rotationAngleOf(111) + ':' + initialFlipOf(111) + ':' + firstFlipTargetOf(111) + ':' + secondFlipStartOf(111) + ':' + secondFlipTargetOf(111);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0024
     * @tc.name      Camera_CameraPosition_0024
     * @tc.desc      position 123 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0024 begin`);
      logInfo("positionName(123) + ':' + rotationAngleOf(123) + ':' + initialFlipOf(123) + ':' + firstFlipTargetOf(123) + ':' + secondFlipStartOf(123) + ':' + secondFlipTargetOf(123)");
      const actual: string = positionName(123) + ':' + rotationAngleOf(123) + ':' + initialFlipOf(123) + ':' + firstFlipTargetOf(123) + ':' + secondFlipStartOf(123) + ':' + secondFlipTargetOf(123);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0025
     * @tc.name      Camera_CameraPosition_0025
     * @tc.desc      position 150 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0025 begin`);
      logInfo("positionName(150) + ':' + rotationAngleOf(150) + ':' + initialFlipOf(150) + ':' + firstFlipTargetOf(150) + ':' + secondFlipStartOf(150) + ':' + secondFlipTargetOf(150)");
      const actual: string = positionName(150) + ':' + rotationAngleOf(150) + ':' + initialFlipOf(150) + ':' + firstFlipTargetOf(150) + ':' + secondFlipStartOf(150) + ':' + secondFlipTargetOf(150);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0026
     * @tc.name      Camera_CameraPosition_0026
     * @tc.desc      position 200 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0026 begin`);
      logInfo("positionName(200) + ':' + rotationAngleOf(200) + ':' + initialFlipOf(200) + ':' + firstFlipTargetOf(200) + ':' + secondFlipStartOf(200) + ':' + secondFlipTargetOf(200)");
      const actual: string = positionName(200) + ':' + rotationAngleOf(200) + ':' + initialFlipOf(200) + ':' + firstFlipTargetOf(200) + ':' + secondFlipStartOf(200) + ':' + secondFlipTargetOf(200);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0027
     * @tc.name      Camera_CameraPosition_0027
     * @tc.desc      position 250 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0027 begin`);
      logInfo("positionName(250) + ':' + rotationAngleOf(250) + ':' + initialFlipOf(250) + ':' + firstFlipTargetOf(250) + ':' + secondFlipStartOf(250) + ':' + secondFlipTargetOf(250)");
      const actual: string = positionName(250) + ':' + rotationAngleOf(250) + ':' + initialFlipOf(250) + ':' + firstFlipTargetOf(250) + ':' + secondFlipStartOf(250) + ':' + secondFlipTargetOf(250);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0028
     * @tc.name      Camera_CameraPosition_0028
     * @tc.desc      position 300 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0028 begin`);
      logInfo("positionName(300) + ':' + rotationAngleOf(300) + ':' + initialFlipOf(300) + ':' + firstFlipTargetOf(300) + ':' + secondFlipStartOf(300) + ':' + secondFlipTargetOf(300)");
      const actual: string = positionName(300) + ':' + rotationAngleOf(300) + ':' + initialFlipOf(300) + ':' + firstFlipTargetOf(300) + ':' + secondFlipStartOf(300) + ':' + secondFlipTargetOf(300);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0029
     * @tc.name      Camera_CameraPosition_0029
     * @tc.desc      position 351 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0029 begin`);
      logInfo("positionName(351) + ':' + rotationAngleOf(351) + ':' + initialFlipOf(351) + ':' + firstFlipTargetOf(351) + ':' + secondFlipStartOf(351) + ':' + secondFlipTargetOf(351)");
      const actual: string = positionName(351) + ':' + rotationAngleOf(351) + ':' + initialFlipOf(351) + ':' + firstFlipTargetOf(351) + ':' + secondFlipStartOf(351) + ':' + secondFlipTargetOf(351);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0030
     * @tc.name      Camera_CameraPosition_0030
     * @tc.desc      position 400 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0030 begin`);
      logInfo("positionName(400) + ':' + rotationAngleOf(400) + ':' + initialFlipOf(400) + ':' + firstFlipTargetOf(400) + ':' + secondFlipStartOf(400) + ':' + secondFlipTargetOf(400)");
      const actual: string = positionName(400) + ':' + rotationAngleOf(400) + ':' + initialFlipOf(400) + ':' + firstFlipTargetOf(400) + ':' + secondFlipStartOf(400) + ':' + secondFlipTargetOf(400);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0031
     * @tc.name      Camera_CameraPosition_0031
     * @tc.desc      position 450 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0031 begin`);
      logInfo("positionName(450) + ':' + rotationAngleOf(450) + ':' + initialFlipOf(450) + ':' + firstFlipTargetOf(450) + ':' + secondFlipStartOf(450) + ':' + secondFlipTargetOf(450)");
      const actual: string = positionName(450) + ':' + rotationAngleOf(450) + ':' + initialFlipOf(450) + ':' + firstFlipTargetOf(450) + ':' + secondFlipStartOf(450) + ':' + secondFlipTargetOf(450);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0032
     * @tc.name      Camera_CameraPosition_0032
     * @tc.desc      position 500 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0032 begin`);
      logInfo("positionName(500) + ':' + rotationAngleOf(500) + ':' + initialFlipOf(500) + ':' + firstFlipTargetOf(500) + ':' + secondFlipStartOf(500) + ':' + secondFlipTargetOf(500)");
      const actual: string = positionName(500) + ':' + rotationAngleOf(500) + ':' + initialFlipOf(500) + ':' + firstFlipTargetOf(500) + ':' + secondFlipStartOf(500) + ':' + secondFlipTargetOf(500);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0033
     * @tc.name      Camera_CameraPosition_0033
     * @tc.desc      position 600 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0033 begin`);
      logInfo("positionName(600) + ':' + rotationAngleOf(600) + ':' + initialFlipOf(600) + ':' + firstFlipTargetOf(600) + ':' + secondFlipStartOf(600) + ':' + secondFlipTargetOf(600)");
      const actual: string = positionName(600) + ':' + rotationAngleOf(600) + ':' + initialFlipOf(600) + ':' + firstFlipTargetOf(600) + ':' + secondFlipStartOf(600) + ':' + secondFlipTargetOf(600);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0034
     * @tc.name      Camera_CameraPosition_0034
     * @tc.desc      position 700 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPosition_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPosition_0034 begin`);
      logInfo("positionName(700) + ':' + rotationAngleOf(700) + ':' + initialFlipOf(700) + ':' + firstFlipTargetOf(700) + ':' + secondFlipStartOf(700) + ':' + secondFlipTargetOf(700)");
      const actual: string = positionName(700) + ':' + rotationAngleOf(700) + ':' + initialFlipOf(700) + ':' + firstFlipTargetOf(700) + ':' + secondFlipStartOf(700) + ':' + secondFlipTargetOf(700);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0035
     * @tc.name      Camera_CameraPosition_0035
     * @tc.desc      position 800 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_CameraPosition_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CameraPosition_0035 begin`);
      logInfo("positionName(800) + ':' + rotationAngleOf(800) + ':' + initialFlipOf(800) + ':' + firstFlipTargetOf(800) + ':' + secondFlipStartOf(800) + ':' + secondFlipTargetOf(800)");
      const actual: string = positionName(800) + ':' + rotationAngleOf(800) + ':' + initialFlipOf(800) + ':' + firstFlipTargetOf(800) + ':' + secondFlipStartOf(800) + ':' + secondFlipTargetOf(800);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0036
     * @tc.name      Camera_CameraPosition_0036
     * @tc.desc      position 900 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0036 begin`);
      logInfo("positionName(900) + ':' + rotationAngleOf(900) + ':' + initialFlipOf(900) + ':' + firstFlipTargetOf(900) + ':' + secondFlipStartOf(900) + ':' + secondFlipTargetOf(900)");
      const actual: string = positionName(900) + ':' + rotationAngleOf(900) + ':' + initialFlipOf(900) + ':' + firstFlipTargetOf(900) + ':' + secondFlipStartOf(900) + ':' + secondFlipTargetOf(900);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0037
     * @tc.name      Camera_CameraPosition_0037
     * @tc.desc      position 1000 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0037 begin`);
      logInfo("positionName(1000) + ':' + rotationAngleOf(1000) + ':' + initialFlipOf(1000) + ':' + firstFlipTargetOf(1000) + ':' + secondFlipStartOf(1000) + ':' + secondFlipTargetOf(1000)");
      const actual: string = positionName(1000) + ':' + rotationAngleOf(1000) + ':' + initialFlipOf(1000) + ':' + firstFlipTargetOf(1000) + ':' + secondFlipStartOf(1000) + ':' + secondFlipTargetOf(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0038
     * @tc.name      Camera_CameraPosition_0038
     * @tc.desc      position -2 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0038 begin`);
      logInfo("positionName(-2) + ':' + rotationAngleOf(-2) + ':' + initialFlipOf(-2) + ':' + firstFlipTargetOf(-2) + ':' + secondFlipStartOf(-2) + ':' + secondFlipTargetOf(-2)");
      const actual: string = positionName(-2) + ':' + rotationAngleOf(-2) + ':' + initialFlipOf(-2) + ':' + firstFlipTargetOf(-2) + ':' + secondFlipStartOf(-2) + ':' + secondFlipTargetOf(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0039
     * @tc.name      Camera_CameraPosition_0039
     * @tc.desc      position -3 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0039 begin`);
      logInfo("positionName(-3) + ':' + rotationAngleOf(-3) + ':' + initialFlipOf(-3) + ':' + firstFlipTargetOf(-3) + ':' + secondFlipStartOf(-3) + ':' + secondFlipTargetOf(-3)");
      const actual: string = positionName(-3) + ':' + rotationAngleOf(-3) + ':' + initialFlipOf(-3) + ':' + firstFlipTargetOf(-3) + ':' + secondFlipStartOf(-3) + ':' + secondFlipTargetOf(-3);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0040
     * @tc.name      Camera_CameraPosition_0040
     * @tc.desc      position -7 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0040 begin`);
      logInfo("positionName(-7) + ':' + rotationAngleOf(-7) + ':' + initialFlipOf(-7) + ':' + firstFlipTargetOf(-7) + ':' + secondFlipStartOf(-7) + ':' + secondFlipTargetOf(-7)");
      const actual: string = positionName(-7) + ':' + rotationAngleOf(-7) + ':' + initialFlipOf(-7) + ':' + firstFlipTargetOf(-7) + ':' + secondFlipStartOf(-7) + ':' + secondFlipTargetOf(-7);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0041
     * @tc.name      Camera_CameraPosition_0041
     * @tc.desc      position -11 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0041 begin`);
      logInfo("positionName(-11) + ':' + rotationAngleOf(-11) + ':' + initialFlipOf(-11) + ':' + firstFlipTargetOf(-11) + ':' + secondFlipStartOf(-11) + ':' + secondFlipTargetOf(-11)");
      const actual: string = positionName(-11) + ':' + rotationAngleOf(-11) + ':' + initialFlipOf(-11) + ':' + firstFlipTargetOf(-11) + ':' + secondFlipStartOf(-11) + ':' + secondFlipTargetOf(-11);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0042
     * @tc.name      Camera_CameraPosition_0042
     * @tc.desc      position -21 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0042 begin`);
      logInfo("positionName(-21) + ':' + rotationAngleOf(-21) + ':' + initialFlipOf(-21) + ':' + firstFlipTargetOf(-21) + ':' + secondFlipStartOf(-21) + ':' + secondFlipTargetOf(-21)");
      const actual: string = positionName(-21) + ':' + rotationAngleOf(-21) + ':' + initialFlipOf(-21) + ':' + firstFlipTargetOf(-21) + ':' + secondFlipStartOf(-21) + ':' + secondFlipTargetOf(-21);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0043
     * @tc.name      Camera_CameraPosition_0043
     * @tc.desc      position -101 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0043 begin`);
      logInfo("positionName(-101) + ':' + rotationAngleOf(-101) + ':' + initialFlipOf(-101) + ':' + firstFlipTargetOf(-101) + ':' + secondFlipStartOf(-101) + ':' + secondFlipTargetOf(-101)");
      const actual: string = positionName(-101) + ':' + rotationAngleOf(-101) + ':' + initialFlipOf(-101) + ':' + firstFlipTargetOf(-101) + ':' + secondFlipStartOf(-101) + ':' + secondFlipTargetOf(-101);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0044
     * @tc.name      Camera_CameraPosition_0044
     * @tc.desc      position -1000 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0044 begin`);
      logInfo("positionName(-1000) + ':' + rotationAngleOf(-1000) + ':' + initialFlipOf(-1000) + ':' + firstFlipTargetOf(-1000) + ':' + secondFlipStartOf(-1000) + ':' + secondFlipTargetOf(-1000)");
      const actual: string = positionName(-1000) + ':' + rotationAngleOf(-1000) + ':' + initialFlipOf(-1000) + ':' + firstFlipTargetOf(-1000) + ':' + secondFlipStartOf(-1000) + ':' + secondFlipTargetOf(-1000);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0045
     * @tc.name      Camera_CameraPosition_0045
     * @tc.desc      position 999 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPosition_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPosition_0045 begin`);
      logInfo("positionName(999) + ':' + rotationAngleOf(999) + ':' + initialFlipOf(999) + ':' + firstFlipTargetOf(999) + ':' + secondFlipStartOf(999) + ':' + secondFlipTargetOf(999)");
      const actual: string = positionName(999) + ':' + rotationAngleOf(999) + ':' + initialFlipOf(999) + ':' + firstFlipTargetOf(999) + ':' + secondFlipStartOf(999) + ':' + secondFlipTargetOf(999);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo(`${BUNDLE}CameraPosition_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_POSITION_0046
     * @tc.name      Camera_CameraPosition_0046
     * @tc.desc      position 0.75 -> front, rotation 270, flips 180/270/180/180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPosition_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPosition_0046 begin`);
      logInfo("positionName(0.75) + ':' + rotationAngleOf(0.75) + ':' + initialFlipOf(0.75) + ':' + firstFlipTargetOf(0.75) + ':' + secondFlipStartOf(0.75) + ':' + secondFlipTargetOf(0.75)");
      const actual: string = positionName(0.75) + ':' + rotationAngleOf(0.75) + ':' + initialFlipOf(0.75) + ':' + firstFlipTargetOf(0.75) + ':' + secondFlipStartOf(0.75) + ':' + secondFlipTargetOf(0.75);
      logInfo('actual=' + String(actual) + ', expected=' + "front:270:180:270:180:180");
      expect(actual).assertEqual("front:270:180:270:180:180");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPosition_0046 end`);
    });
  });
}
