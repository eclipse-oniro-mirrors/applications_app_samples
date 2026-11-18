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
const TAG: string = '[Sample_ComponentReuse_FriendMomentData]';

export default function friendMomentDataTest() {
  describe('friendMomentDataTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0001
     * @tc.name testFriendMomentData0001
     * @tc.desc Verify FriendMomentData behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0001 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (0 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 0 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0001 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0002
     * @tc.name testFriendMomentData0002
     * @tc.desc Verify FriendMomentData behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0002 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (1 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 1 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0002 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0003
     * @tc.name testFriendMomentData0003
     * @tc.desc Verify FriendMomentData behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0003 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (2 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 2 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0003 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0004
     * @tc.name testFriendMomentData0004
     * @tc.desc Verify FriendMomentData behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0004 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (3 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 3 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0004 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0005
     * @tc.name testFriendMomentData0005
     * @tc.desc Verify FriendMomentData behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0005 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (4 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 4 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0005 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0006
     * @tc.name testFriendMomentData0006
     * @tc.desc Verify FriendMomentData behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0006 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (5 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 5 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0006 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0007
     * @tc.name testFriendMomentData0007
     * @tc.desc Verify FriendMomentData behavior for matrix index 6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0007 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (6 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 6 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0007 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0008
     * @tc.name testFriendMomentData0008
     * @tc.desc Verify FriendMomentData behavior for matrix index 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0008 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (7 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 7 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0008 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0009
     * @tc.name testFriendMomentData0009
     * @tc.desc Verify FriendMomentData behavior for matrix index 8
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0009 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (8 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 8 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0009 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0010
     * @tc.name testFriendMomentData0010
     * @tc.desc Verify FriendMomentData behavior for matrix index 9
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0010 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (9 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 9 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0010 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0011
     * @tc.name testFriendMomentData0011
     * @tc.desc Verify FriendMomentData behavior for matrix index 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0011 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (10 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 10 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0011 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0012
     * @tc.name testFriendMomentData0012
     * @tc.desc Verify FriendMomentData behavior for matrix index 11
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0012 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (11 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 11 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0012 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0013
     * @tc.name testFriendMomentData0013
     * @tc.desc Verify FriendMomentData behavior for matrix index 12
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0013 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (12 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 12 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0013 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0014
     * @tc.name testFriendMomentData0014
     * @tc.desc Verify FriendMomentData behavior for matrix index 13
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0014 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (13 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 13 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0014 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0015
     * @tc.name testFriendMomentData0015
     * @tc.desc Verify FriendMomentData behavior for matrix index 14
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0015 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (14 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 14 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0015 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0016
     * @tc.name testFriendMomentData0016
     * @tc.desc Verify FriendMomentData behavior for matrix index 15
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0016 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (15 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 15 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0016 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0019
     * @tc.name testFriendMomentData0019
     * @tc.desc Verify FriendMomentData behavior for matrix index 18
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0019 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (18 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 18 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0019 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0020
     * @tc.name testFriendMomentData0020
     * @tc.desc Verify FriendMomentData behavior for matrix index 19
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0020 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (19 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 19 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0020 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0021
     * @tc.name testFriendMomentData0021
     * @tc.desc Verify FriendMomentData behavior for matrix index 20
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0021 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (20 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 20 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0021 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0026
     * @tc.name testFriendMomentData0026
     * @tc.desc Verify FriendMomentData behavior for matrix index 25
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0026 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (25 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 25 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0026 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0032
     * @tc.name testFriendMomentData0032
     * @tc.desc Verify FriendMomentData behavior for matrix index 31
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0032 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (31 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 31 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0032 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0040
     * @tc.name testFriendMomentData0040
     * @tc.desc Verify FriendMomentData behavior for matrix index 39
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0040 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (39 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 39 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0040 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0064
     * @tc.name testFriendMomentData0064
     * @tc.desc Verify FriendMomentData behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0064 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (63 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 63 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0064 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0065
     * @tc.name testFriendMomentData0065
     * @tc.desc Verify FriendMomentData behavior for matrix index 64
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0065 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (64 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 64 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0065 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0128
     * @tc.name testFriendMomentData0128
     * @tc.desc Verify FriendMomentData behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0128 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (127 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 127 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0128 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0129
     * @tc.name testFriendMomentData0129
     * @tc.desc Verify FriendMomentData behavior for matrix index 128
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0129 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (128 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 128 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0129 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0192
     * @tc.name testFriendMomentData0192
     * @tc.desc Verify FriendMomentData behavior for matrix index 191
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0192 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (191 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 191 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0192 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0255
     * @tc.name testFriendMomentData0255
     * @tc.desc Verify FriendMomentData behavior for matrix index 254
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0255 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (254 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 254 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0255 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_FRIEND_0256
     * @tc.name testFriendMomentData0256
     * @tc.desc Verify FriendMomentData behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentData0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0256 begin`);
      const data: FriendMomentsData = new FriendMomentsData();
      const pushCount: number = (255 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new FriendMoment('friend_id_' + n, 'user_' + n, 'avatar_' + n,
          'text_' + n, 'image_' + n, new ShareModel(n, n * 2, n * 3)));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 255 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: FriendMoment = data.getData(target);
      expect(item.id).assertEqual('friend_id_' + target);
      expect(item.userName).assertEqual('user_' + target);
      expect(item.share.heart).assertEqual(target);
      expect(item.share.star).assertEqual(target * 2);
      expect(item.share.message).assertEqual(target * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `testFriendMomentData0256 end`);
    });
  })
}
