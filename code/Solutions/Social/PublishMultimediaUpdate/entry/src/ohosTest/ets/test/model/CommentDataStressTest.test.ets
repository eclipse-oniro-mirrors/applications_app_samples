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
import { yieldToEventLoop } from '../common/TestYield';
import Logger from '../Logger';
import { CommentData } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { BUNDLE, TAG } from '../common/TestConstant';
import { buildMoment, buildMoments } from '../common/DataFactory';
import { RecordingListener } from '../common/RecordingListener';
/**
 * Bulk behaviour of the comment source.
 * The page keeps a long feed in memory, therefore every bulk property of the
 * collection - count, head and tail position, notification volume and index
 * arithmetic after many inserts - is verified at the size the list actually
 * reaches during a session rather than only at three rows.
 */
export default function commentDataStressTest() {
  describe('CommentDataStressTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_0100
     * @tc.name ThousandPushesCount001
     * @tc.desc Verify thousand pushes count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThousandPushesCount_001', 0, (): void => {
      Logger.info(TAG, 'ThousandPushesCount_001 begin');
      const source: CommentData = new CommentData();
      for (let index: number = 0; index < 1000; index++) {
        source.pushData(buildMoment('bulk-' + index, 'Author', 'body_' + index));
      }
      expect(source.totalCount()).assertEqual(1000);
      Logger.info(TAG, 'ThousandPushesCount_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_0200
     * @tc.name ThousandPushesKeepOrder002
     * @tc.desc Verify thousand pushes keep order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThousandPushesKeepOrder_002', 0, (): void => {
      Logger.info(TAG, 'ThousandPushesKeepOrder_002 begin');
      const source: CommentData = new CommentData();
      for (let index: number = 0; index < 1000; index++) {
        source.pushData(buildMoment('bulk-' + index, 'Author', 'body_' + index));
      }
      expect(source.getData(0).text).assertEqual('body_0');
      expect(source.getData(999).text).assertEqual('body_999');
      Logger.info(TAG, 'ThousandPushesKeepOrder_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_0300
     * @tc.name ThousandAddFirstReverses003
     * @tc.desc Verify thousand add first reverses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThousandAddFirstReverses_003', 0, (): void => {
      Logger.info(TAG, 'ThousandAddFirstReverses_003 begin');
      const source: CommentData = new CommentData();
      for (let index: number = 0; index < 1000; index++) {
        source.addDataFirst(buildMoment('front-' + index, 'Author', 'front_' + index));
      }
      expect(source.totalCount()).assertEqual(1000);
      expect(source.getData(0).text).assertEqual('front_999');
      expect(source.getData(999).text).assertEqual('front_0');
      Logger.info(TAG, 'ThousandAddFirstReverses_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_0400
     * @tc.name MixedBulkPreservesProgram004
     * @tc.desc Verify mixed bulk preserves program
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MixedBulkPreservesProgram_004', 0, (): void => {
      Logger.info(TAG, 'MixedBulkPreservesProgram_004 begin');
      const source: CommentData = new CommentData();
      for (let index: number = 0; index < 500; index++) {
        source.pushData(buildMoment('tail-' + index, 'Author', 'tail_' + index));
        source.addDataFirst(buildMoment('head-' + index, 'Author', 'head_' + index));
      }
      expect(source.totalCount()).assertEqual(1000);
      expect(source.getData(0).text).assertEqual('head_499');
      expect(source.getData(999).text).assertEqual('tail_499');
      Logger.info(TAG, 'MixedBulkPreservesProgram_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_0500
     * @tc.name ThousandNotificationsDelivered005
     * @tc.desc Verify thousand notifications delivered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThousandNotificationsDelivered_005', 0, (): void => {
      Logger.info(TAG, 'ThousandNotificationsDelivered_005 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('bulk');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 1000; index++) {
        source.pushData(buildMoment('notify-' + index, 'Author', 'notify_' + index));
      }
      expect(listener.eventCount()).assertEqual(1000);
      Logger.info(TAG, 'ThousandNotificationsDelivered_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_0600
     * @tc.name LastNotificationIndexIsLast006
     * @tc.desc Verify last notification index is last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LastNotificationIndexIsLast_006', 0, (): void => {
      Logger.info(TAG, 'LastNotificationIndexIsLast_006 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('tail');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 1000; index++) {
        source.pushData(buildMoment('tail-' + index, 'Author', 'tail_' + index));
      }
      expect(listener.indexAt(999)).assertEqual(999);
      expect(listener.indexAt(0)).assertEqual(0);
      Logger.info(TAG, 'LastNotificationIndexIsLast_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_0700
     * @tc.name SamplingAcrossThousand007
     * @tc.desc Verify sampling across thousand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SamplingAcrossThousand_007', 0, (): void => {
      Logger.info(TAG, 'SamplingAcrossThousand_007 begin');
      const source: CommentData = new CommentData();
      for (let index: number = 0; index < 1000; index++) {
        source.pushData(buildMoment('sample-' + index, 'Author', 'sample_' + index));
      }
      const probes: Array<number> = [0, 1, 10, 100, 500, 998, 999];
      let mismatched: number = 0;
      for (let position: number = 0; position < probes.length; position++) {
        const probe: number = probes[position];
        if (source.getData(probe).text !== 'sample_' + probe) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'SamplingAcrossThousand_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_0800
     * @tc.name AddFirstNotificationAlwaysZero008
     * @tc.desc Verify add first notification always zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstNotificationAlwaysZero_008', 0, (): void => {
      Logger.info(TAG, 'AddFirstNotificationAlwaysZero_008 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('front');
      source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 200; index++) {
        source.addDataFirst(buildMoment('front-' + index, 'Author', 'front_' + index));
      }
      let nonZero: number = 0;
      for (let position: number = 0; position < listener.eventCount(); position++) {
        if (listener.indexAt(position) !== 0) {
          nonZero += 1;
        }
      }
      expect(nonZero).assertEqual(0);
      Logger.info(TAG, 'AddFirstNotificationAlwaysZero_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_0900
     * @tc.name UniqueIdsAcrossThousand009
     * @tc.desc Verify unique ids across thousand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UniqueIdsAcrossThousand_009', 0, (): void => {
      Logger.info(TAG, 'UniqueIdsAcrossThousand_009 begin');
      const rows: Array<FriendMoment> = buildMoments(1000, 'unique_');
      const seen: Set<string> = new Set<string>();
      for (let index: number = 0; index < rows.length; index++) {
        seen.add(rows[index].id);
      }
      expect(seen.size).assertEqual(rows.length);
      Logger.info(TAG, 'UniqueIdsAcrossThousand_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_1000
     * @tc.name CountMonotonicUnderGrowth010
     * @tc.desc Verify count monotonic under growth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountMonotonicUnderGrowth_010', 0, (): void => {
      Logger.info(TAG, 'CountMonotonicUnderGrowth_010 begin');
      const source: CommentData = new CommentData();
      let violations: number = 0;
      for (let index: number = 0; index < 300; index++) {
        const before: number = source.totalCount();
        source.pushData(buildMoment('grow-' + index, 'Author', 'grow_' + index));
        if (source.totalCount() !== before + 1) {
          violations += 1;
        }
      }
      expect(violations).assertEqual(0);
      Logger.info(TAG, 'CountMonotonicUnderGrowth_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_1100
     * @tc.name ThousandRowsNoThrow011
     * @tc.desc Verify thousand rows no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThousandRowsNoThrow_011', 0, (): void => {
      Logger.info(TAG, 'ThousandRowsNoThrow_011 begin');
      let threw: boolean = false;
      const source: CommentData = new CommentData();
      try {
        for (let index: number = 0; index < 1000; index++) {
          source.pushData(buildMoment('safe-' + index, 'Author', 'safe_' + index));
        }
        source.getData(500);
        source.totalCount();
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'ThousandRowsNoThrow_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_1200
     * @tc.name RepeatedBulkRunsIndependent012
     * @tc.desc Verify repeated bulk runs independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedBulkRunsIndependent_012', 0, (): void => {
      Logger.info(TAG, 'RepeatedBulkRunsIndependent_012 begin');
      let counts: Array<number> = [];
      for (let round: number = 0; round < 3; round++) {
        const source: CommentData = new CommentData();
        for (let index: number = 0; index < 300; index++) {
          source.pushData(buildMoment('round' + round + '-' + index, 'Author', 'round_' + index));
        }
        counts.push(source.totalCount());
      }
      expect(counts[0]).assertEqual(300);
      expect(counts[1]).assertEqual(300);
      expect(counts[2]).assertEqual(300);
      Logger.info(TAG, 'RepeatedBulkRunsIndependent_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_1300
     * @tc.name HeadAfterBulkPushIsFirst013
     * @tc.desc Verify head after bulk push is first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HeadAfterBulkPushIsFirst_013', 0, (): void => {
      Logger.info(TAG, 'HeadAfterBulkPushIsFirst_013 begin');
      const source: CommentData = new CommentData();
      const first: FriendMoment = buildMoment('first-row', 'Author', 'first_row');
      source.pushData(first);
      for (let index: number = 0; index < 500; index++) {
        source.pushData(buildMoment('after-' + index, 'Author', 'after_' + index));
      }
      const check01: boolean = source.getData(0) === first;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'HeadAfterBulkPushIsFirst_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_1400
     * @tc.name TailAfterBulkAddFirst014
     * @tc.desc Verify tail after bulk add first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TailAfterBulkAddFirst_014', 0, (): void => {
      Logger.info(TAG, 'TailAfterBulkAddFirst_014 begin');
      const source: CommentData = new CommentData();
      const last: FriendMoment = buildMoment('last-row', 'Author', 'last_row');
      source.pushData(last);
      for (let index: number = 0; index < 500; index++) {
        source.addDataFirst(buildMoment('front-' + index, 'Author', 'front_' + index));
      }
      const check01: boolean = source.getData(source.totalCount() - 1) === last;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'TailAfterBulkAddFirst_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_STRESS_1500
     * @tc.name BulkSameInstanceRows015
     * @tc.desc Verify bulk same instance rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BulkSameInstanceRows_015', 0, (): void => {
      Logger.info(TAG, 'BulkSameInstanceRows_015 begin');
      const source: CommentData = new CommentData();
      const shared: FriendMoment = buildMoment('shared', 'Author', 'shared_body');
      for (let index: number = 0; index < 100; index++) {
        source.pushData(shared);
      }
      expect(source.totalCount()).assertEqual(100);
      const sameRef: boolean = source.getData(0) === source.getData(99);
      Logger.info(TAG, 'sameRef=' + JSON.stringify(sameRef));
      expect(sameRef).assertTrue();
      Logger.info(TAG, 'BulkSameInstanceRows_015 end');
    });
  });
}
