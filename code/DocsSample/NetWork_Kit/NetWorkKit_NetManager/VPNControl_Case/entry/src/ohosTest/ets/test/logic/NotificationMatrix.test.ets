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
  NotificationModel,
} from '../model/VPNLogic';

/** NotificationMatrixTest logic checks (35 cases). */
export default function notificationMatrixTest(): void {
  describe('NotificationMatrixTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0001
     * @tc.name      VPN_NotifMatrix_0001
     * @tc.desc      notification matrix 0,0,0 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifMatrix_0001 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.addWithoutPublish(0);
      subject.setBadge(0);
      logInfo("notification matrix 0,0,0");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1|0|0|1,0,0,0,0,0");
