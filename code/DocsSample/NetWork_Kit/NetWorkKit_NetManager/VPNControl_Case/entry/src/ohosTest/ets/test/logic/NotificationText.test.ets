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
  notificationGroup,
  notificationTitle,
  notificationText,
  notificationAdditional,
} from '../model/VPNLogic';

/** NotificationTextTest logic checks (6 cases). */
export default function notificationTextTest(): void {
  describe('NotificationTextTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_TEXT_0001
     * @tc.name      VPN_NotifText_0001
     * @tc.desc      notification text/group for clickable true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifText_0001 begin`);
      logInfo("notificationGroup(\"\") + ':' + notificationTitle(true) + ':' + notificationText(true) + ':' + notificationAdditional()");
      const actual: string = notificationGroup("") + ':' + notificationTitle(true) + ':' + notificationText(true) + ':' + notificationAdditional();
      logInfo('actual=' + String(actual) + ', expected=' + ":VPN connected:Return to the VPN control page:Tap to open VPN control");
      expect(actual).assertEqual(":VPN connected:Return to the VPN control page:Tap to open VPN control");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifText_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_TEXT_0002
     * @tc.name      VPN_NotifText_0002
     * @tc.desc      notification text/group for clickable false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifText_0002 begin`);
      logInfo("notificationGroup(\"g1\") + ':' + notificationTitle(false) + ':' + notificationText(false) + ':' + notificationAdditional()");
      const actual: string = notificationGroup("g1") + ':' + notificationTitle(false) + ':' + notificationText(false) + ':' + notificationAdditional();
      logInfo('actual=' + String(actual) + ', expected=' + "g1:VPN:VPN is connected:Tap to open VPN control");
      expect(actual).assertEqual("g1:VPN:VPN is connected:Tap to open VPN control");
      logInfo(`${BUNDLE}NotifText_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_TEXT_0003
     * @tc.name      VPN_NotifText_0003
     * @tc.desc      notification text/group for clickable true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifText_0003 begin`);
      logInfo("notificationGroup(\"vpn\") + ':' + notificationTitle(true) + ':' + notificationText(true) + ':' + notificationAdditional()");
      const actual: string = notificationGroup("vpn") + ':' + notificationTitle(true) + ':' + notificationText(true) + ':' + notificationAdditional();
      logInfo('actual=' + String(actual) + ', expected=' + "vpn:VPN connected:Return to the VPN control page:Tap to open VPN control");
      expect(actual).assertEqual("vpn:VPN connected:Return to the VPN control page:Tap to open VPN control");
      logInfo(`${BUNDLE}NotifText_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_TEXT_0004
     * @tc.name      VPN_NotifText_0004
     * @tc.desc      notification text/group for clickable false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifText_0004 begin`);
      logInfo("notificationGroup(\"\") + ':' + notificationTitle(false) + ':' + notificationText(false) + ':' + notificationAdditional()");
      const actual: string = notificationGroup("") + ':' + notificationTitle(false) + ':' + notificationText(false) + ':' + notificationAdditional();
      logInfo('actual=' + String(actual) + ', expected=' + ":VPN:VPN is connected:Tap to open VPN control");
      expect(actual).assertEqual(":VPN:VPN is connected:Tap to open VPN control");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifText_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_TEXT_0005
     * @tc.name      VPN_NotifText_0005
     * @tc.desc      notification text/group for clickable true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifText_0005 begin`);
      logInfo("notificationGroup(\"g1\") + ':' + notificationTitle(true) + ':' + notificationText(true) + ':' + notificationAdditional()");
      const actual: string = notificationGroup("g1") + ':' + notificationTitle(true) + ':' + notificationText(true) + ':' + notificationAdditional();
      logInfo('actual=' + String(actual) + ', expected=' + "g1:VPN connected:Return to the VPN control page:Tap to open VPN control");
      expect(actual).assertEqual("g1:VPN connected:Return to the VPN control page:Tap to open VPN control");
      logInfo(`${BUNDLE}NotifText_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_TEXT_0006
     * @tc.name      VPN_NotifText_0006
     * @tc.desc      notification text/group for clickable false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifText_0006 begin`);
      logInfo("notificationGroup(\"vpn\") + ':' + notificationTitle(false) + ':' + notificationText(false) + ':' + notificationAdditional()");
      const actual: string = notificationGroup("vpn") + ':' + notificationTitle(false) + ':' + notificationText(false) + ':' + notificationAdditional();
      logInfo('actual=' + String(actual) + ', expected=' + "vpn:VPN:VPN is connected:Tap to open VPN control");
      expect(actual).assertEqual("vpn:VPN:VPN is connected:Tap to open VPN control");
      logInfo(`${BUNDLE}NotifText_0006 end`);
    });
  });
}
