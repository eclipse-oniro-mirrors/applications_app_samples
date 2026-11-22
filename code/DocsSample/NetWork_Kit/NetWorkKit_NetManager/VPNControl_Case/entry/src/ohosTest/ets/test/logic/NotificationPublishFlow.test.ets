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

/** NotificationPublishFlowTest logic checks (42 cases). */
export default function notificationPublishFlowTest(): void {
  describe('NotificationPublishFlowTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0001
     * @tc.name      VPN_NotifFlow_0001
     * @tc.desc      publish type 0 x0 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifFlow_0001 begin`);
      const subject: NotificationModel = new NotificationModel();
      logInfo("publish type=0 count=0");
      const actual: string = subject.countOf(0) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0");
      expect(actual).assertEqual("0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0002
     * @tc.name      VPN_NotifFlow_0002
     * @tc.desc      publish type 1 x1 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0002 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      logInfo("publish type=1 count=1");
      const actual: string = subject.countOf(1) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1");
      expect(actual).assertEqual("1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0003
     * @tc.name      VPN_NotifFlow_0003
     * @tc.desc      publish type 2 x2 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0003 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      subject.publish(2, 'g1');
      logInfo("publish type=2 count=2");
      const actual: string = subject.countOf(2) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "2:2:2");
      expect(actual).assertEqual("2:2:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0004
     * @tc.name      VPN_NotifFlow_0004
     * @tc.desc      publish type 3 x3 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0004 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      subject.publish(3, 'g1');
      subject.publish(3, 'g2');
      logInfo("publish type=3 count=3");
      const actual: string = subject.countOf(3) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "3:3:3");
      expect(actual).assertEqual("3:3:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0005
     * @tc.name      VPN_NotifFlow_0005
     * @tc.desc      publish type 4 x4 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0005 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      subject.publish(4, 'g1');
      subject.publish(4, 'g2');
      subject.publish(4, 'g3');
      logInfo("publish type=4 count=4");
      const actual: string = subject.countOf(4) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "4:4:4");
      expect(actual).assertEqual("4:4:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0006
     * @tc.name      VPN_NotifFlow_0006
     * @tc.desc      publish type 5 x5 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0006 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      subject.publish(5, 'g1');
      subject.publish(5, 'g2');
      subject.publish(5, 'g3');
      subject.publish(5, 'g4');
      logInfo("publish type=5 count=5");
      const actual: string = subject.countOf(5) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "5:5:5");
      expect(actual).assertEqual("5:5:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0007
     * @tc.name      VPN_NotifFlow_0007
     * @tc.desc      publish type 0 x6 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0007 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(0, 'g1');
      subject.publish(0, 'g2');
      subject.publish(0, 'g3');
      subject.publish(0, 'g4');
      subject.publish(0, 'g5');
      logInfo("publish type=0 count=6");
      const actual: string = subject.countOf(0) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "6:6:6");
      expect(actual).assertEqual("6:6:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0008
     * @tc.name      VPN_NotifFlow_0008
     * @tc.desc      publish type 1 x0 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0008 begin`);
      const subject: NotificationModel = new NotificationModel();
      logInfo("publish type=1 count=0");
      const actual: string = subject.countOf(1) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0");
      expect(actual).assertEqual("0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0009
     * @tc.name      VPN_NotifFlow_0009
     * @tc.desc      publish type 2 x1 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0009 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      logInfo("publish type=2 count=1");
      const actual: string = subject.countOf(2) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1");
      expect(actual).assertEqual("1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0010
     * @tc.name      VPN_NotifFlow_0010
     * @tc.desc      publish type 3 x2 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0010 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      subject.publish(3, 'g1');
      logInfo("publish type=3 count=2");
      const actual: string = subject.countOf(3) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "2:2:2");
      expect(actual).assertEqual("2:2:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0011
     * @tc.name      VPN_NotifFlow_0011
     * @tc.desc      publish type 4 x3 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0011 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      subject.publish(4, 'g1');
      subject.publish(4, 'g2');
      logInfo("publish type=4 count=3");
      const actual: string = subject.countOf(4) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "3:3:3");
      expect(actual).assertEqual("3:3:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0012
     * @tc.name      VPN_NotifFlow_0012
     * @tc.desc      publish type 5 x4 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifFlow_0012 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      subject.publish(5, 'g1');
      subject.publish(5, 'g2');
      subject.publish(5, 'g3');
      logInfo("publish type=5 count=4");
      const actual: string = subject.countOf(5) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "4:4:4");
      expect(actual).assertEqual("4:4:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0013
     * @tc.name      VPN_NotifFlow_0013
     * @tc.desc      publish type 0 x5 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0013 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(0, 'g1');
      subject.publish(0, 'g2');
      subject.publish(0, 'g3');
      subject.publish(0, 'g4');
      logInfo("publish type=0 count=5");
      const actual: string = subject.countOf(0) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "5:5:5");
      expect(actual).assertEqual("5:5:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0014
     * @tc.name      VPN_NotifFlow_0014
     * @tc.desc      publish type 1 x6 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0014 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      subject.publish(1, 'g1');
      subject.publish(1, 'g2');
      subject.publish(1, 'g3');
      subject.publish(1, 'g4');
      subject.publish(1, 'g5');
      logInfo("publish type=1 count=6");
      const actual: string = subject.countOf(1) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "6:6:6");
      expect(actual).assertEqual("6:6:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0015
     * @tc.name      VPN_NotifFlow_0015
     * @tc.desc      publish type 2 x0 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0015 begin`);
      const subject: NotificationModel = new NotificationModel();
      logInfo("publish type=2 count=0");
      const actual: string = subject.countOf(2) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0");
      expect(actual).assertEqual("0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0016
     * @tc.name      VPN_NotifFlow_0016
     * @tc.desc      publish type 3 x1 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0016 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      logInfo("publish type=3 count=1");
      const actual: string = subject.countOf(3) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1");
      expect(actual).assertEqual("1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0017
     * @tc.name      VPN_NotifFlow_0017
     * @tc.desc      publish type 4 x2 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0017 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      subject.publish(4, 'g1');
      logInfo("publish type=4 count=2");
      const actual: string = subject.countOf(4) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "2:2:2");
      expect(actual).assertEqual("2:2:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0018
     * @tc.name      VPN_NotifFlow_0018
     * @tc.desc      publish type 5 x3 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifFlow_0018 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      subject.publish(5, 'g1');
      subject.publish(5, 'g2');
      logInfo("publish type=5 count=3");
      const actual: string = subject.countOf(5) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "3:3:3");
      expect(actual).assertEqual("3:3:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0019
     * @tc.name      VPN_NotifFlow_0019
     * @tc.desc      publish type 0 x4 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0019 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(0, 'g1');
      subject.publish(0, 'g2');
      subject.publish(0, 'g3');
      logInfo("publish type=0 count=4");
      const actual: string = subject.countOf(0) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "4:4:4");
      expect(actual).assertEqual("4:4:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0020
     * @tc.name      VPN_NotifFlow_0020
     * @tc.desc      publish type 1 x5 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0020 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      subject.publish(1, 'g1');
      subject.publish(1, 'g2');
      subject.publish(1, 'g3');
      subject.publish(1, 'g4');
      logInfo("publish type=1 count=5");
      const actual: string = subject.countOf(1) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "5:5:5");
      expect(actual).assertEqual("5:5:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0021
     * @tc.name      VPN_NotifFlow_0021
     * @tc.desc      publish type 2 x6 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0021 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      subject.publish(2, 'g1');
      subject.publish(2, 'g2');
      subject.publish(2, 'g3');
      subject.publish(2, 'g4');
      subject.publish(2, 'g5');
      logInfo("publish type=2 count=6");
      const actual: string = subject.countOf(2) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "6:6:6");
      expect(actual).assertEqual("6:6:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0022
     * @tc.name      VPN_NotifFlow_0022
     * @tc.desc      publish type 3 x0 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0022 begin`);
      const subject: NotificationModel = new NotificationModel();
      logInfo("publish type=3 count=0");
      const actual: string = subject.countOf(3) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0");
      expect(actual).assertEqual("0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0023
     * @tc.name      VPN_NotifFlow_0023
     * @tc.desc      publish type 4 x1 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifFlow_0023 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      logInfo("publish type=4 count=1");
      const actual: string = subject.countOf(4) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1");
      expect(actual).assertEqual("1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0024
     * @tc.name      VPN_NotifFlow_0024
     * @tc.desc      publish type 5 x2 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0024 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      subject.publish(5, 'g1');
      logInfo("publish type=5 count=2");
      const actual: string = subject.countOf(5) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "2:2:2");
      expect(actual).assertEqual("2:2:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0025
     * @tc.name      VPN_NotifFlow_0025
     * @tc.desc      publish type 0 x3 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0025 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(0, 'g1');
      subject.publish(0, 'g2');
      logInfo("publish type=0 count=3");
      const actual: string = subject.countOf(0) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "3:3:3");
      expect(actual).assertEqual("3:3:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0026
     * @tc.name      VPN_NotifFlow_0026
     * @tc.desc      publish type 1 x4 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0026 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      subject.publish(1, 'g1');
      subject.publish(1, 'g2');
      subject.publish(1, 'g3');
      logInfo("publish type=1 count=4");
      const actual: string = subject.countOf(1) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "4:4:4");
      expect(actual).assertEqual("4:4:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0027
     * @tc.name      VPN_NotifFlow_0027
     * @tc.desc      publish type 2 x5 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0027 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      subject.publish(2, 'g1');
      subject.publish(2, 'g2');
      subject.publish(2, 'g3');
      subject.publish(2, 'g4');
      logInfo("publish type=2 count=5");
      const actual: string = subject.countOf(2) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "5:5:5");
      expect(actual).assertEqual("5:5:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0028
     * @tc.name      VPN_NotifFlow_0028
     * @tc.desc      publish type 3 x6 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0028 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      subject.publish(3, 'g1');
      subject.publish(3, 'g2');
      subject.publish(3, 'g3');
      subject.publish(3, 'g4');
      subject.publish(3, 'g5');
      logInfo("publish type=3 count=6");
      const actual: string = subject.countOf(3) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "6:6:6");
      expect(actual).assertEqual("6:6:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0029
     * @tc.name      VPN_NotifFlow_0029
     * @tc.desc      publish type 4 x0 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0029 begin`);
      const subject: NotificationModel = new NotificationModel();
      logInfo("publish type=4 count=0");
      const actual: string = subject.countOf(4) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0");
      expect(actual).assertEqual("0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0030
     * @tc.name      VPN_NotifFlow_0030
     * @tc.desc      publish type 5 x1 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0030 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      logInfo("publish type=5 count=1");
      const actual: string = subject.countOf(5) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1");
      expect(actual).assertEqual("1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0031
     * @tc.name      VPN_NotifFlow_0031
     * @tc.desc      publish type 0 x2 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0031 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      subject.publish(0, 'g1');
      logInfo("publish type=0 count=2");
      const actual: string = subject.countOf(0) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "2:2:2");
      expect(actual).assertEqual("2:2:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0032
     * @tc.name      VPN_NotifFlow_0032
     * @tc.desc      publish type 1 x3 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0032 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      subject.publish(1, 'g1');
      subject.publish(1, 'g2');
      logInfo("publish type=1 count=3");
      const actual: string = subject.countOf(1) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "3:3:3");
      expect(actual).assertEqual("3:3:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0033
     * @tc.name      VPN_NotifFlow_0033
     * @tc.desc      publish type 2 x4 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0033 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      subject.publish(2, 'g1');
      subject.publish(2, 'g2');
      subject.publish(2, 'g3');
      logInfo("publish type=2 count=4");
      const actual: string = subject.countOf(2) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "4:4:4");
      expect(actual).assertEqual("4:4:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0034
     * @tc.name      VPN_NotifFlow_0034
     * @tc.desc      publish type 3 x5 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifFlow_0034 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      subject.publish(3, 'g1');
      subject.publish(3, 'g2');
      subject.publish(3, 'g3');
      subject.publish(3, 'g4');
      logInfo("publish type=3 count=5");
      const actual: string = subject.countOf(3) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "5:5:5");
      expect(actual).assertEqual("5:5:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0035
     * @tc.name      VPN_NotifFlow_0035
     * @tc.desc      publish type 4 x6 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifFlow_0035 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      subject.publish(4, 'g1');
      subject.publish(4, 'g2');
      subject.publish(4, 'g3');
      subject.publish(4, 'g4');
      subject.publish(4, 'g5');
      logInfo("publish type=4 count=6");
      const actual: string = subject.countOf(4) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "6:6:6");
      expect(actual).assertEqual("6:6:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0036
     * @tc.name      VPN_NotifFlow_0036
     * @tc.desc      publish type 5 x0 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0036 begin`);
      const subject: NotificationModel = new NotificationModel();
      logInfo("publish type=5 count=0");
      const actual: string = subject.countOf(5) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0");
      expect(actual).assertEqual("0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0037
     * @tc.name      VPN_NotifFlow_0037
     * @tc.desc      publish type 0 x1 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0037 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(0, 'g0');
      logInfo("publish type=0 count=1");
      const actual: string = subject.countOf(0) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1");
      expect(actual).assertEqual("1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0038
     * @tc.name      VPN_NotifFlow_0038
     * @tc.desc      publish type 1 x2 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0038 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(1, 'g0');
      subject.publish(1, 'g1');
      logInfo("publish type=1 count=2");
      const actual: string = subject.countOf(1) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "2:2:2");
      expect(actual).assertEqual("2:2:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0039
     * @tc.name      VPN_NotifFlow_0039
     * @tc.desc      publish type 2 x3 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0039 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(2, 'g0');
      subject.publish(2, 'g1');
      subject.publish(2, 'g2');
      logInfo("publish type=2 count=3");
      const actual: string = subject.countOf(2) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "3:3:3");
      expect(actual).assertEqual("3:3:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0040
     * @tc.name      VPN_NotifFlow_0040
     * @tc.desc      publish type 3 x4 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0040 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(3, 'g0');
      subject.publish(3, 'g1');
      subject.publish(3, 'g2');
      subject.publish(3, 'g3');
      logInfo("publish type=3 count=4");
      const actual: string = subject.countOf(3) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "4:4:4");
      expect(actual).assertEqual("4:4:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0041
     * @tc.name      VPN_NotifFlow_0041
     * @tc.desc      publish type 4 x5 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0041 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(4, 'g0');
      subject.publish(4, 'g1');
      subject.publish(4, 'g2');
      subject.publish(4, 'g3');
      subject.publish(4, 'g4');
      logInfo("publish type=4 count=5");
      const actual: string = subject.countOf(4) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "5:5:5");
      expect(actual).assertEqual("5:5:5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_FLOW_0042
     * @tc.name      VPN_NotifFlow_0042
     * @tc.desc      publish type 5 x6 updates counts/badge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifFlow_0042 begin`);
      const subject: NotificationModel = new NotificationModel();
      subject.publish(5, 'g0');
      subject.publish(5, 'g1');
      subject.publish(5, 'g2');
      subject.publish(5, 'g3');
      subject.publish(5, 'g4');
      subject.publish(5, 'g5');
      logInfo("publish type=5 count=6");
      const actual: string = subject.countOf(5) + ':' + subject.badgeValue() + ':' + subject.published();
      logInfo('actual=' + String(actual) + ', expected=' + "6:6:6");
      expect(actual).assertEqual("6:6:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifFlow_0042 end`);
    });
  });
}
