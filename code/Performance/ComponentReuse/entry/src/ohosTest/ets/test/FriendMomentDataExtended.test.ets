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
const TAG: string = '[Sample_ComponentReuse_FriendMomentDataExtended]';

export default function friendMomentDataExtendedTest() {
  describe('friendMomentDataExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0065
     * @tc.name      testFriendMomentData0065
     * @tc.desc      Verify friendMomentData behavior for matrix index 64.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0065 begin');
      const index: number = 64;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0065 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0066
     * @tc.name      testFriendMomentData0066
     * @tc.desc      Verify friendMomentData behavior for matrix index 65.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0066 begin');
      const index: number = 65;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0066 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0067
     * @tc.name      testFriendMomentData0067
     * @tc.desc      Verify friendMomentData behavior for matrix index 66.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0067 begin');
      const index: number = 66;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0067 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0068
     * @tc.name      testFriendMomentData0068
     * @tc.desc      Verify friendMomentData behavior for matrix index 67.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0068 begin');
      const index: number = 67;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0068 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0069
     * @tc.name      testFriendMomentData0069
     * @tc.desc      Verify friendMomentData behavior for matrix index 68.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0069 begin');
      const index: number = 68;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0069 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0070
     * @tc.name      testFriendMomentData0070
     * @tc.desc      Verify friendMomentData behavior for matrix index 69.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0070 begin');
      const index: number = 69;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0070 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0071
     * @tc.name      testFriendMomentData0071
     * @tc.desc      Verify friendMomentData behavior for matrix index 70.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0071 begin');
      const index: number = 70;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0071 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0072
     * @tc.name      testFriendMomentData0072
     * @tc.desc      Verify friendMomentData behavior for matrix index 71.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0072 begin');
      const index: number = 71;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0072 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0073
     * @tc.name      testFriendMomentData0073
     * @tc.desc      Verify friendMomentData behavior for matrix index 72.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0073 begin');
      const index: number = 72;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0073 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0074
     * @tc.name      testFriendMomentData0074
     * @tc.desc      Verify friendMomentData behavior for matrix index 73.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0074 begin');
      const index: number = 73;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0074 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0075
     * @tc.name      testFriendMomentData0075
     * @tc.desc      Verify friendMomentData behavior for matrix index 74.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0075 begin');
      const index: number = 74;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0075 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0076
     * @tc.name      testFriendMomentData0076
     * @tc.desc      Verify friendMomentData behavior for matrix index 75.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0076 begin');
      const index: number = 75;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0076 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0077
     * @tc.name      testFriendMomentData0077
     * @tc.desc      Verify friendMomentData behavior for matrix index 76.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0077 begin');
      const index: number = 76;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0077 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0078
     * @tc.name      testFriendMomentData0078
     * @tc.desc      Verify friendMomentData behavior for matrix index 77.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0078 begin');
      const index: number = 77;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0078 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0079
     * @tc.name      testFriendMomentData0079
     * @tc.desc      Verify friendMomentData behavior for matrix index 78.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0079 begin');
      const index: number = 78;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0079 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0080
     * @tc.name      testFriendMomentData0080
     * @tc.desc      Verify friendMomentData behavior for matrix index 79.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0080 begin');
      const index: number = 79;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0080 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0081
     * @tc.name      testFriendMomentData0081
     * @tc.desc      Verify friendMomentData behavior for matrix index 80.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0081 begin');
      const index: number = 80;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0081 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0082
     * @tc.name      testFriendMomentData0082
     * @tc.desc      Verify friendMomentData behavior for matrix index 81.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0082 begin');
      const index: number = 81;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0082 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0083
     * @tc.name      testFriendMomentData0083
     * @tc.desc      Verify friendMomentData behavior for matrix index 82.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0083 begin');
      const index: number = 82;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0083 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0084
     * @tc.name      testFriendMomentData0084
     * @tc.desc      Verify friendMomentData behavior for matrix index 83.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0084 begin');
      const index: number = 83;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0084 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0085
     * @tc.name      testFriendMomentData0085
     * @tc.desc      Verify friendMomentData behavior for matrix index 84.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0085 begin');
      const index: number = 84;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0085 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0086
     * @tc.name      testFriendMomentData0086
     * @tc.desc      Verify friendMomentData behavior for matrix index 85.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0086 begin');
      const index: number = 85;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0086 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0087
     * @tc.name      testFriendMomentData0087
     * @tc.desc      Verify friendMomentData behavior for matrix index 86.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0087 begin');
      const index: number = 86;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0087 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0088
     * @tc.name      testFriendMomentData0088
     * @tc.desc      Verify friendMomentData behavior for matrix index 87.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0088 begin');
      const index: number = 87;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0088 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0089
     * @tc.name      testFriendMomentData0089
     * @tc.desc      Verify friendMomentData behavior for matrix index 88.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0089 begin');
      const index: number = 88;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0089 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0090
     * @tc.name      testFriendMomentData0090
     * @tc.desc      Verify friendMomentData behavior for matrix index 89.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0090 begin');
      const index: number = 89;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0090 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0091
     * @tc.name      testFriendMomentData0091
     * @tc.desc      Verify friendMomentData behavior for matrix index 90.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0091 begin');
      const index: number = 90;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0091 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0092
     * @tc.name      testFriendMomentData0092
     * @tc.desc      Verify friendMomentData behavior for matrix index 91.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0092 begin');
      const index: number = 91;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0092 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0093
     * @tc.name      testFriendMomentData0093
     * @tc.desc      Verify friendMomentData behavior for matrix index 92.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0093 begin');
      const index: number = 92;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0093 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0094
     * @tc.name      testFriendMomentData0094
     * @tc.desc      Verify friendMomentData behavior for matrix index 93.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0094 begin');
      const index: number = 93;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0094 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0095
     * @tc.name      testFriendMomentData0095
     * @tc.desc      Verify friendMomentData behavior for matrix index 94.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0095 begin');
      const index: number = 94;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0095 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0096
     * @tc.name      testFriendMomentData0096
     * @tc.desc      Verify friendMomentData behavior for matrix index 95.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0096 begin');
      const index: number = 95;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0096 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0097
     * @tc.name      testFriendMomentData0097
     * @tc.desc      Verify friendMomentData behavior for matrix index 96.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0097 begin');
      const index: number = 96;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0097 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0098
     * @tc.name      testFriendMomentData0098
     * @tc.desc      Verify friendMomentData behavior for matrix index 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0098 begin');
      const index: number = 97;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0098 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0099
     * @tc.name      testFriendMomentData0099
     * @tc.desc      Verify friendMomentData behavior for matrix index 98.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0099 begin');
      const index: number = 98;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0099 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0100
     * @tc.name      testFriendMomentData0100
     * @tc.desc      Verify friendMomentData behavior for matrix index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0100 begin');
      const index: number = 99;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0100 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0101
     * @tc.name      testFriendMomentData0101
     * @tc.desc      Verify friendMomentData behavior for matrix index 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0101 begin');
      const index: number = 100;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0101 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0102
     * @tc.name      testFriendMomentData0102
     * @tc.desc      Verify friendMomentData behavior for matrix index 101.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0102 begin');
      const index: number = 101;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0102 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0103
     * @tc.name      testFriendMomentData0103
     * @tc.desc      Verify friendMomentData behavior for matrix index 102.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0103 begin');
      const index: number = 102;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0103 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0104
     * @tc.name      testFriendMomentData0104
     * @tc.desc      Verify friendMomentData behavior for matrix index 103.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0104 begin');
      const index: number = 103;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0104 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0105
     * @tc.name      testFriendMomentData0105
     * @tc.desc      Verify friendMomentData behavior for matrix index 104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0105 begin');
      const index: number = 104;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0105 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0106
     * @tc.name      testFriendMomentData0106
     * @tc.desc      Verify friendMomentData behavior for matrix index 105.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0106 begin');
      const index: number = 105;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0106 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0107
     * @tc.name      testFriendMomentData0107
     * @tc.desc      Verify friendMomentData behavior for matrix index 106.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0107 begin');
      const index: number = 106;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0107 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0108
     * @tc.name      testFriendMomentData0108
     * @tc.desc      Verify friendMomentData behavior for matrix index 107.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0108 begin');
      const index: number = 107;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0108 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0109
     * @tc.name      testFriendMomentData0109
     * @tc.desc      Verify friendMomentData behavior for matrix index 108.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0109 begin');
      const index: number = 108;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0109 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0110
     * @tc.name      testFriendMomentData0110
     * @tc.desc      Verify friendMomentData behavior for matrix index 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0110 begin');
      const index: number = 109;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0110 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0111
     * @tc.name      testFriendMomentData0111
     * @tc.desc      Verify friendMomentData behavior for matrix index 110.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0111 begin');
      const index: number = 110;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0111 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0112
     * @tc.name      testFriendMomentData0112
     * @tc.desc      Verify friendMomentData behavior for matrix index 111.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0112 begin');
      const index: number = 111;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0112 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0113
     * @tc.name      testFriendMomentData0113
     * @tc.desc      Verify friendMomentData behavior for matrix index 112.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0113 begin');
      const index: number = 112;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0113 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0114
     * @tc.name      testFriendMomentData0114
     * @tc.desc      Verify friendMomentData behavior for matrix index 113.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0114 begin');
      const index: number = 113;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0114 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0115
     * @tc.name      testFriendMomentData0115
     * @tc.desc      Verify friendMomentData behavior for matrix index 114.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0115 begin');
      const index: number = 114;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0115 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0116
     * @tc.name      testFriendMomentData0116
     * @tc.desc      Verify friendMomentData behavior for matrix index 115.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0116 begin');
      const index: number = 115;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0116 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0117
     * @tc.name      testFriendMomentData0117
     * @tc.desc      Verify friendMomentData behavior for matrix index 116.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0117 begin');
      const index: number = 116;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0117 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0118
     * @tc.name      testFriendMomentData0118
     * @tc.desc      Verify friendMomentData behavior for matrix index 117.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0118 begin');
      const index: number = 117;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0118 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0119
     * @tc.name      testFriendMomentData0119
     * @tc.desc      Verify friendMomentData behavior for matrix index 118.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0119 begin');
      const index: number = 118;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0119 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0120
     * @tc.name      testFriendMomentData0120
     * @tc.desc      Verify friendMomentData behavior for matrix index 119.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0120 begin');
      const index: number = 119;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0120 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0121
     * @tc.name      testFriendMomentData0121
     * @tc.desc      Verify friendMomentData behavior for matrix index 120.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0121 begin');
      const index: number = 120;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0121 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0122
     * @tc.name      testFriendMomentData0122
     * @tc.desc      Verify friendMomentData behavior for matrix index 121.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0122 begin');
      const index: number = 121;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0122 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0123
     * @tc.name      testFriendMomentData0123
     * @tc.desc      Verify friendMomentData behavior for matrix index 122.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0123 begin');
      const index: number = 122;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0123 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0124
     * @tc.name      testFriendMomentData0124
     * @tc.desc      Verify friendMomentData behavior for matrix index 123.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0124 begin');
      const index: number = 123;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0124 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_FRIEND_0125
     * @tc.name      testFriendMomentData0125
     * @tc.desc      Verify friendMomentData behavior for matrix index 124.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testFriendMomentData0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0125 begin');
      const index: number = 124;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentData0125 end');
    })

  
  })
}
