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
const TAG: string = '[Sample_ComponentReuse_ModelContractExtended]';

export default function modelContractExtendedTest() {
  describe('modelContractExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0065
     * @tc.name      testModelContract0065
     * @tc.desc      Verify modelContract behavior for matrix index 64.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0065 begin');
      const index: number = 64;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0065 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0066
     * @tc.name      testModelContract0066
     * @tc.desc      Verify modelContract behavior for matrix index 65.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0066 begin');
      const index: number = 65;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0066 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0067
     * @tc.name      testModelContract0067
     * @tc.desc      Verify modelContract behavior for matrix index 66.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0067 begin');
      const index: number = 66;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0067 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0068
     * @tc.name      testModelContract0068
     * @tc.desc      Verify modelContract behavior for matrix index 67.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0068 begin');
      const index: number = 67;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0068 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0069
     * @tc.name      testModelContract0069
     * @tc.desc      Verify modelContract behavior for matrix index 68.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0069 begin');
      const index: number = 68;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0069 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0070
     * @tc.name      testModelContract0070
     * @tc.desc      Verify modelContract behavior for matrix index 69.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0070 begin');
      const index: number = 69;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0070 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0071
     * @tc.name      testModelContract0071
     * @tc.desc      Verify modelContract behavior for matrix index 70.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0071 begin');
      const index: number = 70;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0071 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0072
     * @tc.name      testModelContract0072
     * @tc.desc      Verify modelContract behavior for matrix index 71.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0072 begin');
      const index: number = 71;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0072 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0073
     * @tc.name      testModelContract0073
     * @tc.desc      Verify modelContract behavior for matrix index 72.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0073 begin');
      const index: number = 72;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0073 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0074
     * @tc.name      testModelContract0074
     * @tc.desc      Verify modelContract behavior for matrix index 73.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0074 begin');
      const index: number = 73;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0074 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0075
     * @tc.name      testModelContract0075
     * @tc.desc      Verify modelContract behavior for matrix index 74.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0075 begin');
      const index: number = 74;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0075 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0076
     * @tc.name      testModelContract0076
     * @tc.desc      Verify modelContract behavior for matrix index 75.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0076 begin');
      const index: number = 75;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0076 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0077
     * @tc.name      testModelContract0077
     * @tc.desc      Verify modelContract behavior for matrix index 76.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0077 begin');
      const index: number = 76;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0077 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0078
     * @tc.name      testModelContract0078
     * @tc.desc      Verify modelContract behavior for matrix index 77.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0078 begin');
      const index: number = 77;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0078 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0079
     * @tc.name      testModelContract0079
     * @tc.desc      Verify modelContract behavior for matrix index 78.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0079 begin');
      const index: number = 78;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0079 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0080
     * @tc.name      testModelContract0080
     * @tc.desc      Verify modelContract behavior for matrix index 79.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0080 begin');
      const index: number = 79;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0080 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0081
     * @tc.name      testModelContract0081
     * @tc.desc      Verify modelContract behavior for matrix index 80.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0081 begin');
      const index: number = 80;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0081 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0082
     * @tc.name      testModelContract0082
     * @tc.desc      Verify modelContract behavior for matrix index 81.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0082 begin');
      const index: number = 81;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0082 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0083
     * @tc.name      testModelContract0083
     * @tc.desc      Verify modelContract behavior for matrix index 82.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0083 begin');
      const index: number = 82;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0083 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0084
     * @tc.name      testModelContract0084
     * @tc.desc      Verify modelContract behavior for matrix index 83.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0084 begin');
      const index: number = 83;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0084 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0085
     * @tc.name      testModelContract0085
     * @tc.desc      Verify modelContract behavior for matrix index 84.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0085 begin');
      const index: number = 84;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0085 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0086
     * @tc.name      testModelContract0086
     * @tc.desc      Verify modelContract behavior for matrix index 85.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0086 begin');
      const index: number = 85;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0086 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0087
     * @tc.name      testModelContract0087
     * @tc.desc      Verify modelContract behavior for matrix index 86.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0087 begin');
      const index: number = 86;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0087 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0088
     * @tc.name      testModelContract0088
     * @tc.desc      Verify modelContract behavior for matrix index 87.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0088 begin');
      const index: number = 87;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0088 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0089
     * @tc.name      testModelContract0089
     * @tc.desc      Verify modelContract behavior for matrix index 88.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0089 begin');
      const index: number = 88;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0089 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0090
     * @tc.name      testModelContract0090
     * @tc.desc      Verify modelContract behavior for matrix index 89.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0090 begin');
      const index: number = 89;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0090 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0091
     * @tc.name      testModelContract0091
     * @tc.desc      Verify modelContract behavior for matrix index 90.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0091 begin');
      const index: number = 90;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0091 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0092
     * @tc.name      testModelContract0092
     * @tc.desc      Verify modelContract behavior for matrix index 91.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0092 begin');
      const index: number = 91;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0092 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0093
     * @tc.name      testModelContract0093
     * @tc.desc      Verify modelContract behavior for matrix index 92.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0093 begin');
      const index: number = 92;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0093 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0094
     * @tc.name      testModelContract0094
     * @tc.desc      Verify modelContract behavior for matrix index 93.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0094 begin');
      const index: number = 93;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0094 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0095
     * @tc.name      testModelContract0095
     * @tc.desc      Verify modelContract behavior for matrix index 94.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0095 begin');
      const index: number = 94;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0095 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0096
     * @tc.name      testModelContract0096
     * @tc.desc      Verify modelContract behavior for matrix index 95.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0096 begin');
      const index: number = 95;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0096 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0097
     * @tc.name      testModelContract0097
     * @tc.desc      Verify modelContract behavior for matrix index 96.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0097 begin');
      const index: number = 96;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0097 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0098
     * @tc.name      testModelContract0098
     * @tc.desc      Verify modelContract behavior for matrix index 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0098 begin');
      const index: number = 97;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0098 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0099
     * @tc.name      testModelContract0099
     * @tc.desc      Verify modelContract behavior for matrix index 98.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0099 begin');
      const index: number = 98;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0099 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0100
     * @tc.name      testModelContract0100
     * @tc.desc      Verify modelContract behavior for matrix index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0100 begin');
      const index: number = 99;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0100 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0101
     * @tc.name      testModelContract0101
     * @tc.desc      Verify modelContract behavior for matrix index 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0101 begin');
      const index: number = 100;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0101 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0102
     * @tc.name      testModelContract0102
     * @tc.desc      Verify modelContract behavior for matrix index 101.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0102 begin');
      const index: number = 101;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0102 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0103
     * @tc.name      testModelContract0103
     * @tc.desc      Verify modelContract behavior for matrix index 102.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0103 begin');
      const index: number = 102;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0103 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0104
     * @tc.name      testModelContract0104
     * @tc.desc      Verify modelContract behavior for matrix index 103.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0104 begin');
      const index: number = 103;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0104 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0105
     * @tc.name      testModelContract0105
     * @tc.desc      Verify modelContract behavior for matrix index 104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0105 begin');
      const index: number = 104;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0105 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0106
     * @tc.name      testModelContract0106
     * @tc.desc      Verify modelContract behavior for matrix index 105.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0106 begin');
      const index: number = 105;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0106 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0107
     * @tc.name      testModelContract0107
     * @tc.desc      Verify modelContract behavior for matrix index 106.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0107 begin');
      const index: number = 106;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0107 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0108
     * @tc.name      testModelContract0108
     * @tc.desc      Verify modelContract behavior for matrix index 107.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0108 begin');
      const index: number = 107;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0108 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0109
     * @tc.name      testModelContract0109
     * @tc.desc      Verify modelContract behavior for matrix index 108.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0109 begin');
      const index: number = 108;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0109 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0110
     * @tc.name      testModelContract0110
     * @tc.desc      Verify modelContract behavior for matrix index 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0110 begin');
      const index: number = 109;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0110 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0111
     * @tc.name      testModelContract0111
     * @tc.desc      Verify modelContract behavior for matrix index 110.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0111 begin');
      const index: number = 110;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0111 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0112
     * @tc.name      testModelContract0112
     * @tc.desc      Verify modelContract behavior for matrix index 111.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0112 begin');
      const index: number = 111;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0112 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0113
     * @tc.name      testModelContract0113
     * @tc.desc      Verify modelContract behavior for matrix index 112.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0113 begin');
      const index: number = 112;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0113 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0114
     * @tc.name      testModelContract0114
     * @tc.desc      Verify modelContract behavior for matrix index 113.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0114 begin');
      const index: number = 113;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0114 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0115
     * @tc.name      testModelContract0115
     * @tc.desc      Verify modelContract behavior for matrix index 114.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0115 begin');
      const index: number = 114;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0115 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0116
     * @tc.name      testModelContract0116
     * @tc.desc      Verify modelContract behavior for matrix index 115.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0116 begin');
      const index: number = 115;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0116 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0117
     * @tc.name      testModelContract0117
     * @tc.desc      Verify modelContract behavior for matrix index 116.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0117 begin');
      const index: number = 116;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0117 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0118
     * @tc.name      testModelContract0118
     * @tc.desc      Verify modelContract behavior for matrix index 117.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0118 begin');
      const index: number = 117;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0118 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0119
     * @tc.name      testModelContract0119
     * @tc.desc      Verify modelContract behavior for matrix index 118.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0119 begin');
      const index: number = 118;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0119 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0120
     * @tc.name      testModelContract0120
     * @tc.desc      Verify modelContract behavior for matrix index 119.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0120 begin');
      const index: number = 119;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0120 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0121
     * @tc.name      testModelContract0121
     * @tc.desc      Verify modelContract behavior for matrix index 120.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0121 begin');
      const index: number = 120;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0121 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0122
     * @tc.name      testModelContract0122
     * @tc.desc      Verify modelContract behavior for matrix index 121.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0122 begin');
      const index: number = 121;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0122 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0123
     * @tc.name      testModelContract0123
     * @tc.desc      Verify modelContract behavior for matrix index 122.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0123 begin');
      const index: number = 122;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0123 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0124
     * @tc.name      testModelContract0124
     * @tc.desc      Verify modelContract behavior for matrix index 123.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0124 begin');
      const index: number = 123;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0124 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0125
     * @tc.name      testModelContract0125
     * @tc.desc      Verify modelContract behavior for matrix index 124.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0125 begin');
      const index: number = 124;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0125 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0126
     * @tc.name      testModelContract0126
     * @tc.desc      Verify modelContract behavior for matrix index 125.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0126 begin');
      const index: number = 125;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0126 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0127
     * @tc.name      testModelContract0127
     * @tc.desc      Verify modelContract behavior for matrix index 126.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0127 begin');
      const index: number = 126;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0127 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0128
     * @tc.name      testModelContract0128
     * @tc.desc      Verify modelContract behavior for matrix index 127.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0128 begin');
      const index: number = 127;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0128 end');
    })

  })
}
