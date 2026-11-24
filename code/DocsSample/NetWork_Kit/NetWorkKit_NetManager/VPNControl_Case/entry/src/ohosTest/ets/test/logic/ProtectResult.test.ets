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
  protectToast,
  protectFlag,
  destroyToast,
  destroyFlag,
} from '../model/VPNLogic';

/** ProtectResultTest logic checks (2 cases). */
export default function protectResultTest(): void {
  describe('ProtectResultTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_PROTECT_RESULT_0001
     * @tc.name      VPN_ProtectResult_0001
     * @tc.desc      protect/destroy result for success true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ProtectResult_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProtectResult_0001 begin`);
      logInfo("protectToast(true) + ':' + protectFlag(true) + ':' + destroyToast(true) + ':' + destroyFlag(true)");
      const actual: string = protectToast(true) + ':' + protectFlag(true) + ':' + destroyToast(true) + ':' + destroyFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn Protect Success:Pass:vpn Destroy Success:Pass");
      expect(actual).assertEqual("vpn Protect Success:Pass:vpn Destroy Success:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProtectResult_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PROTECT_RESULT_0002
     * @tc.name      VPN_ProtectResult_0002
     * @tc.desc      protect/destroy result for success false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ProtectResult_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProtectResult_0002 begin`);
      logInfo("protectToast(false) + ':' + protectFlag(false) + ':' + destroyToast(false) + ':' + destroyFlag(false)");
      const actual: string = protectToast(false) + ':' + protectFlag(false) + ':' + destroyToast(false) + ':' + destroyFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn Protect Failed:Error:vpn Destroy Failed:Error");
      expect(actual).assertEqual("vpn Protect Failed:Error:vpn Destroy Failed:Error");
      logInfo(`${BUNDLE}ProtectResult_0002 end`);
    });
  });
}
