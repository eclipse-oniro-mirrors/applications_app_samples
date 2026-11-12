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
const TAG: string = '[Sample_ComponentReuse_Isolation]';

export default function stateIsolationTest() {
  describe('stateIsolationTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_ISOLATION_0100
     * @tc.name color_instances_isolated
     * @tc.desc Verify two ColorData instances keep independent state
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('color_instances_isolated', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'color_instances_isolated begin');
      const first: ColorData = new ColorData();
      const second: ColorData = new ColorData();
      first.pushData(new ColorModel('a1', 't1', Color.Red));
      first.pushData(new ColorModel('a2', 't2', Color.Blue));
      expect(first.totalCount()).assertEqual(2);
      expect(second.totalCount()).assertEqual(0);
      second.pushData(new ColorModel('b1', 't1', Color.Green));
      expect(first.totalCount()).assertEqual(2);
      expect(second.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'color_instances_isolated end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_ISOLATION_0200
     * @tc.name friend_instances_isolated
     * @tc.desc Verify two FriendMomentsData instances keep independent state
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('friend_instances_isolated', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'friend_instances_isolated begin');
      const first: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      const second: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      first.pushData(new FriendMoment('f1', 'u1', 'a', 't', 'i', new ShareModel(1, 1, 1)));
      expect(first.totalCount()).assertEqual(1);
      expect(second.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'friend_instances_isolated end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_ISOLATION_0300
     * @tc.name original_unaffected_by_new_instance
     * @tc.desc Verify existing ColorData is unaffected by a new instance
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('original_unaffected_by_new_instance', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'original_unaffected_by_new_instance begin');
      const original: ColorData = new ColorData();
      original.pushData(new ColorModel('o1', 't1', Color.Pink));
      original.pushData(new ColorModel('o2', 't2', Color.Pink));
      original.pushData(new ColorModel('o3', 't3', Color.Pink));
      const temp: ColorData = new ColorData();
      temp.pushData(new ColorModel('tmp', 'tmp', Color.Black));
      expect(original.totalCount()).assertEqual(3);
      const got: ColorModel = original.getData(0) as ColorModel;
      expect(got.id).assertEqual('o1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'original_unaffected_by_new_instance end');
    });
  })
}
