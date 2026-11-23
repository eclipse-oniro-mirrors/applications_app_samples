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
  is2in1,
  isTablet,
  isIsolateForSpecialType,
} from '../model/ResolutionLogic';

/** DeviceGuardsTest logic checks (46 cases). */
export default function deviceGuardsTest(): void {
  describe('DeviceGuardsTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0001
     * @tc.name      Resolution_DeviceGuards_0001
     * @tc.desc      device guards for "phone"/0 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DeviceGuards_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceGuards_0001 begin`);
      logInfo("is2in1(\"phone\") + ':' + isTablet(\"phone\") + ':' + isIsolateForSpecialType(\"phone\", 0)");
      const actual: string = is2in1("phone") + ':' + isTablet("phone") + ':' + isIsolateForSpecialType("phone", 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0002
     * @tc.name      Resolution_DeviceGuards_0002
     * @tc.desc      device guards for "phone"/1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0002 begin`);
      logInfo("is2in1(\"phone\") + ':' + isTablet(\"phone\") + ':' + isIsolateForSpecialType(\"phone\", 1)");
      const actual: string = is2in1("phone") + ':' + isTablet("phone") + ':' + isIsolateForSpecialType("phone", 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0003
     * @tc.name      Resolution_DeviceGuards_0003
     * @tc.desc      device guards for "phone"/50000012 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0003 begin`);
      logInfo("is2in1(\"phone\") + ':' + isTablet(\"phone\") + ':' + isIsolateForSpecialType(\"phone\", 50000012)");
      const actual: string = is2in1("phone") + ':' + isTablet("phone") + ':' + isIsolateForSpecialType("phone", 50000012);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0004
     * @tc.name      Resolution_DeviceGuards_0004
     * @tc.desc      device guards for "phone"/50000013 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0004 begin`);
      logInfo("is2in1(\"phone\") + ':' + isTablet(\"phone\") + ':' + isIsolateForSpecialType(\"phone\", 50000013)");
      const actual: string = is2in1("phone") + ':' + isTablet("phone") + ':' + isIsolateForSpecialType("phone", 50000013);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0005
     * @tc.name      Resolution_DeviceGuards_0005
     * @tc.desc      device guards for "phone"/50000014 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0005 begin`);
      logInfo("is2in1(\"phone\") + ':' + isTablet(\"phone\") + ':' + isIsolateForSpecialType(\"phone\", 50000014)");
      const actual: string = is2in1("phone") + ':' + isTablet("phone") + ':' + isIsolateForSpecialType("phone", 50000014);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0006
     * @tc.name      Resolution_DeviceGuards_0006
     * @tc.desc      device guards for "phone"/60000000 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0006 begin`);
      logInfo("is2in1(\"phone\") + ':' + isTablet(\"phone\") + ':' + isIsolateForSpecialType(\"phone\", 60000000)");
      const actual: string = is2in1("phone") + ':' + isTablet("phone") + ':' + isIsolateForSpecialType("phone", 60000000);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0007
     * @tc.name      Resolution_DeviceGuards_0007
     * @tc.desc      device guards for "phone"/-1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0007 begin`);
      logInfo("is2in1(\"phone\") + ':' + isTablet(\"phone\") + ':' + isIsolateForSpecialType(\"phone\", -1)");
      const actual: string = is2in1("phone") + ':' + isTablet("phone") + ':' + isIsolateForSpecialType("phone", -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0008
     * @tc.name      Resolution_DeviceGuards_0008
     * @tc.desc      device guards for "tablet"/0 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0008 begin`);
      logInfo("is2in1(\"tablet\") + ':' + isTablet(\"tablet\") + ':' + isIsolateForSpecialType(\"tablet\", 0)");
      const actual: string = is2in1("tablet") + ':' + isTablet("tablet") + ':' + isIsolateForSpecialType("tablet", 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}DeviceGuards_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0009
     * @tc.name      Resolution_DeviceGuards_0009
     * @tc.desc      device guards for "tablet"/1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0009 begin`);
      logInfo("is2in1(\"tablet\") + ':' + isTablet(\"tablet\") + ':' + isIsolateForSpecialType(\"tablet\", 1)");
      const actual: string = is2in1("tablet") + ':' + isTablet("tablet") + ':' + isIsolateForSpecialType("tablet", 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}DeviceGuards_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0010
     * @tc.name      Resolution_DeviceGuards_0010
     * @tc.desc      device guards for "tablet"/50000012 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0010 begin`);
      logInfo("is2in1(\"tablet\") + ':' + isTablet(\"tablet\") + ':' + isIsolateForSpecialType(\"tablet\", 50000012)");
      const actual: string = is2in1("tablet") + ':' + isTablet("tablet") + ':' + isIsolateForSpecialType("tablet", 50000012);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0011
     * @tc.name      Resolution_DeviceGuards_0011
     * @tc.desc      device guards for "tablet"/50000013 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0011 begin`);
      logInfo("is2in1(\"tablet\") + ':' + isTablet(\"tablet\") + ':' + isIsolateForSpecialType(\"tablet\", 50000013)");
      const actual: string = is2in1("tablet") + ':' + isTablet("tablet") + ':' + isIsolateForSpecialType("tablet", 50000013);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}DeviceGuards_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0012
     * @tc.name      Resolution_DeviceGuards_0012
     * @tc.desc      device guards for "tablet"/50000014 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DeviceGuards_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceGuards_0012 begin`);
      logInfo("is2in1(\"tablet\") + ':' + isTablet(\"tablet\") + ':' + isIsolateForSpecialType(\"tablet\", 50000014)");
      const actual: string = is2in1("tablet") + ':' + isTablet("tablet") + ':' + isIsolateForSpecialType("tablet", 50000014);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}DeviceGuards_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0013
     * @tc.name      Resolution_DeviceGuards_0013
     * @tc.desc      device guards for "tablet"/60000000 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0013 begin`);
      logInfo("is2in1(\"tablet\") + ':' + isTablet(\"tablet\") + ':' + isIsolateForSpecialType(\"tablet\", 60000000)");
      const actual: string = is2in1("tablet") + ':' + isTablet("tablet") + ':' + isIsolateForSpecialType("tablet", 60000000);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0014
     * @tc.name      Resolution_DeviceGuards_0014
     * @tc.desc      device guards for "tablet"/-1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0014 begin`);
      logInfo("is2in1(\"tablet\") + ':' + isTablet(\"tablet\") + ':' + isIsolateForSpecialType(\"tablet\", -1)");
      const actual: string = is2in1("tablet") + ':' + isTablet("tablet") + ':' + isIsolateForSpecialType("tablet", -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}DeviceGuards_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0015
     * @tc.name      Resolution_DeviceGuards_0015
     * @tc.desc      device guards for "2in1"/0 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0015 begin`);
      logInfo("is2in1(\"2in1\") + ':' + isTablet(\"2in1\") + ':' + isIsolateForSpecialType(\"2in1\", 0)");
      const actual: string = is2in1("2in1") + ':' + isTablet("2in1") + ':' + isIsolateForSpecialType("2in1", 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:false");
      expect(actual).assertEqual("true:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0016
     * @tc.name      Resolution_DeviceGuards_0016
     * @tc.desc      device guards for "2in1"/1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0016 begin`);
      logInfo("is2in1(\"2in1\") + ':' + isTablet(\"2in1\") + ':' + isIsolateForSpecialType(\"2in1\", 1)");
      const actual: string = is2in1("2in1") + ':' + isTablet("2in1") + ':' + isIsolateForSpecialType("2in1", 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:false");
      expect(actual).assertEqual("true:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0017
     * @tc.name      Resolution_DeviceGuards_0017
     * @tc.desc      device guards for "2in1"/50000012 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0017 begin`);
      logInfo("is2in1(\"2in1\") + ':' + isTablet(\"2in1\") + ':' + isIsolateForSpecialType(\"2in1\", 50000012)");
      const actual: string = is2in1("2in1") + ':' + isTablet("2in1") + ':' + isIsolateForSpecialType("2in1", 50000012);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:false");
      expect(actual).assertEqual("true:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0018
     * @tc.name      Resolution_DeviceGuards_0018
     * @tc.desc      device guards for "2in1"/50000013 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DeviceGuards_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeviceGuards_0018 begin`);
      logInfo("is2in1(\"2in1\") + ':' + isTablet(\"2in1\") + ':' + isIsolateForSpecialType(\"2in1\", 50000013)");
      const actual: string = is2in1("2in1") + ':' + isTablet("2in1") + ':' + isIsolateForSpecialType("2in1", 50000013);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:false");
      expect(actual).assertEqual("true:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0019
     * @tc.name      Resolution_DeviceGuards_0019
     * @tc.desc      device guards for "2in1"/50000014 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0019 begin`);
      logInfo("is2in1(\"2in1\") + ':' + isTablet(\"2in1\") + ':' + isIsolateForSpecialType(\"2in1\", 50000014)");
      const actual: string = is2in1("2in1") + ':' + isTablet("2in1") + ':' + isIsolateForSpecialType("2in1", 50000014);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:false");
      expect(actual).assertEqual("true:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0020
     * @tc.name      Resolution_DeviceGuards_0020
     * @tc.desc      device guards for "2in1"/60000000 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0020 begin`);
      logInfo("is2in1(\"2in1\") + ':' + isTablet(\"2in1\") + ':' + isIsolateForSpecialType(\"2in1\", 60000000)");
      const actual: string = is2in1("2in1") + ':' + isTablet("2in1") + ':' + isIsolateForSpecialType("2in1", 60000000);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:false");
      expect(actual).assertEqual("true:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0021
     * @tc.name      Resolution_DeviceGuards_0021
     * @tc.desc      device guards for "2in1"/-1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0021 begin`);
      logInfo("is2in1(\"2in1\") + ':' + isTablet(\"2in1\") + ':' + isIsolateForSpecialType(\"2in1\", -1)");
      const actual: string = is2in1("2in1") + ':' + isTablet("2in1") + ':' + isIsolateForSpecialType("2in1", -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:false");
      expect(actual).assertEqual("true:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0022
     * @tc.name      Resolution_DeviceGuards_0022
     * @tc.desc      device guards for "default"/0 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0022 begin`);
      logInfo("is2in1(\"default\") + ':' + isTablet(\"default\") + ':' + isIsolateForSpecialType(\"default\", 0)");
      const actual: string = is2in1("default") + ':' + isTablet("default") + ':' + isIsolateForSpecialType("default", 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0023
     * @tc.name      Resolution_DeviceGuards_0023
     * @tc.desc      device guards for "default"/1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DeviceGuards_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceGuards_0023 begin`);
      logInfo("is2in1(\"default\") + ':' + isTablet(\"default\") + ':' + isIsolateForSpecialType(\"default\", 1)");
      const actual: string = is2in1("default") + ':' + isTablet("default") + ':' + isIsolateForSpecialType("default", 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0024
     * @tc.name      Resolution_DeviceGuards_0024
     * @tc.desc      device guards for "default"/50000012 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0024 begin`);
      logInfo("is2in1(\"default\") + ':' + isTablet(\"default\") + ':' + isIsolateForSpecialType(\"default\", 50000012)");
      const actual: string = is2in1("default") + ':' + isTablet("default") + ':' + isIsolateForSpecialType("default", 50000012);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0025
     * @tc.name      Resolution_DeviceGuards_0025
     * @tc.desc      device guards for "default"/50000013 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0025 begin`);
      logInfo("is2in1(\"default\") + ':' + isTablet(\"default\") + ':' + isIsolateForSpecialType(\"default\", 50000013)");
      const actual: string = is2in1("default") + ':' + isTablet("default") + ':' + isIsolateForSpecialType("default", 50000013);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0026
     * @tc.name      Resolution_DeviceGuards_0026
     * @tc.desc      device guards for "default"/50000014 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0026 begin`);
      logInfo("is2in1(\"default\") + ':' + isTablet(\"default\") + ':' + isIsolateForSpecialType(\"default\", 50000014)");
      const actual: string = is2in1("default") + ':' + isTablet("default") + ':' + isIsolateForSpecialType("default", 50000014);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0027
     * @tc.name      Resolution_DeviceGuards_0027
     * @tc.desc      device guards for "default"/60000000 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0027 begin`);
      logInfo("is2in1(\"default\") + ':' + isTablet(\"default\") + ':' + isIsolateForSpecialType(\"default\", 60000000)");
      const actual: string = is2in1("default") + ':' + isTablet("default") + ':' + isIsolateForSpecialType("default", 60000000);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0028
     * @tc.name      Resolution_DeviceGuards_0028
     * @tc.desc      device guards for "default"/-1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0028 begin`);
      logInfo("is2in1(\"default\") + ':' + isTablet(\"default\") + ':' + isIsolateForSpecialType(\"default\", -1)");
      const actual: string = is2in1("default") + ':' + isTablet("default") + ':' + isIsolateForSpecialType("default", -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0029
     * @tc.name      Resolution_DeviceGuards_0029
     * @tc.desc      device guards for "tv"/0 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0029 begin`);
      logInfo("is2in1(\"tv\") + ':' + isTablet(\"tv\") + ':' + isIsolateForSpecialType(\"tv\", 0)");
      const actual: string = is2in1("tv") + ':' + isTablet("tv") + ':' + isIsolateForSpecialType("tv", 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0030
     * @tc.name      Resolution_DeviceGuards_0030
     * @tc.desc      device guards for "tv"/1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0030 begin`);
      logInfo("is2in1(\"tv\") + ':' + isTablet(\"tv\") + ':' + isIsolateForSpecialType(\"tv\", 1)");
      const actual: string = is2in1("tv") + ':' + isTablet("tv") + ':' + isIsolateForSpecialType("tv", 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0031
     * @tc.name      Resolution_DeviceGuards_0031
     * @tc.desc      device guards for "tv"/50000012 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0031 begin`);
      logInfo("is2in1(\"tv\") + ':' + isTablet(\"tv\") + ':' + isIsolateForSpecialType(\"tv\", 50000012)");
      const actual: string = is2in1("tv") + ':' + isTablet("tv") + ':' + isIsolateForSpecialType("tv", 50000012);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0032
     * @tc.name      Resolution_DeviceGuards_0032
     * @tc.desc      device guards for "tv"/50000013 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0032 begin`);
      logInfo("is2in1(\"tv\") + ':' + isTablet(\"tv\") + ':' + isIsolateForSpecialType(\"tv\", 50000013)");
      const actual: string = is2in1("tv") + ':' + isTablet("tv") + ':' + isIsolateForSpecialType("tv", 50000013);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0033
     * @tc.name      Resolution_DeviceGuards_0033
     * @tc.desc      device guards for "tv"/50000014 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0033 begin`);
      logInfo("is2in1(\"tv\") + ':' + isTablet(\"tv\") + ':' + isIsolateForSpecialType(\"tv\", 50000014)");
      const actual: string = is2in1("tv") + ':' + isTablet("tv") + ':' + isIsolateForSpecialType("tv", 50000014);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0034
     * @tc.name      Resolution_DeviceGuards_0034
     * @tc.desc      device guards for "tv"/60000000 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DeviceGuards_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceGuards_0034 begin`);
      logInfo("is2in1(\"tv\") + ':' + isTablet(\"tv\") + ':' + isIsolateForSpecialType(\"tv\", 60000000)");
      const actual: string = is2in1("tv") + ':' + isTablet("tv") + ':' + isIsolateForSpecialType("tv", 60000000);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0035
     * @tc.name      Resolution_DeviceGuards_0035
     * @tc.desc      device guards for "tv"/-1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DeviceGuards_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeviceGuards_0035 begin`);
      logInfo("is2in1(\"tv\") + ':' + isTablet(\"tv\") + ':' + isIsolateForSpecialType(\"tv\", -1)");
      const actual: string = is2in1("tv") + ':' + isTablet("tv") + ':' + isIsolateForSpecialType("tv", -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0036
     * @tc.name      Resolution_DeviceGuards_0036
     * @tc.desc      device guards for "car"/0 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0036 begin`);
      logInfo("is2in1(\"car\") + ':' + isTablet(\"car\") + ':' + isIsolateForSpecialType(\"car\", 0)");
      const actual: string = is2in1("car") + ':' + isTablet("car") + ':' + isIsolateForSpecialType("car", 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0037
     * @tc.name      Resolution_DeviceGuards_0037
     * @tc.desc      device guards for "car"/1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0037 begin`);
      logInfo("is2in1(\"car\") + ':' + isTablet(\"car\") + ':' + isIsolateForSpecialType(\"car\", 1)");
      const actual: string = is2in1("car") + ':' + isTablet("car") + ':' + isIsolateForSpecialType("car", 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0038
     * @tc.name      Resolution_DeviceGuards_0038
     * @tc.desc      device guards for "car"/50000012 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0038 begin`);
      logInfo("is2in1(\"car\") + ':' + isTablet(\"car\") + ':' + isIsolateForSpecialType(\"car\", 50000012)");
      const actual: string = is2in1("car") + ':' + isTablet("car") + ':' + isIsolateForSpecialType("car", 50000012);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0039
     * @tc.name      Resolution_DeviceGuards_0039
     * @tc.desc      device guards for "car"/50000013 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0039 begin`);
      logInfo("is2in1(\"car\") + ':' + isTablet(\"car\") + ':' + isIsolateForSpecialType(\"car\", 50000013)");
      const actual: string = is2in1("car") + ':' + isTablet("car") + ':' + isIsolateForSpecialType("car", 50000013);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0040
     * @tc.name      Resolution_DeviceGuards_0040
     * @tc.desc      device guards for "car"/50000014 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0040 begin`);
      logInfo("is2in1(\"car\") + ':' + isTablet(\"car\") + ':' + isIsolateForSpecialType(\"car\", 50000014)");
      const actual: string = is2in1("car") + ':' + isTablet("car") + ':' + isIsolateForSpecialType("car", 50000014);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0041
     * @tc.name      Resolution_DeviceGuards_0041
     * @tc.desc      device guards for "car"/60000000 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0041 begin`);
      logInfo("is2in1(\"car\") + ':' + isTablet(\"car\") + ':' + isIsolateForSpecialType(\"car\", 60000000)");
      const actual: string = is2in1("car") + ':' + isTablet("car") + ':' + isIsolateForSpecialType("car", 60000000);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0042
     * @tc.name      Resolution_DeviceGuards_0042
     * @tc.desc      device guards for "car"/-1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0042 begin`);
      logInfo("is2in1(\"car\") + ':' + isTablet(\"car\") + ':' + isIsolateForSpecialType(\"car\", -1)");
      const actual: string = is2in1("car") + ':' + isTablet("car") + ':' + isIsolateForSpecialType("car", -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0043
     * @tc.name      Resolution_DeviceGuards_0043
     * @tc.desc      device guards for ""/0 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0043 begin`);
      logInfo("is2in1(\"\") + ':' + isTablet(\"\") + ':' + isIsolateForSpecialType(\"\", 0)");
      const actual: string = is2in1("") + ':' + isTablet("") + ':' + isIsolateForSpecialType("", 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0044
     * @tc.name      Resolution_DeviceGuards_0044
     * @tc.desc      device guards for ""/1 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0044 begin`);
      logInfo("is2in1(\"\") + ':' + isTablet(\"\") + ':' + isIsolateForSpecialType(\"\", 1)");
      const actual: string = is2in1("") + ':' + isTablet("") + ':' + isIsolateForSpecialType("", 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0045
     * @tc.name      Resolution_DeviceGuards_0045
     * @tc.desc      device guards for ""/50000012 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DeviceGuards_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceGuards_0045 begin`);
      logInfo("is2in1(\"\") + ':' + isTablet(\"\") + ':' + isIsolateForSpecialType(\"\", 50000012)");
      const actual: string = is2in1("") + ':' + isTablet("") + ':' + isIsolateForSpecialType("", 50000012);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo(`${BUNDLE}DeviceGuards_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_GUARDS_0046
     * @tc.name      Resolution_DeviceGuards_0046
     * @tc.desc      device guards for ""/50000013 -> 2in1/tablet/isolate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceGuards_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceGuards_0046 begin`);
      logInfo("is2in1(\"\") + ':' + isTablet(\"\") + ':' + isIsolateForSpecialType(\"\", 50000013)");
      const actual: string = is2in1("") + ':' + isTablet("") + ':' + isIsolateForSpecialType("", 50000013);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false");
      expect(actual).assertEqual("false:false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DeviceGuards_0046 end`);
    });
  });
}
