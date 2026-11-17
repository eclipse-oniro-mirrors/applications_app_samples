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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import AVSessionManager from '@ohos.multimedia.avsession';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function mediaControllerSessionTestPart01() {
  describe('MediaControllerSessionPart01', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Session_0001
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0001
     * @tc.desc   Verify AVSessionDescriptor variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0001 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-001',
        type: 'video',
        sessionTag: 'tag-001',
        elementName: { bundleName: 'bundle.descriptor.001', abilityName: 'Ability001' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-001'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-001');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.001');
      expect(descriptor.elementName.abilityName).assertEqual('Ability001');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0001 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0002
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0002
     * @tc.desc   Verify AVSessionDescriptor variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0002 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-002',
        type: 'voice_call',
        sessionTag: 'tag-002',
        elementName: { bundleName: 'bundle.descriptor.002', abilityName: 'Ability002' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-002'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-002');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.002');
      expect(descriptor.elementName.abilityName).assertEqual('Ability002');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0002 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0003
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0003
     * @tc.desc   Verify AVSessionDescriptor variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0003 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-003',
        type: 'video_call',
        sessionTag: 'tag-003',
        elementName: { bundleName: 'bundle.descriptor.003', abilityName: 'Ability003' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-003'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-003');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.003');
      expect(descriptor.elementName.abilityName).assertEqual('Ability003');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0003 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0004
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0004
     * @tc.desc   Verify AVSessionDescriptor variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0004 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-004',
        type: 'photo',
        sessionTag: 'tag-004',
        elementName: { bundleName: 'bundle.descriptor.004', abilityName: 'Ability004' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-004'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-004');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.004');
      expect(descriptor.elementName.abilityName).assertEqual('Ability004');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0004 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0005
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0005
     * @tc.desc   Verify AVSessionDescriptor variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0005 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-005',
        type: 'audio',
        sessionTag: 'tag-005',
        elementName: { bundleName: 'bundle.descriptor.005', abilityName: 'Ability005' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-005'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-005');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.005');
      expect(descriptor.elementName.abilityName).assertEqual('Ability005');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0005 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0006
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0006
     * @tc.desc   Verify AVSessionDescriptor variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0006 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-006',
        type: 'video',
        sessionTag: 'tag-006',
        elementName: { bundleName: 'bundle.descriptor.006', abilityName: 'Ability006' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-006'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-006');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.006');
      expect(descriptor.elementName.abilityName).assertEqual('Ability006');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0006 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0007
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0007
     * @tc.desc   Verify AVSessionDescriptor variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0007 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-007',
        type: 'voice_call',
        sessionTag: 'tag-007',
        elementName: { bundleName: 'bundle.descriptor.007', abilityName: 'Ability007' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-007'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-007');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.007');
      expect(descriptor.elementName.abilityName).assertEqual('Ability007');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0007 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0008
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0008
     * @tc.desc   Verify AVSessionDescriptor variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0008 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-008',
        type: 'video_call',
        sessionTag: 'tag-008',
        elementName: { bundleName: 'bundle.descriptor.008', abilityName: 'Ability008' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-008'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-008');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.008');
      expect(descriptor.elementName.abilityName).assertEqual('Ability008');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0008 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0009
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0009
     * @tc.desc   Verify AVSessionDescriptor variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0009 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-009',
        type: 'photo',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.009', abilityName: 'Ability009' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-009'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-009');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.009');
      expect(descriptor.elementName.abilityName).assertEqual('Ability009');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0009 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0010
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0010
     * @tc.desc   Verify AVSessionDescriptor variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0010 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-010',
        type: 'audio',
        sessionTag: 'tag-010',
        elementName: { bundleName: 'bundle.descriptor.010', abilityName: 'Ability010' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-010'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-010');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.010');
      expect(descriptor.elementName.abilityName).assertEqual('Ability010');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0010 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0011
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0011
     * @tc.desc   Verify AVSessionDescriptor variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0011 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-011',
        type: 'video',
        sessionTag: 'tag-011',
        elementName: { bundleName: 'bundle.descriptor.011', abilityName: 'Ability011' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-011'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-011');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.011');
      expect(descriptor.elementName.abilityName).assertEqual('Ability011');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0011 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0012
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0012
     * @tc.desc   Verify AVSessionDescriptor variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0012 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-012',
        type: 'voice_call',
        sessionTag: 'tag-012',
        elementName: { bundleName: 'bundle.descriptor.012', abilityName: 'Ability012' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-012'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-012');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.012');
      expect(descriptor.elementName.abilityName).assertEqual('Ability012');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0012 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0013
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0013
     * @tc.desc   Verify AVSessionDescriptor variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0013 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-013',
        type: 'video_call',
        sessionTag: 'tag-013',
        elementName: { bundleName: 'bundle.descriptor.013', abilityName: 'Ability013' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-013'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-013');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.013');
      expect(descriptor.elementName.abilityName).assertEqual('Ability013');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0013 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0014
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0014
     * @tc.desc   Verify AVSessionDescriptor variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0014 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-014',
        type: 'photo',
        sessionTag: 'tag-014',
        elementName: { bundleName: 'bundle.descriptor.014', abilityName: 'Ability014' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-014'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-014');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.014');
      expect(descriptor.elementName.abilityName).assertEqual('Ability014');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0014 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0015
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0015
     * @tc.desc   Verify AVSessionDescriptor variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0015 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-015',
        type: 'audio',
        sessionTag: 'tag-015',
        elementName: { bundleName: 'bundle.descriptor.015', abilityName: 'Ability015' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-015'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-015');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.015');
      expect(descriptor.elementName.abilityName).assertEqual('Ability015');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0015 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0016
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0016
     * @tc.desc   Verify AVSessionDescriptor variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0016 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-016',
        type: 'video',
        sessionTag: 'tag-016',
        elementName: { bundleName: 'bundle.descriptor.016', abilityName: 'Ability016' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-016'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-016');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.016');
      expect(descriptor.elementName.abilityName).assertEqual('Ability016');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0016 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0017
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0017
     * @tc.desc   Verify AVSessionDescriptor variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0017 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-017',
        type: 'voice_call',
        sessionTag: 'tag-017',
        elementName: { bundleName: 'bundle.descriptor.017', abilityName: 'Ability017' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-017'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-017');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.017');
      expect(descriptor.elementName.abilityName).assertEqual('Ability017');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0017 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0018
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0018
     * @tc.desc   Verify AVSessionDescriptor variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0018 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-018',
        type: 'video_call',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.018', abilityName: 'Ability018' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-018'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-018');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.018');
      expect(descriptor.elementName.abilityName).assertEqual('Ability018');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0018 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0019
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0019
     * @tc.desc   Verify AVSessionDescriptor variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0019 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-019',
        type: 'photo',
        sessionTag: 'tag-019',
        elementName: { bundleName: 'bundle.descriptor.019', abilityName: 'Ability019' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-019'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-019');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.019');
      expect(descriptor.elementName.abilityName).assertEqual('Ability019');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0019 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0020
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0020
     * @tc.desc   Verify AVSessionDescriptor variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0020 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-020',
        type: 'audio',
        sessionTag: 'tag-020',
        elementName: { bundleName: 'bundle.descriptor.020', abilityName: 'Ability020' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-020'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-020');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.020');
      expect(descriptor.elementName.abilityName).assertEqual('Ability020');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0020 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0021
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0021
     * @tc.desc   Verify AVSessionDescriptor variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0021 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-021',
        type: 'video',
        sessionTag: 'tag-021',
        elementName: { bundleName: 'bundle.descriptor.021', abilityName: 'Ability021' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-021'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-021');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.021');
      expect(descriptor.elementName.abilityName).assertEqual('Ability021');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0021 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0022
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0022
     * @tc.desc   Verify AVSessionDescriptor variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0022 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-022',
        type: 'voice_call',
        sessionTag: 'tag-022',
        elementName: { bundleName: 'bundle.descriptor.022', abilityName: 'Ability022' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-022'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-022');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.022');
      expect(descriptor.elementName.abilityName).assertEqual('Ability022');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0022 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0023
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0023
     * @tc.desc   Verify AVSessionDescriptor variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0023 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-023',
        type: 'video_call',
        sessionTag: 'tag-023',
        elementName: { bundleName: 'bundle.descriptor.023', abilityName: 'Ability023' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-023'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-023');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.023');
      expect(descriptor.elementName.abilityName).assertEqual('Ability023');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0023 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0024
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0024
     * @tc.desc   Verify AVSessionDescriptor variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0024 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-024',
        type: 'photo',
        sessionTag: 'tag-024',
        elementName: { bundleName: 'bundle.descriptor.024', abilityName: 'Ability024' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-024'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-024');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.024');
      expect(descriptor.elementName.abilityName).assertEqual('Ability024');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0024 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0025
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0025
     * @tc.desc   Verify AVSessionDescriptor variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0025 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-025',
        type: 'audio',
        sessionTag: 'tag-025',
        elementName: { bundleName: 'bundle.descriptor.025', abilityName: 'Ability025' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-025'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-025');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.025');
      expect(descriptor.elementName.abilityName).assertEqual('Ability025');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0025 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0026
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0026
     * @tc.desc   Verify AVSessionDescriptor variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0026 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-026',
        type: 'video',
        sessionTag: 'tag-026',
        elementName: { bundleName: 'bundle.descriptor.026', abilityName: 'Ability026' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-026'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-026');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.026');
      expect(descriptor.elementName.abilityName).assertEqual('Ability026');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0026 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0027
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0027
     * @tc.desc   Verify AVSessionDescriptor variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0027 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-027',
        type: 'voice_call',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.027', abilityName: 'Ability027' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-027'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-027');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.027');
      expect(descriptor.elementName.abilityName).assertEqual('Ability027');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0027 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0028
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0028
     * @tc.desc   Verify AVSessionDescriptor variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0028 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-028',
        type: 'video_call',
        sessionTag: 'tag-028',
        elementName: { bundleName: 'bundle.descriptor.028', abilityName: 'Ability028' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-028'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-028');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.028');
      expect(descriptor.elementName.abilityName).assertEqual('Ability028');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0028 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0029
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0029
     * @tc.desc   Verify AVSessionDescriptor variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0029 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-029',
        type: 'photo',
        sessionTag: 'tag-029',
        elementName: { bundleName: 'bundle.descriptor.029', abilityName: 'Ability029' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-029'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-029');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.029');
      expect(descriptor.elementName.abilityName).assertEqual('Ability029');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0029 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0030
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0030
     * @tc.desc   Verify AVSessionDescriptor variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0030 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-030',
        type: 'audio',
        sessionTag: 'tag-030',
        elementName: { bundleName: 'bundle.descriptor.030', abilityName: 'Ability030' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-030'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-030');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.030');
      expect(descriptor.elementName.abilityName).assertEqual('Ability030');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0030 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0031
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0031
     * @tc.desc   Verify AVSessionDescriptor variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0031 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-031',
        type: 'video',
        sessionTag: 'tag-031',
        elementName: { bundleName: 'bundle.descriptor.031', abilityName: 'Ability031' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-031'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-031');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.031');
      expect(descriptor.elementName.abilityName).assertEqual('Ability031');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0031 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0032
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0032
     * @tc.desc   Verify AVSessionDescriptor variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0032 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-032',
        type: 'voice_call',
        sessionTag: 'tag-032',
        elementName: { bundleName: 'bundle.descriptor.032', abilityName: 'Ability032' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-032'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-032');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.032');
      expect(descriptor.elementName.abilityName).assertEqual('Ability032');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0032 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0033
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0033
     * @tc.desc   Verify AVSessionDescriptor variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0033 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-033',
        type: 'video_call',
        sessionTag: 'tag-033',
        elementName: { bundleName: 'bundle.descriptor.033', abilityName: 'Ability033' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-033'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-033');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.033');
      expect(descriptor.elementName.abilityName).assertEqual('Ability033');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0033 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0034
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0034
     * @tc.desc   Verify AVSessionDescriptor variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0034 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-034',
        type: 'photo',
        sessionTag: 'tag-034',
        elementName: { bundleName: 'bundle.descriptor.034', abilityName: 'Ability034' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-034'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-034');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.034');
      expect(descriptor.elementName.abilityName).assertEqual('Ability034');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0034 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0035
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0035
     * @tc.desc   Verify AVSessionDescriptor variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0035 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-035',
        type: 'audio',
        sessionTag: 'tag-035',
        elementName: { bundleName: 'bundle.descriptor.035', abilityName: 'Ability035' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-035'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-035');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.035');
      expect(descriptor.elementName.abilityName).assertEqual('Ability035');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0035 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0036
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0036
     * @tc.desc   Verify AVSessionDescriptor variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0036 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-036',
        type: 'video',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.036', abilityName: 'Ability036' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-036'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-036');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.036');
      expect(descriptor.elementName.abilityName).assertEqual('Ability036');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0036 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0037
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0037
     * @tc.desc   Verify AVSessionDescriptor variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0037 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-037',
        type: 'voice_call',
        sessionTag: 'tag-037',
        elementName: { bundleName: 'bundle.descriptor.037', abilityName: 'Ability037' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-037'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-037');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.037');
      expect(descriptor.elementName.abilityName).assertEqual('Ability037');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0037 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0038
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0038
     * @tc.desc   Verify AVSessionDescriptor variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0038 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-038',
        type: 'video_call',
        sessionTag: 'tag-038',
        elementName: { bundleName: 'bundle.descriptor.038', abilityName: 'Ability038' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-038'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-038');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.038');
      expect(descriptor.elementName.abilityName).assertEqual('Ability038');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0038 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0039
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0039
     * @tc.desc   Verify AVSessionDescriptor variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0039 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-039',
        type: 'photo',
        sessionTag: 'tag-039',
        elementName: { bundleName: 'bundle.descriptor.039', abilityName: 'Ability039' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-039'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-039');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.039');
      expect(descriptor.elementName.abilityName).assertEqual('Ability039');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0039 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0040
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0040
     * @tc.desc   Verify AVSessionDescriptor variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0040 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-040',
        type: 'audio',
        sessionTag: 'tag-040',
        elementName: { bundleName: 'bundle.descriptor.040', abilityName: 'Ability040' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-040'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-040');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.040');
      expect(descriptor.elementName.abilityName).assertEqual('Ability040');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0040 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0041
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0041
     * @tc.desc   Verify AVSessionDescriptor variant 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0041 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-041',
        type: 'video',
        sessionTag: 'tag-041',
        elementName: { bundleName: 'bundle.descriptor.041', abilityName: 'Ability041' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-041'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-041');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.041');
      expect(descriptor.elementName.abilityName).assertEqual('Ability041');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0041 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0042
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0042
     * @tc.desc   Verify AVSessionDescriptor variant 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0042 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-042',
        type: 'voice_call',
        sessionTag: 'tag-042',
        elementName: { bundleName: 'bundle.descriptor.042', abilityName: 'Ability042' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-042'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-042');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.042');
      expect(descriptor.elementName.abilityName).assertEqual('Ability042');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0042 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0043
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0043
     * @tc.desc   Verify AVSessionDescriptor variant 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0043 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-043',
        type: 'video_call',
        sessionTag: 'tag-043',
        elementName: { bundleName: 'bundle.descriptor.043', abilityName: 'Ability043' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-043'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-043');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.043');
      expect(descriptor.elementName.abilityName).assertEqual('Ability043');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0043 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0044
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0044
     * @tc.desc   Verify AVSessionDescriptor variant 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0044 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-044',
        type: 'photo',
        sessionTag: 'tag-044',
        elementName: { bundleName: 'bundle.descriptor.044', abilityName: 'Ability044' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-044'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-044');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.044');
      expect(descriptor.elementName.abilityName).assertEqual('Ability044');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0044 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0045
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0045
     * @tc.desc   Verify AVSessionDescriptor variant 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0045 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-045',
        type: 'audio',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.045', abilityName: 'Ability045' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-045'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-045');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.045');
      expect(descriptor.elementName.abilityName).assertEqual('Ability045');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0045 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0046
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0046
     * @tc.desc   Verify AVSessionDescriptor variant 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0046 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-046',
        type: 'video',
        sessionTag: 'tag-046',
        elementName: { bundleName: 'bundle.descriptor.046', abilityName: 'Ability046' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-046'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-046');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.046');
      expect(descriptor.elementName.abilityName).assertEqual('Ability046');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0046 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0047
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0047
     * @tc.desc   Verify AVSessionDescriptor variant 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0047 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-047',
        type: 'voice_call',
        sessionTag: 'tag-047',
        elementName: { bundleName: 'bundle.descriptor.047', abilityName: 'Ability047' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-047'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-047');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.047');
      expect(descriptor.elementName.abilityName).assertEqual('Ability047');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0047 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0048
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0048
     * @tc.desc   Verify AVSessionDescriptor variant 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0048 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-048',
        type: 'video_call',
        sessionTag: 'tag-048',
        elementName: { bundleName: 'bundle.descriptor.048', abilityName: 'Ability048' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-048'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-048');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.048');
      expect(descriptor.elementName.abilityName).assertEqual('Ability048');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0048 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0049
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0049
     * @tc.desc   Verify AVSessionDescriptor variant 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0049 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-049',
        type: 'photo',
        sessionTag: 'tag-049',
        elementName: { bundleName: 'bundle.descriptor.049', abilityName: 'Ability049' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-049'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-049');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.049');
      expect(descriptor.elementName.abilityName).assertEqual('Ability049');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0049 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0050
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0050
     * @tc.desc   Verify AVSessionDescriptor variant 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0050 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-050',
        type: 'audio',
        sessionTag: 'tag-050',
        elementName: { bundleName: 'bundle.descriptor.050', abilityName: 'Ability050' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-050'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-050');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.050');
      expect(descriptor.elementName.abilityName).assertEqual('Ability050');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0050 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0051
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0051
     * @tc.desc   Verify AVSessionDescriptor variant 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0051 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-051',
        type: 'video',
        sessionTag: 'tag-051',
        elementName: { bundleName: 'bundle.descriptor.051', abilityName: 'Ability051' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-051'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-051');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.051');
      expect(descriptor.elementName.abilityName).assertEqual('Ability051');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0051 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0052
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0052
     * @tc.desc   Verify AVSessionDescriptor variant 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0052 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-052',
        type: 'voice_call',
        sessionTag: 'tag-052',
        elementName: { bundleName: 'bundle.descriptor.052', abilityName: 'Ability052' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-052'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-052');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.052');
      expect(descriptor.elementName.abilityName).assertEqual('Ability052');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0052 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0053
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0053
     * @tc.desc   Verify AVSessionDescriptor variant 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0053 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-053',
        type: 'video_call',
        sessionTag: 'tag-053',
        elementName: { bundleName: 'bundle.descriptor.053', abilityName: 'Ability053' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-053'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-053');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.053');
      expect(descriptor.elementName.abilityName).assertEqual('Ability053');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0053 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0054
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0054
     * @tc.desc   Verify AVSessionDescriptor variant 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0054 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-054',
        type: 'photo',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.054', abilityName: 'Ability054' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-054'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-054');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.054');
      expect(descriptor.elementName.abilityName).assertEqual('Ability054');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0054 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0055
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0055
     * @tc.desc   Verify AVSessionDescriptor variant 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0055 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-055',
        type: 'audio',
        sessionTag: 'tag-055',
        elementName: { bundleName: 'bundle.descriptor.055', abilityName: 'Ability055' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-055'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-055');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.055');
      expect(descriptor.elementName.abilityName).assertEqual('Ability055');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0055 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0056
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0056
     * @tc.desc   Verify AVSessionDescriptor variant 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0056 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-056',
        type: 'video',
        sessionTag: 'tag-056',
        elementName: { bundleName: 'bundle.descriptor.056', abilityName: 'Ability056' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-056'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-056');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.056');
      expect(descriptor.elementName.abilityName).assertEqual('Ability056');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0056 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0057
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0057
     * @tc.desc   Verify AVSessionDescriptor variant 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0057 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-057',
        type: 'voice_call',
        sessionTag: 'tag-057',
        elementName: { bundleName: 'bundle.descriptor.057', abilityName: 'Ability057' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-057'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-057');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.057');
      expect(descriptor.elementName.abilityName).assertEqual('Ability057');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0057 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0058
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0058
     * @tc.desc   Verify AVSessionDescriptor variant 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0058 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-058',
        type: 'video_call',
        sessionTag: 'tag-058',
        elementName: { bundleName: 'bundle.descriptor.058', abilityName: 'Ability058' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-058'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-058');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.058');
      expect(descriptor.elementName.abilityName).assertEqual('Ability058');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0058 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0059
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0059
     * @tc.desc   Verify AVSessionDescriptor variant 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0059 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-059',
        type: 'photo',
        sessionTag: 'tag-059',
        elementName: { bundleName: 'bundle.descriptor.059', abilityName: 'Ability059' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-059'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-059');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.059');
      expect(descriptor.elementName.abilityName).assertEqual('Ability059');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0059 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0060
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0060
     * @tc.desc   Verify AVSessionDescriptor variant 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0060 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-060',
        type: 'audio',
        sessionTag: 'tag-060',
        elementName: { bundleName: 'bundle.descriptor.060', abilityName: 'Ability060' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-060'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-060');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.060');
      expect(descriptor.elementName.abilityName).assertEqual('Ability060');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0060 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0061
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0061
     * @tc.desc   Verify AVSessionDescriptor variant 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0061 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-061',
        type: 'video',
        sessionTag: 'tag-061',
        elementName: { bundleName: 'bundle.descriptor.061', abilityName: 'Ability061' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-061'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-061');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.061');
      expect(descriptor.elementName.abilityName).assertEqual('Ability061');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0061 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0062
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0062
     * @tc.desc   Verify AVSessionDescriptor variant 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0062 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-062',
        type: 'voice_call',
        sessionTag: 'tag-062',
        elementName: { bundleName: 'bundle.descriptor.062', abilityName: 'Ability062' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-062'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-062');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.062');
      expect(descriptor.elementName.abilityName).assertEqual('Ability062');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0062 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0063
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0063
     * @tc.desc   Verify AVSessionDescriptor variant 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0063 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-063',
        type: 'video_call',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.063', abilityName: 'Ability063' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-063'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-063');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.063');
      expect(descriptor.elementName.abilityName).assertEqual('Ability063');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0063 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0064
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0064
     * @tc.desc   Verify AVSessionDescriptor variant 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0064 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-064',
        type: 'photo',
        sessionTag: 'tag-064',
        elementName: { bundleName: 'bundle.descriptor.064', abilityName: 'Ability064' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-064'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-064');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.064');
      expect(descriptor.elementName.abilityName).assertEqual('Ability064');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0064 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0065
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0065
     * @tc.desc   Verify AVSessionDescriptor variant 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0065 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-065',
        type: 'audio',
        sessionTag: 'tag-065',
        elementName: { bundleName: 'bundle.descriptor.065', abilityName: 'Ability065' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-065'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-065');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.065');
      expect(descriptor.elementName.abilityName).assertEqual('Ability065');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0065 end');
    })
  })
}
