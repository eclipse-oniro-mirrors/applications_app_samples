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

export default function mediaControllerVolumeTestPart07() {
  describe('MediaControllerVolumePart07', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0481
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0481
     * @tc.desc   Verify metadata and session map volume case 481.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0481', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0481 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0481', title: 'Volume Track 0481', artist: 'Volume Artist 0481' };
      expect(metadata.assetId).assertEqual('volume-asset-0481');
      expect(metadata.title === 'Volume Track 0481').assertTrue();
      expect(metadata.artist === 'Volume Artist 0481').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0481', 'Volume Track 0481');
      expect(map.get('volume-session-0481') === 'Volume Track 0481').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0481 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0482
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0482
     * @tc.desc   Verify metadata and session map volume case 482.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0482 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0482', title: 'Volume Track 0482', artist: 'Volume Artist 0482' };
      expect(metadata.assetId).assertEqual('volume-asset-0482');
      expect(metadata.title === 'Volume Track 0482').assertTrue();
      expect(metadata.artist === 'Volume Artist 0482').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0482', 'Volume Track 0482');
      expect(map.get('volume-session-0482') === 'Volume Track 0482').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0482 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0483
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0483
     * @tc.desc   Verify metadata and session map volume case 483.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0483 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0483', title: 'Volume Track 0483', artist: 'Volume Artist 0483' };
      expect(metadata.assetId).assertEqual('volume-asset-0483');
      expect(metadata.title === 'Volume Track 0483').assertTrue();
      expect(metadata.artist === 'Volume Artist 0483').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0483', 'Volume Track 0483');
      expect(map.get('volume-session-0483') === 'Volume Track 0483').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0483 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0484
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0484
     * @tc.desc   Verify metadata and session map volume case 484.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0484 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0484', title: 'Volume Track 0484', artist: 'Volume Artist 0484' };
      expect(metadata.assetId).assertEqual('volume-asset-0484');
      expect(metadata.title === 'Volume Track 0484').assertTrue();
      expect(metadata.artist === 'Volume Artist 0484').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0484', 'Volume Track 0484');
      expect(map.get('volume-session-0484') === 'Volume Track 0484').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0484 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0485
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0485
     * @tc.desc   Verify metadata and session map volume case 485.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0485 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0485', title: 'Volume Track 0485', artist: 'Volume Artist 0485' };
      expect(metadata.assetId).assertEqual('volume-asset-0485');
      expect(metadata.title === 'Volume Track 0485').assertTrue();
      expect(metadata.artist === 'Volume Artist 0485').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0485', 'Volume Track 0485');
      expect(map.get('volume-session-0485') === 'Volume Track 0485').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0485 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0486
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0486
     * @tc.desc   Verify metadata and session map volume case 486.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0486 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0486', title: 'Volume Track 0486', artist: 'Volume Artist 0486' };
      expect(metadata.assetId).assertEqual('volume-asset-0486');
      expect(metadata.title === 'Volume Track 0486').assertTrue();
      expect(metadata.artist === 'Volume Artist 0486').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0486', 'Volume Track 0486');
      expect(map.get('volume-session-0486') === 'Volume Track 0486').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0486 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0487
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0487
     * @tc.desc   Verify metadata and session map volume case 487.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0487 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0487', title: 'Volume Track 0487', artist: 'Volume Artist 0487' };
      expect(metadata.assetId).assertEqual('volume-asset-0487');
      expect(metadata.title === 'Volume Track 0487').assertTrue();
      expect(metadata.artist === 'Volume Artist 0487').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0487', 'Volume Track 0487');
      expect(map.get('volume-session-0487') === 'Volume Track 0487').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0487 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0488
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0488
     * @tc.desc   Verify metadata and session map volume case 488.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0488 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0488', title: 'Volume Track 0488', artist: 'Volume Artist 0488' };
      expect(metadata.assetId).assertEqual('volume-asset-0488');
      expect(metadata.title === 'Volume Track 0488').assertTrue();
      expect(metadata.artist === 'Volume Artist 0488').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0488', 'Volume Track 0488');
      expect(map.get('volume-session-0488') === 'Volume Track 0488').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0488 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0489
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0489
     * @tc.desc   Verify metadata and session map volume case 489.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0489 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0489', title: 'Volume Track 0489', artist: 'Volume Artist 0489' };
      expect(metadata.assetId).assertEqual('volume-asset-0489');
      expect(metadata.title === 'Volume Track 0489').assertTrue();
      expect(metadata.artist === 'Volume Artist 0489').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0489', 'Volume Track 0489');
      expect(map.get('volume-session-0489') === 'Volume Track 0489').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0489 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0490
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0490
     * @tc.desc   Verify metadata and session map volume case 490.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0490 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0490', title: 'Volume Track 0490', artist: 'Volume Artist 0490' };
      expect(metadata.assetId).assertEqual('volume-asset-0490');
      expect(metadata.title === 'Volume Track 0490').assertTrue();
      expect(metadata.artist === 'Volume Artist 0490').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0490', 'Volume Track 0490');
      expect(map.get('volume-session-0490') === 'Volume Track 0490').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0490 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0491
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0491
     * @tc.desc   Verify metadata and session map volume case 491.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0491 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0491', title: 'Volume Track 0491', artist: 'Volume Artist 0491' };
      expect(metadata.assetId).assertEqual('volume-asset-0491');
      expect(metadata.title === 'Volume Track 0491').assertTrue();
      expect(metadata.artist === 'Volume Artist 0491').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0491', 'Volume Track 0491');
      expect(map.get('volume-session-0491') === 'Volume Track 0491').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0491 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0492
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0492
     * @tc.desc   Verify metadata and session map volume case 492.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0492', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0492 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0492', title: 'Volume Track 0492', artist: 'Volume Artist 0492' };
      expect(metadata.assetId).assertEqual('volume-asset-0492');
      expect(metadata.title === 'Volume Track 0492').assertTrue();
      expect(metadata.artist === 'Volume Artist 0492').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0492', 'Volume Track 0492');
      expect(map.get('volume-session-0492') === 'Volume Track 0492').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0492 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0493
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0493
     * @tc.desc   Verify metadata and session map volume case 493.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0493', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0493 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0493', title: 'Volume Track 0493', artist: 'Volume Artist 0493' };
      expect(metadata.assetId).assertEqual('volume-asset-0493');
      expect(metadata.title === 'Volume Track 0493').assertTrue();
      expect(metadata.artist === 'Volume Artist 0493').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0493', 'Volume Track 0493');
      expect(map.get('volume-session-0493') === 'Volume Track 0493').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0493 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0494
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0494
     * @tc.desc   Verify metadata and session map volume case 494.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0494', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0494 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0494', title: 'Volume Track 0494', artist: 'Volume Artist 0494' };
      expect(metadata.assetId).assertEqual('volume-asset-0494');
      expect(metadata.title === 'Volume Track 0494').assertTrue();
      expect(metadata.artist === 'Volume Artist 0494').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0494', 'Volume Track 0494');
      expect(map.get('volume-session-0494') === 'Volume Track 0494').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0494 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0495
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0495
     * @tc.desc   Verify metadata and session map volume case 495.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0495', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0495 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0495', title: 'Volume Track 0495', artist: 'Volume Artist 0495' };
      expect(metadata.assetId).assertEqual('volume-asset-0495');
      expect(metadata.title === 'Volume Track 0495').assertTrue();
      expect(metadata.artist === 'Volume Artist 0495').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0495', 'Volume Track 0495');
      expect(map.get('volume-session-0495') === 'Volume Track 0495').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0495 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0496
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0496
     * @tc.desc   Verify metadata and session map volume case 496.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0496 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0496', title: 'Volume Track 0496', artist: 'Volume Artist 0496' };
      expect(metadata.assetId).assertEqual('volume-asset-0496');
      expect(metadata.title === 'Volume Track 0496').assertTrue();
      expect(metadata.artist === 'Volume Artist 0496').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0496', 'Volume Track 0496');
      expect(map.get('volume-session-0496') === 'Volume Track 0496').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0496 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0497
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0497
     * @tc.desc   Verify metadata and session map volume case 497.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0497', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0497 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0497', title: 'Volume Track 0497', artist: 'Volume Artist 0497' };
      expect(metadata.assetId).assertEqual('volume-asset-0497');
      expect(metadata.title === 'Volume Track 0497').assertTrue();
      expect(metadata.artist === 'Volume Artist 0497').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0497', 'Volume Track 0497');
      expect(map.get('volume-session-0497') === 'Volume Track 0497').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0497 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0498
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0498
     * @tc.desc   Verify metadata and session map volume case 498.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0498', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0498 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0498', title: 'Volume Track 0498', artist: 'Volume Artist 0498' };
      expect(metadata.assetId).assertEqual('volume-asset-0498');
      expect(metadata.title === 'Volume Track 0498').assertTrue();
      expect(metadata.artist === 'Volume Artist 0498').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0498', 'Volume Track 0498');
      expect(map.get('volume-session-0498') === 'Volume Track 0498').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0498 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0499
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0499
     * @tc.desc   Verify metadata and session map volume case 499.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0499', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0499 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0499', title: 'Volume Track 0499', artist: 'Volume Artist 0499' };
      expect(metadata.assetId).assertEqual('volume-asset-0499');
      expect(metadata.title === 'Volume Track 0499').assertTrue();
      expect(metadata.artist === 'Volume Artist 0499').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0499', 'Volume Track 0499');
      expect(map.get('volume-session-0499') === 'Volume Track 0499').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0499 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0500
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0500
     * @tc.desc   Verify metadata and session map volume case 500.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0500 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0500', title: 'Volume Track 0500', artist: 'Volume Artist 0500' };
      expect(metadata.assetId).assertEqual('volume-asset-0500');
      expect(metadata.title === 'Volume Track 0500').assertTrue();
      expect(metadata.artist === 'Volume Artist 0500').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0500', 'Volume Track 0500');
      expect(map.get('volume-session-0500') === 'Volume Track 0500').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0500 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0501
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0501
     * @tc.desc   Verify metadata and session map volume case 501.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0501 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0501', title: 'Volume Track 0501', artist: 'Volume Artist 0501' };
      expect(metadata.assetId).assertEqual('volume-asset-0501');
      expect(metadata.title === 'Volume Track 0501').assertTrue();
      expect(metadata.artist === 'Volume Artist 0501').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0501', 'Volume Track 0501');
      expect(map.get('volume-session-0501') === 'Volume Track 0501').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0501 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0502
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0502
     * @tc.desc   Verify metadata and session map volume case 502.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0502 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0502', title: 'Volume Track 0502', artist: 'Volume Artist 0502' };
      expect(metadata.assetId).assertEqual('volume-asset-0502');
      expect(metadata.title === 'Volume Track 0502').assertTrue();
      expect(metadata.artist === 'Volume Artist 0502').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0502', 'Volume Track 0502');
      expect(map.get('volume-session-0502') === 'Volume Track 0502').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0502 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0503
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0503
     * @tc.desc   Verify metadata and session map volume case 503.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0503 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0503', title: 'Volume Track 0503', artist: 'Volume Artist 0503' };
      expect(metadata.assetId).assertEqual('volume-asset-0503');
      expect(metadata.title === 'Volume Track 0503').assertTrue();
      expect(metadata.artist === 'Volume Artist 0503').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0503', 'Volume Track 0503');
      expect(map.get('volume-session-0503') === 'Volume Track 0503').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0503 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0504
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0504
     * @tc.desc   Verify metadata and session map volume case 504.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0504 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0504', title: 'Volume Track 0504', artist: 'Volume Artist 0504' };
      expect(metadata.assetId).assertEqual('volume-asset-0504');
      expect(metadata.title === 'Volume Track 0504').assertTrue();
      expect(metadata.artist === 'Volume Artist 0504').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0504', 'Volume Track 0504');
      expect(map.get('volume-session-0504') === 'Volume Track 0504').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0504 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0505
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0505
     * @tc.desc   Verify metadata and session map volume case 505.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0505 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0505', title: 'Volume Track 0505', artist: 'Volume Artist 0505' };
      expect(metadata.assetId).assertEqual('volume-asset-0505');
      expect(metadata.title === 'Volume Track 0505').assertTrue();
      expect(metadata.artist === 'Volume Artist 0505').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0505', 'Volume Track 0505');
      expect(map.get('volume-session-0505') === 'Volume Track 0505').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0505 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0506
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0506
     * @tc.desc   Verify metadata and session map volume case 506.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0506 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0506', title: 'Volume Track 0506', artist: 'Volume Artist 0506' };
      expect(metadata.assetId).assertEqual('volume-asset-0506');
      expect(metadata.title === 'Volume Track 0506').assertTrue();
      expect(metadata.artist === 'Volume Artist 0506').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0506', 'Volume Track 0506');
      expect(map.get('volume-session-0506') === 'Volume Track 0506').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0506 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0507
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0507
     * @tc.desc   Verify metadata and session map volume case 507.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0507 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0507', title: 'Volume Track 0507', artist: 'Volume Artist 0507' };
      expect(metadata.assetId).assertEqual('volume-asset-0507');
      expect(metadata.title === 'Volume Track 0507').assertTrue();
      expect(metadata.artist === 'Volume Artist 0507').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0507', 'Volume Track 0507');
      expect(map.get('volume-session-0507') === 'Volume Track 0507').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0507 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0508
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0508
     * @tc.desc   Verify metadata and session map volume case 508.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0508 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0508', title: 'Volume Track 0508', artist: 'Volume Artist 0508' };
      expect(metadata.assetId).assertEqual('volume-asset-0508');
      expect(metadata.title === 'Volume Track 0508').assertTrue();
      expect(metadata.artist === 'Volume Artist 0508').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0508', 'Volume Track 0508');
      expect(map.get('volume-session-0508') === 'Volume Track 0508').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0508 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0509
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0509
     * @tc.desc   Verify metadata and session map volume case 509.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0509 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0509', title: 'Volume Track 0509', artist: 'Volume Artist 0509' };
      expect(metadata.assetId).assertEqual('volume-asset-0509');
      expect(metadata.title === 'Volume Track 0509').assertTrue();
      expect(metadata.artist === 'Volume Artist 0509').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0509', 'Volume Track 0509');
      expect(map.get('volume-session-0509') === 'Volume Track 0509').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0509 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0510
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0510
     * @tc.desc   Verify metadata and session map volume case 510.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0510 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0510', title: 'Volume Track 0510', artist: 'Volume Artist 0510' };
      expect(metadata.assetId).assertEqual('volume-asset-0510');
      expect(metadata.title === 'Volume Track 0510').assertTrue();
      expect(metadata.artist === 'Volume Artist 0510').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0510', 'Volume Track 0510');
      expect(map.get('volume-session-0510') === 'Volume Track 0510').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0510 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0511
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0511
     * @tc.desc   Verify metadata and session map volume case 511.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0511 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0511', title: 'Volume Track 0511', artist: 'Volume Artist 0511' };
      expect(metadata.assetId).assertEqual('volume-asset-0511');
      expect(metadata.title === 'Volume Track 0511').assertTrue();
      expect(metadata.artist === 'Volume Artist 0511').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0511', 'Volume Track 0511');
      expect(map.get('volume-session-0511') === 'Volume Track 0511').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0511 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0512
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0512
     * @tc.desc   Verify metadata and session map volume case 512.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0512 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0512', title: 'Volume Track 0512', artist: 'Volume Artist 0512' };
      expect(metadata.assetId).assertEqual('volume-asset-0512');
      expect(metadata.title === 'Volume Track 0512').assertTrue();
      expect(metadata.artist === 'Volume Artist 0512').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0512', 'Volume Track 0512');
      expect(map.get('volume-session-0512') === 'Volume Track 0512').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0512 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0513
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0513
     * @tc.desc   Verify metadata and session map volume case 513.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0513 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0513', title: 'Volume Track 0513', artist: 'Volume Artist 0513' };
      expect(metadata.assetId).assertEqual('volume-asset-0513');
      expect(metadata.title === 'Volume Track 0513').assertTrue();
      expect(metadata.artist === 'Volume Artist 0513').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0513', 'Volume Track 0513');
      expect(map.get('volume-session-0513') === 'Volume Track 0513').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0513 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0514
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0514
     * @tc.desc   Verify metadata and session map volume case 514.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0514 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0514', title: 'Volume Track 0514', artist: 'Volume Artist 0514' };
      expect(metadata.assetId).assertEqual('volume-asset-0514');
      expect(metadata.title === 'Volume Track 0514').assertTrue();
      expect(metadata.artist === 'Volume Artist 0514').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0514', 'Volume Track 0514');
      expect(map.get('volume-session-0514') === 'Volume Track 0514').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0514 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0515
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0515
     * @tc.desc   Verify metadata and session map volume case 515.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0515', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0515 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0515', title: 'Volume Track 0515', artist: 'Volume Artist 0515' };
      expect(metadata.assetId).assertEqual('volume-asset-0515');
      expect(metadata.title === 'Volume Track 0515').assertTrue();
      expect(metadata.artist === 'Volume Artist 0515').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0515', 'Volume Track 0515');
      expect(map.get('volume-session-0515') === 'Volume Track 0515').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0515 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0516
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0516
     * @tc.desc   Verify metadata and session map volume case 516.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0516', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0516 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0516', title: 'Volume Track 0516', artist: 'Volume Artist 0516' };
      expect(metadata.assetId).assertEqual('volume-asset-0516');
      expect(metadata.title === 'Volume Track 0516').assertTrue();
      expect(metadata.artist === 'Volume Artist 0516').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0516', 'Volume Track 0516');
      expect(map.get('volume-session-0516') === 'Volume Track 0516').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0516 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0517
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0517
     * @tc.desc   Verify metadata and session map volume case 517.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0517', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0517 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0517', title: 'Volume Track 0517', artist: 'Volume Artist 0517' };
      expect(metadata.assetId).assertEqual('volume-asset-0517');
      expect(metadata.title === 'Volume Track 0517').assertTrue();
      expect(metadata.artist === 'Volume Artist 0517').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0517', 'Volume Track 0517');
      expect(map.get('volume-session-0517') === 'Volume Track 0517').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0517 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0518
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0518
     * @tc.desc   Verify metadata and session map volume case 518.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0518', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0518 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0518', title: 'Volume Track 0518', artist: 'Volume Artist 0518' };
      expect(metadata.assetId).assertEqual('volume-asset-0518');
      expect(metadata.title === 'Volume Track 0518').assertTrue();
      expect(metadata.artist === 'Volume Artist 0518').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0518', 'Volume Track 0518');
      expect(map.get('volume-session-0518') === 'Volume Track 0518').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0518 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0519
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0519
     * @tc.desc   Verify metadata and session map volume case 519.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0519', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0519 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0519', title: 'Volume Track 0519', artist: 'Volume Artist 0519' };
      expect(metadata.assetId).assertEqual('volume-asset-0519');
      expect(metadata.title === 'Volume Track 0519').assertTrue();
      expect(metadata.artist === 'Volume Artist 0519').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0519', 'Volume Track 0519');
      expect(map.get('volume-session-0519') === 'Volume Track 0519').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0519 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0520
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0520
     * @tc.desc   Verify metadata and session map volume case 520.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0520 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0520', title: 'Volume Track 0520', artist: 'Volume Artist 0520' };
      expect(metadata.assetId).assertEqual('volume-asset-0520');
      expect(metadata.title === 'Volume Track 0520').assertTrue();
      expect(metadata.artist === 'Volume Artist 0520').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0520', 'Volume Track 0520');
      expect(map.get('volume-session-0520') === 'Volume Track 0520').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0520 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0521
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0521
     * @tc.desc   Verify metadata and session map volume case 521.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0521', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0521 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0521', title: 'Volume Track 0521', artist: 'Volume Artist 0521' };
      expect(metadata.assetId).assertEqual('volume-asset-0521');
      expect(metadata.title === 'Volume Track 0521').assertTrue();
      expect(metadata.artist === 'Volume Artist 0521').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0521', 'Volume Track 0521');
      expect(map.get('volume-session-0521') === 'Volume Track 0521').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0521 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0522
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0522
     * @tc.desc   Verify metadata and session map volume case 522.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0522', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0522 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0522', title: 'Volume Track 0522', artist: 'Volume Artist 0522' };
      expect(metadata.assetId).assertEqual('volume-asset-0522');
      expect(metadata.title === 'Volume Track 0522').assertTrue();
      expect(metadata.artist === 'Volume Artist 0522').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0522', 'Volume Track 0522');
      expect(map.get('volume-session-0522') === 'Volume Track 0522').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0522 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0523
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0523
     * @tc.desc   Verify metadata and session map volume case 523.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0523', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0523 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0523', title: 'Volume Track 0523', artist: 'Volume Artist 0523' };
      expect(metadata.assetId).assertEqual('volume-asset-0523');
      expect(metadata.title === 'Volume Track 0523').assertTrue();
      expect(metadata.artist === 'Volume Artist 0523').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0523', 'Volume Track 0523');
      expect(map.get('volume-session-0523') === 'Volume Track 0523').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0523 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0524
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0524
     * @tc.desc   Verify metadata and session map volume case 524.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0524', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0524 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0524', title: 'Volume Track 0524', artist: 'Volume Artist 0524' };
      expect(metadata.assetId).assertEqual('volume-asset-0524');
      expect(metadata.title === 'Volume Track 0524').assertTrue();
      expect(metadata.artist === 'Volume Artist 0524').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0524', 'Volume Track 0524');
      expect(map.get('volume-session-0524') === 'Volume Track 0524').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0524 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0525
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0525
     * @tc.desc   Verify metadata and session map volume case 525.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0525', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0525 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0525', title: 'Volume Track 0525', artist: 'Volume Artist 0525' };
      expect(metadata.assetId).assertEqual('volume-asset-0525');
      expect(metadata.title === 'Volume Track 0525').assertTrue();
      expect(metadata.artist === 'Volume Artist 0525').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0525', 'Volume Track 0525');
      expect(map.get('volume-session-0525') === 'Volume Track 0525').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0525 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0526
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0526
     * @tc.desc   Verify metadata and session map volume case 526.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0526', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0526 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0526', title: 'Volume Track 0526', artist: 'Volume Artist 0526' };
      expect(metadata.assetId).assertEqual('volume-asset-0526');
      expect(metadata.title === 'Volume Track 0526').assertTrue();
      expect(metadata.artist === 'Volume Artist 0526').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0526', 'Volume Track 0526');
      expect(map.get('volume-session-0526') === 'Volume Track 0526').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0526 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0527
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0527
     * @tc.desc   Verify metadata and session map volume case 527.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0527', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0527 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0527', title: 'Volume Track 0527', artist: 'Volume Artist 0527' };
      expect(metadata.assetId).assertEqual('volume-asset-0527');
      expect(metadata.title === 'Volume Track 0527').assertTrue();
      expect(metadata.artist === 'Volume Artist 0527').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0527', 'Volume Track 0527');
      expect(map.get('volume-session-0527') === 'Volume Track 0527').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0527 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0528
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0528
     * @tc.desc   Verify metadata and session map volume case 528.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0528', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0528 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0528', title: 'Volume Track 0528', artist: 'Volume Artist 0528' };
      expect(metadata.assetId).assertEqual('volume-asset-0528');
      expect(metadata.title === 'Volume Track 0528').assertTrue();
      expect(metadata.artist === 'Volume Artist 0528').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0528', 'Volume Track 0528');
      expect(map.get('volume-session-0528') === 'Volume Track 0528').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0528 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0529
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0529
     * @tc.desc   Verify metadata and session map volume case 529.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0529', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0529 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0529', title: 'Volume Track 0529', artist: 'Volume Artist 0529' };
      expect(metadata.assetId).assertEqual('volume-asset-0529');
      expect(metadata.title === 'Volume Track 0529').assertTrue();
      expect(metadata.artist === 'Volume Artist 0529').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0529', 'Volume Track 0529');
      expect(map.get('volume-session-0529') === 'Volume Track 0529').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0529 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0530
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0530
     * @tc.desc   Verify metadata and session map volume case 530.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0530 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0530', title: 'Volume Track 0530', artist: 'Volume Artist 0530' };
      expect(metadata.assetId).assertEqual('volume-asset-0530');
      expect(metadata.title === 'Volume Track 0530').assertTrue();
      expect(metadata.artist === 'Volume Artist 0530').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0530', 'Volume Track 0530');
      expect(map.get('volume-session-0530') === 'Volume Track 0530').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0530 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0531
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0531
     * @tc.desc   Verify metadata and session map volume case 531.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0531', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0531 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0531', title: 'Volume Track 0531', artist: 'Volume Artist 0531' };
      expect(metadata.assetId).assertEqual('volume-asset-0531');
      expect(metadata.title === 'Volume Track 0531').assertTrue();
      expect(metadata.artist === 'Volume Artist 0531').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0531', 'Volume Track 0531');
      expect(map.get('volume-session-0531') === 'Volume Track 0531').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0531 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0532
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0532
     * @tc.desc   Verify metadata and session map volume case 532.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0532', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0532 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0532', title: 'Volume Track 0532', artist: 'Volume Artist 0532' };
      expect(metadata.assetId).assertEqual('volume-asset-0532');
      expect(metadata.title === 'Volume Track 0532').assertTrue();
      expect(metadata.artist === 'Volume Artist 0532').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0532', 'Volume Track 0532');
      expect(map.get('volume-session-0532') === 'Volume Track 0532').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0532 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0533
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0533
     * @tc.desc   Verify metadata and session map volume case 533.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0533', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0533 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0533', title: 'Volume Track 0533', artist: 'Volume Artist 0533' };
      expect(metadata.assetId).assertEqual('volume-asset-0533');
      expect(metadata.title === 'Volume Track 0533').assertTrue();
      expect(metadata.artist === 'Volume Artist 0533').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0533', 'Volume Track 0533');
      expect(map.get('volume-session-0533') === 'Volume Track 0533').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0533 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0534
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0534
     * @tc.desc   Verify metadata and session map volume case 534.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0534', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0534 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0534', title: 'Volume Track 0534', artist: 'Volume Artist 0534' };
      expect(metadata.assetId).assertEqual('volume-asset-0534');
      expect(metadata.title === 'Volume Track 0534').assertTrue();
      expect(metadata.artist === 'Volume Artist 0534').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0534', 'Volume Track 0534');
      expect(map.get('volume-session-0534') === 'Volume Track 0534').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0534 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0535
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0535
     * @tc.desc   Verify metadata and session map volume case 535.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0535', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0535 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0535', title: 'Volume Track 0535', artist: 'Volume Artist 0535' };
      expect(metadata.assetId).assertEqual('volume-asset-0535');
      expect(metadata.title === 'Volume Track 0535').assertTrue();
      expect(metadata.artist === 'Volume Artist 0535').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0535', 'Volume Track 0535');
      expect(map.get('volume-session-0535') === 'Volume Track 0535').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0535 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0536
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0536
     * @tc.desc   Verify metadata and session map volume case 536.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0536', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0536 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0536', title: 'Volume Track 0536', artist: 'Volume Artist 0536' };
      expect(metadata.assetId).assertEqual('volume-asset-0536');
      expect(metadata.title === 'Volume Track 0536').assertTrue();
      expect(metadata.artist === 'Volume Artist 0536').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0536', 'Volume Track 0536');
      expect(map.get('volume-session-0536') === 'Volume Track 0536').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0536 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0537
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0537
     * @tc.desc   Verify metadata and session map volume case 537.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0537', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0537 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0537', title: 'Volume Track 0537', artist: 'Volume Artist 0537' };
      expect(metadata.assetId).assertEqual('volume-asset-0537');
      expect(metadata.title === 'Volume Track 0537').assertTrue();
      expect(metadata.artist === 'Volume Artist 0537').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0537', 'Volume Track 0537');
      expect(map.get('volume-session-0537') === 'Volume Track 0537').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0537 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0538
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0538
     * @tc.desc   Verify metadata and session map volume case 538.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0538', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0538 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0538', title: 'Volume Track 0538', artist: 'Volume Artist 0538' };
      expect(metadata.assetId).assertEqual('volume-asset-0538');
      expect(metadata.title === 'Volume Track 0538').assertTrue();
      expect(metadata.artist === 'Volume Artist 0538').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0538', 'Volume Track 0538');
      expect(map.get('volume-session-0538') === 'Volume Track 0538').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0538 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0539
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0539
     * @tc.desc   Verify metadata and session map volume case 539.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0539', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0539 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0539', title: 'Volume Track 0539', artist: 'Volume Artist 0539' };
      expect(metadata.assetId).assertEqual('volume-asset-0539');
      expect(metadata.title === 'Volume Track 0539').assertTrue();
      expect(metadata.artist === 'Volume Artist 0539').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0539', 'Volume Track 0539');
      expect(map.get('volume-session-0539') === 'Volume Track 0539').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0539 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0540
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0540
     * @tc.desc   Verify metadata and session map volume case 540.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0540 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0540', title: 'Volume Track 0540', artist: 'Volume Artist 0540' };
      expect(metadata.assetId).assertEqual('volume-asset-0540');
      expect(metadata.title === 'Volume Track 0540').assertTrue();
      expect(metadata.artist === 'Volume Artist 0540').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0540', 'Volume Track 0540');
      expect(map.get('volume-session-0540') === 'Volume Track 0540').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0540 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0541
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0541
     * @tc.desc   Verify metadata and session map volume case 541.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0541', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0541 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0541', title: 'Volume Track 0541', artist: 'Volume Artist 0541' };
      expect(metadata.assetId).assertEqual('volume-asset-0541');
      expect(metadata.title === 'Volume Track 0541').assertTrue();
      expect(metadata.artist === 'Volume Artist 0541').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0541', 'Volume Track 0541');
      expect(map.get('volume-session-0541') === 'Volume Track 0541').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0541 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0542
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0542
     * @tc.desc   Verify metadata and session map volume case 542.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0542', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0542 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0542', title: 'Volume Track 0542', artist: 'Volume Artist 0542' };
      expect(metadata.assetId).assertEqual('volume-asset-0542');
      expect(metadata.title === 'Volume Track 0542').assertTrue();
      expect(metadata.artist === 'Volume Artist 0542').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0542', 'Volume Track 0542');
      expect(map.get('volume-session-0542') === 'Volume Track 0542').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0542 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0543
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0543
     * @tc.desc   Verify metadata and session map volume case 543.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0543', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0543 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0543', title: 'Volume Track 0543', artist: 'Volume Artist 0543' };
      expect(metadata.assetId).assertEqual('volume-asset-0543');
      expect(metadata.title === 'Volume Track 0543').assertTrue();
      expect(metadata.artist === 'Volume Artist 0543').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0543', 'Volume Track 0543');
      expect(map.get('volume-session-0543') === 'Volume Track 0543').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0543 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0544
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0544
     * @tc.desc   Verify metadata and session map volume case 544.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0544', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0544 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0544', title: 'Volume Track 0544', artist: 'Volume Artist 0544' };
      expect(metadata.assetId).assertEqual('volume-asset-0544');
      expect(metadata.title === 'Volume Track 0544').assertTrue();
      expect(metadata.artist === 'Volume Artist 0544').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0544', 'Volume Track 0544');
      expect(map.get('volume-session-0544') === 'Volume Track 0544').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0544 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0545
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0545
     * @tc.desc   Verify metadata and session map volume case 545.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0545', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0545 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0545', title: 'Volume Track 0545', artist: 'Volume Artist 0545' };
      expect(metadata.assetId).assertEqual('volume-asset-0545');
      expect(metadata.title === 'Volume Track 0545').assertTrue();
      expect(metadata.artist === 'Volume Artist 0545').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0545', 'Volume Track 0545');
      expect(map.get('volume-session-0545') === 'Volume Track 0545').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0545 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0546
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0546
     * @tc.desc   Verify metadata and session map volume case 546.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0546', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0546 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0546', title: 'Volume Track 0546', artist: 'Volume Artist 0546' };
      expect(metadata.assetId).assertEqual('volume-asset-0546');
      expect(metadata.title === 'Volume Track 0546').assertTrue();
      expect(metadata.artist === 'Volume Artist 0546').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0546', 'Volume Track 0546');
      expect(map.get('volume-session-0546') === 'Volume Track 0546').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0546 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0547
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0547
     * @tc.desc   Verify metadata and session map volume case 547.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0547', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0547 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0547', title: 'Volume Track 0547', artist: 'Volume Artist 0547' };
      expect(metadata.assetId).assertEqual('volume-asset-0547');
      expect(metadata.title === 'Volume Track 0547').assertTrue();
      expect(metadata.artist === 'Volume Artist 0547').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0547', 'Volume Track 0547');
      expect(map.get('volume-session-0547') === 'Volume Track 0547').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0547 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0548
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0548
     * @tc.desc   Verify metadata and session map volume case 548.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0548 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0548', title: 'Volume Track 0548', artist: 'Volume Artist 0548' };
      expect(metadata.assetId).assertEqual('volume-asset-0548');
      expect(metadata.title === 'Volume Track 0548').assertTrue();
      expect(metadata.artist === 'Volume Artist 0548').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0548', 'Volume Track 0548');
      expect(map.get('volume-session-0548') === 'Volume Track 0548').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0548 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0549
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0549
     * @tc.desc   Verify metadata and session map volume case 549.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0549', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0549 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0549', title: 'Volume Track 0549', artist: 'Volume Artist 0549' };
      expect(metadata.assetId).assertEqual('volume-asset-0549');
      expect(metadata.title === 'Volume Track 0549').assertTrue();
      expect(metadata.artist === 'Volume Artist 0549').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0549', 'Volume Track 0549');
      expect(map.get('volume-session-0549') === 'Volume Track 0549').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0549 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0550
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0550
     * @tc.desc   Verify metadata and session map volume case 550.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0550 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0550', title: 'Volume Track 0550', artist: 'Volume Artist 0550' };
      expect(metadata.assetId).assertEqual('volume-asset-0550');
      expect(metadata.title === 'Volume Track 0550').assertTrue();
      expect(metadata.artist === 'Volume Artist 0550').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0550', 'Volume Track 0550');
      expect(map.get('volume-session-0550') === 'Volume Track 0550').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0550 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0551
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0551
     * @tc.desc   Verify metadata and session map volume case 551.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0551', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0551 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0551', title: 'Volume Track 0551', artist: 'Volume Artist 0551' };
      expect(metadata.assetId).assertEqual('volume-asset-0551');
      expect(metadata.title === 'Volume Track 0551').assertTrue();
      expect(metadata.artist === 'Volume Artist 0551').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0551', 'Volume Track 0551');
      expect(map.get('volume-session-0551') === 'Volume Track 0551').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0551 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0552
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0552
     * @tc.desc   Verify metadata and session map volume case 552.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0552', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0552 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0552', title: 'Volume Track 0552', artist: 'Volume Artist 0552' };
      expect(metadata.assetId).assertEqual('volume-asset-0552');
      expect(metadata.title === 'Volume Track 0552').assertTrue();
      expect(metadata.artist === 'Volume Artist 0552').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0552', 'Volume Track 0552');
      expect(map.get('volume-session-0552') === 'Volume Track 0552').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0552 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0553
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0553
     * @tc.desc   Verify metadata and session map volume case 553.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0553', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0553 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0553', title: 'Volume Track 0553', artist: 'Volume Artist 0553' };
      expect(metadata.assetId).assertEqual('volume-asset-0553');
      expect(metadata.title === 'Volume Track 0553').assertTrue();
      expect(metadata.artist === 'Volume Artist 0553').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0553', 'Volume Track 0553');
      expect(map.get('volume-session-0553') === 'Volume Track 0553').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0553 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0554
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0554
     * @tc.desc   Verify metadata and session map volume case 554.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0554', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0554 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0554', title: 'Volume Track 0554', artist: 'Volume Artist 0554' };
      expect(metadata.assetId).assertEqual('volume-asset-0554');
      expect(metadata.title === 'Volume Track 0554').assertTrue();
      expect(metadata.artist === 'Volume Artist 0554').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0554', 'Volume Track 0554');
      expect(map.get('volume-session-0554') === 'Volume Track 0554').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0554 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0555
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0555
     * @tc.desc   Verify metadata and session map volume case 555.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0555', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0555 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0555', title: 'Volume Track 0555', artist: 'Volume Artist 0555' };
      expect(metadata.assetId).assertEqual('volume-asset-0555');
      expect(metadata.title === 'Volume Track 0555').assertTrue();
      expect(metadata.artist === 'Volume Artist 0555').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0555', 'Volume Track 0555');
      expect(map.get('volume-session-0555') === 'Volume Track 0555').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0555 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0556
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0556
     * @tc.desc   Verify metadata and session map volume case 556.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0556', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0556 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0556', title: 'Volume Track 0556', artist: 'Volume Artist 0556' };
      expect(metadata.assetId).assertEqual('volume-asset-0556');
      expect(metadata.title === 'Volume Track 0556').assertTrue();
      expect(metadata.artist === 'Volume Artist 0556').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0556', 'Volume Track 0556');
      expect(map.get('volume-session-0556') === 'Volume Track 0556').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0556 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0557
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0557
     * @tc.desc   Verify metadata and session map volume case 557.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0557', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0557 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0557', title: 'Volume Track 0557', artist: 'Volume Artist 0557' };
      expect(metadata.assetId).assertEqual('volume-asset-0557');
      expect(metadata.title === 'Volume Track 0557').assertTrue();
      expect(metadata.artist === 'Volume Artist 0557').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0557', 'Volume Track 0557');
      expect(map.get('volume-session-0557') === 'Volume Track 0557').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0557 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0558
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0558
     * @tc.desc   Verify metadata and session map volume case 558.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0558', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0558 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0558', title: 'Volume Track 0558', artist: 'Volume Artist 0558' };
      expect(metadata.assetId).assertEqual('volume-asset-0558');
      expect(metadata.title === 'Volume Track 0558').assertTrue();
      expect(metadata.artist === 'Volume Artist 0558').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0558', 'Volume Track 0558');
      expect(map.get('volume-session-0558') === 'Volume Track 0558').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0558 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0559
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0559
     * @tc.desc   Verify metadata and session map volume case 559.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0559', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0559 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0559', title: 'Volume Track 0559', artist: 'Volume Artist 0559' };
      expect(metadata.assetId).assertEqual('volume-asset-0559');
      expect(metadata.title === 'Volume Track 0559').assertTrue();
      expect(metadata.artist === 'Volume Artist 0559').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0559', 'Volume Track 0559');
      expect(map.get('volume-session-0559') === 'Volume Track 0559').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0559 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0560
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0560
     * @tc.desc   Verify metadata and session map volume case 560.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0560 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0560', title: 'Volume Track 0560', artist: 'Volume Artist 0560' };
      expect(metadata.assetId).assertEqual('volume-asset-0560');
      expect(metadata.title === 'Volume Track 0560').assertTrue();
      expect(metadata.artist === 'Volume Artist 0560').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0560', 'Volume Track 0560');
      expect(map.get('volume-session-0560') === 'Volume Track 0560').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0560 end');
    })
  })
}
