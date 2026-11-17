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

export default function mediaControllerEdgeTestPart01() {
  describe('MediaControllerEdgePart01', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0001
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0001
     * @tc.desc   Verify metadata boundary variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0001 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: ' ', title: ' ', artist: ' ' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(' '));
      expect(metadata.assetId).assertEqual(' ');
      expect(metadata.title).assertEqual(' ');
      expect(metadata.artist).assertEqual(' ');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0001 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0002
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0002
     * @tc.desc   Verify metadata boundary variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0002 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-empty', title: '', artist: 'artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset-empty');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0002 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0003
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0003
     * @tc.desc   Verify metadata boundary variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0003 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: 'Title', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title'));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('Title');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0003 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0004
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0004
     * @tc.desc   Verify metadata boundary variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0004 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: '', artist: 'Artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('Artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0004 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0005
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0005
     * @tc.desc   Verify metadata boundary variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0005 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-000', title: 'Edge Title 000', artist: 'Edge Artist 000' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Edge Title 000'));
      expect(metadata.assetId).assertEqual('asset-000');
      expect(metadata.title).assertEqual('Edge Title 000');
      expect(metadata.artist).assertEqual('Edge Artist 000');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0005 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0006
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0006
     * @tc.desc   Verify metadata boundary variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0006 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-long', title: 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', artist: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'));
      expect(metadata.assetId).assertEqual('asset-long');
      expect(metadata.title).assertEqual('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(metadata.artist).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0006 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0007
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0007
     * @tc.desc   Verify metadata boundary variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0007 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-quote', title: 'Title quoted', artist: 'Artist quoted' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title quoted'));
      expect(metadata.assetId).assertEqual('asset-quote');
      expect(metadata.title).assertEqual('Title quoted');
      expect(metadata.artist).assertEqual('Artist quoted');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0007 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0008
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0008
     * @tc.desc   Verify metadata boundary variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0008 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-backslash', title: 'Title backslash', artist: 'Artist slash' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title backslash'));
      expect(metadata.assetId).assertEqual('asset-backslash');
      expect(metadata.title).assertEqual('Title backslash');
      expect(metadata.artist).assertEqual('Artist slash');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0008 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0009
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0009
     * @tc.desc   Verify metadata boundary variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0009 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-unicode', title: 'Title unicode', artist: 'Artist unicode' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title unicode'));
      expect(metadata.assetId).assertEqual('asset-unicode');
      expect(metadata.title).assertEqual('Title unicode');
      expect(metadata.artist).assertEqual('Artist unicode');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0009 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0010
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0010
     * @tc.desc   Verify metadata boundary variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0010 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: '', title: '', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0010 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0011
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0011
     * @tc.desc   Verify metadata boundary variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0011 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: ' ', title: ' ', artist: ' ' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(' '));
      expect(metadata.assetId).assertEqual(' ');
      expect(metadata.title).assertEqual(' ');
      expect(metadata.artist).assertEqual(' ');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0011 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0012
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0012
     * @tc.desc   Verify metadata boundary variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0012 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-empty', title: '', artist: 'artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset-empty');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0012 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0013
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0013
     * @tc.desc   Verify metadata boundary variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0013 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: 'Title', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title'));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('Title');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0013 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0014
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0014
     * @tc.desc   Verify metadata boundary variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0014 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: '', artist: 'Artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('Artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0014 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0015
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0015
     * @tc.desc   Verify metadata boundary variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0015 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-000', title: 'Edge Title 000', artist: 'Edge Artist 000' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Edge Title 000'));
      expect(metadata.assetId).assertEqual('asset-000');
      expect(metadata.title).assertEqual('Edge Title 000');
      expect(metadata.artist).assertEqual('Edge Artist 000');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0015 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0016
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0016
     * @tc.desc   Verify metadata boundary variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0016 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-long', title: 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', artist: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'));
      expect(metadata.assetId).assertEqual('asset-long');
      expect(metadata.title).assertEqual('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(metadata.artist).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0016 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0017
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0017
     * @tc.desc   Verify metadata boundary variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0017 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-quote', title: 'Title quoted', artist: 'Artist quoted' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title quoted'));
      expect(metadata.assetId).assertEqual('asset-quote');
      expect(metadata.title).assertEqual('Title quoted');
      expect(metadata.artist).assertEqual('Artist quoted');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0017 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0018
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0018
     * @tc.desc   Verify metadata boundary variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0018 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-backslash', title: 'Title backslash', artist: 'Artist slash' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title backslash'));
      expect(metadata.assetId).assertEqual('asset-backslash');
      expect(metadata.title).assertEqual('Title backslash');
      expect(metadata.artist).assertEqual('Artist slash');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0018 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0019
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0019
     * @tc.desc   Verify metadata boundary variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0019 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-unicode', title: 'Title unicode', artist: 'Artist unicode' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title unicode'));
      expect(metadata.assetId).assertEqual('asset-unicode');
      expect(metadata.title).assertEqual('Title unicode');
      expect(metadata.artist).assertEqual('Artist unicode');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0019 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0020
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0020
     * @tc.desc   Verify metadata boundary variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0020 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: '', title: '', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0020 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0021
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0021
     * @tc.desc   Verify metadata boundary variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0021 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: ' ', title: ' ', artist: ' ' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(' '));
      expect(metadata.assetId).assertEqual(' ');
      expect(metadata.title).assertEqual(' ');
      expect(metadata.artist).assertEqual(' ');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0021 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0022
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0022
     * @tc.desc   Verify metadata boundary variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0022 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-empty', title: '', artist: 'artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset-empty');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0022 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0023
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0023
     * @tc.desc   Verify metadata boundary variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0023 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: 'Title', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title'));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('Title');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0023 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0024
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0024
     * @tc.desc   Verify metadata boundary variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0024 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: '', artist: 'Artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('Artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0024 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0025
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0025
     * @tc.desc   Verify metadata boundary variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0025 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-000', title: 'Edge Title 000', artist: 'Edge Artist 000' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Edge Title 000'));
      expect(metadata.assetId).assertEqual('asset-000');
      expect(metadata.title).assertEqual('Edge Title 000');
      expect(metadata.artist).assertEqual('Edge Artist 000');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0025 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0026
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0026
     * @tc.desc   Verify metadata boundary variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0026 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-long', title: 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', artist: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'));
      expect(metadata.assetId).assertEqual('asset-long');
      expect(metadata.title).assertEqual('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(metadata.artist).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0026 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0027
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0027
     * @tc.desc   Verify metadata boundary variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0027 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-quote', title: 'Title quoted', artist: 'Artist quoted' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title quoted'));
      expect(metadata.assetId).assertEqual('asset-quote');
      expect(metadata.title).assertEqual('Title quoted');
      expect(metadata.artist).assertEqual('Artist quoted');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0027 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0028
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0028
     * @tc.desc   Verify metadata boundary variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0028 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-backslash', title: 'Title backslash', artist: 'Artist slash' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title backslash'));
      expect(metadata.assetId).assertEqual('asset-backslash');
      expect(metadata.title).assertEqual('Title backslash');
      expect(metadata.artist).assertEqual('Artist slash');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0028 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0029
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0029
     * @tc.desc   Verify metadata boundary variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0029 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-unicode', title: 'Title unicode', artist: 'Artist unicode' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title unicode'));
      expect(metadata.assetId).assertEqual('asset-unicode');
      expect(metadata.title).assertEqual('Title unicode');
      expect(metadata.artist).assertEqual('Artist unicode');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0029 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0030
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0030
     * @tc.desc   Verify metadata boundary variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0030 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: '', title: '', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0030 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0031
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0031
     * @tc.desc   Verify metadata boundary variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0031 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: ' ', title: ' ', artist: ' ' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(' '));
      expect(metadata.assetId).assertEqual(' ');
      expect(metadata.title).assertEqual(' ');
      expect(metadata.artist).assertEqual(' ');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0031 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0032
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0032
     * @tc.desc   Verify metadata boundary variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0032 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-empty', title: '', artist: 'artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset-empty');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0032 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0033
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0033
     * @tc.desc   Verify metadata boundary variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0033 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: 'Title', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title'));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('Title');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0033 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0034
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0034
     * @tc.desc   Verify metadata boundary variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0034 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: '', artist: 'Artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('Artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0034 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0035
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0035
     * @tc.desc   Verify metadata boundary variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0035 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-000', title: 'Edge Title 000', artist: 'Edge Artist 000' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Edge Title 000'));
      expect(metadata.assetId).assertEqual('asset-000');
      expect(metadata.title).assertEqual('Edge Title 000');
      expect(metadata.artist).assertEqual('Edge Artist 000');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0035 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0036
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0036
     * @tc.desc   Verify metadata boundary variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0036 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-long', title: 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', artist: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'));
      expect(metadata.assetId).assertEqual('asset-long');
      expect(metadata.title).assertEqual('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(metadata.artist).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0036 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0037
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0037
     * @tc.desc   Verify metadata boundary variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0037 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-quote', title: 'Title quoted', artist: 'Artist quoted' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title quoted'));
      expect(metadata.assetId).assertEqual('asset-quote');
      expect(metadata.title).assertEqual('Title quoted');
      expect(metadata.artist).assertEqual('Artist quoted');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0037 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0038
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0038
     * @tc.desc   Verify metadata boundary variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0038 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-backslash', title: 'Title backslash', artist: 'Artist slash' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title backslash'));
      expect(metadata.assetId).assertEqual('asset-backslash');
      expect(metadata.title).assertEqual('Title backslash');
      expect(metadata.artist).assertEqual('Artist slash');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0038 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0039
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0039
     * @tc.desc   Verify metadata boundary variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0039 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-unicode', title: 'Title unicode', artist: 'Artist unicode' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title unicode'));
      expect(metadata.assetId).assertEqual('asset-unicode');
      expect(metadata.title).assertEqual('Title unicode');
      expect(metadata.artist).assertEqual('Artist unicode');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0039 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0040
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0040
     * @tc.desc   Verify metadata boundary variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0040 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: '', title: '', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0040 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0041
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0041
     * @tc.desc   Verify metadata boundary variant 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0041 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: ' ', title: ' ', artist: ' ' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(' '));
      expect(metadata.assetId).assertEqual(' ');
      expect(metadata.title).assertEqual(' ');
      expect(metadata.artist).assertEqual(' ');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0041 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0042
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0042
     * @tc.desc   Verify metadata boundary variant 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0042 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-empty', title: '', artist: 'artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset-empty');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0042 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0043
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0043
     * @tc.desc   Verify metadata boundary variant 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0043 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: 'Title', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title'));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('Title');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0043 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0044
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0044
     * @tc.desc   Verify metadata boundary variant 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0044 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: '', artist: 'Artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('Artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0044 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0045
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0045
     * @tc.desc   Verify metadata boundary variant 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0045 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-000', title: 'Edge Title 000', artist: 'Edge Artist 000' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Edge Title 000'));
      expect(metadata.assetId).assertEqual('asset-000');
      expect(metadata.title).assertEqual('Edge Title 000');
      expect(metadata.artist).assertEqual('Edge Artist 000');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0045 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0046
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0046
     * @tc.desc   Verify metadata boundary variant 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0046 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-long', title: 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', artist: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'));
      expect(metadata.assetId).assertEqual('asset-long');
      expect(metadata.title).assertEqual('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(metadata.artist).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0046 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0047
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0047
     * @tc.desc   Verify metadata boundary variant 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0047 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-quote', title: 'Title quoted', artist: 'Artist quoted' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title quoted'));
      expect(metadata.assetId).assertEqual('asset-quote');
      expect(metadata.title).assertEqual('Title quoted');
      expect(metadata.artist).assertEqual('Artist quoted');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0047 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0048
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0048
     * @tc.desc   Verify metadata boundary variant 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0048 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-backslash', title: 'Title backslash', artist: 'Artist slash' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title backslash'));
      expect(metadata.assetId).assertEqual('asset-backslash');
      expect(metadata.title).assertEqual('Title backslash');
      expect(metadata.artist).assertEqual('Artist slash');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0048 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0049
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0049
     * @tc.desc   Verify metadata boundary variant 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0049 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-unicode', title: 'Title unicode', artist: 'Artist unicode' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title unicode'));
      expect(metadata.assetId).assertEqual('asset-unicode');
      expect(metadata.title).assertEqual('Title unicode');
      expect(metadata.artist).assertEqual('Artist unicode');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0049 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0050
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0050
     * @tc.desc   Verify metadata boundary variant 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0050 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: '', title: '', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0050 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0051
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0051
     * @tc.desc   Verify metadata boundary variant 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0051 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: ' ', title: ' ', artist: ' ' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(' '));
      expect(metadata.assetId).assertEqual(' ');
      expect(metadata.title).assertEqual(' ');
      expect(metadata.artist).assertEqual(' ');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0051 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0052
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0052
     * @tc.desc   Verify metadata boundary variant 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0052 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-empty', title: '', artist: 'artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset-empty');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0052 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0053
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0053
     * @tc.desc   Verify metadata boundary variant 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0053 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: 'Title', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title'));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('Title');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0053 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0054
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0054
     * @tc.desc   Verify metadata boundary variant 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0054 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: '', artist: 'Artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('Artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0054 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0055
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0055
     * @tc.desc   Verify metadata boundary variant 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0055 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-000', title: 'Edge Title 000', artist: 'Edge Artist 000' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Edge Title 000'));
      expect(metadata.assetId).assertEqual('asset-000');
      expect(metadata.title).assertEqual('Edge Title 000');
      expect(metadata.artist).assertEqual('Edge Artist 000');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0055 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0056
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0056
     * @tc.desc   Verify metadata boundary variant 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0056 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-long', title: 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', artist: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'));
      expect(metadata.assetId).assertEqual('asset-long');
      expect(metadata.title).assertEqual('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(metadata.artist).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0056 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0057
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0057
     * @tc.desc   Verify metadata boundary variant 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0057 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-quote', title: 'Title quoted', artist: 'Artist quoted' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title quoted'));
      expect(metadata.assetId).assertEqual('asset-quote');
      expect(metadata.title).assertEqual('Title quoted');
      expect(metadata.artist).assertEqual('Artist quoted');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0057 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0058
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0058
     * @tc.desc   Verify metadata boundary variant 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0058 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-backslash', title: 'Title backslash', artist: 'Artist slash' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title backslash'));
      expect(metadata.assetId).assertEqual('asset-backslash');
      expect(metadata.title).assertEqual('Title backslash');
      expect(metadata.artist).assertEqual('Artist slash');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0058 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0059
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0059
     * @tc.desc   Verify metadata boundary variant 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0059 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-unicode', title: 'Title unicode', artist: 'Artist unicode' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title unicode'));
      expect(metadata.assetId).assertEqual('asset-unicode');
      expect(metadata.title).assertEqual('Title unicode');
      expect(metadata.artist).assertEqual('Artist unicode');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0059 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0060
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0060
     * @tc.desc   Verify metadata boundary variant 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0060 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: '', title: '', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0060 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0061
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0061
     * @tc.desc   Verify metadata boundary variant 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0061 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: ' ', title: ' ', artist: ' ' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(' '));
      expect(metadata.assetId).assertEqual(' ');
      expect(metadata.title).assertEqual(' ');
      expect(metadata.artist).assertEqual(' ');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0061 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0062
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0062
     * @tc.desc   Verify metadata boundary variant 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0062 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-empty', title: '', artist: 'artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset-empty');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0062 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0063
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0063
     * @tc.desc   Verify metadata boundary variant 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0063 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: 'Title', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title'));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('Title');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0063 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0064
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0064
     * @tc.desc   Verify metadata boundary variant 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0064 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: '', artist: 'Artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('Artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0064 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0065
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0065
     * @tc.desc   Verify metadata boundary variant 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0065 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-000', title: 'Edge Title 000', artist: 'Edge Artist 000' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Edge Title 000'));
      expect(metadata.assetId).assertEqual('asset-000');
      expect(metadata.title).assertEqual('Edge Title 000');
      expect(metadata.artist).assertEqual('Edge Artist 000');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0065 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0066
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0066
     * @tc.desc   Verify metadata boundary variant 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0066 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-long', title: 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', artist: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'));
      expect(metadata.assetId).assertEqual('asset-long');
      expect(metadata.title).assertEqual('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(metadata.artist).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0066 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0067
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0067
     * @tc.desc   Verify metadata boundary variant 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0067 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-quote', title: 'Title quoted', artist: 'Artist quoted' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title quoted'));
      expect(metadata.assetId).assertEqual('asset-quote');
      expect(metadata.title).assertEqual('Title quoted');
      expect(metadata.artist).assertEqual('Artist quoted');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0067 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0068
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0068
     * @tc.desc   Verify metadata boundary variant 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0068 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-backslash', title: 'Title backslash', artist: 'Artist slash' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title backslash'));
      expect(metadata.assetId).assertEqual('asset-backslash');
      expect(metadata.title).assertEqual('Title backslash');
      expect(metadata.artist).assertEqual('Artist slash');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0068 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0069
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0069
     * @tc.desc   Verify metadata boundary variant 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0069 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-unicode', title: 'Title unicode', artist: 'Artist unicode' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title unicode'));
      expect(metadata.assetId).assertEqual('asset-unicode');
      expect(metadata.title).assertEqual('Title unicode');
      expect(metadata.artist).assertEqual('Artist unicode');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0069 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0070
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0070
     * @tc.desc   Verify metadata boundary variant 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0070 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: '', title: '', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0070 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0071
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0071
     * @tc.desc   Verify metadata boundary variant 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0071 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: ' ', title: ' ', artist: ' ' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(' '));
      expect(metadata.assetId).assertEqual(' ');
      expect(metadata.title).assertEqual(' ');
      expect(metadata.artist).assertEqual(' ');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0071 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0072
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0072
     * @tc.desc   Verify metadata boundary variant 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0072 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-empty', title: '', artist: 'artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset-empty');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0072 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0073
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0073
     * @tc.desc   Verify metadata boundary variant 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0073 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: 'Title', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title'));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('Title');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0073 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0074
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0074
     * @tc.desc   Verify metadata boundary variant 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0074 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset', title: '', artist: 'Artist' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('asset');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('Artist');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0074 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0075
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0075
     * @tc.desc   Verify metadata boundary variant 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0075 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-000', title: 'Edge Title 000', artist: 'Edge Artist 000' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Edge Title 000'));
      expect(metadata.assetId).assertEqual('asset-000');
      expect(metadata.title).assertEqual('Edge Title 000');
      expect(metadata.artist).assertEqual('Edge Artist 000');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0075 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0076
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0076
     * @tc.desc   Verify metadata boundary variant 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0076 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-long', title: 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', artist: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'));
      expect(metadata.assetId).assertEqual('asset-long');
      expect(metadata.title).assertEqual('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(metadata.artist).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0076 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0077
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0077
     * @tc.desc   Verify metadata boundary variant 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0077 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-quote', title: 'Title quoted', artist: 'Artist quoted' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title quoted'));
      expect(metadata.assetId).assertEqual('asset-quote');
      expect(metadata.title).assertEqual('Title quoted');
      expect(metadata.artist).assertEqual('Artist quoted');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0077 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0078
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0078
     * @tc.desc   Verify metadata boundary variant 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0078 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-backslash', title: 'Title backslash', artist: 'Artist slash' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title backslash'));
      expect(metadata.assetId).assertEqual('asset-backslash');
      expect(metadata.title).assertEqual('Title backslash');
      expect(metadata.artist).assertEqual('Artist slash');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0078 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0079
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0079
     * @tc.desc   Verify metadata boundary variant 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0079 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'asset-unicode', title: 'Title unicode', artist: 'Artist unicode' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String('Title unicode'));
      expect(metadata.assetId).assertEqual('asset-unicode');
      expect(metadata.title).assertEqual('Title unicode');
      expect(metadata.artist).assertEqual('Artist unicode');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0079 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0080
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0080
     * @tc.desc   Verify metadata boundary variant 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0080 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: '', title: '', artist: '' };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(metadata.title), String(''));
      expect(metadata.assetId).assertEqual('');
      expect(metadata.title).assertEqual('');
      expect(metadata.artist).assertEqual('');
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0080 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0081
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0081
     * @tc.desc   Verify queue item boundary variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0081 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-001', title: 'Edge Queue 001' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-001');
      expect(item.description?.title).assertEqual('Edge Queue 001');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0081 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0082
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0082
     * @tc.desc   Verify queue item boundary variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0082 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-002', title: 'Edge Queue 002' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-002');
      expect(item.description?.title).assertEqual('Edge Queue 002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0082 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0083
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0083
     * @tc.desc   Verify queue item boundary variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0083 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 3, description: { assetId: 'edge-queue-003', title: 'Edge Queue 003' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 3);
      expect(item.itemId).assertEqual(3);
      expect(item.description?.assetId).assertEqual('edge-queue-003');
      expect(item.description?.title).assertEqual('Edge Queue 003');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0083 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0084
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0084
     * @tc.desc   Verify queue item boundary variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0084 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 400, description: { assetId: 'edge-queue-004', title: 'Edge Queue 004' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 400);
      expect(item.itemId).assertEqual(400);
      expect(item.description?.assetId).assertEqual('edge-queue-004');
      expect(item.description?.title).assertEqual('Edge Queue 004');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0084 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0085
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0085
     * @tc.desc   Verify queue item boundary variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0085 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-005', title: 'Edge Queue 005' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-005');
      expect(item.description?.title).assertEqual('Edge Queue 005');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0085 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0086
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0086
     * @tc.desc   Verify queue item boundary variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0086 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-006', title: 'Edge Queue 006' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-006');
      expect(item.description?.title).assertEqual('Edge Queue 006');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0086 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0087
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0087
     * @tc.desc   Verify queue item boundary variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0087 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-007', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-007');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0087 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0088
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0088
     * @tc.desc   Verify queue item boundary variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0088 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 8, description: { assetId: 'edge-queue-008', title: 'Edge Queue 008' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 8);
      expect(item.itemId).assertEqual(8);
      expect(item.description?.assetId).assertEqual('edge-queue-008');
      expect(item.description?.title).assertEqual('Edge Queue 008');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0088 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0089
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0089
     * @tc.desc   Verify queue item boundary variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0089 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 900, description: { assetId: 'edge-queue-009', title: 'Edge Queue 009' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 900);
      expect(item.itemId).assertEqual(900);
      expect(item.description?.assetId).assertEqual('edge-queue-009');
      expect(item.description?.title).assertEqual('Edge Queue 009');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0089 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0090
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0090
     * @tc.desc   Verify queue item boundary variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0090 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-010', title: 'Edge Queue 010' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-010');
      expect(item.description?.title).assertEqual('Edge Queue 010');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0090 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0091
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0091
     * @tc.desc   Verify queue item boundary variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0091 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: '', title: 'Edge Queue 011' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('');
      expect(item.description?.title).assertEqual('Edge Queue 011');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0091 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0092
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0092
     * @tc.desc   Verify queue item boundary variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0092 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-012', title: 'Edge Queue 012' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-012');
      expect(item.description?.title).assertEqual('Edge Queue 012');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0092 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0093
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0093
     * @tc.desc   Verify queue item boundary variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0093 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 13, description: { assetId: 'edge-queue-013', title: 'Edge Queue 013' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 13);
      expect(item.itemId).assertEqual(13);
      expect(item.description?.assetId).assertEqual('edge-queue-013');
      expect(item.description?.title).assertEqual('Edge Queue 013');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0093 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0094
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0094
     * @tc.desc   Verify queue item boundary variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0094 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 1400, description: { assetId: 'edge-queue-014', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 1400);
      expect(item.itemId).assertEqual(1400);
      expect(item.description?.assetId).assertEqual('edge-queue-014');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0094 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0095
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0095
     * @tc.desc   Verify queue item boundary variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0095 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-015', title: 'Edge Queue 015' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-015');
      expect(item.description?.title).assertEqual('Edge Queue 015');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0095 end');
    })
  })
}
