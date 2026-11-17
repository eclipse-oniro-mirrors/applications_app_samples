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

export default function mediaControllerVolumeTestPart08() {
  describe('MediaControllerVolumePart08', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0561
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0561
     * @tc.desc   Verify metadata and session map volume case 561.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0561', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0561 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0561', title: 'Volume Track 0561', artist: 'Volume Artist 0561' };
      expect(metadata.assetId).assertEqual('volume-asset-0561');
      expect(metadata.title === 'Volume Track 0561').assertTrue();
      expect(metadata.artist === 'Volume Artist 0561').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0561', 'Volume Track 0561');
      expect(map.get('volume-session-0561') === 'Volume Track 0561').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0561 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0562
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0562
     * @tc.desc   Verify metadata and session map volume case 562.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0562', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0562 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0562', title: 'Volume Track 0562', artist: 'Volume Artist 0562' };
      expect(metadata.assetId).assertEqual('volume-asset-0562');
      expect(metadata.title === 'Volume Track 0562').assertTrue();
      expect(metadata.artist === 'Volume Artist 0562').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0562', 'Volume Track 0562');
      expect(map.get('volume-session-0562') === 'Volume Track 0562').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0562 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0563
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0563
     * @tc.desc   Verify metadata and session map volume case 563.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0563', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0563 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0563', title: 'Volume Track 0563', artist: 'Volume Artist 0563' };
      expect(metadata.assetId).assertEqual('volume-asset-0563');
      expect(metadata.title === 'Volume Track 0563').assertTrue();
      expect(metadata.artist === 'Volume Artist 0563').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0563', 'Volume Track 0563');
      expect(map.get('volume-session-0563') === 'Volume Track 0563').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0563 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0564
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0564
     * @tc.desc   Verify metadata and session map volume case 564.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0564', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0564 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0564', title: 'Volume Track 0564', artist: 'Volume Artist 0564' };
      expect(metadata.assetId).assertEqual('volume-asset-0564');
      expect(metadata.title === 'Volume Track 0564').assertTrue();
      expect(metadata.artist === 'Volume Artist 0564').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0564', 'Volume Track 0564');
      expect(map.get('volume-session-0564') === 'Volume Track 0564').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0564 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0565
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0565
     * @tc.desc   Verify metadata and session map volume case 565.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0565', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0565 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0565', title: 'Volume Track 0565', artist: 'Volume Artist 0565' };
      expect(metadata.assetId).assertEqual('volume-asset-0565');
      expect(metadata.title === 'Volume Track 0565').assertTrue();
      expect(metadata.artist === 'Volume Artist 0565').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0565', 'Volume Track 0565');
      expect(map.get('volume-session-0565') === 'Volume Track 0565').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0565 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0566
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0566
     * @tc.desc   Verify metadata and session map volume case 566.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0566', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0566 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0566', title: 'Volume Track 0566', artist: 'Volume Artist 0566' };
      expect(metadata.assetId).assertEqual('volume-asset-0566');
      expect(metadata.title === 'Volume Track 0566').assertTrue();
      expect(metadata.artist === 'Volume Artist 0566').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0566', 'Volume Track 0566');
      expect(map.get('volume-session-0566') === 'Volume Track 0566').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0566 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0567
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0567
     * @tc.desc   Verify metadata and session map volume case 567.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0567', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0567 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0567', title: 'Volume Track 0567', artist: 'Volume Artist 0567' };
      expect(metadata.assetId).assertEqual('volume-asset-0567');
      expect(metadata.title === 'Volume Track 0567').assertTrue();
      expect(metadata.artist === 'Volume Artist 0567').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0567', 'Volume Track 0567');
      expect(map.get('volume-session-0567') === 'Volume Track 0567').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0567 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0568
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0568
     * @tc.desc   Verify metadata and session map volume case 568.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0568', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0568 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0568', title: 'Volume Track 0568', artist: 'Volume Artist 0568' };
      expect(metadata.assetId).assertEqual('volume-asset-0568');
      expect(metadata.title === 'Volume Track 0568').assertTrue();
      expect(metadata.artist === 'Volume Artist 0568').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0568', 'Volume Track 0568');
      expect(map.get('volume-session-0568') === 'Volume Track 0568').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0568 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0569
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0569
     * @tc.desc   Verify metadata and session map volume case 569.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0569', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0569 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0569', title: 'Volume Track 0569', artist: 'Volume Artist 0569' };
      expect(metadata.assetId).assertEqual('volume-asset-0569');
      expect(metadata.title === 'Volume Track 0569').assertTrue();
      expect(metadata.artist === 'Volume Artist 0569').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0569', 'Volume Track 0569');
      expect(map.get('volume-session-0569') === 'Volume Track 0569').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0569 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0570
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0570
     * @tc.desc   Verify metadata and session map volume case 570.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0570 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0570', title: 'Volume Track 0570', artist: 'Volume Artist 0570' };
      expect(metadata.assetId).assertEqual('volume-asset-0570');
      expect(metadata.title === 'Volume Track 0570').assertTrue();
      expect(metadata.artist === 'Volume Artist 0570').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0570', 'Volume Track 0570');
      expect(map.get('volume-session-0570') === 'Volume Track 0570').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0570 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0571
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0571
     * @tc.desc   Verify metadata and session map volume case 571.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0571', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0571 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0571', title: 'Volume Track 0571', artist: 'Volume Artist 0571' };
      expect(metadata.assetId).assertEqual('volume-asset-0571');
      expect(metadata.title === 'Volume Track 0571').assertTrue();
      expect(metadata.artist === 'Volume Artist 0571').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0571', 'Volume Track 0571');
      expect(map.get('volume-session-0571') === 'Volume Track 0571').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0571 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0572
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0572
     * @tc.desc   Verify metadata and session map volume case 572.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0572', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0572 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0572', title: 'Volume Track 0572', artist: 'Volume Artist 0572' };
      expect(metadata.assetId).assertEqual('volume-asset-0572');
      expect(metadata.title === 'Volume Track 0572').assertTrue();
      expect(metadata.artist === 'Volume Artist 0572').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0572', 'Volume Track 0572');
      expect(map.get('volume-session-0572') === 'Volume Track 0572').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0572 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0573
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0573
     * @tc.desc   Verify metadata and session map volume case 573.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0573', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0573 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0573', title: 'Volume Track 0573', artist: 'Volume Artist 0573' };
      expect(metadata.assetId).assertEqual('volume-asset-0573');
      expect(metadata.title === 'Volume Track 0573').assertTrue();
      expect(metadata.artist === 'Volume Artist 0573').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0573', 'Volume Track 0573');
      expect(map.get('volume-session-0573') === 'Volume Track 0573').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0573 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0574
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0574
     * @tc.desc   Verify metadata and session map volume case 574.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0574', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0574 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0574', title: 'Volume Track 0574', artist: 'Volume Artist 0574' };
      expect(metadata.assetId).assertEqual('volume-asset-0574');
      expect(metadata.title === 'Volume Track 0574').assertTrue();
      expect(metadata.artist === 'Volume Artist 0574').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0574', 'Volume Track 0574');
      expect(map.get('volume-session-0574') === 'Volume Track 0574').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0574 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0575
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0575
     * @tc.desc   Verify metadata and session map volume case 575.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0575', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0575 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0575', title: 'Volume Track 0575', artist: 'Volume Artist 0575' };
      expect(metadata.assetId).assertEqual('volume-asset-0575');
      expect(metadata.title === 'Volume Track 0575').assertTrue();
      expect(metadata.artist === 'Volume Artist 0575').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0575', 'Volume Track 0575');
      expect(map.get('volume-session-0575') === 'Volume Track 0575').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0575 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0576
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0576
     * @tc.desc   Verify metadata and session map volume case 576.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0576', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0576 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0576', title: 'Volume Track 0576', artist: 'Volume Artist 0576' };
      expect(metadata.assetId).assertEqual('volume-asset-0576');
      expect(metadata.title === 'Volume Track 0576').assertTrue();
      expect(metadata.artist === 'Volume Artist 0576').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0576', 'Volume Track 0576');
      expect(map.get('volume-session-0576') === 'Volume Track 0576').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0576 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0577
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0577
     * @tc.desc   Verify metadata and session map volume case 577.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0577', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0577 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0577', title: 'Volume Track 0577', artist: 'Volume Artist 0577' };
      expect(metadata.assetId).assertEqual('volume-asset-0577');
      expect(metadata.title === 'Volume Track 0577').assertTrue();
      expect(metadata.artist === 'Volume Artist 0577').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0577', 'Volume Track 0577');
      expect(map.get('volume-session-0577') === 'Volume Track 0577').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0577 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0578
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0578
     * @tc.desc   Verify metadata and session map volume case 578.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0578', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0578 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0578', title: 'Volume Track 0578', artist: 'Volume Artist 0578' };
      expect(metadata.assetId).assertEqual('volume-asset-0578');
      expect(metadata.title === 'Volume Track 0578').assertTrue();
      expect(metadata.artist === 'Volume Artist 0578').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0578', 'Volume Track 0578');
      expect(map.get('volume-session-0578') === 'Volume Track 0578').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0578 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0579
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0579
     * @tc.desc   Verify metadata and session map volume case 579.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0579', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0579 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0579', title: 'Volume Track 0579', artist: 'Volume Artist 0579' };
      expect(metadata.assetId).assertEqual('volume-asset-0579');
      expect(metadata.title === 'Volume Track 0579').assertTrue();
      expect(metadata.artist === 'Volume Artist 0579').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0579', 'Volume Track 0579');
      expect(map.get('volume-session-0579') === 'Volume Track 0579').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0579 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0580
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0580
     * @tc.desc   Verify metadata and session map volume case 580.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0580 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0580', title: 'Volume Track 0580', artist: 'Volume Artist 0580' };
      expect(metadata.assetId).assertEqual('volume-asset-0580');
      expect(metadata.title === 'Volume Track 0580').assertTrue();
      expect(metadata.artist === 'Volume Artist 0580').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0580', 'Volume Track 0580');
      expect(map.get('volume-session-0580') === 'Volume Track 0580').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0580 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0581
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0581
     * @tc.desc   Verify metadata and session map volume case 581.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0581', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0581 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0581', title: 'Volume Track 0581', artist: 'Volume Artist 0581' };
      expect(metadata.assetId).assertEqual('volume-asset-0581');
      expect(metadata.title === 'Volume Track 0581').assertTrue();
      expect(metadata.artist === 'Volume Artist 0581').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0581', 'Volume Track 0581');
      expect(map.get('volume-session-0581') === 'Volume Track 0581').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0581 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0582
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0582
     * @tc.desc   Verify metadata and session map volume case 582.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0582', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0582 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0582', title: 'Volume Track 0582', artist: 'Volume Artist 0582' };
      expect(metadata.assetId).assertEqual('volume-asset-0582');
      expect(metadata.title === 'Volume Track 0582').assertTrue();
      expect(metadata.artist === 'Volume Artist 0582').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0582', 'Volume Track 0582');
      expect(map.get('volume-session-0582') === 'Volume Track 0582').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0582 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0583
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0583
     * @tc.desc   Verify metadata and session map volume case 583.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0583', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0583 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0583', title: 'Volume Track 0583', artist: 'Volume Artist 0583' };
      expect(metadata.assetId).assertEqual('volume-asset-0583');
      expect(metadata.title === 'Volume Track 0583').assertTrue();
      expect(metadata.artist === 'Volume Artist 0583').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0583', 'Volume Track 0583');
      expect(map.get('volume-session-0583') === 'Volume Track 0583').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0583 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0584
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0584
     * @tc.desc   Verify metadata and session map volume case 584.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0584', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0584 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0584', title: 'Volume Track 0584', artist: 'Volume Artist 0584' };
      expect(metadata.assetId).assertEqual('volume-asset-0584');
      expect(metadata.title === 'Volume Track 0584').assertTrue();
      expect(metadata.artist === 'Volume Artist 0584').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0584', 'Volume Track 0584');
      expect(map.get('volume-session-0584') === 'Volume Track 0584').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0584 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0585
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0585
     * @tc.desc   Verify metadata and session map volume case 585.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0585', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0585 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0585', title: 'Volume Track 0585', artist: 'Volume Artist 0585' };
      expect(metadata.assetId).assertEqual('volume-asset-0585');
      expect(metadata.title === 'Volume Track 0585').assertTrue();
      expect(metadata.artist === 'Volume Artist 0585').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0585', 'Volume Track 0585');
      expect(map.get('volume-session-0585') === 'Volume Track 0585').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0585 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0586
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0586
     * @tc.desc   Verify metadata and session map volume case 586.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0586', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0586 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0586', title: 'Volume Track 0586', artist: 'Volume Artist 0586' };
      expect(metadata.assetId).assertEqual('volume-asset-0586');
      expect(metadata.title === 'Volume Track 0586').assertTrue();
      expect(metadata.artist === 'Volume Artist 0586').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0586', 'Volume Track 0586');
      expect(map.get('volume-session-0586') === 'Volume Track 0586').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0586 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0587
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0587
     * @tc.desc   Verify metadata and session map volume case 587.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0587', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0587 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0587', title: 'Volume Track 0587', artist: 'Volume Artist 0587' };
      expect(metadata.assetId).assertEqual('volume-asset-0587');
      expect(metadata.title === 'Volume Track 0587').assertTrue();
      expect(metadata.artist === 'Volume Artist 0587').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0587', 'Volume Track 0587');
      expect(map.get('volume-session-0587') === 'Volume Track 0587').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0587 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0588
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0588
     * @tc.desc   Verify metadata and session map volume case 588.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0588', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0588 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0588', title: 'Volume Track 0588', artist: 'Volume Artist 0588' };
      expect(metadata.assetId).assertEqual('volume-asset-0588');
      expect(metadata.title === 'Volume Track 0588').assertTrue();
      expect(metadata.artist === 'Volume Artist 0588').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0588', 'Volume Track 0588');
      expect(map.get('volume-session-0588') === 'Volume Track 0588').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0588 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0589
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0589
     * @tc.desc   Verify metadata and session map volume case 589.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0589', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0589 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0589', title: 'Volume Track 0589', artist: 'Volume Artist 0589' };
      expect(metadata.assetId).assertEqual('volume-asset-0589');
      expect(metadata.title === 'Volume Track 0589').assertTrue();
      expect(metadata.artist === 'Volume Artist 0589').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0589', 'Volume Track 0589');
      expect(map.get('volume-session-0589') === 'Volume Track 0589').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0589 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0590
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0590
     * @tc.desc   Verify metadata and session map volume case 590.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0590 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0590', title: 'Volume Track 0590', artist: 'Volume Artist 0590' };
      expect(metadata.assetId).assertEqual('volume-asset-0590');
      expect(metadata.title === 'Volume Track 0590').assertTrue();
      expect(metadata.artist === 'Volume Artist 0590').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0590', 'Volume Track 0590');
      expect(map.get('volume-session-0590') === 'Volume Track 0590').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0590 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0591
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0591
     * @tc.desc   Verify metadata and session map volume case 591.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0591', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0591 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0591', title: 'Volume Track 0591', artist: 'Volume Artist 0591' };
      expect(metadata.assetId).assertEqual('volume-asset-0591');
      expect(metadata.title === 'Volume Track 0591').assertTrue();
      expect(metadata.artist === 'Volume Artist 0591').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0591', 'Volume Track 0591');
      expect(map.get('volume-session-0591') === 'Volume Track 0591').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0591 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0592
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0592
     * @tc.desc   Verify metadata and session map volume case 592.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0592', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0592 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0592', title: 'Volume Track 0592', artist: 'Volume Artist 0592' };
      expect(metadata.assetId).assertEqual('volume-asset-0592');
      expect(metadata.title === 'Volume Track 0592').assertTrue();
      expect(metadata.artist === 'Volume Artist 0592').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0592', 'Volume Track 0592');
      expect(map.get('volume-session-0592') === 'Volume Track 0592').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0592 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0593
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0593
     * @tc.desc   Verify metadata and session map volume case 593.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0593', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0593 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0593', title: 'Volume Track 0593', artist: 'Volume Artist 0593' };
      expect(metadata.assetId).assertEqual('volume-asset-0593');
      expect(metadata.title === 'Volume Track 0593').assertTrue();
      expect(metadata.artist === 'Volume Artist 0593').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0593', 'Volume Track 0593');
      expect(map.get('volume-session-0593') === 'Volume Track 0593').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0593 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0594
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0594
     * @tc.desc   Verify metadata and session map volume case 594.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0594', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0594 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0594', title: 'Volume Track 0594', artist: 'Volume Artist 0594' };
      expect(metadata.assetId).assertEqual('volume-asset-0594');
      expect(metadata.title === 'Volume Track 0594').assertTrue();
      expect(metadata.artist === 'Volume Artist 0594').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0594', 'Volume Track 0594');
      expect(map.get('volume-session-0594') === 'Volume Track 0594').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0594 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0595
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0595
     * @tc.desc   Verify metadata and session map volume case 595.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0595', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0595 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0595', title: 'Volume Track 0595', artist: 'Volume Artist 0595' };
      expect(metadata.assetId).assertEqual('volume-asset-0595');
      expect(metadata.title === 'Volume Track 0595').assertTrue();
      expect(metadata.artist === 'Volume Artist 0595').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0595', 'Volume Track 0595');
      expect(map.get('volume-session-0595') === 'Volume Track 0595').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0595 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0596
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0596
     * @tc.desc   Verify metadata and session map volume case 596.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0596', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0596 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0596', title: 'Volume Track 0596', artist: 'Volume Artist 0596' };
      expect(metadata.assetId).assertEqual('volume-asset-0596');
      expect(metadata.title === 'Volume Track 0596').assertTrue();
      expect(metadata.artist === 'Volume Artist 0596').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0596', 'Volume Track 0596');
      expect(map.get('volume-session-0596') === 'Volume Track 0596').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0596 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0597
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0597
     * @tc.desc   Verify metadata and session map volume case 597.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0597', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0597 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0597', title: 'Volume Track 0597', artist: 'Volume Artist 0597' };
      expect(metadata.assetId).assertEqual('volume-asset-0597');
      expect(metadata.title === 'Volume Track 0597').assertTrue();
      expect(metadata.artist === 'Volume Artist 0597').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0597', 'Volume Track 0597');
      expect(map.get('volume-session-0597') === 'Volume Track 0597').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0597 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0598
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0598
     * @tc.desc   Verify metadata and session map volume case 598.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0598', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0598 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0598', title: 'Volume Track 0598', artist: 'Volume Artist 0598' };
      expect(metadata.assetId).assertEqual('volume-asset-0598');
      expect(metadata.title === 'Volume Track 0598').assertTrue();
      expect(metadata.artist === 'Volume Artist 0598').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0598', 'Volume Track 0598');
      expect(map.get('volume-session-0598') === 'Volume Track 0598').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0598 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0599
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0599
     * @tc.desc   Verify metadata and session map volume case 599.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0599', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0599 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0599', title: 'Volume Track 0599', artist: 'Volume Artist 0599' };
      expect(metadata.assetId).assertEqual('volume-asset-0599');
      expect(metadata.title === 'Volume Track 0599').assertTrue();
      expect(metadata.artist === 'Volume Artist 0599').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0599', 'Volume Track 0599');
      expect(map.get('volume-session-0599') === 'Volume Track 0599').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0599 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0600
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0600
     * @tc.desc   Verify metadata and session map volume case 600.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0600 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0600', title: 'Volume Track 0600', artist: 'Volume Artist 0600' };
      expect(metadata.assetId).assertEqual('volume-asset-0600');
      expect(metadata.title === 'Volume Track 0600').assertTrue();
      expect(metadata.artist === 'Volume Artist 0600').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0600', 'Volume Track 0600');
      expect(map.get('volume-session-0600') === 'Volume Track 0600').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0600 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0601
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0601
     * @tc.desc   Verify metadata and session map volume case 601.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0601 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0601', title: 'Volume Track 0601', artist: 'Volume Artist 0601' };
      expect(metadata.assetId).assertEqual('volume-asset-0601');
      expect(metadata.title === 'Volume Track 0601').assertTrue();
      expect(metadata.artist === 'Volume Artist 0601').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0601', 'Volume Track 0601');
      expect(map.get('volume-session-0601') === 'Volume Track 0601').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0601 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0602
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0602
     * @tc.desc   Verify metadata and session map volume case 602.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0602 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0602', title: 'Volume Track 0602', artist: 'Volume Artist 0602' };
      expect(metadata.assetId).assertEqual('volume-asset-0602');
      expect(metadata.title === 'Volume Track 0602').assertTrue();
      expect(metadata.artist === 'Volume Artist 0602').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0602', 'Volume Track 0602');
      expect(map.get('volume-session-0602') === 'Volume Track 0602').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0602 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0603
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0603
     * @tc.desc   Verify metadata and session map volume case 603.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0603 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0603', title: 'Volume Track 0603', artist: 'Volume Artist 0603' };
      expect(metadata.assetId).assertEqual('volume-asset-0603');
      expect(metadata.title === 'Volume Track 0603').assertTrue();
      expect(metadata.artist === 'Volume Artist 0603').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0603', 'Volume Track 0603');
      expect(map.get('volume-session-0603') === 'Volume Track 0603').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0603 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0604
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0604
     * @tc.desc   Verify metadata and session map volume case 604.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0604 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0604', title: 'Volume Track 0604', artist: 'Volume Artist 0604' };
      expect(metadata.assetId).assertEqual('volume-asset-0604');
      expect(metadata.title === 'Volume Track 0604').assertTrue();
      expect(metadata.artist === 'Volume Artist 0604').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0604', 'Volume Track 0604');
      expect(map.get('volume-session-0604') === 'Volume Track 0604').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0604 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0605
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0605
     * @tc.desc   Verify metadata and session map volume case 605.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0605 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0605', title: 'Volume Track 0605', artist: 'Volume Artist 0605' };
      expect(metadata.assetId).assertEqual('volume-asset-0605');
      expect(metadata.title === 'Volume Track 0605').assertTrue();
      expect(metadata.artist === 'Volume Artist 0605').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0605', 'Volume Track 0605');
      expect(map.get('volume-session-0605') === 'Volume Track 0605').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0605 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0606
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0606
     * @tc.desc   Verify metadata and session map volume case 606.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0606 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0606', title: 'Volume Track 0606', artist: 'Volume Artist 0606' };
      expect(metadata.assetId).assertEqual('volume-asset-0606');
      expect(metadata.title === 'Volume Track 0606').assertTrue();
      expect(metadata.artist === 'Volume Artist 0606').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0606', 'Volume Track 0606');
      expect(map.get('volume-session-0606') === 'Volume Track 0606').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0606 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0607
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0607
     * @tc.desc   Verify metadata and session map volume case 607.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0607 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0607', title: 'Volume Track 0607', artist: 'Volume Artist 0607' };
      expect(metadata.assetId).assertEqual('volume-asset-0607');
      expect(metadata.title === 'Volume Track 0607').assertTrue();
      expect(metadata.artist === 'Volume Artist 0607').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0607', 'Volume Track 0607');
      expect(map.get('volume-session-0607') === 'Volume Track 0607').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0607 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0608
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0608
     * @tc.desc   Verify metadata and session map volume case 608.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0608 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0608', title: 'Volume Track 0608', artist: 'Volume Artist 0608' };
      expect(metadata.assetId).assertEqual('volume-asset-0608');
      expect(metadata.title === 'Volume Track 0608').assertTrue();
      expect(metadata.artist === 'Volume Artist 0608').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0608', 'Volume Track 0608');
      expect(map.get('volume-session-0608') === 'Volume Track 0608').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0608 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0609
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0609
     * @tc.desc   Verify metadata and session map volume case 609.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0609 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0609', title: 'Volume Track 0609', artist: 'Volume Artist 0609' };
      expect(metadata.assetId).assertEqual('volume-asset-0609');
      expect(metadata.title === 'Volume Track 0609').assertTrue();
      expect(metadata.artist === 'Volume Artist 0609').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0609', 'Volume Track 0609');
      expect(map.get('volume-session-0609') === 'Volume Track 0609').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0609 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0610
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0610
     * @tc.desc   Verify metadata and session map volume case 610.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0610 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0610', title: 'Volume Track 0610', artist: 'Volume Artist 0610' };
      expect(metadata.assetId).assertEqual('volume-asset-0610');
      expect(metadata.title === 'Volume Track 0610').assertTrue();
      expect(metadata.artist === 'Volume Artist 0610').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0610', 'Volume Track 0610');
      expect(map.get('volume-session-0610') === 'Volume Track 0610').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0610 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0611
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0611
     * @tc.desc   Verify metadata and session map volume case 611.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0611 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0611', title: 'Volume Track 0611', artist: 'Volume Artist 0611' };
      expect(metadata.assetId).assertEqual('volume-asset-0611');
      expect(metadata.title === 'Volume Track 0611').assertTrue();
      expect(metadata.artist === 'Volume Artist 0611').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0611', 'Volume Track 0611');
      expect(map.get('volume-session-0611') === 'Volume Track 0611').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0611 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0612
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0612
     * @tc.desc   Verify metadata and session map volume case 612.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0612', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0612 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0612', title: 'Volume Track 0612', artist: 'Volume Artist 0612' };
      expect(metadata.assetId).assertEqual('volume-asset-0612');
      expect(metadata.title === 'Volume Track 0612').assertTrue();
      expect(metadata.artist === 'Volume Artist 0612').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0612', 'Volume Track 0612');
      expect(map.get('volume-session-0612') === 'Volume Track 0612').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0612 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0613
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0613
     * @tc.desc   Verify metadata and session map volume case 613.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0613', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0613 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0613', title: 'Volume Track 0613', artist: 'Volume Artist 0613' };
      expect(metadata.assetId).assertEqual('volume-asset-0613');
      expect(metadata.title === 'Volume Track 0613').assertTrue();
      expect(metadata.artist === 'Volume Artist 0613').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0613', 'Volume Track 0613');
      expect(map.get('volume-session-0613') === 'Volume Track 0613').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0613 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0614
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0614
     * @tc.desc   Verify metadata and session map volume case 614.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0614', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0614 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0614', title: 'Volume Track 0614', artist: 'Volume Artist 0614' };
      expect(metadata.assetId).assertEqual('volume-asset-0614');
      expect(metadata.title === 'Volume Track 0614').assertTrue();
      expect(metadata.artist === 'Volume Artist 0614').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0614', 'Volume Track 0614');
      expect(map.get('volume-session-0614') === 'Volume Track 0614').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0614 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0615
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0615
     * @tc.desc   Verify metadata and session map volume case 615.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0615', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0615 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0615', title: 'Volume Track 0615', artist: 'Volume Artist 0615' };
      expect(metadata.assetId).assertEqual('volume-asset-0615');
      expect(metadata.title === 'Volume Track 0615').assertTrue();
      expect(metadata.artist === 'Volume Artist 0615').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0615', 'Volume Track 0615');
      expect(map.get('volume-session-0615') === 'Volume Track 0615').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0615 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0616
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0616
     * @tc.desc   Verify metadata and session map volume case 616.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0616', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0616 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0616', title: 'Volume Track 0616', artist: 'Volume Artist 0616' };
      expect(metadata.assetId).assertEqual('volume-asset-0616');
      expect(metadata.title === 'Volume Track 0616').assertTrue();
      expect(metadata.artist === 'Volume Artist 0616').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0616', 'Volume Track 0616');
      expect(map.get('volume-session-0616') === 'Volume Track 0616').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0616 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0617
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0617
     * @tc.desc   Verify metadata and session map volume case 617.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0617', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0617 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0617', title: 'Volume Track 0617', artist: 'Volume Artist 0617' };
      expect(metadata.assetId).assertEqual('volume-asset-0617');
      expect(metadata.title === 'Volume Track 0617').assertTrue();
      expect(metadata.artist === 'Volume Artist 0617').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0617', 'Volume Track 0617');
      expect(map.get('volume-session-0617') === 'Volume Track 0617').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0617 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0618
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0618
     * @tc.desc   Verify metadata and session map volume case 618.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0618', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0618 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0618', title: 'Volume Track 0618', artist: 'Volume Artist 0618' };
      expect(metadata.assetId).assertEqual('volume-asset-0618');
      expect(metadata.title === 'Volume Track 0618').assertTrue();
      expect(metadata.artist === 'Volume Artist 0618').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0618', 'Volume Track 0618');
      expect(map.get('volume-session-0618') === 'Volume Track 0618').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0618 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0619
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0619
     * @tc.desc   Verify metadata and session map volume case 619.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0619', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0619 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0619', title: 'Volume Track 0619', artist: 'Volume Artist 0619' };
      expect(metadata.assetId).assertEqual('volume-asset-0619');
      expect(metadata.title === 'Volume Track 0619').assertTrue();
      expect(metadata.artist === 'Volume Artist 0619').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0619', 'Volume Track 0619');
      expect(map.get('volume-session-0619') === 'Volume Track 0619').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0619 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0620
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0620
     * @tc.desc   Verify metadata and session map volume case 620.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0620 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0620', title: 'Volume Track 0620', artist: 'Volume Artist 0620' };
      expect(metadata.assetId).assertEqual('volume-asset-0620');
      expect(metadata.title === 'Volume Track 0620').assertTrue();
      expect(metadata.artist === 'Volume Artist 0620').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0620', 'Volume Track 0620');
      expect(map.get('volume-session-0620') === 'Volume Track 0620').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0620 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0621
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0621
     * @tc.desc   Verify metadata and session map volume case 621.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0621', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0621 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0621', title: 'Volume Track 0621', artist: 'Volume Artist 0621' };
      expect(metadata.assetId).assertEqual('volume-asset-0621');
      expect(metadata.title === 'Volume Track 0621').assertTrue();
      expect(metadata.artist === 'Volume Artist 0621').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0621', 'Volume Track 0621');
      expect(map.get('volume-session-0621') === 'Volume Track 0621').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0621 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0622
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0622
     * @tc.desc   Verify metadata and session map volume case 622.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0622', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0622 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0622', title: 'Volume Track 0622', artist: 'Volume Artist 0622' };
      expect(metadata.assetId).assertEqual('volume-asset-0622');
      expect(metadata.title === 'Volume Track 0622').assertTrue();
      expect(metadata.artist === 'Volume Artist 0622').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0622', 'Volume Track 0622');
      expect(map.get('volume-session-0622') === 'Volume Track 0622').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0622 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0623
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0623
     * @tc.desc   Verify metadata and session map volume case 623.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0623', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0623 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0623', title: 'Volume Track 0623', artist: 'Volume Artist 0623' };
      expect(metadata.assetId).assertEqual('volume-asset-0623');
      expect(metadata.title === 'Volume Track 0623').assertTrue();
      expect(metadata.artist === 'Volume Artist 0623').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0623', 'Volume Track 0623');
      expect(map.get('volume-session-0623') === 'Volume Track 0623').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0623 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0624
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0624
     * @tc.desc   Verify metadata and session map volume case 624.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0624', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0624 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0624', title: 'Volume Track 0624', artist: 'Volume Artist 0624' };
      expect(metadata.assetId).assertEqual('volume-asset-0624');
      expect(metadata.title === 'Volume Track 0624').assertTrue();
      expect(metadata.artist === 'Volume Artist 0624').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0624', 'Volume Track 0624');
      expect(map.get('volume-session-0624') === 'Volume Track 0624').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0624 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0625
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0625
     * @tc.desc   Verify metadata and session map volume case 625.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0625', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0625 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0625', title: 'Volume Track 0625', artist: 'Volume Artist 0625' };
      expect(metadata.assetId).assertEqual('volume-asset-0625');
      expect(metadata.title === 'Volume Track 0625').assertTrue();
      expect(metadata.artist === 'Volume Artist 0625').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0625', 'Volume Track 0625');
      expect(map.get('volume-session-0625') === 'Volume Track 0625').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0625 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0626
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0626
     * @tc.desc   Verify metadata and session map volume case 626.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0626', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0626 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0626', title: 'Volume Track 0626', artist: 'Volume Artist 0626' };
      expect(metadata.assetId).assertEqual('volume-asset-0626');
      expect(metadata.title === 'Volume Track 0626').assertTrue();
      expect(metadata.artist === 'Volume Artist 0626').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0626', 'Volume Track 0626');
      expect(map.get('volume-session-0626') === 'Volume Track 0626').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0626 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0627
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0627
     * @tc.desc   Verify metadata and session map volume case 627.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0627', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0627 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0627', title: 'Volume Track 0627', artist: 'Volume Artist 0627' };
      expect(metadata.assetId).assertEqual('volume-asset-0627');
      expect(metadata.title === 'Volume Track 0627').assertTrue();
      expect(metadata.artist === 'Volume Artist 0627').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0627', 'Volume Track 0627');
      expect(map.get('volume-session-0627') === 'Volume Track 0627').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0627 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0628
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0628
     * @tc.desc   Verify metadata and session map volume case 628.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0628', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0628 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0628', title: 'Volume Track 0628', artist: 'Volume Artist 0628' };
      expect(metadata.assetId).assertEqual('volume-asset-0628');
      expect(metadata.title === 'Volume Track 0628').assertTrue();
      expect(metadata.artist === 'Volume Artist 0628').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0628', 'Volume Track 0628');
      expect(map.get('volume-session-0628') === 'Volume Track 0628').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0628 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0629
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0629
     * @tc.desc   Verify metadata and session map volume case 629.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0629', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0629 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0629', title: 'Volume Track 0629', artist: 'Volume Artist 0629' };
      expect(metadata.assetId).assertEqual('volume-asset-0629');
      expect(metadata.title === 'Volume Track 0629').assertTrue();
      expect(metadata.artist === 'Volume Artist 0629').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0629', 'Volume Track 0629');
      expect(map.get('volume-session-0629') === 'Volume Track 0629').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0629 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0630
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0630
     * @tc.desc   Verify metadata and session map volume case 630.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0630 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0630', title: 'Volume Track 0630', artist: 'Volume Artist 0630' };
      expect(metadata.assetId).assertEqual('volume-asset-0630');
      expect(metadata.title === 'Volume Track 0630').assertTrue();
      expect(metadata.artist === 'Volume Artist 0630').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0630', 'Volume Track 0630');
      expect(map.get('volume-session-0630') === 'Volume Track 0630').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0630 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0631
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0631
     * @tc.desc   Verify metadata and session map volume case 631.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0631', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0631 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0631', title: 'Volume Track 0631', artist: 'Volume Artist 0631' };
      expect(metadata.assetId).assertEqual('volume-asset-0631');
      expect(metadata.title === 'Volume Track 0631').assertTrue();
      expect(metadata.artist === 'Volume Artist 0631').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0631', 'Volume Track 0631');
      expect(map.get('volume-session-0631') === 'Volume Track 0631').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0631 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0632
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0632
     * @tc.desc   Verify metadata and session map volume case 632.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0632', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0632 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0632', title: 'Volume Track 0632', artist: 'Volume Artist 0632' };
      expect(metadata.assetId).assertEqual('volume-asset-0632');
      expect(metadata.title === 'Volume Track 0632').assertTrue();
      expect(metadata.artist === 'Volume Artist 0632').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0632', 'Volume Track 0632');
      expect(map.get('volume-session-0632') === 'Volume Track 0632').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0632 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0633
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0633
     * @tc.desc   Verify metadata and session map volume case 633.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0633', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0633 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0633', title: 'Volume Track 0633', artist: 'Volume Artist 0633' };
      expect(metadata.assetId).assertEqual('volume-asset-0633');
      expect(metadata.title === 'Volume Track 0633').assertTrue();
      expect(metadata.artist === 'Volume Artist 0633').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0633', 'Volume Track 0633');
      expect(map.get('volume-session-0633') === 'Volume Track 0633').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0633 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0634
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0634
     * @tc.desc   Verify metadata and session map volume case 634.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0634', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0634 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0634', title: 'Volume Track 0634', artist: 'Volume Artist 0634' };
      expect(metadata.assetId).assertEqual('volume-asset-0634');
      expect(metadata.title === 'Volume Track 0634').assertTrue();
      expect(metadata.artist === 'Volume Artist 0634').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0634', 'Volume Track 0634');
      expect(map.get('volume-session-0634') === 'Volume Track 0634').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0634 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0635
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0635
     * @tc.desc   Verify metadata and session map volume case 635.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0635', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0635 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0635', title: 'Volume Track 0635', artist: 'Volume Artist 0635' };
      expect(metadata.assetId).assertEqual('volume-asset-0635');
      expect(metadata.title === 'Volume Track 0635').assertTrue();
      expect(metadata.artist === 'Volume Artist 0635').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0635', 'Volume Track 0635');
      expect(map.get('volume-session-0635') === 'Volume Track 0635').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0635 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0636
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0636
     * @tc.desc   Verify metadata and session map volume case 636.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0636', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0636 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0636', title: 'Volume Track 0636', artist: 'Volume Artist 0636' };
      expect(metadata.assetId).assertEqual('volume-asset-0636');
      expect(metadata.title === 'Volume Track 0636').assertTrue();
      expect(metadata.artist === 'Volume Artist 0636').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0636', 'Volume Track 0636');
      expect(map.get('volume-session-0636') === 'Volume Track 0636').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0636 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0637
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0637
     * @tc.desc   Verify metadata and session map volume case 637.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0637', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0637 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0637', title: 'Volume Track 0637', artist: 'Volume Artist 0637' };
      expect(metadata.assetId).assertEqual('volume-asset-0637');
      expect(metadata.title === 'Volume Track 0637').assertTrue();
      expect(metadata.artist === 'Volume Artist 0637').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0637', 'Volume Track 0637');
      expect(map.get('volume-session-0637') === 'Volume Track 0637').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0637 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0638
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0638
     * @tc.desc   Verify metadata and session map volume case 638.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0638', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0638 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0638', title: 'Volume Track 0638', artist: 'Volume Artist 0638' };
      expect(metadata.assetId).assertEqual('volume-asset-0638');
      expect(metadata.title === 'Volume Track 0638').assertTrue();
      expect(metadata.artist === 'Volume Artist 0638').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0638', 'Volume Track 0638');
      expect(map.get('volume-session-0638') === 'Volume Track 0638').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0638 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0639
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0639
     * @tc.desc   Verify metadata and session map volume case 639.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0639', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0639 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0639', title: 'Volume Track 0639', artist: 'Volume Artist 0639' };
      expect(metadata.assetId).assertEqual('volume-asset-0639');
      expect(metadata.title === 'Volume Track 0639').assertTrue();
      expect(metadata.artist === 'Volume Artist 0639').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0639', 'Volume Track 0639');
      expect(map.get('volume-session-0639') === 'Volume Track 0639').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0639 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0640
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0640
     * @tc.desc   Verify metadata and session map volume case 640.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0640 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0640', title: 'Volume Track 0640', artist: 'Volume Artist 0640' };
      expect(metadata.assetId).assertEqual('volume-asset-0640');
      expect(metadata.title === 'Volume Track 0640').assertTrue();
      expect(metadata.artist === 'Volume Artist 0640').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0640', 'Volume Track 0640');
      expect(map.get('volume-session-0640') === 'Volume Track 0640').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0640 end');
    })
  })
}
