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
import { avSession as AVSessionManager } from '@kit.AVSessionKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function mediaControllerSessionTestPart02() {
  describe('MediaControllerSessionPart02', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Session_0066
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0066
     * @tc.desc   Verify AVSessionDescriptor variant 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0066 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-066',
        type: 'video',
        sessionTag: 'tag-066',
        elementName: { bundleName: 'bundle.descriptor.066', abilityName: 'Ability066' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-066'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-066');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.066');
      expect(descriptor.elementName.abilityName).assertEqual('Ability066');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0066 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0067
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0067
     * @tc.desc   Verify AVSessionDescriptor variant 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0067 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-067',
        type: 'voice_call',
        sessionTag: 'tag-067',
        elementName: { bundleName: 'bundle.descriptor.067', abilityName: 'Ability067' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-067'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-067');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.067');
      expect(descriptor.elementName.abilityName).assertEqual('Ability067');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0067 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0068
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0068
     * @tc.desc   Verify AVSessionDescriptor variant 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0068 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-068',
        type: 'video_call',
        sessionTag: 'tag-068',
        elementName: { bundleName: 'bundle.descriptor.068', abilityName: 'Ability068' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-068'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-068');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.068');
      expect(descriptor.elementName.abilityName).assertEqual('Ability068');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0068 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0069
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0069
     * @tc.desc   Verify AVSessionDescriptor variant 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0069 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-069',
        type: 'photo',
        sessionTag: 'tag-069',
        elementName: { bundleName: 'bundle.descriptor.069', abilityName: 'Ability069' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-069'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-069');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.069');
      expect(descriptor.elementName.abilityName).assertEqual('Ability069');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0069 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0070
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0070
     * @tc.desc   Verify AVSessionDescriptor variant 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0070 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-070',
        type: 'audio',
        sessionTag: 'tag-070',
        elementName: { bundleName: 'bundle.descriptor.070', abilityName: 'Ability070' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-070'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-070');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.070');
      expect(descriptor.elementName.abilityName).assertEqual('Ability070');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0070 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0071
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0071
     * @tc.desc   Verify AVSessionDescriptor variant 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0071 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-071',
        type: 'video',
        sessionTag: 'tag-071',
        elementName: { bundleName: 'bundle.descriptor.071', abilityName: 'Ability071' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-071'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-071');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.071');
      expect(descriptor.elementName.abilityName).assertEqual('Ability071');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0071 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0072
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0072
     * @tc.desc   Verify AVSessionDescriptor variant 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0072 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-072',
        type: 'voice_call',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.072', abilityName: 'Ability072' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-072'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-072');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.072');
      expect(descriptor.elementName.abilityName).assertEqual('Ability072');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0072 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0073
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0073
     * @tc.desc   Verify AVSessionDescriptor variant 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0073 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-073',
        type: 'video_call',
        sessionTag: 'tag-073',
        elementName: { bundleName: 'bundle.descriptor.073', abilityName: 'Ability073' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-073'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-073');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.073');
      expect(descriptor.elementName.abilityName).assertEqual('Ability073');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0073 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0074
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0074
     * @tc.desc   Verify AVSessionDescriptor variant 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0074 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-074',
        type: 'photo',
        sessionTag: 'tag-074',
        elementName: { bundleName: 'bundle.descriptor.074', abilityName: 'Ability074' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-074'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-074');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.074');
      expect(descriptor.elementName.abilityName).assertEqual('Ability074');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0074 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0075
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0075
     * @tc.desc   Verify AVSessionDescriptor variant 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0075 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-075',
        type: 'audio',
        sessionTag: 'tag-075',
        elementName: { bundleName: 'bundle.descriptor.075', abilityName: 'Ability075' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-075'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-075');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.075');
      expect(descriptor.elementName.abilityName).assertEqual('Ability075');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0075 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0076
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0076
     * @tc.desc   Verify AVSessionDescriptor variant 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0076 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-076',
        type: 'video',
        sessionTag: 'tag-076',
        elementName: { bundleName: 'bundle.descriptor.076', abilityName: 'Ability076' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-076'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-076');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.076');
      expect(descriptor.elementName.abilityName).assertEqual('Ability076');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0076 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0077
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0077
     * @tc.desc   Verify AVSessionDescriptor variant 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0077 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-077',
        type: 'voice_call',
        sessionTag: 'tag-077',
        elementName: { bundleName: 'bundle.descriptor.077', abilityName: 'Ability077' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-077'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-077');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.077');
      expect(descriptor.elementName.abilityName).assertEqual('Ability077');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0077 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0078
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0078
     * @tc.desc   Verify AVSessionDescriptor variant 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0078 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-078',
        type: 'video_call',
        sessionTag: 'tag-078',
        elementName: { bundleName: 'bundle.descriptor.078', abilityName: 'Ability078' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-078'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-078');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.078');
      expect(descriptor.elementName.abilityName).assertEqual('Ability078');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0078 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0079
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0079
     * @tc.desc   Verify AVSessionDescriptor variant 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0079 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-079',
        type: 'photo',
        sessionTag: 'tag-079',
        elementName: { bundleName: 'bundle.descriptor.079', abilityName: 'Ability079' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-079'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-079');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.079');
      expect(descriptor.elementName.abilityName).assertEqual('Ability079');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0079 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0080
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0080
     * @tc.desc   Verify AVSessionDescriptor variant 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0080 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-080',
        type: 'audio',
        sessionTag: 'tag-080',
        elementName: { bundleName: 'bundle.descriptor.080', abilityName: 'Ability080' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-080'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-080');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.080');
      expect(descriptor.elementName.abilityName).assertEqual('Ability080');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0080 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0081
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0081
     * @tc.desc   Verify AVSessionDescriptor variant 81.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0081 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-081',
        type: 'video',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.081', abilityName: 'Ability081' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-081'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-081');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.081');
      expect(descriptor.elementName.abilityName).assertEqual('Ability081');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0081 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0082
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0082
     * @tc.desc   Verify AVSessionDescriptor variant 82.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0082 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-082',
        type: 'voice_call',
        sessionTag: 'tag-082',
        elementName: { bundleName: 'bundle.descriptor.082', abilityName: 'Ability082' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-082'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-082');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.082');
      expect(descriptor.elementName.abilityName).assertEqual('Ability082');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0082 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0083
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0083
     * @tc.desc   Verify AVSessionDescriptor variant 83.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0083 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-083',
        type: 'video_call',
        sessionTag: 'tag-083',
        elementName: { bundleName: 'bundle.descriptor.083', abilityName: 'Ability083' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-083'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-083');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.083');
      expect(descriptor.elementName.abilityName).assertEqual('Ability083');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0083 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0084
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0084
     * @tc.desc   Verify AVSessionDescriptor variant 84.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0084 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-084',
        type: 'photo',
        sessionTag: 'tag-084',
        elementName: { bundleName: 'bundle.descriptor.084', abilityName: 'Ability084' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-084'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-084');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.084');
      expect(descriptor.elementName.abilityName).assertEqual('Ability084');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0084 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0085
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0085
     * @tc.desc   Verify AVSessionDescriptor variant 85.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0085 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-085',
        type: 'audio',
        sessionTag: 'tag-085',
        elementName: { bundleName: 'bundle.descriptor.085', abilityName: 'Ability085' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-085'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-085');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.085');
      expect(descriptor.elementName.abilityName).assertEqual('Ability085');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0085 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0086
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0086
     * @tc.desc   Verify AVSessionDescriptor variant 86.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0086 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-086',
        type: 'video',
        sessionTag: 'tag-086',
        elementName: { bundleName: 'bundle.descriptor.086', abilityName: 'Ability086' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-086'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-086');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.086');
      expect(descriptor.elementName.abilityName).assertEqual('Ability086');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0086 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0087
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0087
     * @tc.desc   Verify AVSessionDescriptor variant 87.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0087 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-087',
        type: 'voice_call',
        sessionTag: 'tag-087',
        elementName: { bundleName: 'bundle.descriptor.087', abilityName: 'Ability087' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-087'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-087');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.087');
      expect(descriptor.elementName.abilityName).assertEqual('Ability087');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0087 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0088
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0088
     * @tc.desc   Verify AVSessionDescriptor variant 88.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0088 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-088',
        type: 'video_call',
        sessionTag: 'tag-088',
        elementName: { bundleName: 'bundle.descriptor.088', abilityName: 'Ability088' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-088'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-088');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.088');
      expect(descriptor.elementName.abilityName).assertEqual('Ability088');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0088 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0089
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0089
     * @tc.desc   Verify AVSessionDescriptor variant 89.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0089 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-089',
        type: 'photo',
        sessionTag: 'tag-089',
        elementName: { bundleName: 'bundle.descriptor.089', abilityName: 'Ability089' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-089'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-089');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.089');
      expect(descriptor.elementName.abilityName).assertEqual('Ability089');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0089 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0090
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0090
     * @tc.desc   Verify AVSessionDescriptor variant 90.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0090 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-090',
        type: 'audio',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.090', abilityName: 'Ability090' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-090'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-090');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.090');
      expect(descriptor.elementName.abilityName).assertEqual('Ability090');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0090 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0091
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0091
     * @tc.desc   Verify AVSessionDescriptor variant 91.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0091 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-091',
        type: 'video',
        sessionTag: 'tag-091',
        elementName: { bundleName: 'bundle.descriptor.091', abilityName: 'Ability091' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-091'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-091');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.091');
      expect(descriptor.elementName.abilityName).assertEqual('Ability091');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0091 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0092
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0092
     * @tc.desc   Verify AVSessionDescriptor variant 92.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0092 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-092',
        type: 'voice_call',
        sessionTag: 'tag-092',
        elementName: { bundleName: 'bundle.descriptor.092', abilityName: 'Ability092' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-092'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-092');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.092');
      expect(descriptor.elementName.abilityName).assertEqual('Ability092');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0092 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0093
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0093
     * @tc.desc   Verify AVSessionDescriptor variant 93.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0093 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-093',
        type: 'video_call',
        sessionTag: 'tag-093',
        elementName: { bundleName: 'bundle.descriptor.093', abilityName: 'Ability093' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-093'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-093');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.093');
      expect(descriptor.elementName.abilityName).assertEqual('Ability093');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0093 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0094
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0094
     * @tc.desc   Verify AVSessionDescriptor variant 94.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0094 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-094',
        type: 'photo',
        sessionTag: 'tag-094',
        elementName: { bundleName: 'bundle.descriptor.094', abilityName: 'Ability094' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-094'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-094');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.094');
      expect(descriptor.elementName.abilityName).assertEqual('Ability094');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0094 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0095
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0095
     * @tc.desc   Verify AVSessionDescriptor variant 95.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0095 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-095',
        type: 'audio',
        sessionTag: 'tag-095',
        elementName: { bundleName: 'bundle.descriptor.095', abilityName: 'Ability095' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-095'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-095');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.095');
      expect(descriptor.elementName.abilityName).assertEqual('Ability095');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0095 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0096
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0096
     * @tc.desc   Verify AVSessionDescriptor variant 96.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0096 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-096',
        type: 'video',
        sessionTag: 'tag-096',
        elementName: { bundleName: 'bundle.descriptor.096', abilityName: 'Ability096' },
        isActive: true,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-096'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-096');
      expect(descriptor.type).assertEqual('video');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.096');
      expect(descriptor.elementName.abilityName).assertEqual('Ability096');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0096 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0097
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0097
     * @tc.desc   Verify AVSessionDescriptor variant 97.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0097 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-097',
        type: 'voice_call',
        sessionTag: 'tag-097',
        elementName: { bundleName: 'bundle.descriptor.097', abilityName: 'Ability097' },
        isActive: false,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-097'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-097');
      expect(descriptor.type).assertEqual('voice_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.097');
      expect(descriptor.elementName.abilityName).assertEqual('Ability097');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0097 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0098
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0098
     * @tc.desc   Verify AVSessionDescriptor variant 98.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0098 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-098',
        type: 'video_call',
        sessionTag: 'tag-098',
        elementName: { bundleName: 'bundle.descriptor.098', abilityName: 'Ability098' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-098'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-098');
      expect(descriptor.type).assertEqual('video_call');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.098');
      expect(descriptor.elementName.abilityName).assertEqual('Ability098');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0098 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0099
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0099
     * @tc.desc   Verify AVSessionDescriptor variant 99.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0099 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-099',
        type: 'photo',
        sessionTag: '',
        elementName: { bundleName: 'bundle.descriptor.099', abilityName: 'Ability099' },
        isActive: false,
        isTopSession: true
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-099'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-099');
      expect(descriptor.type).assertEqual('photo');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.099');
      expect(descriptor.elementName.abilityName).assertEqual('Ability099');
      expect(descriptor.isActive).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0099 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0100
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0100
     * @tc.desc   Verify AVSessionDescriptor variant 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0100 begin');
      const descriptor: AVSessionManager.AVSessionDescriptor = {
        sessionId: 'session-descriptor-100',
        type: 'audio',
        sessionTag: 'tag-100',
        elementName: { bundleName: 'bundle.descriptor.100', abilityName: 'Ability100' },
        isActive: true,
        isTopSession: false
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', descriptor.sessionId, String('session-descriptor-100'));
      expect(descriptor.sessionId).assertEqual('session-descriptor-100');
      expect(descriptor.type).assertEqual('audio');
      expect(descriptor.elementName.bundleName).assertEqual('bundle.descriptor.100');
      expect(descriptor.elementName.abilityName).assertEqual('Ability100');
      expect(descriptor.isActive).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0100 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0101
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0101
     * @tc.desc   Verify AVPlaybackState timing variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0101 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 250, updateTime: 270 },
        bufferedTime: 1250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(250);
      expect(state.position?.updateTime).assertEqual(270);
      expect(state.bufferedTime).assertEqual(1250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0101 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0102
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0102
     * @tc.desc   Verify AVPlaybackState timing variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0102 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 500, updateTime: 520 },
        bufferedTime: 1500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(500);
      expect(state.position?.updateTime).assertEqual(520);
      expect(state.bufferedTime).assertEqual(1500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0102 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0103
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0103
     * @tc.desc   Verify AVPlaybackState timing variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0103 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 750, updateTime: 770 },
        bufferedTime: 1750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(750);
      expect(state.position?.updateTime).assertEqual(770);
      expect(state.bufferedTime).assertEqual(1750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0103 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0104
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0104
     * @tc.desc   Verify AVPlaybackState timing variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0104 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 1000, updateTime: 1020 },
        bufferedTime: 2000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(1000);
      expect(state.position?.updateTime).assertEqual(1020);
      expect(state.bufferedTime).assertEqual(2000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0104 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0105
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0105
     * @tc.desc   Verify AVPlaybackState timing variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0105 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 1250, updateTime: 1270 },
        bufferedTime: 2250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(1250);
      expect(state.position?.updateTime).assertEqual(1270);
      expect(state.bufferedTime).assertEqual(2250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0105 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0106
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0106
     * @tc.desc   Verify AVPlaybackState timing variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0106 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 1500, updateTime: 1520 },
        bufferedTime: 2500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(1500);
      expect(state.position?.updateTime).assertEqual(1520);
      expect(state.bufferedTime).assertEqual(2500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0106 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0107
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0107
     * @tc.desc   Verify AVPlaybackState timing variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0107 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 1750, updateTime: 1770 },
        bufferedTime: 2750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(1750);
      expect(state.position?.updateTime).assertEqual(1770);
      expect(state.bufferedTime).assertEqual(2750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0107 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0108
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0108
     * @tc.desc   Verify AVPlaybackState timing variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0108 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 2000, updateTime: 2020 },
        bufferedTime: 3000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(2000);
      expect(state.position?.updateTime).assertEqual(2020);
      expect(state.bufferedTime).assertEqual(3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0108 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0109
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0109
     * @tc.desc   Verify AVPlaybackState timing variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0109 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 2250, updateTime: 2270 },
        bufferedTime: 3250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(2250);
      expect(state.position?.updateTime).assertEqual(2270);
      expect(state.bufferedTime).assertEqual(3250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0109 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0110
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0110
     * @tc.desc   Verify AVPlaybackState timing variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0110 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 2500, updateTime: 2520 },
        bufferedTime: 3500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(2500);
      expect(state.position?.updateTime).assertEqual(2520);
      expect(state.bufferedTime).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0110 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0111
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0111
     * @tc.desc   Verify AVPlaybackState timing variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0111 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 2750, updateTime: 2770 },
        bufferedTime: 3750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(2750);
      expect(state.position?.updateTime).assertEqual(2770);
      expect(state.bufferedTime).assertEqual(3750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0111 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0112
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0112
     * @tc.desc   Verify AVPlaybackState timing variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0112 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 3000, updateTime: 3020 },
        bufferedTime: 4000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(3000);
      expect(state.position?.updateTime).assertEqual(3020);
      expect(state.bufferedTime).assertEqual(4000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0112 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0113
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0113
     * @tc.desc   Verify AVPlaybackState timing variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0113 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 3250, updateTime: 3270 },
        bufferedTime: 4250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(3250);
      expect(state.position?.updateTime).assertEqual(3270);
      expect(state.bufferedTime).assertEqual(4250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0113 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0114
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0114
     * @tc.desc   Verify AVPlaybackState timing variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0114 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 3500, updateTime: 3520 },
        bufferedTime: 4500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(3500);
      expect(state.position?.updateTime).assertEqual(3520);
      expect(state.bufferedTime).assertEqual(4500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0114 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0115
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0115
     * @tc.desc   Verify AVPlaybackState timing variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0115 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 3750, updateTime: 3770 },
        bufferedTime: 4750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(3750);
      expect(state.position?.updateTime).assertEqual(3770);
      expect(state.bufferedTime).assertEqual(4750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0115 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0116
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0116
     * @tc.desc   Verify AVPlaybackState timing variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0116 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 4000, updateTime: 4020 },
        bufferedTime: 5000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(4000);
      expect(state.position?.updateTime).assertEqual(4020);
      expect(state.bufferedTime).assertEqual(5000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0116 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0117
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0117
     * @tc.desc   Verify AVPlaybackState timing variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0117 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 4250, updateTime: 4270 },
        bufferedTime: 5250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(4250);
      expect(state.position?.updateTime).assertEqual(4270);
      expect(state.bufferedTime).assertEqual(5250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0117 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0118
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0118
     * @tc.desc   Verify AVPlaybackState timing variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0118 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 4500, updateTime: 4520 },
        bufferedTime: 5500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(4500);
      expect(state.position?.updateTime).assertEqual(4520);
      expect(state.bufferedTime).assertEqual(5500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0118 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0119
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0119
     * @tc.desc   Verify AVPlaybackState timing variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0119 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 4750, updateTime: 4770 },
        bufferedTime: 5750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(4750);
      expect(state.position?.updateTime).assertEqual(4770);
      expect(state.bufferedTime).assertEqual(5750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0119 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0120
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0120
     * @tc.desc   Verify AVPlaybackState timing variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0120 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 5000, updateTime: 5020 },
        bufferedTime: 6000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(5000);
      expect(state.position?.updateTime).assertEqual(5020);
      expect(state.bufferedTime).assertEqual(6000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0120 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0121
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0121
     * @tc.desc   Verify AVPlaybackState timing variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0121 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 5250, updateTime: 5270 },
        bufferedTime: 6250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(5250);
      expect(state.position?.updateTime).assertEqual(5270);
      expect(state.bufferedTime).assertEqual(6250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0121 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0122
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0122
     * @tc.desc   Verify AVPlaybackState timing variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0122 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 5500, updateTime: 5520 },
        bufferedTime: 6500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(5500);
      expect(state.position?.updateTime).assertEqual(5520);
      expect(state.bufferedTime).assertEqual(6500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0122 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0123
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0123
     * @tc.desc   Verify AVPlaybackState timing variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0123 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 5750, updateTime: 5770 },
        bufferedTime: 6750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(5750);
      expect(state.position?.updateTime).assertEqual(5770);
      expect(state.bufferedTime).assertEqual(6750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0123 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0124
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0124
     * @tc.desc   Verify AVPlaybackState timing variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0124 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 6000, updateTime: 6020 },
        bufferedTime: 7000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(6000);
      expect(state.position?.updateTime).assertEqual(6020);
      expect(state.bufferedTime).assertEqual(7000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0124 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0125
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0125
     * @tc.desc   Verify AVPlaybackState timing variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0125 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 6250, updateTime: 6270 },
        bufferedTime: 7250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(6250);
      expect(state.position?.updateTime).assertEqual(6270);
      expect(state.bufferedTime).assertEqual(7250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0125 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0126
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0126
     * @tc.desc   Verify AVPlaybackState timing variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0126 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 6500, updateTime: 6520 },
        bufferedTime: 7500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(6500);
      expect(state.position?.updateTime).assertEqual(6520);
      expect(state.bufferedTime).assertEqual(7500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0126 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0127
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0127
     * @tc.desc   Verify AVPlaybackState timing variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0127 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 6750, updateTime: 6770 },
        bufferedTime: 7750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(6750);
      expect(state.position?.updateTime).assertEqual(6770);
      expect(state.bufferedTime).assertEqual(7750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0127 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0128
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0128
     * @tc.desc   Verify AVPlaybackState timing variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0128 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.0,
        position: { elapsedTime: 7000, updateTime: 7020 },
        bufferedTime: 8000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.0);
      expect(state.speed).assertEqual(1.0);
      expect(state.position?.elapsedTime).assertEqual(7000);
      expect(state.position?.updateTime).assertEqual(7020);
      expect(state.bufferedTime).assertEqual(8000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0128 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0129
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0129
     * @tc.desc   Verify AVPlaybackState timing variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0129 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.25,
        position: { elapsedTime: 7250, updateTime: 7270 },
        bufferedTime: 8250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.25);
      expect(state.speed).assertEqual(1.25);
      expect(state.position?.elapsedTime).assertEqual(7250);
      expect(state.position?.updateTime).assertEqual(7270);
      expect(state.bufferedTime).assertEqual(8250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0129 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0130
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0130
     * @tc.desc   Verify AVPlaybackState timing variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0130 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.5,
        position: { elapsedTime: 7500, updateTime: 7520 },
        bufferedTime: 8500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.5);
      expect(state.speed).assertEqual(1.5);
      expect(state.position?.elapsedTime).assertEqual(7500);
      expect(state.position?.updateTime).assertEqual(7520);
      expect(state.bufferedTime).assertEqual(8500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0130 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0131
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0131
     * @tc.desc   Verify AVPlaybackState timing variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0131 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 1.75,
        position: { elapsedTime: 7750, updateTime: 7770 },
        bufferedTime: 8750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 1.75);
      expect(state.speed).assertEqual(1.75);
      expect(state.position?.elapsedTime).assertEqual(7750);
      expect(state.position?.updateTime).assertEqual(7770);
      expect(state.bufferedTime).assertEqual(8750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0131 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0132
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0132
     * @tc.desc   Verify AVPlaybackState timing variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0132 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.0,
        position: { elapsedTime: 8000, updateTime: 8020 },
        bufferedTime: 9000
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.0);
      expect(state.speed).assertEqual(0.0);
      expect(state.position?.elapsedTime).assertEqual(8000);
      expect(state.position?.updateTime).assertEqual(8020);
      expect(state.bufferedTime).assertEqual(9000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0132 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0133
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0133
     * @tc.desc   Verify AVPlaybackState timing variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0133 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.25,
        position: { elapsedTime: 8250, updateTime: 8270 },
        bufferedTime: 9250
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.25);
      expect(state.speed).assertEqual(0.25);
      expect(state.position?.elapsedTime).assertEqual(8250);
      expect(state.position?.updateTime).assertEqual(8270);
      expect(state.bufferedTime).assertEqual(9250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0133 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0134
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0134
     * @tc.desc   Verify AVPlaybackState timing variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0134 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.5,
        position: { elapsedTime: 8500, updateTime: 8520 },
        bufferedTime: 9500
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.5);
      expect(state.speed).assertEqual(0.5);
      expect(state.position?.elapsedTime).assertEqual(8500);
      expect(state.position?.updateTime).assertEqual(8520);
      expect(state.bufferedTime).assertEqual(9500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0134 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0135
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0135
     * @tc.desc   Verify AVPlaybackState timing variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0135 begin');
      const state: AVSessionManager.AVPlaybackState = {
        speed: 0.75,
        position: { elapsedTime: 8750, updateTime: 8770 },
        bufferedTime: 9750
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f expected=%{public}f', state.speed, 0.75);
      expect(state.speed).assertEqual(0.75);
      expect(state.position?.elapsedTime).assertEqual(8750);
      expect(state.position?.updateTime).assertEqual(8770);
      expect(state.bufferedTime).assertEqual(9750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0135 end');
    })
  })
}
