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

export default function mediaControllerMetadataTestPart01() {
  describe('MediaControllerMetadataPart01', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0001
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0001
     * @tc.desc   Verify extended AVMetadata fields 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0001 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-001', title: 'Meta 001', artist: 'Artist 001', album: 'Album 001',
        author: 'Author 001', writer: 'Writer 001', composer: 'Composer 001', duration: 1000,
        avQueueName: 'Queue Name 001', avQueueId: 'queue-id-001'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 001'));
      expect(metadata.title === 'Meta 001').assertTrue();
      expect(metadata.artist === 'Artist 001').assertTrue();
      expect(metadata.album === 'Album 001').assertTrue();
      expect(metadata.author === 'Author 001').assertTrue();
      expect(metadata.writer === 'Writer 001').assertTrue();
      expect(metadata.composer === 'Composer 001').assertTrue();
      expect(metadata.duration === 1000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 001').assertTrue();
      expect(metadata.avQueueId === 'queue-id-001').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0001 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0002
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0002
     * @tc.desc   Verify extended AVMetadata fields 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0002 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-002', title: 'Meta 002', artist: 'Artist 002', album: 'Album 002',
        author: 'Author 002', writer: 'Writer 002', composer: 'Composer 002', duration: 2000,
        avQueueName: 'Queue Name 002', avQueueId: 'queue-id-002'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 002'));
      expect(metadata.title === 'Meta 002').assertTrue();
      expect(metadata.artist === 'Artist 002').assertTrue();
      expect(metadata.album === 'Album 002').assertTrue();
      expect(metadata.author === 'Author 002').assertTrue();
      expect(metadata.writer === 'Writer 002').assertTrue();
      expect(metadata.composer === 'Composer 002').assertTrue();
      expect(metadata.duration === 2000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 002').assertTrue();
      expect(metadata.avQueueId === 'queue-id-002').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0002 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0003
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0003
     * @tc.desc   Verify extended AVMetadata fields 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0003 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-003', title: 'Meta 003', artist: 'Artist 003', album: 'Album 003',
        author: 'Author 003', writer: 'Writer 003', composer: 'Composer 003', duration: 3000,
        avQueueName: 'Queue Name 003', avQueueId: 'queue-id-003'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 003'));
      expect(metadata.title === 'Meta 003').assertTrue();
      expect(metadata.artist === 'Artist 003').assertTrue();
      expect(metadata.album === 'Album 003').assertTrue();
      expect(metadata.author === 'Author 003').assertTrue();
      expect(metadata.writer === 'Writer 003').assertTrue();
      expect(metadata.composer === 'Composer 003').assertTrue();
      expect(metadata.duration === 3000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 003').assertTrue();
      expect(metadata.avQueueId === 'queue-id-003').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0003 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0004
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0004
     * @tc.desc   Verify extended AVMetadata fields 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0004 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-004', title: 'Meta 004', artist: 'Artist 004', album: 'Album 004',
        author: 'Author 004', writer: 'Writer 004', composer: 'Composer 004', duration: 4000,
        avQueueName: 'Queue Name 004', avQueueId: 'queue-id-004'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 004'));
      expect(metadata.title === 'Meta 004').assertTrue();
      expect(metadata.artist === 'Artist 004').assertTrue();
      expect(metadata.album === 'Album 004').assertTrue();
      expect(metadata.author === 'Author 004').assertTrue();
      expect(metadata.writer === 'Writer 004').assertTrue();
      expect(metadata.composer === 'Composer 004').assertTrue();
      expect(metadata.duration === 4000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 004').assertTrue();
      expect(metadata.avQueueId === 'queue-id-004').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0004 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0005
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0005
     * @tc.desc   Verify extended AVMetadata fields 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0005 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-005', title: 'Meta 005', artist: 'Artist 005', album: 'Album 005',
        author: 'Author 005', writer: 'Writer 005', composer: 'Composer 005', duration: 5000,
        avQueueName: 'Queue Name 005', avQueueId: 'queue-id-005'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 005'));
      expect(metadata.title === 'Meta 005').assertTrue();
      expect(metadata.artist === 'Artist 005').assertTrue();
      expect(metadata.album === 'Album 005').assertTrue();
      expect(metadata.author === 'Author 005').assertTrue();
      expect(metadata.writer === 'Writer 005').assertTrue();
      expect(metadata.composer === 'Composer 005').assertTrue();
      expect(metadata.duration === 5000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 005').assertTrue();
      expect(metadata.avQueueId === 'queue-id-005').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0005 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0006
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0006
     * @tc.desc   Verify extended AVMetadata fields 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0006 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-006', title: 'Meta 006', artist: 'Artist 006', album: 'Album 006',
        author: 'Author 006', writer: 'Writer 006', composer: 'Composer 006', duration: 6000,
        avQueueName: 'Queue Name 006', avQueueId: 'queue-id-006'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 006'));
      expect(metadata.title === 'Meta 006').assertTrue();
      expect(metadata.artist === 'Artist 006').assertTrue();
      expect(metadata.album === 'Album 006').assertTrue();
      expect(metadata.author === 'Author 006').assertTrue();
      expect(metadata.writer === 'Writer 006').assertTrue();
      expect(metadata.composer === 'Composer 006').assertTrue();
      expect(metadata.duration === 6000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 006').assertTrue();
      expect(metadata.avQueueId === 'queue-id-006').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0006 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0007
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0007
     * @tc.desc   Verify extended AVMetadata fields 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0007 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-007', title: 'Meta 007', artist: 'Artist 007', album: 'Album 007',
        author: 'Author 007', writer: 'Writer 007', composer: 'Composer 007', duration: 7000,
        avQueueName: 'Queue Name 007', avQueueId: 'queue-id-007'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 007'));
      expect(metadata.title === 'Meta 007').assertTrue();
      expect(metadata.artist === 'Artist 007').assertTrue();
      expect(metadata.album === 'Album 007').assertTrue();
      expect(metadata.author === 'Author 007').assertTrue();
      expect(metadata.writer === 'Writer 007').assertTrue();
      expect(metadata.composer === 'Composer 007').assertTrue();
      expect(metadata.duration === 7000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 007').assertTrue();
      expect(metadata.avQueueId === 'queue-id-007').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0007 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0008
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0008
     * @tc.desc   Verify extended AVMetadata fields 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0008 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-008', title: 'Meta 008', artist: 'Artist 008', album: 'Album 008',
        author: 'Author 008', writer: 'Writer 008', composer: 'Composer 008', duration: 8000,
        avQueueName: 'Queue Name 008', avQueueId: 'queue-id-008'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 008'));
      expect(metadata.title === 'Meta 008').assertTrue();
      expect(metadata.artist === 'Artist 008').assertTrue();
      expect(metadata.album === 'Album 008').assertTrue();
      expect(metadata.author === 'Author 008').assertTrue();
      expect(metadata.writer === 'Writer 008').assertTrue();
      expect(metadata.composer === 'Composer 008').assertTrue();
      expect(metadata.duration === 8000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 008').assertTrue();
      expect(metadata.avQueueId === 'queue-id-008').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0008 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0009
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0009
     * @tc.desc   Verify extended AVMetadata fields 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0009 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-009', title: 'Meta 009', artist: 'Artist 009', album: 'Album 009',
        author: 'Author 009', writer: 'Writer 009', composer: 'Composer 009', duration: 9000,
        avQueueName: 'Queue Name 009', avQueueId: 'queue-id-009'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 009'));
      expect(metadata.title === 'Meta 009').assertTrue();
      expect(metadata.artist === 'Artist 009').assertTrue();
      expect(metadata.album === 'Album 009').assertTrue();
      expect(metadata.author === 'Author 009').assertTrue();
      expect(metadata.writer === 'Writer 009').assertTrue();
      expect(metadata.composer === 'Composer 009').assertTrue();
      expect(metadata.duration === 9000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 009').assertTrue();
      expect(metadata.avQueueId === 'queue-id-009').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0009 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0010
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0010
     * @tc.desc   Verify extended AVMetadata fields 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0010 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-010', title: 'Meta 010', artist: 'Artist 010', album: 'Album 010',
        author: 'Author 010', writer: 'Writer 010', composer: 'Composer 010', duration: 10000,
        avQueueName: 'Queue Name 010', avQueueId: 'queue-id-010'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 010'));
      expect(metadata.title === 'Meta 010').assertTrue();
      expect(metadata.artist === 'Artist 010').assertTrue();
      expect(metadata.album === 'Album 010').assertTrue();
      expect(metadata.author === 'Author 010').assertTrue();
      expect(metadata.writer === 'Writer 010').assertTrue();
      expect(metadata.composer === 'Composer 010').assertTrue();
      expect(metadata.duration === 10000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 010').assertTrue();
      expect(metadata.avQueueId === 'queue-id-010').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0010 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0011
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0011
     * @tc.desc   Verify extended AVMetadata fields 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0011 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-011', title: 'Meta 011', artist: 'Artist 011', album: 'Album 011',
        author: 'Author 011', writer: 'Writer 011', composer: 'Composer 011', duration: 11000,
        avQueueName: 'Queue Name 011', avQueueId: 'queue-id-011'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 011'));
      expect(metadata.title === 'Meta 011').assertTrue();
      expect(metadata.artist === 'Artist 011').assertTrue();
      expect(metadata.album === 'Album 011').assertTrue();
      expect(metadata.author === 'Author 011').assertTrue();
      expect(metadata.writer === 'Writer 011').assertTrue();
      expect(metadata.composer === 'Composer 011').assertTrue();
      expect(metadata.duration === 11000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 011').assertTrue();
      expect(metadata.avQueueId === 'queue-id-011').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0011 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0012
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0012
     * @tc.desc   Verify extended AVMetadata fields 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0012 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-012', title: 'Meta 012', artist: 'Artist 012', album: 'Album 012',
        author: 'Author 012', writer: 'Writer 012', composer: 'Composer 012', duration: 12000,
        avQueueName: 'Queue Name 012', avQueueId: 'queue-id-012'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 012'));
      expect(metadata.title === 'Meta 012').assertTrue();
      expect(metadata.artist === 'Artist 012').assertTrue();
      expect(metadata.album === 'Album 012').assertTrue();
      expect(metadata.author === 'Author 012').assertTrue();
      expect(metadata.writer === 'Writer 012').assertTrue();
      expect(metadata.composer === 'Composer 012').assertTrue();
      expect(metadata.duration === 12000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 012').assertTrue();
      expect(metadata.avQueueId === 'queue-id-012').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0012 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0013
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0013
     * @tc.desc   Verify extended AVMetadata fields 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0013 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-013', title: 'Meta 013', artist: 'Artist 013', album: 'Album 013',
        author: 'Author 013', writer: 'Writer 013', composer: 'Composer 013', duration: 13000,
        avQueueName: 'Queue Name 013', avQueueId: 'queue-id-013'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 013'));
      expect(metadata.title === 'Meta 013').assertTrue();
      expect(metadata.artist === 'Artist 013').assertTrue();
      expect(metadata.album === 'Album 013').assertTrue();
      expect(metadata.author === 'Author 013').assertTrue();
      expect(metadata.writer === 'Writer 013').assertTrue();
      expect(metadata.composer === 'Composer 013').assertTrue();
      expect(metadata.duration === 13000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 013').assertTrue();
      expect(metadata.avQueueId === 'queue-id-013').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0013 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0014
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0014
     * @tc.desc   Verify extended AVMetadata fields 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0014 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-014', title: 'Meta 014', artist: 'Artist 014', album: 'Album 014',
        author: 'Author 014', writer: 'Writer 014', composer: 'Composer 014', duration: 14000,
        avQueueName: 'Queue Name 014', avQueueId: 'queue-id-014'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 014'));
      expect(metadata.title === 'Meta 014').assertTrue();
      expect(metadata.artist === 'Artist 014').assertTrue();
      expect(metadata.album === 'Album 014').assertTrue();
      expect(metadata.author === 'Author 014').assertTrue();
      expect(metadata.writer === 'Writer 014').assertTrue();
      expect(metadata.composer === 'Composer 014').assertTrue();
      expect(metadata.duration === 14000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 014').assertTrue();
      expect(metadata.avQueueId === 'queue-id-014').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0014 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0015
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0015
     * @tc.desc   Verify extended AVMetadata fields 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0015 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-015', title: 'Meta 015', artist: 'Artist 015', album: 'Album 015',
        author: 'Author 015', writer: 'Writer 015', composer: 'Composer 015', duration: 15000,
        avQueueName: 'Queue Name 015', avQueueId: 'queue-id-015'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 015'));
      expect(metadata.title === 'Meta 015').assertTrue();
      expect(metadata.artist === 'Artist 015').assertTrue();
      expect(metadata.album === 'Album 015').assertTrue();
      expect(metadata.author === 'Author 015').assertTrue();
      expect(metadata.writer === 'Writer 015').assertTrue();
      expect(metadata.composer === 'Composer 015').assertTrue();
      expect(metadata.duration === 15000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 015').assertTrue();
      expect(metadata.avQueueId === 'queue-id-015').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0015 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0016
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0016
     * @tc.desc   Verify extended AVMetadata fields 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0016 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-016', title: 'Meta 016', artist: 'Artist 016', album: 'Album 016',
        author: 'Author 016', writer: 'Writer 016', composer: 'Composer 016', duration: 16000,
        avQueueName: 'Queue Name 016', avQueueId: 'queue-id-016'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 016'));
      expect(metadata.title === 'Meta 016').assertTrue();
      expect(metadata.artist === 'Artist 016').assertTrue();
      expect(metadata.album === 'Album 016').assertTrue();
      expect(metadata.author === 'Author 016').assertTrue();
      expect(metadata.writer === 'Writer 016').assertTrue();
      expect(metadata.composer === 'Composer 016').assertTrue();
      expect(metadata.duration === 16000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 016').assertTrue();
      expect(metadata.avQueueId === 'queue-id-016').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0016 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0017
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0017
     * @tc.desc   Verify extended AVMetadata fields 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0017 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-017', title: 'Meta 017', artist: 'Artist 017', album: 'Album 017',
        author: 'Author 017', writer: 'Writer 017', composer: 'Composer 017', duration: 17000,
        avQueueName: 'Queue Name 017', avQueueId: 'queue-id-017'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 017'));
      expect(metadata.title === 'Meta 017').assertTrue();
      expect(metadata.artist === 'Artist 017').assertTrue();
      expect(metadata.album === 'Album 017').assertTrue();
      expect(metadata.author === 'Author 017').assertTrue();
      expect(metadata.writer === 'Writer 017').assertTrue();
      expect(metadata.composer === 'Composer 017').assertTrue();
      expect(metadata.duration === 17000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 017').assertTrue();
      expect(metadata.avQueueId === 'queue-id-017').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0017 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0018
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0018
     * @tc.desc   Verify extended AVMetadata fields 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0018 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-018', title: 'Meta 018', artist: 'Artist 018', album: 'Album 018',
        author: 'Author 018', writer: 'Writer 018', composer: 'Composer 018', duration: 18000,
        avQueueName: 'Queue Name 018', avQueueId: 'queue-id-018'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 018'));
      expect(metadata.title === 'Meta 018').assertTrue();
      expect(metadata.artist === 'Artist 018').assertTrue();
      expect(metadata.album === 'Album 018').assertTrue();
      expect(metadata.author === 'Author 018').assertTrue();
      expect(metadata.writer === 'Writer 018').assertTrue();
      expect(metadata.composer === 'Composer 018').assertTrue();
      expect(metadata.duration === 18000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 018').assertTrue();
      expect(metadata.avQueueId === 'queue-id-018').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0018 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0019
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0019
     * @tc.desc   Verify extended AVMetadata fields 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0019 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-019', title: 'Meta 019', artist: 'Artist 019', album: 'Album 019',
        author: 'Author 019', writer: 'Writer 019', composer: 'Composer 019', duration: 19000,
        avQueueName: 'Queue Name 019', avQueueId: 'queue-id-019'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 019'));
      expect(metadata.title === 'Meta 019').assertTrue();
      expect(metadata.artist === 'Artist 019').assertTrue();
      expect(metadata.album === 'Album 019').assertTrue();
      expect(metadata.author === 'Author 019').assertTrue();
      expect(metadata.writer === 'Writer 019').assertTrue();
      expect(metadata.composer === 'Composer 019').assertTrue();
      expect(metadata.duration === 19000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 019').assertTrue();
      expect(metadata.avQueueId === 'queue-id-019').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0019 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0020
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0020
     * @tc.desc   Verify extended AVMetadata fields 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0020 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-020', title: 'Meta 020', artist: 'Artist 020', album: 'Album 020',
        author: 'Author 020', writer: 'Writer 020', composer: 'Composer 020', duration: 20000,
        avQueueName: 'Queue Name 020', avQueueId: 'queue-id-020'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 020'));
      expect(metadata.title === 'Meta 020').assertTrue();
      expect(metadata.artist === 'Artist 020').assertTrue();
      expect(metadata.album === 'Album 020').assertTrue();
      expect(metadata.author === 'Author 020').assertTrue();
      expect(metadata.writer === 'Writer 020').assertTrue();
      expect(metadata.composer === 'Composer 020').assertTrue();
      expect(metadata.duration === 20000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 020').assertTrue();
      expect(metadata.avQueueId === 'queue-id-020').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0020 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0021
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0021
     * @tc.desc   Verify extended AVMetadata fields 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0021 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-021', title: 'Meta 021', artist: 'Artist 021', album: 'Album 021',
        author: 'Author 021', writer: 'Writer 021', composer: 'Composer 021', duration: 21000,
        avQueueName: 'Queue Name 021', avQueueId: 'queue-id-021'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 021'));
      expect(metadata.title === 'Meta 021').assertTrue();
      expect(metadata.artist === 'Artist 021').assertTrue();
      expect(metadata.album === 'Album 021').assertTrue();
      expect(metadata.author === 'Author 021').assertTrue();
      expect(metadata.writer === 'Writer 021').assertTrue();
      expect(metadata.composer === 'Composer 021').assertTrue();
      expect(metadata.duration === 21000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 021').assertTrue();
      expect(metadata.avQueueId === 'queue-id-021').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0021 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0022
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0022
     * @tc.desc   Verify extended AVMetadata fields 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0022 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-022', title: 'Meta 022', artist: 'Artist 022', album: 'Album 022',
        author: 'Author 022', writer: 'Writer 022', composer: 'Composer 022', duration: 22000,
        avQueueName: 'Queue Name 022', avQueueId: 'queue-id-022'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 022'));
      expect(metadata.title === 'Meta 022').assertTrue();
      expect(metadata.artist === 'Artist 022').assertTrue();
      expect(metadata.album === 'Album 022').assertTrue();
      expect(metadata.author === 'Author 022').assertTrue();
      expect(metadata.writer === 'Writer 022').assertTrue();
      expect(metadata.composer === 'Composer 022').assertTrue();
      expect(metadata.duration === 22000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 022').assertTrue();
      expect(metadata.avQueueId === 'queue-id-022').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0022 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0023
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0023
     * @tc.desc   Verify extended AVMetadata fields 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0023 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-023', title: 'Meta 023', artist: 'Artist 023', album: 'Album 023',
        author: 'Author 023', writer: 'Writer 023', composer: 'Composer 023', duration: 23000,
        avQueueName: 'Queue Name 023', avQueueId: 'queue-id-023'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 023'));
      expect(metadata.title === 'Meta 023').assertTrue();
      expect(metadata.artist === 'Artist 023').assertTrue();
      expect(metadata.album === 'Album 023').assertTrue();
      expect(metadata.author === 'Author 023').assertTrue();
      expect(metadata.writer === 'Writer 023').assertTrue();
      expect(metadata.composer === 'Composer 023').assertTrue();
      expect(metadata.duration === 23000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 023').assertTrue();
      expect(metadata.avQueueId === 'queue-id-023').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0023 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0024
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0024
     * @tc.desc   Verify extended AVMetadata fields 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0024 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-024', title: 'Meta 024', artist: 'Artist 024', album: 'Album 024',
        author: 'Author 024', writer: 'Writer 024', composer: 'Composer 024', duration: 24000,
        avQueueName: 'Queue Name 024', avQueueId: 'queue-id-024'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 024'));
      expect(metadata.title === 'Meta 024').assertTrue();
      expect(metadata.artist === 'Artist 024').assertTrue();
      expect(metadata.album === 'Album 024').assertTrue();
      expect(metadata.author === 'Author 024').assertTrue();
      expect(metadata.writer === 'Writer 024').assertTrue();
      expect(metadata.composer === 'Composer 024').assertTrue();
      expect(metadata.duration === 24000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 024').assertTrue();
      expect(metadata.avQueueId === 'queue-id-024').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0024 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0025
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0025
     * @tc.desc   Verify extended AVMetadata fields 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0025 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-025', title: 'Meta 025', artist: 'Artist 025', album: 'Album 025',
        author: 'Author 025', writer: 'Writer 025', composer: 'Composer 025', duration: 25000,
        avQueueName: 'Queue Name 025', avQueueId: 'queue-id-025'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 025'));
      expect(metadata.title === 'Meta 025').assertTrue();
      expect(metadata.artist === 'Artist 025').assertTrue();
      expect(metadata.album === 'Album 025').assertTrue();
      expect(metadata.author === 'Author 025').assertTrue();
      expect(metadata.writer === 'Writer 025').assertTrue();
      expect(metadata.composer === 'Composer 025').assertTrue();
      expect(metadata.duration === 25000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 025').assertTrue();
      expect(metadata.avQueueId === 'queue-id-025').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0025 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0026
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0026
     * @tc.desc   Verify extended AVMetadata fields 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0026 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-026', title: 'Meta 026', artist: 'Artist 026', album: 'Album 026',
        author: 'Author 026', writer: 'Writer 026', composer: 'Composer 026', duration: 26000,
        avQueueName: 'Queue Name 026', avQueueId: 'queue-id-026'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 026'));
      expect(metadata.title === 'Meta 026').assertTrue();
      expect(metadata.artist === 'Artist 026').assertTrue();
      expect(metadata.album === 'Album 026').assertTrue();
      expect(metadata.author === 'Author 026').assertTrue();
      expect(metadata.writer === 'Writer 026').assertTrue();
      expect(metadata.composer === 'Composer 026').assertTrue();
      expect(metadata.duration === 26000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 026').assertTrue();
      expect(metadata.avQueueId === 'queue-id-026').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0026 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0027
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0027
     * @tc.desc   Verify extended AVMetadata fields 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0027 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-027', title: 'Meta 027', artist: 'Artist 027', album: 'Album 027',
        author: 'Author 027', writer: 'Writer 027', composer: 'Composer 027', duration: 27000,
        avQueueName: 'Queue Name 027', avQueueId: 'queue-id-027'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 027'));
      expect(metadata.title === 'Meta 027').assertTrue();
      expect(metadata.artist === 'Artist 027').assertTrue();
      expect(metadata.album === 'Album 027').assertTrue();
      expect(metadata.author === 'Author 027').assertTrue();
      expect(metadata.writer === 'Writer 027').assertTrue();
      expect(metadata.composer === 'Composer 027').assertTrue();
      expect(metadata.duration === 27000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 027').assertTrue();
      expect(metadata.avQueueId === 'queue-id-027').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0027 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0028
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0028
     * @tc.desc   Verify extended AVMetadata fields 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0028 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-028', title: 'Meta 028', artist: 'Artist 028', album: 'Album 028',
        author: 'Author 028', writer: 'Writer 028', composer: 'Composer 028', duration: 28000,
        avQueueName: 'Queue Name 028', avQueueId: 'queue-id-028'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 028'));
      expect(metadata.title === 'Meta 028').assertTrue();
      expect(metadata.artist === 'Artist 028').assertTrue();
      expect(metadata.album === 'Album 028').assertTrue();
      expect(metadata.author === 'Author 028').assertTrue();
      expect(metadata.writer === 'Writer 028').assertTrue();
      expect(metadata.composer === 'Composer 028').assertTrue();
      expect(metadata.duration === 28000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 028').assertTrue();
      expect(metadata.avQueueId === 'queue-id-028').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0028 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0029
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0029
     * @tc.desc   Verify extended AVMetadata fields 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0029 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-029', title: 'Meta 029', artist: 'Artist 029', album: 'Album 029',
        author: 'Author 029', writer: 'Writer 029', composer: 'Composer 029', duration: 29000,
        avQueueName: 'Queue Name 029', avQueueId: 'queue-id-029'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 029'));
      expect(metadata.title === 'Meta 029').assertTrue();
      expect(metadata.artist === 'Artist 029').assertTrue();
      expect(metadata.album === 'Album 029').assertTrue();
      expect(metadata.author === 'Author 029').assertTrue();
      expect(metadata.writer === 'Writer 029').assertTrue();
      expect(metadata.composer === 'Composer 029').assertTrue();
      expect(metadata.duration === 29000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 029').assertTrue();
      expect(metadata.avQueueId === 'queue-id-029').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0029 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0030
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0030
     * @tc.desc   Verify extended AVMetadata fields 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0030 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-030', title: 'Meta 030', artist: 'Artist 030', album: 'Album 030',
        author: 'Author 030', writer: 'Writer 030', composer: 'Composer 030', duration: 30000,
        avQueueName: 'Queue Name 030', avQueueId: 'queue-id-030'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 030'));
      expect(metadata.title === 'Meta 030').assertTrue();
      expect(metadata.artist === 'Artist 030').assertTrue();
      expect(metadata.album === 'Album 030').assertTrue();
      expect(metadata.author === 'Author 030').assertTrue();
      expect(metadata.writer === 'Writer 030').assertTrue();
      expect(metadata.composer === 'Composer 030').assertTrue();
      expect(metadata.duration === 30000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 030').assertTrue();
      expect(metadata.avQueueId === 'queue-id-030').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0030 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0031
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0031
     * @tc.desc   Verify extended AVMetadata fields 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0031 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-031', title: 'Meta 031', artist: 'Artist 031', album: 'Album 031',
        author: 'Author 031', writer: 'Writer 031', composer: 'Composer 031', duration: 31000,
        avQueueName: 'Queue Name 031', avQueueId: 'queue-id-031'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 031'));
      expect(metadata.title === 'Meta 031').assertTrue();
      expect(metadata.artist === 'Artist 031').assertTrue();
      expect(metadata.album === 'Album 031').assertTrue();
      expect(metadata.author === 'Author 031').assertTrue();
      expect(metadata.writer === 'Writer 031').assertTrue();
      expect(metadata.composer === 'Composer 031').assertTrue();
      expect(metadata.duration === 31000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 031').assertTrue();
      expect(metadata.avQueueId === 'queue-id-031').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0031 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0032
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0032
     * @tc.desc   Verify extended AVMetadata fields 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0032 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-032', title: 'Meta 032', artist: 'Artist 032', album: 'Album 032',
        author: 'Author 032', writer: 'Writer 032', composer: 'Composer 032', duration: 32000,
        avQueueName: 'Queue Name 032', avQueueId: 'queue-id-032'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 032'));
      expect(metadata.title === 'Meta 032').assertTrue();
      expect(metadata.artist === 'Artist 032').assertTrue();
      expect(metadata.album === 'Album 032').assertTrue();
      expect(metadata.author === 'Author 032').assertTrue();
      expect(metadata.writer === 'Writer 032').assertTrue();
      expect(metadata.composer === 'Composer 032').assertTrue();
      expect(metadata.duration === 32000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 032').assertTrue();
      expect(metadata.avQueueId === 'queue-id-032').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0032 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0033
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0033
     * @tc.desc   Verify extended AVMetadata fields 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0033 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-033', title: 'Meta 033', artist: 'Artist 033', album: 'Album 033',
        author: 'Author 033', writer: 'Writer 033', composer: 'Composer 033', duration: 33000,
        avQueueName: 'Queue Name 033', avQueueId: 'queue-id-033'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 033'));
      expect(metadata.title === 'Meta 033').assertTrue();
      expect(metadata.artist === 'Artist 033').assertTrue();
      expect(metadata.album === 'Album 033').assertTrue();
      expect(metadata.author === 'Author 033').assertTrue();
      expect(metadata.writer === 'Writer 033').assertTrue();
      expect(metadata.composer === 'Composer 033').assertTrue();
      expect(metadata.duration === 33000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 033').assertTrue();
      expect(metadata.avQueueId === 'queue-id-033').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0033 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0034
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0034
     * @tc.desc   Verify extended AVMetadata fields 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0034 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-034', title: 'Meta 034', artist: 'Artist 034', album: 'Album 034',
        author: 'Author 034', writer: 'Writer 034', composer: 'Composer 034', duration: 34000,
        avQueueName: 'Queue Name 034', avQueueId: 'queue-id-034'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 034'));
      expect(metadata.title === 'Meta 034').assertTrue();
      expect(metadata.artist === 'Artist 034').assertTrue();
      expect(metadata.album === 'Album 034').assertTrue();
      expect(metadata.author === 'Author 034').assertTrue();
      expect(metadata.writer === 'Writer 034').assertTrue();
      expect(metadata.composer === 'Composer 034').assertTrue();
      expect(metadata.duration === 34000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 034').assertTrue();
      expect(metadata.avQueueId === 'queue-id-034').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0034 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0035
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0035
     * @tc.desc   Verify extended AVMetadata fields 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0035 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-035', title: 'Meta 035', artist: 'Artist 035', album: 'Album 035',
        author: 'Author 035', writer: 'Writer 035', composer: 'Composer 035', duration: 35000,
        avQueueName: 'Queue Name 035', avQueueId: 'queue-id-035'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 035'));
      expect(metadata.title === 'Meta 035').assertTrue();
      expect(metadata.artist === 'Artist 035').assertTrue();
      expect(metadata.album === 'Album 035').assertTrue();
      expect(metadata.author === 'Author 035').assertTrue();
      expect(metadata.writer === 'Writer 035').assertTrue();
      expect(metadata.composer === 'Composer 035').assertTrue();
      expect(metadata.duration === 35000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 035').assertTrue();
      expect(metadata.avQueueId === 'queue-id-035').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0035 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0036
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0036
     * @tc.desc   Verify extended AVMetadata fields 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0036 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-036', title: 'Meta 036', artist: 'Artist 036', album: 'Album 036',
        author: 'Author 036', writer: 'Writer 036', composer: 'Composer 036', duration: 36000,
        avQueueName: 'Queue Name 036', avQueueId: 'queue-id-036'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 036'));
      expect(metadata.title === 'Meta 036').assertTrue();
      expect(metadata.artist === 'Artist 036').assertTrue();
      expect(metadata.album === 'Album 036').assertTrue();
      expect(metadata.author === 'Author 036').assertTrue();
      expect(metadata.writer === 'Writer 036').assertTrue();
      expect(metadata.composer === 'Composer 036').assertTrue();
      expect(metadata.duration === 36000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 036').assertTrue();
      expect(metadata.avQueueId === 'queue-id-036').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0036 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0037
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0037
     * @tc.desc   Verify extended AVMetadata fields 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0037 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-037', title: 'Meta 037', artist: 'Artist 037', album: 'Album 037',
        author: 'Author 037', writer: 'Writer 037', composer: 'Composer 037', duration: 37000,
        avQueueName: 'Queue Name 037', avQueueId: 'queue-id-037'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 037'));
      expect(metadata.title === 'Meta 037').assertTrue();
      expect(metadata.artist === 'Artist 037').assertTrue();
      expect(metadata.album === 'Album 037').assertTrue();
      expect(metadata.author === 'Author 037').assertTrue();
      expect(metadata.writer === 'Writer 037').assertTrue();
      expect(metadata.composer === 'Composer 037').assertTrue();
      expect(metadata.duration === 37000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 037').assertTrue();
      expect(metadata.avQueueId === 'queue-id-037').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0037 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0038
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0038
     * @tc.desc   Verify extended AVMetadata fields 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0038 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-038', title: 'Meta 038', artist: 'Artist 038', album: 'Album 038',
        author: 'Author 038', writer: 'Writer 038', composer: 'Composer 038', duration: 38000,
        avQueueName: 'Queue Name 038', avQueueId: 'queue-id-038'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 038'));
      expect(metadata.title === 'Meta 038').assertTrue();
      expect(metadata.artist === 'Artist 038').assertTrue();
      expect(metadata.album === 'Album 038').assertTrue();
      expect(metadata.author === 'Author 038').assertTrue();
      expect(metadata.writer === 'Writer 038').assertTrue();
      expect(metadata.composer === 'Composer 038').assertTrue();
      expect(metadata.duration === 38000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 038').assertTrue();
      expect(metadata.avQueueId === 'queue-id-038').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0038 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0039
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0039
     * @tc.desc   Verify extended AVMetadata fields 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0039 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-039', title: 'Meta 039', artist: 'Artist 039', album: 'Album 039',
        author: 'Author 039', writer: 'Writer 039', composer: 'Composer 039', duration: 39000,
        avQueueName: 'Queue Name 039', avQueueId: 'queue-id-039'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 039'));
      expect(metadata.title === 'Meta 039').assertTrue();
      expect(metadata.artist === 'Artist 039').assertTrue();
      expect(metadata.album === 'Album 039').assertTrue();
      expect(metadata.author === 'Author 039').assertTrue();
      expect(metadata.writer === 'Writer 039').assertTrue();
      expect(metadata.composer === 'Composer 039').assertTrue();
      expect(metadata.duration === 39000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 039').assertTrue();
      expect(metadata.avQueueId === 'queue-id-039').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0039 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0040
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0040
     * @tc.desc   Verify extended AVMetadata fields 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0040 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-040', title: 'Meta 040', artist: 'Artist 040', album: 'Album 040',
        author: 'Author 040', writer: 'Writer 040', composer: 'Composer 040', duration: 40000,
        avQueueName: 'Queue Name 040', avQueueId: 'queue-id-040'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 040'));
      expect(metadata.title === 'Meta 040').assertTrue();
      expect(metadata.artist === 'Artist 040').assertTrue();
      expect(metadata.album === 'Album 040').assertTrue();
      expect(metadata.author === 'Author 040').assertTrue();
      expect(metadata.writer === 'Writer 040').assertTrue();
      expect(metadata.composer === 'Composer 040').assertTrue();
      expect(metadata.duration === 40000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 040').assertTrue();
      expect(metadata.avQueueId === 'queue-id-040').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0040 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0041
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0041
     * @tc.desc   Verify extended AVMetadata fields 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0041 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-041', title: 'Meta 041', artist: 'Artist 041', album: 'Album 041',
        author: 'Author 041', writer: 'Writer 041', composer: 'Composer 041', duration: 41000,
        avQueueName: 'Queue Name 041', avQueueId: 'queue-id-041'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 041'));
      expect(metadata.title === 'Meta 041').assertTrue();
      expect(metadata.artist === 'Artist 041').assertTrue();
      expect(metadata.album === 'Album 041').assertTrue();
      expect(metadata.author === 'Author 041').assertTrue();
      expect(metadata.writer === 'Writer 041').assertTrue();
      expect(metadata.composer === 'Composer 041').assertTrue();
      expect(metadata.duration === 41000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 041').assertTrue();
      expect(metadata.avQueueId === 'queue-id-041').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0041 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0042
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0042
     * @tc.desc   Verify extended AVMetadata fields 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0042 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-042', title: 'Meta 042', artist: 'Artist 042', album: 'Album 042',
        author: 'Author 042', writer: 'Writer 042', composer: 'Composer 042', duration: 42000,
        avQueueName: 'Queue Name 042', avQueueId: 'queue-id-042'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 042'));
      expect(metadata.title === 'Meta 042').assertTrue();
      expect(metadata.artist === 'Artist 042').assertTrue();
      expect(metadata.album === 'Album 042').assertTrue();
      expect(metadata.author === 'Author 042').assertTrue();
      expect(metadata.writer === 'Writer 042').assertTrue();
      expect(metadata.composer === 'Composer 042').assertTrue();
      expect(metadata.duration === 42000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 042').assertTrue();
      expect(metadata.avQueueId === 'queue-id-042').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0042 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0043
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0043
     * @tc.desc   Verify extended AVMetadata fields 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0043 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-043', title: 'Meta 043', artist: 'Artist 043', album: 'Album 043',
        author: 'Author 043', writer: 'Writer 043', composer: 'Composer 043', duration: 43000,
        avQueueName: 'Queue Name 043', avQueueId: 'queue-id-043'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 043'));
      expect(metadata.title === 'Meta 043').assertTrue();
      expect(metadata.artist === 'Artist 043').assertTrue();
      expect(metadata.album === 'Album 043').assertTrue();
      expect(metadata.author === 'Author 043').assertTrue();
      expect(metadata.writer === 'Writer 043').assertTrue();
      expect(metadata.composer === 'Composer 043').assertTrue();
      expect(metadata.duration === 43000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 043').assertTrue();
      expect(metadata.avQueueId === 'queue-id-043').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0043 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0044
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0044
     * @tc.desc   Verify extended AVMetadata fields 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0044 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-044', title: 'Meta 044', artist: 'Artist 044', album: 'Album 044',
        author: 'Author 044', writer: 'Writer 044', composer: 'Composer 044', duration: 44000,
        avQueueName: 'Queue Name 044', avQueueId: 'queue-id-044'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 044'));
      expect(metadata.title === 'Meta 044').assertTrue();
      expect(metadata.artist === 'Artist 044').assertTrue();
      expect(metadata.album === 'Album 044').assertTrue();
      expect(metadata.author === 'Author 044').assertTrue();
      expect(metadata.writer === 'Writer 044').assertTrue();
      expect(metadata.composer === 'Composer 044').assertTrue();
      expect(metadata.duration === 44000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 044').assertTrue();
      expect(metadata.avQueueId === 'queue-id-044').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0044 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0045
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0045
     * @tc.desc   Verify extended AVMetadata fields 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0045 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-045', title: 'Meta 045', artist: 'Artist 045', album: 'Album 045',
        author: 'Author 045', writer: 'Writer 045', composer: 'Composer 045', duration: 45000,
        avQueueName: 'Queue Name 045', avQueueId: 'queue-id-045'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 045'));
      expect(metadata.title === 'Meta 045').assertTrue();
      expect(metadata.artist === 'Artist 045').assertTrue();
      expect(metadata.album === 'Album 045').assertTrue();
      expect(metadata.author === 'Author 045').assertTrue();
      expect(metadata.writer === 'Writer 045').assertTrue();
      expect(metadata.composer === 'Composer 045').assertTrue();
      expect(metadata.duration === 45000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 045').assertTrue();
      expect(metadata.avQueueId === 'queue-id-045').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0045 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0046
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0046
     * @tc.desc   Verify extended AVMetadata fields 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0046 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-046', title: 'Meta 046', artist: 'Artist 046', album: 'Album 046',
        author: 'Author 046', writer: 'Writer 046', composer: 'Composer 046', duration: 46000,
        avQueueName: 'Queue Name 046', avQueueId: 'queue-id-046'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 046'));
      expect(metadata.title === 'Meta 046').assertTrue();
      expect(metadata.artist === 'Artist 046').assertTrue();
      expect(metadata.album === 'Album 046').assertTrue();
      expect(metadata.author === 'Author 046').assertTrue();
      expect(metadata.writer === 'Writer 046').assertTrue();
      expect(metadata.composer === 'Composer 046').assertTrue();
      expect(metadata.duration === 46000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 046').assertTrue();
      expect(metadata.avQueueId === 'queue-id-046').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0046 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0047
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0047
     * @tc.desc   Verify extended AVMetadata fields 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0047 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-047', title: 'Meta 047', artist: 'Artist 047', album: 'Album 047',
        author: 'Author 047', writer: 'Writer 047', composer: 'Composer 047', duration: 47000,
        avQueueName: 'Queue Name 047', avQueueId: 'queue-id-047'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 047'));
      expect(metadata.title === 'Meta 047').assertTrue();
      expect(metadata.artist === 'Artist 047').assertTrue();
      expect(metadata.album === 'Album 047').assertTrue();
      expect(metadata.author === 'Author 047').assertTrue();
      expect(metadata.writer === 'Writer 047').assertTrue();
      expect(metadata.composer === 'Composer 047').assertTrue();
      expect(metadata.duration === 47000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 047').assertTrue();
      expect(metadata.avQueueId === 'queue-id-047').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0047 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0048
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0048
     * @tc.desc   Verify extended AVMetadata fields 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0048 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-048', title: 'Meta 048', artist: 'Artist 048', album: 'Album 048',
        author: 'Author 048', writer: 'Writer 048', composer: 'Composer 048', duration: 48000,
        avQueueName: 'Queue Name 048', avQueueId: 'queue-id-048'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 048'));
      expect(metadata.title === 'Meta 048').assertTrue();
      expect(metadata.artist === 'Artist 048').assertTrue();
      expect(metadata.album === 'Album 048').assertTrue();
      expect(metadata.author === 'Author 048').assertTrue();
      expect(metadata.writer === 'Writer 048').assertTrue();
      expect(metadata.composer === 'Composer 048').assertTrue();
      expect(metadata.duration === 48000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 048').assertTrue();
      expect(metadata.avQueueId === 'queue-id-048').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0048 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0049
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0049
     * @tc.desc   Verify extended AVMetadata fields 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0049 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-049', title: 'Meta 049', artist: 'Artist 049', album: 'Album 049',
        author: 'Author 049', writer: 'Writer 049', composer: 'Composer 049', duration: 49000,
        avQueueName: 'Queue Name 049', avQueueId: 'queue-id-049'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 049'));
      expect(metadata.title === 'Meta 049').assertTrue();
      expect(metadata.artist === 'Artist 049').assertTrue();
      expect(metadata.album === 'Album 049').assertTrue();
      expect(metadata.author === 'Author 049').assertTrue();
      expect(metadata.writer === 'Writer 049').assertTrue();
      expect(metadata.composer === 'Composer 049').assertTrue();
      expect(metadata.duration === 49000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 049').assertTrue();
      expect(metadata.avQueueId === 'queue-id-049').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0049 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0050
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0050
     * @tc.desc   Verify extended AVMetadata fields 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0050 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-050', title: 'Meta 050', artist: 'Artist 050', album: 'Album 050',
        author: 'Author 050', writer: 'Writer 050', composer: 'Composer 050', duration: 50000,
        avQueueName: 'Queue Name 050', avQueueId: 'queue-id-050'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 050'));
      expect(metadata.title === 'Meta 050').assertTrue();
      expect(metadata.artist === 'Artist 050').assertTrue();
      expect(metadata.album === 'Album 050').assertTrue();
      expect(metadata.author === 'Author 050').assertTrue();
      expect(metadata.writer === 'Writer 050').assertTrue();
      expect(metadata.composer === 'Composer 050').assertTrue();
      expect(metadata.duration === 50000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 050').assertTrue();
      expect(metadata.avQueueId === 'queue-id-050').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0050 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0051
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0051
     * @tc.desc   Verify extended AVMetadata fields 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0051 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-051', title: 'Meta 051', artist: 'Artist 051', album: 'Album 051',
        author: 'Author 051', writer: 'Writer 051', composer: 'Composer 051', duration: 51000,
        avQueueName: 'Queue Name 051', avQueueId: 'queue-id-051'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 051'));
      expect(metadata.title === 'Meta 051').assertTrue();
      expect(metadata.artist === 'Artist 051').assertTrue();
      expect(metadata.album === 'Album 051').assertTrue();
      expect(metadata.author === 'Author 051').assertTrue();
      expect(metadata.writer === 'Writer 051').assertTrue();
      expect(metadata.composer === 'Composer 051').assertTrue();
      expect(metadata.duration === 51000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 051').assertTrue();
      expect(metadata.avQueueId === 'queue-id-051').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0051 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0052
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0052
     * @tc.desc   Verify extended AVMetadata fields 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0052 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-052', title: 'Meta 052', artist: 'Artist 052', album: 'Album 052',
        author: 'Author 052', writer: 'Writer 052', composer: 'Composer 052', duration: 52000,
        avQueueName: 'Queue Name 052', avQueueId: 'queue-id-052'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 052'));
      expect(metadata.title === 'Meta 052').assertTrue();
      expect(metadata.artist === 'Artist 052').assertTrue();
      expect(metadata.album === 'Album 052').assertTrue();
      expect(metadata.author === 'Author 052').assertTrue();
      expect(metadata.writer === 'Writer 052').assertTrue();
      expect(metadata.composer === 'Composer 052').assertTrue();
      expect(metadata.duration === 52000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 052').assertTrue();
      expect(metadata.avQueueId === 'queue-id-052').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0052 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0053
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0053
     * @tc.desc   Verify extended AVMetadata fields 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0053 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-053', title: 'Meta 053', artist: 'Artist 053', album: 'Album 053',
        author: 'Author 053', writer: 'Writer 053', composer: 'Composer 053', duration: 53000,
        avQueueName: 'Queue Name 053', avQueueId: 'queue-id-053'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 053'));
      expect(metadata.title === 'Meta 053').assertTrue();
      expect(metadata.artist === 'Artist 053').assertTrue();
      expect(metadata.album === 'Album 053').assertTrue();
      expect(metadata.author === 'Author 053').assertTrue();
      expect(metadata.writer === 'Writer 053').assertTrue();
      expect(metadata.composer === 'Composer 053').assertTrue();
      expect(metadata.duration === 53000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 053').assertTrue();
      expect(metadata.avQueueId === 'queue-id-053').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0053 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0054
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0054
     * @tc.desc   Verify extended AVMetadata fields 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0054 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-054', title: 'Meta 054', artist: 'Artist 054', album: 'Album 054',
        author: 'Author 054', writer: 'Writer 054', composer: 'Composer 054', duration: 54000,
        avQueueName: 'Queue Name 054', avQueueId: 'queue-id-054'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 054'));
      expect(metadata.title === 'Meta 054').assertTrue();
      expect(metadata.artist === 'Artist 054').assertTrue();
      expect(metadata.album === 'Album 054').assertTrue();
      expect(metadata.author === 'Author 054').assertTrue();
      expect(metadata.writer === 'Writer 054').assertTrue();
      expect(metadata.composer === 'Composer 054').assertTrue();
      expect(metadata.duration === 54000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 054').assertTrue();
      expect(metadata.avQueueId === 'queue-id-054').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0054 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0055
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0055
     * @tc.desc   Verify extended AVMetadata fields 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0055 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-055', title: 'Meta 055', artist: 'Artist 055', album: 'Album 055',
        author: 'Author 055', writer: 'Writer 055', composer: 'Composer 055', duration: 55000,
        avQueueName: 'Queue Name 055', avQueueId: 'queue-id-055'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 055'));
      expect(metadata.title === 'Meta 055').assertTrue();
      expect(metadata.artist === 'Artist 055').assertTrue();
      expect(metadata.album === 'Album 055').assertTrue();
      expect(metadata.author === 'Author 055').assertTrue();
      expect(metadata.writer === 'Writer 055').assertTrue();
      expect(metadata.composer === 'Composer 055').assertTrue();
      expect(metadata.duration === 55000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 055').assertTrue();
      expect(metadata.avQueueId === 'queue-id-055').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0055 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0056
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0056
     * @tc.desc   Verify extended AVMetadata fields 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0056 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-056', title: 'Meta 056', artist: 'Artist 056', album: 'Album 056',
        author: 'Author 056', writer: 'Writer 056', composer: 'Composer 056', duration: 56000,
        avQueueName: 'Queue Name 056', avQueueId: 'queue-id-056'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 056'));
      expect(metadata.title === 'Meta 056').assertTrue();
      expect(metadata.artist === 'Artist 056').assertTrue();
      expect(metadata.album === 'Album 056').assertTrue();
      expect(metadata.author === 'Author 056').assertTrue();
      expect(metadata.writer === 'Writer 056').assertTrue();
      expect(metadata.composer === 'Composer 056').assertTrue();
      expect(metadata.duration === 56000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 056').assertTrue();
      expect(metadata.avQueueId === 'queue-id-056').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0056 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0057
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0057
     * @tc.desc   Verify extended AVMetadata fields 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0057 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-057', title: 'Meta 057', artist: 'Artist 057', album: 'Album 057',
        author: 'Author 057', writer: 'Writer 057', composer: 'Composer 057', duration: 57000,
        avQueueName: 'Queue Name 057', avQueueId: 'queue-id-057'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 057'));
      expect(metadata.title === 'Meta 057').assertTrue();
      expect(metadata.artist === 'Artist 057').assertTrue();
      expect(metadata.album === 'Album 057').assertTrue();
      expect(metadata.author === 'Author 057').assertTrue();
      expect(metadata.writer === 'Writer 057').assertTrue();
      expect(metadata.composer === 'Composer 057').assertTrue();
      expect(metadata.duration === 57000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 057').assertTrue();
      expect(metadata.avQueueId === 'queue-id-057').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0057 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0058
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0058
     * @tc.desc   Verify extended AVMetadata fields 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0058 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-058', title: 'Meta 058', artist: 'Artist 058', album: 'Album 058',
        author: 'Author 058', writer: 'Writer 058', composer: 'Composer 058', duration: 58000,
        avQueueName: 'Queue Name 058', avQueueId: 'queue-id-058'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 058'));
      expect(metadata.title === 'Meta 058').assertTrue();
      expect(metadata.artist === 'Artist 058').assertTrue();
      expect(metadata.album === 'Album 058').assertTrue();
      expect(metadata.author === 'Author 058').assertTrue();
      expect(metadata.writer === 'Writer 058').assertTrue();
      expect(metadata.composer === 'Composer 058').assertTrue();
      expect(metadata.duration === 58000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 058').assertTrue();
      expect(metadata.avQueueId === 'queue-id-058').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0058 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0059
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0059
     * @tc.desc   Verify extended AVMetadata fields 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0059 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-059', title: 'Meta 059', artist: 'Artist 059', album: 'Album 059',
        author: 'Author 059', writer: 'Writer 059', composer: 'Composer 059', duration: 59000,
        avQueueName: 'Queue Name 059', avQueueId: 'queue-id-059'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 059'));
      expect(metadata.title === 'Meta 059').assertTrue();
      expect(metadata.artist === 'Artist 059').assertTrue();
      expect(metadata.album === 'Album 059').assertTrue();
      expect(metadata.author === 'Author 059').assertTrue();
      expect(metadata.writer === 'Writer 059').assertTrue();
      expect(metadata.composer === 'Composer 059').assertTrue();
      expect(metadata.duration === 59000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 059').assertTrue();
      expect(metadata.avQueueId === 'queue-id-059').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0059 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0060
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0060
     * @tc.desc   Verify extended AVMetadata fields 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0060 begin');
      const metadata: AVSessionManager.AVMetadata = {
        assetId: 'meta-asset-060', title: 'Meta 060', artist: 'Artist 060', album: 'Album 060',
        author: 'Author 060', writer: 'Writer 060', composer: 'Composer 060', duration: 60000,
        avQueueName: 'Queue Name 060', avQueueId: 'queue-id-060'
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', metadata.album, String('Album 060'));
      expect(metadata.title === 'Meta 060').assertTrue();
      expect(metadata.artist === 'Artist 060').assertTrue();
      expect(metadata.album === 'Album 060').assertTrue();
      expect(metadata.author === 'Author 060').assertTrue();
      expect(metadata.writer === 'Writer 060').assertTrue();
      expect(metadata.composer === 'Composer 060').assertTrue();
      expect(metadata.duration === 60000).assertTrue();
      expect(metadata.avQueueName === 'Queue Name 060').assertTrue();
      expect(metadata.avQueueId === 'queue-id-060').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0060 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0061
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0061
     * @tc.desc   Verify extended AVMediaDescription fields 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0061 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 1,
        description: {
          assetId: 'desc-asset-001', title: 'Desc 001', subtitle: 'Subtitle 001',
          description: 'Description 001', albumTitle: 'Album Title 001', mediaType: 'audio', mediaSize: 1024
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 001'));
      expect(item.description?.title === 'Desc 001').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 001').assertTrue();
      expect(item.description?.description === 'Description 001').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 001').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 1024).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0061 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0062
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0062
     * @tc.desc   Verify extended AVMediaDescription fields 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0062 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 2,
        description: {
          assetId: 'desc-asset-002', title: 'Desc 002', subtitle: 'Subtitle 002',
          description: 'Description 002', albumTitle: 'Album Title 002', mediaType: 'audio', mediaSize: 2048
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 002'));
      expect(item.description?.title === 'Desc 002').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 002').assertTrue();
      expect(item.description?.description === 'Description 002').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 002').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 2048).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0062 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0063
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0063
     * @tc.desc   Verify extended AVMediaDescription fields 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0063 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 3,
        description: {
          assetId: 'desc-asset-003', title: 'Desc 003', subtitle: 'Subtitle 003',
          description: 'Description 003', albumTitle: 'Album Title 003', mediaType: 'audio', mediaSize: 3072
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 003'));
      expect(item.description?.title === 'Desc 003').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 003').assertTrue();
      expect(item.description?.description === 'Description 003').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 003').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 3072).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0063 end');
    })
  })
}
