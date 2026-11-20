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

/** Logic checks for NotificationPageState flow (56 cases). */
export default function notificationPageStateFlowTest(): void {
  describe('NotificationPageStateFlowTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0001
     * @tc.name      NdkNotification_NotificationPageStateFlow_0001
     * @tc.desc      NotificationPageState call flow tapOutside > check > check > dialogText > dialogText keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NotificationPageStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0001 begin`);
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
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>check>check>dialogText>dialogT...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>check>dialogText>dialogT...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0002
     * @tc.name      NdkNotification_NotificationPageStateFlow_0002
     * @tc.desc      NotificationPageState call flow check > confirm > detachController > dialogText > detachControll...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NotificationPageStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0002 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.detachController();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      subject.detachController();
      logInfo(`check>confirm>detachController>dialogText...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>confirm>detachController>dialogText...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>confirm>detachController>dialogText...: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`check>confirm>detachController>dialogText...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0003
     * @tc.name      NdkNotification_NotificationPageStateFlow_0003
     * @tc.desc      NotificationPageState call flow tapOutside > dialogText > detachController > confirm > dialogTex...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0003 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>dialogText>detachController>co...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0004
     * @tc.name      NdkNotification_NotificationPageStateFlow_0004
     * @tc.desc      NotificationPageState call flow check > dialogText > tapOutside > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0004 begin`);
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
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`check>dialogText>tapOutside>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>tapOutside>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0005
     * @tc.name      NdkNotification_NotificationPageStateFlow_0005
     * @tc.desc      NotificationPageState call flow check > tapOutside > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0005 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.check(false);
      logInfo(`step4 check(false): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`check>tapOutside>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(3);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0006
     * @tc.name      NdkNotification_NotificationPageStateFlow_0006
     * @tc.desc      NotificationPageState call flow dialogText > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0006 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0007
     * @tc.name      NdkNotification_NotificationPageStateFlow_0007
     * @tc.desc      NotificationPageState call flow dialogText > detachController > dialogText > dialogText > detach...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0007 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`dialogText>detachController>dialogText>di...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0008
     * @tc.name      NdkNotification_NotificationPageStateFlow_0008
     * @tc.desc      NotificationPageState call flow dialogText > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0008 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>check>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0009
     * @tc.name      NdkNotification_NotificationPageStateFlow_0009
     * @tc.desc      NotificationPageState call flow tapOutside > confirm > tapOutside > tapOutside keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0009 begin`);
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
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0010
     * @tc.name      NdkNotification_NotificationPageStateFlow_0010
     * @tc.desc      NotificationPageState call flow confirm > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0010 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      logInfo(`confirm>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0011
     * @tc.name      NdkNotification_NotificationPageStateFlow_0011
     * @tc.desc      NotificationPageState call flow tapOutside > detachController > tapOutside > detachController > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0011 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detachController();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`tapOutside>detachController>tapOutside>de...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0012
     * @tc.name      NdkNotification_NotificationPageStateFlow_0012
     * @tc.desc      NotificationPageState call flow dialogText > detachController > tapOutside > tapOutside keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0012 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`dialogText>detachController>tapOutside>ta...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0013
     * @tc.name      NdkNotification_NotificationPageStateFlow_0013
     * @tc.desc      NotificationPageState call flow check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0013 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0014
     * @tc.name      NdkNotification_NotificationPageStateFlow_0014
     * @tc.desc      NotificationPageState call flow detachController > check > detachController > check > confirm ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0014 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`detachController>check>detachController>c...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>check>detachController>c...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>detachController>c...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>check>detachController>c...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0015
     * @tc.name      NdkNotification_NotificationPageStateFlow_0015
     * @tc.desc      NotificationPageState call flow check > tapOutside > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0015 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.detachController();
      logInfo(`check>tapOutside>detachController final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>tapOutside>detachController final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>tapOutside>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0016
     * @tc.name      NdkNotification_NotificationPageStateFlow_0016
     * @tc.desc      NotificationPageState call flow confirm > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0016 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      logInfo(`confirm>check>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0017
     * @tc.name      NdkNotification_NotificationPageStateFlow_0017
     * @tc.desc      NotificationPageState call flow tapOutside > check > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0017 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`tapOutside>check>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`tapOutside>check>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0018
     * @tc.name      NdkNotification_NotificationPageStateFlow_0018
     * @tc.desc      NotificationPageState call flow tapOutside > detachController > dialogText > confirm keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0018 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`tapOutside>detachController>dialogText>co...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0019
     * @tc.name      NdkNotification_NotificationPageStateFlow_0019
     * @tc.desc      NotificationPageState call flow detachController > check > detachController > confirm > tapOutsi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0019 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.tapOutside();
      logInfo(`step5 tapOutside(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`detachController>check>detachController>c...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>detachController>c...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check>detachController>c...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0020
     * @tc.name      NdkNotification_NotificationPageStateFlow_0020
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0020 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`dialogText>dialogText>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0021
     * @tc.name      NdkNotification_NotificationPageStateFlow_0021
     * @tc.desc      NotificationPageState call flow confirm > dialogText > detachController > dialogText keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0021 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>dialogText>detachController>dialo...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0022
     * @tc.name      NdkNotification_NotificationPageStateFlow_0022
     * @tc.desc      NotificationPageState call flow confirm > tapOutside > check > check > confirm keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0022 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: boolean = subject.confirm();
      logInfo(`step5 confirm(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`confirm>tapOutside>check>check>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`confirm>tapOutside>check>check>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`confirm>tapOutside>check>check>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0023
     * @tc.name      NdkNotification_NotificationPageStateFlow_0023
     * @tc.desc      NotificationPageState call flow detachController > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0023 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`detachController>confirm final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0024
     * @tc.name      NdkNotification_NotificationPageStateFlow_0024
     * @tc.desc      NotificationPageState call flow dialogText > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0024 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`dialogText>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0025
     * @tc.name      NdkNotification_NotificationPageStateFlow_0025
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0025 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>tapOutside>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>tapOutside>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>tapOutside>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>tapOutside>check final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0026
     * @tc.name      NdkNotification_NotificationPageStateFlow_0026
     * @tc.desc      NotificationPageState call flow dialogText > dialogText > confirm > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0026 begin`);
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
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0027
     * @tc.name      NdkNotification_NotificationPageStateFlow_0027
     * @tc.desc      NotificationPageState call flow dialogText > tapOutside > tapOutside > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0027 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>tapOutside>tapOutside>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>tapOutside>tapOutside>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>tapOutside>tapOutside>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0028
     * @tc.name      NdkNotification_NotificationPageStateFlow_0028
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > detachController > check > check...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0028 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.detachController();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>tapOutside>detachControl...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>tapOutside>detachControl...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>tapOutside>detachControl...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>tapOutside>detachControl...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0029
     * @tc.name      NdkNotification_NotificationPageStateFlow_0029
     * @tc.desc      NotificationPageState call flow tapOutside > dialogText > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0029 begin`);
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
      logInfo(`${BUNDLE}NotificationPageStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0030
     * @tc.name      NdkNotification_NotificationPageStateFlow_0030
     * @tc.desc      NotificationPageState call flow detachController > check > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0030 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>check>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>check>dialogText final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0031
     * @tc.name      NdkNotification_NotificationPageStateFlow_0031
     * @tc.desc      NotificationPageState call flow check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0031 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      logInfo(`check>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0032
     * @tc.name      NdkNotification_NotificationPageStateFlow_0032
     * @tc.desc      NotificationPageState call flow dialogText > detachController > detachController > tapOutside ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0032 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      subject.detachController();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`dialogText>detachController>detachControl...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0033
     * @tc.name      NdkNotification_NotificationPageStateFlow_0033
     * @tc.desc      NotificationPageState call flow tapOutside > dialogText > check > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0033 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: false');
      logInfo(`tapOutside>dialogText>check>dialogText final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>dialogText>check>dialogText final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0034
     * @tc.name      NdkNotification_NotificationPageStateFlow_0034
     * @tc.desc      NotificationPageState call flow tapOutside > check > tapOutside > check > detachController keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0034 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      subject.detachController();
      logInfo(`tapOutside>check>tapOutside>check>detachC...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`tapOutside>check>tapOutside>check>detachC...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`tapOutside>check>tapOutside>check>detachC...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`tapOutside>check>tapOutside>check>detachC...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0035
     * @tc.name      NdkNotification_NotificationPageStateFlow_0035
     * @tc.desc      NotificationPageState call flow dialogText > detachController > confirm > detachController > che...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0035 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: boolean = subject.confirm();
      logInfo(`step3 confirm(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detachController();
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`dialogText>detachController>confirm>detac...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>detachController>confirm>detac...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`dialogText>detachController>confirm>detac...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0036
     * @tc.name      NdkNotification_NotificationPageStateFlow_0036
     * @tc.desc      NotificationPageState call flow tapOutside > tapOutside keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0036 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.tapOutside();
      logInfo(`step1 tapOutside(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0037
     * @tc.name      NdkNotification_NotificationPageStateFlow_0037
     * @tc.desc      NotificationPageState call flow dialogText > confirm > detachController > detachController > det...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0037 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.detachController();
      subject.detachController();
      subject.detachController();
      logInfo(`dialogText>confirm>detachController>detac...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0038
     * @tc.name      NdkNotification_NotificationPageStateFlow_0038
     * @tc.desc      NotificationPageState call flow confirm > dialogText > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0038 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`confirm>dialogText>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`confirm>dialogText>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0039
     * @tc.name      NdkNotification_NotificationPageStateFlow_0039
     * @tc.desc      NotificationPageState call flow dialogText > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0039 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0040
     * @tc.name      NdkNotification_NotificationPageStateFlow_0040
     * @tc.desc      NotificationPageState call flow check > dialogText > check > check > dialogText keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0040 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(false);
      logInfo(`step3 check(false): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: string = subject.check(true);
      logInfo(`step4 check(true): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`check>dialogText>check>check>dialogText f...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>dialogText>check>check>dialogText f...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>check>check>dialogText f...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(3);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0041
     * @tc.name      NdkNotification_NotificationPageStateFlow_0041
     * @tc.desc      NotificationPageState call flow check > confirm > confirm keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0041 begin`);
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
      logInfo(`check>confirm>confirm final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`check>confirm>confirm final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>confirm>confirm final: subject.closeCount=${subject.closeCount}`);
      expect(subject.closeCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0042
     * @tc.name      NdkNotification_NotificationPageStateFlow_0042
     * @tc.desc      NotificationPageState call flow detachController > dialogText > detachController > tapOutside ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0042 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`detachController>dialogText>detachControl...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0043
     * @tc.name      NdkNotification_NotificationPageStateFlow_0043
     * @tc.desc      NotificationPageState call flow check > detachController > dialogText > detachController > dialo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0043 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`check>detachController>dialogText>detachC...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>detachController>dialogText>detachC...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>detachController>dialogText>detachC...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0044
     * @tc.name      NdkNotification_NotificationPageStateFlow_0044
     * @tc.desc      NotificationPageState call flow check > dialogText > dialogText > dialogText > check keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0044 begin`);
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
      const step5: string = subject.check(false);
      logInfo(`step5 check(false): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`check>dialogText>dialogText>dialogText>ch...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>dialogText>dialogText>dialogText>ch...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0045
     * @tc.name      NdkNotification_NotificationPageStateFlow_0045
     * @tc.desc      NotificationPageState call flow check > detachController > tapOutside > confirm > dialogText kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0045 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      const step3: boolean = subject.tapOutside();
      logInfo(`step3 tapOutside(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.confirm();
      logInfo(`step4 confirm(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`check>detachController>tapOutside>confirm...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>detachController>tapOutside>confirm...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>detachController>tapOutside>confirm...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0046
     * @tc.name      NdkNotification_NotificationPageStateFlow_0046
     * @tc.desc      NotificationPageState call flow detachController > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0046 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>dialogText final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0047
     * @tc.name      NdkNotification_NotificationPageStateFlow_0047
     * @tc.desc      NotificationPageState call flow detachController > confirm > dialogText > tapOutside > dialogTex...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0047 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.confirm();
      logInfo(`step2 confirm(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>confirm>dialogText>tapOu...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0048
     * @tc.name      NdkNotification_NotificationPageStateFlow_0048
     * @tc.desc      NotificationPageState call flow detachController > tapOutside > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0048 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: boolean = subject.tapOutside();
      logInfo(`step2 tapOutside(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dialogText();
      logInfo(`step3 dialogText(): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: false');
      logInfo(`detachController>tapOutside>dialogText final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0049
     * @tc.name      NdkNotification_NotificationPageStateFlow_0049
     * @tc.desc      NotificationPageState call flow confirm > dialogText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0049 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: boolean = subject.confirm();
      logInfo(`step1 confirm(): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      logInfo(`${BUNDLE}NotificationPageStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0050
     * @tc.name      NdkNotification_NotificationPageStateFlow_0050
     * @tc.desc      NotificationPageState call flow detachController > check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0050 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>check>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>check>check final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0051
     * @tc.name      NdkNotification_NotificationPageStateFlow_0051
     * @tc.desc      NotificationPageState call flow dialogText > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0051 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.dialogText();
      logInfo(`step1 dialogText(): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      const step2: string = subject.check(true);
      logInfo(`step2 check(true): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: true');
      logInfo(`dialogText>check final: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`dialogText>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`dialogText>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0052
     * @tc.name      NdkNotification_NotificationPageStateFlow_0052
     * @tc.desc      NotificationPageState call flow check > check keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0052 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(true);
      logInfo(`step1 check(true): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: true');
      const step2: string = subject.check(false);
      logInfo(`step2 check(false): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      logInfo(`check>check final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>check final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`${BUNDLE}NotificationPageStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0053
     * @tc.name      NdkNotification_NotificationPageStateFlow_0053
     * @tc.desc      NotificationPageState call flow tapOutside > detachController > dialogText > dialogText keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0053 begin`);
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
      logInfo(`tapOutside>detachController>dialogText>di...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0054
     * @tc.name      NdkNotification_NotificationPageStateFlow_0054
     * @tc.desc      NotificationPageState call flow detachController > dialogText > check > dialogText > check keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0054 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      const step2: string = subject.dialogText();
      logInfo(`step2 dialogText(): step2=${step2}`);
      expect(step2).assertEqual('Current application notification enabled: false');
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: string = subject.dialogText();
      logInfo(`step4 dialogText(): step4=${step4}`);
      expect(step4).assertEqual('Current application notification enabled: true');
      const step5: string = subject.check(true);
      logInfo(`step5 check(true): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>dialogText>check>dialogT...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>dialogText>check>dialogT...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>dialogText>check>dialogT...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(2);
      logInfo(`detachController>dialogText>check>dialogT...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0055
     * @tc.name      NdkNotification_NotificationPageStateFlow_0055
     * @tc.desc      NotificationPageState call flow check > detachController keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0055 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      const step1: string = subject.check(false);
      logInfo(`step1 check(false): step1=${step1}`);
      expect(step1).assertEqual('Current application notification enabled: false');
      subject.detachController();
      logInfo(`check>detachController final: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`check>detachController final: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`check>detachController final: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NOTIFICATION_PAGE_STATE_FLOW_0056
     * @tc.name      NdkNotification_NotificationPageStateFlow_0056
     * @tc.desc      NotificationPageState call flow detachController > detachController > check > tapOutside > dialo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NotificationPageStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotificationPageStateFlow_0056 begin`);
      const subject: NotificationPageState = new NotificationPageState();
      subject.detachController();
      subject.detachController();
      const step3: string = subject.check(true);
      logInfo(`step3 check(true): step3=${step3}`);
      expect(step3).assertEqual('Current application notification enabled: true');
      const step4: boolean = subject.tapOutside();
      logInfo(`step4 tapOutside(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.dialogText();
      logInfo(`step5 dialogText(): step5=${step5}`);
      expect(step5).assertEqual('Current application notification enabled: true');
      logInfo(`detachController>detachController>check>t...: subject.result=${subject.result}`);
      expect(subject.result).assertTrue();
      logInfo(`detachController>detachController>check>t...: subject.dialogOpen=${subject.dialogOpen}`);
      expect(subject.dialogOpen).assertTrue();
      logInfo(`detachController>detachController>check>t...: subject.openCount=${subject.openCount}`);
      expect(subject.openCount).assertEqual(1);
      logInfo(`detachController>detachController>check>t...: subject.hasController=${subject.hasController}`);
      expect(subject.hasController).assertFalse();
      logInfo(`${BUNDLE}NotificationPageStateFlow_0056 end`);
    });
  });
}
