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
import { DEFAULT_AVATAR, EMPTY_RESOURCE, MOMENT_ID_PREFIX, buildMoment, buildMoments, repeatText, textOfLength } from '../common/DataFactory';
/**
 * Constructor contract of the FriendMoment model.
 * The page builds one instance per published update, so every field the
 * constructor drops becomes a silently lost attribute in the list.
 */
export default function friendMomentConstructionTest() {
  describe('FriendMomentConstructionTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_0100
     * @tc.name IdStored001
     * @tc.desc Verify id stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdStored_001', 0, (): void => {
      Logger.info(TAG, 'IdStored_001 begin');
      const moment: FriendMoment = buildMoment('moment-100', 'Author', 'hello');
      const check01: boolean = moment.id === 'moment-100';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'IdStored_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_0200
     * @tc.name UserNameStored002
     * @tc.desc Verify user name stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UserNameStored_002', 0, (): void => {
      Logger.info(TAG, 'UserNameStored_002 begin');
      const moment: FriendMoment = buildMoment('id-101', 'Zoologist', 'hello');
      expect(moment.userName).assertEqual('Zoologist');
      Logger.info(TAG, 'UserNameStored_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_0300
     * @tc.name AvatarStored003
     * @tc.desc Verify avatar stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarStored_003', 0, (): void => {
      Logger.info(TAG, 'AvatarStored_003 begin');
      const moment: FriendMoment = buildMoment('id-102', 'Author', 'hello');
      expect(moment.avatar).assertEqual(DEFAULT_AVATAR);
      Logger.info(TAG, 'AvatarStored_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_0400
     * @tc.name TextStored004
     * @tc.desc Verify text stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextStored_004', 0, (): void => {
      Logger.info(TAG, 'TextStored_004 begin');
      const moment: FriendMoment = buildMoment('id-103', 'Author', 'body text');
      expect(moment.text).assertEqual('body text');
      Logger.info(TAG, 'TextStored_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_0500
     * @tc.name RequiredFieldsTogether005
     * @tc.desc Verify required fields together
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RequiredFieldsTogether_005', 0, (): void => {
      Logger.info(TAG, 'RequiredFieldsTogether_005 begin');
      const moment: FriendMoment = new FriendMoment('id-104', 'Chef', 'avatar-chef', '来杯香槟');
      expect(moment.id).assertContain('id-104');
      expect(moment.userName).assertEqual('Chef');
      expect(moment.avatar).assertEqual('avatar-chef');
      expect(moment.text).assertEqual('来杯香槟');
      Logger.info(TAG, 'RequiredFieldsTogether_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_0600
     * @tc.name ImageAbsent006
     * @tc.desc Verify image absent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageAbsent_006', 0, (): void => {
      Logger.info(TAG, 'ImageAbsent_006 begin');
      const moment: FriendMoment = buildMoment('id-105', 'Author', 'text only');
      expect(moment.image).assertUndefined();
      Logger.info(TAG, 'ImageAbsent_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_0700
     * @tc.name VideoAbsent007
     * @tc.desc Verify video absent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoAbsent_007', 0, (): void => {
      Logger.info(TAG, 'VideoAbsent_007 begin');
      const moment: FriendMoment = buildMoment('id-106', 'Author', 'text only');
      expect(moment.video).assertUndefined();
      Logger.info(TAG, 'VideoAbsent_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_0800
     * @tc.name BothMediaAbsent008
     * @tc.desc Verify both media absent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BothMediaAbsent_008', 0, (): void => {
      Logger.info(TAG, 'BothMediaAbsent_008 begin');
      const moment: FriendMoment = buildMoment('id-107', 'Author', 'plain');
      const check01: boolean = moment.image === undefined && moment.video === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'BothMediaAbsent_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_0900
     * @tc.name ImageStored009
     * @tc.desc Verify image stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageStored_009', 0, (): void => {
      Logger.info(TAG, 'ImageStored_009 begin');
      const moment: FriendMoment = new FriendMoment('id-108', 'Author', DEFAULT_AVATAR, 'with image', 'file://photo_108');
      expect(moment.image).assertEqual('file://photo_108');
      Logger.info(TAG, 'ImageStored_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1000
     * @tc.name VideoStored010
     * @tc.desc Verify video stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoStored_010', 0, (): void => {
      Logger.info(TAG, 'VideoStored_010 begin');
      const moment: FriendMoment = new FriendMoment('id-109', 'Author', DEFAULT_AVATAR, 'with video', '', 'file://clip_109');
      expect(moment.video).assertEqual('file://clip_109');
      Logger.info(TAG, 'VideoStored_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1100
     * @tc.name BothMediaStored011
     * @tc.desc Verify both media stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BothMediaStored_011', 0, (): void => {
      Logger.info(TAG, 'BothMediaStored_011 begin');
      const moment: FriendMoment = new FriendMoment('id-110', 'Author', DEFAULT_AVATAR, 'both', 'file://photo_110', 'file://clip_110');
      expect(moment.image).assertEqual('file://photo_110');
      expect(moment.video).assertEqual('file://clip_110');
      Logger.info(TAG, 'BothMediaStored_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1200
     * @tc.name MediaOrderNotSwapped012
     * @tc.desc Verify media order not swapped
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaOrderNotSwapped_012', 0, (): void => {
      Logger.info(TAG, 'MediaOrderNotSwapped_012 begin');
      const moment: FriendMoment = new FriendMoment('id-111', 'Author', DEFAULT_AVATAR, 'order', 'image-side', 'video-side');
      const check01: boolean = moment.image === 'image-side' && moment.video === 'video-side';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'MediaOrderNotSwapped_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1300
     * @tc.name EmptyIdPreserved013
     * @tc.desc Verify empty id preserved, as covered by the friend moment construction test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyIdPreserved_013', 0, (): void => {
      Logger.info(TAG, 'EmptyIdPreserved_013 begin');
      const moment: FriendMoment = new FriendMoment(EMPTY_RESOURCE, 'Author', DEFAULT_AVATAR, 'text');
      expect(moment.id).assertEqual(EMPTY_RESOURCE);
      Logger.info(TAG, 'EmptyIdPreserved_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1400
     * @tc.name EmptyTextPreserved014
     * @tc.desc Verify empty text preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextPreserved_014', 0, (): void => {
      Logger.info(TAG, 'EmptyTextPreserved_014 begin');
      const moment: FriendMoment = new FriendMoment('id-112', 'Engineer', DEFAULT_AVATAR, EMPTY_RESOURCE);
      expect(moment.text).assertEqual(EMPTY_RESOURCE);
      Logger.info(TAG, 'EmptyTextPreserved_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1500
     * @tc.name EmptyImageIsDefined015
     * @tc.desc Verify empty image is defined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyImageIsDefined_015', 0, (): void => {
      Logger.info(TAG, 'EmptyImageIsDefined_015 begin');
      const moment: FriendMoment = new FriendMoment('id-113', 'Author', DEFAULT_AVATAR, 'text', EMPTY_RESOURCE);
      const check01: boolean = moment.image !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(moment.image).assertEqual(EMPTY_RESOURCE);
      Logger.info(TAG, 'EmptyImageIsDefined_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1600
     * @tc.name EmptyVideoIsDefined016
     * @tc.desc Verify empty video is defined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyVideoIsDefined_016', 0, (): void => {
      Logger.info(TAG, 'EmptyVideoIsDefined_016 begin');
      const moment: FriendMoment = new FriendMoment('id-114', 'Author', DEFAULT_AVATAR, 'text', EMPTY_RESOURCE, EMPTY_RESOURCE);
      const check01: boolean = moment.video !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EmptyVideoIsDefined_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1700
     * @tc.name ExplicitUndefinedMedia017
     * @tc.desc Verify explicit undefined media
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ExplicitUndefinedMedia_017', 0, (): void => {
      Logger.info(TAG, 'ExplicitUndefinedMedia_017 begin');
      const moment: FriendMoment = new FriendMoment('id-115', 'Author', DEFAULT_AVATAR, 'text', undefined, undefined);
      const check01: boolean = moment.image === undefined && moment.video === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ExplicitUndefinedMedia_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1800
     * @tc.name WhitespaceTextKept018
     * @tc.desc Verify whitespace text kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WhitespaceTextKept_018', 0, (): void => {
      Logger.info(TAG, 'WhitespaceTextKept_018 begin');
      const moment: FriendMoment = new FriendMoment('id-116', 'Author', DEFAULT_AVATAR, '  padded  ');
      expect(moment.text).assertEqual('  padded  ');
      Logger.info(TAG, 'WhitespaceTextKept_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_1900
     * @tc.name MultilineTextKept019
     * @tc.desc Verify multiline text kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MultilineTextKept_019', 0, (): void => {
      Logger.info(TAG, 'MultilineTextKept_019 begin');
      const moment: FriendMoment = new FriendMoment('id-117', 'Author', DEFAULT_AVATAR, 'first line\nsecond line');
      expect(moment.text).assertContain('\n');
      const check01: boolean = moment.text.length === 22;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'MultilineTextKept_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2000
     * @tc.name NumericIdStaysText020
     * @tc.desc Verify numeric id stays text, as covered by the friend moment construction test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NumericIdStaysText_020', 0, (): void => {
      Logger.info(TAG, 'NumericIdStaysText_020 begin');
      const moment: FriendMoment = new FriendMoment('007', 'Author', DEFAULT_AVATAR, 'text');
      const check01: boolean = moment.id === '007';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(moment.id.length).assertEqual(3);
      Logger.info(TAG, 'NumericIdStaysText_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2100
     * @tc.name LongTextKept021
     * @tc.desc Verify long text kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongTextKept_021', 0, (): void => {
      Logger.info(TAG, 'LongTextKept_021 begin');
      const body: string = textOfLength(4096, 'publish');
      const moment: FriendMoment = new FriendMoment('id-118', 'Author', DEFAULT_AVATAR, body);
      expect(moment.text.length).assertEqual(4096);
      const check01: boolean = moment.text === body;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'LongTextKept_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2200
     * @tc.name ChineseTextKept022
     * @tc.desc Verify chinese text kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChineseTextKept_022', 0, (): void => {
      Logger.info(TAG, 'ChineseTextKept_022 begin');
      const moment: FriendMoment = new FriendMoment('id-119', 'Chef', DEFAULT_AVATAR, '来杯香槟');
      const check01: boolean = moment.text.length === 4;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(moment.text).assertEqual('来杯香槟');
      Logger.info(TAG, 'ChineseTextKept_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2300
     * @tc.name QuotedTextKept023
     * @tc.desc Verify quoted text kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'QuotedTextKept_023', 0, (): void => {
      Logger.info(TAG, 'QuotedTextKept_023 begin');
      const body: string = 'say "hi" and \\done\\';
      const moment: FriendMoment = new FriendMoment('id-120', 'Author', DEFAULT_AVATAR, body);
      expect(moment.text).assertContain('"hi"');
      expect(moment.text).assertContain('\\done\\');
      const check01: boolean = moment.text === body;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'QuotedTextKept_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2400
     * @tc.name SymbolTextKept024
     * @tc.desc Verify symbol text kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SymbolTextKept_024', 0, (): void => {
      Logger.info(TAG, 'SymbolTextKept_024 begin');
      const moment: FriendMoment = new FriendMoment('id-121', 'Artist', DEFAULT_AVATAR, '作画 🎨');
      expect(moment.text.codePointAt(3)).assertEqual(127912);
      expect(moment.text.length).assertEqual(5);
      Logger.info(TAG, 'SymbolTextKept_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2500
     * @tc.name DistinctInstancesNotShared025
     * @tc.desc Verify distinct instances not shared
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DistinctInstancesNotShared_025', 0, (): void => {
      Logger.info(TAG, 'DistinctInstancesNotShared_025 begin');
      const first: FriendMoment = new FriendMoment('id-122', 'Author', DEFAULT_AVATAR, 'same');
      const second: FriendMoment = new FriendMoment('id-122', 'Author', DEFAULT_AVATAR, 'same');
      const check01: boolean = first === second;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      second.text = 'changed';
      expect(first.text).assertEqual('same');
      Logger.info(TAG, 'DistinctInstancesNotShared_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2600
     * @tc.name TextMutableAfterBuild026
     * @tc.desc Verify text mutable after build
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextMutableAfterBuild_026', 0, (): void => {
      Logger.info(TAG, 'TextMutableAfterBuild_026 begin');
      const moment: FriendMoment = buildMoment('id-123', 'Author', 'before');
      moment.text = 'after';
      expect(moment.text).assertEqual('after');
      Logger.info(TAG, 'TextMutableAfterBuild_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2700
     * @tc.name MediaMutableAfterBuild027
     * @tc.desc Verify media mutable after build
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaMutableAfterBuild_027', 0, (): void => {
      Logger.info(TAG, 'MediaMutableAfterBuild_027 begin');
      const moment: FriendMoment = buildMoment('id-124', 'Author', 'before');
      moment.image = 'late-image';
      moment.video = 'late-video';
      const check01: boolean = moment.image === 'late-image' && moment.video === 'late-video';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'MediaMutableAfterBuild_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2800
     * @tc.name IdMutabilityIsPerInstance028
     * @tc.desc Verify id mutability is per instance
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdMutabilityIsPerInstance_028', 0, (): void => {
      Logger.info(TAG, 'IdMutabilityIsPerInstance_028 begin');
      const list: Array<FriendMoment> = buildMoments(3, MOMENT_ID_PREFIX);
      list[0].id = 'rewritten';
      const check01: boolean = list[1].id === MOMENT_ID_PREFIX + '1';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(list[2].id).assertEqual(MOMENT_ID_PREFIX + '2');
      Logger.info(TAG, 'IdMutabilityIsPerInstance_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_2900
     * @tc.name BatchIdsAreUnique029
     * @tc.desc Verify batch ids are unique
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BatchIdsAreUnique_029', 0, (): void => {
      Logger.info(TAG, 'BatchIdsAreUnique_029 begin');
      const list: Array<FriendMoment> = buildMoments(100, MOMENT_ID_PREFIX);
      let unique: Array<string> = [];
      for (let index: number = 0; index < list.length; index++) {
        if (unique.indexOf(list[index].id) < 0) {
          unique.push(list[index].id);
        }
      }
      expect(unique.length).assertEqual(list.length);
      Logger.info(TAG, 'BatchIdsAreUnique_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3000
     * @tc.name BatchTextMatchesIndex030
     * @tc.desc Verify batch text matches index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BatchTextMatchesIndex_030', 0, (): void => {
      Logger.info(TAG, 'BatchTextMatchesIndex_030 begin');
      const list: Array<FriendMoment> = buildMoments(20, 'row_');
      let mismatched: number = 0;
      for (let index: number = 0; index < list.length; index++) {
        if (list[index].text !== 'text_row_' + index) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'BatchTextMatchesIndex_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3100
     * @tc.name AvatarIsOpaque031
     * @tc.desc Verify avatar is opaque
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarIsOpaque_031', 0, (): void => {
      Logger.info(TAG, 'AvatarIsOpaque_031 begin');
      const avatar: Resource = $r('app.media.Zoologist');
      const moment: FriendMoment = new FriendMoment('id-125', 'Zoologist', avatar, 'bird');
      const check01: boolean = moment.avatar === avatar;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'AvatarIsOpaque_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3200
     * @tc.name ResourceImageIsOpaque032
     * @tc.desc Verify resource image is opaque
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ResourceImageIsOpaque_032', 0, (): void => {
      Logger.info(TAG, 'ResourceImageIsOpaque_032 begin');
      const image: Resource = $r('app.media.publish_photo_bird');
      const moment: FriendMoment = new FriendMoment('id-126', 'Zoologist', DEFAULT_AVATAR, 'bird', image);
      const check01: boolean = moment.image === image;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ResourceImageIsOpaque_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3300
     * @tc.name JsonOmitsAbsentMedia033
     * @tc.desc Verify json omits absent media
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JsonOmitsAbsentMedia_033', 0, (): void => {
      Logger.info(TAG, 'JsonOmitsAbsentMedia_033 begin');
      const moment: FriendMoment = buildMoment('id-127', 'Author', 'plain');
      const payload: string = JSON.stringify(moment);
      const check01: boolean = payload.indexOf('image') === -1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = payload.indexOf('video') === -1;
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'JsonOmitsAbsentMedia_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3400
     * @tc.name JsonKeepsMediaValues034
     * @tc.desc Verify json keeps media values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JsonKeepsMediaValues_034', 0, (): void => {
      Logger.info(TAG, 'JsonKeepsMediaValues_034 begin');
      const moment: FriendMoment = new FriendMoment('id-128', 'Author', DEFAULT_AVATAR, 'both', 'photo_128', 'clip_128');
      const payload: string = JSON.stringify(moment);
      expect(payload).assertContain('photo_128');
      expect(payload).assertContain('clip_128');
      expect(payload).assertContain('id-128');
      Logger.info(TAG, 'JsonKeepsMediaValues_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3500
     * @tc.name SelfReferenceIsStable035
     * @tc.desc Verify self reference is stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SelfReferenceIsStable_035', 0, (): void => {
      Logger.info(TAG, 'SelfReferenceIsStable_035 begin');
      const moment: FriendMoment = buildMoment('id-129', 'Author', 'same');
      const check01: boolean = moment === moment;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'SelfReferenceIsStable_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3600
     * @tc.name LongIdRoundTrip036
     * @tc.desc Verify long id round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongIdRoundTrip_036', 0, (): void => {
      Logger.info(TAG, 'LongIdRoundTrip_036 begin');
      const id: string = textOfLength(512, '2026-11-20 ');
      const moment: FriendMoment = new FriendMoment(id, 'Author', DEFAULT_AVATAR, 'text');
      expect(moment.id.length).assertEqual(512);
      const check01: boolean = moment.id === id;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'LongIdRoundTrip_036 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3700
     * @tc.name PublishedShapeMatchesMine037
     * @tc.desc Verify published shape matches mine
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishedShapeMatchesMine_037', 0, (): void => {
      Logger.info(TAG, 'PublishedShapeMatchesMine_037 begin');
      const stamp: string = '2026-11-20 10:30:00';
      const moment: FriendMoment = new FriendMoment(stamp, String.fromCharCode(25105, 30340), $r('app.media.publish_multimedia_updates_photo0'), '发布内容');
      expect(moment.id).assertEqual(stamp);
      expect(moment.userName).assertEqual(String.fromCharCode(25105, 30340));
      const check01: boolean = moment.image === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PublishedShapeMatchesMine_037 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3800
     * @tc.name TwoHundredRowsBuildable038
     * @tc.desc Verify two hundred rows buildable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoHundredRowsBuildable_038', 0, (): void => {
      Logger.info(TAG, 'TwoHundredRowsBuildable_038 begin');
      let threw: boolean = false;
      let list: Array<FriendMoment> = [];
      try {
        list = buildMoments(200, 'bulk_');
      }
      catch (error) {
        threw = true;
      }
      expect(list.length).assertEqual(200);
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'TwoHundredRowsBuildable_038 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_CONSTRUCTION_3900
     * @tc.name RepeatHelperIsStable039
     * @tc.desc Verify repeat helper is stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatHelperIsStable_039', 0, (): void => {
      Logger.info(TAG, 'RepeatHelperIsStable_039 begin');
      const payload: string = repeatText('ab', 8);
      expect(payload).assertEqual('abababababababab');
      expect(payload.length).assertEqual(16);
      Logger.info(TAG, 'RepeatHelperIsStable_039 end');
    });
  });
}
