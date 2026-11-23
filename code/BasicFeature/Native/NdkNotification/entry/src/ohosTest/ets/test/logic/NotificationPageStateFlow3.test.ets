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

/** Logic checks for NotificationPageState flow (51 cases). */
export default function notificationPageStateFlow3Test(): void {
  describe('NotificationPageStateFlow3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0110
     * @tc.name      NdkNotification_NotificationPageStateFlow_0110
     * @tc.desc      NotificationPageState call flow tapOutside > check > check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0110 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tapOutside>check>check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`tapOutside>check>check>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0111
     * @tc.name      NdkNotification_NotificationPageStateFlow_0111
     * @tc.desc      NotificationPageState call flow confirm > detachController > confirm > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0111 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`confirm>detachController>confirm>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>detachController>confirm>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>detachController>confirm>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>detachController>confirm>check final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0112
     * @tc.name      NdkNotification_NotificationPageStateFlow_0112
     * @tc.desc      NotificationPageState call flow dialogText > confirm > confirm > detachController > tapOutside k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0112 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detachController();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`dialogText>confirm>confirm>detachControll...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0113
     * @tc.name      NdkNotification_NotificationPageStateFlow_0113
     * @tc.desc      NotificationPageState call flow check > tapOutside > dialogText > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0113 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`check>tapOutside>dialogText>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>tapOutside>dialogText>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>tapOutside>dialogText>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0114
     * @tc.name      NdkNotification_NotificationPageStateFlow_0114
     * @tc.desc      NotificationPageState call flow check > tapOutside > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0114 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`check>tapOutside>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0115
     * @tc.name      NdkNotification_NotificationPageStateFlow_0115
     * @tc.desc      NotificationPageState call flow check > check > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0115 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`check>check>detachController final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>detachController final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`check>check>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0116
     * @tc.name      NdkNotification_NotificationPageStateFlow_0116
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0116 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>dialogText>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>dialogText>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>dialogText>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0117
     * @tc.name      NdkNotification_NotificationPageStateFlow_0117
     * @tc.desc      NotificationPageState call flow tapOutside > dialogText > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0117 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      logInfo(`tapOutside>dialogText>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>dialogText>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>dialogText>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0118
     * @tc.name      NdkNotification_NotificationPageStateFlow_0118
     * @tc.desc      NotificationPageState call flow check > dialogText > dialogText > dialogText > tapOutside keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0118 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`check>dialogText>dialogText>dialogText>ta...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>dialogText>dialogText>ta...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0119
     * @tc.name      NdkNotification_NotificationPageStateFlow_0119
     * @tc.desc      NotificationPageState call flow check > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0119 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      logInfo(`check>dialogText final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0120
     * @tc.name      NdkNotification_NotificationPageStateFlow_0120
     * @tc.desc      NotificationPageState call flow check > confirm > dialogText > check > tapOutside keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0120 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`check>confirm>dialogText>check>tapOutside...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>confirm>dialogText>check>tapOutside...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`check>confirm>dialogText>check>tapOutside...: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0121
     * @tc.name      NdkNotification_NotificationPageStateFlow_0121
     * @tc.desc      NotificationPageState call flow check > check > dialogText > dialogText > tapOutside keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0121 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`check>check>dialogText>dialogText>tapOuts...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>check>dialogText>dialogText>tapOuts...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>dialogText>dialogText>tapOuts...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0122
     * @tc.name      NdkNotification_NotificationPageStateFlow_0122
     * @tc.desc      NotificationPageState call flow detachController > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0122 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0123
     * @tc.name      NdkNotification_NotificationPageStateFlow_0123
     * @tc.desc      NotificationPageState call flow tapOutside > tapOutside > tapOutside > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0123 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`tapOutside>tapOutside>tapOutside>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>tapOutside>tapOutside>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>tapOutside>tapOutside>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0124
     * @tc.name      NdkNotification_NotificationPageStateFlow_0124
     * @tc.desc      NotificationPageState call flow detachController > confirm > check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0124 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`detachController>confirm>check>confirm final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>confirm>check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>confirm>check>confirm final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0125
     * @tc.name      NdkNotification_NotificationPageStateFlow_0125
     * @tc.desc      NotificationPageState call flow check > tapOutside > tapOutside > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0125 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`check>tapOutside>tapOutside>dialogText final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>tapOutside>tapOutside>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside>tapOutside>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0126
     * @tc.name      NdkNotification_NotificationPageStateFlow_0126
     * @tc.desc      NotificationPageState call flow dialogText > check > dialogText > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0126 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`dialogText>check>dialogText>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>dialogText>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>dialogText>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0127
     * @tc.name      NdkNotification_NotificationPageStateFlow_0127
     * @tc.desc      NotificationPageState call flow check > check > tapOutside > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0127 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`check>check>tapOutside>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>tapOutside>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0128
     * @tc.name      NdkNotification_NotificationPageStateFlow_0128
     * @tc.desc      NotificationPageState call flow check > check > check > detachController > confirm keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0128 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`check>check>check>detachController>confir...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>check>detachController>confir...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(3);
      logInfo(`check>check>check>detachController>confir...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0129
     * @tc.name      NdkNotification_NotificationPageStateFlow_0129
     * @tc.desc      NotificationPageState call flow dialogText > check > check > detachController keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0129 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`dialogText>check>check>detachController f...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>check>check>detachController f...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`dialogText>check>check>detachController f...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0130
     * @tc.name      NdkNotification_NotificationPageStateFlow_0130
     * @tc.desc      NotificationPageState call flow confirm > check > tapOutside > detachController keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0130 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.detachController();
      logInfo(`confirm>check>tapOutside>detachController...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>check>tapOutside>detachController...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>check>tapOutside>detachController...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0131
     * @tc.name      NdkNotification_NotificationPageStateFlow_0131
     * @tc.desc      NotificationPageState call flow dialogText > tapOutside > confirm > dialogText keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0131 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0132
     * @tc.name      NdkNotification_NotificationPageStateFlow_0132
     * @tc.desc      NotificationPageState call flow check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0132 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`check>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0133
     * @tc.name      NdkNotification_NotificationPageStateFlow_0133
     * @tc.desc      NotificationPageState call flow tapOutside > dialogText > tapOutside > dialogText keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0133 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0134
     * @tc.name      NdkNotification_NotificationPageStateFlow_0134
     * @tc.desc      NotificationPageState call flow check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0134 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      logInfo(`check>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0135
     * @tc.name      NdkNotification_NotificationPageStateFlow_0135
     * @tc.desc      NotificationPageState call flow check > confirm > confirm > dialogText > detachController keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0135 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      subject.detachController();
      logInfo(`check>confirm>confirm>dialogText>detachCo...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>confirm>confirm>dialogText>detachCo...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>confirm>confirm>dialogText>detachCo...: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`check>confirm>confirm>dialogText>detachCo...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0136
     * @tc.name      NdkNotification_NotificationPageStateFlow_0136
     * @tc.desc      NotificationPageState call flow tapOutside > detachController > confirm > check > detachControll...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0136 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`tapOutside>detachController>confirm>check...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>detachController>confirm>check...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`tapOutside>detachController>confirm>check...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0137
     * @tc.name      NdkNotification_NotificationPageStateFlow_0137
     * @tc.desc      NotificationPageState call flow detachController > dialogText > dialogText > check > detachContr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0137 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`detachController>dialogText>dialogText>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>dialogText>dialogText>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>dialogText>dialogText>ch...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0138
     * @tc.name      NdkNotification_NotificationPageStateFlow_0138
     * @tc.desc      NotificationPageState call flow confirm > check > confirm > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0138 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`confirm>check>confirm>check>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>check>confirm>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>check>confirm>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(3);
      logInfo(`confirm>check>confirm>check>check final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0139
     * @tc.name      NdkNotification_NotificationPageStateFlow_0139
     * @tc.desc      NotificationPageState call flow tapOutside > check > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0139 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`tapOutside>check>detachController final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>detachController final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`tapOutside>check>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0140
     * @tc.name      NdkNotification_NotificationPageStateFlow_0140
     * @tc.desc      NotificationPageState call flow check > check > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0140 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`check>check>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(4);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0141
     * @tc.name      NdkNotification_NotificationPageStateFlow_0141
     * @tc.desc      NotificationPageState call flow tapOutside > check > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0141 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`tapOutside>check>tapOutside final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>check>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0142
     * @tc.name      NdkNotification_NotificationPageStateFlow_0142
     * @tc.desc      NotificationPageState call flow confirm > confirm > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0142 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0143
     * @tc.name      NdkNotification_NotificationPageStateFlow_0143
     * @tc.desc      NotificationPageState call flow check > confirm > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0143 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      logInfo(`check>confirm>dialogText final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>confirm>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>confirm>dialogText final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0144
     * @tc.name      NdkNotification_NotificationPageStateFlow_0144
     * @tc.desc      NotificationPageState call flow confirm > dialogText > confirm > check > tapOutside keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0144 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`confirm>dialogText>confirm>check>tapOutsi...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>dialogText>confirm>check>tapOutsi...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0145
     * @tc.name      NdkNotification_NotificationPageStateFlow_0145
     * @tc.desc      NotificationPageState call flow detachController > detachController > check > check keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0145 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>detachController>check>c...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>detachController>check>c...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>detachController>check>c...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>detachController>check>c...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0146
     * @tc.name      NdkNotification_NotificationPageStateFlow_0146
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > check > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0146 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>dialogText>check>dialogText final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>dialogText>check>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>dialogText>check>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0147
     * @tc.name      NdkNotification_NotificationPageStateFlow_0147
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > check > dialogText > dialogText ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0147 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>tapOutside>check>dialogT...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>tapOutside>check>dialogT...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>tapOutside>check>dialogT...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0148
     * @tc.name      NdkNotification_NotificationPageStateFlow_0148
     * @tc.desc      NotificationPageState call flow detachController > confirm > tapOutside > tapOutside keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0148 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`detachController>confirm>tapOutside>tapOu...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0149
     * @tc.name      NdkNotification_NotificationPageStateFlow_0149
     * @tc.desc      NotificationPageState call flow dialogText > tapOutside > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0149 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0150
     * @tc.name      NdkNotification_NotificationPageStateFlow_0150
     * @tc.desc      NotificationPageState call flow detachController > detachController > dialogText keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0150 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>detachController>dialogT...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0151
     * @tc.name      NdkNotification_NotificationPageStateFlow_0151
     * @tc.desc      NotificationPageState call flow dialogText > tapOutside > dialogText > tapOutside keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0151 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0152
     * @tc.name      NdkNotification_NotificationPageStateFlow_0152
     * @tc.desc      NotificationPageState call flow tapOutside > confirm > detachController > tapOutside > tapOutsid...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0152 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.detachController();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`tapOutside>confirm>detachController>tapOu...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0153
     * @tc.name      NdkNotification_NotificationPageStateFlow_0153
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > check > tapOutside > detachContr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0153 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.detachController();
      logInfo(`detachController>tapOutside>check>tapOuts...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>tapOutside>check>tapOuts...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>tapOutside>check>tapOuts...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>tapOutside>check>tapOuts...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0154
     * @tc.name      NdkNotification_NotificationPageStateFlow_0154
     * @tc.desc      NotificationPageState call flow dialogText > check > confirm > confirm > dialogText keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0154 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`dialogText>check>confirm>confirm>dialogTe...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>confirm>confirm>dialogTe...: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0155
     * @tc.name      NdkNotification_NotificationPageStateFlow_0155
     * @tc.desc      NotificationPageState call flow detachController > dialogText > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0155 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>dialogText>dialogText final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0156
     * @tc.name      NdkNotification_NotificationPageStateFlow_0156
     * @tc.desc      NotificationPageState call flow check > check > dialogText > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0156 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`check>check>dialogText>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>dialogText>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(4);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0157
     * @tc.name      NdkNotification_NotificationPageStateFlow_0157
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > dialogText > dialogText > check keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0157 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>dialogText>dialogText>dialogTe...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>dialogText>dialogText>dialogTe...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>dialogText>dialogText>dialogTe...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0158
     * @tc.name      NdkNotification_NotificationPageStateFlow_0158
     * @tc.desc      NotificationPageState call flow check > dialogText > detachController > confirm > tapOutside kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0158 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      subject.detachController();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`check>dialogText>detachController>confirm...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>dialogText>detachController>confirm...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>detachController>confirm...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>dialogText>detachController>confirm...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0159
     * @tc.name      NdkNotification_NotificationPageStateFlow_0159
     * @tc.desc      NotificationPageState call flow check > dialogText > dialogText > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0159 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`check>dialogText>dialogText>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>dialogText>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0160
     * @tc.name      NdkNotification_NotificationPageStateFlow_0160
     * @tc.desc      NotificationPageState call flow tapOutside > detachController > tapOutside > detachController > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0160 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detachController();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>detachController>tapOutside>de...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0160 end`);
    });
  });
}
