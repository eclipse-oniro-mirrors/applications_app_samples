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
const TAG: string = '[Sample_ComponentReuse_ModelContractTail]';

export default function modelContractTailTest() {
  describe('modelContractTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0193
     * @tc.name      testModelContract0193
     * @tc.desc      Verify modelContract behavior for matrix index 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0193 begin');
      const index: number = 192;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0193 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0194
     * @tc.name      testModelContract0194
     * @tc.desc      Verify modelContract behavior for matrix index 193.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0194 begin');
      const index: number = 193;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0194 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0195
     * @tc.name      testModelContract0195
     * @tc.desc      Verify modelContract behavior for matrix index 194.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0195 begin');
      const index: number = 194;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0195 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0196
     * @tc.name      testModelContract0196
     * @tc.desc      Verify modelContract behavior for matrix index 195.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0196 begin');
      const index: number = 195;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0196 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0197
     * @tc.name      testModelContract0197
     * @tc.desc      Verify modelContract behavior for matrix index 196.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0197 begin');
      const index: number = 196;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0197 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0198
     * @tc.name      testModelContract0198
     * @tc.desc      Verify modelContract behavior for matrix index 197.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0198 begin');
      const index: number = 197;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0198 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0199
     * @tc.name      testModelContract0199
     * @tc.desc      Verify modelContract behavior for matrix index 198.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0199 begin');
      const index: number = 198;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0199 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0200
     * @tc.name      testModelContract0200
     * @tc.desc      Verify modelContract behavior for matrix index 199.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0200 begin');
      const index: number = 199;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0200 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0201
     * @tc.name      testModelContract0201
     * @tc.desc      Verify modelContract behavior for matrix index 200.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0201 begin');
      const index: number = 200;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0201 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0202
     * @tc.name      testModelContract0202
     * @tc.desc      Verify modelContract behavior for matrix index 201.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0202 begin');
      const index: number = 201;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0202 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0203
     * @tc.name      testModelContract0203
     * @tc.desc      Verify modelContract behavior for matrix index 202.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0203 begin');
      const index: number = 202;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0203 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0204
     * @tc.name      testModelContract0204
     * @tc.desc      Verify modelContract behavior for matrix index 203.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0204 begin');
      const index: number = 203;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0204 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0205
     * @tc.name      testModelContract0205
     * @tc.desc      Verify modelContract behavior for matrix index 204.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0205 begin');
      const index: number = 204;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0205 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0206
     * @tc.name      testModelContract0206
     * @tc.desc      Verify modelContract behavior for matrix index 205.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0206 begin');
      const index: number = 205;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0206 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0207
     * @tc.name      testModelContract0207
     * @tc.desc      Verify modelContract behavior for matrix index 206.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0207 begin');
      const index: number = 206;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0207 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0208
     * @tc.name      testModelContract0208
     * @tc.desc      Verify modelContract behavior for matrix index 207.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0208 begin');
      const index: number = 207;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0208 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0209
     * @tc.name      testModelContract0209
     * @tc.desc      Verify modelContract behavior for matrix index 208.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0209 begin');
      const index: number = 208;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0209 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0210
     * @tc.name      testModelContract0210
     * @tc.desc      Verify modelContract behavior for matrix index 209.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0210 begin');
      const index: number = 209;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0210 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0211
     * @tc.name      testModelContract0211
     * @tc.desc      Verify modelContract behavior for matrix index 210.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0211 begin');
      const index: number = 210;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0211 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0212
     * @tc.name      testModelContract0212
     * @tc.desc      Verify modelContract behavior for matrix index 211.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0212 begin');
      const index: number = 211;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0212 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0213
     * @tc.name      testModelContract0213
     * @tc.desc      Verify modelContract behavior for matrix index 212.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0213 begin');
      const index: number = 212;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0213 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0214
     * @tc.name      testModelContract0214
     * @tc.desc      Verify modelContract behavior for matrix index 213.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0214 begin');
      const index: number = 213;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0214 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0215
     * @tc.name      testModelContract0215
     * @tc.desc      Verify modelContract behavior for matrix index 214.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0215 begin');
      const index: number = 214;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0215 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0216
     * @tc.name      testModelContract0216
     * @tc.desc      Verify modelContract behavior for matrix index 215.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0216 begin');
      const index: number = 215;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0216 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0217
     * @tc.name      testModelContract0217
     * @tc.desc      Verify modelContract behavior for matrix index 216.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0217 begin');
      const index: number = 216;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0217 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0218
     * @tc.name      testModelContract0218
     * @tc.desc      Verify modelContract behavior for matrix index 217.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0218 begin');
      const index: number = 217;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0218 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0219
     * @tc.name      testModelContract0219
     * @tc.desc      Verify modelContract behavior for matrix index 218.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0219 begin');
      const index: number = 218;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0219 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0220
     * @tc.name      testModelContract0220
     * @tc.desc      Verify modelContract behavior for matrix index 219.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0220 begin');
      const index: number = 219;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0220 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0221
     * @tc.name      testModelContract0221
     * @tc.desc      Verify modelContract behavior for matrix index 220.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0221 begin');
      const index: number = 220;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0221 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0222
     * @tc.name      testModelContract0222
     * @tc.desc      Verify modelContract behavior for matrix index 221.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0222 begin');
      const index: number = 221;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0222 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0223
     * @tc.name      testModelContract0223
     * @tc.desc      Verify modelContract behavior for matrix index 222.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0223 begin');
      const index: number = 222;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0223 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0224
     * @tc.name      testModelContract0224
     * @tc.desc      Verify modelContract behavior for matrix index 223.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0224 begin');
      const index: number = 223;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0224 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0225
     * @tc.name      testModelContract0225
     * @tc.desc      Verify modelContract behavior for matrix index 224.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0225 begin');
      const index: number = 224;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0225 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0226
     * @tc.name      testModelContract0226
     * @tc.desc      Verify modelContract behavior for matrix index 225.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0226 begin');
      const index: number = 225;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0226 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0227
     * @tc.name      testModelContract0227
     * @tc.desc      Verify modelContract behavior for matrix index 226.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0227 begin');
      const index: number = 226;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0227 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0228
     * @tc.name      testModelContract0228
     * @tc.desc      Verify modelContract behavior for matrix index 227.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0228 begin');
      const index: number = 227;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0228 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0229
     * @tc.name      testModelContract0229
     * @tc.desc      Verify modelContract behavior for matrix index 228.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0229 begin');
      const index: number = 228;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0229 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0230
     * @tc.name      testModelContract0230
     * @tc.desc      Verify modelContract behavior for matrix index 229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0230 begin');
      const index: number = 229;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0230 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0231
     * @tc.name      testModelContract0231
     * @tc.desc      Verify modelContract behavior for matrix index 230.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0231 begin');
      const index: number = 230;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0231 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0232
     * @tc.name      testModelContract0232
     * @tc.desc      Verify modelContract behavior for matrix index 231.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0232 begin');
      const index: number = 231;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0232 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0233
     * @tc.name      testModelContract0233
     * @tc.desc      Verify modelContract behavior for matrix index 232.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0233 begin');
      const index: number = 232;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0233 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0234
     * @tc.name      testModelContract0234
     * @tc.desc      Verify modelContract behavior for matrix index 233.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0234 begin');
      const index: number = 233;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0234 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0235
     * @tc.name      testModelContract0235
     * @tc.desc      Verify modelContract behavior for matrix index 234.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0235 begin');
      const index: number = 234;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0235 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0236
     * @tc.name      testModelContract0236
     * @tc.desc      Verify modelContract behavior for matrix index 235.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0236 begin');
      const index: number = 235;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0236 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0237
     * @tc.name      testModelContract0237
     * @tc.desc      Verify modelContract behavior for matrix index 236.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0237 begin');
      const index: number = 236;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0237 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0238
     * @tc.name      testModelContract0238
     * @tc.desc      Verify modelContract behavior for matrix index 237.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0238 begin');
      const index: number = 237;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0238 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0239
     * @tc.name      testModelContract0239
     * @tc.desc      Verify modelContract behavior for matrix index 238.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0239 begin');
      const index: number = 238;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0239 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0240
     * @tc.name      testModelContract0240
     * @tc.desc      Verify modelContract behavior for matrix index 239.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0240 begin');
      const index: number = 239;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0240 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0241
     * @tc.name      testModelContract0241
     * @tc.desc      Verify modelContract behavior for matrix index 240.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0241 begin');
      const index: number = 240;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0241 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0242
     * @tc.name      testModelContract0242
     * @tc.desc      Verify modelContract behavior for matrix index 241.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0242 begin');
      const index: number = 241;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0242 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0243
     * @tc.name      testModelContract0243
     * @tc.desc      Verify modelContract behavior for matrix index 242.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0243 begin');
      const index: number = 242;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0243 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0244
     * @tc.name      testModelContract0244
     * @tc.desc      Verify modelContract behavior for matrix index 243.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0244 begin');
      const index: number = 243;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0244 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0245
     * @tc.name      testModelContract0245
     * @tc.desc      Verify modelContract behavior for matrix index 244.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0245 begin');
      const index: number = 244;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0245 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0246
     * @tc.name      testModelContract0246
     * @tc.desc      Verify modelContract behavior for matrix index 245.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0246 begin');
      const index: number = 245;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0246 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0247
     * @tc.name      testModelContract0247
     * @tc.desc      Verify modelContract behavior for matrix index 246.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0247 begin');
      const index: number = 246;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0247 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0248
     * @tc.name      testModelContract0248
     * @tc.desc      Verify modelContract behavior for matrix index 247.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0248 begin');
      const index: number = 247;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0248 end');
    })

 
  })
}
