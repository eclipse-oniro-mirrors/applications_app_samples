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
import { ColorData } from '../../../main/ets/model/ColorData';
import { FriendMomentsData } from '../../../main/ets/model/FriendMomentData';
import { Constants } from '../../../main/ets/common/Constants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_Interleave]';

export default function interleavingMatrixTest() {
  describe('interleavingMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_INTERLEAVE_0100
     * @tc.name testInterleaveC3F4R1
     * @tc.desc Verify interleaved push of 3 colors and 4 friends keeps counts and read-back fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveC3F4R1', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleaveC3F4R1 begin');
      const color: ColorData = new ColorData();
      const friend: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      for (let i: number = 0; i < 4; i++) {
        if (i < 3) {
          color.pushData(new ColorModel('c_' + i, 'ct_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
        }
        friend.pushData(new FriendMoment('f_' + i, 'u_' + i, 'a', 't', 'i', new ShareModel(i, i + 1, i + 2)));
      }
      expect(color.totalCount()).assertEqual(3);
      expect(friend.totalCount()).assertEqual(4);
      const colorItem: ColorModel = color.getData(1) as ColorModel;
      expect(colorItem.id).assertEqual('c_1');
      const friendItem: FriendMoment = friend.getData(1);
      expect(friendItem.id).assertEqual('f_1');
      expect(friendItem.share.heart).assertEqual(1);
      expect(friendItem.share.star).assertEqual(2);
      expect(friendItem.share.message).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleaveC3F4R1 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_INTERLEAVE_0200
     * @tc.name testInterleaveC5F2R0
     * @tc.desc Verify interleaved push of 5 colors and 2 friends keeps counts and read-back fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveC5F2R0', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleaveC5F2R0 begin');
      const color: ColorData = new ColorData();
      const friend: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      for (let i: number = 0; i < 5; i++) {
        color.pushData(new ColorModel('c_' + i, 'ct_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
        if (i < 2) {
          friend.pushData(new FriendMoment('f_' + i, 'u_' + i, 'a', 't', 'i', new ShareModel(i, i + 1, i + 2)));
        }
      }
      expect(color.totalCount()).assertEqual(5);
      expect(friend.totalCount()).assertEqual(2);
      const colorItem: ColorModel = color.getData(0) as ColorModel;
      expect(colorItem.id).assertEqual('c_0');
      const friendItem: FriendMoment = friend.getData(0);
      expect(friendItem.id).assertEqual('f_0');
      expect(friendItem.share.heart).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleaveC5F2R0 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_INTERLEAVE_0300
     * @tc.name testInterleaveC6F6R3
     * @tc.desc Verify interleaved push of 6 colors and 6 friends keeps counts and read-back fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveC6F6R3', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleaveC6F6R3 begin');
      const color: ColorData = new ColorData();
      const friend: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      for (let i: number = 0; i < 6; i++) {
        color.pushData(new ColorModel('c_' + i, 'ct_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
        friend.pushData(new FriendMoment('f_' + i, 'u_' + i, 'a', 't', 'i', new ShareModel(i, i + 1, i + 2)));
      }
      expect(color.totalCount()).assertEqual(6);
      expect(friend.totalCount()).assertEqual(6);
      const colorItem: ColorModel = color.getData(3) as ColorModel;
      expect(colorItem.id).assertEqual('c_3');
      const friendItem: FriendMoment = friend.getData(3);
      expect(friendItem.id).assertEqual('f_3');
      expect(friendItem.share.heart).assertEqual(3);
      expect(friendItem.share.star).assertEqual(4);
      expect(friendItem.share.message).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleaveC6F6R3 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_INTERLEAVE_0400
     * @tc.name testInterleaveC8F3R0
     * @tc.desc Verify interleaved push of 8 colors and 3 friends keeps counts and read-back fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveC8F3R0', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleaveC8F3R0 begin');
      const color: ColorData = new ColorData();
      const friend: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      for (let i: number = 0; i < 8; i++) {
        color.pushData(new ColorModel('c_' + i, 'ct_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
        if (i < 3) {
          friend.pushData(new FriendMoment('f_' + i, 'u_' + i, 'a', 't', 'i', new ShareModel(i, i + 1, i + 2)));
        }
      }
      expect(color.totalCount()).assertEqual(8);
      expect(friend.totalCount()).assertEqual(3);
      const colorItem: ColorModel = color.getData(0) as ColorModel;
      expect(colorItem.id).assertEqual('c_0');
      const friendItem: FriendMoment = friend.getData(0);
      expect(friendItem.id).assertEqual('f_0');
      expect(friendItem.share.heart).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleaveC8F3R0 end');
    });
  })
}
