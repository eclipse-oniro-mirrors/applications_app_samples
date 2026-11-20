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

export default function mediaControllerVolumeTestPart01() {
  describe('MediaControllerVolumePart01', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0001
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0001
     * @tc.desc   Verify metadata and session map volume case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0001 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0001', title: 'Volume Track 0001', artist: 'Volume Artist 0001' };
      expect(metadata.assetId).assertEqual('volume-asset-0001');
      expect(metadata.title === 'Volume Track 0001').assertTrue();
      expect(metadata.artist === 'Volume Artist 0001').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0001', 'Volume Track 0001');
      expect(map.get('volume-session-0001') === 'Volume Track 0001').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0001 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0002
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0002
     * @tc.desc   Verify metadata and session map volume case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0002 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0002', title: 'Volume Track 0002', artist: 'Volume Artist 0002' };
      expect(metadata.assetId).assertEqual('volume-asset-0002');
      expect(metadata.title === 'Volume Track 0002').assertTrue();
      expect(metadata.artist === 'Volume Artist 0002').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0002', 'Volume Track 0002');
      expect(map.get('volume-session-0002') === 'Volume Track 0002').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0002 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0003
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0003
     * @tc.desc   Verify metadata and session map volume case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0003 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0003', title: 'Volume Track 0003', artist: 'Volume Artist 0003' };
      expect(metadata.assetId).assertEqual('volume-asset-0003');
      expect(metadata.title === 'Volume Track 0003').assertTrue();
      expect(metadata.artist === 'Volume Artist 0003').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0003', 'Volume Track 0003');
      expect(map.get('volume-session-0003') === 'Volume Track 0003').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0003 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0004
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0004
     * @tc.desc   Verify metadata and session map volume case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0004 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0004', title: 'Volume Track 0004', artist: 'Volume Artist 0004' };
      expect(metadata.assetId).assertEqual('volume-asset-0004');
      expect(metadata.title === 'Volume Track 0004').assertTrue();
      expect(metadata.artist === 'Volume Artist 0004').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0004', 'Volume Track 0004');
      expect(map.get('volume-session-0004') === 'Volume Track 0004').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0004 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0005
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0005
     * @tc.desc   Verify metadata and session map volume case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0005 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0005', title: 'Volume Track 0005', artist: 'Volume Artist 0005' };
      expect(metadata.assetId).assertEqual('volume-asset-0005');
      expect(metadata.title === 'Volume Track 0005').assertTrue();
      expect(metadata.artist === 'Volume Artist 0005').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0005', 'Volume Track 0005');
      expect(map.get('volume-session-0005') === 'Volume Track 0005').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0005 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0006
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0006
     * @tc.desc   Verify metadata and session map volume case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0006 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0006', title: 'Volume Track 0006', artist: 'Volume Artist 0006' };
      expect(metadata.assetId).assertEqual('volume-asset-0006');
      expect(metadata.title === 'Volume Track 0006').assertTrue();
      expect(metadata.artist === 'Volume Artist 0006').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0006', 'Volume Track 0006');
      expect(map.get('volume-session-0006') === 'Volume Track 0006').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0006 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0007
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0007
     * @tc.desc   Verify metadata and session map volume case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0007 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0007', title: 'Volume Track 0007', artist: 'Volume Artist 0007' };
      expect(metadata.assetId).assertEqual('volume-asset-0007');
      expect(metadata.title === 'Volume Track 0007').assertTrue();
      expect(metadata.artist === 'Volume Artist 0007').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0007', 'Volume Track 0007');
      expect(map.get('volume-session-0007') === 'Volume Track 0007').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0007 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0008
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0008
     * @tc.desc   Verify metadata and session map volume case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0008 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0008', title: 'Volume Track 0008', artist: 'Volume Artist 0008' };
      expect(metadata.assetId).assertEqual('volume-asset-0008');
      expect(metadata.title === 'Volume Track 0008').assertTrue();
      expect(metadata.artist === 'Volume Artist 0008').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0008', 'Volume Track 0008');
      expect(map.get('volume-session-0008') === 'Volume Track 0008').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0008 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0009
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0009
     * @tc.desc   Verify metadata and session map volume case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0009 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0009', title: 'Volume Track 0009', artist: 'Volume Artist 0009' };
      expect(metadata.assetId).assertEqual('volume-asset-0009');
      expect(metadata.title === 'Volume Track 0009').assertTrue();
      expect(metadata.artist === 'Volume Artist 0009').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0009', 'Volume Track 0009');
      expect(map.get('volume-session-0009') === 'Volume Track 0009').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0009 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0010
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0010
     * @tc.desc   Verify metadata and session map volume case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0010 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0010', title: 'Volume Track 0010', artist: 'Volume Artist 0010' };
      expect(metadata.assetId).assertEqual('volume-asset-0010');
      expect(metadata.title === 'Volume Track 0010').assertTrue();
      expect(metadata.artist === 'Volume Artist 0010').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0010', 'Volume Track 0010');
      expect(map.get('volume-session-0010') === 'Volume Track 0010').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0010 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0011
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0011
     * @tc.desc   Verify metadata and session map volume case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0011 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0011', title: 'Volume Track 0011', artist: 'Volume Artist 0011' };
      expect(metadata.assetId).assertEqual('volume-asset-0011');
      expect(metadata.title === 'Volume Track 0011').assertTrue();
      expect(metadata.artist === 'Volume Artist 0011').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0011', 'Volume Track 0011');
      expect(map.get('volume-session-0011') === 'Volume Track 0011').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0011 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0012
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0012
     * @tc.desc   Verify metadata and session map volume case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0012 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0012', title: 'Volume Track 0012', artist: 'Volume Artist 0012' };
      expect(metadata.assetId).assertEqual('volume-asset-0012');
      expect(metadata.title === 'Volume Track 0012').assertTrue();
      expect(metadata.artist === 'Volume Artist 0012').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0012', 'Volume Track 0012');
      expect(map.get('volume-session-0012') === 'Volume Track 0012').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0012 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0013
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0013
     * @tc.desc   Verify metadata and session map volume case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0013 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0013', title: 'Volume Track 0013', artist: 'Volume Artist 0013' };
      expect(metadata.assetId).assertEqual('volume-asset-0013');
      expect(metadata.title === 'Volume Track 0013').assertTrue();
      expect(metadata.artist === 'Volume Artist 0013').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0013', 'Volume Track 0013');
      expect(map.get('volume-session-0013') === 'Volume Track 0013').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0013 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0014
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0014
     * @tc.desc   Verify metadata and session map volume case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0014 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0014', title: 'Volume Track 0014', artist: 'Volume Artist 0014' };
      expect(metadata.assetId).assertEqual('volume-asset-0014');
      expect(metadata.title === 'Volume Track 0014').assertTrue();
      expect(metadata.artist === 'Volume Artist 0014').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0014', 'Volume Track 0014');
      expect(map.get('volume-session-0014') === 'Volume Track 0014').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0014 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0015
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0015
     * @tc.desc   Verify metadata and session map volume case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0015 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0015', title: 'Volume Track 0015', artist: 'Volume Artist 0015' };
      expect(metadata.assetId).assertEqual('volume-asset-0015');
      expect(metadata.title === 'Volume Track 0015').assertTrue();
      expect(metadata.artist === 'Volume Artist 0015').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0015', 'Volume Track 0015');
      expect(map.get('volume-session-0015') === 'Volume Track 0015').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0015 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0016
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0016
     * @tc.desc   Verify metadata and session map volume case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0016 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0016', title: 'Volume Track 0016', artist: 'Volume Artist 0016' };
      expect(metadata.assetId).assertEqual('volume-asset-0016');
      expect(metadata.title === 'Volume Track 0016').assertTrue();
      expect(metadata.artist === 'Volume Artist 0016').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0016', 'Volume Track 0016');
      expect(map.get('volume-session-0016') === 'Volume Track 0016').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0016 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0017
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0017
     * @tc.desc   Verify metadata and session map volume case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0017 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0017', title: 'Volume Track 0017', artist: 'Volume Artist 0017' };
      expect(metadata.assetId).assertEqual('volume-asset-0017');
      expect(metadata.title === 'Volume Track 0017').assertTrue();
      expect(metadata.artist === 'Volume Artist 0017').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0017', 'Volume Track 0017');
      expect(map.get('volume-session-0017') === 'Volume Track 0017').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0017 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0018
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0018
     * @tc.desc   Verify metadata and session map volume case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0018 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0018', title: 'Volume Track 0018', artist: 'Volume Artist 0018' };
      expect(metadata.assetId).assertEqual('volume-asset-0018');
      expect(metadata.title === 'Volume Track 0018').assertTrue();
      expect(metadata.artist === 'Volume Artist 0018').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0018', 'Volume Track 0018');
      expect(map.get('volume-session-0018') === 'Volume Track 0018').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0018 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0019
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0019
     * @tc.desc   Verify metadata and session map volume case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0019 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0019', title: 'Volume Track 0019', artist: 'Volume Artist 0019' };
      expect(metadata.assetId).assertEqual('volume-asset-0019');
      expect(metadata.title === 'Volume Track 0019').assertTrue();
      expect(metadata.artist === 'Volume Artist 0019').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0019', 'Volume Track 0019');
      expect(map.get('volume-session-0019') === 'Volume Track 0019').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0019 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0020
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0020
     * @tc.desc   Verify metadata and session map volume case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0020 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0020', title: 'Volume Track 0020', artist: 'Volume Artist 0020' };
      expect(metadata.assetId).assertEqual('volume-asset-0020');
      expect(metadata.title === 'Volume Track 0020').assertTrue();
      expect(metadata.artist === 'Volume Artist 0020').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0020', 'Volume Track 0020');
      expect(map.get('volume-session-0020') === 'Volume Track 0020').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0020 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0021
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0021
     * @tc.desc   Verify metadata and session map volume case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0021 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0021', title: 'Volume Track 0021', artist: 'Volume Artist 0021' };
      expect(metadata.assetId).assertEqual('volume-asset-0021');
      expect(metadata.title === 'Volume Track 0021').assertTrue();
      expect(metadata.artist === 'Volume Artist 0021').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0021', 'Volume Track 0021');
      expect(map.get('volume-session-0021') === 'Volume Track 0021').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0021 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0022
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0022
     * @tc.desc   Verify metadata and session map volume case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0022 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0022', title: 'Volume Track 0022', artist: 'Volume Artist 0022' };
      expect(metadata.assetId).assertEqual('volume-asset-0022');
      expect(metadata.title === 'Volume Track 0022').assertTrue();
      expect(metadata.artist === 'Volume Artist 0022').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0022', 'Volume Track 0022');
      expect(map.get('volume-session-0022') === 'Volume Track 0022').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0022 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0023
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0023
     * @tc.desc   Verify metadata and session map volume case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0023 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0023', title: 'Volume Track 0023', artist: 'Volume Artist 0023' };
      expect(metadata.assetId).assertEqual('volume-asset-0023');
      expect(metadata.title === 'Volume Track 0023').assertTrue();
      expect(metadata.artist === 'Volume Artist 0023').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0023', 'Volume Track 0023');
      expect(map.get('volume-session-0023') === 'Volume Track 0023').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0023 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0024
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0024
     * @tc.desc   Verify metadata and session map volume case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0024 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0024', title: 'Volume Track 0024', artist: 'Volume Artist 0024' };
      expect(metadata.assetId).assertEqual('volume-asset-0024');
      expect(metadata.title === 'Volume Track 0024').assertTrue();
      expect(metadata.artist === 'Volume Artist 0024').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0024', 'Volume Track 0024');
      expect(map.get('volume-session-0024') === 'Volume Track 0024').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0024 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0025
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0025
     * @tc.desc   Verify metadata and session map volume case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0025 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0025', title: 'Volume Track 0025', artist: 'Volume Artist 0025' };
      expect(metadata.assetId).assertEqual('volume-asset-0025');
      expect(metadata.title === 'Volume Track 0025').assertTrue();
      expect(metadata.artist === 'Volume Artist 0025').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0025', 'Volume Track 0025');
      expect(map.get('volume-session-0025') === 'Volume Track 0025').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0025 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0026
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0026
     * @tc.desc   Verify metadata and session map volume case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0026 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0026', title: 'Volume Track 0026', artist: 'Volume Artist 0026' };
      expect(metadata.assetId).assertEqual('volume-asset-0026');
      expect(metadata.title === 'Volume Track 0026').assertTrue();
      expect(metadata.artist === 'Volume Artist 0026').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0026', 'Volume Track 0026');
      expect(map.get('volume-session-0026') === 'Volume Track 0026').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0026 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0027
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0027
     * @tc.desc   Verify metadata and session map volume case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0027 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0027', title: 'Volume Track 0027', artist: 'Volume Artist 0027' };
      expect(metadata.assetId).assertEqual('volume-asset-0027');
      expect(metadata.title === 'Volume Track 0027').assertTrue();
      expect(metadata.artist === 'Volume Artist 0027').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0027', 'Volume Track 0027');
      expect(map.get('volume-session-0027') === 'Volume Track 0027').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0027 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0028
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0028
     * @tc.desc   Verify metadata and session map volume case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0028 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0028', title: 'Volume Track 0028', artist: 'Volume Artist 0028' };
      expect(metadata.assetId).assertEqual('volume-asset-0028');
      expect(metadata.title === 'Volume Track 0028').assertTrue();
      expect(metadata.artist === 'Volume Artist 0028').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0028', 'Volume Track 0028');
      expect(map.get('volume-session-0028') === 'Volume Track 0028').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0028 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0029
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0029
     * @tc.desc   Verify metadata and session map volume case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0029 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0029', title: 'Volume Track 0029', artist: 'Volume Artist 0029' };
      expect(metadata.assetId).assertEqual('volume-asset-0029');
      expect(metadata.title === 'Volume Track 0029').assertTrue();
      expect(metadata.artist === 'Volume Artist 0029').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0029', 'Volume Track 0029');
      expect(map.get('volume-session-0029') === 'Volume Track 0029').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0029 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0030
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0030
     * @tc.desc   Verify metadata and session map volume case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0030 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0030', title: 'Volume Track 0030', artist: 'Volume Artist 0030' };
      expect(metadata.assetId).assertEqual('volume-asset-0030');
      expect(metadata.title === 'Volume Track 0030').assertTrue();
      expect(metadata.artist === 'Volume Artist 0030').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0030', 'Volume Track 0030');
      expect(map.get('volume-session-0030') === 'Volume Track 0030').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0030 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0031
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0031
     * @tc.desc   Verify metadata and session map volume case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0031 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0031', title: 'Volume Track 0031', artist: 'Volume Artist 0031' };
      expect(metadata.assetId).assertEqual('volume-asset-0031');
      expect(metadata.title === 'Volume Track 0031').assertTrue();
      expect(metadata.artist === 'Volume Artist 0031').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0031', 'Volume Track 0031');
      expect(map.get('volume-session-0031') === 'Volume Track 0031').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0031 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0032
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0032
     * @tc.desc   Verify metadata and session map volume case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0032 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0032', title: 'Volume Track 0032', artist: 'Volume Artist 0032' };
      expect(metadata.assetId).assertEqual('volume-asset-0032');
      expect(metadata.title === 'Volume Track 0032').assertTrue();
      expect(metadata.artist === 'Volume Artist 0032').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0032', 'Volume Track 0032');
      expect(map.get('volume-session-0032') === 'Volume Track 0032').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0032 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0033
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0033
     * @tc.desc   Verify metadata and session map volume case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0033 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0033', title: 'Volume Track 0033', artist: 'Volume Artist 0033' };
      expect(metadata.assetId).assertEqual('volume-asset-0033');
      expect(metadata.title === 'Volume Track 0033').assertTrue();
      expect(metadata.artist === 'Volume Artist 0033').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0033', 'Volume Track 0033');
      expect(map.get('volume-session-0033') === 'Volume Track 0033').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0033 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0034
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0034
     * @tc.desc   Verify metadata and session map volume case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0034 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0034', title: 'Volume Track 0034', artist: 'Volume Artist 0034' };
      expect(metadata.assetId).assertEqual('volume-asset-0034');
      expect(metadata.title === 'Volume Track 0034').assertTrue();
      expect(metadata.artist === 'Volume Artist 0034').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0034', 'Volume Track 0034');
      expect(map.get('volume-session-0034') === 'Volume Track 0034').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0034 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0035
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0035
     * @tc.desc   Verify metadata and session map volume case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0035 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0035', title: 'Volume Track 0035', artist: 'Volume Artist 0035' };
      expect(metadata.assetId).assertEqual('volume-asset-0035');
      expect(metadata.title === 'Volume Track 0035').assertTrue();
      expect(metadata.artist === 'Volume Artist 0035').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0035', 'Volume Track 0035');
      expect(map.get('volume-session-0035') === 'Volume Track 0035').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0035 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0036
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0036
     * @tc.desc   Verify metadata and session map volume case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0036 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0036', title: 'Volume Track 0036', artist: 'Volume Artist 0036' };
      expect(metadata.assetId).assertEqual('volume-asset-0036');
      expect(metadata.title === 'Volume Track 0036').assertTrue();
      expect(metadata.artist === 'Volume Artist 0036').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0036', 'Volume Track 0036');
      expect(map.get('volume-session-0036') === 'Volume Track 0036').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0036 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0037
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0037
     * @tc.desc   Verify metadata and session map volume case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0037 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0037', title: 'Volume Track 0037', artist: 'Volume Artist 0037' };
      expect(metadata.assetId).assertEqual('volume-asset-0037');
      expect(metadata.title === 'Volume Track 0037').assertTrue();
      expect(metadata.artist === 'Volume Artist 0037').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0037', 'Volume Track 0037');
      expect(map.get('volume-session-0037') === 'Volume Track 0037').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0037 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0038
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0038
     * @tc.desc   Verify metadata and session map volume case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0038 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0038', title: 'Volume Track 0038', artist: 'Volume Artist 0038' };
      expect(metadata.assetId).assertEqual('volume-asset-0038');
      expect(metadata.title === 'Volume Track 0038').assertTrue();
      expect(metadata.artist === 'Volume Artist 0038').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0038', 'Volume Track 0038');
      expect(map.get('volume-session-0038') === 'Volume Track 0038').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0038 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0039
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0039
     * @tc.desc   Verify metadata and session map volume case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0039 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0039', title: 'Volume Track 0039', artist: 'Volume Artist 0039' };
      expect(metadata.assetId).assertEqual('volume-asset-0039');
      expect(metadata.title === 'Volume Track 0039').assertTrue();
      expect(metadata.artist === 'Volume Artist 0039').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0039', 'Volume Track 0039');
      expect(map.get('volume-session-0039') === 'Volume Track 0039').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0039 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0040
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0040
     * @tc.desc   Verify metadata and session map volume case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0040 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0040', title: 'Volume Track 0040', artist: 'Volume Artist 0040' };
      expect(metadata.assetId).assertEqual('volume-asset-0040');
      expect(metadata.title === 'Volume Track 0040').assertTrue();
      expect(metadata.artist === 'Volume Artist 0040').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0040', 'Volume Track 0040');
      expect(map.get('volume-session-0040') === 'Volume Track 0040').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0040 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0041
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0041
     * @tc.desc   Verify metadata and session map volume case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0041 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0041', title: 'Volume Track 0041', artist: 'Volume Artist 0041' };
      expect(metadata.assetId).assertEqual('volume-asset-0041');
      expect(metadata.title === 'Volume Track 0041').assertTrue();
      expect(metadata.artist === 'Volume Artist 0041').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0041', 'Volume Track 0041');
      expect(map.get('volume-session-0041') === 'Volume Track 0041').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0041 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0042
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0042
     * @tc.desc   Verify metadata and session map volume case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0042 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0042', title: 'Volume Track 0042', artist: 'Volume Artist 0042' };
      expect(metadata.assetId).assertEqual('volume-asset-0042');
      expect(metadata.title === 'Volume Track 0042').assertTrue();
      expect(metadata.artist === 'Volume Artist 0042').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0042', 'Volume Track 0042');
      expect(map.get('volume-session-0042') === 'Volume Track 0042').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0042 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0043
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0043
     * @tc.desc   Verify metadata and session map volume case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0043 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0043', title: 'Volume Track 0043', artist: 'Volume Artist 0043' };
      expect(metadata.assetId).assertEqual('volume-asset-0043');
      expect(metadata.title === 'Volume Track 0043').assertTrue();
      expect(metadata.artist === 'Volume Artist 0043').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0043', 'Volume Track 0043');
      expect(map.get('volume-session-0043') === 'Volume Track 0043').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0043 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0044
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0044
     * @tc.desc   Verify metadata and session map volume case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0044 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0044', title: 'Volume Track 0044', artist: 'Volume Artist 0044' };
      expect(metadata.assetId).assertEqual('volume-asset-0044');
      expect(metadata.title === 'Volume Track 0044').assertTrue();
      expect(metadata.artist === 'Volume Artist 0044').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0044', 'Volume Track 0044');
      expect(map.get('volume-session-0044') === 'Volume Track 0044').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0044 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0045
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0045
     * @tc.desc   Verify metadata and session map volume case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0045 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0045', title: 'Volume Track 0045', artist: 'Volume Artist 0045' };
      expect(metadata.assetId).assertEqual('volume-asset-0045');
      expect(metadata.title === 'Volume Track 0045').assertTrue();
      expect(metadata.artist === 'Volume Artist 0045').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0045', 'Volume Track 0045');
      expect(map.get('volume-session-0045') === 'Volume Track 0045').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0045 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0046
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0046
     * @tc.desc   Verify metadata and session map volume case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0046 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0046', title: 'Volume Track 0046', artist: 'Volume Artist 0046' };
      expect(metadata.assetId).assertEqual('volume-asset-0046');
      expect(metadata.title === 'Volume Track 0046').assertTrue();
      expect(metadata.artist === 'Volume Artist 0046').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0046', 'Volume Track 0046');
      expect(map.get('volume-session-0046') === 'Volume Track 0046').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0046 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0047
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0047
     * @tc.desc   Verify metadata and session map volume case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0047 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0047', title: 'Volume Track 0047', artist: 'Volume Artist 0047' };
      expect(metadata.assetId).assertEqual('volume-asset-0047');
      expect(metadata.title === 'Volume Track 0047').assertTrue();
      expect(metadata.artist === 'Volume Artist 0047').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0047', 'Volume Track 0047');
      expect(map.get('volume-session-0047') === 'Volume Track 0047').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0047 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0048
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0048
     * @tc.desc   Verify metadata and session map volume case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0048 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0048', title: 'Volume Track 0048', artist: 'Volume Artist 0048' };
      expect(metadata.assetId).assertEqual('volume-asset-0048');
      expect(metadata.title === 'Volume Track 0048').assertTrue();
      expect(metadata.artist === 'Volume Artist 0048').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0048', 'Volume Track 0048');
      expect(map.get('volume-session-0048') === 'Volume Track 0048').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0048 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0049
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0049
     * @tc.desc   Verify metadata and session map volume case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0049 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0049', title: 'Volume Track 0049', artist: 'Volume Artist 0049' };
      expect(metadata.assetId).assertEqual('volume-asset-0049');
      expect(metadata.title === 'Volume Track 0049').assertTrue();
      expect(metadata.artist === 'Volume Artist 0049').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0049', 'Volume Track 0049');
      expect(map.get('volume-session-0049') === 'Volume Track 0049').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0049 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0050
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0050
     * @tc.desc   Verify metadata and session map volume case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0050 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0050', title: 'Volume Track 0050', artist: 'Volume Artist 0050' };
      expect(metadata.assetId).assertEqual('volume-asset-0050');
      expect(metadata.title === 'Volume Track 0050').assertTrue();
      expect(metadata.artist === 'Volume Artist 0050').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0050', 'Volume Track 0050');
      expect(map.get('volume-session-0050') === 'Volume Track 0050').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0050 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0051
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0051
     * @tc.desc   Verify metadata and session map volume case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0051 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0051', title: 'Volume Track 0051', artist: 'Volume Artist 0051' };
      expect(metadata.assetId).assertEqual('volume-asset-0051');
      expect(metadata.title === 'Volume Track 0051').assertTrue();
      expect(metadata.artist === 'Volume Artist 0051').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0051', 'Volume Track 0051');
      expect(map.get('volume-session-0051') === 'Volume Track 0051').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0051 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0052
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0052
     * @tc.desc   Verify metadata and session map volume case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0052 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0052', title: 'Volume Track 0052', artist: 'Volume Artist 0052' };
      expect(metadata.assetId).assertEqual('volume-asset-0052');
      expect(metadata.title === 'Volume Track 0052').assertTrue();
      expect(metadata.artist === 'Volume Artist 0052').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0052', 'Volume Track 0052');
      expect(map.get('volume-session-0052') === 'Volume Track 0052').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0052 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0053
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0053
     * @tc.desc   Verify metadata and session map volume case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0053 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0053', title: 'Volume Track 0053', artist: 'Volume Artist 0053' };
      expect(metadata.assetId).assertEqual('volume-asset-0053');
      expect(metadata.title === 'Volume Track 0053').assertTrue();
      expect(metadata.artist === 'Volume Artist 0053').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0053', 'Volume Track 0053');
      expect(map.get('volume-session-0053') === 'Volume Track 0053').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0053 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0054
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0054
     * @tc.desc   Verify metadata and session map volume case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0054 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0054', title: 'Volume Track 0054', artist: 'Volume Artist 0054' };
      expect(metadata.assetId).assertEqual('volume-asset-0054');
      expect(metadata.title === 'Volume Track 0054').assertTrue();
      expect(metadata.artist === 'Volume Artist 0054').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0054', 'Volume Track 0054');
      expect(map.get('volume-session-0054') === 'Volume Track 0054').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0054 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0055
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0055
     * @tc.desc   Verify metadata and session map volume case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0055 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0055', title: 'Volume Track 0055', artist: 'Volume Artist 0055' };
      expect(metadata.assetId).assertEqual('volume-asset-0055');
      expect(metadata.title === 'Volume Track 0055').assertTrue();
      expect(metadata.artist === 'Volume Artist 0055').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0055', 'Volume Track 0055');
      expect(map.get('volume-session-0055') === 'Volume Track 0055').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0055 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0056
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0056
     * @tc.desc   Verify metadata and session map volume case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0056 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0056', title: 'Volume Track 0056', artist: 'Volume Artist 0056' };
      expect(metadata.assetId).assertEqual('volume-asset-0056');
      expect(metadata.title === 'Volume Track 0056').assertTrue();
      expect(metadata.artist === 'Volume Artist 0056').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0056', 'Volume Track 0056');
      expect(map.get('volume-session-0056') === 'Volume Track 0056').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0056 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0057
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0057
     * @tc.desc   Verify metadata and session map volume case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0057 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0057', title: 'Volume Track 0057', artist: 'Volume Artist 0057' };
      expect(metadata.assetId).assertEqual('volume-asset-0057');
      expect(metadata.title === 'Volume Track 0057').assertTrue();
      expect(metadata.artist === 'Volume Artist 0057').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0057', 'Volume Track 0057');
      expect(map.get('volume-session-0057') === 'Volume Track 0057').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0057 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0058
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0058
     * @tc.desc   Verify metadata and session map volume case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0058 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0058', title: 'Volume Track 0058', artist: 'Volume Artist 0058' };
      expect(metadata.assetId).assertEqual('volume-asset-0058');
      expect(metadata.title === 'Volume Track 0058').assertTrue();
      expect(metadata.artist === 'Volume Artist 0058').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0058', 'Volume Track 0058');
      expect(map.get('volume-session-0058') === 'Volume Track 0058').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0058 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0059
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0059
     * @tc.desc   Verify metadata and session map volume case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0059 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0059', title: 'Volume Track 0059', artist: 'Volume Artist 0059' };
      expect(metadata.assetId).assertEqual('volume-asset-0059');
      expect(metadata.title === 'Volume Track 0059').assertTrue();
      expect(metadata.artist === 'Volume Artist 0059').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0059', 'Volume Track 0059');
      expect(map.get('volume-session-0059') === 'Volume Track 0059').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0059 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0060
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0060
     * @tc.desc   Verify metadata and session map volume case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0060 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0060', title: 'Volume Track 0060', artist: 'Volume Artist 0060' };
      expect(metadata.assetId).assertEqual('volume-asset-0060');
      expect(metadata.title === 'Volume Track 0060').assertTrue();
      expect(metadata.artist === 'Volume Artist 0060').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0060', 'Volume Track 0060');
      expect(map.get('volume-session-0060') === 'Volume Track 0060').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0060 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0061
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0061
     * @tc.desc   Verify metadata and session map volume case 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0061 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0061', title: 'Volume Track 0061', artist: 'Volume Artist 0061' };
      expect(metadata.assetId).assertEqual('volume-asset-0061');
      expect(metadata.title === 'Volume Track 0061').assertTrue();
      expect(metadata.artist === 'Volume Artist 0061').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0061', 'Volume Track 0061');
      expect(map.get('volume-session-0061') === 'Volume Track 0061').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0061 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0062
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0062
     * @tc.desc   Verify metadata and session map volume case 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0062 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0062', title: 'Volume Track 0062', artist: 'Volume Artist 0062' };
      expect(metadata.assetId).assertEqual('volume-asset-0062');
      expect(metadata.title === 'Volume Track 0062').assertTrue();
      expect(metadata.artist === 'Volume Artist 0062').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0062', 'Volume Track 0062');
      expect(map.get('volume-session-0062') === 'Volume Track 0062').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0062 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0063
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0063
     * @tc.desc   Verify metadata and session map volume case 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0063 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0063', title: 'Volume Track 0063', artist: 'Volume Artist 0063' };
      expect(metadata.assetId).assertEqual('volume-asset-0063');
      expect(metadata.title === 'Volume Track 0063').assertTrue();
      expect(metadata.artist === 'Volume Artist 0063').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0063', 'Volume Track 0063');
      expect(map.get('volume-session-0063') === 'Volume Track 0063').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0063 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0064
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0064
     * @tc.desc   Verify metadata and session map volume case 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0064 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0064', title: 'Volume Track 0064', artist: 'Volume Artist 0064' };
      expect(metadata.assetId).assertEqual('volume-asset-0064');
      expect(metadata.title === 'Volume Track 0064').assertTrue();
      expect(metadata.artist === 'Volume Artist 0064').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0064', 'Volume Track 0064');
      expect(map.get('volume-session-0064') === 'Volume Track 0064').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0064 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0065
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0065
     * @tc.desc   Verify metadata and session map volume case 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0065 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0065', title: 'Volume Track 0065', artist: 'Volume Artist 0065' };
      expect(metadata.assetId).assertEqual('volume-asset-0065');
      expect(metadata.title === 'Volume Track 0065').assertTrue();
      expect(metadata.artist === 'Volume Artist 0065').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0065', 'Volume Track 0065');
      expect(map.get('volume-session-0065') === 'Volume Track 0065').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0065 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0066
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0066
     * @tc.desc   Verify metadata and session map volume case 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0066 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0066', title: 'Volume Track 0066', artist: 'Volume Artist 0066' };
      expect(metadata.assetId).assertEqual('volume-asset-0066');
      expect(metadata.title === 'Volume Track 0066').assertTrue();
      expect(metadata.artist === 'Volume Artist 0066').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0066', 'Volume Track 0066');
      expect(map.get('volume-session-0066') === 'Volume Track 0066').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0066 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0067
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0067
     * @tc.desc   Verify metadata and session map volume case 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0067 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0067', title: 'Volume Track 0067', artist: 'Volume Artist 0067' };
      expect(metadata.assetId).assertEqual('volume-asset-0067');
      expect(metadata.title === 'Volume Track 0067').assertTrue();
      expect(metadata.artist === 'Volume Artist 0067').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0067', 'Volume Track 0067');
      expect(map.get('volume-session-0067') === 'Volume Track 0067').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0067 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0068
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0068
     * @tc.desc   Verify metadata and session map volume case 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0068 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0068', title: 'Volume Track 0068', artist: 'Volume Artist 0068' };
      expect(metadata.assetId).assertEqual('volume-asset-0068');
      expect(metadata.title === 'Volume Track 0068').assertTrue();
      expect(metadata.artist === 'Volume Artist 0068').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0068', 'Volume Track 0068');
      expect(map.get('volume-session-0068') === 'Volume Track 0068').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0068 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0069
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0069
     * @tc.desc   Verify metadata and session map volume case 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0069 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0069', title: 'Volume Track 0069', artist: 'Volume Artist 0069' };
      expect(metadata.assetId).assertEqual('volume-asset-0069');
      expect(metadata.title === 'Volume Track 0069').assertTrue();
      expect(metadata.artist === 'Volume Artist 0069').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0069', 'Volume Track 0069');
      expect(map.get('volume-session-0069') === 'Volume Track 0069').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0069 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0070
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0070
     * @tc.desc   Verify metadata and session map volume case 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0070 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0070', title: 'Volume Track 0070', artist: 'Volume Artist 0070' };
      expect(metadata.assetId).assertEqual('volume-asset-0070');
      expect(metadata.title === 'Volume Track 0070').assertTrue();
      expect(metadata.artist === 'Volume Artist 0070').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0070', 'Volume Track 0070');
      expect(map.get('volume-session-0070') === 'Volume Track 0070').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0070 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0071
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0071
     * @tc.desc   Verify metadata and session map volume case 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0071 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0071', title: 'Volume Track 0071', artist: 'Volume Artist 0071' };
      expect(metadata.assetId).assertEqual('volume-asset-0071');
      expect(metadata.title === 'Volume Track 0071').assertTrue();
      expect(metadata.artist === 'Volume Artist 0071').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0071', 'Volume Track 0071');
      expect(map.get('volume-session-0071') === 'Volume Track 0071').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0071 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0072
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0072
     * @tc.desc   Verify metadata and session map volume case 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0072 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0072', title: 'Volume Track 0072', artist: 'Volume Artist 0072' };
      expect(metadata.assetId).assertEqual('volume-asset-0072');
      expect(metadata.title === 'Volume Track 0072').assertTrue();
      expect(metadata.artist === 'Volume Artist 0072').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0072', 'Volume Track 0072');
      expect(map.get('volume-session-0072') === 'Volume Track 0072').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0072 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0073
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0073
     * @tc.desc   Verify metadata and session map volume case 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0073 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0073', title: 'Volume Track 0073', artist: 'Volume Artist 0073' };
      expect(metadata.assetId).assertEqual('volume-asset-0073');
      expect(metadata.title === 'Volume Track 0073').assertTrue();
      expect(metadata.artist === 'Volume Artist 0073').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0073', 'Volume Track 0073');
      expect(map.get('volume-session-0073') === 'Volume Track 0073').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0073 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0074
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0074
     * @tc.desc   Verify metadata and session map volume case 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0074 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0074', title: 'Volume Track 0074', artist: 'Volume Artist 0074' };
      expect(metadata.assetId).assertEqual('volume-asset-0074');
      expect(metadata.title === 'Volume Track 0074').assertTrue();
      expect(metadata.artist === 'Volume Artist 0074').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0074', 'Volume Track 0074');
      expect(map.get('volume-session-0074') === 'Volume Track 0074').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0074 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0075
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0075
     * @tc.desc   Verify metadata and session map volume case 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0075 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0075', title: 'Volume Track 0075', artist: 'Volume Artist 0075' };
      expect(metadata.assetId).assertEqual('volume-asset-0075');
      expect(metadata.title === 'Volume Track 0075').assertTrue();
      expect(metadata.artist === 'Volume Artist 0075').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0075', 'Volume Track 0075');
      expect(map.get('volume-session-0075') === 'Volume Track 0075').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0075 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0076
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0076
     * @tc.desc   Verify metadata and session map volume case 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0076 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0076', title: 'Volume Track 0076', artist: 'Volume Artist 0076' };
      expect(metadata.assetId).assertEqual('volume-asset-0076');
      expect(metadata.title === 'Volume Track 0076').assertTrue();
      expect(metadata.artist === 'Volume Artist 0076').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0076', 'Volume Track 0076');
      expect(map.get('volume-session-0076') === 'Volume Track 0076').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0076 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0077
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0077
     * @tc.desc   Verify metadata and session map volume case 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0077 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0077', title: 'Volume Track 0077', artist: 'Volume Artist 0077' };
      expect(metadata.assetId).assertEqual('volume-asset-0077');
      expect(metadata.title === 'Volume Track 0077').assertTrue();
      expect(metadata.artist === 'Volume Artist 0077').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0077', 'Volume Track 0077');
      expect(map.get('volume-session-0077') === 'Volume Track 0077').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0077 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0078
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0078
     * @tc.desc   Verify metadata and session map volume case 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0078 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0078', title: 'Volume Track 0078', artist: 'Volume Artist 0078' };
      expect(metadata.assetId).assertEqual('volume-asset-0078');
      expect(metadata.title === 'Volume Track 0078').assertTrue();
      expect(metadata.artist === 'Volume Artist 0078').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0078', 'Volume Track 0078');
      expect(map.get('volume-session-0078') === 'Volume Track 0078').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0078 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0079
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0079
     * @tc.desc   Verify metadata and session map volume case 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0079 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0079', title: 'Volume Track 0079', artist: 'Volume Artist 0079' };
      expect(metadata.assetId).assertEqual('volume-asset-0079');
      expect(metadata.title === 'Volume Track 0079').assertTrue();
      expect(metadata.artist === 'Volume Artist 0079').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0079', 'Volume Track 0079');
      expect(map.get('volume-session-0079') === 'Volume Track 0079').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0079 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0080
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0080
     * @tc.desc   Verify metadata and session map volume case 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0080 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0080', title: 'Volume Track 0080', artist: 'Volume Artist 0080' };
      expect(metadata.assetId).assertEqual('volume-asset-0080');
      expect(metadata.title === 'Volume Track 0080').assertTrue();
      expect(metadata.artist === 'Volume Artist 0080').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0080', 'Volume Track 0080');
      expect(map.get('volume-session-0080') === 'Volume Track 0080').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0080 end');
    })
  })
}
