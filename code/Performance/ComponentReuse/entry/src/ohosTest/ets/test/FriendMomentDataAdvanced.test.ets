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
const TAG: string = '[Sample_ComponentReuse_FriendMomentDataAdvanced]';

export default function friendMomentDataAdvancedTest() {
  describe('friendMomentDataAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0129
     * @tc.name      testFriendMomentData0129
     * @tc.desc      Verify friendMomentData behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0129 begin');
      const index: number = 128;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0129 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0130
     * @tc.name      testFriendMomentData0130
     * @tc.desc      Verify friendMomentData behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0130 begin');
      const index: number = 129;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0130 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0131
     * @tc.name      testFriendMomentData0131
     * @tc.desc      Verify friendMomentData behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0131 begin');
      const index: number = 130;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0131 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0132
     * @tc.name      testFriendMomentData0132
     * @tc.desc      Verify friendMomentData behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0132 begin');
      const index: number = 131;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0132 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0133
     * @tc.name      testFriendMomentData0133
     * @tc.desc      Verify friendMomentData behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0133 begin');
      const index: number = 132;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0133 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0134
     * @tc.name      testFriendMomentData0134
     * @tc.desc      Verify friendMomentData behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0134 begin');
      const index: number = 133;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0134 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0135
     * @tc.name      testFriendMomentData0135
     * @tc.desc      Verify friendMomentData behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0135 begin');
      const index: number = 134;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0135 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0136
     * @tc.name      testFriendMomentData0136
     * @tc.desc      Verify friendMomentData behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0136 begin');
      const index: number = 135;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0136 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0137
     * @tc.name      testFriendMomentData0137
     * @tc.desc      Verify friendMomentData behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0137 begin');
      const index: number = 136;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0137 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0138
     * @tc.name      testFriendMomentData0138
     * @tc.desc      Verify friendMomentData behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0138 begin');
      const index: number = 137;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0138 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0139
     * @tc.name      testFriendMomentData0139
     * @tc.desc      Verify friendMomentData behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0139 begin');
      const index: number = 138;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0139 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0140
     * @tc.name      testFriendMomentData0140
     * @tc.desc      Verify friendMomentData behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0140 begin');
      const index: number = 139;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0140 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0141
     * @tc.name      testFriendMomentData0141
     * @tc.desc      Verify friendMomentData behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0141 begin');
      const index: number = 140;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0141 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0142
     * @tc.name      testFriendMomentData0142
     * @tc.desc      Verify friendMomentData behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0142 begin');
      const index: number = 141;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0142 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0143
     * @tc.name      testFriendMomentData0143
     * @tc.desc      Verify friendMomentData behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0143 begin');
      const index: number = 142;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0143 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0144
     * @tc.name      testFriendMomentData0144
     * @tc.desc      Verify friendMomentData behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0144 begin');
      const index: number = 143;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0144 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0145
     * @tc.name      testFriendMomentData0145
     * @tc.desc      Verify friendMomentData behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0145 begin');
      const index: number = 144;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0145 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0146
     * @tc.name      testFriendMomentData0146
     * @tc.desc      Verify friendMomentData behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0146 begin');
      const index: number = 145;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0146 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0147
     * @tc.name      testFriendMomentData0147
     * @tc.desc      Verify friendMomentData behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0147 begin');
      const index: number = 146;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0147 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0148
     * @tc.name      testFriendMomentData0148
     * @tc.desc      Verify friendMomentData behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0148 begin');
      const index: number = 147;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0148 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0149
     * @tc.name      testFriendMomentData0149
     * @tc.desc      Verify friendMomentData behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0149 begin');
      const index: number = 148;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0149 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0150
     * @tc.name      testFriendMomentData0150
     * @tc.desc      Verify friendMomentData behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0150 begin');
      const index: number = 149;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0150 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0151
     * @tc.name      testFriendMomentData0151
     * @tc.desc      Verify friendMomentData behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0151 begin');
      const index: number = 150;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0151 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0152
     * @tc.name      testFriendMomentData0152
     * @tc.desc      Verify friendMomentData behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0152 begin');
      const index: number = 151;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0152 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0153
     * @tc.name      testFriendMomentData0153
     * @tc.desc      Verify friendMomentData behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0153 begin');
      const index: number = 152;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0153 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0154
     * @tc.name      testFriendMomentData0154
     * @tc.desc      Verify friendMomentData behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0154 begin');
      const index: number = 153;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0154 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0155
     * @tc.name      testFriendMomentData0155
     * @tc.desc      Verify friendMomentData behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0155 begin');
      const index: number = 154;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0155 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0156
     * @tc.name      testFriendMomentData0156
     * @tc.desc      Verify friendMomentData behavior for matrix index 155.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0156 begin');
      const index: number = 155;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0156 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0157
     * @tc.name      testFriendMomentData0157
     * @tc.desc      Verify friendMomentData behavior for matrix index 156.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0157 begin');
      const index: number = 156;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0157 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0158
     * @tc.name      testFriendMomentData0158
     * @tc.desc      Verify friendMomentData behavior for matrix index 157.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0158 begin');
      const index: number = 157;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0158 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0159
     * @tc.name      testFriendMomentData0159
     * @tc.desc      Verify friendMomentData behavior for matrix index 158.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0159 begin');
      const index: number = 158;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0159 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0160
     * @tc.name      testFriendMomentData0160
     * @tc.desc      Verify friendMomentData behavior for matrix index 159.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0160 begin');
      const index: number = 159;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0160 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0161
     * @tc.name      testFriendMomentData0161
     * @tc.desc      Verify friendMomentData behavior for matrix index 160.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0161 begin');
      const index: number = 160;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0161 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0162
     * @tc.name      testFriendMomentData0162
     * @tc.desc      Verify friendMomentData behavior for matrix index 161.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0162 begin');
      const index: number = 161;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0162 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0163
     * @tc.name      testFriendMomentData0163
     * @tc.desc      Verify friendMomentData behavior for matrix index 162.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0163 begin');
      const index: number = 162;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0163 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0164
     * @tc.name      testFriendMomentData0164
     * @tc.desc      Verify friendMomentData behavior for matrix index 163.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0164 begin');
      const index: number = 163;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0164 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0165
     * @tc.name      testFriendMomentData0165
     * @tc.desc      Verify friendMomentData behavior for matrix index 164.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0165 begin');
      const index: number = 164;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0165 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0166
     * @tc.name      testFriendMomentData0166
     * @tc.desc      Verify friendMomentData behavior for matrix index 165.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0166 begin');
      const index: number = 165;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0166 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0167
     * @tc.name      testFriendMomentData0167
     * @tc.desc      Verify friendMomentData behavior for matrix index 166.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0167 begin');
      const index: number = 166;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0167 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0168
     * @tc.name      testFriendMomentData0168
     * @tc.desc      Verify friendMomentData behavior for matrix index 167.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0168 begin');
      const index: number = 167;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0168 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0169
     * @tc.name      testFriendMomentData0169
     * @tc.desc      Verify friendMomentData behavior for matrix index 168.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0169 begin');
      const index: number = 168;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0169 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0170
     * @tc.name      testFriendMomentData0170
     * @tc.desc      Verify friendMomentData behavior for matrix index 169.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0170 begin');
      const index: number = 169;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0170 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0171
     * @tc.name      testFriendMomentData0171
     * @tc.desc      Verify friendMomentData behavior for matrix index 170.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0171 begin');
      const index: number = 170;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0171 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0172
     * @tc.name      testFriendMomentData0172
     * @tc.desc      Verify friendMomentData behavior for matrix index 171.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0172 begin');
      const index: number = 171;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0172 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0173
     * @tc.name      testFriendMomentData0173
     * @tc.desc      Verify friendMomentData behavior for matrix index 172.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0173 begin');
      const index: number = 172;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0173 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0174
     * @tc.name      testFriendMomentData0174
     * @tc.desc      Verify friendMomentData behavior for matrix index 173.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0174 begin');
      const index: number = 173;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0174 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0175
     * @tc.name      testFriendMomentData0175
     * @tc.desc      Verify friendMomentData behavior for matrix index 174.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0175 begin');
      const index: number = 174;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0175 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0176
     * @tc.name      testFriendMomentData0176
     * @tc.desc      Verify friendMomentData behavior for matrix index 175.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0176 begin');
      const index: number = 175;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0176 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0177
     * @tc.name      testFriendMomentData0177
     * @tc.desc      Verify friendMomentData behavior for matrix index 176.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0177 begin');
      const index: number = 176;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0177 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0178
     * @tc.name      testFriendMomentData0178
     * @tc.desc      Verify friendMomentData behavior for matrix index 177.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0178 begin');
      const index: number = 177;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0178 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0179
     * @tc.name      testFriendMomentData0179
     * @tc.desc      Verify friendMomentData behavior for matrix index 178.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0179 begin');
      const index: number = 178;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0179 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0180
     * @tc.name      testFriendMomentData0180
     * @tc.desc      Verify friendMomentData behavior for matrix index 179.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0180 begin');
      const index: number = 179;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0180 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0181
     * @tc.name      testFriendMomentData0181
     * @tc.desc      Verify friendMomentData behavior for matrix index 180.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0181 begin');
      const index: number = 180;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0181 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0182
     * @tc.name      testFriendMomentData0182
     * @tc.desc      Verify friendMomentData behavior for matrix index 181.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0182 begin');
      const index: number = 181;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0182 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0183
     * @tc.name      testFriendMomentData0183
     * @tc.desc      Verify friendMomentData behavior for matrix index 182.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0183 begin');
      const index: number = 182;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0183 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0184
     * @tc.name      testFriendMomentData0184
     * @tc.desc      Verify friendMomentData behavior for matrix index 183.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0184 begin');
      const index: number = 183;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0184 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0185
     * @tc.name      testFriendMomentData0185
     * @tc.desc      Verify friendMomentData behavior for matrix index 184.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0185 begin');
      const index: number = 184;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0185 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0186
     * @tc.name      testFriendMomentData0186
     * @tc.desc      Verify friendMomentData behavior for matrix index 185.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0186 begin');
      const index: number = 185;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0186 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0187
     * @tc.name      testFriendMomentData0187
     * @tc.desc      Verify friendMomentData behavior for matrix index 186.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0187 begin');
      const index: number = 186;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0187 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0188
     * @tc.name      testFriendMomentData0188
     * @tc.desc      Verify friendMomentData behavior for matrix index 187.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0188 begin');
      const index: number = 187;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0188 end');
    })

 
  })
}
