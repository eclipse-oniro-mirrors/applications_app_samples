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
const TAG: string = '[Sample_ComponentReuse_ModelContractAdvanced]';

export default function modelContractAdvancedTest() {
  describe('modelContractAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0129
     * @tc.name      testModelContract0129
     * @tc.desc      Verify modelContract behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0129 begin');
      const index: number = 128;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0129 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0130
     * @tc.name      testModelContract0130
     * @tc.desc      Verify modelContract behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0130 begin');
      const index: number = 129;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0130 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0131
     * @tc.name      testModelContract0131
     * @tc.desc      Verify modelContract behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0131 begin');
      const index: number = 130;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0131 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0132
     * @tc.name      testModelContract0132
     * @tc.desc      Verify modelContract behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0132 begin');
      const index: number = 131;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0132 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0133
     * @tc.name      testModelContract0133
     * @tc.desc      Verify modelContract behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0133 begin');
      const index: number = 132;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0133 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0134
     * @tc.name      testModelContract0134
     * @tc.desc      Verify modelContract behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0134 begin');
      const index: number = 133;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0134 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0135
     * @tc.name      testModelContract0135
     * @tc.desc      Verify modelContract behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0135 begin');
      const index: number = 134;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0135 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0136
     * @tc.name      testModelContract0136
     * @tc.desc      Verify modelContract behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0136 begin');
      const index: number = 135;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0136 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0137
     * @tc.name      testModelContract0137
     * @tc.desc      Verify modelContract behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0137 begin');
      const index: number = 136;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0137 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0138
     * @tc.name      testModelContract0138
     * @tc.desc      Verify modelContract behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0138 begin');
      const index: number = 137;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0138 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0139
     * @tc.name      testModelContract0139
     * @tc.desc      Verify modelContract behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0139 begin');
      const index: number = 138;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0139 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0140
     * @tc.name      testModelContract0140
     * @tc.desc      Verify modelContract behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0140 begin');
      const index: number = 139;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0140 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0141
     * @tc.name      testModelContract0141
     * @tc.desc      Verify modelContract behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0141 begin');
      const index: number = 140;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0141 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0142
     * @tc.name      testModelContract0142
     * @tc.desc      Verify modelContract behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0142 begin');
      const index: number = 141;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0142 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0143
     * @tc.name      testModelContract0143
     * @tc.desc      Verify modelContract behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0143 begin');
      const index: number = 142;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0143 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0144
     * @tc.name      testModelContract0144
     * @tc.desc      Verify modelContract behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0144 begin');
      const index: number = 143;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0144 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0145
     * @tc.name      testModelContract0145
     * @tc.desc      Verify modelContract behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0145 begin');
      const index: number = 144;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0145 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0146
     * @tc.name      testModelContract0146
     * @tc.desc      Verify modelContract behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0146 begin');
      const index: number = 145;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0146 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0147
     * @tc.name      testModelContract0147
     * @tc.desc      Verify modelContract behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0147 begin');
      const index: number = 146;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0147 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0148
     * @tc.name      testModelContract0148
     * @tc.desc      Verify modelContract behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0148 begin');
      const index: number = 147;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0148 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0149
     * @tc.name      testModelContract0149
     * @tc.desc      Verify modelContract behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0149 begin');
      const index: number = 148;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0149 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0150
     * @tc.name      testModelContract0150
     * @tc.desc      Verify modelContract behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0150 begin');
      const index: number = 149;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0150 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0151
     * @tc.name      testModelContract0151
     * @tc.desc      Verify modelContract behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0151 begin');
      const index: number = 150;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0151 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0152
     * @tc.name      testModelContract0152
     * @tc.desc      Verify modelContract behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0152 begin');
      const index: number = 151;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0152 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0153
     * @tc.name      testModelContract0153
     * @tc.desc      Verify modelContract behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0153 begin');
      const index: number = 152;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0153 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0154
     * @tc.name      testModelContract0154
     * @tc.desc      Verify modelContract behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0154 begin');
      const index: number = 153;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0154 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0155
     * @tc.name      testModelContract0155
     * @tc.desc      Verify modelContract behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0155 begin');
      const index: number = 154;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0155 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0156
     * @tc.name      testModelContract0156
     * @tc.desc      Verify modelContract behavior for matrix index 155.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0156 begin');
      const index: number = 155;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0156 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0157
     * @tc.name      testModelContract0157
     * @tc.desc      Verify modelContract behavior for matrix index 156.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0157 begin');
      const index: number = 156;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0157 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0158
     * @tc.name      testModelContract0158
     * @tc.desc      Verify modelContract behavior for matrix index 157.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0158 begin');
      const index: number = 157;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0158 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0159
     * @tc.name      testModelContract0159
     * @tc.desc      Verify modelContract behavior for matrix index 158.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0159 begin');
      const index: number = 158;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0159 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0160
     * @tc.name      testModelContract0160
     * @tc.desc      Verify modelContract behavior for matrix index 159.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0160 begin');
      const index: number = 159;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0160 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0161
     * @tc.name      testModelContract0161
     * @tc.desc      Verify modelContract behavior for matrix index 160.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0161 begin');
      const index: number = 160;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0161 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0162
     * @tc.name      testModelContract0162
     * @tc.desc      Verify modelContract behavior for matrix index 161.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0162 begin');
      const index: number = 161;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0162 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0163
     * @tc.name      testModelContract0163
     * @tc.desc      Verify modelContract behavior for matrix index 162.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0163 begin');
      const index: number = 162;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0163 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0164
     * @tc.name      testModelContract0164
     * @tc.desc      Verify modelContract behavior for matrix index 163.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0164 begin');
      const index: number = 163;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0164 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0165
     * @tc.name      testModelContract0165
     * @tc.desc      Verify modelContract behavior for matrix index 164.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0165 begin');
      const index: number = 164;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0165 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0166
     * @tc.name      testModelContract0166
     * @tc.desc      Verify modelContract behavior for matrix index 165.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0166 begin');
      const index: number = 165;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0166 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0167
     * @tc.name      testModelContract0167
     * @tc.desc      Verify modelContract behavior for matrix index 166.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0167 begin');
      const index: number = 166;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0167 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0168
     * @tc.name      testModelContract0168
     * @tc.desc      Verify modelContract behavior for matrix index 167.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0168 begin');
      const index: number = 167;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0168 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0169
     * @tc.name      testModelContract0169
     * @tc.desc      Verify modelContract behavior for matrix index 168.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0169 begin');
      const index: number = 168;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0169 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0170
     * @tc.name      testModelContract0170
     * @tc.desc      Verify modelContract behavior for matrix index 169.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0170 begin');
      const index: number = 169;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0170 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0171
     * @tc.name      testModelContract0171
     * @tc.desc      Verify modelContract behavior for matrix index 170.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0171 begin');
      const index: number = 170;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0171 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0172
     * @tc.name      testModelContract0172
     * @tc.desc      Verify modelContract behavior for matrix index 171.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0172 begin');
      const index: number = 171;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0172 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0173
     * @tc.name      testModelContract0173
     * @tc.desc      Verify modelContract behavior for matrix index 172.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0173 begin');
      const index: number = 172;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0173 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0174
     * @tc.name      testModelContract0174
     * @tc.desc      Verify modelContract behavior for matrix index 173.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0174 begin');
      const index: number = 173;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0174 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0175
     * @tc.name      testModelContract0175
     * @tc.desc      Verify modelContract behavior for matrix index 174.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0175 begin');
      const index: number = 174;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0175 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0176
     * @tc.name      testModelContract0176
     * @tc.desc      Verify modelContract behavior for matrix index 175.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0176 begin');
      const index: number = 175;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0176 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0177
     * @tc.name      testModelContract0177
     * @tc.desc      Verify modelContract behavior for matrix index 176.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0177 begin');
      const index: number = 176;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0177 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0178
     * @tc.name      testModelContract0178
     * @tc.desc      Verify modelContract behavior for matrix index 177.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0178 begin');
      const index: number = 177;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0178 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0179
     * @tc.name      testModelContract0179
     * @tc.desc      Verify modelContract behavior for matrix index 178.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0179 begin');
      const index: number = 178;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0179 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0180
     * @tc.name      testModelContract0180
     * @tc.desc      Verify modelContract behavior for matrix index 179.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0180 begin');
      const index: number = 179;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0180 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0181
     * @tc.name      testModelContract0181
     * @tc.desc      Verify modelContract behavior for matrix index 180.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0181 begin');
      const index: number = 180;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0181 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0182
     * @tc.name      testModelContract0182
     * @tc.desc      Verify modelContract behavior for matrix index 181.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0182 begin');
      const index: number = 181;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0182 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0183
     * @tc.name      testModelContract0183
     * @tc.desc      Verify modelContract behavior for matrix index 182.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0183 begin');
      const index: number = 182;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0183 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0184
     * @tc.name      testModelContract0184
     * @tc.desc      Verify modelContract behavior for matrix index 183.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0184 begin');
      const index: number = 183;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0184 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0185
     * @tc.name      testModelContract0185
     * @tc.desc      Verify modelContract behavior for matrix index 184.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0185 begin');
      const index: number = 184;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0185 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0186
     * @tc.name      testModelContract0186
     * @tc.desc      Verify modelContract behavior for matrix index 185.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0186 begin');
      const index: number = 185;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0186 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0187
     * @tc.name      testModelContract0187
     * @tc.desc      Verify modelContract behavior for matrix index 186.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0187 begin');
      const index: number = 186;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0187 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0188
     * @tc.name      testModelContract0188
     * @tc.desc      Verify modelContract behavior for matrix index 187.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0188 begin');
      const index: number = 187;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0188 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0189
     * @tc.name      testModelContract0189
     * @tc.desc      Verify modelContract behavior for matrix index 188.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0189 begin');
      const index: number = 188;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0189 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0190
     * @tc.name      testModelContract0190
     * @tc.desc      Verify modelContract behavior for matrix index 189.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0190 begin');
      const index: number = 189;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0190 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0191
     * @tc.name      testModelContract0191
     * @tc.desc      Verify modelContract behavior for matrix index 190.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0191 begin');
      const index: number = 190;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0191 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0192
     * @tc.name      testModelContract0192
     * @tc.desc      Verify modelContract behavior for matrix index 191.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0192 begin');
      const index: number = 191;
      const id: string = 'model_id_' + index;
      const text: string = 'model_text_' + index;
      const friend: FriendMoment = new FriendMoment(id, 'user_' + index, 'avatar_' + index,
        text, 'image_' + index, new ShareModel(index, index + 1, index + 2));
      expect(friend.id).assertEqual(id);
      expect(friend.userName).assertEqual('user_' + index);
      expect(friend.avatar).assertEqual('avatar_' + index);
      expect(friend.text).assertEqual(text);
      expect(friend.image).assertEqual('image_' + index);
      expect(friend.share.heart).assertEqual(index);
      expect(friend.share.star).assertEqual(index + 1);
      expect(friend.share.message).assertEqual(index + 2);
      const color: ColorModel = new ColorModel(id, text, Color.Green);
      expect(color.id).assertEqual(id);
      expect(color.text).assertEqual(text);
      expect(color.color).assertEqual(Color.Green);
      const second: FriendMoment = new FriendMoment(id + '_second', 'user_second', 'avatar_second',
        'text_second', 'image_second', new ShareModel(1, 2, 3));
      expect(second.id).assertEqual(id + '_second');
      expect(friend.id).assertEqual(id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0192 end');
    })

  })
}
