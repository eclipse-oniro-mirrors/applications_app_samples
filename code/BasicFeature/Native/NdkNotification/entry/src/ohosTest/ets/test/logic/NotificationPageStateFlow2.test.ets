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

/** Logic checks for NotificationPageState flow (53 cases). */
export default function notificationPageStateFlow2Test(): void {
  describe('NotificationPageStateFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0057
     * @tc.name      NdkNotification_NotificationPageStateFlow_0057
     * @tc.desc      NotificationPageState call flow dialogText > detachController > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0057 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`dialogText>detachController>confirm final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0058
     * @tc.name      NdkNotification_NotificationPageStateFlow_0058
     * @tc.desc      NotificationPageState call flow detachController > check > dialogText > detachController > check...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0058 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>check>dialogText>detachC...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>dialogText>detachC...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>check>dialogText>detachC...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0059
     * @tc.name      NdkNotification_NotificationPageStateFlow_0059
     * @tc.desc      NotificationPageState call flow confirm > dialogText > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0059 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`confirm>dialogText>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0060
     * @tc.name      NdkNotification_NotificationPageStateFlow_0060
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > check > dialogText > check keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0060 begin`);
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
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>tapOutside>check>dialogT...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>tapOutside>check>dialogT...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>tapOutside>check>dialogT...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0061
     * @tc.name      NdkNotification_NotificationPageStateFlow_0061
     * @tc.desc      NotificationPageState call flow detachController > dialogText > confirm > check > detachControll...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0061 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`detachController>dialogText>confirm>check...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>dialogText>confirm>check...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>dialogText>confirm>check...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0062
     * @tc.name      NdkNotification_NotificationPageStateFlow_0062
     * @tc.desc      NotificationPageState call flow confirm > detachController > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0062 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`confirm>detachController>confirm final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0063
     * @tc.name      NdkNotification_NotificationPageStateFlow_0063
     * @tc.desc      NotificationPageState call flow dialogText > confirm > dialogText > detachController keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0063 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`dialogText>confirm>dialogText>detachContr...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0064
     * @tc.name      NdkNotification_NotificationPageStateFlow_0064
     * @tc.desc      NotificationPageState call flow dialogText > tapOutside > dialogText > detachController > dialog...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0064 begin`);
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
      subject.detachController();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`dialogText>tapOutside>dialogText>detachCo...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0065
     * @tc.name      NdkNotification_NotificationPageStateFlow_0065
     * @tc.desc      NotificationPageState call flow check > confirm > check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0065 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`check>confirm>check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`check>confirm>check>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0066
     * @tc.name      NdkNotification_NotificationPageStateFlow_0066
     * @tc.desc      NotificationPageState call flow tapOutside > check > confirm > detachController > confirm keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0066 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.detachController();
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`tapOutside>check>confirm>detachController...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`tapOutside>check>confirm>detachController...: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`tapOutside>check>confirm>detachController...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0067
     * @tc.name      NdkNotification_NotificationPageStateFlow_0067
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > tapOutside > check keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0067 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>tapOutside>tapOutside>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>tapOutside>tapOutside>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>tapOutside>tapOutside>ch...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0068
     * @tc.name      NdkNotification_NotificationPageStateFlow_0068
     * @tc.desc      NotificationPageState call flow check > check > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0068 begin`);
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
      logInfo(`check>check>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0069
     * @tc.name      NdkNotification_NotificationPageStateFlow_0069
     * @tc.desc      NotificationPageState call flow check > check > tapOutside > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0069 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
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
      logInfo(`${BUNDLE}NotificationPageStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0070
     * @tc.name      NdkNotification_NotificationPageStateFlow_0070
     * @tc.desc      NotificationPageState call flow confirm > dialogText > detachController > check > detachControll...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0070 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      subject.detachController();
      logInfo(`confirm>dialogText>detachController>check...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>dialogText>detachController>check...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>dialogText>detachController>check...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>dialogText>detachController>check...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0071
     * @tc.name      NdkNotification_NotificationPageStateFlow_0071
     * @tc.desc      NotificationPageState call flow tapOutside > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0071 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      logInfo(`tapOutside>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0072
     * @tc.name      NdkNotification_NotificationPageStateFlow_0072
     * @tc.desc      NotificationPageState call flow confirm > check > confirm > detachController > confirm keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0072 begin`);
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
      subject.detachController();
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`confirm>check>confirm>detachController>co...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>check>confirm>detachController>co...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>check>confirm>detachController>co...: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`confirm>check>confirm>detachController>co...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0073
     * @tc.name      NdkNotification_NotificationPageStateFlow_0073
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0073 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0074
     * @tc.name      NdkNotification_NotificationPageStateFlow_0074
     * @tc.desc      NotificationPageState call flow confirm > confirm > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0074 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      logInfo(`confirm>confirm>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>confirm>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>confirm>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0075
     * @tc.name      NdkNotification_NotificationPageStateFlow_0075
     * @tc.desc      NotificationPageState call flow dialogText > detachController > tapOutside > check > tapOutside ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0075 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`dialogText>detachController>tapOutside>ch...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>detachController>tapOutside>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>detachController>tapOutside>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>detachController>tapOutside>ch...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0076
     * @tc.name      NdkNotification_NotificationPageStateFlow_0076
     * @tc.desc      NotificationPageState call flow confirm > check > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0076 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>check>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>check>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(3);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0077
     * @tc.name      NdkNotification_NotificationPageStateFlow_0077
     * @tc.desc      NotificationPageState call flow detachController > check > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0077 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>check>dialogText final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>check>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check>dialogText final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0078
     * @tc.name      NdkNotification_NotificationPageStateFlow_0078
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0078 begin`);
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
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`dialogText>dialogText>check>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>dialogText>check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>dialogText>check>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0079
     * @tc.name      NdkNotification_NotificationPageStateFlow_0079
     * @tc.desc      NotificationPageState call flow dialogText > confirm > confirm > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0079 begin`);
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
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0080
     * @tc.name      NdkNotification_NotificationPageStateFlow_0080
     * @tc.desc      NotificationPageState call flow check > check > detachController > tapOutside > detachController...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0080 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.detachController();
      logInfo(`check>check>detachController>tapOutside>d...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>detachController>tapOutside>d...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`check>check>detachController>tapOutside>d...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0081
     * @tc.name      NdkNotification_NotificationPageStateFlow_0081
     * @tc.desc      NotificationPageState call flow dialogText > tapOutside > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0081 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>tapOutside>check>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>tapOutside>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>tapOutside>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0082
     * @tc.name      NdkNotification_NotificationPageStateFlow_0082
     * @tc.desc      NotificationPageState call flow check > check > tapOutside > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0082 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`check>check>tapOutside>dialogText final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>check>tapOutside>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>tapOutside>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0083
     * @tc.name      NdkNotification_NotificationPageStateFlow_0083
     * @tc.desc      NotificationPageState call flow confirm > confirm > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0083 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0084
     * @tc.name      NdkNotification_NotificationPageStateFlow_0084
     * @tc.desc      NotificationPageState call flow detachController > dialogText > tapOutside > detachController ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0084 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detachController();
      logInfo(`detachController>dialogText>tapOutside>de...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0085
     * @tc.name      NdkNotification_NotificationPageStateFlow_0085
     * @tc.desc      NotificationPageState call flow check > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0085 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`check>tapOutside final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0086
     * @tc.name      NdkNotification_NotificationPageStateFlow_0086
     * @tc.desc      NotificationPageState call flow confirm > tapOutside > tapOutside > confirm > dialogText keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0086 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0087
     * @tc.name      NdkNotification_NotificationPageStateFlow_0087
     * @tc.desc      NotificationPageState call flow check > confirm > confirm > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0087 begin`);
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
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`check>confirm>confirm>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>confirm>confirm>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>confirm>confirm>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0088
     * @tc.name      NdkNotification_NotificationPageStateFlow_0088
     * @tc.desc      NotificationPageState call flow dialogText > tapOutside > detachController > tapOutside keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0088 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.detachController();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`dialogText>tapOutside>detachController>ta...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0089
     * @tc.name      NdkNotification_NotificationPageStateFlow_0089
     * @tc.desc      NotificationPageState call flow detachController > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0089 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      logInfo(`detachController>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0090
     * @tc.name      NdkNotification_NotificationPageStateFlow_0090
     * @tc.desc      NotificationPageState call flow check > dialogText > dialogText > detachController > dialogText ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0090 begin`);
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
      subject.detachController();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`check>dialogText>dialogText>detachControl...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>dialogText>detachControl...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>dialogText>dialogText>detachControl...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0091
     * @tc.name      NdkNotification_NotificationPageStateFlow_0091
     * @tc.desc      NotificationPageState call flow confirm > confirm > dialogText > detachController > dialogText k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0091 begin`);
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
      subject.detachController();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>confirm>dialogText>detachControll...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0092
     * @tc.name      NdkNotification_NotificationPageStateFlow_0092
     * @tc.desc      NotificationPageState call flow confirm > confirm > check > detachController > check keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0092 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      subject.detachController();
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>confirm>check>detachController>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>confirm>check>detachController>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`confirm>confirm>check>detachController>ch...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0093
     * @tc.name      NdkNotification_NotificationPageStateFlow_0093
     * @tc.desc      NotificationPageState call flow tapOutside > dialogText > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0093 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0094
     * @tc.name      NdkNotification_NotificationPageStateFlow_0094
     * @tc.desc      NotificationPageState call flow detachController > check > dialogText > dialogText keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0094 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>check>dialogText>dialogT...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>check>dialogText>dialogT...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>dialogText>dialogT...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check>dialogText>dialogT...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0095
     * @tc.name      NdkNotification_NotificationPageStateFlow_0095
     * @tc.desc      NotificationPageState call flow confirm > detachController > confirm > confirm keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0095 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`confirm>detachController>confirm>confirm ...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0096
     * @tc.name      NdkNotification_NotificationPageStateFlow_0096
     * @tc.desc      NotificationPageState call flow detachController > check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0096 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`detachController>check>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>check>confirm final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check>confirm final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0097
     * @tc.name      NdkNotification_NotificationPageStateFlow_0097
     * @tc.desc      NotificationPageState call flow confirm > check > confirm > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0097 begin`);
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
      subject.detachController();
      logInfo(`confirm>check>confirm>detachController final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>check>confirm>detachController final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>check>confirm>detachController final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`confirm>check>confirm>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0098
     * @tc.name      NdkNotification_NotificationPageStateFlow_0098
     * @tc.desc      NotificationPageState call flow dialogText > detachController > check > dialogText keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0098 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`dialogText>detachController>check>dialogT...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>detachController>check>dialogT...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>detachController>check>dialogT...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0099
     * @tc.name      NdkNotification_NotificationPageStateFlow_0099
     * @tc.desc      NotificationPageState call flow detachController > confirm > dialogText > confirm keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0099 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`detachController>confirm>dialogText>confi...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0100
     * @tc.name      NdkNotification_NotificationPageStateFlow_0100
     * @tc.desc      NotificationPageState call flow dialogText > check > detachController > dialogText > check keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0100 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      subject.detachController();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>check>detachController>dialogT...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>detachController>dialogT...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>check>detachController>dialogT...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`dialogText>check>detachController>dialogT...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0101
     * @tc.name      NdkNotification_NotificationPageStateFlow_0101
     * @tc.desc      NotificationPageState call flow confirm > tapOutside > confirm > detachController keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0101 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detachController();
      logInfo(`confirm>tapOutside>confirm>detachControll...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0102
     * @tc.name      NdkNotification_NotificationPageStateFlow_0102
     * @tc.desc      NotificationPageState call flow tapOutside > confirm > tapOutside > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0102 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>confirm>tapOutside>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>confirm>tapOutside>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0103
     * @tc.name      NdkNotification_NotificationPageStateFlow_0103
     * @tc.desc      NotificationPageState call flow check > detachController > detachController > confirm keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0103 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      subject.detachController();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`check>detachController>detachController>c...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>detachController>detachController>c...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>detachController>detachController>c...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0104
     * @tc.name      NdkNotification_NotificationPageStateFlow_0104
     * @tc.desc      NotificationPageState call flow detachController > confirm > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0104 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`detachController>confirm>confirm final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0105
     * @tc.name      NdkNotification_NotificationPageStateFlow_0105
     * @tc.desc      NotificationPageState call flow dialogText > tapOutside > dialogText > tapOutside > check keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0105 begin`);
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
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>tapOutside>dialogText>tapOutsi...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>tapOutside>dialogText>tapOutsi...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>tapOutside>dialogText>tapOutsi...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0106
     * @tc.name      NdkNotification_NotificationPageStateFlow_0106
     * @tc.desc      NotificationPageState call flow check > confirm > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0106 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.detachController();
      logInfo(`check>confirm>detachController final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>confirm>detachController final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`check>confirm>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0107
     * @tc.name      NdkNotification_NotificationPageStateFlow_0107
     * @tc.desc      NotificationPageState call flow check > confirm > confirm > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0107 begin`);
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
      subject.detachController();
      logInfo(`check>confirm>confirm>detachController final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>confirm>confirm>detachController final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>confirm>confirm>detachController final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`check>confirm>confirm>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0108
     * @tc.name      NdkNotification_NotificationPageStateFlow_0108
     * @tc.desc      NotificationPageState call flow tapOutside > check > tapOutside > dialogText > dialogText keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0108 begin`);
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
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`tapOutside>check>tapOutside>dialogText>di...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>check>tapOutside>dialogText>di...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>tapOutside>dialogText>di...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0109
     * @tc.name      NdkNotification_NotificationPageStateFlow_0109
     * @tc.desc      NotificationPageState call flow tapOutside > check > dialogText > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0109 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tapOutside>check>dialogText>tapOutside final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>check>dialogText>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>dialogText>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0109 end`);
    });
  });
}
