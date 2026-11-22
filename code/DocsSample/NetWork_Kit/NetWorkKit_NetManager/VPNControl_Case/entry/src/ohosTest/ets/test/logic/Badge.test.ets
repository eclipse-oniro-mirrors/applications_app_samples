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
  badgeAfterAdd,
  badgeAfterSet,
} from '../model/VPNLogic';

/** BadgeTest logic checks (44 cases). */
export default function badgeTest(): void {
  describe('BadgeTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0001
     * @tc.name      VPN_Badge_0001
     * @tc.desc      badge updates for -5/-10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Badge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Badge_0001 begin`);
      logInfo("badgeAfterAdd(-5) + ':' + badgeAfterSet(-10)");
      const actual: string = badgeAfterAdd(-5) + ':' + badgeAfterSet(-10);
      logInfo('actual=' + String(actual) + ', expected=' + "-4:-10");
      expect(actual).assertEqual("-4:-10");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0002
     * @tc.name      VPN_Badge_0002
     * @tc.desc      badge updates for -4/-7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0002 begin`);
      logInfo("badgeAfterAdd(-4) + ':' + badgeAfterSet(-7)");
      const actual: string = badgeAfterAdd(-4) + ':' + badgeAfterSet(-7);
      logInfo('actual=' + String(actual) + ', expected=' + "-3:-7");
      expect(actual).assertEqual("-3:-7");
      logInfo(`${BUNDLE}Badge_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0003
     * @tc.name      VPN_Badge_0003
     * @tc.desc      badge updates for -3/-4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0003 begin`);
      logInfo("badgeAfterAdd(-3) + ':' + badgeAfterSet(-4)");
      const actual: string = badgeAfterAdd(-3) + ':' + badgeAfterSet(-4);
      logInfo('actual=' + String(actual) + ', expected=' + "-2:-4");
      expect(actual).assertEqual("-2:-4");
      logInfo(`${BUNDLE}Badge_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0004
     * @tc.name      VPN_Badge_0004
     * @tc.desc      badge updates for -2/-1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0004 begin`);
      logInfo("badgeAfterAdd(-2) + ':' + badgeAfterSet(-1)");
      const actual: string = badgeAfterAdd(-2) + ':' + badgeAfterSet(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1:-1");
      expect(actual).assertEqual("-1:-1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0005
     * @tc.name      VPN_Badge_0005
     * @tc.desc      badge updates for -1/2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0005 begin`);
      logInfo("badgeAfterAdd(-1) + ':' + badgeAfterSet(2)");
      const actual: string = badgeAfterAdd(-1) + ':' + badgeAfterSet(2);
      logInfo('actual=' + String(actual) + ', expected=' + "0:2");
      expect(actual).assertEqual("0:2");
      logInfo(`${BUNDLE}Badge_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0006
     * @tc.name      VPN_Badge_0006
     * @tc.desc      badge updates for 0/5.
     * @tc.type      FUNCTION
