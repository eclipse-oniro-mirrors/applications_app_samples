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
import { describe, expect, it } from '@ohos/hypium';
import {
  LIST_ROW_COUNT,
  SKELETON_ACTION_COUNT_OTHER,
  SKELETON_ACTION_WIDTH,
  SKELETON_IMAGE_WIDTH,
  SKELETON_TEXT_HEIGHT,
  SKELETON_TITLE_HEIGHT,
  SKELETON_TOPIC_COUNT_MINE,
  SkeletonModel,
  TAB_COUNT,
  TAB_FIXTURES,
  sumSkeletonRows,
} from '../Shared/CustomAnimationTabFixtures';

/**
 * Pure model suite for SkeletonLayout.isMine branches.
 * pages/Index.ets always renders isMine: false, while the component also
 * supports the isMine: true topic branch.
 */
export default function skeletonModelTest(): void {
  describe('SkeletonModelTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_0100
    // @tc.name skeletonModelTest001
    // @tc.desc Verify the page branch defaults to the non-mine layout.
    it('skeletonModelTest001', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.mine()).assertFalse();
      expect(skeleton.hasActionAreas()).assertTrue();
      expect(skeleton.hasTopics()).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_0200
    // @tc.name skeletonModelTest002
    // @tc.desc Verify every page renders eight placeholder rows.
    it('skeletonModelTest002', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.rowCount()).assertEqual(LIST_ROW_COUNT);
      expect(skeleton.rowCount()).assertEqual(8);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_0300
    // @tc.name skeletonModelTest003
    // @tc.desc Verify the non-mine branch renders three action areas.
    it('skeletonModelTest003', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.actionAreaCount()).assertEqual(3);
      expect(skeleton.actionAreaCount()).assertEqual(
        SKELETON_ACTION_COUNT_OTHER,
      );
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_0400
    // @tc.name skeletonModelTest004
    // @tc.desc Verify the non-mine branch renders no topic tags.
    it('skeletonModelTest004', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.topicCount()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_0500
    // @tc.name skeletonModelTest005
    // @tc.desc Verify the mine branch renders no action areas.
    it('skeletonModelTest005', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(true);
      expect(skeleton.mine()).assertTrue();
      expect(skeleton.actionAreaCount()).assertEqual(0);
      expect(skeleton.hasActionAreas()).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_0600
    // @tc.name skeletonModelTest006
    // @tc.desc Verify the mine branch renders two topic tags.
    it('skeletonModelTest006', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(true);
      expect(skeleton.topicCount()).assertEqual(2);
      expect(skeleton.topicCount()).assertEqual(SKELETON_TOPIC_COUNT_MINE);
      expect(skeleton.hasTopics()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_0700
    // @tc.name skeletonModelTest007
    // @tc.desc Verify the two branches are mutually exclusive.
    it('skeletonModelTest007', 0, (): void => {
      const other: SkeletonModel = new SkeletonModel(false);
      const mine: SkeletonModel = new SkeletonModel(true);
      expect(other.hasActionAreas() && other.hasTopics()).assertFalse();
      expect(mine.hasActionAreas() && mine.hasTopics()).assertFalse();
      expect(other.hasActionAreas() !== mine.hasActionAreas()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_0800
    // @tc.name skeletonModelTest008
    // @tc.desc Verify the title placeholder height.
    it('skeletonModelTest008', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.titleHeight()).assertEqual(20);
      expect(skeleton.titleHeight()).assertEqual(SKELETON_TITLE_HEIGHT);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_0900
    // @tc.name skeletonModelTest009
    // @tc.desc Verify the text placeholder height.
    it('skeletonModelTest009', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.textHeight()).assertEqual(14);
      expect(skeleton.textHeight()).assertEqual(SKELETON_TEXT_HEIGHT);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_1000
    // @tc.name skeletonModelTest010
    // @tc.desc Verify the action area width.
    it('skeletonModelTest010', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.actionWidth()).assertEqual(58);
      expect(skeleton.actionWidth()).assertEqual(SKELETON_ACTION_WIDTH);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_1100
    // @tc.name skeletonModelTest011
    // @tc.desc Verify the image placeholder width.
    it('skeletonModelTest011', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.imageWidth()).assertEqual(128);
      expect(skeleton.imageWidth()).assertEqual(SKELETON_IMAGE_WIDTH);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_1200
    // @tc.name skeletonModelTest012
    // @tc.desc Verify five pages produce forty skeleton cards.
    it('skeletonModelTest012', 0, (): void => {
      expect(SkeletonModel.totalCards()).assertEqual(
        TAB_COUNT * LIST_ROW_COUNT,
      );
      expect(SkeletonModel.totalCards()).assertEqual(40);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_1300
    // @tc.name skeletonModelTest013
    // @tc.desc Verify fixture skeleton rows sum to forty.
    it('skeletonModelTest013', 0, (): void => {
      expect(sumSkeletonRows()).assertEqual(40);
      for (let index: number = 0; index < TAB_FIXTURES.length; index++) {
        expect(TAB_FIXTURES[index].skeletonRows).assertEqual(8);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_1400
    // @tc.name skeletonModelTest014
    // @tc.desc Verify the non-mine branch has fifteen action areas over five pages.
    it('skeletonModelTest014', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.actionAreaCount() * TAB_COUNT).assertEqual(15);
      expect(skeleton.topicCount() * TAB_COUNT).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_1500
    // @tc.name skeletonModelTest015
    // @tc.desc Verify the mine branch has ten topic tags over five pages.
    it('skeletonModelTest015', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(true);
      expect(skeleton.topicCount() * TAB_COUNT).assertEqual(10);
      expect(skeleton.actionAreaCount() * TAB_COUNT).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_1600
    // @tc.name skeletonModelTest016
    // @tc.desc Verify one hundred branch instances never mix their counts.
    it('skeletonModelTest016', 0, (): void => {
      for (let round: number = 0; round < 100; round++) {
        const mine: SkeletonModel = new SkeletonModel(true);
        const other: SkeletonModel = new SkeletonModel(false);
        expect(mine.topicCount()).assertEqual(2);
        expect(other.actionAreaCount()).assertEqual(3);
        expect(mine.actionAreaCount()).assertEqual(0);
        expect(other.topicCount()).assertEqual(0);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_1700
    // @tc.name skeletonModelTest017
    // @tc.desc Verify row counts are independent of the branch.
    it('skeletonModelTest017', 0, (): void => {
      const mine: SkeletonModel = new SkeletonModel(true);
      const other: SkeletonModel = new SkeletonModel(false);
      expect(mine.rowCount()).assertEqual(other.rowCount());
      expect(mine.rowCount()).assertEqual(LIST_ROW_COUNT);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SKEL_1800
    // @tc.name skeletonModelTest018
    // @tc.desc Verify all dimension helpers are positive.
    it('skeletonModelTest018', 0, (): void => {
      const skeleton: SkeletonModel = new SkeletonModel(false);
      expect(skeleton.titleHeight() > 0).assertTrue();
      expect(skeleton.textHeight() > 0).assertTrue();
      expect(skeleton.actionWidth() > 0).assertTrue();
      expect(skeleton.imageWidth() > 0).assertTrue();
      expect(skeleton.rowCount() > 0).assertTrue();
    });
  });
}
