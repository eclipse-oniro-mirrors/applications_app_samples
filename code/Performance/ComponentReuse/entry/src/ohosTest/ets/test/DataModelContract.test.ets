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
import { FriendMomentsData } from '../../../main/ets/model/FriendMomentData';
import { Constants } from '../../../main/ets/common/Constants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_ModelContract]';

export default function dataModelContractTest() {
  describe('dataModelContractTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_SHARE_0100
     * @tc.name testShareModelZero
     * @tc.desc Verify ShareModel stores all-zero counts
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShareModelZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareModelZero begin');
      const share: ShareModel = new ShareModel(0, 0, 0);
      expect(share.heart).assertEqual(0);
      expect(share.star).assertEqual(0);
      expect(share.message).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareModelZero end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_SHARE_0200
     * @tc.name testShareModelPositive
     * @tc.desc Verify ShareModel stores positive distinct counts
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShareModelPositive', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareModelPositive begin');
      const share: ShareModel = new ShareModel(12, 34, 56);
      expect(share.heart).assertEqual(12);
      expect(share.star).assertEqual(34);
      expect(share.message).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareModelPositive end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_SHARE_0300
     * @tc.name testShareModelLarge
     * @tc.desc Verify ShareModel stores large counts without truncation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShareModelLarge', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareModelLarge begin');
      const share: ShareModel = new ShareModel(100000, 200000, 300000);
      expect(share.heart).assertEqual(100000);
      expect(share.star).assertEqual(200000);
      expect(share.message).assertEqual(300000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareModelLarge end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_FRIEND_0100
     * @tc.name testFriendMomentZero
     * @tc.desc Verify FriendMoment push/get returns identical fields with zero share
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentZero begin');
      const data: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      data.pushData(new FriendMoment('fid_zero', 'user_zero', 'avatar', 'text', 'img', new ShareModel(0, 0, 0)));
      data.pushData(new FriendMoment('tail', 'tail', 'a', 't', 'i', new ShareModel(0, 0, 0)));
      expect(data.totalCount()).assertEqual(2);
      const got: FriendMoment = data.getData(0);
      expect(got.id).assertEqual('fid_zero');
      expect(got.userName).assertEqual('user_zero');
      expect(got.share.heart).assertEqual(0);
      expect(got.share.star).assertEqual(0);
      expect(got.share.message).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentZero end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_FRIEND_0200
     * @tc.name testFriendMomentPositive
     * @tc.desc Verify FriendMoment push/get returns identical fields with positive share
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFriendMomentPositive', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentPositive begin');
      const data: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      data.pushData(new FriendMoment('fid_pos', 'user_pos', 'avatar', 'text', 'img', new ShareModel(12, 34, 56)));
      data.pushData(new FriendMoment('tail', 'tail', 'a', 't', 'i', new ShareModel(0, 0, 0)));
      const got: FriendMoment = data.getData(0);
      expect(got.id).assertEqual('fid_pos');
      expect(got.share.heart).assertEqual(12);
      expect(got.share.star).assertEqual(34);
      expect(got.share.message).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFriendMomentPositive end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_MODEL_COLOR_0100
     * @tc.name testColorModelFieldContract
     * @tc.desc Verify ColorModel constructor stores id, text and color
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorModelFieldContract', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorModelFieldContract begin');
      const model: ColorModel = new ColorModel('cid', 'ctext', Color.Pink);
      expect(model.id).assertEqual('cid');
      expect(model.text).assertEqual('ctext');
      expect(model.color).assertEqual(Color.Pink);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorModelFieldContract end');
    });
  })
}
