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
      expect(actual).assertEqual("0|0|1|0|0|1,0,0,0,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0002
     * @tc.name      VPN_NotifMatrix_0002
     * @tc.desc      notification matrix 1,3,1 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0002 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      subject.addWithoutPublish(3);
      subject.setBadge(1);
      logInfo("notification matrix 1,3,1");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1|2|1|0|0,1,0,1,0,0");
      expect(actual).assertEqual("1|1|2|1|0|0,1,0,1,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0003
     * @tc.name      VPN_NotifMatrix_0003
     * @tc.desc      notification matrix 2,6,2 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0003 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      subject.publish(3, 'g1');
      subject.cancel(3);
      subject.addWithoutPublish(0);
      subject.setBadge(2);
      logInfo("notification matrix 2,6,2");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "2|2|2|2|1|1,0,1,0,0,0");
      expect(actual).assertEqual("2|2|2|2|1|1,0,1,0,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0004
     * @tc.name      VPN_NotifMatrix_0004
     * @tc.desc      notification matrix 3,2,3 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0004 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      subject.publish(4, 'g1');
      subject.cancel(4);
      subject.publish(5, 'g2');
      subject.addWithoutPublish(2);
      subject.setBadge(3);
      logInfo("notification matrix 3,2,3");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "3|3|3|3|1|0,0,1,1,0,1");
      expect(actual).assertEqual("3|3|3|3|1|0,0,1,1,0,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0005
     * @tc.name      VPN_NotifMatrix_0005
     * @tc.desc      notification matrix 4,5,4 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0005 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      subject.publish(5, 'g1');
      subject.cancel(5);
      subject.publish(0, 'g2');
      subject.publish(1, 'g3');
      subject.addWithoutPublish(5);
      subject.setBadge(4);
      logInfo("notification matrix 4,5,4");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "4|4|4|4|1|1,1,0,0,1,1");
      expect(actual).assertEqual("4|4|4|4|1|1,1,0,0,1,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0006
     * @tc.name      VPN_NotifMatrix_0006
     * @tc.desc      notification matrix 5,1,0 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0006 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.addWithoutPublish(1);
      subject.setBadge(0);
      logInfo("notification matrix 5,1,0");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1|0|0|0,1,0,0,0,0");
      expect(actual).assertEqual("0|0|1|0|0|0,1,0,0,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0007
     * @tc.name      VPN_NotifMatrix_0007
     * @tc.desc      notification matrix 6,4,1 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0007 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.addWithoutPublish(4);
      subject.setBadge(1);
      logInfo("notification matrix 6,4,1");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1|2|1|0|1,0,0,0,1,0");
      expect(actual).assertEqual("1|1|2|1|0|1,0,0,0,1,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0008
     * @tc.name      VPN_NotifMatrix_0008
     * @tc.desc      notification matrix 0,0,2 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0008 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(1, 'g1');
      subject.cancel(1);
      subject.addWithoutPublish(0);
      subject.setBadge(2);
      logInfo("notification matrix 0,0,2");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "2|2|2|2|1|2,0,0,0,0,0");
      expect(actual).assertEqual("2|2|2|2|1|2,0,0,0,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0009
     * @tc.name      VPN_NotifMatrix_0009
     * @tc.desc      notification matrix 1,3,3 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0009 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      subject.publish(2, 'g1');
      subject.cancel(2);
      subject.publish(3, 'g2');
      subject.addWithoutPublish(3);
      subject.setBadge(3);
      logInfo("notification matrix 1,3,3");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "3|3|3|3|1|0,1,0,2,0,0");
      expect(actual).assertEqual("3|3|3|3|1|0,1,0,2,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0010
     * @tc.name      VPN_NotifMatrix_0010
     * @tc.desc      notification matrix 2,6,4 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0010 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      subject.publish(3, 'g1');
      subject.cancel(3);
      subject.publish(4, 'g2');
      subject.publish(5, 'g3');
      subject.addWithoutPublish(0);
      subject.setBadge(4);
      logInfo("notification matrix 2,6,4");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "4|4|4|4|1|1,0,1,0,1,1");
      expect(actual).assertEqual("4|4|4|4|1|1,0,1,0,1,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0011
     * @tc.name      VPN_NotifMatrix_0011
     * @tc.desc      notification matrix 3,2,0 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0011 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.addWithoutPublish(2);
      subject.setBadge(0);
      logInfo("notification matrix 3,2,0");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1|0|0|0,0,1,0,0,0");
      expect(actual).assertEqual("0|0|1|0|0|0,0,1,0,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0012
     * @tc.name      VPN_NotifMatrix_0012
     * @tc.desc      notification matrix 4,5,1 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifMatrix_0012 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      subject.addWithoutPublish(5);
      subject.setBadge(1);
      logInfo("notification matrix 4,5,1");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1|2|1|0|0,0,0,0,1,1");
      expect(actual).assertEqual("1|1|2|1|0|0,0,0,0,1,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0013
     * @tc.name      VPN_NotifMatrix_0013
     * @tc.desc      notification matrix 5,1,2 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0013 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      subject.publish(0, 'g1');
      subject.cancel(0);
      subject.addWithoutPublish(1);
      subject.setBadge(2);
      logInfo("notification matrix 5,1,2");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "2|2|2|2|1|0,1,0,0,0,1");
      expect(actual).assertEqual("2|2|2|2|1|0,1,0,0,0,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0014
     * @tc.name      VPN_NotifMatrix_0014
     * @tc.desc      notification matrix 6,4,3 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0014 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(1, 'g1');
      subject.cancel(1);
      subject.publish(2, 'g2');
      subject.addWithoutPublish(4);
      subject.setBadge(3);
      logInfo("notification matrix 6,4,3");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "3|3|3|3|1|1,0,1,0,1,0");
      expect(actual).assertEqual("3|3|3|3|1|1,0,1,0,1,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0015
     * @tc.name      VPN_NotifMatrix_0015
     * @tc.desc      notification matrix 0,0,4 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0015 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(1, 'g1');
      subject.cancel(1);
      subject.publish(2, 'g2');
      subject.publish(3, 'g3');
      subject.addWithoutPublish(0);
      subject.setBadge(4);
      logInfo("notification matrix 0,0,4");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "4|4|4|4|1|2,0,1,1,0,0");
      expect(actual).assertEqual("4|4|4|4|1|2,0,1,1,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0016
     * @tc.name      VPN_NotifMatrix_0016
     * @tc.desc      notification matrix 1,3,0 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0016 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.addWithoutPublish(3);
      subject.setBadge(0);
      logInfo("notification matrix 1,3,0");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1|0|0|0,0,0,1,0,0");
      expect(actual).assertEqual("0|0|1|0|0|0,0,0,1,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0017
     * @tc.name      VPN_NotifMatrix_0017
     * @tc.desc      notification matrix 2,6,1 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0017 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      subject.addWithoutPublish(0);
      subject.setBadge(1);
      logInfo("notification matrix 2,6,1");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1|2|1|0|1,0,1,0,0,0");
      expect(actual).assertEqual("1|1|2|1|0|1,0,1,0,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0018
     * @tc.name      VPN_NotifMatrix_0018
     * @tc.desc      notification matrix 3,2,2 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifMatrix_0018 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      subject.publish(4, 'g1');
      subject.cancel(4);
      subject.addWithoutPublish(2);
      subject.setBadge(2);
      logInfo("notification matrix 3,2,2");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "2|2|2|2|1|0,0,1,1,0,0");
      expect(actual).assertEqual("2|2|2|2|1|0,0,1,1,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0019
     * @tc.name      VPN_NotifMatrix_0019
     * @tc.desc      notification matrix 4,5,3 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0019 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      subject.publish(5, 'g1');
      subject.cancel(5);
      subject.publish(0, 'g2');
      subject.addWithoutPublish(5);
      subject.setBadge(3);
      logInfo("notification matrix 4,5,3");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "3|3|3|3|1|1,0,0,0,1,1");
      expect(actual).assertEqual("3|3|3|3|1|1,0,0,0,1,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0020
     * @tc.name      VPN_NotifMatrix_0020
     * @tc.desc      notification matrix 5,1,4 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0020 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      subject.publish(0, 'g1');
      subject.cancel(0);
      subject.publish(1, 'g2');
      subject.publish(2, 'g3');
      subject.addWithoutPublish(1);
      subject.setBadge(4);
      logInfo("notification matrix 5,1,4");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "4|4|4|4|1|0,2,1,0,0,1");
      expect(actual).assertEqual("4|4|4|4|1|0,2,1,0,0,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0021
     * @tc.name      VPN_NotifMatrix_0021
     * @tc.desc      notification matrix 6,4,0 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0021 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.addWithoutPublish(4);
      subject.setBadge(0);
      logInfo("notification matrix 6,4,0");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1|0|0|0,0,0,0,1,0");
      expect(actual).assertEqual("0|0|1|0|0|0,0,0,0,1,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0022
     * @tc.name      VPN_NotifMatrix_0022
     * @tc.desc      notification matrix 0,0,1 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0022 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.addWithoutPublish(0);
      subject.setBadge(1);
      logInfo("notification matrix 0,0,1");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1|2|1|0|2,0,0,0,0,0");
      expect(actual).assertEqual("1|1|2|1|0|2,0,0,0,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0023
     * @tc.name      VPN_NotifMatrix_0023
     * @tc.desc      notification matrix 1,3,2 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifMatrix_0023 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      subject.publish(2, 'g1');
      subject.cancel(2);
      subject.addWithoutPublish(3);
      subject.setBadge(2);
      logInfo("notification matrix 1,3,2");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "2|2|2|2|1|0,1,0,1,0,0");
      expect(actual).assertEqual("2|2|2|2|1|0,1,0,1,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0024
     * @tc.name      VPN_NotifMatrix_0024
     * @tc.desc      notification matrix 2,6,3 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0024 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      subject.publish(3, 'g1');
      subject.cancel(3);
      subject.publish(4, 'g2');
      subject.addWithoutPublish(0);
      subject.setBadge(3);
      logInfo("notification matrix 2,6,3");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "3|3|3|3|1|1,0,1,0,1,0");
      expect(actual).assertEqual("3|3|3|3|1|1,0,1,0,1,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0025
     * @tc.name      VPN_NotifMatrix_0025
     * @tc.desc      notification matrix 3,2,4 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0025 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      subject.publish(4, 'g1');
      subject.cancel(4);
      subject.publish(5, 'g2');
      subject.publish(0, 'g3');
      subject.addWithoutPublish(2);
      subject.setBadge(4);
      logInfo("notification matrix 3,2,4");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "4|4|4|4|1|1,0,1,1,0,1");
      expect(actual).assertEqual("4|4|4|4|1|1,0,1,1,0,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0026
     * @tc.name      VPN_NotifMatrix_0026
     * @tc.desc      notification matrix 4,5,0 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0026 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.addWithoutPublish(5);
      subject.setBadge(0);
      logInfo("notification matrix 4,5,0");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1|0|0|0,0,0,0,0,1");
      expect(actual).assertEqual("0|0|1|0|0|0,0,0,0,0,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0027
     * @tc.name      VPN_NotifMatrix_0027
     * @tc.desc      notification matrix 5,1,1 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0027 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      subject.addWithoutPublish(1);
      subject.setBadge(1);
      logInfo("notification matrix 5,1,1");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1|2|1|0|0,1,0,0,0,1");
      expect(actual).assertEqual("1|1|2|1|0|0,1,0,0,0,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0028
     * @tc.name      VPN_NotifMatrix_0028
     * @tc.desc      notification matrix 6,4,2 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0028 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(1, 'g1');
      subject.cancel(1);
      subject.addWithoutPublish(4);
      subject.setBadge(2);
      logInfo("notification matrix 6,4,2");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "2|2|2|2|1|1,0,0,0,1,0");
      expect(actual).assertEqual("2|2|2|2|1|1,0,0,0,1,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0029
     * @tc.name      VPN_NotifMatrix_0029
     * @tc.desc      notification matrix 0,0,3 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0029 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(1, 'g1');
      subject.cancel(1);
      subject.publish(2, 'g2');
      subject.addWithoutPublish(0);
      subject.setBadge(3);
      logInfo("notification matrix 0,0,3");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "3|3|3|3|1|2,0,1,0,0,0");
      expect(actual).assertEqual("3|3|3|3|1|2,0,1,0,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0030
     * @tc.name      VPN_NotifMatrix_0030
     * @tc.desc      notification matrix 1,3,4 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0030 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      subject.publish(2, 'g1');
      subject.cancel(2);
      subject.publish(3, 'g2');
      subject.publish(4, 'g3');
      subject.addWithoutPublish(3);
      subject.setBadge(4);
      logInfo("notification matrix 1,3,4");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "4|4|4|4|1|0,1,0,2,1,0");
      expect(actual).assertEqual("4|4|4|4|1|0,1,0,2,1,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0031
     * @tc.name      VPN_NotifMatrix_0031
     * @tc.desc      notification matrix 2,6,0 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0031 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.addWithoutPublish(0);
      subject.setBadge(0);
      logInfo("notification matrix 2,6,0");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1|0|0|1,0,0,0,0,0");
      expect(actual).assertEqual("0|0|1|0|0|1,0,0,0,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0032
     * @tc.name      VPN_NotifMatrix_0032
     * @tc.desc      notification matrix 3,2,1 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0032 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      subject.addWithoutPublish(2);
      subject.setBadge(1);
      logInfo("notification matrix 3,2,1");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1|2|1|0|0,0,1,1,0,0");
      expect(actual).assertEqual("1|1|2|1|0|0,0,1,1,0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0033
     * @tc.name      VPN_NotifMatrix_0033
     * @tc.desc      notification matrix 4,5,2 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifMatrix_0033 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      subject.publish(5, 'g1');
      subject.cancel(5);
      subject.addWithoutPublish(5);
      subject.setBadge(2);
      logInfo("notification matrix 4,5,2");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "2|2|2|2|1|0,0,0,0,1,1");
      expect(actual).assertEqual("2|2|2|2|1|0,0,0,0,1,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0034
     * @tc.name      VPN_NotifMatrix_0034
     * @tc.desc      notification matrix 5,1,3 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifMatrix_0034 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      subject.publish(0, 'g1');
      subject.cancel(0);
      subject.publish(1, 'g2');
      subject.addWithoutPublish(1);
      subject.setBadge(3);
      logInfo("notification matrix 5,1,3");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "3|3|3|3|1|0,2,0,0,0,1");
      expect(actual).assertEqual("3|3|3|3|1|0,2,0,0,0,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_MATRIX_0035
     * @tc.name      VPN_NotifMatrix_0035
     * @tc.desc      notification matrix 6,4,4 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifMatrix_0035 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(1, 'g1');
      subject.cancel(1);
      subject.publish(2, 'g2');
      subject.publish(3, 'g3');
      subject.addWithoutPublish(4);
      subject.setBadge(4);
      logInfo("notification matrix 6,4,4");
      const actual: string = subject.nextId() + '|' + subject.badgeValue() + '|' + subject.total() + '|' + subject.published() + '|' + subject.cancelled() + '|' + subject.countsText();
      logInfo('actual=' + String(actual) + ', expected=' + "4|4|4|4|1|1,0,1,1,1,0");
      expect(actual).assertEqual("4|4|4|4|1|1,0,1,1,1,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifMatrix_0035 end`);
    });
  });
}
