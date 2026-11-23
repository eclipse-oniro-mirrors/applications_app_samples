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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import Logger from '../Logger';
import { CommentData } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { mockData } from 'publishmultimediaupdate/src/main/ets/model/mockdata';
import { BUNDLE, MOCK_COUNT, MOCK_TEXTS, TAG } from '../common/TestConstant';
import { buildMoment } from '../common/DataFactory';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Snapshot and restore of the feed.
 * A feed can be flattened to JSON and rebuilt from it: that is how a session
 * would be handed to another process or cached. The cases pin that the rebuild
 * keeps the order, the media slots and the identity fields, and that a restored
 * feed is made of fresh objects rather than aliases of the snapshot source.
 */
function exportFeed(source: CommentData): string {
  let rows: Array<FriendMoment> = [];
  for (let index: number = 0; index < source.totalCount(); index++) {
    rows.push(source.getData(index));
  }
  return JSON.stringify(rows);
}
function restoreFeed(payload: string): CommentData {
  const rows: Array<FriendMoment> = JSON.parse(payload) as Array<FriendMoment>;
  const restored: CommentData = new CommentData();
  for (let index: number = 0; index < rows.length; index++) {
    restored.pushData(rows[index]);
  }
  return restored;
}
export default function feedSnapshotRestoreTest() {
  describe('FeedSnapshotRestoreTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      Logger.info(TAG, 'FeedSnapshotRestoreTest ready');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_0100
     * @tc.name SeedSnapshotHasSevenRows001
     * @tc.desc Verify seed snapshot has seven rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedSnapshotHasSevenRows_001', 0, (): void => {
      Logger.info(TAG, 'SeedSnapshotHasSevenRows_001 begin');
      const payload: string = exportFeed(mockData());
      const rows: Array<FriendMoment> = JSON.parse(payload) as Array<FriendMoment>;
      expect(rows.length).assertEqual(MOCK_COUNT);
      Logger.info(TAG, 'SeedSnapshotHasSevenRows_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_0200
     * @tc.name RestoreKeepsCount002
     * @tc.desc Verify restore keeps count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestoreKeepsCount_002', 0, (): void => {
      Logger.info(TAG, 'RestoreKeepsCount_002 begin');
      const restored: CommentData = restoreFeed(exportFeed(mockData()));
      expect(restored.totalCount()).assertEqual(MOCK_COUNT);
      Logger.info(TAG, 'RestoreKeepsCount_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_0300
     * @tc.name RestoreKeepsOrder003
     * @tc.desc Verify restore keeps order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestoreKeepsOrder_003', 0, (): void => {
      Logger.info(TAG, 'RestoreKeepsOrder_003 begin');
      const restored: CommentData = restoreFeed(exportFeed(mockData()));
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (restored.getData(index).text !== MOCK_TEXTS[index]) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'RestoreKeepsOrder_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_0400
     * @tc.name RestoreKeepsImageSlot004
     * @tc.desc Verify restore keeps image slot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestoreKeepsImageSlot_004', 0, (): void => {
      Logger.info(TAG, 'RestoreKeepsImageSlot_004 begin');
      const restored: CommentData = restoreFeed(exportFeed(mockData()));
      const first: FriendMoment = restored.getData(0);
      const hasImage: boolean = first.image !== undefined && first.image !== '';
      Logger.info(TAG, 'hasImage=' + JSON.stringify(hasImage));
      expect(hasImage).assertTrue();
      Logger.info(TAG, 'RestoreKeepsImageSlot_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_0500
     * @tc.name RestoreKeepsEmptyImage005
     * @tc.desc Verify restore keeps empty image
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestoreKeepsEmptyImage_005', 0, (): void => {
      Logger.info(TAG, 'RestoreKeepsEmptyImage_005 begin');
      const restored: CommentData = restoreFeed(exportFeed(mockData()));
      expect(restored.getData(2).image).assertEqual('');
      Logger.info(TAG, 'RestoreKeepsEmptyImage_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_0600
     * @tc.name RestoreKeepsVideoSlot006
     * @tc.desc Verify restore keeps video slot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestoreKeepsVideoSlot_006', 0, (): void => {
      Logger.info(TAG, 'RestoreKeepsVideoSlot_006 begin');
      const restored: CommentData = restoreFeed(exportFeed(mockData()));
      const row: FriendMoment = restored.getData(2);
      const hasVideo: boolean = row.video !== undefined;
      Logger.info(TAG, 'hasVideo=' + JSON.stringify(hasVideo));
      expect(hasVideo).assertTrue();
      Logger.info(TAG, 'RestoreKeepsVideoSlot_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_0700
     * @tc.name SnapshotIncludesPublishedRow007
     * @tc.desc Verify snapshot includes published row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SnapshotIncludesPublishedRow_007', 0, (): void => {
      Logger.info(TAG, 'SnapshotIncludesPublishedRow_007 begin');
      const source: CommentData = mockData();
      source.addDataFirst(buildMoment('session-row', String.fromCharCode(25105, 30340), 'session body'));
      const restored: CommentData = restoreFeed(exportFeed(source));
      expect(restored.totalCount()).assertEqual(MOCK_COUNT + 1);
      expect(restored.getData(0).text).assertEqual('session body');
      Logger.info(TAG, 'SnapshotIncludesPublishedRow_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_0800
     * @tc.name RestoreHundredRows008
     * @tc.desc Verify restore hundred rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestoreHundredRows_008', 0, (): void => {
      Logger.info(TAG, 'RestoreHundredRows_008 begin');
      const source: CommentData = new CommentData();
      for (let index: number = 0; index < 100; index++) {
        source.pushData(buildMoment('snap-' + index, 'Author', 'snap_' + index));
      }
      const restored: CommentData = restoreFeed(exportFeed(source));
      expect(restored.totalCount()).assertEqual(100);
      expect(restored.getData(99).text).assertEqual('snap_99');
      Logger.info(TAG, 'RestoreHundredRows_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_0900
     * @tc.name RestoreCreatesFreshObjects009
     * @tc.desc Verify restore creates fresh objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestoreCreatesFreshObjects_009', 0, (): void => {
      Logger.info(TAG, 'RestoreCreatesFreshObjects_009 begin');
      const source: CommentData = mockData();
      const original: FriendMoment = source.getData(0);
      const restored: CommentData = restoreFeed(exportFeed(source));
      const distinct: boolean = restored.getData(0) !== original;
      Logger.info(TAG, 'distinct=' + JSON.stringify(distinct));
      expect(distinct).assertTrue();
      restored.getData(0).text = 'edited after restore';
      expect(original.text).assertEqual(MOCK_TEXTS[0]);
      Logger.info(TAG, 'RestoreCreatesFreshObjects_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_1000
     * @tc.name EmptySnapshotRoundTrip010
     * @tc.desc Verify empty snapshot round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptySnapshotRoundTrip_010', 0, (): void => {
      Logger.info(TAG, 'EmptySnapshotRoundTrip_010 begin');
      const payload: string = exportFeed(new CommentData());
      expect(payload).assertEqual('[]');
      const restored: CommentData = restoreFeed(payload);
      expect(restored.totalCount()).assertEqual(0);
      Logger.info(TAG, 'EmptySnapshotRoundTrip_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_1100
     * @tc.name RestoreKeepsIds011
     * @tc.desc Verify restore keeps ids
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestoreKeepsIds_011', 0, (): void => {
      Logger.info(TAG, 'RestoreKeepsIds_011 begin');
      const restored: CommentData = restoreFeed(exportFeed(mockData()));
      expect(restored.getData(0).id).assertEqual('0');
      expect(restored.getData(6).id).assertEqual('6');
      Logger.info(TAG, 'RestoreKeepsIds_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SNAPSHOT_1200
     * @tc.name DoubleRoundTripStable012
     * @tc.desc Verify double round trip stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DoubleRoundTripStable_012', 0, (): void => {
      Logger.info(TAG, 'DoubleRoundTripStable_012 begin');
      const first: string = exportFeed(mockData());
      const second: string = exportFeed(restoreFeed(first));
      expect(second).assertEqual(first);
      Logger.info(TAG, 'DoubleRoundTripStable_012 end');
    });
  });
}
