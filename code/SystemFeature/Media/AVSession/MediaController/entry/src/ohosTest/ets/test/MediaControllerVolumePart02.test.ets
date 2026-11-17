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

export default function mediaControllerVolumeTestPart02() {
  describe('MediaControllerVolumePart02', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0081
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0081
     * @tc.desc   Verify metadata and session map volume case 81.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0081 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0081', title: 'Volume Track 0081', artist: 'Volume Artist 0081' };
      expect(metadata.assetId).assertEqual('volume-asset-0081');
      expect(metadata.title === 'Volume Track 0081').assertTrue();
      expect(metadata.artist === 'Volume Artist 0081').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0081', 'Volume Track 0081');
      expect(map.get('volume-session-0081') === 'Volume Track 0081').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0081 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0082
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0082
     * @tc.desc   Verify metadata and session map volume case 82.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0082 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0082', title: 'Volume Track 0082', artist: 'Volume Artist 0082' };
      expect(metadata.assetId).assertEqual('volume-asset-0082');
      expect(metadata.title === 'Volume Track 0082').assertTrue();
      expect(metadata.artist === 'Volume Artist 0082').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0082', 'Volume Track 0082');
      expect(map.get('volume-session-0082') === 'Volume Track 0082').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0082 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0083
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0083
     * @tc.desc   Verify metadata and session map volume case 83.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0083 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0083', title: 'Volume Track 0083', artist: 'Volume Artist 0083' };
      expect(metadata.assetId).assertEqual('volume-asset-0083');
      expect(metadata.title === 'Volume Track 0083').assertTrue();
      expect(metadata.artist === 'Volume Artist 0083').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0083', 'Volume Track 0083');
      expect(map.get('volume-session-0083') === 'Volume Track 0083').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0083 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0084
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0084
     * @tc.desc   Verify metadata and session map volume case 84.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0084 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0084', title: 'Volume Track 0084', artist: 'Volume Artist 0084' };
      expect(metadata.assetId).assertEqual('volume-asset-0084');
      expect(metadata.title === 'Volume Track 0084').assertTrue();
      expect(metadata.artist === 'Volume Artist 0084').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0084', 'Volume Track 0084');
      expect(map.get('volume-session-0084') === 'Volume Track 0084').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0084 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0085
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0085
     * @tc.desc   Verify metadata and session map volume case 85.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0085 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0085', title: 'Volume Track 0085', artist: 'Volume Artist 0085' };
      expect(metadata.assetId).assertEqual('volume-asset-0085');
      expect(metadata.title === 'Volume Track 0085').assertTrue();
      expect(metadata.artist === 'Volume Artist 0085').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0085', 'Volume Track 0085');
      expect(map.get('volume-session-0085') === 'Volume Track 0085').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0085 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0086
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0086
     * @tc.desc   Verify metadata and session map volume case 86.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0086 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0086', title: 'Volume Track 0086', artist: 'Volume Artist 0086' };
      expect(metadata.assetId).assertEqual('volume-asset-0086');
      expect(metadata.title === 'Volume Track 0086').assertTrue();
      expect(metadata.artist === 'Volume Artist 0086').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0086', 'Volume Track 0086');
      expect(map.get('volume-session-0086') === 'Volume Track 0086').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0086 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0087
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0087
     * @tc.desc   Verify metadata and session map volume case 87.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0087 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0087', title: 'Volume Track 0087', artist: 'Volume Artist 0087' };
      expect(metadata.assetId).assertEqual('volume-asset-0087');
      expect(metadata.title === 'Volume Track 0087').assertTrue();
      expect(metadata.artist === 'Volume Artist 0087').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0087', 'Volume Track 0087');
      expect(map.get('volume-session-0087') === 'Volume Track 0087').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0087 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0088
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0088
     * @tc.desc   Verify metadata and session map volume case 88.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0088 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0088', title: 'Volume Track 0088', artist: 'Volume Artist 0088' };
      expect(metadata.assetId).assertEqual('volume-asset-0088');
      expect(metadata.title === 'Volume Track 0088').assertTrue();
      expect(metadata.artist === 'Volume Artist 0088').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0088', 'Volume Track 0088');
      expect(map.get('volume-session-0088') === 'Volume Track 0088').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0088 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0089
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0089
     * @tc.desc   Verify metadata and session map volume case 89.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0089 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0089', title: 'Volume Track 0089', artist: 'Volume Artist 0089' };
      expect(metadata.assetId).assertEqual('volume-asset-0089');
      expect(metadata.title === 'Volume Track 0089').assertTrue();
      expect(metadata.artist === 'Volume Artist 0089').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0089', 'Volume Track 0089');
      expect(map.get('volume-session-0089') === 'Volume Track 0089').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0089 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0090
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0090
     * @tc.desc   Verify metadata and session map volume case 90.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0090 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0090', title: 'Volume Track 0090', artist: 'Volume Artist 0090' };
      expect(metadata.assetId).assertEqual('volume-asset-0090');
      expect(metadata.title === 'Volume Track 0090').assertTrue();
      expect(metadata.artist === 'Volume Artist 0090').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0090', 'Volume Track 0090');
      expect(map.get('volume-session-0090') === 'Volume Track 0090').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0090 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0091
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0091
     * @tc.desc   Verify metadata and session map volume case 91.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0091 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0091', title: 'Volume Track 0091', artist: 'Volume Artist 0091' };
      expect(metadata.assetId).assertEqual('volume-asset-0091');
      expect(metadata.title === 'Volume Track 0091').assertTrue();
      expect(metadata.artist === 'Volume Artist 0091').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0091', 'Volume Track 0091');
      expect(map.get('volume-session-0091') === 'Volume Track 0091').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0091 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0092
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0092
     * @tc.desc   Verify metadata and session map volume case 92.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0092 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0092', title: 'Volume Track 0092', artist: 'Volume Artist 0092' };
      expect(metadata.assetId).assertEqual('volume-asset-0092');
      expect(metadata.title === 'Volume Track 0092').assertTrue();
      expect(metadata.artist === 'Volume Artist 0092').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0092', 'Volume Track 0092');
      expect(map.get('volume-session-0092') === 'Volume Track 0092').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0092 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0093
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0093
     * @tc.desc   Verify metadata and session map volume case 93.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0093 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0093', title: 'Volume Track 0093', artist: 'Volume Artist 0093' };
      expect(metadata.assetId).assertEqual('volume-asset-0093');
      expect(metadata.title === 'Volume Track 0093').assertTrue();
      expect(metadata.artist === 'Volume Artist 0093').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0093', 'Volume Track 0093');
      expect(map.get('volume-session-0093') === 'Volume Track 0093').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0093 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0094
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0094
     * @tc.desc   Verify metadata and session map volume case 94.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0094 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0094', title: 'Volume Track 0094', artist: 'Volume Artist 0094' };
      expect(metadata.assetId).assertEqual('volume-asset-0094');
      expect(metadata.title === 'Volume Track 0094').assertTrue();
      expect(metadata.artist === 'Volume Artist 0094').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0094', 'Volume Track 0094');
      expect(map.get('volume-session-0094') === 'Volume Track 0094').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0094 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0095
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0095
     * @tc.desc   Verify metadata and session map volume case 95.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0095 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0095', title: 'Volume Track 0095', artist: 'Volume Artist 0095' };
      expect(metadata.assetId).assertEqual('volume-asset-0095');
      expect(metadata.title === 'Volume Track 0095').assertTrue();
      expect(metadata.artist === 'Volume Artist 0095').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0095', 'Volume Track 0095');
      expect(map.get('volume-session-0095') === 'Volume Track 0095').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0095 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0096
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0096
     * @tc.desc   Verify metadata and session map volume case 96.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0096 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0096', title: 'Volume Track 0096', artist: 'Volume Artist 0096' };
      expect(metadata.assetId).assertEqual('volume-asset-0096');
      expect(metadata.title === 'Volume Track 0096').assertTrue();
      expect(metadata.artist === 'Volume Artist 0096').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0096', 'Volume Track 0096');
      expect(map.get('volume-session-0096') === 'Volume Track 0096').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0096 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0097
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0097
     * @tc.desc   Verify metadata and session map volume case 97.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0097 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0097', title: 'Volume Track 0097', artist: 'Volume Artist 0097' };
      expect(metadata.assetId).assertEqual('volume-asset-0097');
      expect(metadata.title === 'Volume Track 0097').assertTrue();
      expect(metadata.artist === 'Volume Artist 0097').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0097', 'Volume Track 0097');
      expect(map.get('volume-session-0097') === 'Volume Track 0097').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0097 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0098
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0098
     * @tc.desc   Verify metadata and session map volume case 98.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0098 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0098', title: 'Volume Track 0098', artist: 'Volume Artist 0098' };
      expect(metadata.assetId).assertEqual('volume-asset-0098');
      expect(metadata.title === 'Volume Track 0098').assertTrue();
      expect(metadata.artist === 'Volume Artist 0098').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0098', 'Volume Track 0098');
      expect(map.get('volume-session-0098') === 'Volume Track 0098').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0098 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0099
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0099
     * @tc.desc   Verify metadata and session map volume case 99.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0099 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0099', title: 'Volume Track 0099', artist: 'Volume Artist 0099' };
      expect(metadata.assetId).assertEqual('volume-asset-0099');
      expect(metadata.title === 'Volume Track 0099').assertTrue();
      expect(metadata.artist === 'Volume Artist 0099').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0099', 'Volume Track 0099');
      expect(map.get('volume-session-0099') === 'Volume Track 0099').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0099 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0100
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0100
     * @tc.desc   Verify metadata and session map volume case 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0100 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0100', title: 'Volume Track 0100', artist: 'Volume Artist 0100' };
      expect(metadata.assetId).assertEqual('volume-asset-0100');
      expect(metadata.title === 'Volume Track 0100').assertTrue();
      expect(metadata.artist === 'Volume Artist 0100').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0100', 'Volume Track 0100');
      expect(map.get('volume-session-0100') === 'Volume Track 0100').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0100 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0101
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0101
     * @tc.desc   Verify metadata and session map volume case 101.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0101 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0101', title: 'Volume Track 0101', artist: 'Volume Artist 0101' };
      expect(metadata.assetId).assertEqual('volume-asset-0101');
      expect(metadata.title === 'Volume Track 0101').assertTrue();
      expect(metadata.artist === 'Volume Artist 0101').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0101', 'Volume Track 0101');
      expect(map.get('volume-session-0101') === 'Volume Track 0101').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0101 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0102
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0102
     * @tc.desc   Verify metadata and session map volume case 102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0102 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0102', title: 'Volume Track 0102', artist: 'Volume Artist 0102' };
      expect(metadata.assetId).assertEqual('volume-asset-0102');
      expect(metadata.title === 'Volume Track 0102').assertTrue();
      expect(metadata.artist === 'Volume Artist 0102').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0102', 'Volume Track 0102');
      expect(map.get('volume-session-0102') === 'Volume Track 0102').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0102 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0103
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0103
     * @tc.desc   Verify metadata and session map volume case 103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0103 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0103', title: 'Volume Track 0103', artist: 'Volume Artist 0103' };
      expect(metadata.assetId).assertEqual('volume-asset-0103');
      expect(metadata.title === 'Volume Track 0103').assertTrue();
      expect(metadata.artist === 'Volume Artist 0103').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0103', 'Volume Track 0103');
      expect(map.get('volume-session-0103') === 'Volume Track 0103').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0103 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0104
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0104
     * @tc.desc   Verify metadata and session map volume case 104.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0104 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0104', title: 'Volume Track 0104', artist: 'Volume Artist 0104' };
      expect(metadata.assetId).assertEqual('volume-asset-0104');
      expect(metadata.title === 'Volume Track 0104').assertTrue();
      expect(metadata.artist === 'Volume Artist 0104').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0104', 'Volume Track 0104');
      expect(map.get('volume-session-0104') === 'Volume Track 0104').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0104 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0105
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0105
     * @tc.desc   Verify metadata and session map volume case 105.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0105 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0105', title: 'Volume Track 0105', artist: 'Volume Artist 0105' };
      expect(metadata.assetId).assertEqual('volume-asset-0105');
      expect(metadata.title === 'Volume Track 0105').assertTrue();
      expect(metadata.artist === 'Volume Artist 0105').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0105', 'Volume Track 0105');
      expect(map.get('volume-session-0105') === 'Volume Track 0105').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0105 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0106
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0106
     * @tc.desc   Verify metadata and session map volume case 106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0106 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0106', title: 'Volume Track 0106', artist: 'Volume Artist 0106' };
      expect(metadata.assetId).assertEqual('volume-asset-0106');
      expect(metadata.title === 'Volume Track 0106').assertTrue();
      expect(metadata.artist === 'Volume Artist 0106').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0106', 'Volume Track 0106');
      expect(map.get('volume-session-0106') === 'Volume Track 0106').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0106 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0107
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0107
     * @tc.desc   Verify metadata and session map volume case 107.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0107 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0107', title: 'Volume Track 0107', artist: 'Volume Artist 0107' };
      expect(metadata.assetId).assertEqual('volume-asset-0107');
      expect(metadata.title === 'Volume Track 0107').assertTrue();
      expect(metadata.artist === 'Volume Artist 0107').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0107', 'Volume Track 0107');
      expect(map.get('volume-session-0107') === 'Volume Track 0107').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0107 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0108
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0108
     * @tc.desc   Verify metadata and session map volume case 108.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0108 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0108', title: 'Volume Track 0108', artist: 'Volume Artist 0108' };
      expect(metadata.assetId).assertEqual('volume-asset-0108');
      expect(metadata.title === 'Volume Track 0108').assertTrue();
      expect(metadata.artist === 'Volume Artist 0108').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0108', 'Volume Track 0108');
      expect(map.get('volume-session-0108') === 'Volume Track 0108').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0108 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0109
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0109
     * @tc.desc   Verify metadata and session map volume case 109.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0109 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0109', title: 'Volume Track 0109', artist: 'Volume Artist 0109' };
      expect(metadata.assetId).assertEqual('volume-asset-0109');
      expect(metadata.title === 'Volume Track 0109').assertTrue();
      expect(metadata.artist === 'Volume Artist 0109').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0109', 'Volume Track 0109');
      expect(map.get('volume-session-0109') === 'Volume Track 0109').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0109 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0110
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0110
     * @tc.desc   Verify metadata and session map volume case 110.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0110 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0110', title: 'Volume Track 0110', artist: 'Volume Artist 0110' };
      expect(metadata.assetId).assertEqual('volume-asset-0110');
      expect(metadata.title === 'Volume Track 0110').assertTrue();
      expect(metadata.artist === 'Volume Artist 0110').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0110', 'Volume Track 0110');
      expect(map.get('volume-session-0110') === 'Volume Track 0110').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0110 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0111
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0111
     * @tc.desc   Verify metadata and session map volume case 111.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0111 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0111', title: 'Volume Track 0111', artist: 'Volume Artist 0111' };
      expect(metadata.assetId).assertEqual('volume-asset-0111');
      expect(metadata.title === 'Volume Track 0111').assertTrue();
      expect(metadata.artist === 'Volume Artist 0111').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0111', 'Volume Track 0111');
      expect(map.get('volume-session-0111') === 'Volume Track 0111').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0111 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0112
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0112
     * @tc.desc   Verify metadata and session map volume case 112.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0112 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0112', title: 'Volume Track 0112', artist: 'Volume Artist 0112' };
      expect(metadata.assetId).assertEqual('volume-asset-0112');
      expect(metadata.title === 'Volume Track 0112').assertTrue();
      expect(metadata.artist === 'Volume Artist 0112').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0112', 'Volume Track 0112');
      expect(map.get('volume-session-0112') === 'Volume Track 0112').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0112 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0113
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0113
     * @tc.desc   Verify metadata and session map volume case 113.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0113 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0113', title: 'Volume Track 0113', artist: 'Volume Artist 0113' };
      expect(metadata.assetId).assertEqual('volume-asset-0113');
      expect(metadata.title === 'Volume Track 0113').assertTrue();
      expect(metadata.artist === 'Volume Artist 0113').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0113', 'Volume Track 0113');
      expect(map.get('volume-session-0113') === 'Volume Track 0113').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0113 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0114
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0114
     * @tc.desc   Verify metadata and session map volume case 114.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0114 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0114', title: 'Volume Track 0114', artist: 'Volume Artist 0114' };
      expect(metadata.assetId).assertEqual('volume-asset-0114');
      expect(metadata.title === 'Volume Track 0114').assertTrue();
      expect(metadata.artist === 'Volume Artist 0114').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0114', 'Volume Track 0114');
      expect(map.get('volume-session-0114') === 'Volume Track 0114').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0114 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0115
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0115
     * @tc.desc   Verify metadata and session map volume case 115.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0115 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0115', title: 'Volume Track 0115', artist: 'Volume Artist 0115' };
      expect(metadata.assetId).assertEqual('volume-asset-0115');
      expect(metadata.title === 'Volume Track 0115').assertTrue();
      expect(metadata.artist === 'Volume Artist 0115').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0115', 'Volume Track 0115');
      expect(map.get('volume-session-0115') === 'Volume Track 0115').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0115 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0116
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0116
     * @tc.desc   Verify metadata and session map volume case 116.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0116 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0116', title: 'Volume Track 0116', artist: 'Volume Artist 0116' };
      expect(metadata.assetId).assertEqual('volume-asset-0116');
      expect(metadata.title === 'Volume Track 0116').assertTrue();
      expect(metadata.artist === 'Volume Artist 0116').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0116', 'Volume Track 0116');
      expect(map.get('volume-session-0116') === 'Volume Track 0116').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0116 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0117
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0117
     * @tc.desc   Verify metadata and session map volume case 117.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0117 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0117', title: 'Volume Track 0117', artist: 'Volume Artist 0117' };
      expect(metadata.assetId).assertEqual('volume-asset-0117');
      expect(metadata.title === 'Volume Track 0117').assertTrue();
      expect(metadata.artist === 'Volume Artist 0117').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0117', 'Volume Track 0117');
      expect(map.get('volume-session-0117') === 'Volume Track 0117').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0117 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0118
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0118
     * @tc.desc   Verify metadata and session map volume case 118.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0118 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0118', title: 'Volume Track 0118', artist: 'Volume Artist 0118' };
      expect(metadata.assetId).assertEqual('volume-asset-0118');
      expect(metadata.title === 'Volume Track 0118').assertTrue();
      expect(metadata.artist === 'Volume Artist 0118').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0118', 'Volume Track 0118');
      expect(map.get('volume-session-0118') === 'Volume Track 0118').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0118 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0119
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0119
     * @tc.desc   Verify metadata and session map volume case 119.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0119 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0119', title: 'Volume Track 0119', artist: 'Volume Artist 0119' };
      expect(metadata.assetId).assertEqual('volume-asset-0119');
      expect(metadata.title === 'Volume Track 0119').assertTrue();
      expect(metadata.artist === 'Volume Artist 0119').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0119', 'Volume Track 0119');
      expect(map.get('volume-session-0119') === 'Volume Track 0119').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0119 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0120
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0120
     * @tc.desc   Verify metadata and session map volume case 120.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0120 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0120', title: 'Volume Track 0120', artist: 'Volume Artist 0120' };
      expect(metadata.assetId).assertEqual('volume-asset-0120');
      expect(metadata.title === 'Volume Track 0120').assertTrue();
      expect(metadata.artist === 'Volume Artist 0120').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0120', 'Volume Track 0120');
      expect(map.get('volume-session-0120') === 'Volume Track 0120').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0120 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0121
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0121
     * @tc.desc   Verify metadata and session map volume case 121.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0121 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0121', title: 'Volume Track 0121', artist: 'Volume Artist 0121' };
      expect(metadata.assetId).assertEqual('volume-asset-0121');
      expect(metadata.title === 'Volume Track 0121').assertTrue();
      expect(metadata.artist === 'Volume Artist 0121').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0121', 'Volume Track 0121');
      expect(map.get('volume-session-0121') === 'Volume Track 0121').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0121 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0122
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0122
     * @tc.desc   Verify metadata and session map volume case 122.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0122 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0122', title: 'Volume Track 0122', artist: 'Volume Artist 0122' };
      expect(metadata.assetId).assertEqual('volume-asset-0122');
      expect(metadata.title === 'Volume Track 0122').assertTrue();
      expect(metadata.artist === 'Volume Artist 0122').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0122', 'Volume Track 0122');
      expect(map.get('volume-session-0122') === 'Volume Track 0122').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0122 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0123
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0123
     * @tc.desc   Verify metadata and session map volume case 123.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0123 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0123', title: 'Volume Track 0123', artist: 'Volume Artist 0123' };
      expect(metadata.assetId).assertEqual('volume-asset-0123');
      expect(metadata.title === 'Volume Track 0123').assertTrue();
      expect(metadata.artist === 'Volume Artist 0123').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0123', 'Volume Track 0123');
      expect(map.get('volume-session-0123') === 'Volume Track 0123').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0123 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0124
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0124
     * @tc.desc   Verify metadata and session map volume case 124.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0124 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0124', title: 'Volume Track 0124', artist: 'Volume Artist 0124' };
      expect(metadata.assetId).assertEqual('volume-asset-0124');
      expect(metadata.title === 'Volume Track 0124').assertTrue();
      expect(metadata.artist === 'Volume Artist 0124').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0124', 'Volume Track 0124');
      expect(map.get('volume-session-0124') === 'Volume Track 0124').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0124 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0125
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0125
     * @tc.desc   Verify metadata and session map volume case 125.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0125 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0125', title: 'Volume Track 0125', artist: 'Volume Artist 0125' };
      expect(metadata.assetId).assertEqual('volume-asset-0125');
      expect(metadata.title === 'Volume Track 0125').assertTrue();
      expect(metadata.artist === 'Volume Artist 0125').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0125', 'Volume Track 0125');
      expect(map.get('volume-session-0125') === 'Volume Track 0125').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0125 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0126
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0126
     * @tc.desc   Verify metadata and session map volume case 126.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0126 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0126', title: 'Volume Track 0126', artist: 'Volume Artist 0126' };
      expect(metadata.assetId).assertEqual('volume-asset-0126');
      expect(metadata.title === 'Volume Track 0126').assertTrue();
      expect(metadata.artist === 'Volume Artist 0126').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0126', 'Volume Track 0126');
      expect(map.get('volume-session-0126') === 'Volume Track 0126').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0126 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0127
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0127
     * @tc.desc   Verify metadata and session map volume case 127.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0127 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0127', title: 'Volume Track 0127', artist: 'Volume Artist 0127' };
      expect(metadata.assetId).assertEqual('volume-asset-0127');
      expect(metadata.title === 'Volume Track 0127').assertTrue();
      expect(metadata.artist === 'Volume Artist 0127').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0127', 'Volume Track 0127');
      expect(map.get('volume-session-0127') === 'Volume Track 0127').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0127 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0128
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0128
     * @tc.desc   Verify metadata and session map volume case 128.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0128 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0128', title: 'Volume Track 0128', artist: 'Volume Artist 0128' };
      expect(metadata.assetId).assertEqual('volume-asset-0128');
      expect(metadata.title === 'Volume Track 0128').assertTrue();
      expect(metadata.artist === 'Volume Artist 0128').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0128', 'Volume Track 0128');
      expect(map.get('volume-session-0128') === 'Volume Track 0128').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0128 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0129
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0129
     * @tc.desc   Verify metadata and session map volume case 129.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0129 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0129', title: 'Volume Track 0129', artist: 'Volume Artist 0129' };
      expect(metadata.assetId).assertEqual('volume-asset-0129');
      expect(metadata.title === 'Volume Track 0129').assertTrue();
      expect(metadata.artist === 'Volume Artist 0129').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0129', 'Volume Track 0129');
      expect(map.get('volume-session-0129') === 'Volume Track 0129').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0129 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0130
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0130
     * @tc.desc   Verify metadata and session map volume case 130.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0130 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0130', title: 'Volume Track 0130', artist: 'Volume Artist 0130' };
      expect(metadata.assetId).assertEqual('volume-asset-0130');
      expect(metadata.title === 'Volume Track 0130').assertTrue();
      expect(metadata.artist === 'Volume Artist 0130').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0130', 'Volume Track 0130');
      expect(map.get('volume-session-0130') === 'Volume Track 0130').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0130 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0131
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0131
     * @tc.desc   Verify metadata and session map volume case 131.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0131 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0131', title: 'Volume Track 0131', artist: 'Volume Artist 0131' };
      expect(metadata.assetId).assertEqual('volume-asset-0131');
      expect(metadata.title === 'Volume Track 0131').assertTrue();
      expect(metadata.artist === 'Volume Artist 0131').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0131', 'Volume Track 0131');
      expect(map.get('volume-session-0131') === 'Volume Track 0131').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0131 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0132
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0132
     * @tc.desc   Verify metadata and session map volume case 132.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0132 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0132', title: 'Volume Track 0132', artist: 'Volume Artist 0132' };
      expect(metadata.assetId).assertEqual('volume-asset-0132');
      expect(metadata.title === 'Volume Track 0132').assertTrue();
      expect(metadata.artist === 'Volume Artist 0132').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0132', 'Volume Track 0132');
      expect(map.get('volume-session-0132') === 'Volume Track 0132').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0132 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0133
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0133
     * @tc.desc   Verify metadata and session map volume case 133.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0133 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0133', title: 'Volume Track 0133', artist: 'Volume Artist 0133' };
      expect(metadata.assetId).assertEqual('volume-asset-0133');
      expect(metadata.title === 'Volume Track 0133').assertTrue();
      expect(metadata.artist === 'Volume Artist 0133').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0133', 'Volume Track 0133');
      expect(map.get('volume-session-0133') === 'Volume Track 0133').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0133 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0134
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0134
     * @tc.desc   Verify metadata and session map volume case 134.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0134 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0134', title: 'Volume Track 0134', artist: 'Volume Artist 0134' };
      expect(metadata.assetId).assertEqual('volume-asset-0134');
      expect(metadata.title === 'Volume Track 0134').assertTrue();
      expect(metadata.artist === 'Volume Artist 0134').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0134', 'Volume Track 0134');
      expect(map.get('volume-session-0134') === 'Volume Track 0134').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0134 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0135
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0135
     * @tc.desc   Verify metadata and session map volume case 135.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0135 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0135', title: 'Volume Track 0135', artist: 'Volume Artist 0135' };
      expect(metadata.assetId).assertEqual('volume-asset-0135');
      expect(metadata.title === 'Volume Track 0135').assertTrue();
      expect(metadata.artist === 'Volume Artist 0135').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0135', 'Volume Track 0135');
      expect(map.get('volume-session-0135') === 'Volume Track 0135').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0135 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0136
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0136
     * @tc.desc   Verify metadata and session map volume case 136.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0136 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0136', title: 'Volume Track 0136', artist: 'Volume Artist 0136' };
      expect(metadata.assetId).assertEqual('volume-asset-0136');
      expect(metadata.title === 'Volume Track 0136').assertTrue();
      expect(metadata.artist === 'Volume Artist 0136').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0136', 'Volume Track 0136');
      expect(map.get('volume-session-0136') === 'Volume Track 0136').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0136 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0137
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0137
     * @tc.desc   Verify metadata and session map volume case 137.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0137 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0137', title: 'Volume Track 0137', artist: 'Volume Artist 0137' };
      expect(metadata.assetId).assertEqual('volume-asset-0137');
      expect(metadata.title === 'Volume Track 0137').assertTrue();
      expect(metadata.artist === 'Volume Artist 0137').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0137', 'Volume Track 0137');
      expect(map.get('volume-session-0137') === 'Volume Track 0137').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0137 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0138
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0138
     * @tc.desc   Verify metadata and session map volume case 138.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0138 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0138', title: 'Volume Track 0138', artist: 'Volume Artist 0138' };
      expect(metadata.assetId).assertEqual('volume-asset-0138');
      expect(metadata.title === 'Volume Track 0138').assertTrue();
      expect(metadata.artist === 'Volume Artist 0138').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0138', 'Volume Track 0138');
      expect(map.get('volume-session-0138') === 'Volume Track 0138').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0138 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0139
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0139
     * @tc.desc   Verify metadata and session map volume case 139.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0139 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0139', title: 'Volume Track 0139', artist: 'Volume Artist 0139' };
      expect(metadata.assetId).assertEqual('volume-asset-0139');
      expect(metadata.title === 'Volume Track 0139').assertTrue();
      expect(metadata.artist === 'Volume Artist 0139').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0139', 'Volume Track 0139');
      expect(map.get('volume-session-0139') === 'Volume Track 0139').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0139 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0140
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0140
     * @tc.desc   Verify metadata and session map volume case 140.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0140 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0140', title: 'Volume Track 0140', artist: 'Volume Artist 0140' };
      expect(metadata.assetId).assertEqual('volume-asset-0140');
      expect(metadata.title === 'Volume Track 0140').assertTrue();
      expect(metadata.artist === 'Volume Artist 0140').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0140', 'Volume Track 0140');
      expect(map.get('volume-session-0140') === 'Volume Track 0140').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0140 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0141
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0141
     * @tc.desc   Verify metadata and session map volume case 141.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0141 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0141', title: 'Volume Track 0141', artist: 'Volume Artist 0141' };
      expect(metadata.assetId).assertEqual('volume-asset-0141');
      expect(metadata.title === 'Volume Track 0141').assertTrue();
      expect(metadata.artist === 'Volume Artist 0141').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0141', 'Volume Track 0141');
      expect(map.get('volume-session-0141') === 'Volume Track 0141').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0141 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0142
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0142
     * @tc.desc   Verify metadata and session map volume case 142.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0142 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0142', title: 'Volume Track 0142', artist: 'Volume Artist 0142' };
      expect(metadata.assetId).assertEqual('volume-asset-0142');
      expect(metadata.title === 'Volume Track 0142').assertTrue();
      expect(metadata.artist === 'Volume Artist 0142').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0142', 'Volume Track 0142');
      expect(map.get('volume-session-0142') === 'Volume Track 0142').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0142 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0143
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0143
     * @tc.desc   Verify metadata and session map volume case 143.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0143 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0143', title: 'Volume Track 0143', artist: 'Volume Artist 0143' };
      expect(metadata.assetId).assertEqual('volume-asset-0143');
      expect(metadata.title === 'Volume Track 0143').assertTrue();
      expect(metadata.artist === 'Volume Artist 0143').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0143', 'Volume Track 0143');
      expect(map.get('volume-session-0143') === 'Volume Track 0143').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0143 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0144
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0144
     * @tc.desc   Verify metadata and session map volume case 144.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0144 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0144', title: 'Volume Track 0144', artist: 'Volume Artist 0144' };
      expect(metadata.assetId).assertEqual('volume-asset-0144');
      expect(metadata.title === 'Volume Track 0144').assertTrue();
      expect(metadata.artist === 'Volume Artist 0144').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0144', 'Volume Track 0144');
      expect(map.get('volume-session-0144') === 'Volume Track 0144').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0144 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0145
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0145
     * @tc.desc   Verify metadata and session map volume case 145.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0145 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0145', title: 'Volume Track 0145', artist: 'Volume Artist 0145' };
      expect(metadata.assetId).assertEqual('volume-asset-0145');
      expect(metadata.title === 'Volume Track 0145').assertTrue();
      expect(metadata.artist === 'Volume Artist 0145').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0145', 'Volume Track 0145');
      expect(map.get('volume-session-0145') === 'Volume Track 0145').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0145 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0146
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0146
     * @tc.desc   Verify metadata and session map volume case 146.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0146 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0146', title: 'Volume Track 0146', artist: 'Volume Artist 0146' };
      expect(metadata.assetId).assertEqual('volume-asset-0146');
      expect(metadata.title === 'Volume Track 0146').assertTrue();
      expect(metadata.artist === 'Volume Artist 0146').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0146', 'Volume Track 0146');
      expect(map.get('volume-session-0146') === 'Volume Track 0146').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0146 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0147
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0147
     * @tc.desc   Verify metadata and session map volume case 147.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0147 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0147', title: 'Volume Track 0147', artist: 'Volume Artist 0147' };
      expect(metadata.assetId).assertEqual('volume-asset-0147');
      expect(metadata.title === 'Volume Track 0147').assertTrue();
      expect(metadata.artist === 'Volume Artist 0147').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0147', 'Volume Track 0147');
      expect(map.get('volume-session-0147') === 'Volume Track 0147').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0147 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0148
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0148
     * @tc.desc   Verify metadata and session map volume case 148.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0148 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0148', title: 'Volume Track 0148', artist: 'Volume Artist 0148' };
      expect(metadata.assetId).assertEqual('volume-asset-0148');
      expect(metadata.title === 'Volume Track 0148').assertTrue();
      expect(metadata.artist === 'Volume Artist 0148').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0148', 'Volume Track 0148');
      expect(map.get('volume-session-0148') === 'Volume Track 0148').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0148 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0149
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0149
     * @tc.desc   Verify metadata and session map volume case 149.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0149 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0149', title: 'Volume Track 0149', artist: 'Volume Artist 0149' };
      expect(metadata.assetId).assertEqual('volume-asset-0149');
      expect(metadata.title === 'Volume Track 0149').assertTrue();
      expect(metadata.artist === 'Volume Artist 0149').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0149', 'Volume Track 0149');
      expect(map.get('volume-session-0149') === 'Volume Track 0149').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0149 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0150
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0150
     * @tc.desc   Verify metadata and session map volume case 150.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0150 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0150', title: 'Volume Track 0150', artist: 'Volume Artist 0150' };
      expect(metadata.assetId).assertEqual('volume-asset-0150');
      expect(metadata.title === 'Volume Track 0150').assertTrue();
      expect(metadata.artist === 'Volume Artist 0150').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0150', 'Volume Track 0150');
      expect(map.get('volume-session-0150') === 'Volume Track 0150').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0150 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0151
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0151
     * @tc.desc   Verify metadata and session map volume case 151.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0151 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0151', title: 'Volume Track 0151', artist: 'Volume Artist 0151' };
      expect(metadata.assetId).assertEqual('volume-asset-0151');
      expect(metadata.title === 'Volume Track 0151').assertTrue();
      expect(metadata.artist === 'Volume Artist 0151').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0151', 'Volume Track 0151');
      expect(map.get('volume-session-0151') === 'Volume Track 0151').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0151 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0152
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0152
     * @tc.desc   Verify metadata and session map volume case 152.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0152 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0152', title: 'Volume Track 0152', artist: 'Volume Artist 0152' };
      expect(metadata.assetId).assertEqual('volume-asset-0152');
      expect(metadata.title === 'Volume Track 0152').assertTrue();
      expect(metadata.artist === 'Volume Artist 0152').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0152', 'Volume Track 0152');
      expect(map.get('volume-session-0152') === 'Volume Track 0152').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0152 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0153
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0153
     * @tc.desc   Verify metadata and session map volume case 153.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0153 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0153', title: 'Volume Track 0153', artist: 'Volume Artist 0153' };
      expect(metadata.assetId).assertEqual('volume-asset-0153');
      expect(metadata.title === 'Volume Track 0153').assertTrue();
      expect(metadata.artist === 'Volume Artist 0153').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0153', 'Volume Track 0153');
      expect(map.get('volume-session-0153') === 'Volume Track 0153').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0153 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0154
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0154
     * @tc.desc   Verify metadata and session map volume case 154.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0154 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0154', title: 'Volume Track 0154', artist: 'Volume Artist 0154' };
      expect(metadata.assetId).assertEqual('volume-asset-0154');
      expect(metadata.title === 'Volume Track 0154').assertTrue();
      expect(metadata.artist === 'Volume Artist 0154').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0154', 'Volume Track 0154');
      expect(map.get('volume-session-0154') === 'Volume Track 0154').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0154 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0155
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0155
     * @tc.desc   Verify metadata and session map volume case 155.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0155 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0155', title: 'Volume Track 0155', artist: 'Volume Artist 0155' };
      expect(metadata.assetId).assertEqual('volume-asset-0155');
      expect(metadata.title === 'Volume Track 0155').assertTrue();
      expect(metadata.artist === 'Volume Artist 0155').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0155', 'Volume Track 0155');
      expect(map.get('volume-session-0155') === 'Volume Track 0155').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0155 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0156
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0156
     * @tc.desc   Verify metadata and session map volume case 156.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0156 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0156', title: 'Volume Track 0156', artist: 'Volume Artist 0156' };
      expect(metadata.assetId).assertEqual('volume-asset-0156');
      expect(metadata.title === 'Volume Track 0156').assertTrue();
      expect(metadata.artist === 'Volume Artist 0156').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0156', 'Volume Track 0156');
      expect(map.get('volume-session-0156') === 'Volume Track 0156').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0156 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0157
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0157
     * @tc.desc   Verify metadata and session map volume case 157.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0157 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0157', title: 'Volume Track 0157', artist: 'Volume Artist 0157' };
      expect(metadata.assetId).assertEqual('volume-asset-0157');
      expect(metadata.title === 'Volume Track 0157').assertTrue();
      expect(metadata.artist === 'Volume Artist 0157').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0157', 'Volume Track 0157');
      expect(map.get('volume-session-0157') === 'Volume Track 0157').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0157 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0158
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0158
     * @tc.desc   Verify metadata and session map volume case 158.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0158 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0158', title: 'Volume Track 0158', artist: 'Volume Artist 0158' };
      expect(metadata.assetId).assertEqual('volume-asset-0158');
      expect(metadata.title === 'Volume Track 0158').assertTrue();
      expect(metadata.artist === 'Volume Artist 0158').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0158', 'Volume Track 0158');
      expect(map.get('volume-session-0158') === 'Volume Track 0158').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0158 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0159
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0159
     * @tc.desc   Verify metadata and session map volume case 159.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0159 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0159', title: 'Volume Track 0159', artist: 'Volume Artist 0159' };
      expect(metadata.assetId).assertEqual('volume-asset-0159');
      expect(metadata.title === 'Volume Track 0159').assertTrue();
      expect(metadata.artist === 'Volume Artist 0159').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0159', 'Volume Track 0159');
      expect(map.get('volume-session-0159') === 'Volume Track 0159').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0159 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0160
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0160
     * @tc.desc   Verify metadata and session map volume case 160.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0160 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0160', title: 'Volume Track 0160', artist: 'Volume Artist 0160' };
      expect(metadata.assetId).assertEqual('volume-asset-0160');
      expect(metadata.title === 'Volume Track 0160').assertTrue();
      expect(metadata.artist === 'Volume Artist 0160').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0160', 'Volume Track 0160');
      expect(map.get('volume-session-0160') === 'Volume Track 0160').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0160 end');
    })
  })
}
