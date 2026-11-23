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
import { buildFullMoment, buildImageMoment, buildMoment, buildVideoMoment } from '../common/DataFactory';
/**
 * Media variety inside one feed.
 * The list mixes text, photo and video rows. These cases prove that each row
 * keeps its own media slot through every collection operation, that inserting
 * a row of one kind never rewrites a neighbour of another kind, and that the
 * head and tail positions stay bound to the right media shape.
 */
export default function commentDataMixedMediaTest() {
  describe('CommentDataMixedMediaTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_0100
     * @tc.name ThreeShapesKeepSlots001
     * @tc.desc Verify three shapes keep slots
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThreeShapesKeepSlots_001', 0, (): void => {
      Logger.info(TAG, 'ThreeShapesKeepSlots_001 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('text-row', 'Author', 'plain'));
      source.pushData(buildImageMoment('image-row', 'Author', 'photo', 'file://photo.jpg'));
      source.pushData(buildVideoMoment('video-row', 'Author', 'clip', 'file://clip.mp4'));
      expect(source.getData(0).image).assertUndefined();
      expect(source.getData(0).video).assertUndefined();
      expect(source.getData(1).image).assertEqual('file://photo.jpg');
      expect(source.getData(1).video).assertUndefined();
      expect(source.getData(2).video).assertEqual('file://clip.mp4');
      Logger.info(TAG, 'ThreeShapesKeepSlots_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_0200
     * @tc.name VideoRowKeepsEmptyImage002
     * @tc.desc Verify video row keeps empty image
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoRowKeepsEmptyImage_002', 0, (): void => {
      Logger.info(TAG, 'VideoRowKeepsEmptyImage_002 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildVideoMoment('clip-row', 'Engineer', 'clip', 'file://clip.mp4'));
      const row: FriendMoment = source.getData(0);
      expect(row.image).assertEqual('');
      expect(row.video).assertEqual('file://clip.mp4');
      Logger.info(TAG, 'VideoRowKeepsEmptyImage_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_0300
     * @tc.name PhotoRowKeepsNoVideo003
     * @tc.desc Verify photo row keeps no video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PhotoRowKeepsNoVideo_003', 0, (): void => {
      Logger.info(TAG, 'PhotoRowKeepsNoVideo_003 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildImageMoment('photo-row', 'Zoologist', 'bird', 'file://bird.webp'));
      const row: FriendMoment = source.getData(0);
      expect(row.image).assertEqual('file://bird.webp');
      expect(row.video).assertUndefined();
      Logger.info(TAG, 'PhotoRowKeepsNoVideo_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_0400
     * @tc.name FullRowKeepsBothSlots004
     * @tc.desc Verify full row keeps both slots
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FullRowKeepsBothSlots_004', 0, (): void => {
      Logger.info(TAG, 'FullRowKeepsBothSlots_004 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildFullMoment('both-row', 'Author', 'both', 'file://a.jpg', 'file://a.mp4'));
      const row: FriendMoment = source.getData(0);
      expect(row.image).assertEqual('file://a.jpg');
      expect(row.video).assertEqual('file://a.mp4');
      Logger.info(TAG, 'FullRowKeepsBothSlots_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_0500
     * @tc.name InsertingPhotoSparesVideoNeighbour005
     * @tc.desc Verify inserting photo spares video neighbour
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InsertingPhotoSparesVideoNeighbour_005', 0, (): void => {
      Logger.info(TAG, 'InsertingPhotoSparesVideoNeighbour_005 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildVideoMoment('neighbour', 'Chef', 'champagne', 'file://champagne.mp4'));
      source.pushData(buildImageMoment('inserted', 'Author', 'photo', 'file://late.jpg'));
      const neighbour: FriendMoment = source.getData(0);
      expect(neighbour.video).assertEqual('file://champagne.mp4');
      expect(neighbour.image).assertEqual('');
      Logger.info(TAG, 'InsertingPhotoSparesVideoNeighbour_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_0600
     * @tc.name PrependTextShiftsMediaRows006
     * @tc.desc Verify prepend text shifts media rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PrependTextShiftsMediaRows_006', 0, (): void => {
      Logger.info(TAG, 'PrependTextShiftsMediaRows_006 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildImageMoment('photo', 'Author', 'photo', 'file://photo.jpg'));
      source.addDataFirst(buildMoment('text', 'Author', 'plain'));
      expect(source.getData(0).image).assertUndefined();
      expect(source.getData(1).image).assertEqual('file://photo.jpg');
      Logger.info(TAG, 'PrependTextShiftsMediaRows_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_0700
     * @tc.name PrependVideoKeepsPhotoTail007
     * @tc.desc Verify prepend video keeps photo tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PrependVideoKeepsPhotoTail_007', 0, (): void => {
      Logger.info(TAG, 'PrependVideoKeepsPhotoTail_007 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildImageMoment('photo', 'Architect', 'building', 'file://building.png'));
      source.addDataFirst(buildVideoMoment('clip', 'Author', 'clip', 'file://clip.mp4'));
      expect(source.getData(0).video).assertEqual('file://clip.mp4');
      expect(source.getData(1).image).assertEqual('file://building.png');
      Logger.info(TAG, 'PrependVideoKeepsPhotoTail_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_0800
     * @tc.name AlternatingShapesPreserveOrder008
     * @tc.desc Verify alternating shapes preserve order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AlternatingShapesPreserveOrder_008', 0, (): void => {
      Logger.info(TAG, 'AlternatingShapesPreserveOrder_008 begin');
      const source: CommentData = new CommentData();
      for (let index: number = 0; index < 9; index++) {
        if (index % 3 === 0) {
          source.pushData(buildMoment('text-' + index, 'Author', 'text_' + index));
        }
        else if (index % 3 === 1) {
          source.pushData(buildImageMoment('image-' + index, 'Author', 'image_' + index, 'file://img_' + index));
        }
        else {
          source.pushData(buildVideoMoment('video-' + index, 'Author', 'video_' + index, 'file://vid_' + index));
        }
      }
      let mismatched: number = 0;
      for (let index: number = 0; index < 9; index++) {
        const row: FriendMoment = source.getData(index);
        if (row.text !== 'text_' + index && row.text !== 'image_' + index && row.text !== 'video_' + index) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'AlternatingShapesPreserveOrder_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_0900
     * @tc.name MediaRowBodyStillEditable009
     * @tc.desc Verify media row body still editable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaRowBodyStillEditable_009', 0, (): void => {
      Logger.info(TAG, 'MediaRowBodyStillEditable_009 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildImageMoment('editable', 'Author', 'before', 'file://keep.jpg'));
      source.getData(0).text = 'after';
      expect(source.getData(0).text).assertEqual('after');
      expect(source.getData(0).image).assertEqual('file://keep.jpg');
      Logger.info(TAG, 'MediaRowBodyStillEditable_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_1000
     * @tc.name MediaRowMediaReplaceable010
     * @tc.desc Verify media row media replaceable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaRowMediaReplaceable_010', 0, (): void => {
      Logger.info(TAG, 'MediaRowMediaReplaceable_010 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildImageMoment('left', 'Author', 'same', 'file://left.jpg'));
      source.pushData(buildImageMoment('right', 'Author', 'same', 'file://right.jpg'));
      source.getData(0).image = 'file://replaced.jpg';
      expect(source.getData(0).image).assertEqual('file://replaced.jpg');
      expect(source.getData(1).image).assertEqual('file://right.jpg');
      Logger.info(TAG, 'MediaRowMediaReplaceable_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_1100
     * @tc.name MediaCountsAcrossFeed011
     * @tc.desc Verify media counts across feed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaCountsAcrossFeed_011', 0, (): void => {
      Logger.info(TAG, 'MediaCountsAcrossFeed_011 begin');
      const source: CommentData = new CommentData();
      for (let index: number = 0; index < 10; index++) {
        source.pushData(buildImageMoment('img-' + index, 'Author', 'img_' + index, 'file://i_' + index));
        source.pushData(buildVideoMoment('vid-' + index, 'Author', 'vid_' + index, 'file://v_' + index));
      }
      let photoRows: number = 0;
      let videoRows: number = 0;
      for (let index: number = 0; index < source.totalCount(); index++) {
        const row: FriendMoment = source.getData(index);
        if (row.video !== undefined) {
          videoRows += 1;
        }
        else {
          photoRows += 1;
        }
      }
      expect(photoRows).assertEqual(10);
      expect(videoRows).assertEqual(10);
      Logger.info(TAG, 'MediaCountsAcrossFeed_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_1200
     * @tc.name EmptyImageRowCountsAsText012
     * @tc.desc Verify empty image row counts as text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyImageRowCountsAsText_012', 0, (): void => {
      Logger.info(TAG, 'EmptyImageRowCountsAsText_012 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildFullMoment('empty-image', 'Author', 'row', '', 'file://clip.mp4'));
      const row: FriendMoment = source.getData(0);
      const emptyImage: boolean = row.image === '';
      Logger.info(TAG, 'emptyImage=' + JSON.stringify(emptyImage));
      expect(emptyImage).assertTrue();
      const hasVideo: boolean = row.video !== undefined;
      Logger.info(TAG, 'hasVideo=' + JSON.stringify(hasVideo));
      expect(hasVideo).assertTrue();
      Logger.info(TAG, 'EmptyImageRowCountsAsText_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_1300
     * @tc.name ResourceMediaRowsCoexist013
     * @tc.desc Verify resource media rows coexist
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResourceMediaRowsCoexist_013', 0, (): void => {
      Logger.info(TAG, 'ResourceMediaRowsCoexist_013 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildFullMoment('resource-row', 'Zoologist', 'bird', $r('app.media.publish_photo_bird'), ''));
      source.pushData(buildFullMoment('string-row', 'Author', 'uri', 'file://media/picked.jpg', ''));
      const first: boolean = source.getData(0).image !== undefined;
      const second: boolean = source.getData(1).image !== undefined;
      const check01: boolean = first && second;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(1).image).assertEqual('file://media/picked.jpg');
      Logger.info(TAG, 'ResourceMediaRowsCoexist_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_1400
     * @tc.name MediaRowsSurviveManyInserts014
     * @tc.desc Verify media rows survive many inserts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaRowsSurviveManyInserts_014', 0, (): void => {
      Logger.info(TAG, 'MediaRowsSurviveManyInserts_014 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildImageMoment('anchor', 'Author', 'anchor', 'file://anchor.jpg'));
      for (let index: number = 0; index < 200; index++) {
        source.addDataFirst(buildMoment('text-' + index, 'Author', 'text_' + index));
      }
      const last: FriendMoment = source.getData(source.totalCount() - 1);
      expect(last.image).assertEqual('file://anchor.jpg');
      Logger.info(TAG, 'MediaRowsSurviveManyInserts_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MIXEDMEDIA_1500
     * @tc.name SharedMediaValueAcrossRows015
     * @tc.desc Verify shared media value across rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SharedMediaValueAcrossRows_015', 0, (): void => {
      Logger.info(TAG, 'SharedMediaValueAcrossRows_015 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildImageMoment('first', 'Author', 'first', 'file://common.jpg'));
      source.pushData(buildImageMoment('second', 'Author', 'second', 'file://common.jpg'));
      expect(source.getData(0).image).assertEqual(source.getData(1).image);
      source.getData(1).image = 'file://changed.jpg';
      expect(source.getData(0).image).assertEqual('file://common.jpg');
      Logger.info(TAG, 'SharedMediaValueAcrossRows_015 end');
    });
  });
}
