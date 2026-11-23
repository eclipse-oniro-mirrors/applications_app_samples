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

/** Logic checks for NotificationPageState flow (52 cases). */
export default function notificationPageStateFlow4Test(): void {
  describe('NotificationPageStateFlow4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0161
     * @tc.name      NdkNotification_NotificationPageStateFlow_0161
     * @tc.desc      NotificationPageState call flow check > dialogText > dialogText > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0161 begin`);
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
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`check>dialogText>dialogText>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>dialogText>dialogText>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0162
     * @tc.name      NdkNotification_NotificationPageStateFlow_0162
     * @tc.desc      NotificationPageState call flow tapOutside > dialogText > confirm > dialogText > check keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0162 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>dialogText>confirm>dialogText>...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>dialogText>confirm>dialogText>...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0163
     * @tc.name      NdkNotification_NotificationPageStateFlow_0163
     * @tc.desc      NotificationPageState call flow confirm > detachController > tapOutside > dialogText > check kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0163 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>detachController>tapOutside>dialo...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>detachController>tapOutside>dialo...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>detachController>tapOutside>dialo...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0164
     * @tc.name      NdkNotification_NotificationPageStateFlow_0164
     * @tc.desc      NotificationPageState call flow detachController > detachController > tapOutside keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0164 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`detachController>detachController>tapOuts...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0165
     * @tc.name      NdkNotification_NotificationPageStateFlow_0165
     * @tc.desc      NotificationPageState call flow check > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0165 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      logInfo(`check>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0166
     * @tc.name      NdkNotification_NotificationPageStateFlow_0166
     * @tc.desc      NotificationPageState call flow confirm > tapOutside > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0166 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.detachController();
      logInfo(`confirm>tapOutside>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0167
     * @tc.name      NdkNotification_NotificationPageStateFlow_0167
     * @tc.desc      NotificationPageState call flow tapOutside > dialogText > check > check > check keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0167 begin`);
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
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>dialogText>check>check>check f...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>dialogText>check>check>check f...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(3);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0168
     * @tc.name      NdkNotification_NotificationPageStateFlow_0168
     * @tc.desc      NotificationPageState call flow tapOutside > detachController > dialogText > check > dialogText ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0168 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`tapOutside>detachController>dialogText>ch...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>detachController>dialogText>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>detachController>dialogText>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`tapOutside>detachController>dialogText>ch...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0169
     * @tc.name      NdkNotification_NotificationPageStateFlow_0169
     * @tc.desc      NotificationPageState call flow detachController > detachController > tapOutside > detachControl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0169 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detachController();
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`detachController>detachController>tapOuts...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0170
     * @tc.name      NdkNotification_NotificationPageStateFlow_0170
     * @tc.desc      NotificationPageState call flow detachController > detachController > confirm > confirm keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0170 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`detachController>detachController>confirm...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0171
     * @tc.name      NdkNotification_NotificationPageStateFlow_0171
     * @tc.desc      NotificationPageState call flow dialogText > check > confirm > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0171 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>check>confirm>dialogText final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>confirm>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>confirm>dialogText final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0172
     * @tc.name      NdkNotification_NotificationPageStateFlow_0172
     * @tc.desc      NotificationPageState call flow tapOutside > tapOutside > confirm > dialogText keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0172 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0173
     * @tc.name      NdkNotification_NotificationPageStateFlow_0173
     * @tc.desc      NotificationPageState call flow detachController > detachController > dialogText > confirm keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0173 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`detachController>detachController>dialogT...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0174
     * @tc.name      NdkNotification_NotificationPageStateFlow_0174
     * @tc.desc      NotificationPageState call flow confirm > dialogText > tapOutside > tapOutside keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0174 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0175
     * @tc.name      NdkNotification_NotificationPageStateFlow_0175
     * @tc.desc      NotificationPageState call flow check > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0175 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`check>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0176
     * @tc.name      NdkNotification_NotificationPageStateFlow_0176
     * @tc.desc      NotificationPageState call flow detachController > dialogText > tapOutside > tapOutside keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0176 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`detachController>dialogText>tapOutside>ta...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0177
     * @tc.name      NdkNotification_NotificationPageStateFlow_0177
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > check > dialogText keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0177 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>tapOutside>check>dialogT...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>tapOutside>check>dialogT...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>tapOutside>check>dialogT...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>tapOutside>check>dialogT...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0178
     * @tc.name      NdkNotification_NotificationPageStateFlow_0178
     * @tc.desc      NotificationPageState call flow tapOutside > check > dialogText > tapOutside > check keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0178 begin`);
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
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>check>dialogText>tapOutside>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>dialogText>tapOutside>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0179
     * @tc.name      NdkNotification_NotificationPageStateFlow_0179
     * @tc.desc      NotificationPageState call flow confirm > detachController > detachController > dialogText > che...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0179 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      subject.detachController();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`confirm>detachController>detachController...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>detachController>detachController...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>detachController>detachController...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>detachController>detachController...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0180
     * @tc.name      NdkNotification_NotificationPageStateFlow_0180
     * @tc.desc      NotificationPageState call flow check > detachController > detachController > dialogText keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0180 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      subject.detachController();
      subject.detachController();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`check>detachController>detachController>d...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>detachController>detachController>d...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>detachController>detachController>d...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>detachController>detachController>d...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0181
     * @tc.name      NdkNotification_NotificationPageStateFlow_0181
     * @tc.desc      NotificationPageState call flow confirm > dialogText > confirm > dialogText > dialogText keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0181 begin`);
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
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0182
     * @tc.name      NdkNotification_NotificationPageStateFlow_0182
     * @tc.desc      NotificationPageState call flow detachController > check > detachController > dialogText > dialo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0182 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>check>detachController>d...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>detachController>d...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check>detachController>d...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0183
     * @tc.name      NdkNotification_NotificationPageStateFlow_0183
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0183 begin`);
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
      logInfo(`${BUNDLE}NotificationPageStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0184
     * @tc.name      NdkNotification_NotificationPageStateFlow_0184
     * @tc.desc      NotificationPageState call flow check > dialogText > dialogText > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0184 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`check>dialogText>dialogText>tapOutside final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>dialogText>dialogText>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>dialogText>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0185
     * @tc.name      NdkNotification_NotificationPageStateFlow_0185
     * @tc.desc      NotificationPageState call flow dialogText > confirm > check > detachController keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0185 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`dialogText>confirm>check>detachController...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>confirm>check>detachController...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>confirm>check>detachController...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0186
     * @tc.name      NdkNotification_NotificationPageStateFlow_0186
     * @tc.desc      NotificationPageState call flow detachController > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0186 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0187
     * @tc.name      NdkNotification_NotificationPageStateFlow_0187
     * @tc.desc      NotificationPageState call flow tapOutside > check > dialogText > tapOutside > check keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0187 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>check>dialogText>tapOutside>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>dialogText>tapOutside>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0188
     * @tc.name      NdkNotification_NotificationPageStateFlow_0188
     * @tc.desc      NotificationPageState call flow dialogText > check > confirm > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0188 begin`);
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
      logInfo(`dialogText>check>confirm>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>confirm>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0189
     * @tc.name      NdkNotification_NotificationPageStateFlow_0189
     * @tc.desc      NotificationPageState call flow confirm > check > tapOutside > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0189 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`confirm>check>tapOutside>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>check>tapOutside>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>check>tapOutside>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0190
     * @tc.name      NdkNotification_NotificationPageStateFlow_0190
     * @tc.desc      NotificationPageState call flow detachController > confirm > confirm > tapOutside > tapOutside k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0190 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`detachController>confirm>confirm>tapOutsi...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0191
     * @tc.name      NdkNotification_NotificationPageStateFlow_0191
     * @tc.desc      NotificationPageState call flow confirm > dialogText > dialogText > check > dialogText keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0191 begin`);
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
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>dialogText>dialogText>check>dialo...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>dialogText>dialogText>check>dialo...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0192
     * @tc.name      NdkNotification_NotificationPageStateFlow_0192
     * @tc.desc      NotificationPageState call flow detachController > dialogText > dialogText > confirm keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0192 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`detachController>dialogText>dialogText>co...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0193
     * @tc.name      NdkNotification_NotificationPageStateFlow_0193
     * @tc.desc      NotificationPageState call flow confirm > dialogText > tapOutside > check > detachController kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0193 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`confirm>dialogText>tapOutside>check>detac...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>dialogText>tapOutside>check>detac...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>dialogText>tapOutside>check>detac...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0194
     * @tc.name      NdkNotification_NotificationPageStateFlow_0194
     * @tc.desc      NotificationPageState call flow check > tapOutside > check > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0194 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`check>tapOutside>check>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside>check>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0195
     * @tc.name      NdkNotification_NotificationPageStateFlow_0195
     * @tc.desc      NotificationPageState call flow dialogText > check > detachController > detachController keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0195 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      subject.detachController();
      logInfo(`dialogText>check>detachController>detachC...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>check>detachController>detachC...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>detachController>detachC...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0196
     * @tc.name      NdkNotification_NotificationPageStateFlow_0196
     * @tc.desc      NotificationPageState call flow check > dialogText > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0196 begin`);
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
      logInfo(`check>dialogText>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0197
     * @tc.name      NdkNotification_NotificationPageStateFlow_0197
     * @tc.desc      NotificationPageState call flow confirm > tapOutside > dialogText > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0197 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>tapOutside>dialogText>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>tapOutside>dialogText>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0198
     * @tc.name      NdkNotification_NotificationPageStateFlow_0198
     * @tc.desc      NotificationPageState call flow detachController > dialogText > check > detachController > dialo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0198 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>dialogText>check>detachC...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>dialogText>check>detachC...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>dialogText>check>detachC...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0199
     * @tc.name      NdkNotification_NotificationPageStateFlow_0199
     * @tc.desc      NotificationPageState call flow tapOutside > tapOutside > detachController > check keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0199 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.detachController();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`tapOutside>tapOutside>detachController>ch...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>tapOutside>detachController>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>tapOutside>detachController>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`tapOutside>tapOutside>detachController>ch...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0200
     * @tc.name      NdkNotification_NotificationPageStateFlow_0200
     * @tc.desc      NotificationPageState call flow tapOutside > tapOutside > check > dialogText > check keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0200 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`tapOutside>tapOutside>check>dialogText>ch...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>tapOutside>check>dialogText>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>tapOutside>check>dialogText>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0201
     * @tc.name      NdkNotification_NotificationPageStateFlow_0201
     * @tc.desc      NotificationPageState call flow confirm > check > confirm > dialogText > confirm keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0201 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`confirm>check>confirm>dialogText>confirm ...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>check>confirm>dialogText>confirm ...: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0202
     * @tc.name      NdkNotification_NotificationPageStateFlow_0202
     * @tc.desc      NotificationPageState call flow confirm > tapOutside > tapOutside > dialogText > detachControlle...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0202 begin`);
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
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`confirm>tapOutside>tapOutside>dialogText>...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0203
     * @tc.name      NdkNotification_NotificationPageStateFlow_0203
     * @tc.desc      NotificationPageState call flow check > confirm > dialogText > confirm > check keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0203 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`check>confirm>dialogText>confirm>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>confirm>dialogText>confirm>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`check>confirm>dialogText>confirm>check final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0204
     * @tc.name      NdkNotification_NotificationPageStateFlow_0204
     * @tc.desc      NotificationPageState call flow detachController > dialogText > dialogText > confirm > check kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0204 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>dialogText>dialogText>co...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>dialogText>dialogText>co...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>dialogText>dialogText>co...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>dialogText>dialogText>co...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0205
     * @tc.name      NdkNotification_NotificationPageStateFlow_0205
     * @tc.desc      NotificationPageState call flow dialogText > check > confirm > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0205 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`dialogText>check>confirm>tapOutside final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>confirm>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>confirm>tapOutside final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0206
     * @tc.name      NdkNotification_NotificationPageStateFlow_0206
     * @tc.desc      NotificationPageState call flow confirm > detachController > check > tapOutside keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0206 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`confirm>detachController>check>tapOutside...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>detachController>check>tapOutside...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`confirm>detachController>check>tapOutside...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0207
     * @tc.name      NdkNotification_NotificationPageStateFlow_0207
     * @tc.desc      NotificationPageState call flow dialogText > check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0207 begin`);
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
      logInfo(`dialogText>check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>check>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0208
     * @tc.name      NdkNotification_NotificationPageStateFlow_0208
     * @tc.desc      NotificationPageState call flow tapOutside > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0208 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0209
     * @tc.name      NdkNotification_NotificationPageStateFlow_0209
     * @tc.desc      NotificationPageState call flow tapOutside > check > tapOutside > detachController keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0209 begin`);
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
      subject.detachController();
      logInfo(`tapOutside>check>tapOutside>detachControl...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>check>tapOutside>detachControl...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>tapOutside>detachControl...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`tapOutside>check>tapOutside>detachControl...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0210
     * @tc.name      NdkNotification_NotificationPageStateFlow_0210
     * @tc.desc      NotificationPageState call flow check > confirm > check > detachController > confirm keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0210 begin`);
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
      subject.detachController();
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`check>confirm>check>detachController>conf...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>confirm>check>detachController>conf...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`check>confirm>check>detachController>conf...: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`check>confirm>check>detachController>conf...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0211
     * @tc.name      NdkNotification_NotificationPageStateFlow_0211
     * @tc.desc      NotificationPageState call flow check > dialogText > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0211 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`check>dialogText>tapOutside final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>tapOutside final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0212
     * @tc.name      NdkNotification_NotificationPageStateFlow_0212
     * @tc.desc      NotificationPageState call flow tapOutside > tapOutside > confirm > confirm > tapOutside keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0212 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0212 end`);
    });
  });
}
