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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { ColorModel, FriendMoment, ShareModel } from '../../../main/ets/model/BasicDataSource';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_ModelContract]';

export default function modelContractTest() {
  describe('modelContractTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0001
     * @tc.name testModelContract0001
     * @tc.desc Verify ModelContract behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0001 begin`);
      const id: string = 'model_id_' + 0;
      const text: string = 'model_text_' + 0;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 0, 'avatar_' + 0,
        text, 'image_' + 0, new ShareModel(0, 0 + 1, 0 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 0);
      expect(friend.avatar).assertEqual('avatar_' + 0);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 0);
      expect(friend.share.heart).assertEqual(0);
      expect(friend.share.star).assertEqual(0 + 1);
      expect(friend.share.message).assertEqual(0 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0001 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0002
     * @tc.name testModelContract0002
     * @tc.desc Verify ModelContract behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0002 begin`);
      const id: string = 'model_id_' + 1;
      const text: string = 'model_text_' + 1;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 1, 'avatar_' + 1,
        text, 'image_' + 1, new ShareModel(1, 1 + 1, 1 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 1);
      expect(friend.avatar).assertEqual('avatar_' + 1);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 1);
      expect(friend.share.heart).assertEqual(1);
      expect(friend.share.star).assertEqual(1 + 1);
      expect(friend.share.message).assertEqual(1 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0002 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0003
     * @tc.name testModelContract0003
     * @tc.desc Verify ModelContract behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0003 begin`);
      const id: string = 'model_id_' + 2;
      const text: string = 'model_text_' + 2;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 2, 'avatar_' + 2,
        text, 'image_' + 2, new ShareModel(2, 2 + 1, 2 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 2);
      expect(friend.avatar).assertEqual('avatar_' + 2);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 2);
      expect(friend.share.heart).assertEqual(2);
      expect(friend.share.star).assertEqual(2 + 1);
      expect(friend.share.message).assertEqual(2 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0003 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0004
     * @tc.name testModelContract0004
     * @tc.desc Verify ModelContract behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0004 begin`);
      const id: string = 'model_id_' + 3;
      const text: string = 'model_text_' + 3;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 3, 'avatar_' + 3,
        text, 'image_' + 3, new ShareModel(3, 3 + 1, 3 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 3);
      expect(friend.avatar).assertEqual('avatar_' + 3);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 3);
      expect(friend.share.heart).assertEqual(3);
      expect(friend.share.star).assertEqual(3 + 1);
      expect(friend.share.message).assertEqual(3 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0004 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0005
     * @tc.name testModelContract0005
     * @tc.desc Verify ModelContract behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0005 begin`);
      const id: string = 'model_id_' + 4;
      const text: string = 'model_text_' + 4;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 4, 'avatar_' + 4,
        text, 'image_' + 4, new ShareModel(4, 4 + 1, 4 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 4);
      expect(friend.avatar).assertEqual('avatar_' + 4);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 4);
      expect(friend.share.heart).assertEqual(4);
      expect(friend.share.star).assertEqual(4 + 1);
      expect(friend.share.message).assertEqual(4 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0005 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0006
     * @tc.name testModelContract0006
     * @tc.desc Verify ModelContract behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0006 begin`);
      const id: string = 'model_id_' + 5;
      const text: string = 'model_text_' + 5;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 5, 'avatar_' + 5,
        text, 'image_' + 5, new ShareModel(5, 5 + 1, 5 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 5);
      expect(friend.avatar).assertEqual('avatar_' + 5);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 5);
      expect(friend.share.heart).assertEqual(5);
      expect(friend.share.star).assertEqual(5 + 1);
      expect(friend.share.message).assertEqual(5 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0006 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0007
     * @tc.name testModelContract0007
     * @tc.desc Verify ModelContract behavior for matrix index 6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0007 begin`);
      const id: string = 'model_id_' + 6;
      const text: string = 'model_text_' + 6;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 6, 'avatar_' + 6,
        text, 'image_' + 6, new ShareModel(6, 6 + 1, 6 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 6);
      expect(friend.avatar).assertEqual('avatar_' + 6);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 6);
      expect(friend.share.heart).assertEqual(6);
      expect(friend.share.star).assertEqual(6 + 1);
      expect(friend.share.message).assertEqual(6 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0007 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0008
     * @tc.name testModelContract0008
     * @tc.desc Verify ModelContract behavior for matrix index 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0008 begin`);
      const id: string = 'model_id_' + 7;
      const text: string = 'model_text_' + 7;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 7, 'avatar_' + 7,
        text, 'image_' + 7, new ShareModel(7, 7 + 1, 7 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 7);
      expect(friend.avatar).assertEqual('avatar_' + 7);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 7);
      expect(friend.share.heart).assertEqual(7);
      expect(friend.share.star).assertEqual(7 + 1);
      expect(friend.share.message).assertEqual(7 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0008 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0009
     * @tc.name testModelContract0009
     * @tc.desc Verify ModelContract behavior for matrix index 8
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0009 begin`);
      const id: string = 'model_id_' + 8;
      const text: string = 'model_text_' + 8;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 8, 'avatar_' + 8,
        text, 'image_' + 8, new ShareModel(8, 8 + 1, 8 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 8);
      expect(friend.avatar).assertEqual('avatar_' + 8);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 8);
      expect(friend.share.heart).assertEqual(8);
      expect(friend.share.star).assertEqual(8 + 1);
      expect(friend.share.message).assertEqual(8 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0009 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0010
     * @tc.name testModelContract0010
     * @tc.desc Verify ModelContract behavior for matrix index 9
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0010 begin`);
      const id: string = 'model_id_' + 9;
      const text: string = 'model_text_' + 9;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 9, 'avatar_' + 9,
        text, 'image_' + 9, new ShareModel(9, 9 + 1, 9 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 9);
      expect(friend.avatar).assertEqual('avatar_' + 9);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 9);
      expect(friend.share.heart).assertEqual(9);
      expect(friend.share.star).assertEqual(9 + 1);
      expect(friend.share.message).assertEqual(9 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0010 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0011
     * @tc.name testModelContract0011
     * @tc.desc Verify ModelContract behavior for matrix index 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0011 begin`);
      const id: string = 'model_id_' + 10;
      const text: string = 'model_text_' + 10;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 10, 'avatar_' + 10,
        text, 'image_' + 10, new ShareModel(10, 10 + 1, 10 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 10);
      expect(friend.avatar).assertEqual('avatar_' + 10);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 10);
      expect(friend.share.heart).assertEqual(10);
      expect(friend.share.star).assertEqual(10 + 1);
      expect(friend.share.message).assertEqual(10 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0011 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0012
     * @tc.name testModelContract0012
     * @tc.desc Verify ModelContract behavior for matrix index 11
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0012 begin`);
      const id: string = 'model_id_' + 11;
      const text: string = 'model_text_' + 11;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 11, 'avatar_' + 11,
        text, 'image_' + 11, new ShareModel(11, 11 + 1, 11 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 11);
      expect(friend.avatar).assertEqual('avatar_' + 11);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 11);
      expect(friend.share.heart).assertEqual(11);
      expect(friend.share.star).assertEqual(11 + 1);
      expect(friend.share.message).assertEqual(11 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0012 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0013
     * @tc.name testModelContract0013
     * @tc.desc Verify ModelContract behavior for matrix index 12
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0013 begin`);
      const id: string = 'model_id_' + 12;
      const text: string = 'model_text_' + 12;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 12, 'avatar_' + 12,
        text, 'image_' + 12, new ShareModel(12, 12 + 1, 12 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 12);
      expect(friend.avatar).assertEqual('avatar_' + 12);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 12);
      expect(friend.share.heart).assertEqual(12);
      expect(friend.share.star).assertEqual(12 + 1);
      expect(friend.share.message).assertEqual(12 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0013 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0014
     * @tc.name testModelContract0014
     * @tc.desc Verify ModelContract behavior for matrix index 13
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0014 begin`);
      const id: string = 'model_id_' + 13;
      const text: string = 'model_text_' + 13;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 13, 'avatar_' + 13,
        text, 'image_' + 13, new ShareModel(13, 13 + 1, 13 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 13);
      expect(friend.avatar).assertEqual('avatar_' + 13);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 13);
      expect(friend.share.heart).assertEqual(13);
      expect(friend.share.star).assertEqual(13 + 1);
      expect(friend.share.message).assertEqual(13 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0014 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0015
     * @tc.name testModelContract0015
     * @tc.desc Verify ModelContract behavior for matrix index 14
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0015 begin`);
      const id: string = 'model_id_' + 14;
      const text: string = 'model_text_' + 14;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 14, 'avatar_' + 14,
        text, 'image_' + 14, new ShareModel(14, 14 + 1, 14 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 14);
      expect(friend.avatar).assertEqual('avatar_' + 14);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 14);
      expect(friend.share.heart).assertEqual(14);
      expect(friend.share.star).assertEqual(14 + 1);
      expect(friend.share.message).assertEqual(14 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0015 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0016
     * @tc.name testModelContract0016
     * @tc.desc Verify ModelContract behavior for matrix index 15
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0016 begin`);
      const id: string = 'model_id_' + 15;
      const text: string = 'model_text_' + 15;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 15, 'avatar_' + 15,
        text, 'image_' + 15, new ShareModel(15, 15 + 1, 15 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 15);
      expect(friend.avatar).assertEqual('avatar_' + 15);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 15);
      expect(friend.share.heart).assertEqual(15);
      expect(friend.share.star).assertEqual(15 + 1);
      expect(friend.share.message).assertEqual(15 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0016 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0019
     * @tc.name testModelContract0019
     * @tc.desc Verify ModelContract behavior for matrix index 18
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0019 begin`);
      const id: string = 'model_id_' + 18;
      const text: string = 'model_text_' + 18;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 18, 'avatar_' + 18,
        text, 'image_' + 18, new ShareModel(18, 18 + 1, 18 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 18);
      expect(friend.avatar).assertEqual('avatar_' + 18);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 18);
      expect(friend.share.heart).assertEqual(18);
      expect(friend.share.star).assertEqual(18 + 1);
      expect(friend.share.message).assertEqual(18 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0019 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0020
     * @tc.name testModelContract0020
     * @tc.desc Verify ModelContract behavior for matrix index 19
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0020 begin`);
      const id: string = 'model_id_' + 19;
      const text: string = 'model_text_' + 19;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 19, 'avatar_' + 19,
        text, 'image_' + 19, new ShareModel(19, 19 + 1, 19 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 19);
      expect(friend.avatar).assertEqual('avatar_' + 19);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 19);
      expect(friend.share.heart).assertEqual(19);
      expect(friend.share.star).assertEqual(19 + 1);
      expect(friend.share.message).assertEqual(19 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0020 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0021
     * @tc.name testModelContract0021
     * @tc.desc Verify ModelContract behavior for matrix index 20
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0021 begin`);
      const id: string = 'model_id_' + 20;
      const text: string = 'model_text_' + 20;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 20, 'avatar_' + 20,
        text, 'image_' + 20, new ShareModel(20, 20 + 1, 20 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 20);
      expect(friend.avatar).assertEqual('avatar_' + 20);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 20);
      expect(friend.share.heart).assertEqual(20);
      expect(friend.share.star).assertEqual(20 + 1);
      expect(friend.share.message).assertEqual(20 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0021 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0026
     * @tc.name testModelContract0026
     * @tc.desc Verify ModelContract behavior for matrix index 25
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0026 begin`);
      const id: string = 'model_id_' + 25;
      const text: string = 'model_text_' + 25;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 25, 'avatar_' + 25,
        text, 'image_' + 25, new ShareModel(25, 25 + 1, 25 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 25);
      expect(friend.avatar).assertEqual('avatar_' + 25);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 25);
      expect(friend.share.heart).assertEqual(25);
      expect(friend.share.star).assertEqual(25 + 1);
      expect(friend.share.message).assertEqual(25 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0026 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0032
     * @tc.name testModelContract0032
     * @tc.desc Verify ModelContract behavior for matrix index 31
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0032 begin`);
      const id: string = 'model_id_' + 31;
      const text: string = 'model_text_' + 31;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 31, 'avatar_' + 31,
        text, 'image_' + 31, new ShareModel(31, 31 + 1, 31 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 31);
      expect(friend.avatar).assertEqual('avatar_' + 31);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 31);
      expect(friend.share.heart).assertEqual(31);
      expect(friend.share.star).assertEqual(31 + 1);
      expect(friend.share.message).assertEqual(31 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0032 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0040
     * @tc.name testModelContract0040
     * @tc.desc Verify ModelContract behavior for matrix index 39
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0040 begin`);
      const id: string = 'model_id_' + 39;
      const text: string = 'model_text_' + 39;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 39, 'avatar_' + 39,
        text, 'image_' + 39, new ShareModel(39, 39 + 1, 39 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 39);
      expect(friend.avatar).assertEqual('avatar_' + 39);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 39);
      expect(friend.share.heart).assertEqual(39);
      expect(friend.share.star).assertEqual(39 + 1);
      expect(friend.share.message).assertEqual(39 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0040 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0064
     * @tc.name testModelContract0064
     * @tc.desc Verify ModelContract behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0064 begin`);
      const id: string = 'model_id_' + 63;
      const text: string = 'model_text_' + 63;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 63, 'avatar_' + 63,
        text, 'image_' + 63, new ShareModel(63, 63 + 1, 63 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 63);
      expect(friend.avatar).assertEqual('avatar_' + 63);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 63);
      expect(friend.share.heart).assertEqual(63);
      expect(friend.share.star).assertEqual(63 + 1);
      expect(friend.share.message).assertEqual(63 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0064 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0065
     * @tc.name testModelContract0065
     * @tc.desc Verify ModelContract behavior for matrix index 64
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0065 begin`);
      const id: string = 'model_id_' + 64;
      const text: string = 'model_text_' + 64;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 64, 'avatar_' + 64,
        text, 'image_' + 64, new ShareModel(64, 64 + 1, 64 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 64);
      expect(friend.avatar).assertEqual('avatar_' + 64);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 64);
      expect(friend.share.heart).assertEqual(64);
      expect(friend.share.star).assertEqual(64 + 1);
      expect(friend.share.message).assertEqual(64 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0065 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0128
     * @tc.name testModelContract0128
     * @tc.desc Verify ModelContract behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0128 begin`);
      const id: string = 'model_id_' + 127;
      const text: string = 'model_text_' + 127;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 127, 'avatar_' + 127,
        text, 'image_' + 127, new ShareModel(127, 127 + 1, 127 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 127);
      expect(friend.avatar).assertEqual('avatar_' + 127);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 127);
      expect(friend.share.heart).assertEqual(127);
      expect(friend.share.star).assertEqual(127 + 1);
      expect(friend.share.message).assertEqual(127 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0128 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0129
     * @tc.name testModelContract0129
     * @tc.desc Verify ModelContract behavior for matrix index 128
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0129 begin`);
      const id: string = 'model_id_' + 128;
      const text: string = 'model_text_' + 128;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 128, 'avatar_' + 128,
        text, 'image_' + 128, new ShareModel(128, 128 + 1, 128 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 128);
      expect(friend.avatar).assertEqual('avatar_' + 128);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 128);
      expect(friend.share.heart).assertEqual(128);
      expect(friend.share.star).assertEqual(128 + 1);
      expect(friend.share.message).assertEqual(128 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0129 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0192
     * @tc.name testModelContract0192
     * @tc.desc Verify ModelContract behavior for matrix index 191
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0192 begin`);
      const id: string = 'model_id_' + 191;
      const text: string = 'model_text_' + 191;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 191, 'avatar_' + 191,
        text, 'image_' + 191, new ShareModel(191, 191 + 1, 191 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 191);
      expect(friend.avatar).assertEqual('avatar_' + 191);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 191);
      expect(friend.share.heart).assertEqual(191);
      expect(friend.share.star).assertEqual(191 + 1);
      expect(friend.share.message).assertEqual(191 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0192 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0255
     * @tc.name testModelContract0255
     * @tc.desc Verify ModelContract behavior for matrix index 254
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0255 begin`);
      const id: string = 'model_id_' + 254;
      const text: string = 'model_text_' + 254;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 254, 'avatar_' + 254,
        text, 'image_' + 254, new ShareModel(254, 254 + 1, 254 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 254);
      expect(friend.avatar).assertEqual('avatar_' + 254);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 254);
      expect(friend.share.heart).assertEqual(254);
      expect(friend.share.star).assertEqual(254 + 1);
      expect(friend.share.message).assertEqual(254 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0255 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_0256
     * @tc.name testModelContract0256
     * @tc.desc Verify ModelContract behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testModelContract0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0256 begin`);
      const id: string = 'model_id_' + 255;
      const text: string = 'model_text_' + 255;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + 255, 'avatar_' + 255,
        text, 'image_' + 255, new ShareModel(255, 255 + 1, 255 + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + 255);
      expect(friend.avatar).assertEqual('avatar_' + 255);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + 255);
      expect(friend.share.heart).assertEqual(255);
      expect(friend.share.star).assertEqual(255 + 1);
      expect(friend.share.message).assertEqual(255 + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `testModelContract0256 end`);
    });
  })
}
