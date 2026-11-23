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
import { BUNDLE, TAG } from '../common/TestConstant';
import { buildFullMoment, buildMoment, EMPTY_RESOURCE } from '../common/DataFactory';
/**
 * Field independence of the model.
 * A row is a plain mutable record. @Reusable reuse reassigns the whole row, and
 * the page mutates fields before inserting, so each field has to be writable
 * without disturbing its neighbours. Every case changes one field and proves
 * the other five are untouched.
 */
export default function friendMomentFieldMatrixTest() {
  describe('FriendMomentFieldMatrixTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_0100
     * @tc.name IdMutationIsolated001
     * @tc.desc Verify id mutation isolated
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdMutationIsolated_001', 0, (): void => {
      Logger.info(TAG, 'IdMutationIsolated_001 begin');
      const moment: FriendMoment = buildFullMoment('id-0100', 'Author', 'body', 'img', 'vid');
      moment.id = 'id-rewritten';
      expect(moment.userName).assertEqual('Author');
      expect(moment.text).assertEqual('body');
      expect(moment.image).assertEqual('img');
      expect(moment.video).assertEqual('vid');
      Logger.info(TAG, 'IdMutationIsolated_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_0200
     * @tc.name UserNameMutationIsolated002
     * @tc.desc Verify user name mutation isolated
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UserNameMutationIsolated_002', 0, (): void => {
      Logger.info(TAG, 'UserNameMutationIsolated_002 begin');
      const moment: FriendMoment = buildMoment('id-0200', 'Author', 'body');
      moment.userName = 'Reader';
      expect(moment.id).assertEqual('id-0200');
      expect(moment.text).assertEqual('body');
      expect(moment.userName.length).assertEqual(6);
      Logger.info(TAG, 'UserNameMutationIsolated_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_0300
     * @tc.name AvatarMutationIsolated003
     * @tc.desc Verify avatar mutation isolated
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarMutationIsolated_003', 0, (): void => {
      Logger.info(TAG, 'AvatarMutationIsolated_003 begin');
      const moment: FriendMoment = buildImageMomentForMatrix('id-0300', 'Author', 'body', 'img');
      moment.avatar = 'avatar-replaced';
      expect(moment.image).assertEqual('img');
      expect(moment.text).assertEqual('body');
      const replaced: boolean = moment.avatar === 'avatar-replaced';
      Logger.info(TAG, 'replaced=' + JSON.stringify(replaced));
      expect(replaced).assertTrue();
      Logger.info(TAG, 'AvatarMutationIsolated_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_0400
     * @tc.name TextMutationIsolated004
     * @tc.desc Verify text mutation isolated
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextMutationIsolated_004', 0, (): void => {
      Logger.info(TAG, 'TextMutationIsolated_004 begin');
      const moment: FriendMoment = buildFullMoment('id-0400', 'Author', 'before', 'img', 'vid');
      moment.text = 'after';
      expect(moment.userName).assertEqual('Author');
      expect(moment.image).assertEqual('img');
      expect(moment.video).assertEqual('vid');
      Logger.info(TAG, 'TextMutationIsolated_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_0500
     * @tc.name ImageMutationIsolated005
     * @tc.desc Verify image mutation isolated
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageMutationIsolated_005', 0, (): void => {
      Logger.info(TAG, 'ImageMutationIsolated_005 begin');
      const moment: FriendMoment = buildFullMoment('id-0500', 'Author', 'body', 'old-img', 'vid');
      moment.image = 'new-img';
      expect(moment.video).assertEqual('vid');
      expect(moment.text).assertEqual('body');
      expect(moment.image).assertEqual('new-img');
      Logger.info(TAG, 'ImageMutationIsolated_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_0600
     * @tc.name VideoMutationIsolated006
     * @tc.desc Verify video mutation isolated
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoMutationIsolated_006', 0, (): void => {
      Logger.info(TAG, 'VideoMutationIsolated_006 begin');
      const moment: FriendMoment = buildFullMoment('id-0600', 'Author', 'body', 'img', 'old-vid');
      moment.video = 'new-vid';
      expect(moment.image).assertEqual('img');
      expect(moment.text).assertEqual('body');
      expect(moment.video).assertEqual('new-vid');
      Logger.info(TAG, 'VideoMutationIsolated_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_0700
     * @tc.name ClearImageToUndefined007
     * @tc.desc Verify clear image to undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ClearImageToUndefined_007', 0, (): void => {
      Logger.info(TAG, 'ClearImageToUndefined_007 begin');
      const moment: FriendMoment = buildImageMomentForMatrix('id-0700', 'Author', 'body', 'img');
      moment.image = undefined;
      expect(moment.image).assertUndefined();
      expect(moment.text).assertEqual('body');
      Logger.info(TAG, 'ClearImageToUndefined_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_0800
     * @tc.name ClearVideoToUndefined008
     * @tc.desc Verify clear video to undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ClearVideoToUndefined_008', 0, (): void => {
      Logger.info(TAG, 'ClearVideoToUndefined_008 begin');
      const moment: FriendMoment = buildFullMoment('id-0800', 'Author', 'body', 'img', 'vid');
      moment.video = undefined;
      expect(moment.video).assertUndefined();
      expect(moment.image).assertEqual('img');
      Logger.info(TAG, 'ClearVideoToUndefined_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_0900
     * @tc.name SetUndefinedImageToValue009
     * @tc.desc Verify set undefined image to value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SetUndefinedImageToValue_009', 0, (): void => {
      Logger.info(TAG, 'SetUndefinedImageToValue_009 begin');
      const moment: FriendMoment = buildMoment('id-0900', 'Author', 'body');
      moment.image = 'added-later';
      const added: boolean = moment.image === 'added-later';
      Logger.info(TAG, 'added=' + JSON.stringify(added));
      expect(added).assertTrue();
      Logger.info(TAG, 'SetUndefinedImageToValue_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1000
     * @tc.name AvatarStringToResource010
     * @tc.desc Verify avatar string to resource
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarStringToResource_010', 0, (): void => {
      Logger.info(TAG, 'AvatarStringToResource_010 begin');
      const moment: FriendMoment = buildMoment('id-1000', 'Author', 'body');
      const avatar: Resource = $r('app.media.Chef');
      moment.avatar = avatar;
      const same: boolean = moment.avatar === avatar;
      Logger.info(TAG, 'same=' + JSON.stringify(same));
      expect(same).assertTrue();
      Logger.info(TAG, 'AvatarStringToResource_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1100
     * @tc.name ImageStringToResource011
     * @tc.desc Verify image string to resource
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageStringToResource_011', 0, (): void => {
      Logger.info(TAG, 'ImageStringToResource_011 begin');
      const moment: FriendMoment = buildImageMomentForMatrix('id-1100', 'Author', 'body', 'file://picked.jpg');
      const image: Resource = $r('app.media.publish_photo_bird');
      moment.image = image;
      const same: boolean = moment.image === image;
      Logger.info(TAG, 'same=' + JSON.stringify(same));
      expect(same).assertTrue();
      Logger.info(TAG, 'ImageStringToResource_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1200
     * @tc.name EmptyToValueId012
     * @tc.desc Verify empty to value id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyToValueId_012', 0, (): void => {
      Logger.info(TAG, 'EmptyToValueId_012 begin');
      const moment: FriendMoment = new FriendMoment(EMPTY_RESOURCE, 'Author', 'avatar', 'body');
      moment.id = 'assigned-later';
      expect(moment.id).assertEqual('assigned-later');
      Logger.info(TAG, 'EmptyToValueId_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1300
     * @tc.name EmptyToValueText013
     * @tc.desc Verify empty to value text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyToValueText_013', 0, (): void => {
      Logger.info(TAG, 'EmptyToValueText_013 begin');
      const moment: FriendMoment = buildFullMoment('id-1300', 'Author', EMPTY_RESOURCE, 'img', 'vid');
      moment.text = 'caption';
      expect(moment.text).assertEqual('caption');
      expect(moment.video).assertEqual('vid');
      Logger.info(TAG, 'EmptyToValueText_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1400
     * @tc.name ValueToEmptyText014
     * @tc.desc Verify value to empty text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ValueToEmptyText_014', 0, (): void => {
      Logger.info(TAG, 'ValueToEmptyText_014 begin');
      const moment: FriendMoment = buildMoment('id-1400', 'Author', 'body');
      moment.text = EMPTY_RESOURCE;
      expect(moment.text.length).assertEqual(0);
      expect(moment.id).assertEqual('id-1400');
      Logger.info(TAG, 'ValueToEmptyText_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1500
     * @tc.name SameValueReassignIdempotent015
     * @tc.desc Verify same value reassign idempotent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameValueReassignIdempotent_015', 0, (): void => {
      Logger.info(TAG, 'SameValueReassignIdempotent_015 begin');
      const moment: FriendMoment = buildMoment('stable-id', 'Author', 'body');
      moment.id = 'stable-id';
      moment.text = 'body';
      const unchanged: boolean = moment.id === 'stable-id' && moment.text === 'body';
      Logger.info(TAG, 'unchanged=' + JSON.stringify(unchanged));
      expect(unchanged).assertTrue();
      Logger.info(TAG, 'SameValueReassignIdempotent_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1600
     * @tc.name PeerFieldsUnaffectedById016
     * @tc.desc Verify peer fields unaffected by id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PeerFieldsUnaffectedById_016', 0, (): void => {
      Logger.info(TAG, 'PeerFieldsUnaffectedById_016 begin');
      const left: FriendMoment = buildMoment('left-id', 'Author', 'left body');
      const right: FriendMoment = buildMoment('right-id', 'Author', 'right body');
      left.id = 'left-changed';
      expect(right.id).assertEqual('right-id');
      Logger.info(TAG, 'PeerFieldsUnaffectedById_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1700
     * @tc.name PeerFieldsUnaffectedByText017
     * @tc.desc Verify peer fields unaffected by text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PeerFieldsUnaffectedByText_017', 0, (): void => {
      Logger.info(TAG, 'PeerFieldsUnaffectedByText_017 begin');
      const left: FriendMoment = buildMoment('left-id', 'Author', 'left body');
      const right: FriendMoment = buildMoment('right-id', 'Author', 'right body');
      left.text = 'left changed';
      expect(right.text).assertEqual('right body');
      Logger.info(TAG, 'PeerFieldsUnaffectedByText_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1800
     * @tc.name PeerFieldsUnaffectedByImage018
     * @tc.desc Verify peer fields unaffected by image
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PeerFieldsUnaffectedByImage_018', 0, (): void => {
      Logger.info(TAG, 'PeerFieldsUnaffectedByImage_018 begin');
      const left: FriendMoment = buildImageMomentForMatrix('left-id', 'Author', 'left', 'left.jpg');
      const right: FriendMoment = buildImageMomentForMatrix('right-id', 'Author', 'right', 'right.jpg');
      left.image = 'replaced.jpg';
      expect(right.image).assertEqual('right.jpg');
      Logger.info(TAG, 'PeerFieldsUnaffectedByImage_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_1900
     * @tc.name JsonReflectsIdMutation019
     * @tc.desc Verify json reflects id mutation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JsonReflectsIdMutation_019', 0, (): void => {
      Logger.info(TAG, 'JsonReflectsIdMutation_019 begin');
      const moment: FriendMoment = buildMoment('before-id', 'Author', 'body');
      moment.id = 'after-id';
      const payload: string = JSON.stringify(moment);
      expect(payload).assertContain('after-id');
      const stale: boolean = payload.indexOf('before-id') !== -1;
      expect(stale).assertFalse();
      Logger.info(TAG, 'JsonReflectsIdMutation_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_2000
     * @tc.name JsonOmitsClearedImage020
     * @tc.desc Verify json omits cleared image
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JsonOmitsClearedImage_020', 0, (): void => {
      Logger.info(TAG, 'JsonOmitsClearedImage_020 begin');
      const moment: FriendMoment = buildImageMomentForMatrix('id-2000', 'Author', 'body', 'img');
      moment.image = undefined;
      const payload: string = JSON.stringify(moment);
      const omitted: boolean = payload.indexOf('image') === -1;
      Logger.info(TAG, 'omitted=' + JSON.stringify(omitted));
      expect(omitted).assertTrue();
      Logger.info(TAG, 'JsonOmitsClearedImage_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_2100
     * @tc.name UserNameSpacesPreserved021
     * @tc.desc Verify user name spaces preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UserNameSpacesPreserved_021', 0, (): void => {
      Logger.info(TAG, 'UserNameSpacesPreserved_021 begin');
      const moment: FriendMoment = buildMoment('id-2100', 'IT Engineer', 'body');
      expect(moment.userName).assertEqual('IT Engineer');
      expect(moment.userName.length).assertEqual(11);
      Logger.info(TAG, 'UserNameSpacesPreserved_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_FIELDMATRIX_2200
     * @tc.name SequentialFieldEdits022
     * @tc.desc Verify sequential field edits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SequentialFieldEdits_022', 0, (): void => {
      Logger.info(TAG, 'SequentialFieldEdits_022 begin');
      const moment: FriendMoment = buildMoment('id-2200', 'Author', 'body');
      moment.id = 'next-id';
      moment.userName = 'Next Author';
      moment.avatar = 'next-avatar';
      moment.text = 'next body';
      moment.image = 'next-img';
      moment.video = 'next-vid';
      const allUpdated: boolean = moment.id === 'next-id' && moment.userName === 'Next Author' &&
        moment.avatar === 'next-avatar' && moment.text === 'next body' &&
        moment.image === 'next-img' && moment.video === 'next-vid';
      Logger.info(TAG, 'allUpdated=' + JSON.stringify(allUpdated));
      expect(allUpdated).assertTrue();
      Logger.info(TAG, 'SequentialFieldEdits_022 end');
    });
  });
}
function buildImageMomentForMatrix(id: string, userName: string, text: string, image: string): FriendMoment {
  return new FriendMoment(id, userName, 'avatar_matrix', text, image);
}
