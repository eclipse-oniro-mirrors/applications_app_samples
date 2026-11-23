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
import { CommentData, FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { mockData } from 'publishmultimediaupdate/src/main/ets/model/mockdata';
import { BUNDLE, MOCK_COUNT, MOCK_TEXTS, TAG } from '../common/TestConstant';
import { buildMoment } from '../common/DataFactory';
import { RecordingListener } from '../common/RecordingListener';
/**
 * Feed session restart.
 * The page rebuilds its data source in aboutToAppear, so a restart yields the
 * seed set again and drops everything published in the previous session. These
 * cases pin that isolation: nothing is persisted, nothing leaks between two
 * CommentData instances, and a listener attached after a restart starts empty.
 */
class Session {
  public feed: CommentData;
  constructor() {
    this.feed = mockData();
  }
  publish(body: string): FriendMoment {
    const moment: FriendMoment = buildMoment('session-' + body, String.fromCharCode(25105, 30340), body);
    this.feed.addDataFirst(moment);
    return moment;
  }
}
export default function feedSessionRestartTest() {
  describe('FeedSessionRestartTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_0100
     * @tc.name RestartRestoresSeedCount001
     * @tc.desc Verify restart restores seed count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestartRestoresSeedCount_001', 0, (): void => {
      Logger.info(TAG, 'RestartRestoresSeedCount_001 begin');
      const first: Session = new Session();
      first.publish('restart_body_0100');
      const second: Session = new Session();
      expect(second.feed.totalCount()).assertEqual(MOCK_COUNT);
      Logger.info(TAG, 'RestartRestoresSeedCount_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_0200
     * @tc.name PublishedRowNotInNewSession002
     * @tc.desc Verify published row not in new session
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishedRowNotInNewSession_002', 0, (): void => {
      Logger.info(TAG, 'PublishedRowNotInNewSession_002 begin');
      const first: Session = new Session();
      first.publish('unique_restart_body_0200');
      const second: Session = new Session();
      let found: boolean = false;
      for (let index: number = 0; index < second.feed.totalCount(); index++) {
        if (second.feed.getData(index).text === 'unique_restart_body_0200') {
          found = true;
        }
      }
      expect(found).assertFalse();
      Logger.info(TAG, 'PublishedRowNotInNewSession_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_0300
     * @tc.name SeedObjectsAreFreshInstances003
     * @tc.desc Verify seed objects are fresh instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedObjectsAreFreshInstances_003', 0, (): void => {
      Logger.info(TAG, 'SeedObjectsAreFreshInstances_003 begin');
      const first: Session = new Session();
      const second: Session = new Session();
      const distinct: boolean = first.feed.getData(0) !== second.feed.getData(0);
      Logger.info(TAG, 'distinct=' + JSON.stringify(distinct));
      expect(distinct).assertTrue();
      first.feed.getData(0).text = 'edited in first session';
      expect(second.feed.getData(0).text).assertEqual(MOCK_TEXTS[0]);
      Logger.info(TAG, 'SeedObjectsAreFreshInstances_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_0400
     * @tc.name PublishInOneSessionLeavesOther004
     * @tc.desc Verify publish in one session leaves other
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishInOneSessionLeavesOther_004', 0, (): void => {
      Logger.info(TAG, 'PublishInOneSessionLeavesOther_004 begin');
      const left: Session = new Session();
      const right: Session = new Session();
      left.publish('left_only_0400');
      expect(right.feed.totalCount()).assertEqual(MOCK_COUNT);
      expect(right.feed.getData(0).text).assertEqual(MOCK_TEXTS[0]);
      Logger.info(TAG, 'PublishInOneSessionLeavesOther_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_0500
     * @tc.name SeedOrderIdenticalAcrossSessions005
     * @tc.desc Verify seed order identical across sessions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedOrderIdenticalAcrossSessions_005', 0, (): void => {
      Logger.info(TAG, 'SeedOrderIdenticalAcrossSessions_005 begin');
      const first: Session = new Session();
      const second: Session = new Session();
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (first.feed.getData(index).text !== second.feed.getData(index).text) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'SeedOrderIdenticalAcrossSessions_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_0600
     * @tc.name SeedIdsRepeatAcrossSessions006
     * @tc.desc Verify seed ids repeat across sessions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedIdsRepeatAcrossSessions_006', 0, (): void => {
      Logger.info(TAG, 'SeedIdsRepeatAcrossSessions_006 begin');
      const first: Session = new Session();
      const second: Session = new Session();
      expect(first.feed.getData(0).id).assertEqual(second.feed.getData(0).id);
      Logger.info(TAG, 'SeedIdsRepeatAcrossSessions_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_0700
     * @tc.name LateListenerStartsSilent007
     * @tc.desc Verify late listener starts silent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LateListenerStartsSilent_007', 0, (): void => {
      Logger.info(TAG, 'LateListenerStartsSilent_007 begin');
      const session: Session = new Session();
      const listener: RecordingListener = new RecordingListener('restart');
      session.feed.registerDataChangeListener(listener);
      const silent: boolean = listener.isSilent();
      Logger.info(TAG, 'silent=' + JSON.stringify(silent));
      expect(silent).assertTrue();
      Logger.info(TAG, 'LateListenerStartsSilent_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_0800
     * @tc.name LateListenerSeesOnlyNewRows008
     * @tc.desc Verify late listener sees only new rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LateListenerSeesOnlyNewRows_008', 0, (): void => {
      Logger.info(TAG, 'LateListenerSeesOnlyNewRows_008 begin');
      const session: Session = new Session();
      const listener: RecordingListener = new RecordingListener('restart');
      session.feed.registerDataChangeListener(listener);
      session.publish('after_restart_0800');
      expect(listener.eventCount()).assertEqual(1);
      expect(listener.indexAt(0)).assertEqual(0);
      Logger.info(TAG, 'LateListenerSeesOnlyNewRows_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_0900
     * @tc.name HeadAfterRestartIsFirstSeed009
     * @tc.desc Verify head after restart is first seed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HeadAfterRestartIsFirstSeed_009', 0, (): void => {
      Logger.info(TAG, 'HeadAfterRestartIsFirstSeed_009 begin');
      const previous: Session = new Session();
      previous.publish('previous_head_0900');
      const current: Session = new Session();
      expect(current.feed.getData(0).text).assertEqual(MOCK_TEXTS[0]);
      Logger.info(TAG, 'HeadAfterRestartIsFirstSeed_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_1000
     * @tc.name ThreeSessionsIndependent010
     * @tc.desc Verify three sessions independent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThreeSessionsIndependent_010', 0, (): void => {
      Logger.info(TAG, 'ThreeSessionsIndependent_010 begin');
      const first: Session = new Session();
      const second: Session = new Session();
      const third: Session = new Session();
      first.publish('s1_1000');
      first.publish('s1_1001');
      second.publish('s2_1000');
      third.publish('s3_1000');
      third.publish('s3_1001');
      third.publish('s3_1002');
      expect(first.feed.totalCount()).assertEqual(MOCK_COUNT + 2);
      expect(second.feed.totalCount()).assertEqual(MOCK_COUNT + 1);
      expect(third.feed.totalCount()).assertEqual(MOCK_COUNT + 3);
      Logger.info(TAG, 'ThreeSessionsIndependent_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_1100
     * @tc.name PublishedOrderInsideSession011
     * @tc.desc Verify published order inside session
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishedOrderInsideSession_011', 0, (): void => {
      Logger.info(TAG, 'PublishedOrderInsideSession_011 begin');
      const session: Session = new Session();
      session.publish('first_publish_1100');
      session.publish('second_publish_1100');
      session.publish('third_publish_1100');
      expect(session.feed.getData(0).text).assertEqual('third_publish_1100');
      expect(session.feed.getData(2).text).assertEqual('first_publish_1100');
      Logger.info(TAG, 'PublishedOrderInsideSession_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_1200
     * @tc.name RestartDropsCountNotSeedCount012
     * @tc.desc Verify restart drops count not seed count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestartDropsCountNotSeedCount_012', 0, (): void => {
      Logger.info(TAG, 'RestartDropsCountNotSeedCount_012 begin');
      const previous: Session = new Session();
      for (let index: number = 0; index < 10; index++) {
        previous.publish('bulk_restart_' + index);
      }
      const current: Session = new Session();
      const restored: boolean = current.feed.totalCount() === MOCK_COUNT;
      Logger.info(TAG, 'restored=' + JSON.stringify(restored));
      expect(restored).assertTrue();
      Logger.info(TAG, 'RestartDropsCountNotSeedCount_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_1300
     * @tc.name ListenerNotSharedAcrossSessions013
     * @tc.desc Verify listener not shared across sessions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListenerNotSharedAcrossSessions_013', 0, (): void => {
      Logger.info(TAG, 'ListenerNotSharedAcrossSessions_013 begin');
      const previous: Session = new Session();
      const listener: RecordingListener = new RecordingListener('previous');
      previous.feed.registerDataChangeListener(listener);
      const current: Session = new Session();
      current.publish('current_only_1300');
      const silent: boolean = listener.isSilent();
      Logger.info(TAG, 'silent=' + JSON.stringify(silent));
      expect(silent).assertTrue();
      Logger.info(TAG, 'ListenerNotSharedAcrossSessions_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_1400
     * @tc.name SeedTextsMatchAfterRestart014
     * @tc.desc Verify seed texts match after restart
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedTextsMatchAfterRestart_014', 0, (): void => {
      Logger.info(TAG, 'SeedTextsMatchAfterRestart_014 begin');
      const current: Session = new Session();
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (current.feed.getData(index).text !== MOCK_TEXTS[index]) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'SeedTextsMatchAfterRestart_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_RESTART_1500
     * @tc.name RestartAfterMutationRestoresSeeds015
     * @tc.desc Verify restart after mutation restores seeds
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RestartAfterMutationRestoresSeeds_015', 0, (): void => {
      Logger.info(TAG, 'RestartAfterMutationRestoresSeeds_015 begin');
      const previous: Session = new Session();
      previous.feed.getData(1).text = 'mutated_1500';
      previous.feed.addDataFirst(buildMoment('mutated-row', String.fromCharCode(25105, 30340), 'mutated body'));
      const current: Session = new Session();
      expect(current.feed.getData(1).text).assertEqual(MOCK_TEXTS[1]);
      expect(current.feed.totalCount()).assertEqual(MOCK_COUNT);
      Logger.info(TAG, 'RestartAfterMutationRestoresSeeds_015 end');
    });
  });
}
