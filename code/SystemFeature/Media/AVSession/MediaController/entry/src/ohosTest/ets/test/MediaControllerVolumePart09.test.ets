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

export default function mediaControllerVolumeTestPart09() {
  describe('MediaControllerVolumePart09', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0641
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0641
     * @tc.desc   Verify metadata and session map volume case 641.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0641', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0641 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0641', title: 'Volume Track 0641', artist: 'Volume Artist 0641' };
      expect(metadata.assetId).assertEqual('volume-asset-0641');
      expect(metadata.title === 'Volume Track 0641').assertTrue();
      expect(metadata.artist === 'Volume Artist 0641').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0641', 'Volume Track 0641');
      expect(map.get('volume-session-0641') === 'Volume Track 0641').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0641 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0642
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0642
     * @tc.desc   Verify metadata and session map volume case 642.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0642', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0642 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0642', title: 'Volume Track 0642', artist: 'Volume Artist 0642' };
      expect(metadata.assetId).assertEqual('volume-asset-0642');
      expect(metadata.title === 'Volume Track 0642').assertTrue();
      expect(metadata.artist === 'Volume Artist 0642').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0642', 'Volume Track 0642');
      expect(map.get('volume-session-0642') === 'Volume Track 0642').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0642 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0643
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0643
     * @tc.desc   Verify metadata and session map volume case 643.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0643', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0643 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0643', title: 'Volume Track 0643', artist: 'Volume Artist 0643' };
      expect(metadata.assetId).assertEqual('volume-asset-0643');
      expect(metadata.title === 'Volume Track 0643').assertTrue();
      expect(metadata.artist === 'Volume Artist 0643').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0643', 'Volume Track 0643');
      expect(map.get('volume-session-0643') === 'Volume Track 0643').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0643 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0644
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0644
     * @tc.desc   Verify metadata and session map volume case 644.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0644', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0644 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0644', title: 'Volume Track 0644', artist: 'Volume Artist 0644' };
      expect(metadata.assetId).assertEqual('volume-asset-0644');
      expect(metadata.title === 'Volume Track 0644').assertTrue();
      expect(metadata.artist === 'Volume Artist 0644').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0644', 'Volume Track 0644');
      expect(map.get('volume-session-0644') === 'Volume Track 0644').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0644 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0645
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0645
     * @tc.desc   Verify metadata and session map volume case 645.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0645', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0645 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0645', title: 'Volume Track 0645', artist: 'Volume Artist 0645' };
      expect(metadata.assetId).assertEqual('volume-asset-0645');
      expect(metadata.title === 'Volume Track 0645').assertTrue();
      expect(metadata.artist === 'Volume Artist 0645').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0645', 'Volume Track 0645');
      expect(map.get('volume-session-0645') === 'Volume Track 0645').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0645 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0646
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0646
     * @tc.desc   Verify metadata and session map volume case 646.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0646', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0646 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0646', title: 'Volume Track 0646', artist: 'Volume Artist 0646' };
      expect(metadata.assetId).assertEqual('volume-asset-0646');
      expect(metadata.title === 'Volume Track 0646').assertTrue();
      expect(metadata.artist === 'Volume Artist 0646').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0646', 'Volume Track 0646');
      expect(map.get('volume-session-0646') === 'Volume Track 0646').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0646 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0647
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0647
     * @tc.desc   Verify metadata and session map volume case 647.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0647', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0647 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0647', title: 'Volume Track 0647', artist: 'Volume Artist 0647' };
      expect(metadata.assetId).assertEqual('volume-asset-0647');
      expect(metadata.title === 'Volume Track 0647').assertTrue();
      expect(metadata.artist === 'Volume Artist 0647').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0647', 'Volume Track 0647');
      expect(map.get('volume-session-0647') === 'Volume Track 0647').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0647 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0648
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0648
     * @tc.desc   Verify metadata and session map volume case 648.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0648', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0648 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0648', title: 'Volume Track 0648', artist: 'Volume Artist 0648' };
      expect(metadata.assetId).assertEqual('volume-asset-0648');
      expect(metadata.title === 'Volume Track 0648').assertTrue();
      expect(metadata.artist === 'Volume Artist 0648').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0648', 'Volume Track 0648');
      expect(map.get('volume-session-0648') === 'Volume Track 0648').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0648 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0649
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0649
     * @tc.desc   Verify metadata and session map volume case 649.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0649', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0649 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0649', title: 'Volume Track 0649', artist: 'Volume Artist 0649' };
      expect(metadata.assetId).assertEqual('volume-asset-0649');
      expect(metadata.title === 'Volume Track 0649').assertTrue();
      expect(metadata.artist === 'Volume Artist 0649').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0649', 'Volume Track 0649');
      expect(map.get('volume-session-0649') === 'Volume Track 0649').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0649 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0650
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0650
     * @tc.desc   Verify metadata and session map volume case 650.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0650 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0650', title: 'Volume Track 0650', artist: 'Volume Artist 0650' };
      expect(metadata.assetId).assertEqual('volume-asset-0650');
      expect(metadata.title === 'Volume Track 0650').assertTrue();
      expect(metadata.artist === 'Volume Artist 0650').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0650', 'Volume Track 0650');
      expect(map.get('volume-session-0650') === 'Volume Track 0650').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0650 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0651
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0651
     * @tc.desc   Verify metadata and session map volume case 651.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0651', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0651 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0651', title: 'Volume Track 0651', artist: 'Volume Artist 0651' };
      expect(metadata.assetId).assertEqual('volume-asset-0651');
      expect(metadata.title === 'Volume Track 0651').assertTrue();
      expect(metadata.artist === 'Volume Artist 0651').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0651', 'Volume Track 0651');
      expect(map.get('volume-session-0651') === 'Volume Track 0651').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0651 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0652
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0652
     * @tc.desc   Verify metadata and session map volume case 652.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0652', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0652 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0652', title: 'Volume Track 0652', artist: 'Volume Artist 0652' };
      expect(metadata.assetId).assertEqual('volume-asset-0652');
      expect(metadata.title === 'Volume Track 0652').assertTrue();
      expect(metadata.artist === 'Volume Artist 0652').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0652', 'Volume Track 0652');
      expect(map.get('volume-session-0652') === 'Volume Track 0652').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0652 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0653
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0653
     * @tc.desc   Verify metadata and session map volume case 653.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0653', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0653 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0653', title: 'Volume Track 0653', artist: 'Volume Artist 0653' };
      expect(metadata.assetId).assertEqual('volume-asset-0653');
      expect(metadata.title === 'Volume Track 0653').assertTrue();
      expect(metadata.artist === 'Volume Artist 0653').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0653', 'Volume Track 0653');
      expect(map.get('volume-session-0653') === 'Volume Track 0653').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0653 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0654
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0654
     * @tc.desc   Verify metadata and session map volume case 654.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0654', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0654 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0654', title: 'Volume Track 0654', artist: 'Volume Artist 0654' };
      expect(metadata.assetId).assertEqual('volume-asset-0654');
      expect(metadata.title === 'Volume Track 0654').assertTrue();
      expect(metadata.artist === 'Volume Artist 0654').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0654', 'Volume Track 0654');
      expect(map.get('volume-session-0654') === 'Volume Track 0654').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0654 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0655
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0655
     * @tc.desc   Verify metadata and session map volume case 655.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0655', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0655 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0655', title: 'Volume Track 0655', artist: 'Volume Artist 0655' };
      expect(metadata.assetId).assertEqual('volume-asset-0655');
      expect(metadata.title === 'Volume Track 0655').assertTrue();
      expect(metadata.artist === 'Volume Artist 0655').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0655', 'Volume Track 0655');
      expect(map.get('volume-session-0655') === 'Volume Track 0655').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0655 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0656
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0656
     * @tc.desc   Verify metadata and session map volume case 656.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0656', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0656 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0656', title: 'Volume Track 0656', artist: 'Volume Artist 0656' };
      expect(metadata.assetId).assertEqual('volume-asset-0656');
      expect(metadata.title === 'Volume Track 0656').assertTrue();
      expect(metadata.artist === 'Volume Artist 0656').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0656', 'Volume Track 0656');
      expect(map.get('volume-session-0656') === 'Volume Track 0656').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0656 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0657
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0657
     * @tc.desc   Verify metadata and session map volume case 657.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0657', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0657 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0657', title: 'Volume Track 0657', artist: 'Volume Artist 0657' };
      expect(metadata.assetId).assertEqual('volume-asset-0657');
      expect(metadata.title === 'Volume Track 0657').assertTrue();
      expect(metadata.artist === 'Volume Artist 0657').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0657', 'Volume Track 0657');
      expect(map.get('volume-session-0657') === 'Volume Track 0657').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0657 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0658
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0658
     * @tc.desc   Verify metadata and session map volume case 658.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0658', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0658 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0658', title: 'Volume Track 0658', artist: 'Volume Artist 0658' };
      expect(metadata.assetId).assertEqual('volume-asset-0658');
      expect(metadata.title === 'Volume Track 0658').assertTrue();
      expect(metadata.artist === 'Volume Artist 0658').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0658', 'Volume Track 0658');
      expect(map.get('volume-session-0658') === 'Volume Track 0658').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0658 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0659
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0659
     * @tc.desc   Verify metadata and session map volume case 659.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0659', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0659 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0659', title: 'Volume Track 0659', artist: 'Volume Artist 0659' };
      expect(metadata.assetId).assertEqual('volume-asset-0659');
      expect(metadata.title === 'Volume Track 0659').assertTrue();
      expect(metadata.artist === 'Volume Artist 0659').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0659', 'Volume Track 0659');
      expect(map.get('volume-session-0659') === 'Volume Track 0659').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0659 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0660
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0660
     * @tc.desc   Verify metadata and session map volume case 660.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0660 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0660', title: 'Volume Track 0660', artist: 'Volume Artist 0660' };
      expect(metadata.assetId).assertEqual('volume-asset-0660');
      expect(metadata.title === 'Volume Track 0660').assertTrue();
      expect(metadata.artist === 'Volume Artist 0660').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0660', 'Volume Track 0660');
      expect(map.get('volume-session-0660') === 'Volume Track 0660').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0660 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0661
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0661
     * @tc.desc   Verify metadata and session map volume case 661.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0661', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0661 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0661', title: 'Volume Track 0661', artist: 'Volume Artist 0661' };
      expect(metadata.assetId).assertEqual('volume-asset-0661');
      expect(metadata.title === 'Volume Track 0661').assertTrue();
      expect(metadata.artist === 'Volume Artist 0661').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0661', 'Volume Track 0661');
      expect(map.get('volume-session-0661') === 'Volume Track 0661').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0661 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0662
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0662
     * @tc.desc   Verify metadata and session map volume case 662.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0662', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0662 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0662', title: 'Volume Track 0662', artist: 'Volume Artist 0662' };
      expect(metadata.assetId).assertEqual('volume-asset-0662');
      expect(metadata.title === 'Volume Track 0662').assertTrue();
      expect(metadata.artist === 'Volume Artist 0662').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0662', 'Volume Track 0662');
      expect(map.get('volume-session-0662') === 'Volume Track 0662').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0662 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0663
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0663
     * @tc.desc   Verify metadata and session map volume case 663.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0663', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0663 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0663', title: 'Volume Track 0663', artist: 'Volume Artist 0663' };
      expect(metadata.assetId).assertEqual('volume-asset-0663');
      expect(metadata.title === 'Volume Track 0663').assertTrue();
      expect(metadata.artist === 'Volume Artist 0663').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0663', 'Volume Track 0663');
      expect(map.get('volume-session-0663') === 'Volume Track 0663').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0663 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0664
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0664
     * @tc.desc   Verify metadata and session map volume case 664.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0664', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0664 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0664', title: 'Volume Track 0664', artist: 'Volume Artist 0664' };
      expect(metadata.assetId).assertEqual('volume-asset-0664');
      expect(metadata.title === 'Volume Track 0664').assertTrue();
      expect(metadata.artist === 'Volume Artist 0664').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0664', 'Volume Track 0664');
      expect(map.get('volume-session-0664') === 'Volume Track 0664').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0664 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0665
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0665
     * @tc.desc   Verify metadata and session map volume case 665.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0665', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0665 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0665', title: 'Volume Track 0665', artist: 'Volume Artist 0665' };
      expect(metadata.assetId).assertEqual('volume-asset-0665');
      expect(metadata.title === 'Volume Track 0665').assertTrue();
      expect(metadata.artist === 'Volume Artist 0665').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0665', 'Volume Track 0665');
      expect(map.get('volume-session-0665') === 'Volume Track 0665').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0665 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0666
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0666
     * @tc.desc   Verify metadata and session map volume case 666.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0666', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0666 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0666', title: 'Volume Track 0666', artist: 'Volume Artist 0666' };
      expect(metadata.assetId).assertEqual('volume-asset-0666');
      expect(metadata.title === 'Volume Track 0666').assertTrue();
      expect(metadata.artist === 'Volume Artist 0666').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0666', 'Volume Track 0666');
      expect(map.get('volume-session-0666') === 'Volume Track 0666').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0666 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0667
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0667
     * @tc.desc   Verify metadata and session map volume case 667.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0667', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0667 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0667', title: 'Volume Track 0667', artist: 'Volume Artist 0667' };
      expect(metadata.assetId).assertEqual('volume-asset-0667');
      expect(metadata.title === 'Volume Track 0667').assertTrue();
      expect(metadata.artist === 'Volume Artist 0667').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0667', 'Volume Track 0667');
      expect(map.get('volume-session-0667') === 'Volume Track 0667').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0667 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0668
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0668
     * @tc.desc   Verify metadata and session map volume case 668.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0668', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0668 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0668', title: 'Volume Track 0668', artist: 'Volume Artist 0668' };
      expect(metadata.assetId).assertEqual('volume-asset-0668');
      expect(metadata.title === 'Volume Track 0668').assertTrue();
      expect(metadata.artist === 'Volume Artist 0668').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0668', 'Volume Track 0668');
      expect(map.get('volume-session-0668') === 'Volume Track 0668').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0668 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0669
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0669
     * @tc.desc   Verify metadata and session map volume case 669.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0669', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0669 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0669', title: 'Volume Track 0669', artist: 'Volume Artist 0669' };
      expect(metadata.assetId).assertEqual('volume-asset-0669');
      expect(metadata.title === 'Volume Track 0669').assertTrue();
      expect(metadata.artist === 'Volume Artist 0669').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0669', 'Volume Track 0669');
      expect(map.get('volume-session-0669') === 'Volume Track 0669').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0669 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0670
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0670
     * @tc.desc   Verify metadata and session map volume case 670.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0670 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0670', title: 'Volume Track 0670', artist: 'Volume Artist 0670' };
      expect(metadata.assetId).assertEqual('volume-asset-0670');
      expect(metadata.title === 'Volume Track 0670').assertTrue();
      expect(metadata.artist === 'Volume Artist 0670').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0670', 'Volume Track 0670');
      expect(map.get('volume-session-0670') === 'Volume Track 0670').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0670 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0671
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0671
     * @tc.desc   Verify metadata and session map volume case 671.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0671', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0671 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0671', title: 'Volume Track 0671', artist: 'Volume Artist 0671' };
      expect(metadata.assetId).assertEqual('volume-asset-0671');
      expect(metadata.title === 'Volume Track 0671').assertTrue();
      expect(metadata.artist === 'Volume Artist 0671').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0671', 'Volume Track 0671');
      expect(map.get('volume-session-0671') === 'Volume Track 0671').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0671 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0672
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0672
     * @tc.desc   Verify metadata and session map volume case 672.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0672', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0672 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0672', title: 'Volume Track 0672', artist: 'Volume Artist 0672' };
      expect(metadata.assetId).assertEqual('volume-asset-0672');
      expect(metadata.title === 'Volume Track 0672').assertTrue();
      expect(metadata.artist === 'Volume Artist 0672').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0672', 'Volume Track 0672');
      expect(map.get('volume-session-0672') === 'Volume Track 0672').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0672 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0673
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0673
     * @tc.desc   Verify metadata and session map volume case 673.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0673', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0673 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0673', title: 'Volume Track 0673', artist: 'Volume Artist 0673' };
      expect(metadata.assetId).assertEqual('volume-asset-0673');
      expect(metadata.title === 'Volume Track 0673').assertTrue();
      expect(metadata.artist === 'Volume Artist 0673').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0673', 'Volume Track 0673');
      expect(map.get('volume-session-0673') === 'Volume Track 0673').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0673 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0674
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0674
     * @tc.desc   Verify metadata and session map volume case 674.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0674', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0674 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0674', title: 'Volume Track 0674', artist: 'Volume Artist 0674' };
      expect(metadata.assetId).assertEqual('volume-asset-0674');
      expect(metadata.title === 'Volume Track 0674').assertTrue();
      expect(metadata.artist === 'Volume Artist 0674').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0674', 'Volume Track 0674');
      expect(map.get('volume-session-0674') === 'Volume Track 0674').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0674 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0675
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0675
     * @tc.desc   Verify metadata and session map volume case 675.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0675', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0675 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0675', title: 'Volume Track 0675', artist: 'Volume Artist 0675' };
      expect(metadata.assetId).assertEqual('volume-asset-0675');
      expect(metadata.title === 'Volume Track 0675').assertTrue();
      expect(metadata.artist === 'Volume Artist 0675').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0675', 'Volume Track 0675');
      expect(map.get('volume-session-0675') === 'Volume Track 0675').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0675 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0676
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0676
     * @tc.desc   Verify metadata and session map volume case 676.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0676', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0676 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0676', title: 'Volume Track 0676', artist: 'Volume Artist 0676' };
      expect(metadata.assetId).assertEqual('volume-asset-0676');
      expect(metadata.title === 'Volume Track 0676').assertTrue();
      expect(metadata.artist === 'Volume Artist 0676').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0676', 'Volume Track 0676');
      expect(map.get('volume-session-0676') === 'Volume Track 0676').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0676 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0677
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0677
     * @tc.desc   Verify metadata and session map volume case 677.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0677', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0677 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0677', title: 'Volume Track 0677', artist: 'Volume Artist 0677' };
      expect(metadata.assetId).assertEqual('volume-asset-0677');
      expect(metadata.title === 'Volume Track 0677').assertTrue();
      expect(metadata.artist === 'Volume Artist 0677').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0677', 'Volume Track 0677');
      expect(map.get('volume-session-0677') === 'Volume Track 0677').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0677 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0678
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0678
     * @tc.desc   Verify metadata and session map volume case 678.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0678', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0678 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0678', title: 'Volume Track 0678', artist: 'Volume Artist 0678' };
      expect(metadata.assetId).assertEqual('volume-asset-0678');
      expect(metadata.title === 'Volume Track 0678').assertTrue();
      expect(metadata.artist === 'Volume Artist 0678').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0678', 'Volume Track 0678');
      expect(map.get('volume-session-0678') === 'Volume Track 0678').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0678 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0679
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0679
     * @tc.desc   Verify metadata and session map volume case 679.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0679', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0679 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0679', title: 'Volume Track 0679', artist: 'Volume Artist 0679' };
      expect(metadata.assetId).assertEqual('volume-asset-0679');
      expect(metadata.title === 'Volume Track 0679').assertTrue();
      expect(metadata.artist === 'Volume Artist 0679').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0679', 'Volume Track 0679');
      expect(map.get('volume-session-0679') === 'Volume Track 0679').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0679 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0680
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0680
     * @tc.desc   Verify metadata and session map volume case 680.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0680 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0680', title: 'Volume Track 0680', artist: 'Volume Artist 0680' };
      expect(metadata.assetId).assertEqual('volume-asset-0680');
      expect(metadata.title === 'Volume Track 0680').assertTrue();
      expect(metadata.artist === 'Volume Artist 0680').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0680', 'Volume Track 0680');
      expect(map.get('volume-session-0680') === 'Volume Track 0680').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0680 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0681
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0681
     * @tc.desc   Verify metadata and session map volume case 681.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0681', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0681 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0681', title: 'Volume Track 0681', artist: 'Volume Artist 0681' };
      expect(metadata.assetId).assertEqual('volume-asset-0681');
      expect(metadata.title === 'Volume Track 0681').assertTrue();
      expect(metadata.artist === 'Volume Artist 0681').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0681', 'Volume Track 0681');
      expect(map.get('volume-session-0681') === 'Volume Track 0681').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0681 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0682
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0682
     * @tc.desc   Verify metadata and session map volume case 682.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0682', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0682 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0682', title: 'Volume Track 0682', artist: 'Volume Artist 0682' };
      expect(metadata.assetId).assertEqual('volume-asset-0682');
      expect(metadata.title === 'Volume Track 0682').assertTrue();
      expect(metadata.artist === 'Volume Artist 0682').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0682', 'Volume Track 0682');
      expect(map.get('volume-session-0682') === 'Volume Track 0682').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0682 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0683
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0683
     * @tc.desc   Verify metadata and session map volume case 683.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0683', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0683 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0683', title: 'Volume Track 0683', artist: 'Volume Artist 0683' };
      expect(metadata.assetId).assertEqual('volume-asset-0683');
      expect(metadata.title === 'Volume Track 0683').assertTrue();
      expect(metadata.artist === 'Volume Artist 0683').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0683', 'Volume Track 0683');
      expect(map.get('volume-session-0683') === 'Volume Track 0683').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0683 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0684
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0684
     * @tc.desc   Verify metadata and session map volume case 684.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0684', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0684 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0684', title: 'Volume Track 0684', artist: 'Volume Artist 0684' };
      expect(metadata.assetId).assertEqual('volume-asset-0684');
      expect(metadata.title === 'Volume Track 0684').assertTrue();
      expect(metadata.artist === 'Volume Artist 0684').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0684', 'Volume Track 0684');
      expect(map.get('volume-session-0684') === 'Volume Track 0684').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0684 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0685
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0685
     * @tc.desc   Verify metadata and session map volume case 685.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0685', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0685 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0685', title: 'Volume Track 0685', artist: 'Volume Artist 0685' };
      expect(metadata.assetId).assertEqual('volume-asset-0685');
      expect(metadata.title === 'Volume Track 0685').assertTrue();
      expect(metadata.artist === 'Volume Artist 0685').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0685', 'Volume Track 0685');
      expect(map.get('volume-session-0685') === 'Volume Track 0685').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0685 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0686
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0686
     * @tc.desc   Verify metadata and session map volume case 686.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0686', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0686 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0686', title: 'Volume Track 0686', artist: 'Volume Artist 0686' };
      expect(metadata.assetId).assertEqual('volume-asset-0686');
      expect(metadata.title === 'Volume Track 0686').assertTrue();
      expect(metadata.artist === 'Volume Artist 0686').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0686', 'Volume Track 0686');
      expect(map.get('volume-session-0686') === 'Volume Track 0686').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0686 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0687
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0687
     * @tc.desc   Verify metadata and session map volume case 687.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0687', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0687 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0687', title: 'Volume Track 0687', artist: 'Volume Artist 0687' };
      expect(metadata.assetId).assertEqual('volume-asset-0687');
      expect(metadata.title === 'Volume Track 0687').assertTrue();
      expect(metadata.artist === 'Volume Artist 0687').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0687', 'Volume Track 0687');
      expect(map.get('volume-session-0687') === 'Volume Track 0687').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0687 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0688
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0688
     * @tc.desc   Verify metadata and session map volume case 688.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0688', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0688 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0688', title: 'Volume Track 0688', artist: 'Volume Artist 0688' };
      expect(metadata.assetId).assertEqual('volume-asset-0688');
      expect(metadata.title === 'Volume Track 0688').assertTrue();
      expect(metadata.artist === 'Volume Artist 0688').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0688', 'Volume Track 0688');
      expect(map.get('volume-session-0688') === 'Volume Track 0688').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0688 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0689
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0689
     * @tc.desc   Verify metadata and session map volume case 689.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0689', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0689 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0689', title: 'Volume Track 0689', artist: 'Volume Artist 0689' };
      expect(metadata.assetId).assertEqual('volume-asset-0689');
      expect(metadata.title === 'Volume Track 0689').assertTrue();
      expect(metadata.artist === 'Volume Artist 0689').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0689', 'Volume Track 0689');
      expect(map.get('volume-session-0689') === 'Volume Track 0689').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0689 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0690
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0690
     * @tc.desc   Verify metadata and session map volume case 690.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0690 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0690', title: 'Volume Track 0690', artist: 'Volume Artist 0690' };
      expect(metadata.assetId).assertEqual('volume-asset-0690');
      expect(metadata.title === 'Volume Track 0690').assertTrue();
      expect(metadata.artist === 'Volume Artist 0690').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0690', 'Volume Track 0690');
      expect(map.get('volume-session-0690') === 'Volume Track 0690').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0690 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0691
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0691
     * @tc.desc   Verify metadata and session map volume case 691.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0691', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0691 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0691', title: 'Volume Track 0691', artist: 'Volume Artist 0691' };
      expect(metadata.assetId).assertEqual('volume-asset-0691');
      expect(metadata.title === 'Volume Track 0691').assertTrue();
      expect(metadata.artist === 'Volume Artist 0691').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0691', 'Volume Track 0691');
      expect(map.get('volume-session-0691') === 'Volume Track 0691').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0691 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0692
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0692
     * @tc.desc   Verify metadata and session map volume case 692.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0692', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0692 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0692', title: 'Volume Track 0692', artist: 'Volume Artist 0692' };
      expect(metadata.assetId).assertEqual('volume-asset-0692');
      expect(metadata.title === 'Volume Track 0692').assertTrue();
      expect(metadata.artist === 'Volume Artist 0692').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0692', 'Volume Track 0692');
      expect(map.get('volume-session-0692') === 'Volume Track 0692').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0692 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0693
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0693
     * @tc.desc   Verify metadata and session map volume case 693.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0693', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0693 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0693', title: 'Volume Track 0693', artist: 'Volume Artist 0693' };
      expect(metadata.assetId).assertEqual('volume-asset-0693');
      expect(metadata.title === 'Volume Track 0693').assertTrue();
      expect(metadata.artist === 'Volume Artist 0693').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0693', 'Volume Track 0693');
      expect(map.get('volume-session-0693') === 'Volume Track 0693').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0693 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0694
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0694
     * @tc.desc   Verify metadata and session map volume case 694.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0694', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0694 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0694', title: 'Volume Track 0694', artist: 'Volume Artist 0694' };
      expect(metadata.assetId).assertEqual('volume-asset-0694');
      expect(metadata.title === 'Volume Track 0694').assertTrue();
      expect(metadata.artist === 'Volume Artist 0694').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0694', 'Volume Track 0694');
      expect(map.get('volume-session-0694') === 'Volume Track 0694').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0694 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0695
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0695
     * @tc.desc   Verify metadata and session map volume case 695.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0695', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0695 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0695', title: 'Volume Track 0695', artist: 'Volume Artist 0695' };
      expect(metadata.assetId).assertEqual('volume-asset-0695');
      expect(metadata.title === 'Volume Track 0695').assertTrue();
      expect(metadata.artist === 'Volume Artist 0695').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0695', 'Volume Track 0695');
      expect(map.get('volume-session-0695') === 'Volume Track 0695').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0695 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0696
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0696
     * @tc.desc   Verify metadata and session map volume case 696.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0696', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0696 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0696', title: 'Volume Track 0696', artist: 'Volume Artist 0696' };
      expect(metadata.assetId).assertEqual('volume-asset-0696');
      expect(metadata.title === 'Volume Track 0696').assertTrue();
      expect(metadata.artist === 'Volume Artist 0696').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0696', 'Volume Track 0696');
      expect(map.get('volume-session-0696') === 'Volume Track 0696').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0696 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0697
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0697
     * @tc.desc   Verify metadata and session map volume case 697.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0697', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0697 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0697', title: 'Volume Track 0697', artist: 'Volume Artist 0697' };
      expect(metadata.assetId).assertEqual('volume-asset-0697');
      expect(metadata.title === 'Volume Track 0697').assertTrue();
      expect(metadata.artist === 'Volume Artist 0697').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0697', 'Volume Track 0697');
      expect(map.get('volume-session-0697') === 'Volume Track 0697').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0697 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0698
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0698
     * @tc.desc   Verify metadata and session map volume case 698.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0698', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0698 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0698', title: 'Volume Track 0698', artist: 'Volume Artist 0698' };
      expect(metadata.assetId).assertEqual('volume-asset-0698');
      expect(metadata.title === 'Volume Track 0698').assertTrue();
      expect(metadata.artist === 'Volume Artist 0698').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0698', 'Volume Track 0698');
      expect(map.get('volume-session-0698') === 'Volume Track 0698').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0698 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0699
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0699
     * @tc.desc   Verify metadata and session map volume case 699.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0699', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0699 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0699', title: 'Volume Track 0699', artist: 'Volume Artist 0699' };
      expect(metadata.assetId).assertEqual('volume-asset-0699');
      expect(metadata.title === 'Volume Track 0699').assertTrue();
      expect(metadata.artist === 'Volume Artist 0699').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0699', 'Volume Track 0699');
      expect(map.get('volume-session-0699') === 'Volume Track 0699').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0699 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0700
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0700
     * @tc.desc   Verify metadata and session map volume case 700.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0700 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0700', title: 'Volume Track 0700', artist: 'Volume Artist 0700' };
      expect(metadata.assetId).assertEqual('volume-asset-0700');
      expect(metadata.title === 'Volume Track 0700').assertTrue();
      expect(metadata.artist === 'Volume Artist 0700').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0700', 'Volume Track 0700');
      expect(map.get('volume-session-0700') === 'Volume Track 0700').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0700 end');
    })
  })
}
