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

/** Logic checks for new NotificationPageState (1 cases). */
export default function notificationPageStateCtorTest(): void {
  describe('NotificationPageStateCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_CTOR_0001
     * @tc.name      NdkNotification_NotificationPageStateCtor_0001
     * @tc.desc      new NotificationPageState() initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NotificationPageStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotificationPageStateCtor_0001 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      logInfo(`new NotificationPageState(): subject.result=${subject.result}`);
      expect(subject.result).assertFalse();
      logInfo(`new NotificationPageState(): subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertFalse();
      logInfo(`new NotificationPageState(): subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(0);
      logInfo(`new NotificationPageState(): subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(0);
      logInfo(`new NotificationPageState(): subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertTrue();
      logInfo(`${BUNDLE}NotificationPageStateCtor_0001 end`);
    });
  });
}
