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
import { logInfo, BUNDLE } from '../common/VPNTestSupport';
import {
  addressCount,
  blockedAppCount,
  trustedAppCount,
} from '../model/VPNLogic';

/** ConfigCountsTest logic checks (12 cases). */
export default function configCountsTest(): void {
  describe('ConfigCountsTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0001
     * @tc.name      VPN_ConfigCounts_0001
     * @tc.desc      config counts for "10.0.0.5".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigCounts_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigCounts_0001 begin`);
      logInfo("addressCount(\"10.0.0.5\", 0) + ':' + blockedAppCount(\"com.example\") + ':' + trustedAppCount(true)");
      const actual: string = addressCount("10.0.0.5", 0) + ':' + blockedAppCount("com.example") + ':' + trustedAppCount(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1");
      expect(actual).assertEqual("1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigCounts_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0002
     * @tc.name      VPN_ConfigCounts_0002
     * @tc.desc      config counts for "1.2.3.4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0002 begin`);
      logInfo("addressCount(\"1.2.3.4\", 24) + ':' + blockedAppCount(\"\") + ':' + trustedAppCount(false)");
      const actual: string = addressCount("1.2.3.4", 24) + ':' + blockedAppCount("") + ':' + trustedAppCount(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0");
      expect(actual).assertEqual("1:0:0");
      logInfo(`${BUNDLE}ConfigCounts_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0003
     * @tc.name      VPN_ConfigCounts_0003
     * @tc.desc      config counts for "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0003 begin`);
      logInfo("addressCount(\"\", 32) + ':' + blockedAppCount(\"a\") + ':' + trustedAppCount(true)");
      const actual: string = addressCount("", 32) + ':' + blockedAppCount("a") + ':' + trustedAppCount(true);
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:1");
      expect(actual).assertEqual("0:1:1");
      logInfo(`${BUNDLE}ConfigCounts_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0004
     * @tc.name      VPN_ConfigCounts_0004
     * @tc.desc      config counts for "256.1.1.1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0004 begin`);
      logInfo("addressCount(\"256.1.1.1\", 33) + ':' + blockedAppCount(\"com.example\") + ':' + trustedAppCount(false)");
      const actual: string = addressCount("256.1.1.1", 33) + ':' + blockedAppCount("com.example") + ':' + trustedAppCount(false);
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:0");
      expect(actual).assertEqual("0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigCounts_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0005
     * @tc.name      VPN_ConfigCounts_0005
     * @tc.desc      config counts for "10.0.0.5".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0005 begin`);
      logInfo("addressCount(\"10.0.0.5\", 0) + ':' + blockedAppCount(\"\") + ':' + trustedAppCount(true)");
      const actual: string = addressCount("10.0.0.5", 0) + ':' + blockedAppCount("") + ':' + trustedAppCount(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:1");
      expect(actual).assertEqual("1:0:1");
      logInfo(`${BUNDLE}ConfigCounts_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0006
     * @tc.name      VPN_ConfigCounts_0006
     * @tc.desc      config counts for "1.2.3.4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0006 begin`);
      logInfo("addressCount(\"1.2.3.4\", 24) + ':' + blockedAppCount(\"a\") + ':' + trustedAppCount(false)");
      const actual: string = addressCount("1.2.3.4", 24) + ':' + blockedAppCount("a") + ':' + trustedAppCount(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo(`${BUNDLE}ConfigCounts_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0007
     * @tc.name      VPN_ConfigCounts_0007
     * @tc.desc      config counts for "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0007 begin`);
      logInfo("addressCount(\"\", 32) + ':' + blockedAppCount(\"com.example\") + ':' + trustedAppCount(true)");
      const actual: string = addressCount("", 32) + ':' + blockedAppCount("com.example") + ':' + trustedAppCount(true);
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:1");
      expect(actual).assertEqual("0:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigCounts_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0008
     * @tc.name      VPN_ConfigCounts_0008
     * @tc.desc      config counts for "256.1.1.1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0008 begin`);
      logInfo("addressCount(\"256.1.1.1\", 33) + ':' + blockedAppCount(\"\") + ':' + trustedAppCount(false)");
      const actual: string = addressCount("256.1.1.1", 33) + ':' + blockedAppCount("") + ':' + trustedAppCount(false);
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0");
      expect(actual).assertEqual("0:0:0");
      logInfo(`${BUNDLE}ConfigCounts_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0009
     * @tc.name      VPN_ConfigCounts_0009
     * @tc.desc      config counts for "10.0.0.5".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0009 begin`);
      logInfo("addressCount(\"10.0.0.5\", 0) + ':' + blockedAppCount(\"a\") + ':' + trustedAppCount(true)");
      const actual: string = addressCount("10.0.0.5", 0) + ':' + blockedAppCount("a") + ':' + trustedAppCount(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1");
      expect(actual).assertEqual("1:1:1");
      logInfo(`${BUNDLE}ConfigCounts_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0010
     * @tc.name      VPN_ConfigCounts_0010
     * @tc.desc      config counts for "1.2.3.4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0010 begin`);
      logInfo("addressCount(\"1.2.3.4\", 24) + ':' + blockedAppCount(\"com.example\") + ':' + trustedAppCount(false)");
      const actual: string = addressCount("1.2.3.4", 24) + ':' + blockedAppCount("com.example") + ':' + trustedAppCount(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigCounts_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0011
     * @tc.name      VPN_ConfigCounts_0011
     * @tc.desc      config counts for "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigCounts_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigCounts_0011 begin`);
      logInfo("addressCount(\"\", 32) + ':' + blockedAppCount(\"\") + ':' + trustedAppCount(true)");
      const actual: string = addressCount("", 32) + ':' + blockedAppCount("") + ':' + trustedAppCount(true);
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:1");
      expect(actual).assertEqual("0:0:1");
      logInfo(`${BUNDLE}ConfigCounts_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_COUNTS_0012
     * @tc.name      VPN_ConfigCounts_0012
     * @tc.desc      config counts for "256.1.1.1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigCounts_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigCounts_0012 begin`);
      logInfo("addressCount(\"256.1.1.1\", 33) + ':' + blockedAppCount(\"a\") + ':' + trustedAppCount(false)");
      const actual: string = addressCount("256.1.1.1", 33) + ':' + blockedAppCount("a") + ':' + trustedAppCount(false);
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:0");
      expect(actual).assertEqual("0:1:0");
      logInfo(`${BUNDLE}ConfigCounts_0012 end`);
    });
  });
}
