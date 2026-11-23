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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NotificationPageState } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for NotificationPageState.tapOutside (1 cases). */
export default function notificationPageStateTapOutsideTest(): void {
  describe('NotificationPageStateTapOutsideTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_TAP_OUTSIDE_0001
     * @tc.name      NdkNotification_NotificationPageStateTapOutside_0001
     * @tc.desc      NotificationPageState.tapOutside() yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NotificationPageStateTapOutside_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotificationPageStateTapOutside_0001 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const actual: boolean = subject.tapOutside();
      logInfo(`tapOutside(): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateTapOutside_0001 end`);
    });
  });
}
