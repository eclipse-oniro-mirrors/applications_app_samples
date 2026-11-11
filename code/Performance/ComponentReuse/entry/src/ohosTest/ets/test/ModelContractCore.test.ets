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
const TAG: string = '[Sample_ComponentReuse_ModelContractCore]';

export default function modelContractCoreTest() {
  describe('modelContractCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0001
     * @tc.name      testModelContract0001
     * @tc.desc      Verify modelContract behavior for matrix index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0001 begin');
      const index: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0001 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0002
     * @tc.name      testModelContract0002
     * @tc.desc      Verify modelContract behavior for matrix index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0002 begin');
      const index: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0002 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0003
     * @tc.name      testModelContract0003
     * @tc.desc      Verify modelContract behavior for matrix index 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0003 begin');
      const index: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0003 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0004
     * @tc.name      testModelContract0004
     * @tc.desc      Verify modelContract behavior for matrix index 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0004 begin');
      const index: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0004 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0005
     * @tc.name      testModelContract0005
     * @tc.desc      Verify modelContract behavior for matrix index 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0005 begin');
      const index: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0005 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0006
     * @tc.name      testModelContract0006
     * @tc.desc      Verify modelContract behavior for matrix index 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0006 begin');
      const index: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0006 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0007
     * @tc.name      testModelContract0007
     * @tc.desc      Verify modelContract behavior for matrix index 6.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0007 begin');
      const index: number = 6;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0007 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0008
     * @tc.name      testModelContract0008
     * @tc.desc      Verify modelContract behavior for matrix index 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0008 begin');
      const index: number = 7;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0008 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0009
     * @tc.name      testModelContract0009
     * @tc.desc      Verify modelContract behavior for matrix index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0009 begin');
      const index: number = 8;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0009 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0010
     * @tc.name      testModelContract0010
     * @tc.desc      Verify modelContract behavior for matrix index 9.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0010 begin');
      const index: number = 9;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0010 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0011
     * @tc.name      testModelContract0011
     * @tc.desc      Verify modelContract behavior for matrix index 10.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0011 begin');
      const index: number = 10;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0011 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0012
     * @tc.name      testModelContract0012
     * @tc.desc      Verify modelContract behavior for matrix index 11.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0012 begin');
      const index: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0012 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0013
     * @tc.name      testModelContract0013
     * @tc.desc      Verify modelContract behavior for matrix index 12.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0013 begin');
      const index: number = 12;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0013 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0014
     * @tc.name      testModelContract0014
     * @tc.desc      Verify modelContract behavior for matrix index 13.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0014 begin');
      const index: number = 13;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0014 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0015
     * @tc.name      testModelContract0015
     * @tc.desc      Verify modelContract behavior for matrix index 14.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0015 begin');
      const index: number = 14;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0015 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0016
     * @tc.name      testModelContract0016
     * @tc.desc      Verify modelContract behavior for matrix index 15.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0016 begin');
      const index: number = 15;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0016 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0017
     * @tc.name      testModelContract0017
     * @tc.desc      Verify modelContract behavior for matrix index 16.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0017 begin');
      const index: number = 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0017 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0018
     * @tc.name      testModelContract0018
     * @tc.desc      Verify modelContract behavior for matrix index 17.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0018 begin');
      const index: number = 17;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0018 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0019
     * @tc.name      testModelContract0019
     * @tc.desc      Verify modelContract behavior for matrix index 18.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0019 begin');
      const index: number = 18;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0019 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0020
     * @tc.name      testModelContract0020
     * @tc.desc      Verify modelContract behavior for matrix index 19.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0020 begin');
      const index: number = 19;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0020 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0021
     * @tc.name      testModelContract0021
     * @tc.desc      Verify modelContract behavior for matrix index 20.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0021 begin');
      const index: number = 20;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0021 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0022
     * @tc.name      testModelContract0022
     * @tc.desc      Verify modelContract behavior for matrix index 21.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0022 begin');
      const index: number = 21;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0022 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0023
     * @tc.name      testModelContract0023
     * @tc.desc      Verify modelContract behavior for matrix index 22.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0023 begin');
      const index: number = 22;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0023 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0024
     * @tc.name      testModelContract0024
     * @tc.desc      Verify modelContract behavior for matrix index 23.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0024 begin');
      const index: number = 23;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0024 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0025
     * @tc.name      testModelContract0025
     * @tc.desc      Verify modelContract behavior for matrix index 24.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0025 begin');
      const index: number = 24;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0025 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0026
     * @tc.name      testModelContract0026
     * @tc.desc      Verify modelContract behavior for matrix index 25.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0026 begin');
      const index: number = 25;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0026 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0027
     * @tc.name      testModelContract0027
     * @tc.desc      Verify modelContract behavior for matrix index 26.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0027 begin');
      const index: number = 26;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0027 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0028
     * @tc.name      testModelContract0028
     * @tc.desc      Verify modelContract behavior for matrix index 27.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0028 begin');
      const index: number = 27;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0028 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0029
     * @tc.name      testModelContract0029
     * @tc.desc      Verify modelContract behavior for matrix index 28.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0029 begin');
      const index: number = 28;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0029 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0030
     * @tc.name      testModelContract0030
     * @tc.desc      Verify modelContract behavior for matrix index 29.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0030 begin');
      const index: number = 29;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0030 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0031
     * @tc.name      testModelContract0031
     * @tc.desc      Verify modelContract behavior for matrix index 30.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0031 begin');
      const index: number = 30;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0031 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0032
     * @tc.name      testModelContract0032
     * @tc.desc      Verify modelContract behavior for matrix index 31.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0032 begin');
      const index: number = 31;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0032 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0033
     * @tc.name      testModelContract0033
     * @tc.desc      Verify modelContract behavior for matrix index 32.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0033 begin');
      const index: number = 32;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0033 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0034
     * @tc.name      testModelContract0034
     * @tc.desc      Verify modelContract behavior for matrix index 33.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0034 begin');
      const index: number = 33;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0034 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0035
     * @tc.name      testModelContract0035
     * @tc.desc      Verify modelContract behavior for matrix index 34.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0035 begin');
      const index: number = 34;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0035 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0036
     * @tc.name      testModelContract0036
     * @tc.desc      Verify modelContract behavior for matrix index 35.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0036 begin');
      const index: number = 35;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0036 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0037
     * @tc.name      testModelContract0037
     * @tc.desc      Verify modelContract behavior for matrix index 36.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0037 begin');
      const index: number = 36;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0037 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0038
     * @tc.name      testModelContract0038
     * @tc.desc      Verify modelContract behavior for matrix index 37.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0038 begin');
      const index: number = 37;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0038 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0039
     * @tc.name      testModelContract0039
     * @tc.desc      Verify modelContract behavior for matrix index 38.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0039 begin');
      const index: number = 38;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0039 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0040
     * @tc.name      testModelContract0040
     * @tc.desc      Verify modelContract behavior for matrix index 39.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0040 begin');
      const index: number = 39;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0040 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0041
     * @tc.name      testModelContract0041
     * @tc.desc      Verify modelContract behavior for matrix index 40.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0041 begin');
      const index: number = 40;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0041 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0042
     * @tc.name      testModelContract0042
     * @tc.desc      Verify modelContract behavior for matrix index 41.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0042 begin');
      const index: number = 41;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0042 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0043
     * @tc.name      testModelContract0043
     * @tc.desc      Verify modelContract behavior for matrix index 42.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0043 begin');
      const index: number = 42;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0043 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0044
     * @tc.name      testModelContract0044
     * @tc.desc      Verify modelContract behavior for matrix index 43.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0044 begin');
      const index: number = 43;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0044 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0045
     * @tc.name      testModelContract0045
     * @tc.desc      Verify modelContract behavior for matrix index 44.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0045 begin');
      const index: number = 44;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0045 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0046
     * @tc.name      testModelContract0046
     * @tc.desc      Verify modelContract behavior for matrix index 45.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0046 begin');
      const index: number = 45;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0046 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0047
     * @tc.name      testModelContract0047
     * @tc.desc      Verify modelContract behavior for matrix index 46.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0047 begin');
      const index: number = 46;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0047 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0048
     * @tc.name      testModelContract0048
     * @tc.desc      Verify modelContract behavior for matrix index 47.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0048 begin');
      const index: number = 47;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0048 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0049
     * @tc.name      testModelContract0049
     * @tc.desc      Verify modelContract behavior for matrix index 48.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0049 begin');
      const index: number = 48;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0049 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0050
     * @tc.name      testModelContract0050
     * @tc.desc      Verify modelContract behavior for matrix index 49.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0050 begin');
      const index: number = 49;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0050 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0051
     * @tc.name      testModelContract0051
     * @tc.desc      Verify modelContract behavior for matrix index 50.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0051 begin');
      const index: number = 50;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0051 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0052
     * @tc.name      testModelContract0052
     * @tc.desc      Verify modelContract behavior for matrix index 51.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0052 begin');
      const index: number = 51;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0052 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0053
     * @tc.name      testModelContract0053
     * @tc.desc      Verify modelContract behavior for matrix index 52.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0053 begin');
      const index: number = 52;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0053 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0054
     * @tc.name      testModelContract0054
     * @tc.desc      Verify modelContract behavior for matrix index 53.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0054 begin');
      const index: number = 53;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0054 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0055
     * @tc.name      testModelContract0055
     * @tc.desc      Verify modelContract behavior for matrix index 54.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0055 begin');
      const index: number = 54;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0055 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_MODEL_0056
     * @tc.name      testModelContract0056
     * @tc.desc      Verify modelContract behavior for matrix index 55.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModelContract0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0056 begin');
      const index: number = 55;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModelContract0056 end');
    })

  })
}
