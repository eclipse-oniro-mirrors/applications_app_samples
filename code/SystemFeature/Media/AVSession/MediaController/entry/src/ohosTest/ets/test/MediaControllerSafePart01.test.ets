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

export default function mediaControllerSafeTestPart01() {
  describe('MediaControllerSafePart01', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0001
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0001
     * @tc.desc   Verify metadata case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0001 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-001', title: 'Safe Track 001', artist: 'Safe Artist 001' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 001'));
      expect(metadata.assetId).assertEqual('safe-asset-001');
      expect(metadata.title === 'Safe Track 001').assertTrue();
      expect(metadata.artist === 'Safe Artist 001').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0001 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0002
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0002
     * @tc.desc   Verify metadata case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0002 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-002', title: 'Safe Track 002', artist: 'Safe Artist 002' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 002'));
      expect(metadata.assetId).assertEqual('safe-asset-002');
      expect(metadata.title === 'Safe Track 002').assertTrue();
      expect(metadata.artist === 'Safe Artist 002').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0002 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0003
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0003
     * @tc.desc   Verify metadata case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0003 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-003', title: 'Safe Track 003', artist: 'Safe Artist 003' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 003'));
      expect(metadata.assetId).assertEqual('safe-asset-003');
      expect(metadata.title === 'Safe Track 003').assertTrue();
      expect(metadata.artist === 'Safe Artist 003').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0003 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0004
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0004
     * @tc.desc   Verify metadata case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0004 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-004', title: 'Safe Track 004', artist: 'Safe Artist 004' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 004'));
      expect(metadata.assetId).assertEqual('safe-asset-004');
      expect(metadata.title === 'Safe Track 004').assertTrue();
      expect(metadata.artist === 'Safe Artist 004').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0004 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0005
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0005
     * @tc.desc   Verify metadata case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0005 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-005', title: 'Safe Track 005', artist: 'Safe Artist 005' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 005'));
      expect(metadata.assetId).assertEqual('safe-asset-005');
      expect(metadata.title === 'Safe Track 005').assertTrue();
      expect(metadata.artist === 'Safe Artist 005').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0005 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0006
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0006
     * @tc.desc   Verify metadata case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0006 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-006', title: 'Safe Track 006', artist: 'Safe Artist 006' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 006'));
      expect(metadata.assetId).assertEqual('safe-asset-006');
      expect(metadata.title === 'Safe Track 006').assertTrue();
      expect(metadata.artist === 'Safe Artist 006').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0006 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0007
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0007
     * @tc.desc   Verify metadata case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0007 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-007', title: 'Safe Track 007', artist: 'Safe Artist 007' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 007'));
      expect(metadata.assetId).assertEqual('safe-asset-007');
      expect(metadata.title === 'Safe Track 007').assertTrue();
      expect(metadata.artist === 'Safe Artist 007').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0007 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0008
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0008
     * @tc.desc   Verify metadata case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0008 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-008', title: 'Safe Track 008', artist: 'Safe Artist 008' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 008'));
      expect(metadata.assetId).assertEqual('safe-asset-008');
      expect(metadata.title === 'Safe Track 008').assertTrue();
      expect(metadata.artist === 'Safe Artist 008').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0008 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0009
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0009
     * @tc.desc   Verify metadata case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0009 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-009', title: 'Safe Track 009', artist: 'Safe Artist 009' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 009'));
      expect(metadata.assetId).assertEqual('safe-asset-009');
      expect(metadata.title === 'Safe Track 009').assertTrue();
      expect(metadata.artist === 'Safe Artist 009').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0009 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0010
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0010
     * @tc.desc   Verify metadata case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0010 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-010', title: 'Safe Track 010', artist: 'Safe Artist 010' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 010'));
      expect(metadata.assetId).assertEqual('safe-asset-010');
      expect(metadata.title === 'Safe Track 010').assertTrue();
      expect(metadata.artist === 'Safe Artist 010').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0010 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0011
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0011
     * @tc.desc   Verify metadata case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0011 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-011', title: 'Safe Track 011', artist: 'Safe Artist 011' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 011'));
      expect(metadata.assetId).assertEqual('safe-asset-011');
      expect(metadata.title === 'Safe Track 011').assertTrue();
      expect(metadata.artist === 'Safe Artist 011').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0011 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0012
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0012
     * @tc.desc   Verify metadata case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0012 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-012', title: 'Safe Track 012', artist: 'Safe Artist 012' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 012'));
      expect(metadata.assetId).assertEqual('safe-asset-012');
      expect(metadata.title === 'Safe Track 012').assertTrue();
      expect(metadata.artist === 'Safe Artist 012').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0012 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0013
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0013
     * @tc.desc   Verify metadata case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0013 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-013', title: 'Safe Track 013', artist: 'Safe Artist 013' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 013'));
      expect(metadata.assetId).assertEqual('safe-asset-013');
      expect(metadata.title === 'Safe Track 013').assertTrue();
      expect(metadata.artist === 'Safe Artist 013').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0013 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0014
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0014
     * @tc.desc   Verify metadata case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0014 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-014', title: 'Safe Track 014', artist: 'Safe Artist 014' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 014'));
      expect(metadata.assetId).assertEqual('safe-asset-014');
      expect(metadata.title === 'Safe Track 014').assertTrue();
      expect(metadata.artist === 'Safe Artist 014').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0014 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0015
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0015
     * @tc.desc   Verify metadata case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0015 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-015', title: 'Safe Track 015', artist: 'Safe Artist 015' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 015'));
      expect(metadata.assetId).assertEqual('safe-asset-015');
      expect(metadata.title === 'Safe Track 015').assertTrue();
      expect(metadata.artist === 'Safe Artist 015').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0015 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0016
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0016
     * @tc.desc   Verify metadata case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0016 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-016', title: 'Safe Track 016', artist: 'Safe Artist 016' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 016'));
      expect(metadata.assetId).assertEqual('safe-asset-016');
      expect(metadata.title === 'Safe Track 016').assertTrue();
      expect(metadata.artist === 'Safe Artist 016').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0016 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0017
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0017
     * @tc.desc   Verify metadata case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0017 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-017', title: 'Safe Track 017', artist: 'Safe Artist 017' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 017'));
      expect(metadata.assetId).assertEqual('safe-asset-017');
      expect(metadata.title === 'Safe Track 017').assertTrue();
      expect(metadata.artist === 'Safe Artist 017').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0017 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0018
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0018
     * @tc.desc   Verify metadata case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0018 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-018', title: 'Safe Track 018', artist: 'Safe Artist 018' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 018'));
      expect(metadata.assetId).assertEqual('safe-asset-018');
      expect(metadata.title === 'Safe Track 018').assertTrue();
      expect(metadata.artist === 'Safe Artist 018').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0018 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0019
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0019
     * @tc.desc   Verify metadata case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0019 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-019', title: 'Safe Track 019', artist: 'Safe Artist 019' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 019'));
      expect(metadata.assetId).assertEqual('safe-asset-019');
      expect(metadata.title === 'Safe Track 019').assertTrue();
      expect(metadata.artist === 'Safe Artist 019').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0019 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0020
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0020
     * @tc.desc   Verify metadata case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0020 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-020', title: 'Safe Track 020', artist: 'Safe Artist 020' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 020'));
      expect(metadata.assetId).assertEqual('safe-asset-020');
      expect(metadata.title === 'Safe Track 020').assertTrue();
      expect(metadata.artist === 'Safe Artist 020').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0020 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0021
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0021
     * @tc.desc   Verify metadata case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0021 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-021', title: 'Safe Track 021', artist: 'Safe Artist 021' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 021'));
      expect(metadata.assetId).assertEqual('safe-asset-021');
      expect(metadata.title === 'Safe Track 021').assertTrue();
      expect(metadata.artist === 'Safe Artist 021').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0021 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0022
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0022
     * @tc.desc   Verify metadata case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0022 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-022', title: 'Safe Track 022', artist: 'Safe Artist 022' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 022'));
      expect(metadata.assetId).assertEqual('safe-asset-022');
      expect(metadata.title === 'Safe Track 022').assertTrue();
      expect(metadata.artist === 'Safe Artist 022').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0022 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0023
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0023
     * @tc.desc   Verify metadata case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0023 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-023', title: 'Safe Track 023', artist: 'Safe Artist 023' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 023'));
      expect(metadata.assetId).assertEqual('safe-asset-023');
      expect(metadata.title === 'Safe Track 023').assertTrue();
      expect(metadata.artist === 'Safe Artist 023').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0023 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0024
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0024
     * @tc.desc   Verify metadata case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0024 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-024', title: 'Safe Track 024', artist: 'Safe Artist 024' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 024'));
      expect(metadata.assetId).assertEqual('safe-asset-024');
      expect(metadata.title === 'Safe Track 024').assertTrue();
      expect(metadata.artist === 'Safe Artist 024').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0024 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0025
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0025
     * @tc.desc   Verify metadata case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0025 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-025', title: 'Safe Track 025', artist: 'Safe Artist 025' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 025'));
      expect(metadata.assetId).assertEqual('safe-asset-025');
      expect(metadata.title === 'Safe Track 025').assertTrue();
      expect(metadata.artist === 'Safe Artist 025').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0025 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0026
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0026
     * @tc.desc   Verify metadata case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0026 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-026', title: 'Safe Track 026', artist: 'Safe Artist 026' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 026'));
      expect(metadata.assetId).assertEqual('safe-asset-026');
      expect(metadata.title === 'Safe Track 026').assertTrue();
      expect(metadata.artist === 'Safe Artist 026').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0026 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0027
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0027
     * @tc.desc   Verify metadata case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0027 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-027', title: 'Safe Track 027', artist: 'Safe Artist 027' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 027'));
      expect(metadata.assetId).assertEqual('safe-asset-027');
      expect(metadata.title === 'Safe Track 027').assertTrue();
      expect(metadata.artist === 'Safe Artist 027').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0027 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0028
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0028
     * @tc.desc   Verify metadata case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0028 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-028', title: 'Safe Track 028', artist: 'Safe Artist 028' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 028'));
      expect(metadata.assetId).assertEqual('safe-asset-028');
      expect(metadata.title === 'Safe Track 028').assertTrue();
      expect(metadata.artist === 'Safe Artist 028').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0028 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0029
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0029
     * @tc.desc   Verify metadata case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0029 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-029', title: 'Safe Track 029', artist: 'Safe Artist 029' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 029'));
      expect(metadata.assetId).assertEqual('safe-asset-029');
      expect(metadata.title === 'Safe Track 029').assertTrue();
      expect(metadata.artist === 'Safe Artist 029').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0029 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0030
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0030
     * @tc.desc   Verify metadata case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0030 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-030', title: 'Safe Track 030', artist: 'Safe Artist 030' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 030'));
      expect(metadata.assetId).assertEqual('safe-asset-030');
      expect(metadata.title === 'Safe Track 030').assertTrue();
      expect(metadata.artist === 'Safe Artist 030').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0030 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0031
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0031
     * @tc.desc   Verify metadata case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0031 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-031', title: 'Safe Track 031', artist: 'Safe Artist 031' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 031'));
      expect(metadata.assetId).assertEqual('safe-asset-031');
      expect(metadata.title === 'Safe Track 031').assertTrue();
      expect(metadata.artist === 'Safe Artist 031').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0031 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0032
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0032
     * @tc.desc   Verify metadata case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0032 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-032', title: 'Safe Track 032', artist: 'Safe Artist 032' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 032'));
      expect(metadata.assetId).assertEqual('safe-asset-032');
      expect(metadata.title === 'Safe Track 032').assertTrue();
      expect(metadata.artist === 'Safe Artist 032').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0032 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0033
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0033
     * @tc.desc   Verify metadata case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0033 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-033', title: 'Safe Track 033', artist: 'Safe Artist 033' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 033'));
      expect(metadata.assetId).assertEqual('safe-asset-033');
      expect(metadata.title === 'Safe Track 033').assertTrue();
      expect(metadata.artist === 'Safe Artist 033').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0033 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0034
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0034
     * @tc.desc   Verify metadata case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0034 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-034', title: 'Safe Track 034', artist: 'Safe Artist 034' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 034'));
      expect(metadata.assetId).assertEqual('safe-asset-034');
      expect(metadata.title === 'Safe Track 034').assertTrue();
      expect(metadata.artist === 'Safe Artist 034').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0034 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0035
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0035
     * @tc.desc   Verify metadata case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0035 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-035', title: 'Safe Track 035', artist: 'Safe Artist 035' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 035'));
      expect(metadata.assetId).assertEqual('safe-asset-035');
      expect(metadata.title === 'Safe Track 035').assertTrue();
      expect(metadata.artist === 'Safe Artist 035').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0035 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0036
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0036
     * @tc.desc   Verify metadata case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0036 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-036', title: 'Safe Track 036', artist: 'Safe Artist 036' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 036'));
      expect(metadata.assetId).assertEqual('safe-asset-036');
      expect(metadata.title === 'Safe Track 036').assertTrue();
      expect(metadata.artist === 'Safe Artist 036').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0036 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0037
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0037
     * @tc.desc   Verify metadata case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0037 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-037', title: 'Safe Track 037', artist: 'Safe Artist 037' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 037'));
      expect(metadata.assetId).assertEqual('safe-asset-037');
      expect(metadata.title === 'Safe Track 037').assertTrue();
      expect(metadata.artist === 'Safe Artist 037').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0037 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0038
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0038
     * @tc.desc   Verify metadata case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0038 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-038', title: 'Safe Track 038', artist: 'Safe Artist 038' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 038'));
      expect(metadata.assetId).assertEqual('safe-asset-038');
      expect(metadata.title === 'Safe Track 038').assertTrue();
      expect(metadata.artist === 'Safe Artist 038').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0038 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0039
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0039
     * @tc.desc   Verify metadata case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0039 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-039', title: 'Safe Track 039', artist: 'Safe Artist 039' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 039'));
      expect(metadata.assetId).assertEqual('safe-asset-039');
      expect(metadata.title === 'Safe Track 039').assertTrue();
      expect(metadata.artist === 'Safe Artist 039').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0039 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0040
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0040
     * @tc.desc   Verify metadata case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0040 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-040', title: 'Safe Track 040', artist: 'Safe Artist 040' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 040'));
      expect(metadata.assetId).assertEqual('safe-asset-040');
      expect(metadata.title === 'Safe Track 040').assertTrue();
      expect(metadata.artist === 'Safe Artist 040').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0040 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0041
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0041
     * @tc.desc   Verify metadata case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0041 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-041', title: 'Safe Track 041', artist: 'Safe Artist 041' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 041'));
      expect(metadata.assetId).assertEqual('safe-asset-041');
      expect(metadata.title === 'Safe Track 041').assertTrue();
      expect(metadata.artist === 'Safe Artist 041').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0041 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0042
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0042
     * @tc.desc   Verify metadata case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0042 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-042', title: 'Safe Track 042', artist: 'Safe Artist 042' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 042'));
      expect(metadata.assetId).assertEqual('safe-asset-042');
      expect(metadata.title === 'Safe Track 042').assertTrue();
      expect(metadata.artist === 'Safe Artist 042').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0042 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0043
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0043
     * @tc.desc   Verify metadata case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0043 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-043', title: 'Safe Track 043', artist: 'Safe Artist 043' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 043'));
      expect(metadata.assetId).assertEqual('safe-asset-043');
      expect(metadata.title === 'Safe Track 043').assertTrue();
      expect(metadata.artist === 'Safe Artist 043').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0043 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0044
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0044
     * @tc.desc   Verify metadata case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0044 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-044', title: 'Safe Track 044', artist: 'Safe Artist 044' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 044'));
      expect(metadata.assetId).assertEqual('safe-asset-044');
      expect(metadata.title === 'Safe Track 044').assertTrue();
      expect(metadata.artist === 'Safe Artist 044').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0044 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0045
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0045
     * @tc.desc   Verify metadata case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0045 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-045', title: 'Safe Track 045', artist: 'Safe Artist 045' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 045'));
      expect(metadata.assetId).assertEqual('safe-asset-045');
      expect(metadata.title === 'Safe Track 045').assertTrue();
      expect(metadata.artist === 'Safe Artist 045').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0045 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0046
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0046
     * @tc.desc   Verify metadata case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0046 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-046', title: 'Safe Track 046', artist: 'Safe Artist 046' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 046'));
      expect(metadata.assetId).assertEqual('safe-asset-046');
      expect(metadata.title === 'Safe Track 046').assertTrue();
      expect(metadata.artist === 'Safe Artist 046').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0046 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0047
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0047
     * @tc.desc   Verify metadata case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0047 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-047', title: 'Safe Track 047', artist: 'Safe Artist 047' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 047'));
      expect(metadata.assetId).assertEqual('safe-asset-047');
      expect(metadata.title === 'Safe Track 047').assertTrue();
      expect(metadata.artist === 'Safe Artist 047').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0047 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0048
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0048
     * @tc.desc   Verify metadata case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0048 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-048', title: 'Safe Track 048', artist: 'Safe Artist 048' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 048'));
      expect(metadata.assetId).assertEqual('safe-asset-048');
      expect(metadata.title === 'Safe Track 048').assertTrue();
      expect(metadata.artist === 'Safe Artist 048').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0048 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0049
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0049
     * @tc.desc   Verify metadata case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0049 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-049', title: 'Safe Track 049', artist: 'Safe Artist 049' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 049'));
      expect(metadata.assetId).assertEqual('safe-asset-049');
      expect(metadata.title === 'Safe Track 049').assertTrue();
      expect(metadata.artist === 'Safe Artist 049').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0049 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0050
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0050
     * @tc.desc   Verify metadata case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0050 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-050', title: 'Safe Track 050', artist: 'Safe Artist 050' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 050'));
      expect(metadata.assetId).assertEqual('safe-asset-050');
      expect(metadata.title === 'Safe Track 050').assertTrue();
      expect(metadata.artist === 'Safe Artist 050').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0050 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0051
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0051
     * @tc.desc   Verify metadata case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0051 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-051', title: 'Safe Track 051', artist: 'Safe Artist 051' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 051'));
      expect(metadata.assetId).assertEqual('safe-asset-051');
      expect(metadata.title === 'Safe Track 051').assertTrue();
      expect(metadata.artist === 'Safe Artist 051').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0051 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0052
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0052
     * @tc.desc   Verify metadata case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0052 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-052', title: 'Safe Track 052', artist: 'Safe Artist 052' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 052'));
      expect(metadata.assetId).assertEqual('safe-asset-052');
      expect(metadata.title === 'Safe Track 052').assertTrue();
      expect(metadata.artist === 'Safe Artist 052').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0052 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0053
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0053
     * @tc.desc   Verify metadata case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0053 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-053', title: 'Safe Track 053', artist: 'Safe Artist 053' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 053'));
      expect(metadata.assetId).assertEqual('safe-asset-053');
      expect(metadata.title === 'Safe Track 053').assertTrue();
      expect(metadata.artist === 'Safe Artist 053').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0053 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0054
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0054
     * @tc.desc   Verify metadata case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0054 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-054', title: 'Safe Track 054', artist: 'Safe Artist 054' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 054'));
      expect(metadata.assetId).assertEqual('safe-asset-054');
      expect(metadata.title === 'Safe Track 054').assertTrue();
      expect(metadata.artist === 'Safe Artist 054').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0054 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0055
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0055
     * @tc.desc   Verify metadata case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0055 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-055', title: 'Safe Track 055', artist: 'Safe Artist 055' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 055'));
      expect(metadata.assetId).assertEqual('safe-asset-055');
      expect(metadata.title === 'Safe Track 055').assertTrue();
      expect(metadata.artist === 'Safe Artist 055').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0055 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0056
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0056
     * @tc.desc   Verify metadata case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0056 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-056', title: 'Safe Track 056', artist: 'Safe Artist 056' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 056'));
      expect(metadata.assetId).assertEqual('safe-asset-056');
      expect(metadata.title === 'Safe Track 056').assertTrue();
      expect(metadata.artist === 'Safe Artist 056').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0056 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0057
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0057
     * @tc.desc   Verify metadata case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0057 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-057', title: 'Safe Track 057', artist: 'Safe Artist 057' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 057'));
      expect(metadata.assetId).assertEqual('safe-asset-057');
      expect(metadata.title === 'Safe Track 057').assertTrue();
      expect(metadata.artist === 'Safe Artist 057').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0057 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0058
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0058
     * @tc.desc   Verify metadata case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0058 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-058', title: 'Safe Track 058', artist: 'Safe Artist 058' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 058'));
      expect(metadata.assetId).assertEqual('safe-asset-058');
      expect(metadata.title === 'Safe Track 058').assertTrue();
      expect(metadata.artist === 'Safe Artist 058').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0058 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0059
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0059
     * @tc.desc   Verify metadata case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0059 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-059', title: 'Safe Track 059', artist: 'Safe Artist 059' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 059'));
      expect(metadata.assetId).assertEqual('safe-asset-059');
      expect(metadata.title === 'Safe Track 059').assertTrue();
      expect(metadata.artist === 'Safe Artist 059').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0059 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0060
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0060
     * @tc.desc   Verify metadata case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0060 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-060', title: 'Safe Track 060', artist: 'Safe Artist 060' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 060'));
      expect(metadata.assetId).assertEqual('safe-asset-060');
      expect(metadata.title === 'Safe Track 060').assertTrue();
      expect(metadata.artist === 'Safe Artist 060').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0060 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0061
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0061
     * @tc.desc   Verify metadata case 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0061 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-061', title: 'Safe Track 061', artist: 'Safe Artist 061' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 061'));
      expect(metadata.assetId).assertEqual('safe-asset-061');
      expect(metadata.title === 'Safe Track 061').assertTrue();
      expect(metadata.artist === 'Safe Artist 061').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0061 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0062
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0062
     * @tc.desc   Verify metadata case 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0062 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-062', title: 'Safe Track 062', artist: 'Safe Artist 062' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 062'));
      expect(metadata.assetId).assertEqual('safe-asset-062');
      expect(metadata.title === 'Safe Track 062').assertTrue();
      expect(metadata.artist === 'Safe Artist 062').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0062 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0063
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0063
     * @tc.desc   Verify metadata case 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0063 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-063', title: 'Safe Track 063', artist: 'Safe Artist 063' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 063'));
      expect(metadata.assetId).assertEqual('safe-asset-063');
      expect(metadata.title === 'Safe Track 063').assertTrue();
      expect(metadata.artist === 'Safe Artist 063').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0063 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0064
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0064
     * @tc.desc   Verify metadata case 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0064 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-064', title: 'Safe Track 064', artist: 'Safe Artist 064' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 064'));
      expect(metadata.assetId).assertEqual('safe-asset-064');
      expect(metadata.title === 'Safe Track 064').assertTrue();
      expect(metadata.artist === 'Safe Artist 064').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0064 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0065
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0065
     * @tc.desc   Verify metadata case 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0065 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-065', title: 'Safe Track 065', artist: 'Safe Artist 065' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 065'));
      expect(metadata.assetId).assertEqual('safe-asset-065');
      expect(metadata.title === 'Safe Track 065').assertTrue();
      expect(metadata.artist === 'Safe Artist 065').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0065 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0066
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0066
     * @tc.desc   Verify metadata case 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0066 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-066', title: 'Safe Track 066', artist: 'Safe Artist 066' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 066'));
      expect(metadata.assetId).assertEqual('safe-asset-066');
      expect(metadata.title === 'Safe Track 066').assertTrue();
      expect(metadata.artist === 'Safe Artist 066').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0066 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0067
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0067
     * @tc.desc   Verify metadata case 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0067 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-067', title: 'Safe Track 067', artist: 'Safe Artist 067' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 067'));
      expect(metadata.assetId).assertEqual('safe-asset-067');
      expect(metadata.title === 'Safe Track 067').assertTrue();
      expect(metadata.artist === 'Safe Artist 067').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0067 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0068
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0068
     * @tc.desc   Verify metadata case 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0068 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-068', title: 'Safe Track 068', artist: 'Safe Artist 068' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 068'));
      expect(metadata.assetId).assertEqual('safe-asset-068');
      expect(metadata.title === 'Safe Track 068').assertTrue();
      expect(metadata.artist === 'Safe Artist 068').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0068 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0069
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0069
     * @tc.desc   Verify metadata case 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0069 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-069', title: 'Safe Track 069', artist: 'Safe Artist 069' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 069'));
      expect(metadata.assetId).assertEqual('safe-asset-069');
      expect(metadata.title === 'Safe Track 069').assertTrue();
      expect(metadata.artist === 'Safe Artist 069').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0069 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0070
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0070
     * @tc.desc   Verify metadata case 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0070 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-070', title: 'Safe Track 070', artist: 'Safe Artist 070' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 070'));
      expect(metadata.assetId).assertEqual('safe-asset-070');
      expect(metadata.title === 'Safe Track 070').assertTrue();
      expect(metadata.artist === 'Safe Artist 070').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0070 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0071
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0071
     * @tc.desc   Verify metadata case 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0071 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-071', title: 'Safe Track 071', artist: 'Safe Artist 071' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 071'));
      expect(metadata.assetId).assertEqual('safe-asset-071');
      expect(metadata.title === 'Safe Track 071').assertTrue();
      expect(metadata.artist === 'Safe Artist 071').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0071 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0072
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0072
     * @tc.desc   Verify metadata case 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0072 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-072', title: 'Safe Track 072', artist: 'Safe Artist 072' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 072'));
      expect(metadata.assetId).assertEqual('safe-asset-072');
      expect(metadata.title === 'Safe Track 072').assertTrue();
      expect(metadata.artist === 'Safe Artist 072').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0072 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0073
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0073
     * @tc.desc   Verify metadata case 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0073 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-073', title: 'Safe Track 073', artist: 'Safe Artist 073' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 073'));
      expect(metadata.assetId).assertEqual('safe-asset-073');
      expect(metadata.title === 'Safe Track 073').assertTrue();
      expect(metadata.artist === 'Safe Artist 073').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0073 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0074
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0074
     * @tc.desc   Verify metadata case 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0074 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-074', title: 'Safe Track 074', artist: 'Safe Artist 074' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 074'));
      expect(metadata.assetId).assertEqual('safe-asset-074');
      expect(metadata.title === 'Safe Track 074').assertTrue();
      expect(metadata.artist === 'Safe Artist 074').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0074 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0075
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0075
     * @tc.desc   Verify metadata case 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0075 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-075', title: 'Safe Track 075', artist: 'Safe Artist 075' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 075'));
      expect(metadata.assetId).assertEqual('safe-asset-075');
      expect(metadata.title === 'Safe Track 075').assertTrue();
      expect(metadata.artist === 'Safe Artist 075').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0075 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0076
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0076
     * @tc.desc   Verify metadata case 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0076 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-076', title: 'Safe Track 076', artist: 'Safe Artist 076' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 076'));
      expect(metadata.assetId).assertEqual('safe-asset-076');
      expect(metadata.title === 'Safe Track 076').assertTrue();
      expect(metadata.artist === 'Safe Artist 076').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0076 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0077
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0077
     * @tc.desc   Verify metadata case 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0077 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-077', title: 'Safe Track 077', artist: 'Safe Artist 077' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 077'));
      expect(metadata.assetId).assertEqual('safe-asset-077');
      expect(metadata.title === 'Safe Track 077').assertTrue();
      expect(metadata.artist === 'Safe Artist 077').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0077 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0078
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0078
     * @tc.desc   Verify metadata case 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0078 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-078', title: 'Safe Track 078', artist: 'Safe Artist 078' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 078'));
      expect(metadata.assetId).assertEqual('safe-asset-078');
      expect(metadata.title === 'Safe Track 078').assertTrue();
      expect(metadata.artist === 'Safe Artist 078').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0078 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0079
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0079
     * @tc.desc   Verify metadata case 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0079 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-079', title: 'Safe Track 079', artist: 'Safe Artist 079' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 079'));
      expect(metadata.assetId).assertEqual('safe-asset-079');
      expect(metadata.title === 'Safe Track 079').assertTrue();
      expect(metadata.artist === 'Safe Artist 079').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0079 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0080
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0080
     * @tc.desc   Verify metadata case 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0080 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'safe-asset-080', title: 'Safe Track 080', artist: 'Safe Artist 080' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Safe Track 080'));
      expect(metadata.assetId).assertEqual('safe-asset-080');
      expect(metadata.title === 'Safe Track 080').assertTrue();
      expect(metadata.artist === 'Safe Artist 080').assertTrue();
      expect(metadata.title !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0080 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0081
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0081
     * @tc.desc   Verify queue item case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0081 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-001', title: 'Safe Queue 001' };
      const item: AVSessionManager.AVQueueItem = { itemId: 1, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 1);
      expect(item.itemId).assertEqual(1);
      expect(item.description?.assetId).assertEqual('safe-queue-001');
      expect(item.description?.title === 'Safe Queue 001').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0081 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0082
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0082
     * @tc.desc   Verify queue item case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0082 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-002', title: 'Safe Queue 002' };
      const item: AVSessionManager.AVQueueItem = { itemId: 2, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2);
      expect(item.itemId).assertEqual(2);
      expect(item.description?.assetId).assertEqual('safe-queue-002');
      expect(item.description?.title === 'Safe Queue 002').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0082 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0083
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0083
     * @tc.desc   Verify queue item case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0083 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-003', title: 'Safe Queue 003' };
      const item: AVSessionManager.AVQueueItem = { itemId: 3, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 3);
      expect(item.itemId).assertEqual(3);
      expect(item.description?.assetId).assertEqual('safe-queue-003');
      expect(item.description?.title === 'Safe Queue 003').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0083 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0084
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0084
     * @tc.desc   Verify queue item case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0084 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-004', title: 'Safe Queue 004' };
      const item: AVSessionManager.AVQueueItem = { itemId: 4, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 4);
      expect(item.itemId).assertEqual(4);
      expect(item.description?.assetId).assertEqual('safe-queue-004');
      expect(item.description?.title === 'Safe Queue 004').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0084 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0085
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0085
     * @tc.desc   Verify queue item case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0085 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-005', title: 'Safe Queue 005' };
      const item: AVSessionManager.AVQueueItem = { itemId: 5, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 5);
      expect(item.itemId).assertEqual(5);
      expect(item.description?.assetId).assertEqual('safe-queue-005');
      expect(item.description?.title === 'Safe Queue 005').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0085 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0086
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0086
     * @tc.desc   Verify queue item case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0086 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-006', title: 'Safe Queue 006' };
      const item: AVSessionManager.AVQueueItem = { itemId: 6, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 6);
      expect(item.itemId).assertEqual(6);
      expect(item.description?.assetId).assertEqual('safe-queue-006');
      expect(item.description?.title === 'Safe Queue 006').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0086 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0087
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0087
     * @tc.desc   Verify queue item case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0087 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-007', title: 'Safe Queue 007' };
      const item: AVSessionManager.AVQueueItem = { itemId: 7, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 7);
      expect(item.itemId).assertEqual(7);
      expect(item.description?.assetId).assertEqual('safe-queue-007');
      expect(item.description?.title === 'Safe Queue 007').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0087 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0088
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0088
     * @tc.desc   Verify queue item case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0088 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-008', title: 'Safe Queue 008' };
      const item: AVSessionManager.AVQueueItem = { itemId: 8, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 8);
      expect(item.itemId).assertEqual(8);
      expect(item.description?.assetId).assertEqual('safe-queue-008');
      expect(item.description?.title === 'Safe Queue 008').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0088 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0089
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0089
     * @tc.desc   Verify queue item case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0089 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-009', title: 'Safe Queue 009' };
      const item: AVSessionManager.AVQueueItem = { itemId: 9, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 9);
      expect(item.itemId).assertEqual(9);
      expect(item.description?.assetId).assertEqual('safe-queue-009');
      expect(item.description?.title === 'Safe Queue 009').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0089 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0090
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0090
     * @tc.desc   Verify queue item case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0090 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-010', title: 'Safe Queue 010' };
      const item: AVSessionManager.AVQueueItem = { itemId: 10, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 10);
      expect(item.itemId).assertEqual(10);
      expect(item.description?.assetId).assertEqual('safe-queue-010');
      expect(item.description?.title === 'Safe Queue 010').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0090 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0091
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0091
     * @tc.desc   Verify queue item case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0091 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-011', title: 'Safe Queue 011' };
      const item: AVSessionManager.AVQueueItem = { itemId: 11, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 11);
      expect(item.itemId).assertEqual(11);
      expect(item.description?.assetId).assertEqual('safe-queue-011');
      expect(item.description?.title === 'Safe Queue 011').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0091 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0092
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0092
     * @tc.desc   Verify queue item case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0092 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-012', title: 'Safe Queue 012' };
      const item: AVSessionManager.AVQueueItem = { itemId: 12, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 12);
      expect(item.itemId).assertEqual(12);
      expect(item.description?.assetId).assertEqual('safe-queue-012');
      expect(item.description?.title === 'Safe Queue 012').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0092 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0093
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0093
     * @tc.desc   Verify queue item case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0093 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-013', title: 'Safe Queue 013' };
      const item: AVSessionManager.AVQueueItem = { itemId: 13, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 13);
      expect(item.itemId).assertEqual(13);
      expect(item.description?.assetId).assertEqual('safe-queue-013');
      expect(item.description?.title === 'Safe Queue 013').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0093 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0094
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0094
     * @tc.desc   Verify queue item case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0094 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-014', title: 'Safe Queue 014' };
      const item: AVSessionManager.AVQueueItem = { itemId: 14, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 14);
      expect(item.itemId).assertEqual(14);
      expect(item.description?.assetId).assertEqual('safe-queue-014');
      expect(item.description?.title === 'Safe Queue 014').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0094 end');
    })
  })
}
