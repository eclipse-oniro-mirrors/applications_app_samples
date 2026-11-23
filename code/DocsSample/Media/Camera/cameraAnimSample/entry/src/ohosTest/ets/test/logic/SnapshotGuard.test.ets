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
  snapshotGuard,
} from '../model/CameraLogic';

/** SnapshotGuardTest logic checks (40 cases). */
export default function snapshotGuardTest(): void {
  describe('SnapshotGuardTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0001
     * @tc.name      Camera_SnapshotGuard_0001
     * @tc.desc      snapshotGuard("") reports false before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SnapshotGuard_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0001 begin`);
      logInfo("snapshotGuard(\"\")");
      const actual: boolean = snapshotGuard("");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0002
     * @tc.name      Camera_SnapshotGuard_0002
     * @tc.desc      snapshotGuard("1") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0002 begin`);
      logInfo("snapshotGuard(\"1\")");
      const actual: boolean = snapshotGuard("1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0003
     * @tc.name      Camera_SnapshotGuard_0003
     * @tc.desc      snapshotGuard("0") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0003 begin`);
      logInfo("snapshotGuard(\"0\")");
      const actual: boolean = snapshotGuard("0");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0004
     * @tc.name      Camera_SnapshotGuard_0004
     * @tc.desc      snapshotGuard("snapshot") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0004 begin`);
      logInfo("snapshotGuard(\"snapshot\")");
      const actual: boolean = snapshotGuard("snapshot");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0005
     * @tc.name      Camera_SnapshotGuard_0005
     * @tc.desc      snapshotGuard("snapshotId") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0005 begin`);
      logInfo("snapshotGuard(\"snapshotId\")");
      const actual: boolean = snapshotGuard("snapshotId");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0006
     * @tc.name      Camera_SnapshotGuard_0006
     * @tc.desc      snapshotGuard("  ") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0006 begin`);
      logInfo("snapshotGuard(\"  \")");
      const actual: boolean = snapshotGuard("  ");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0007
     * @tc.name      Camera_SnapshotGuard_0007
     * @tc.desc      snapshotGuard("x") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0007 begin`);
      logInfo("snapshotGuard(\"x\")");
      const actual: boolean = snapshotGuard("x");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0008
     * @tc.name      Camera_SnapshotGuard_0008
     * @tc.desc      snapshotGuard("abc") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0008 begin`);
      logInfo("snapshotGuard(\"abc\")");
      const actual: boolean = snapshotGuard("abc");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0009
     * @tc.name      Camera_SnapshotGuard_0009
     * @tc.desc      snapshotGuard("123456") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0009 begin`);
      logInfo("snapshotGuard(\"123456\")");
      const actual: boolean = snapshotGuard("123456");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0010
     * @tc.name      Camera_SnapshotGuard_0010
     * @tc.desc      snapshotGuard("fd://1") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0010 begin`);
      logInfo("snapshotGuard(\"fd://1\")");
      const actual: boolean = snapshotGuard("fd://1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0011
     * @tc.name      Camera_SnapshotGuard_0011
     * @tc.desc      snapshotGuard("null") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0011 begin`);
      logInfo("snapshotGuard(\"null\")");
      const actual: boolean = snapshotGuard("null");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0012
     * @tc.name      Camera_SnapshotGuard_0012
     * @tc.desc      snapshotGuard("undefined") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SnapshotGuard_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0012 begin`);
      logInfo("snapshotGuard(\"undefined\")");
      const actual: boolean = snapshotGuard("undefined");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0013
     * @tc.name      Camera_SnapshotGuard_0013
     * @tc.desc      snapshotGuard("a") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0013 begin`);
      logInfo("snapshotGuard(\"a\")");
      const actual: boolean = snapshotGuard("a");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0014
     * @tc.name      Camera_SnapshotGuard_0014
     * @tc.desc      snapshotGuard("b") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0014 begin`);
      logInfo("snapshotGuard(\"b\")");
      const actual: boolean = snapshotGuard("b");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0015
     * @tc.name      Camera_SnapshotGuard_0015
     * @tc.desc      snapshotGuard("c") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0015 begin`);
      logInfo("snapshotGuard(\"c\")");
      const actual: boolean = snapshotGuard("c");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0016
     * @tc.name      Camera_SnapshotGuard_0016
     * @tc.desc      snapshotGuard("long-snapshot-id") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0016 begin`);
      logInfo("snapshotGuard(\"long-snapshot-id\")");
      const actual: boolean = snapshotGuard("long-snapshot-id");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0017
     * @tc.name      Camera_SnapshotGuard_0017
     * @tc.desc      snapshotGuard("中文") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0017 begin`);
      logInfo("snapshotGuard(\"中文\")");
      const actual: boolean = snapshotGuard("中文");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0018
     * @tc.name      Camera_SnapshotGuard_0018
     * @tc.desc      snapshotGuard(" ") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SnapshotGuard_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0018 begin`);
      logInfo("snapshotGuard(\" \")");
      const actual: boolean = snapshotGuard(" ");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0019
     * @tc.name      Camera_SnapshotGuard_0019
     * @tc.desc      snapshotGuard("-") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0019 begin`);
      logInfo("snapshotGuard(\"-\")");
      const actual: boolean = snapshotGuard("-");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0020
     * @tc.name      Camera_SnapshotGuard_0020
     * @tc.desc      snapshotGuard("_") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0020 begin`);
      logInfo("snapshotGuard(\"_\")");
      const actual: boolean = snapshotGuard("_");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0021
     * @tc.name      Camera_SnapshotGuard_0021
     * @tc.desc      snapshotGuard("snapshot-0") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0021 begin`);
      logInfo("snapshotGuard(\"snapshot-0\")");
      const actual: boolean = snapshotGuard("snapshot-0");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0022
     * @tc.name      Camera_SnapshotGuard_0022
     * @tc.desc      snapshotGuard("snapshot-1") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0022 begin`);
      logInfo("snapshotGuard(\"snapshot-1\")");
      const actual: boolean = snapshotGuard("snapshot-1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0023
     * @tc.name      Camera_SnapshotGuard_0023
     * @tc.desc      snapshotGuard("snapshot_2") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SnapshotGuard_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0023 begin`);
      logInfo("snapshotGuard(\"snapshot_2\")");
      const actual: boolean = snapshotGuard("snapshot_2");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0024
     * @tc.name      Camera_SnapshotGuard_0024
     * @tc.desc      snapshotGuard("S") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0024 begin`);
      logInfo("snapshotGuard(\"S\")");
      const actual: boolean = snapshotGuard("S");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0025
     * @tc.name      Camera_SnapshotGuard_0025
     * @tc.desc      snapshotGuard("ID") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0025 begin`);
      logInfo("snapshotGuard(\"ID\")");
      const actual: boolean = snapshotGuard("ID");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0026
     * @tc.name      Camera_SnapshotGuard_0026
     * @tc.desc      snapshotGuard("1920") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0026 begin`);
      logInfo("snapshotGuard(\"1920\")");
      const actual: boolean = snapshotGuard("1920");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0027
     * @tc.name      Camera_SnapshotGuard_0027
     * @tc.desc      snapshotGuard("1080") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0027 begin`);
      logInfo("snapshotGuard(\"1080\")");
      const actual: boolean = snapshotGuard("1080");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0028
     * @tc.name      Camera_SnapshotGuard_0028
     * @tc.desc      snapshotGuard("SNAPSHOT") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0028 begin`);
      logInfo("snapshotGuard(\"SNAPSHOT\")");
      const actual: boolean = snapshotGuard("SNAPSHOT");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0029
     * @tc.name      Camera_SnapshotGuard_0029
     * @tc.desc      snapshotGuard("Snapshot") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0029 begin`);
      logInfo("snapshotGuard(\"Snapshot\")");
      const actual: boolean = snapshotGuard("Snapshot");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0030
     * @tc.name      Camera_SnapshotGuard_0030
     * @tc.desc      snapshotGuard("id-1") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0030 begin`);
      logInfo("snapshotGuard(\"id-1\")");
      const actual: boolean = snapshotGuard("id-1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0031
     * @tc.name      Camera_SnapshotGuard_0031
     * @tc.desc      snapshotGuard("id-2") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0031 begin`);
      logInfo("snapshotGuard(\"id-2\")");
      const actual: boolean = snapshotGuard("id-2");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0032
     * @tc.name      Camera_SnapshotGuard_0032
     * @tc.desc      snapshotGuard("id-3") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0032 begin`);
      logInfo("snapshotGuard(\"id-3\")");
      const actual: boolean = snapshotGuard("id-3");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0033
     * @tc.name      Camera_SnapshotGuard_0033
     * @tc.desc      snapshotGuard("id-4") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0033 begin`);
      logInfo("snapshotGuard(\"id-4\")");
      const actual: boolean = snapshotGuard("id-4");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0034
     * @tc.name      Camera_SnapshotGuard_0034
     * @tc.desc      snapshotGuard("id-5") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SnapshotGuard_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0034 begin`);
      logInfo("snapshotGuard(\"id-5\")");
      const actual: boolean = snapshotGuard("id-5");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0035
     * @tc.name      Camera_SnapshotGuard_0035
     * @tc.desc      snapshotGuard("id-6") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SnapshotGuard_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0035 begin`);
      logInfo("snapshotGuard(\"id-6\")");
      const actual: boolean = snapshotGuard("id-6");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0036
     * @tc.name      Camera_SnapshotGuard_0036
     * @tc.desc      snapshotGuard("id-7") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0036 begin`);
      logInfo("snapshotGuard(\"id-7\")");
      const actual: boolean = snapshotGuard("id-7");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0037
     * @tc.name      Camera_SnapshotGuard_0037
     * @tc.desc      snapshotGuard("id-8") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0037 begin`);
      logInfo("snapshotGuard(\"id-8\")");
      const actual: boolean = snapshotGuard("id-8");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0038
     * @tc.name      Camera_SnapshotGuard_0038
     * @tc.desc      snapshotGuard("id-9") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0038 begin`);
      logInfo("snapshotGuard(\"id-9\")");
      const actual: boolean = snapshotGuard("id-9");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0039
     * @tc.name      Camera_SnapshotGuard_0039
     * @tc.desc      snapshotGuard("id-10") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0039 begin`);
      logInfo("snapshotGuard(\"id-10\")");
      const actual: boolean = snapshotGuard("id-10");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SnapshotGuard_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SNAPSHOT_GUARD_0040
     * @tc.name      Camera_SnapshotGuard_0040
     * @tc.desc      snapshotGuard("id-11") reports true before the snapshot is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SnapshotGuard_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SnapshotGuard_0040 begin`);
      logInfo("snapshotGuard(\"id-11\")");
      const actual: boolean = snapshotGuard("id-11");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SnapshotGuard_0040 end`);
    });
  });
}
