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

/** Logic checks for NotificationPageState.dialogText (1 cases). */
export default function notificationPageStateDialogTextTest(): void {
  describe('NotificationPageStateDialogTextTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_DIALOG_TEXT_0001
     * @tc.name      NdkNotification_NotificationPageStateDialogText_0001
     * @tc.desc      NotificationPageState.dialogText() yields "Current application notification enabled: false"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NotificationPageStateDialogText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotificationPageStateDialogText_0001 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const actual: string = subject.dialogText();
      logInfo(`dialogText(): actual=${actual}`);
      expect(actual).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateDialogText_0001 end`);
    });
  });
}
