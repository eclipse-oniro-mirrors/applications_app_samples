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
import { FriendMoment, ShareModel } from '../../../main/ets/model/BasicDataSource';
import { FriendMomentsData } from '../../../main/ets/model/FriendMomentData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_FriendMomentDataTail]';

export default function friendMomentDataTailTest() {
  describe('friendMomentDataTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0193
     * @tc.name      testFriendMomentData0193
     * @tc.desc      Verify friendMomentData behavior for matrix index 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0193 begin');
      const index: number = 192;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0193 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0194
     * @tc.name      testFriendMomentData0194
     * @tc.desc      Verify friendMomentData behavior for matrix index 193.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0194 begin');
      const index: number = 193;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0194 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0195
     * @tc.name      testFriendMomentData0195
     * @tc.desc      Verify friendMomentData behavior for matrix index 194.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0195 begin');
      const index: number = 194;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0195 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0196
     * @tc.name      testFriendMomentData0196
     * @tc.desc      Verify friendMomentData behavior for matrix index 195.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0196 begin');
      const index: number = 195;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0196 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0197
     * @tc.name      testFriendMomentData0197
     * @tc.desc      Verify friendMomentData behavior for matrix index 196.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0197 begin');
      const index: number = 196;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0197 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0198
     * @tc.name      testFriendMomentData0198
     * @tc.desc      Verify friendMomentData behavior for matrix index 197.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0198 begin');
      const index: number = 197;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0198 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0199
     * @tc.name      testFriendMomentData0199
     * @tc.desc      Verify friendMomentData behavior for matrix index 198.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0199 begin');
      const index: number = 198;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0199 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0200
     * @tc.name      testFriendMomentData0200
     * @tc.desc      Verify friendMomentData behavior for matrix index 199.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0200 begin');
      const index: number = 199;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0200 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0201
     * @tc.name      testFriendMomentData0201
     * @tc.desc      Verify friendMomentData behavior for matrix index 200.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0201 begin');
      const index: number = 200;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0201 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0202
     * @tc.name      testFriendMomentData0202
     * @tc.desc      Verify friendMomentData behavior for matrix index 201.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0202 begin');
      const index: number = 201;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0202 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0203
     * @tc.name      testFriendMomentData0203
     * @tc.desc      Verify friendMomentData behavior for matrix index 202.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0203 begin');
      const index: number = 202;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0203 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0204
     * @tc.name      testFriendMomentData0204
     * @tc.desc      Verify friendMomentData behavior for matrix index 203.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0204 begin');
      const index: number = 203;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0204 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0205
     * @tc.name      testFriendMomentData0205
     * @tc.desc      Verify friendMomentData behavior for matrix index 204.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0205 begin');
      const index: number = 204;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0205 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0206
     * @tc.name      testFriendMomentData0206
     * @tc.desc      Verify friendMomentData behavior for matrix index 205.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0206 begin');
      const index: number = 205;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0206 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0207
     * @tc.name      testFriendMomentData0207
     * @tc.desc      Verify friendMomentData behavior for matrix index 206.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0207 begin');
      const index: number = 206;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0207 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0208
     * @tc.name      testFriendMomentData0208
     * @tc.desc      Verify friendMomentData behavior for matrix index 207.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0208 begin');
      const index: number = 207;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0208 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0209
     * @tc.name      testFriendMomentData0209
     * @tc.desc      Verify friendMomentData behavior for matrix index 208.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0209 begin');
      const index: number = 208;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0209 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0210
     * @tc.name      testFriendMomentData0210
     * @tc.desc      Verify friendMomentData behavior for matrix index 209.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0210 begin');
      const index: number = 209;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0210 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0211
     * @tc.name      testFriendMomentData0211
     * @tc.desc      Verify friendMomentData behavior for matrix index 210.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0211 begin');
      const index: number = 210;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0211 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0212
     * @tc.name      testFriendMomentData0212
     * @tc.desc      Verify friendMomentData behavior for matrix index 211.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0212 begin');
      const index: number = 211;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0212 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0213
     * @tc.name      testFriendMomentData0213
     * @tc.desc      Verify friendMomentData behavior for matrix index 212.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0213 begin');
      const index: number = 212;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0213 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0214
     * @tc.name      testFriendMomentData0214
     * @tc.desc      Verify friendMomentData behavior for matrix index 213.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0214 begin');
      const index: number = 213;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0214 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0215
     * @tc.name      testFriendMomentData0215
     * @tc.desc      Verify friendMomentData behavior for matrix index 214.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0215 begin');
      const index: number = 214;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0215 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0216
     * @tc.name      testFriendMomentData0216
     * @tc.desc      Verify friendMomentData behavior for matrix index 215.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0216 begin');
      const index: number = 215;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0216 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0217
     * @tc.name      testFriendMomentData0217
     * @tc.desc      Verify friendMomentData behavior for matrix index 216.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0217 begin');
      const index: number = 216;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0217 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0218
     * @tc.name      testFriendMomentData0218
     * @tc.desc      Verify friendMomentData behavior for matrix index 217.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0218 begin');
      const index: number = 217;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0218 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0219
     * @tc.name      testFriendMomentData0219
     * @tc.desc      Verify friendMomentData behavior for matrix index 218.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0219 begin');
      const index: number = 218;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0219 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0220
     * @tc.name      testFriendMomentData0220
     * @tc.desc      Verify friendMomentData behavior for matrix index 219.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0220 begin');
      const index: number = 219;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0220 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0221
     * @tc.name      testFriendMomentData0221
     * @tc.desc      Verify friendMomentData behavior for matrix index 220.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0221 begin');
      const index: number = 220;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0221 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0222
     * @tc.name      testFriendMomentData0222
     * @tc.desc      Verify friendMomentData behavior for matrix index 221.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0222 begin');
      const index: number = 221;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0222 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0223
     * @tc.name      testFriendMomentData0223
     * @tc.desc      Verify friendMomentData behavior for matrix index 222.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0223 begin');
      const index: number = 222;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0223 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0224
     * @tc.name      testFriendMomentData0224
     * @tc.desc      Verify friendMomentData behavior for matrix index 223.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0224 begin');
      const index: number = 223;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0224 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0225
     * @tc.name      testFriendMomentData0225
     * @tc.desc      Verify friendMomentData behavior for matrix index 224.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0225 begin');
      const index: number = 224;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0225 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0226
     * @tc.name      testFriendMomentData0226
     * @tc.desc      Verify friendMomentData behavior for matrix index 225.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0226 begin');
      const index: number = 225;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0226 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0227
     * @tc.name      testFriendMomentData0227
     * @tc.desc      Verify friendMomentData behavior for matrix index 226.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0227 begin');
      const index: number = 226;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0227 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0228
     * @tc.name      testFriendMomentData0228
     * @tc.desc      Verify friendMomentData behavior for matrix index 227.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0228 begin');
      const index: number = 227;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0228 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0229
     * @tc.name      testFriendMomentData0229
     * @tc.desc      Verify friendMomentData behavior for matrix index 228.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0229 begin');
      const index: number = 228;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0229 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0230
     * @tc.name      testFriendMomentData0230
     * @tc.desc      Verify friendMomentData behavior for matrix index 229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0230 begin');
      const index: number = 229;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0230 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0231
     * @tc.name      testFriendMomentData0231
     * @tc.desc      Verify friendMomentData behavior for matrix index 230.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0231 begin');
      const index: number = 230;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0231 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0232
     * @tc.name      testFriendMomentData0232
     * @tc.desc      Verify friendMomentData behavior for matrix index 231.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0232 begin');
      const index: number = 231;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0232 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0233
     * @tc.name      testFriendMomentData0233
     * @tc.desc      Verify friendMomentData behavior for matrix index 232.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0233 begin');
      const index: number = 232;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0233 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0234
     * @tc.name      testFriendMomentData0234
     * @tc.desc      Verify friendMomentData behavior for matrix index 233.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0234 begin');
      const index: number = 233;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0234 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0235
     * @tc.name      testFriendMomentData0235
     * @tc.desc      Verify friendMomentData behavior for matrix index 234.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0235 begin');
      const index: number = 234;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0235 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0236
     * @tc.name      testFriendMomentData0236
     * @tc.desc      Verify friendMomentData behavior for matrix index 235.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0236 begin');
      const index: number = 235;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0236 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0237
     * @tc.name      testFriendMomentData0237
     * @tc.desc      Verify friendMomentData behavior for matrix index 236.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0237 begin');
      const index: number = 236;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0237 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0238
     * @tc.name      testFriendMomentData0238
     * @tc.desc      Verify friendMomentData behavior for matrix index 237.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0238 begin');
      const index: number = 237;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0238 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0239
     * @tc.name      testFriendMomentData0239
     * @tc.desc      Verify friendMomentData behavior for matrix index 238.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0239 begin');
      const index: number = 238;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0239 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0240
     * @tc.name      testFriendMomentData0240
     * @tc.desc      Verify friendMomentData behavior for matrix index 239.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0240 begin');
      const index: number = 239;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0240 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0241
     * @tc.name      testFriendMomentData0241
     * @tc.desc      Verify friendMomentData behavior for matrix index 240.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0241 begin');
      const index: number = 240;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0241 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0242
     * @tc.name      testFriendMomentData0242
     * @tc.desc      Verify friendMomentData behavior for matrix index 241.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0242 begin');
      const index: number = 241;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0242 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0243
     * @tc.name      testFriendMomentData0243
     * @tc.desc      Verify friendMomentData behavior for matrix index 242.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0243 begin');
      const index: number = 242;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0243 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0244
     * @tc.name      testFriendMomentData0244
     * @tc.desc      Verify friendMomentData behavior for matrix index 243.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0244 begin');
      const index: number = 243;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0244 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0245
     * @tc.name      testFriendMomentData0245
     * @tc.desc      Verify friendMomentData behavior for matrix index 244.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0245 begin');
      const index: number = 244;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0245 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0246
     * @tc.name      testFriendMomentData0246
     * @tc.desc      Verify friendMomentData behavior for matrix index 245.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0246 begin');
      const index: number = 245;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0246 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0247
     * @tc.name      testFriendMomentData0247
     * @tc.desc      Verify friendMomentData behavior for matrix index 246.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0247 begin');
      const index: number = 246;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0247 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0248
     * @tc.name      testFriendMomentData0248
     * @tc.desc      Verify friendMomentData behavior for matrix index 247.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0248 begin');
      const index: number = 247;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0248 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0249
     * @tc.name      testFriendMomentData0249
     * @tc.desc      Verify friendMomentData behavior for matrix index 248.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0249 begin');
      const index: number = 248;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0249 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0250
     * @tc.name      testFriendMomentData0250
     * @tc.desc      Verify friendMomentData behavior for matrix index 249.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0250 begin');
      const index: number = 249;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0250 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0251
     * @tc.name      testFriendMomentData0251
     * @tc.desc      Verify friendMomentData behavior for matrix index 250.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0251 begin');
      const index: number = 250;
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0251 end');
    })

  })
}
