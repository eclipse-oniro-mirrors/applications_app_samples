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

export default function mediaControllerBulkTestPart01() {
  describe('MediaControllerBulkPart01', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0001
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0001
     * @tc.desc   Verify metadata variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0001 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-001', title: 'Bulk Track 001', artist: 'Bulk Artist 001' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-001'));
      expect(metadata.assetId).assertEqual('bulk-asset-001');
      expect(metadata.title).assertEqual('Bulk Track 001');
      expect(metadata.artist === 'Bulk Artist 001').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0001 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0002
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0002
     * @tc.desc   Verify metadata variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0002 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-002', title: 'Bulk Track 002', artist: 'Bulk Artist 002' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-002'));
      expect(metadata.assetId).assertEqual('bulk-asset-002');
      expect(metadata.title).assertEqual('Bulk Track 002');
      expect(metadata.artist === 'Bulk Artist 002').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0002 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0003
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0003
     * @tc.desc   Verify metadata variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0003 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-003', title: 'Bulk Track 003', artist: 'Bulk Artist 003' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-003'));
      expect(metadata.assetId).assertEqual('bulk-asset-003');
      expect(metadata.title).assertEqual('Bulk Track 003');
      expect(metadata.artist === 'Bulk Artist 003').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0003 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0004
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0004
     * @tc.desc   Verify metadata variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0004 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-004', title: 'Bulk Track 004', artist: 'Bulk Artist 004' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-004'));
      expect(metadata.assetId).assertEqual('bulk-asset-004');
      expect(metadata.title).assertEqual('Bulk Track 004');
      expect(metadata.artist === 'Bulk Artist 004').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0004 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0005
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0005
     * @tc.desc   Verify metadata variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0005 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-005', title: 'Bulk Track 005', artist: 'Bulk Artist 005' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-005'));
      expect(metadata.assetId).assertEqual('bulk-asset-005');
      expect(metadata.title).assertEqual('Bulk Track 005');
      expect(metadata.artist === 'Bulk Artist 005').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0005 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0006
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0006
     * @tc.desc   Verify metadata variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0006 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-006', title: 'Bulk Track 006', artist: 'Bulk Artist 006' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-006'));
      expect(metadata.assetId).assertEqual('bulk-asset-006');
      expect(metadata.title).assertEqual('Bulk Track 006');
      expect(metadata.artist === 'Bulk Artist 006').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0006 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0007
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0007
     * @tc.desc   Verify metadata variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0007 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-007', title: 'Bulk Track 007', artist: 'Bulk Artist 007' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-007'));
      expect(metadata.assetId).assertEqual('bulk-asset-007');
      expect(metadata.title).assertEqual('Bulk Track 007');
      expect(metadata.artist === 'Bulk Artist 007').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0007 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0008
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0008
     * @tc.desc   Verify metadata variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0008 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-008', title: 'Bulk Track 008', artist: 'Bulk Artist 008' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-008'));
      expect(metadata.assetId).assertEqual('bulk-asset-008');
      expect(metadata.title).assertEqual('Bulk Track 008');
      expect(metadata.artist === 'Bulk Artist 008').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0008 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0009
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0009
     * @tc.desc   Verify metadata variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0009 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-009', title: 'Bulk Track 009', artist: 'Bulk Artist 009' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-009'));
      expect(metadata.assetId).assertEqual('bulk-asset-009');
      expect(metadata.title).assertEqual('Bulk Track 009');
      expect(metadata.artist === 'Bulk Artist 009').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0009 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0010
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0010
     * @tc.desc   Verify metadata variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0010 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-010', title: 'Bulk Track 010', artist: 'Bulk Artist 010' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-010'));
      expect(metadata.assetId).assertEqual('bulk-asset-010');
      expect(metadata.title).assertEqual('Bulk Track 010');
      expect(metadata.artist === 'Bulk Artist 010').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0010 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0011
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0011
     * @tc.desc   Verify metadata variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0011 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-011', title: 'Bulk Track 011', artist: 'Bulk Artist 011' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-011'));
      expect(metadata.assetId).assertEqual('bulk-asset-011');
      expect(metadata.title).assertEqual('Bulk Track 011');
      expect(metadata.artist === 'Bulk Artist 011').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0011 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0012
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0012
     * @tc.desc   Verify metadata variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0012 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-012', title: 'Bulk Track 012', artist: 'Bulk Artist 012' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-012'));
      expect(metadata.assetId).assertEqual('bulk-asset-012');
      expect(metadata.title).assertEqual('Bulk Track 012');
      expect(metadata.artist === 'Bulk Artist 012').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0012 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0013
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0013
     * @tc.desc   Verify metadata variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0013 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-013', title: 'Bulk Track 013', artist: 'Bulk Artist 013' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-013'));
      expect(metadata.assetId).assertEqual('bulk-asset-013');
      expect(metadata.title).assertEqual('Bulk Track 013');
      expect(metadata.artist === 'Bulk Artist 013').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0013 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0014
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0014
     * @tc.desc   Verify metadata variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0014 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-014', title: 'Bulk Track 014', artist: 'Bulk Artist 014' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-014'));
      expect(metadata.assetId).assertEqual('bulk-asset-014');
      expect(metadata.title).assertEqual('Bulk Track 014');
      expect(metadata.artist === 'Bulk Artist 014').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0014 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0015
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0015
     * @tc.desc   Verify metadata variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0015 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-015', title: 'Bulk Track 015', artist: 'Bulk Artist 015' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-015'));
      expect(metadata.assetId).assertEqual('bulk-asset-015');
      expect(metadata.title).assertEqual('Bulk Track 015');
      expect(metadata.artist === 'Bulk Artist 015').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0015 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0016
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0016
     * @tc.desc   Verify metadata variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0016 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-016', title: 'Bulk Track 016', artist: 'Bulk Artist 016' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-016'));
      expect(metadata.assetId).assertEqual('bulk-asset-016');
      expect(metadata.title).assertEqual('Bulk Track 016');
      expect(metadata.artist === 'Bulk Artist 016').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0016 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0017
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0017
     * @tc.desc   Verify metadata variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0017 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-017', title: 'Bulk Track 017', artist: 'Bulk Artist 017' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-017'));
      expect(metadata.assetId).assertEqual('bulk-asset-017');
      expect(metadata.title).assertEqual('Bulk Track 017');
      expect(metadata.artist === 'Bulk Artist 017').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0017 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0018
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0018
     * @tc.desc   Verify metadata variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0018 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-018', title: 'Bulk Track 018', artist: 'Bulk Artist 018' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-018'));
      expect(metadata.assetId).assertEqual('bulk-asset-018');
      expect(metadata.title).assertEqual('Bulk Track 018');
      expect(metadata.artist === 'Bulk Artist 018').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0018 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0019
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0019
     * @tc.desc   Verify metadata variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0019 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-019', title: 'Bulk Track 019', artist: 'Bulk Artist 019' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-019'));
      expect(metadata.assetId).assertEqual('bulk-asset-019');
      expect(metadata.title).assertEqual('Bulk Track 019');
      expect(metadata.artist === 'Bulk Artist 019').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0019 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0020
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0020
     * @tc.desc   Verify metadata variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0020 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-020', title: 'Bulk Track 020', artist: 'Bulk Artist 020' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-020'));
      expect(metadata.assetId).assertEqual('bulk-asset-020');
      expect(metadata.title).assertEqual('Bulk Track 020');
      expect(metadata.artist === 'Bulk Artist 020').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0020 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0021
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0021
     * @tc.desc   Verify metadata variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0021 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-021', title: 'Bulk Track 021', artist: 'Bulk Artist 021' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-021'));
      expect(metadata.assetId).assertEqual('bulk-asset-021');
      expect(metadata.title).assertEqual('Bulk Track 021');
      expect(metadata.artist === 'Bulk Artist 021').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0021 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0022
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0022
     * @tc.desc   Verify metadata variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0022 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-022', title: 'Bulk Track 022', artist: 'Bulk Artist 022' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-022'));
      expect(metadata.assetId).assertEqual('bulk-asset-022');
      expect(metadata.title).assertEqual('Bulk Track 022');
      expect(metadata.artist === 'Bulk Artist 022').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0022 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0023
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0023
     * @tc.desc   Verify metadata variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0023 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-023', title: 'Bulk Track 023', artist: 'Bulk Artist 023' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-023'));
      expect(metadata.assetId).assertEqual('bulk-asset-023');
      expect(metadata.title).assertEqual('Bulk Track 023');
      expect(metadata.artist === 'Bulk Artist 023').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0023 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0024
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0024
     * @tc.desc   Verify metadata variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0024 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-024', title: 'Bulk Track 024', artist: 'Bulk Artist 024' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-024'));
      expect(metadata.assetId).assertEqual('bulk-asset-024');
      expect(metadata.title).assertEqual('Bulk Track 024');
      expect(metadata.artist === 'Bulk Artist 024').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0024 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0025
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0025
     * @tc.desc   Verify metadata variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0025 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-025', title: 'Bulk Track 025', artist: 'Bulk Artist 025' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-025'));
      expect(metadata.assetId).assertEqual('bulk-asset-025');
      expect(metadata.title).assertEqual('Bulk Track 025');
      expect(metadata.artist === 'Bulk Artist 025').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0025 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0026
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0026
     * @tc.desc   Verify metadata variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0026 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-026', title: 'Bulk Track 026', artist: 'Bulk Artist 026' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-026'));
      expect(metadata.assetId).assertEqual('bulk-asset-026');
      expect(metadata.title).assertEqual('Bulk Track 026');
      expect(metadata.artist === 'Bulk Artist 026').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0026 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0027
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0027
     * @tc.desc   Verify metadata variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0027 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-027', title: 'Bulk Track 027', artist: 'Bulk Artist 027' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-027'));
      expect(metadata.assetId).assertEqual('bulk-asset-027');
      expect(metadata.title).assertEqual('Bulk Track 027');
      expect(metadata.artist === 'Bulk Artist 027').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0027 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0028
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0028
     * @tc.desc   Verify metadata variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0028 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-028', title: 'Bulk Track 028', artist: 'Bulk Artist 028' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-028'));
      expect(metadata.assetId).assertEqual('bulk-asset-028');
      expect(metadata.title).assertEqual('Bulk Track 028');
      expect(metadata.artist === 'Bulk Artist 028').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0028 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0029
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0029
     * @tc.desc   Verify metadata variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0029 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-029', title: 'Bulk Track 029', artist: 'Bulk Artist 029' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-029'));
      expect(metadata.assetId).assertEqual('bulk-asset-029');
      expect(metadata.title).assertEqual('Bulk Track 029');
      expect(metadata.artist === 'Bulk Artist 029').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0029 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0030
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0030
     * @tc.desc   Verify metadata variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0030 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-030', title: 'Bulk Track 030', artist: 'Bulk Artist 030' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-030'));
      expect(metadata.assetId).assertEqual('bulk-asset-030');
      expect(metadata.title).assertEqual('Bulk Track 030');
      expect(metadata.artist === 'Bulk Artist 030').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0030 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0031
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0031
     * @tc.desc   Verify metadata variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0031 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-031', title: 'Bulk Track 031', artist: 'Bulk Artist 031' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-031'));
      expect(metadata.assetId).assertEqual('bulk-asset-031');
      expect(metadata.title).assertEqual('Bulk Track 031');
      expect(metadata.artist === 'Bulk Artist 031').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0031 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0032
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0032
     * @tc.desc   Verify metadata variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0032 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-032', title: 'Bulk Track 032', artist: 'Bulk Artist 032' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-032'));
      expect(metadata.assetId).assertEqual('bulk-asset-032');
      expect(metadata.title).assertEqual('Bulk Track 032');
      expect(metadata.artist === 'Bulk Artist 032').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0032 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0033
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0033
     * @tc.desc   Verify metadata variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0033 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-033', title: 'Bulk Track 033', artist: 'Bulk Artist 033' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-033'));
      expect(metadata.assetId).assertEqual('bulk-asset-033');
      expect(metadata.title).assertEqual('Bulk Track 033');
      expect(metadata.artist === 'Bulk Artist 033').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0033 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0034
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0034
     * @tc.desc   Verify metadata variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0034 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-034', title: 'Bulk Track 034', artist: 'Bulk Artist 034' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-034'));
      expect(metadata.assetId).assertEqual('bulk-asset-034');
      expect(metadata.title).assertEqual('Bulk Track 034');
      expect(metadata.artist === 'Bulk Artist 034').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0034 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0035
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0035
     * @tc.desc   Verify metadata variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0035 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-035', title: 'Bulk Track 035', artist: 'Bulk Artist 035' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-035'));
      expect(metadata.assetId).assertEqual('bulk-asset-035');
      expect(metadata.title).assertEqual('Bulk Track 035');
      expect(metadata.artist === 'Bulk Artist 035').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0035 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0036
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0036
     * @tc.desc   Verify metadata variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0036 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-036', title: 'Bulk Track 036', artist: 'Bulk Artist 036' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-036'));
      expect(metadata.assetId).assertEqual('bulk-asset-036');
      expect(metadata.title).assertEqual('Bulk Track 036');
      expect(metadata.artist === 'Bulk Artist 036').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0036 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0037
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0037
     * @tc.desc   Verify metadata variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0037 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-037', title: 'Bulk Track 037', artist: 'Bulk Artist 037' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-037'));
      expect(metadata.assetId).assertEqual('bulk-asset-037');
      expect(metadata.title).assertEqual('Bulk Track 037');
      expect(metadata.artist === 'Bulk Artist 037').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0037 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0038
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0038
     * @tc.desc   Verify metadata variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0038 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-038', title: 'Bulk Track 038', artist: 'Bulk Artist 038' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-038'));
      expect(metadata.assetId).assertEqual('bulk-asset-038');
      expect(metadata.title).assertEqual('Bulk Track 038');
      expect(metadata.artist === 'Bulk Artist 038').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0038 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0039
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0039
     * @tc.desc   Verify metadata variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0039 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-039', title: 'Bulk Track 039', artist: 'Bulk Artist 039' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-039'));
      expect(metadata.assetId).assertEqual('bulk-asset-039');
      expect(metadata.title).assertEqual('Bulk Track 039');
      expect(metadata.artist === 'Bulk Artist 039').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0039 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0040
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0040
     * @tc.desc   Verify metadata variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0040 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-040', title: 'Bulk Track 040', artist: 'Bulk Artist 040' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-040'));
      expect(metadata.assetId).assertEqual('bulk-asset-040');
      expect(metadata.title).assertEqual('Bulk Track 040');
      expect(metadata.artist === 'Bulk Artist 040').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0040 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0041
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0041
     * @tc.desc   Verify metadata variant 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0041 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-041', title: 'Bulk Track 041', artist: 'Bulk Artist 041' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-041'));
      expect(metadata.assetId).assertEqual('bulk-asset-041');
      expect(metadata.title).assertEqual('Bulk Track 041');
      expect(metadata.artist === 'Bulk Artist 041').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0041 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0042
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0042
     * @tc.desc   Verify metadata variant 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0042 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-042', title: 'Bulk Track 042', artist: 'Bulk Artist 042' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-042'));
      expect(metadata.assetId).assertEqual('bulk-asset-042');
      expect(metadata.title).assertEqual('Bulk Track 042');
      expect(metadata.artist === 'Bulk Artist 042').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0042 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0043
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0043
     * @tc.desc   Verify metadata variant 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0043 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-043', title: 'Bulk Track 043', artist: 'Bulk Artist 043' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-043'));
      expect(metadata.assetId).assertEqual('bulk-asset-043');
      expect(metadata.title).assertEqual('Bulk Track 043');
      expect(metadata.artist === 'Bulk Artist 043').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0043 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0044
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0044
     * @tc.desc   Verify metadata variant 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0044 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-044', title: 'Bulk Track 044', artist: 'Bulk Artist 044' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-044'));
      expect(metadata.assetId).assertEqual('bulk-asset-044');
      expect(metadata.title).assertEqual('Bulk Track 044');
      expect(metadata.artist === 'Bulk Artist 044').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0044 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0045
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0045
     * @tc.desc   Verify metadata variant 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0045 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-045', title: 'Bulk Track 045', artist: 'Bulk Artist 045' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-045'));
      expect(metadata.assetId).assertEqual('bulk-asset-045');
      expect(metadata.title).assertEqual('Bulk Track 045');
      expect(metadata.artist === 'Bulk Artist 045').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0045 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0046
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0046
     * @tc.desc   Verify metadata variant 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0046 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-046', title: 'Bulk Track 046', artist: 'Bulk Artist 046' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-046'));
      expect(metadata.assetId).assertEqual('bulk-asset-046');
      expect(metadata.title).assertEqual('Bulk Track 046');
      expect(metadata.artist === 'Bulk Artist 046').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0046 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0047
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0047
     * @tc.desc   Verify metadata variant 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0047 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-047', title: 'Bulk Track 047', artist: 'Bulk Artist 047' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-047'));
      expect(metadata.assetId).assertEqual('bulk-asset-047');
      expect(metadata.title).assertEqual('Bulk Track 047');
      expect(metadata.artist === 'Bulk Artist 047').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0047 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0048
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0048
     * @tc.desc   Verify metadata variant 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0048 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-048', title: 'Bulk Track 048', artist: 'Bulk Artist 048' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-048'));
      expect(metadata.assetId).assertEqual('bulk-asset-048');
      expect(metadata.title).assertEqual('Bulk Track 048');
      expect(metadata.artist === 'Bulk Artist 048').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0048 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0049
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0049
     * @tc.desc   Verify metadata variant 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0049 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-049', title: 'Bulk Track 049', artist: 'Bulk Artist 049' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-049'));
      expect(metadata.assetId).assertEqual('bulk-asset-049');
      expect(metadata.title).assertEqual('Bulk Track 049');
      expect(metadata.artist === 'Bulk Artist 049').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0049 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0050
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0050
     * @tc.desc   Verify metadata variant 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0050 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-050', title: 'Bulk Track 050', artist: 'Bulk Artist 050' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-050'));
      expect(metadata.assetId).assertEqual('bulk-asset-050');
      expect(metadata.title).assertEqual('Bulk Track 050');
      expect(metadata.artist === 'Bulk Artist 050').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0050 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0051
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0051
     * @tc.desc   Verify metadata variant 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0051 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-051', title: 'Bulk Track 051', artist: 'Bulk Artist 051' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-051'));
      expect(metadata.assetId).assertEqual('bulk-asset-051');
      expect(metadata.title).assertEqual('Bulk Track 051');
      expect(metadata.artist === 'Bulk Artist 051').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0051 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0052
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0052
     * @tc.desc   Verify metadata variant 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0052 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-052', title: 'Bulk Track 052', artist: 'Bulk Artist 052' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-052'));
      expect(metadata.assetId).assertEqual('bulk-asset-052');
      expect(metadata.title).assertEqual('Bulk Track 052');
      expect(metadata.artist === 'Bulk Artist 052').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0052 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0053
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0053
     * @tc.desc   Verify metadata variant 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0053 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-053', title: 'Bulk Track 053', artist: 'Bulk Artist 053' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-053'));
      expect(metadata.assetId).assertEqual('bulk-asset-053');
      expect(metadata.title).assertEqual('Bulk Track 053');
      expect(metadata.artist === 'Bulk Artist 053').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0053 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0054
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0054
     * @tc.desc   Verify metadata variant 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0054 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-054', title: 'Bulk Track 054', artist: 'Bulk Artist 054' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-054'));
      expect(metadata.assetId).assertEqual('bulk-asset-054');
      expect(metadata.title).assertEqual('Bulk Track 054');
      expect(metadata.artist === 'Bulk Artist 054').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0054 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0055
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0055
     * @tc.desc   Verify metadata variant 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0055 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-055', title: 'Bulk Track 055', artist: 'Bulk Artist 055' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-055'));
      expect(metadata.assetId).assertEqual('bulk-asset-055');
      expect(metadata.title).assertEqual('Bulk Track 055');
      expect(metadata.artist === 'Bulk Artist 055').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0055 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0056
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0056
     * @tc.desc   Verify metadata variant 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0056 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-056', title: 'Bulk Track 056', artist: 'Bulk Artist 056' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-056'));
      expect(metadata.assetId).assertEqual('bulk-asset-056');
      expect(metadata.title).assertEqual('Bulk Track 056');
      expect(metadata.artist === 'Bulk Artist 056').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0056 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0057
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0057
     * @tc.desc   Verify metadata variant 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0057 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-057', title: 'Bulk Track 057', artist: 'Bulk Artist 057' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-057'));
      expect(metadata.assetId).assertEqual('bulk-asset-057');
      expect(metadata.title).assertEqual('Bulk Track 057');
      expect(metadata.artist === 'Bulk Artist 057').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0057 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0058
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0058
     * @tc.desc   Verify metadata variant 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0058 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-058', title: 'Bulk Track 058', artist: 'Bulk Artist 058' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-058'));
      expect(metadata.assetId).assertEqual('bulk-asset-058');
      expect(metadata.title).assertEqual('Bulk Track 058');
      expect(metadata.artist === 'Bulk Artist 058').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0058 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0059
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0059
     * @tc.desc   Verify metadata variant 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0059 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-059', title: 'Bulk Track 059', artist: 'Bulk Artist 059' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-059'));
      expect(metadata.assetId).assertEqual('bulk-asset-059');
      expect(metadata.title).assertEqual('Bulk Track 059');
      expect(metadata.artist === 'Bulk Artist 059').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0059 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0060
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0060
     * @tc.desc   Verify metadata variant 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0060 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-060', title: 'Bulk Track 060', artist: 'Bulk Artist 060' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-060'));
      expect(metadata.assetId).assertEqual('bulk-asset-060');
      expect(metadata.title).assertEqual('Bulk Track 060');
      expect(metadata.artist === 'Bulk Artist 060').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0060 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0061
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0061
     * @tc.desc   Verify metadata variant 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0061 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-061', title: 'Bulk Track 061', artist: 'Bulk Artist 061' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-061'));
      expect(metadata.assetId).assertEqual('bulk-asset-061');
      expect(metadata.title).assertEqual('Bulk Track 061');
      expect(metadata.artist === 'Bulk Artist 061').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0061 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0062
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0062
     * @tc.desc   Verify metadata variant 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0062 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-062', title: 'Bulk Track 062', artist: 'Bulk Artist 062' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-062'));
      expect(metadata.assetId).assertEqual('bulk-asset-062');
      expect(metadata.title).assertEqual('Bulk Track 062');
      expect(metadata.artist === 'Bulk Artist 062').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0062 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0063
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0063
     * @tc.desc   Verify metadata variant 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0063 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-063', title: 'Bulk Track 063', artist: 'Bulk Artist 063' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-063'));
      expect(metadata.assetId).assertEqual('bulk-asset-063');
      expect(metadata.title).assertEqual('Bulk Track 063');
      expect(metadata.artist === 'Bulk Artist 063').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0063 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0064
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0064
     * @tc.desc   Verify metadata variant 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0064 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-064', title: 'Bulk Track 064', artist: 'Bulk Artist 064' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-064'));
      expect(metadata.assetId).assertEqual('bulk-asset-064');
      expect(metadata.title).assertEqual('Bulk Track 064');
      expect(metadata.artist === 'Bulk Artist 064').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0064 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0065
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0065
     * @tc.desc   Verify metadata variant 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0065 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-065', title: 'Bulk Track 065', artist: 'Bulk Artist 065' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-065'));
      expect(metadata.assetId).assertEqual('bulk-asset-065');
      expect(metadata.title).assertEqual('Bulk Track 065');
      expect(metadata.artist === 'Bulk Artist 065').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0065 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0066
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0066
     * @tc.desc   Verify metadata variant 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0066 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-066', title: 'Bulk Track 066', artist: 'Bulk Artist 066' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-066'));
      expect(metadata.assetId).assertEqual('bulk-asset-066');
      expect(metadata.title).assertEqual('Bulk Track 066');
      expect(metadata.artist === 'Bulk Artist 066').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0066 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0067
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0067
     * @tc.desc   Verify metadata variant 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0067 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-067', title: 'Bulk Track 067', artist: 'Bulk Artist 067' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-067'));
      expect(metadata.assetId).assertEqual('bulk-asset-067');
      expect(metadata.title).assertEqual('Bulk Track 067');
      expect(metadata.artist === 'Bulk Artist 067').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0067 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0068
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0068
     * @tc.desc   Verify metadata variant 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0068 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-068', title: 'Bulk Track 068', artist: 'Bulk Artist 068' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-068'));
      expect(metadata.assetId).assertEqual('bulk-asset-068');
      expect(metadata.title).assertEqual('Bulk Track 068');
      expect(metadata.artist === 'Bulk Artist 068').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0068 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0069
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0069
     * @tc.desc   Verify metadata variant 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0069 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-069', title: 'Bulk Track 069', artist: 'Bulk Artist 069' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-069'));
      expect(metadata.assetId).assertEqual('bulk-asset-069');
      expect(metadata.title).assertEqual('Bulk Track 069');
      expect(metadata.artist === 'Bulk Artist 069').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0069 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0070
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0070
     * @tc.desc   Verify metadata variant 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0070 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-070', title: 'Bulk Track 070', artist: 'Bulk Artist 070' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-070'));
      expect(metadata.assetId).assertEqual('bulk-asset-070');
      expect(metadata.title).assertEqual('Bulk Track 070');
      expect(metadata.artist === 'Bulk Artist 070').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0070 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0071
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0071
     * @tc.desc   Verify metadata variant 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0071 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-071', title: 'Bulk Track 071', artist: 'Bulk Artist 071' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-071'));
      expect(metadata.assetId).assertEqual('bulk-asset-071');
      expect(metadata.title).assertEqual('Bulk Track 071');
      expect(metadata.artist === 'Bulk Artist 071').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0071 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0072
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0072
     * @tc.desc   Verify metadata variant 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0072 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-072', title: 'Bulk Track 072', artist: 'Bulk Artist 072' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-072'));
      expect(metadata.assetId).assertEqual('bulk-asset-072');
      expect(metadata.title).assertEqual('Bulk Track 072');
      expect(metadata.artist === 'Bulk Artist 072').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0072 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0073
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0073
     * @tc.desc   Verify metadata variant 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0073 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-073', title: 'Bulk Track 073', artist: 'Bulk Artist 073' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-073'));
      expect(metadata.assetId).assertEqual('bulk-asset-073');
      expect(metadata.title).assertEqual('Bulk Track 073');
      expect(metadata.artist === 'Bulk Artist 073').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0073 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0074
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0074
     * @tc.desc   Verify metadata variant 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0074 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-074', title: 'Bulk Track 074', artist: 'Bulk Artist 074' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-074'));
      expect(metadata.assetId).assertEqual('bulk-asset-074');
      expect(metadata.title).assertEqual('Bulk Track 074');
      expect(metadata.artist === 'Bulk Artist 074').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0074 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0075
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0075
     * @tc.desc   Verify metadata variant 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0075 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-075', title: 'Bulk Track 075', artist: 'Bulk Artist 075' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-075'));
      expect(metadata.assetId).assertEqual('bulk-asset-075');
      expect(metadata.title).assertEqual('Bulk Track 075');
      expect(metadata.artist === 'Bulk Artist 075').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0075 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0076
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0076
     * @tc.desc   Verify metadata variant 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0076 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-076', title: 'Bulk Track 076', artist: 'Bulk Artist 076' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-076'));
      expect(metadata.assetId).assertEqual('bulk-asset-076');
      expect(metadata.title).assertEqual('Bulk Track 076');
      expect(metadata.artist === 'Bulk Artist 076').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0076 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0077
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0077
     * @tc.desc   Verify metadata variant 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0077 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-077', title: 'Bulk Track 077', artist: 'Bulk Artist 077' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-077'));
      expect(metadata.assetId).assertEqual('bulk-asset-077');
      expect(metadata.title).assertEqual('Bulk Track 077');
      expect(metadata.artist === 'Bulk Artist 077').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0077 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0078
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0078
     * @tc.desc   Verify metadata variant 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0078 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-078', title: 'Bulk Track 078', artist: 'Bulk Artist 078' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-078'));
      expect(metadata.assetId).assertEqual('bulk-asset-078');
      expect(metadata.title).assertEqual('Bulk Track 078');
      expect(metadata.artist === 'Bulk Artist 078').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0078 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0079
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0079
     * @tc.desc   Verify metadata variant 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0079 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-079', title: 'Bulk Track 079', artist: 'Bulk Artist 079' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-079'));
      expect(metadata.assetId).assertEqual('bulk-asset-079');
      expect(metadata.title).assertEqual('Bulk Track 079');
      expect(metadata.artist === 'Bulk Artist 079').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0079 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0080
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0080
     * @tc.desc   Verify metadata variant 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0080 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'bulk-asset-080', title: 'Bulk Track 080', artist: 'Bulk Artist 080' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.assetId), String('bulk-asset-080'));
      expect(metadata.assetId).assertEqual('bulk-asset-080');
      expect(metadata.title).assertEqual('Bulk Track 080');
      expect(metadata.artist === 'Bulk Artist 080').assertTrue();
      expect(metadata.artist !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0080 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0081
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0081
     * @tc.desc   Verify queue item variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0081 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 1, description: { assetId: 'bulk-queue-001', title: 'Bulk Queue 001' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 1);
      expect(item.itemId).assertEqual(1);
      expect(item.description?.assetId).assertEqual('bulk-queue-001');
      expect(item.description?.title).assertEqual('Bulk Queue 001');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0081 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0082
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0082
     * @tc.desc   Verify queue item variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0082 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2, description: { assetId: 'bulk-queue-002', title: 'Bulk Queue 002' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2);
      expect(item.itemId).assertEqual(2);
      expect(item.description?.assetId).assertEqual('bulk-queue-002');
      expect(item.description?.title).assertEqual('Bulk Queue 002');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0082 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0083
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0083
     * @tc.desc   Verify queue item variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0083 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 3, description: { assetId: 'bulk-queue-003', title: 'Bulk Queue 003' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 3);
      expect(item.itemId).assertEqual(3);
      expect(item.description?.assetId).assertEqual('bulk-queue-003');
      expect(item.description?.title).assertEqual('Bulk Queue 003');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0083 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0084
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0084
     * @tc.desc   Verify queue item variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0084 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 4, description: { assetId: 'bulk-queue-004', title: 'Bulk Queue 004' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 4);
      expect(item.itemId).assertEqual(4);
      expect(item.description?.assetId).assertEqual('bulk-queue-004');
      expect(item.description?.title).assertEqual('Bulk Queue 004');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0084 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0085
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0085
     * @tc.desc   Verify queue item variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0085 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 5, description: { assetId: 'bulk-queue-005', title: 'Bulk Queue 005' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 5);
      expect(item.itemId).assertEqual(5);
      expect(item.description?.assetId).assertEqual('bulk-queue-005');
      expect(item.description?.title).assertEqual('Bulk Queue 005');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0085 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0086
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0086
     * @tc.desc   Verify queue item variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0086 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 6, description: { assetId: 'bulk-queue-006', title: 'Bulk Queue 006' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 6);
      expect(item.itemId).assertEqual(6);
      expect(item.description?.assetId).assertEqual('bulk-queue-006');
      expect(item.description?.title).assertEqual('Bulk Queue 006');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0086 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0087
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0087
     * @tc.desc   Verify queue item variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0087 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 7, description: { assetId: 'bulk-queue-007', title: 'Bulk Queue 007' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 7);
      expect(item.itemId).assertEqual(7);
      expect(item.description?.assetId).assertEqual('bulk-queue-007');
      expect(item.description?.title).assertEqual('Bulk Queue 007');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0087 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0088
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0088
     * @tc.desc   Verify queue item variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0088 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 8, description: { assetId: 'bulk-queue-008', title: 'Bulk Queue 008' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 8);
      expect(item.itemId).assertEqual(8);
      expect(item.description?.assetId).assertEqual('bulk-queue-008');
      expect(item.description?.title).assertEqual('Bulk Queue 008');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0088 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0089
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0089
     * @tc.desc   Verify queue item variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0089 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 9, description: { assetId: 'bulk-queue-009', title: 'Bulk Queue 009' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 9);
      expect(item.itemId).assertEqual(9);
      expect(item.description?.assetId).assertEqual('bulk-queue-009');
      expect(item.description?.title).assertEqual('Bulk Queue 009');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0089 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0090
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0090
     * @tc.desc   Verify queue item variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0090 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 10, description: { assetId: 'bulk-queue-010', title: 'Bulk Queue 010' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 10);
      expect(item.itemId).assertEqual(10);
      expect(item.description?.assetId).assertEqual('bulk-queue-010');
      expect(item.description?.title).assertEqual('Bulk Queue 010');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0090 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0091
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0091
     * @tc.desc   Verify queue item variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0091 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 11, description: { assetId: 'bulk-queue-011', title: 'Bulk Queue 011' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 11);
      expect(item.itemId).assertEqual(11);
      expect(item.description?.assetId).assertEqual('bulk-queue-011');
      expect(item.description?.title).assertEqual('Bulk Queue 011');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0091 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0092
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0092
     * @tc.desc   Verify queue item variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0092 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 12, description: { assetId: 'bulk-queue-012', title: 'Bulk Queue 012' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 12);
      expect(item.itemId).assertEqual(12);
      expect(item.description?.assetId).assertEqual('bulk-queue-012');
      expect(item.description?.title).assertEqual('Bulk Queue 012');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0092 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0093
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0093
     * @tc.desc   Verify queue item variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0093 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 13, description: { assetId: 'bulk-queue-013', title: 'Bulk Queue 013' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 13);
      expect(item.itemId).assertEqual(13);
      expect(item.description?.assetId).assertEqual('bulk-queue-013');
      expect(item.description?.title).assertEqual('Bulk Queue 013');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0093 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Bulk_0094
     * @tc.number SUB_MEDIA_CONTROLLER_BULK_0094
     * @tc.desc   Verify queue item variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Bulk_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0094 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 14, description: { assetId: 'bulk-queue-014', title: 'Bulk Queue 014' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 14);
      expect(item.itemId).assertEqual(14);
      expect(item.description?.assetId).assertEqual('bulk-queue-014');
      expect(item.description?.title).assertEqual('Bulk Queue 014');
      expect(JSON.stringify(item).includes('Bulk Queue')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Bulk_0094 end');
    })
  })
}
