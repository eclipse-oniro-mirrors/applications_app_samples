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
import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { CommentData } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { mockData } from 'publishmultimediaupdate/src/main/ets/model/mockdata';
import { BUNDLE, MOCK_COUNT, TAG, TYPE_IMAGE, TYPE_TEXT, TYPE_VIDEO } from '../common/TestConstant';
import { RecordingListener } from '../common/RecordingListener';
const OWNER: string = String.fromCharCode(25105, 30340);
const OWNER_AVATAR: string = 'owner_avatar_uri';
/**
 * Publish session on top of the seed data.
 * The page composes a FriendMoment from the dialog links and prepends it with
 * addDataFirst; these cases exercise that exact data shape against the real
 * data source so a regression in the model is caught without the picker.
 */
class SessionBuilder {
  public source: CommentData;
  constructor() {
    this.source = mockData();
  }
  /**
   * Mirrors the text branch of publishComment.
   */
  publishText(stamp: string, body: string): FriendMoment {
    const moment: FriendMoment = new FriendMoment(stamp, OWNER, OWNER_AVATAR, body);
    this.source.addDataFirst(moment);
    return moment;
  }
  /**
   * Mirrors the image branch of publishComment.
   */
  publishImage(stamp: string, body: string, image: string): FriendMoment {
    const moment: FriendMoment = new FriendMoment(stamp, OWNER, OWNER_AVATAR, body, image);
    this.source.addDataFirst(moment);
    return moment;
  }
  /**
   * Mirrors the video branch of publishComment.
   */
  publishVideo(stamp: string, body: string, video: string): FriendMoment {
    const moment: FriendMoment = new FriendMoment(stamp, OWNER, OWNER_AVATAR, body, '', video);
    this.source.addDataFirst(moment);
    return moment;
  }
}
export default function publishSessionTest() {
  describe('PublishSessionTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_0100
     * @tc.name SessionStartsFromSeed001
     * @tc.desc Verify session starts from seed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SessionStartsFromSeed_001', 0, (): void => {
      Logger.info(TAG, 'SessionStartsFromSeed_001 begin');
      const session: SessionBuilder = new SessionBuilder();
      expect(session.source.totalCount()).assertEqual(MOCK_COUNT);
      Logger.info(TAG, 'SessionStartsFromSeed_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_0200
     * @tc.name TextPublishGrowsCount002
     * @tc.desc Verify text publish grows count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextPublishGrowsCount_002', 0, (): void => {
      Logger.info(TAG, 'TextPublishGrowsCount_002 begin');
      const session: SessionBuilder = new SessionBuilder();
      session.publishText('2026-11-20 09:00:00', 'first text');
      expect(session.source.totalCount()).assertEqual(MOCK_COUNT + 1);
      Logger.info(TAG, 'TextPublishGrowsCount_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_0300
     * @tc.name TextPublishAtHead003
     * @tc.desc Verify text publish at head
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextPublishAtHead_003', 0, (): void => {
      Logger.info(TAG, 'TextPublishAtHead_003 begin');
      const session: SessionBuilder = new SessionBuilder();
      const published: FriendMoment = session.publishText('2026-11-20 09:00:01', 'head text');
      const check01: boolean = session.source.getData(0) === published;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'TextPublishAtHead_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_0400
     * @tc.name SeedShiftedByOne004
     * @tc.desc Verify seed shifted by one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedShiftedByOne_004', 0, (): void => {
      Logger.info(TAG, 'SeedShiftedByOne_004 begin');
      const session: SessionBuilder = new SessionBuilder();
      const seed: FriendMoment = session.source.getData(0);
      session.publishText('2026-11-20 09:00:02', 'shift text');
      const check01: boolean = session.source.getData(1) === seed;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'SeedShiftedByOne_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_0500
     * @tc.name PublishedTextMatchesInput005
     * @tc.desc Verify published text matches input
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishedTextMatchesInput_005', 0, (): void => {
      Logger.info(TAG, 'PublishedTextMatchesInput_005 begin');
      const session: SessionBuilder = new SessionBuilder();
      session.publishText('2026-11-20 09:00:03', 'exact body');
      expect(session.source.getData(0).text).assertEqual('exact body');
      Logger.info(TAG, 'PublishedTextMatchesInput_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_0600
     * @tc.name PublishedOwnerIsMine006
     * @tc.desc Verify published owner is mine
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishedOwnerIsMine_006', 0, (): void => {
      Logger.info(TAG, 'PublishedOwnerIsMine_006 begin');
      const session: SessionBuilder = new SessionBuilder();
      session.publishText('2026-11-20 09:00:04', 'owner text');
      expect(session.source.getData(0).userName).assertEqual(OWNER);
      Logger.info(TAG, 'PublishedOwnerIsMine_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_0700
     * @tc.name TextPublishHasNoMedia007
     * @tc.desc Verify text publish has no media
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextPublishHasNoMedia_007', 0, (): void => {
      Logger.info(TAG, 'TextPublishHasNoMedia_007 begin');
      const session: SessionBuilder = new SessionBuilder();
      const published: FriendMoment = session.publishText('2026-11-20 09:00:05', 'plain');
      expect(published.image).assertUndefined();
      expect(published.video).assertUndefined();
      Logger.info(TAG, 'TextPublishHasNoMedia_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_0800
     * @tc.name ImagePublishCarriesImage008
     * @tc.desc Verify image publish carries image
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImagePublishCarriesImage_008', 0, (): void => {
      Logger.info(TAG, 'ImagePublishCarriesImage_008 begin');
      const session: SessionBuilder = new SessionBuilder();
      const published: FriendMoment = session.publishImage('2026-11-20 09:00:06', 'photo', 'file://album/1.jpg');
      expect(published.image).assertEqual('file://album/1.jpg');
      expect(published.video).assertUndefined();
      Logger.info(TAG, 'ImagePublishCarriesImage_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_0900
     * @tc.name VideoPublishCarriesVideo009
     * @tc.desc Verify video publish carries video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoPublishCarriesVideo_009', 0, (): void => {
      Logger.info(TAG, 'VideoPublishCarriesVideo_009 begin');
      const session: SessionBuilder = new SessionBuilder();
      const published: FriendMoment = session.publishVideo('2026-11-20 09:00:07', 'clip', 'file://album/1.mp4');
      expect(published.video).assertEqual('file://album/1.mp4');
      expect(published.image).assertEqual('');
      Logger.info(TAG, 'VideoPublishCarriesVideo_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1000
     * @tc.name LatestPublishWinsTop010
     * @tc.desc Verify latest publish wins top
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LatestPublishWinsTop_010', 0, (): void => {
      Logger.info(TAG, 'LatestPublishWinsTop_010 begin');
      const session: SessionBuilder = new SessionBuilder();
      session.publishText('2026-11-20 09:01:00', 'oldest');
      session.publishText('2026-11-20 09:01:01', 'middle');
      session.publishText('2026-11-20 09:01:02', 'newest');
      expect(session.source.getData(0).text).assertEqual('newest');
      expect(session.source.getData(1).text).assertEqual('middle');
      expect(session.source.getData(2).text).assertEqual('oldest');
      Logger.info(TAG, 'LatestPublishWinsTop_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1100
     * @tc.name ThreeTypesInterleaved011
     * @tc.desc Verify three types interleaved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThreeTypesInterleaved_011', 0, (): void => {
      Logger.info(TAG, 'ThreeTypesInterleaved_011 begin');
      const session: SessionBuilder = new SessionBuilder();
      session.publishText('2026-11-20 09:02:00', 't1');
      session.publishImage('2026-11-20 09:02:01', 'i1', 'file://album/2.jpg');
      session.publishVideo('2026-11-20 09:02:02', 'v1', 'file://album/2.mp4');
      expect(session.source.getData(0).text).assertEqual('v1');
      expect(session.source.getData(1).text).assertEqual('i1');
      expect(session.source.getData(2).text).assertEqual('t1');
      const check01: boolean = session.source.getData(1).video === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ThreeTypesInterleaved_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1200
     * @tc.name PublishNotifiesHeadIndex012
     * @tc.desc Verify publish notifies head index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishNotifiesHeadIndex_012', 0, (): void => {
      Logger.info(TAG, 'PublishNotifiesHeadIndex_012 begin');
      const session: SessionBuilder = new SessionBuilder();
      const listener: RecordingListener = new RecordingListener('refresh');
      session.source.registerDataChangeListener(listener);
      session.publishText('2026-11-20 09:03:00', 'notify');
      expect(listener.eventCount()).assertEqual(1);
      expect(listener.kindSequence()).assertEqual('add');
      expect(listener.indexAt(0)).assertEqual(0);
      Logger.info(TAG, 'PublishNotifiesHeadIndex_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1300
     * @tc.name SeedListenerSilentBeforePublish013
     * @tc.desc Verify seed listener silent before publish
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedListenerSilentBeforePublish_013', 0, (): void => {
      Logger.info(TAG, 'SeedListenerSilentBeforePublish_013 begin');
      const source: CommentData = mockData();
      const listener: RecordingListener = new RecordingListener('late');
      source.registerDataChangeListener(listener);
      const check01: boolean = listener.isSilent() === true;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'SeedListenerSilentBeforePublish_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1400
     * @tc.name TenPublishesCount014
     * @tc.desc Verify ten publishes count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TenPublishesCount_014', 0, (): void => {
      Logger.info(TAG, 'TenPublishesCount_014 begin');
      const session: SessionBuilder = new SessionBuilder();
      for (let index: number = 0; index < 10; index++) {
        session.publishText('2026-11-20 09:04:' + index, 'bulk_' + index);
      }
      expect(session.source.totalCount()).assertEqual(MOCK_COUNT + 10);
      expect(session.source.getData(0).text).assertEqual('bulk_9');
      Logger.info(TAG, 'TenPublishesCount_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1500
     * @tc.name TenPublishesTenNotifications015
     * @tc.desc Verify ten publishes ten notifications
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TenPublishesTenNotifications_015', 0, (): void => {
      Logger.info(TAG, 'TenPublishesTenNotifications_015 begin');
      const session: SessionBuilder = new SessionBuilder();
      const listener: RecordingListener = new RecordingListener('bulk');
      session.source.registerDataChangeListener(listener);
      for (let index: number = 0; index < 10; index++) {
        session.publishText('2026-11-20 09:05:' + index, 'many_' + index);
      }
      expect(listener.eventCount()).assertEqual(10);
      let nonZero: number = 0;
      for (let index: number = 0; index < listener.eventCount(); index++) {
        if (listener.indexAt(index) !== 0) {
          nonZero += 1;
        }
      }
      expect(nonZero).assertEqual(0);
      Logger.info(TAG, 'TenPublishesTenNotifications_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1600
     * @tc.name DialogTypeConstantsDistinct016
     * @tc.desc Verify dialog type constants distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DialogTypeConstantsDistinct_016', 0, (): void => {
      Logger.info(TAG, 'DialogTypeConstantsDistinct_016 begin');
      const check01: boolean = TYPE_TEXT !== TYPE_IMAGE;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = TYPE_IMAGE !== TYPE_VIDEO;
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = TYPE_TEXT !== TYPE_VIDEO;
      Logger.info(TAG, 'check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'DialogTypeConstantsDistinct_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1700
     * @tc.name PublishKeepsSeedMedia017
     * @tc.desc Verify publish keeps seed media
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishKeepsSeedMedia_017', 0, (): void => {
      Logger.info(TAG, 'PublishKeepsSeedMedia_017 begin');
      const session: SessionBuilder = new SessionBuilder();
      const videoSeed: FriendMoment = session.source.getData(2);
      session.publishText('2026-11-20 09:06:00', 'keep');
      const check01: boolean = session.source.getData(3) === videoSeed;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = session.source.getData(3).video === videoSeed.video;
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'PublishKeepsSeedMedia_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1800
     * @tc.name EmptyTextRowCounted018
     * @tc.desc Verify a captionless row still counts as one entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextRowCounted_018', 0, (): void => {
      Logger.info(TAG, 'EmptyTextRowCounted_018 begin');
      const session: SessionBuilder = new SessionBuilder();
      session.publishText('2026-11-20 10:00:00', '');
      expect(session.source.totalCount()).assertEqual(MOCK_COUNT + 1);
      const row: FriendMoment = session.source.getData(0);
      expect(row.text).assertEqual('');
      expect(row.userName).assertEqual(OWNER);
      expect(row.image).assertUndefined();
      Logger.info(TAG, 'EmptyTextRowCounted_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_1900
     * @tc.name SnapshotOmitsMediaForText019
     * @tc.desc Verify a text row snapshot carries no image or video field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SnapshotOmitsMediaForText_019', 0, (): void => {
      Logger.info(TAG, 'SnapshotOmitsMediaForText_019 begin');
      const session: SessionBuilder = new SessionBuilder();
      session.publishText('2026-11-20 10:00:04', 'plain');
      const payload: string = JSON.stringify(session.source.getData(0));
      expect(payload.indexOf('"image"') === -1).assertTrue();
      expect(payload.indexOf('"video"') === -1).assertTrue();
      Logger.info(TAG, 'SnapshotOmitsMediaForText_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_2000
     * @tc.name SnapshotKeepsEmptyImage020
     * @tc.desc Verify a video row snapshot keeps an empty image value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SnapshotKeepsEmptyImage_020', 0, (): void => {
      Logger.info(TAG, 'SnapshotKeepsEmptyImage_020 begin');
      const session: SessionBuilder = new SessionBuilder();
      session.publishVideo('2026-11-20 10:00:05', 'clip', 'file://clip.mp4');
      const payload: string = JSON.stringify(session.source.getData(0));
      expect(payload).assertContain('"image":""');
      expect(payload).assertContain('"video":"file://clip.mp4"');
      Logger.info(TAG, 'SnapshotKeepsEmptyImage_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_2100
     * @tc.name SnapshotArrayLength021
     * @tc.desc Verify the snapshot array length equals the entry count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SnapshotArrayLength_021', 0, (): void => {
      Logger.info(TAG, 'SnapshotArrayLength_021 begin');
      const session: SessionBuilder = new SessionBuilder();
      const rows: Array<FriendMoment> = JSON.parse(JSON.stringify([session.source.getData(0)])) as Array<FriendMoment>;
      expect(rows.length).assertEqual(1);
      Logger.info(TAG, 'SnapshotArrayLength_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_2200
     * @tc.name WalkEveryIndexDefined022
     * @tc.desc Verify every index of the feed returns a defined row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WalkEveryIndexDefined_022', 0, (): void => {
      Logger.info(TAG, 'WalkEveryIndexDefined_022 begin');
      const session: SessionBuilder = new SessionBuilder();
      let undefinedRows: number = 0;
      for (let index: number = 0; index < session.source.totalCount(); index++) {
        if (session.source.getData(index) === undefined) {
          undefinedRows += 1;
        }
      }
      expect(undefinedRows).assertEqual(0);
      Logger.info(TAG, 'WalkEveryIndexDefined_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_2300
     * @tc.name NegativeIndexUndefined023
     * @tc.desc Verify a negative index is outside the feed range
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NegativeIndexUndefined_023', 0, (): void => {
      Logger.info(TAG, 'NegativeIndexUndefined_023 begin');
      const session: SessionBuilder = new SessionBuilder();
      expect(session.source.getData(-1)).assertUndefined();
      Logger.info(TAG, 'NegativeIndexUndefined_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_2400
     * @tc.name CountIndexUndefined024
     * @tc.desc Verify the index equal to the count is outside the feed range
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountIndexUndefined_024', 0, (): void => {
      Logger.info(TAG, 'CountIndexUndefined_024 begin');
      const session: SessionBuilder = new SessionBuilder();
      expect(session.source.getData(session.source.totalCount())).assertUndefined();
      Logger.info(TAG, 'CountIndexUndefined_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_2500
     * @tc.name PublishShiftsEveryIndex025
     * @tc.desc Verify a publication moves every existing row one position back
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishShiftsEveryIndex_025', 0, (): void => {
      Logger.info(TAG, 'PublishShiftsEveryIndex_025 begin');
      const session: SessionBuilder = new SessionBuilder();
      const firstSeed: FriendMoment = session.source.getData(0);
      session.publishText('2026-11-20 10:00:06', 'shift');
      expect(session.source.getData(1) === firstSeed).assertTrue();
      Logger.info(TAG, 'PublishShiftsEveryIndex_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_APP_SESSION_2600
     * @tc.name HundredWalkMapping026
     * @tc.desc Verify a hundred row feed maps every index to its own row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HundredWalkMapping_026', 0, (): void => {
      Logger.info(TAG, 'HundredWalkMapping_026 begin');
      const session: SessionBuilder = new SessionBuilder();
      for (let index: number = 0; index < 100; index++) {
        session.publishText('2026-11-20 10:01:' + index, 'walk_' + index);
      }
      let mismatched: number = 0;
      for (let index: number = 0; index < 100; index++) {
        if (session.source.getData(index).text !== 'walk_' + (99 - index)) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'HundredWalkMapping_026 end');
    });
  });
}
