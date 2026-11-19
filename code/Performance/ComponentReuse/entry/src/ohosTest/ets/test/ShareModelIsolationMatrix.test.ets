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
import { Constants } from '../../../main/ets/common/Constants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_ShareIsolation]';

export default function shareModelIsolationTest() {
  describe('shareModelIsolationTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_SHARE_0100
     * @tc.name testShareModelReferenceIsolation
     * @tc.desc Verify two ShareModel instances are distinct and mutating one leaves the other unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShareModelReferenceIsolation', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareModelReferenceIsolation begin');
      const first: FriendMoment = new FriendMoment('f1', 'u1', 'a', 't', 'i', new ShareModel(1, 2, 3));
      const second: FriendMoment = new FriendMoment('f2', 'u2', 'a', 't', 'i', new ShareModel(4, 5, 6));
      expect(first.share === second.share).assertFalse();
      first.share.heart = 100;
      expect(first.share.heart).assertEqual(100);
      expect(second.share.heart).assertEqual(4);
      expect(first.share.star).assertEqual(2);
      expect(second.share.message).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareModelReferenceIsolation end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_SHARE_0200
     * @tc.name testShareMutationPersistsInData
     * @tc.desc Verify mutating a pushed share object is visible through the data source (reference kept)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShareMutationPersistsInData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareMutationPersistsInData begin');
      const data: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      const fm: FriendMoment = new FriendMoment('fid', 'user', 'a', 't', 'i', new ShareModel(7, 8, 9));
      data.pushData(fm);
      data.pushData(new FriendMoment('tail', 'tail', 'a', 't', 'i', new ShareModel(0, 0, 0)));
      const got: FriendMoment = data.getData(0);
      expect(got.share.heart).assertEqual(7);
      got.share.star = 50;
      expect(got.share.star).assertEqual(50);
      expect(fm.share.star).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShareMutationPersistsInData end');
    });
  })
}
