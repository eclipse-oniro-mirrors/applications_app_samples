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
  surfaceShotGuard,
} from '../model/CameraLogic';

/** SurfaceShotGuardTest logic checks (40 cases). */
export default function surfaceShotGuardTest(): void {
  describe('SurfaceShotGuardTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0001
     * @tc.name      Camera_SurfaceShotGuard_0001
     * @tc.desc      surfaceShotGuard("") reports false before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SurfaceShotGuard_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0001 begin`);
      logInfo("surfaceShotGuard(\"\")");
      const actual: boolean = surfaceShotGuard("");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0002
     * @tc.name      Camera_SurfaceShotGuard_0002
     * @tc.desc      surfaceShotGuard("1") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0002 begin`);
      logInfo("surfaceShotGuard(\"1\")");
      const actual: boolean = surfaceShotGuard("1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0003
     * @tc.name      Camera_SurfaceShotGuard_0003
     * @tc.desc      surfaceShotGuard("0") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0003 begin`);
      logInfo("surfaceShotGuard(\"0\")");
      const actual: boolean = surfaceShotGuard("0");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0004
     * @tc.name      Camera_SurfaceShotGuard_0004
     * @tc.desc      surfaceShotGuard("surface") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0004 begin`);
      logInfo("surfaceShotGuard(\"surface\")");
      const actual: boolean = surfaceShotGuard("surface");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0005
     * @tc.name      Camera_SurfaceShotGuard_0005
     * @tc.desc      surfaceShotGuard("surfaceId") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0005 begin`);
      logInfo("surfaceShotGuard(\"surfaceId\")");
      const actual: boolean = surfaceShotGuard("surfaceId");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0006
     * @tc.name      Camera_SurfaceShotGuard_0006
     * @tc.desc      surfaceShotGuard("  ") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0006 begin`);
      logInfo("surfaceShotGuard(\"  \")");
      const actual: boolean = surfaceShotGuard("  ");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0007
     * @tc.name      Camera_SurfaceShotGuard_0007
     * @tc.desc      surfaceShotGuard("x") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0007 begin`);
      logInfo("surfaceShotGuard(\"x\")");
      const actual: boolean = surfaceShotGuard("x");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0008
     * @tc.name      Camera_SurfaceShotGuard_0008
     * @tc.desc      surfaceShotGuard("abc") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0008 begin`);
      logInfo("surfaceShotGuard(\"abc\")");
      const actual: boolean = surfaceShotGuard("abc");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0009
     * @tc.name      Camera_SurfaceShotGuard_0009
     * @tc.desc      surfaceShotGuard("123456") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0009 begin`);
      logInfo("surfaceShotGuard(\"123456\")");
      const actual: boolean = surfaceShotGuard("123456");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0010
     * @tc.name      Camera_SurfaceShotGuard_0010
     * @tc.desc      surfaceShotGuard("fd://1") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0010 begin`);
      logInfo("surfaceShotGuard(\"fd://1\")");
      const actual: boolean = surfaceShotGuard("fd://1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0011
     * @tc.name      Camera_SurfaceShotGuard_0011
     * @tc.desc      surfaceShotGuard("null") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0011 begin`);
      logInfo("surfaceShotGuard(\"null\")");
      const actual: boolean = surfaceShotGuard("null");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0012
     * @tc.name      Camera_SurfaceShotGuard_0012
     * @tc.desc      surfaceShotGuard("undefined") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SurfaceShotGuard_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0012 begin`);
      logInfo("surfaceShotGuard(\"undefined\")");
      const actual: boolean = surfaceShotGuard("undefined");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0013
     * @tc.name      Camera_SurfaceShotGuard_0013
     * @tc.desc      surfaceShotGuard("a") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0013 begin`);
      logInfo("surfaceShotGuard(\"a\")");
      const actual: boolean = surfaceShotGuard("a");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0014
     * @tc.name      Camera_SurfaceShotGuard_0014
     * @tc.desc      surfaceShotGuard("b") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0014 begin`);
      logInfo("surfaceShotGuard(\"b\")");
      const actual: boolean = surfaceShotGuard("b");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0015
     * @tc.name      Camera_SurfaceShotGuard_0015
     * @tc.desc      surfaceShotGuard("c") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0015 begin`);
      logInfo("surfaceShotGuard(\"c\")");
      const actual: boolean = surfaceShotGuard("c");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0016
     * @tc.name      Camera_SurfaceShotGuard_0016
     * @tc.desc      surfaceShotGuard("long-surface-id") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0016 begin`);
      logInfo("surfaceShotGuard(\"long-surface-id\")");
      const actual: boolean = surfaceShotGuard("long-surface-id");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0017
     * @tc.name      Camera_SurfaceShotGuard_0017
     * @tc.desc      surfaceShotGuard("中文") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0017 begin`);
      logInfo("surfaceShotGuard(\"中文\")");
      const actual: boolean = surfaceShotGuard("中文");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0018
     * @tc.name      Camera_SurfaceShotGuard_0018
     * @tc.desc      surfaceShotGuard(" ") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SurfaceShotGuard_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0018 begin`);
      logInfo("surfaceShotGuard(\" \")");
      const actual: boolean = surfaceShotGuard(" ");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0019
     * @tc.name      Camera_SurfaceShotGuard_0019
     * @tc.desc      surfaceShotGuard("-") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0019 begin`);
      logInfo("surfaceShotGuard(\"-\")");
      const actual: boolean = surfaceShotGuard("-");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0020
     * @tc.name      Camera_SurfaceShotGuard_0020
     * @tc.desc      surfaceShotGuard("_") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0020 begin`);
      logInfo("surfaceShotGuard(\"_\")");
      const actual: boolean = surfaceShotGuard("_");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0021
     * @tc.name      Camera_SurfaceShotGuard_0021
     * @tc.desc      surfaceShotGuard("surface-0") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0021 begin`);
      logInfo("surfaceShotGuard(\"surface-0\")");
      const actual: boolean = surfaceShotGuard("surface-0");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0022
     * @tc.name      Camera_SurfaceShotGuard_0022
     * @tc.desc      surfaceShotGuard("surface-1") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0022 begin`);
      logInfo("surfaceShotGuard(\"surface-1\")");
      const actual: boolean = surfaceShotGuard("surface-1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0023
     * @tc.name      Camera_SurfaceShotGuard_0023
     * @tc.desc      surfaceShotGuard("surface_2") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SurfaceShotGuard_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0023 begin`);
      logInfo("surfaceShotGuard(\"surface_2\")");
      const actual: boolean = surfaceShotGuard("surface_2");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0024
     * @tc.name      Camera_SurfaceShotGuard_0024
     * @tc.desc      surfaceShotGuard("S") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0024 begin`);
      logInfo("surfaceShotGuard(\"S\")");
      const actual: boolean = surfaceShotGuard("S");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0025
     * @tc.name      Camera_SurfaceShotGuard_0025
     * @tc.desc      surfaceShotGuard("ID") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0025 begin`);
      logInfo("surfaceShotGuard(\"ID\")");
      const actual: boolean = surfaceShotGuard("ID");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0026
     * @tc.name      Camera_SurfaceShotGuard_0026
     * @tc.desc      surfaceShotGuard("1920") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0026 begin`);
      logInfo("surfaceShotGuard(\"1920\")");
      const actual: boolean = surfaceShotGuard("1920");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0027
     * @tc.name      Camera_SurfaceShotGuard_0027
     * @tc.desc      surfaceShotGuard("1080") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0027 begin`);
      logInfo("surfaceShotGuard(\"1080\")");
      const actual: boolean = surfaceShotGuard("1080");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0028
     * @tc.name      Camera_SurfaceShotGuard_0028
     * @tc.desc      surfaceShotGuard("SURFACE") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0028 begin`);
      logInfo("surfaceShotGuard(\"SURFACE\")");
      const actual: boolean = surfaceShotGuard("SURFACE");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0029
     * @tc.name      Camera_SurfaceShotGuard_0029
     * @tc.desc      surfaceShotGuard("Surface") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0029 begin`);
      logInfo("surfaceShotGuard(\"Surface\")");
      const actual: boolean = surfaceShotGuard("Surface");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0030
     * @tc.name      Camera_SurfaceShotGuard_0030
     * @tc.desc      surfaceShotGuard("id-1") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0030 begin`);
      logInfo("surfaceShotGuard(\"id-1\")");
      const actual: boolean = surfaceShotGuard("id-1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0031
     * @tc.name      Camera_SurfaceShotGuard_0031
     * @tc.desc      surfaceShotGuard("id-2") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0031 begin`);
      logInfo("surfaceShotGuard(\"id-2\")");
      const actual: boolean = surfaceShotGuard("id-2");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0032
     * @tc.name      Camera_SurfaceShotGuard_0032
     * @tc.desc      surfaceShotGuard("id-3") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0032 begin`);
      logInfo("surfaceShotGuard(\"id-3\")");
      const actual: boolean = surfaceShotGuard("id-3");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0033
     * @tc.name      Camera_SurfaceShotGuard_0033
     * @tc.desc      surfaceShotGuard("id-4") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0033 begin`);
      logInfo("surfaceShotGuard(\"id-4\")");
      const actual: boolean = surfaceShotGuard("id-4");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0034
     * @tc.name      Camera_SurfaceShotGuard_0034
     * @tc.desc      surfaceShotGuard("id-5") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SurfaceShotGuard_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0034 begin`);
      logInfo("surfaceShotGuard(\"id-5\")");
      const actual: boolean = surfaceShotGuard("id-5");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0035
     * @tc.name      Camera_SurfaceShotGuard_0035
     * @tc.desc      surfaceShotGuard("id-6") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SurfaceShotGuard_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0035 begin`);
      logInfo("surfaceShotGuard(\"id-6\")");
      const actual: boolean = surfaceShotGuard("id-6");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0036
     * @tc.name      Camera_SurfaceShotGuard_0036
     * @tc.desc      surfaceShotGuard("id-7") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0036 begin`);
      logInfo("surfaceShotGuard(\"id-7\")");
      const actual: boolean = surfaceShotGuard("id-7");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0037
     * @tc.name      Camera_SurfaceShotGuard_0037
     * @tc.desc      surfaceShotGuard("id-8") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0037 begin`);
      logInfo("surfaceShotGuard(\"id-8\")");
      const actual: boolean = surfaceShotGuard("id-8");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0038
     * @tc.name      Camera_SurfaceShotGuard_0038
     * @tc.desc      surfaceShotGuard("id-9") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0038 begin`);
      logInfo("surfaceShotGuard(\"id-9\")");
      const actual: boolean = surfaceShotGuard("id-9");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0039
     * @tc.name      Camera_SurfaceShotGuard_0039
     * @tc.desc      surfaceShotGuard("id-10") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0039 begin`);
      logInfo("surfaceShotGuard(\"id-10\")");
      const actual: boolean = surfaceShotGuard("id-10");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SurfaceShotGuard_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SURFACE_SHOT_GUARD_0040
     * @tc.name      Camera_SurfaceShotGuard_0040
     * @tc.desc      surfaceShotGuard("id-11") reports true before the surface is ready.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SurfaceShotGuard_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SurfaceShotGuard_0040 begin`);
      logInfo("surfaceShotGuard(\"id-11\")");
      const actual: boolean = surfaceShotGuard("id-11");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SurfaceShotGuard_0040 end`);
    });
  });
}
