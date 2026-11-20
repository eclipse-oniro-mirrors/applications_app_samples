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

/** Logic checks for NotificationPageState.check (2 cases). */
export default function notificationPageStateCheckTest(): void {
  describe('NotificationPageStateCheckTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_CHECK_0001
     * @tc.name      NdkNotification_NotificationPageStateCheck_0001
     * @tc.desc      NotificationPageState.check(nativeEnabled=true) yields "Current application notification enabled...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NotificationPageStateCheck_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotificationPageStateCheck_0001 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const actual: string = subject.check(true);
      logInfo(`check(nativeEnabled=true): actual=${actual}`);
      expect(actual).assertEqual('Current application notification enabled: true');
      logInfo(`check(nativeEnabled=true) state: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check(nativeEnabled=true) state: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check(nativeEnabled=true) state: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateCheck_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_CHECK_0002
     * @tc.name      NdkNotification_NotificationPageStateCheck_0002
     * @tc.desc      NotificationPageState.check(nativeEnabled=false) yields "Current application notification enable...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NotificationPageStateCheck_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotificationPageStateCheck_0002 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const actual: string = subject.check(false);
      logInfo(`check(nativeEnabled=false): actual=${actual}`);
      expect(actual).assertEqual('Current application notification enabled: false');
      logInfo(`check(nativeEnabled=false) state: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check(nativeEnabled=false) state: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateCheck_0002 end`);
    });
  });
}
