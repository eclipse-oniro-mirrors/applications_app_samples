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

/** Logic checks for NotificationPageState flow (50 cases). */
export default function notificationPageStateFlow5Test(): void {
  describe('NotificationPageStateFlow5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0213
     * @tc.name      NdkNotification_NotificationPageStateFlow_0213
     * @tc.desc      NotificationPageState call flow check > detachController > dialogText > check > tapOutside keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0213 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`check>detachController>dialogText>check>t...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>detachController>dialogText>check>t...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`check>detachController>dialogText>check>t...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0214
     * @tc.name      NdkNotification_NotificationPageStateFlow_0214
     * @tc.desc      NotificationPageState call flow dialogText > check > dialogText > detachController > detachContr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0214 begin`);
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
      subject.detachController();
      subject.detachController();
      logInfo(`dialogText>check>dialogText>detachControl...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>dialogText>detachControl...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>check>dialogText>detachControl...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>dialogText>detachControl...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0215
     * @tc.name      NdkNotification_NotificationPageStateFlow_0215
     * @tc.desc      NotificationPageState call flow dialogText > check > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0215 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`dialogText>check>tapOutside final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>check>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0216
     * @tc.name      NdkNotification_NotificationPageStateFlow_0216
     * @tc.desc      NotificationPageState call flow tapOutside > confirm > tapOutside > check > dialogText keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0216 begin`);
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
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>confirm>tapOutside>check>dialo...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>confirm>tapOutside>check>dialo...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0217
     * @tc.name      NdkNotification_NotificationPageStateFlow_0217
     * @tc.desc      NotificationPageState call flow dialogText > detachController > dialogText > check keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0217 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>detachController>dialogText>ch...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>detachController>dialogText>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>detachController>dialogText>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>detachController>dialogText>ch...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0218
     * @tc.name      NdkNotification_NotificationPageStateFlow_0218
     * @tc.desc      NotificationPageState call flow check > tapOutside > confirm > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0218 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`check>tapOutside>confirm>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>tapOutside>confirm>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside>confirm>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`check>tapOutside>confirm>check final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0219
     * @tc.name      NdkNotification_NotificationPageStateFlow_0219
     * @tc.desc      NotificationPageState call flow detachController > check > confirm > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0219 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>check>confirm>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>confirm>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>check>confirm>check final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0220
     * @tc.name      NdkNotification_NotificationPageStateFlow_0220
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > detachController > detachController > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0220 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      subject.detachController();
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>dialogText>detachController>de...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>dialogText>detachController>de...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>dialogText>detachController>de...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>dialogText>detachController>de...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0221
     * @tc.name      NdkNotification_NotificationPageStateFlow_0221
     * @tc.desc      NotificationPageState call flow confirm > dialogText > confirm > confirm > dialogText keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0221 begin`);
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
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0222
     * @tc.name      NdkNotification_NotificationPageStateFlow_0222
     * @tc.desc      NotificationPageState call flow detachController > detachController > check > tapOutside keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0222 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`detachController>detachController>check>t...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>detachController>check>t...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>detachController>check>t...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>detachController>check>t...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0223
     * @tc.name      NdkNotification_NotificationPageStateFlow_0223
     * @tc.desc      NotificationPageState call flow check > detachController > tapOutside > detachController > detac...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0223 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.detachController();
      subject.detachController();
      logInfo(`check>detachController>tapOutside>detachC...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>detachController>tapOutside>detachC...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>detachController>tapOutside>detachC...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0224
     * @tc.name      NdkNotification_NotificationPageStateFlow_0224
     * @tc.desc      NotificationPageState call flow tapOutside > detachController > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0224 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>detachController>dialogText final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0225
     * @tc.name      NdkNotification_NotificationPageStateFlow_0225
     * @tc.desc      NotificationPageState call flow confirm > confirm > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0225 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>confirm>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>confirm>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0226
     * @tc.name      NdkNotification_NotificationPageStateFlow_0226
     * @tc.desc      NotificationPageState call flow check > detachController > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0226 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`check>detachController>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>detachController>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>detachController>dialogText final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0227
     * @tc.name      NdkNotification_NotificationPageStateFlow_0227
     * @tc.desc      NotificationPageState call flow detachController > dialogText > confirm > dialogText > detachCon...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0227 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`detachController>dialogText>confirm>dialo...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0228
     * @tc.name      NdkNotification_NotificationPageStateFlow_0228
     * @tc.desc      NotificationPageState call flow check > tapOutside > dialogText > dialogText > tapOutside keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0228 begin`);
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
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`check>tapOutside>dialogText>dialogText>ta...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>tapOutside>dialogText>dialogText>ta...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside>dialogText>dialogText>ta...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0229
     * @tc.name      NdkNotification_NotificationPageStateFlow_0229
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > confirm > check keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0229 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>tapOutside>confirm>check...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>tapOutside>confirm>check...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>tapOutside>confirm>check...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>tapOutside>confirm>check...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0230
     * @tc.name      NdkNotification_NotificationPageStateFlow_0230
     * @tc.desc      NotificationPageState call flow check > tapOutside > tapOutside > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0230 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`check>tapOutside>tapOutside>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside>tapOutside>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0231
     * @tc.name      NdkNotification_NotificationPageStateFlow_0231
     * @tc.desc      NotificationPageState call flow tapOutside > detachController > dialogText > detachController > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0231 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`tapOutside>detachController>dialogText>de...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0232
     * @tc.name      NdkNotification_NotificationPageStateFlow_0232
     * @tc.desc      NotificationPageState call flow detachController > dialogText > check > check keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0232 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>dialogText>check>check f...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>dialogText>check>check f...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>dialogText>check>check f...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>dialogText>check>check f...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0233
     * @tc.name      NdkNotification_NotificationPageStateFlow_0233
     * @tc.desc      NotificationPageState call flow detachController > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0233 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>check>check final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0234
     * @tc.name      NdkNotification_NotificationPageStateFlow_0234
     * @tc.desc      NotificationPageState call flow tapOutside > detachController > dialogText > dialogText > confir...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0234 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`tapOutside>detachController>dialogText>di...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0235
     * @tc.name      NdkNotification_NotificationPageStateFlow_0235
     * @tc.desc      NotificationPageState call flow tapOutside > dialogText > detachController > detachController > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0235 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      subject.detachController();
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`tapOutside>dialogText>detachController>de...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>dialogText>detachController>de...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>dialogText>detachController>de...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`tapOutside>dialogText>detachController>de...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0236
     * @tc.name      NdkNotification_NotificationPageStateFlow_0236
     * @tc.desc      NotificationPageState call flow check > tapOutside > dialogText > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0236 begin`);
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
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`check>tapOutside>dialogText>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside>dialogText>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0237
     * @tc.name      NdkNotification_NotificationPageStateFlow_0237
     * @tc.desc      NotificationPageState call flow dialogText > check > dialogText > tapOutside > confirm keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0237 begin`);
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
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`dialogText>check>dialogText>tapOutside>co...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>dialogText>tapOutside>co...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>dialogText>tapOutside>co...: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0238
     * @tc.name      NdkNotification_NotificationPageStateFlow_0238
     * @tc.desc      NotificationPageState call flow check > detachController > confirm > tapOutside > tapOutside kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0238 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`check>detachController>confirm>tapOutside...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>detachController>confirm>tapOutside...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>detachController>confirm>tapOutside...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0239
     * @tc.name      NdkNotification_NotificationPageStateFlow_0239
     * @tc.desc      NotificationPageState call flow confirm > dialogText > dialogText > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0239 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0240
     * @tc.name      NdkNotification_NotificationPageStateFlow_0240
     * @tc.desc      NotificationPageState call flow detachController > confirm > check > check > dialogText keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0240 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>confirm>check>check>dial...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>confirm>check>check>dial...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>confirm>check>check>dial...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0241
     * @tc.name      NdkNotification_NotificationPageStateFlow_0241
     * @tc.desc      NotificationPageState call flow check > tapOutside > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0241 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`check>tapOutside>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>tapOutside>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>tapOutside>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0242
     * @tc.name      NdkNotification_NotificationPageStateFlow_0242
     * @tc.desc      NotificationPageState call flow confirm > check > check > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0242 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`confirm>check>check>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>check>check>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0243
     * @tc.name      NdkNotification_NotificationPageStateFlow_0243
     * @tc.desc      NotificationPageState call flow confirm > check > detachController > dialogText > check keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0243 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      subject.detachController();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>check>detachController>dialogText...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>check>detachController>dialogText...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`confirm>check>detachController>dialogText...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0244
     * @tc.name      NdkNotification_NotificationPageStateFlow_0244
     * @tc.desc      NotificationPageState call flow dialogText > detachController > dialogText > confirm > dialogTex...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0244 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`dialogText>detachController>dialogText>co...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0245
     * @tc.name      NdkNotification_NotificationPageStateFlow_0245
     * @tc.desc      NotificationPageState call flow check > check > dialogText > tapOutside > tapOutside keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0245 begin`);
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
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`check>check>dialogText>tapOutside>tapOuts...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>check>dialogText>tapOutside>tapOuts...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>dialogText>tapOutside>tapOuts...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0246
     * @tc.name      NdkNotification_NotificationPageStateFlow_0246
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > confirm > dialogText keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0246 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>tapOutside>confirm>dialo...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0247
     * @tc.name      NdkNotification_NotificationPageStateFlow_0247
     * @tc.desc      NotificationPageState call flow confirm > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0247 begin`);
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
      logInfo(`confirm>check>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0248
     * @tc.name      NdkNotification_NotificationPageStateFlow_0248
     * @tc.desc      NotificationPageState call flow dialogText > check > tapOutside > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0248 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`dialogText>check>tapOutside>tapOutside final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>tapOutside>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>check>tapOutside>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0249
     * @tc.name      NdkNotification_NotificationPageStateFlow_0249
     * @tc.desc      NotificationPageState call flow detachController > check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0249 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`detachController>check>confirm final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check>confirm final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0250
     * @tc.name      NdkNotification_NotificationPageStateFlow_0250
     * @tc.desc      NotificationPageState call flow check > check > confirm > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0250 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`check>check>confirm>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check>confirm>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(3);
      logInfo(`check>check>confirm>check final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0251
     * @tc.name      NdkNotification_NotificationPageStateFlow_0251
     * @tc.desc      NotificationPageState call flow confirm > confirm > dialogText > dialogText > dialogText keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0251 begin`);
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
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0252
     * @tc.name      NdkNotification_NotificationPageStateFlow_0252
     * @tc.desc      NotificationPageState call flow detachController > detachController > check > detachController >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0252 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`detachController>detachController>check>d...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>detachController>check>d...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>detachController>check>d...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0253
     * @tc.name      NdkNotification_NotificationPageStateFlow_0253
     * @tc.desc      NotificationPageState call flow dialogText > detachController > check > confirm > dialogText kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0253 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`dialogText>detachController>check>confirm...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>detachController>check>confirm...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>detachController>check>confirm...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0254
     * @tc.name      NdkNotification_NotificationPageStateFlow_0254
     * @tc.desc      NotificationPageState call flow detachController > dialogText > confirm > confirm > confirm keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0254 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`detachController>dialogText>confirm>confi...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0255
     * @tc.name      NdkNotification_NotificationPageStateFlow_0255
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > tapOutside > tapOutside > confirm keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0255 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0256
     * @tc.name      NdkNotification_NotificationPageStateFlow_0256
     * @tc.desc      NotificationPageState call flow confirm > confirm > dialogText > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0256 begin`);
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
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0257
     * @tc.name      NdkNotification_NotificationPageStateFlow_0257
     * @tc.desc      NotificationPageState call flow check > confirm > detachController > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0257 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.detachController();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`check>confirm>detachController>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>confirm>detachController>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>confirm>detachController>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`check>confirm>detachController>check final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`check>confirm>detachController>check final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0258
     * @tc.name      NdkNotification_NotificationPageStateFlow_0258
     * @tc.desc      NotificationPageState call flow detachController > check > confirm > confirm > detachController ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0258 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      subject.detachController();
      logInfo(`detachController>check>confirm>confirm>de...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>confirm>confirm>de...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check>confirm>confirm>de...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0259
     * @tc.name      NdkNotification_NotificationPageStateFlow_0259
     * @tc.desc      NotificationPageState call flow confirm > confirm > confirm > tapOutside > detachController keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0259 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      subject.detachController();
      logInfo(`confirm>confirm>confirm>tapOutside>detach...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0260
     * @tc.name      NdkNotification_NotificationPageStateFlow_0260
     * @tc.desc      NotificationPageState call flow dialogText > confirm > tapOutside > detachController keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0260 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detachController();
      logInfo(`dialogText>confirm>tapOutside>detachContr...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0260 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0261
     * @tc.name      NdkNotification_NotificationPageStateFlow_0261
     * @tc.desc      NotificationPageState call flow dialogText > check > detachController > tapOutside keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0261 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      subject.detachController();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`dialogText>check>detachController>tapOuts...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>detachController>tapOuts...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>check>detachController>tapOuts...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>detachController>tapOuts...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0262
     * @tc.name      NdkNotification_NotificationPageStateFlow_0262
     * @tc.desc      NotificationPageState call flow confirm > confirm > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0262 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`confirm>confirm>check>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>confirm>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>confirm>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0262 end`);
    });
  });
}
