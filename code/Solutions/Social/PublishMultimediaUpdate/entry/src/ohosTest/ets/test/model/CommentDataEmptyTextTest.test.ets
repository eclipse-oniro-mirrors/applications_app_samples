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
import { CommentData, FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { BUNDLE, TAG } from '../common/TestConstant';
import { buildMoment } from '../common/DataFactory';
import { RecordingListener } from '../common/RecordingListener';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Rows without text.
 * A video update may be published without a caption, so an empty body is a
 * legal row rather than a placeholder to drop. The cases pin that such rows are
 * stored, counted, ordered and notified exactly like text rows.
 */
export default function commentDataEmptyTextTest() {
  describe('CommentDataEmptyTextTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      Logger.info(TAG, 'CommentDataEmptyTextTest ready');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_0100
     * @tc.name EmptyTextRowCounted001
     * @tc.desc Verify a row with an empty body still counts as one entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextRowCounted_001', 0, (): void => {
      Logger.info(TAG, 'EmptyTextRowCounted_001 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('empty-1', 'Author', ''));
      expect(source.totalCount()).assertEqual(1);
      Logger.info(TAG, 'EmptyTextRowCounted_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_0200
     * @tc.name EmptyTextRetrieved002
     * @tc.desc Verify an empty body is returned as an empty string rather than undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextRetrieved_002', 0, (): void => {
      Logger.info(TAG, 'EmptyTextRetrieved_002 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('empty-2', 'Author', ''));
      expect(source.getData(0).text).assertEqual('');
      Logger.info(TAG, 'EmptyTextRetrieved_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_0300
     * @tc.name EmptyTextKeepsMedia0200Slot003
     * @tc.desc Verify a captionless video row keeps its video slot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextKeepsMedia0200Slot_003', 0, (): void => {
      Logger.info(TAG, 'EmptyTextKeepsMedia0200Slot_003 begin');
      const source: CommentData = new CommentData();
      source.pushData(new FriendMoment('clip-1', 'Chef', 'avatar', '', '', 'file://clip.mp4'));
      expect(source.getData(0).video).assertEqual('file://clip.mp4');
      expect(source.getData(0).text).assertEqual('');
      Logger.info(TAG, 'EmptyTextKeepsMedia0200Slot_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_0400
     * @tc.name EmptyRowsKeepOrder004
     * @tc.desc Verify several empty rows keep the order they were added in
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyRowsKeepOrder_004', 0, (): void => {
      Logger.info(TAG, 'EmptyRowsKeepOrder_004 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('e-1', 'Author', ''));
      source.pushData(buildMoment('e-2', 'Author', ''));
      expect(source.getData(0).id).assertEqual('e-1');
      expect(source.getData(1).id).assertEqual('e-2');
      Logger.info(TAG, 'EmptyRowsKeepOrder_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_0500
     * @tc.name EmptyRowNotified005
     * @tc.desc Verify appending an empty row emits one add notification at the tail index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyRowNotified_005', 0, (): void => {
      Logger.info(TAG, 'EmptyRowNotified_005 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('empty');
      source.registerDataChangeListener(listener);
      source.pushData(buildMoment('e-3', 'Author', ''));
      expect(listener.eventCount()).assertEqual(1);
      expect(listener.indexAt(0)).assertEqual(0);
      Logger.info(TAG, 'EmptyRowNotified_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_0600
     * @tc.name EmptyRowPrependNotified006
     * @tc.desc Verify prepending an empty row notifies the head index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyRowPrependNotified_006', 0, (): void => {
      Logger.info(TAG, 'EmptyRowPrependNotified_006 begin');
      const source: CommentData = new CommentData();
      const listener: RecordingListener = new RecordingListener('empty');
      source.registerDataChangeListener(listener);
      source.addDataFirst(buildMoment('e-4', 'Author', ''));
      expect(listener.kindAt(0)).assertEqual('add');
      expect(listener.indexAt(0)).assertEqual(0);
      Logger.info(TAG, 'EmptyRowPrependNotified_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_0700
     * @tc.name EmptyRowsDistinctById007
     * @tc.desc Verify two empty rows are distinguished by their identifiers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyRowsDistinctById_007', 0, (): void => {
      Logger.info(TAG, 'EmptyRowsDistinctById_007 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('empty-a', 'Author', ''));
      source.pushData(buildMoment('empty-b', 'Author', ''));
      expect(source.getData(0).id !== source.getData(1).id).assertTrue();
      Logger.info(TAG, 'EmptyRowsDistinctById_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_0800
     * @tc.name HundredEmptyRows008
     * @tc.desc Verify a hundred empty rows are all stored and counted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HundredEmptyRows_008', 0, (): void => {
      Logger.info(TAG, 'HundredEmptyRows_008 begin');
      const source: CommentData = new CommentData();
      for (let index: number = 0; index < 100; index++) {
        source.pushData(buildMoment('bulk-empty-' + index, 'Author', ''));
      }
      expect(source.totalCount()).assertEqual(100);
      expect(source.getData(99).text).assertEqual('');
      Logger.info(TAG, 'HundredEmptyRows_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_0900
     * @tc.name EmptyTextEditLater009
     * @tc.desc Verify an empty body can be filled in after the row is stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextEditLater_009', 0, (): void => {
      Logger.info(TAG, 'EmptyTextEditLater_009 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('late-fill', 'Author', ''));
      source.getData(0).text = 'filled later';
      expect(source.getData(0).text).assertEqual('filled later');
      Logger.info(TAG, 'EmptyTextEditLater_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_1000
     * @tc.name EmptyRowsSnapshotCount010
     * @tc.desc Verify an empty body row still appears in the JSON snapshot array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyRowsSnapshotCount_010', 0, (): void => {
      Logger.info(TAG, 'EmptyRowsSnapshotCount_010 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('snap-empty', 'Author', ''));
      let rows: Array<FriendMoment> = [];
      for (let index: number = 0; index < source.totalCount(); index++) {
        rows.push(source.getData(index));
      }
      const payload: string = JSON.stringify(rows);
      expect(payload).assertContain('"text":""');
      Logger.info(TAG, 'EmptyRowsSnapshotCount_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_1100
     * @tc.name EmptyTextKeepsUserName011
     * @tc.desc Verify a captionless row keeps the user name it was created with
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextKeepsUserName_011', 0, (): void => {
      Logger.info(TAG, 'EmptyTextKeepsUserName_011 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('name-empty', 'Chef', ''));
      expect(source.getData(0).userName).assertEqual('Chef');
      Logger.info(TAG, 'EmptyTextKeepsUserName_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_1200
     * @tc.name EmptyTextKeepsAvatar012
     * @tc.desc Verify a captionless row keeps the avatar identifier it was created with
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextKeepsAvatar_012', 0, (): void => {
      Logger.info(TAG, 'EmptyTextKeepsAvatar_012 begin');
      const source: CommentData = new CommentData();
      source.pushData(new FriendMoment('avatar-empty', 'Chef', 'avatar-chef', ''));
      expect(source.getData(0).avatar).assertEqual('avatar-chef');
      Logger.info(TAG, 'EmptyTextKeepsAvatar_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_1300
     * @tc.name EmptyTextHasNoMedia013
     * @tc.desc Verify a text row without a caption still has no media slot assigned
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextHasNoMedia_013', 0, (): void => {
      Logger.info(TAG, 'EmptyTextHasNoMedia_013 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('plain-empty', 'Author', ''));
      expect(source.getData(0).image).assertUndefined();
      expect(source.getData(0).video).assertUndefined();
      Logger.info(TAG, 'EmptyTextHasNoMedia_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_EMPTYTEXT_1400
     * @tc.name EmptyRowPrependedToHead014
     * @tc.desc Verify a captionless row inserted at the head becomes the first entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyRowPrependedToHead_014', 0, (): void => {
      Logger.info(TAG, 'EmptyRowPrependedToHead_014 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('normal-row', 'Author', 'text'));
      source.addDataFirst(buildMoment('head-empty', 'Chef', ''));
      expect(source.getData(0).id).assertEqual('head-empty');
      expect(source.getData(1).id).assertEqual('normal-row');
      Logger.info(TAG, 'EmptyRowPrependedToHead_014 end');
    });
  });
}
