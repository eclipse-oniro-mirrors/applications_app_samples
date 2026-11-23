/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  snapshotRotation,
} from '../model/ResolutionLogic';

/** SnapshotRotationTest logic checks (43 cases). */
export default function snapshotRotationTest(): void {
  describe('SnapshotRotationTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0001
     * @tc.name      Resolution_SnapshotRotation_0001
     * @tc.desc      snapshotRotation(0) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SnapshotRotation_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0001 begin`);
      logInfo("snapshotRotation(0)");
      const actual: number = snapshotRotation(0);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0002
     * @tc.name      Resolution_SnapshotRotation_0002
     * @tc.desc      snapshotRotation(1) returns 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0002 begin`);
      logInfo("snapshotRotation(1)");
      const actual: number = snapshotRotation(1);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SnapshotRotation_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0003
     * @tc.name      Resolution_SnapshotRotation_0003
     * @tc.desc      snapshotRotation(2) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0003 begin`);
      logInfo("snapshotRotation(2)");
      const actual: number = snapshotRotation(2);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0004
     * @tc.name      Resolution_SnapshotRotation_0004
     * @tc.desc      snapshotRotation(3) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0004 begin`);
      logInfo("snapshotRotation(3)");
      const actual: number = snapshotRotation(3);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0005
     * @tc.name      Resolution_SnapshotRotation_0005
     * @tc.desc      snapshotRotation(4) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0005 begin`);
      logInfo("snapshotRotation(4)");
      const actual: number = snapshotRotation(4);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0006
     * @tc.name      Resolution_SnapshotRotation_0006
     * @tc.desc      snapshotRotation(5) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0006 begin`);
      logInfo("snapshotRotation(5)");
      const actual: number = snapshotRotation(5);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0007
     * @tc.name      Resolution_SnapshotRotation_0007
     * @tc.desc      snapshotRotation(6) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0007 begin`);
      logInfo("snapshotRotation(6)");
      const actual: number = snapshotRotation(6);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0008
     * @tc.name      Resolution_SnapshotRotation_0008
     * @tc.desc      snapshotRotation(7) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0008 begin`);
      logInfo("snapshotRotation(7)");
      const actual: number = snapshotRotation(7);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0009
     * @tc.name      Resolution_SnapshotRotation_0009
     * @tc.desc      snapshotRotation(8) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0009 begin`);
      logInfo("snapshotRotation(8)");
      const actual: number = snapshotRotation(8);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0010
     * @tc.name      Resolution_SnapshotRotation_0010
     * @tc.desc      snapshotRotation(9) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0010 begin`);
      logInfo("snapshotRotation(9)");
      const actual: number = snapshotRotation(9);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0011
     * @tc.name      Resolution_SnapshotRotation_0011
     * @tc.desc      snapshotRotation(10) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0011 begin`);
      logInfo("snapshotRotation(10)");
      const actual: number = snapshotRotation(10);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0012
     * @tc.name      Resolution_SnapshotRotation_0012
     * @tc.desc      snapshotRotation(11) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SnapshotRotation_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0012 begin`);
      logInfo("snapshotRotation(11)");
      const actual: number = snapshotRotation(11);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0013
     * @tc.name      Resolution_SnapshotRotation_0013
     * @tc.desc      snapshotRotation(12) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0013 begin`);
      logInfo("snapshotRotation(12)");
      const actual: number = snapshotRotation(12);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0014
     * @tc.name      Resolution_SnapshotRotation_0014
     * @tc.desc      snapshotRotation(13) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0014 begin`);
      logInfo("snapshotRotation(13)");
      const actual: number = snapshotRotation(13);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0015
     * @tc.name      Resolution_SnapshotRotation_0015
     * @tc.desc      snapshotRotation(14) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0015 begin`);
      logInfo("snapshotRotation(14)");
      const actual: number = snapshotRotation(14);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0016
     * @tc.name      Resolution_SnapshotRotation_0016
     * @tc.desc      snapshotRotation(15) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0016 begin`);
      logInfo("snapshotRotation(15)");
      const actual: number = snapshotRotation(15);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0017
     * @tc.name      Resolution_SnapshotRotation_0017
     * @tc.desc      snapshotRotation(16) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0017 begin`);
      logInfo("snapshotRotation(16)");
      const actual: number = snapshotRotation(16);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0018
     * @tc.name      Resolution_SnapshotRotation_0018
     * @tc.desc      snapshotRotation(-1) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_SnapshotRotation_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0018 begin`);
      logInfo("snapshotRotation(-1)");
      const actual: number = snapshotRotation(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0019
     * @tc.name      Resolution_SnapshotRotation_0019
     * @tc.desc      snapshotRotation(20) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0019 begin`);
      logInfo("snapshotRotation(20)");
      const actual: number = snapshotRotation(20);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0020
     * @tc.name      Resolution_SnapshotRotation_0020
     * @tc.desc      snapshotRotation(30) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0020 begin`);
      logInfo("snapshotRotation(30)");
      const actual: number = snapshotRotation(30);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0021
     * @tc.name      Resolution_SnapshotRotation_0021
     * @tc.desc      snapshotRotation(40) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0021 begin`);
      logInfo("snapshotRotation(40)");
      const actual: number = snapshotRotation(40);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0022
     * @tc.name      Resolution_SnapshotRotation_0022
     * @tc.desc      snapshotRotation(50) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0022 begin`);
      logInfo("snapshotRotation(50)");
      const actual: number = snapshotRotation(50);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0023
     * @tc.name      Resolution_SnapshotRotation_0023
     * @tc.desc      snapshotRotation(60) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SnapshotRotation_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0023 begin`);
      logInfo("snapshotRotation(60)");
      const actual: number = snapshotRotation(60);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0024
     * @tc.name      Resolution_SnapshotRotation_0024
     * @tc.desc      snapshotRotation(70) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0024 begin`);
      logInfo("snapshotRotation(70)");
      const actual: number = snapshotRotation(70);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0025
     * @tc.name      Resolution_SnapshotRotation_0025
     * @tc.desc      snapshotRotation(80) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0025 begin`);
      logInfo("snapshotRotation(80)");
      const actual: number = snapshotRotation(80);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0026
     * @tc.name      Resolution_SnapshotRotation_0026
     * @tc.desc      snapshotRotation(90) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0026 begin`);
      logInfo("snapshotRotation(90)");
      const actual: number = snapshotRotation(90);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0027
     * @tc.name      Resolution_SnapshotRotation_0027
     * @tc.desc      snapshotRotation(100) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0027 begin`);
      logInfo("snapshotRotation(100)");
      const actual: number = snapshotRotation(100);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0028
     * @tc.name      Resolution_SnapshotRotation_0028
     * @tc.desc      snapshotRotation(200) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0028 begin`);
      logInfo("snapshotRotation(200)");
      const actual: number = snapshotRotation(200);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0029
     * @tc.name      Resolution_SnapshotRotation_0029
     * @tc.desc      snapshotRotation(255) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0029 begin`);
      logInfo("snapshotRotation(255)");
      const actual: number = snapshotRotation(255);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0030
     * @tc.name      Resolution_SnapshotRotation_0030
     * @tc.desc      snapshotRotation(360) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0030 begin`);
      logInfo("snapshotRotation(360)");
      const actual: number = snapshotRotation(360);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0031
     * @tc.name      Resolution_SnapshotRotation_0031
     * @tc.desc      snapshotRotation(720) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0031 begin`);
      logInfo("snapshotRotation(720)");
      const actual: number = snapshotRotation(720);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0032
     * @tc.name      Resolution_SnapshotRotation_0032
     * @tc.desc      snapshotRotation(1080) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0032 begin`);
      logInfo("snapshotRotation(1080)");
      const actual: number = snapshotRotation(1080);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0033
     * @tc.name      Resolution_SnapshotRotation_0033
     * @tc.desc      snapshotRotation(1280) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0033 begin`);
      logInfo("snapshotRotation(1280)");
      const actual: number = snapshotRotation(1280);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0034
     * @tc.name      Resolution_SnapshotRotation_0034
     * @tc.desc      snapshotRotation(1920) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SnapshotRotation_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0034 begin`);
      logInfo("snapshotRotation(1920)");
      const actual: number = snapshotRotation(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0035
     * @tc.name      Resolution_SnapshotRotation_0035
     * @tc.desc      snapshotRotation(3840) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_SnapshotRotation_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0035 begin`);
      logInfo("snapshotRotation(3840)");
      const actual: number = snapshotRotation(3840);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0036
     * @tc.name      Resolution_SnapshotRotation_0036
     * @tc.desc      snapshotRotation(4096) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0036 begin`);
      logInfo("snapshotRotation(4096)");
      const actual: number = snapshotRotation(4096);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0037
     * @tc.name      Resolution_SnapshotRotation_0037
     * @tc.desc      snapshotRotation(999) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0037 begin`);
      logInfo("snapshotRotation(999)");
      const actual: number = snapshotRotation(999);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0038
     * @tc.name      Resolution_SnapshotRotation_0038
     * @tc.desc      snapshotRotation(1000) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0038 begin`);
      logInfo("snapshotRotation(1000)");
      const actual: number = snapshotRotation(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0039
     * @tc.name      Resolution_SnapshotRotation_0039
     * @tc.desc      snapshotRotation(24) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0039 begin`);
      logInfo("snapshotRotation(24)");
      const actual: number = snapshotRotation(24);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0040
     * @tc.name      Resolution_SnapshotRotation_0040
     * @tc.desc      snapshotRotation(25) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0040 begin`);
      logInfo("snapshotRotation(25)");
      const actual: number = snapshotRotation(25);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0041
     * @tc.name      Resolution_SnapshotRotation_0041
     * @tc.desc      snapshotRotation(28) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0041 begin`);
      logInfo("snapshotRotation(28)");
      const actual: number = snapshotRotation(28);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0042
     * @tc.name      Resolution_SnapshotRotation_0042
     * @tc.desc      snapshotRotation(17) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0042 begin`);
      logInfo("snapshotRotation(17)");
      const actual: number = snapshotRotation(17);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SnapshotRotation_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SNAPSHOT_ROTATION_0043
     * @tc.name      Resolution_SnapshotRotation_0043
     * @tc.desc      snapshotRotation(19) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SnapshotRotation_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotRotation_0043 begin`);
      logInfo("snapshotRotation(19)");
      const actual: number = snapshotRotation(19);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SnapshotRotation_0043 end`);
    });
  });
}
