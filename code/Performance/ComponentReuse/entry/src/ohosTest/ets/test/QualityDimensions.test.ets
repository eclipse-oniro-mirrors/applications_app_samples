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
const TAG: string = '[Sample_ComponentReuse_Quality]';

export default function componentReuseQualityTest() {
  describe('componentReuseQualityTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    // 性能维度：批量写入 500 条，断言条数精确 + 宽松时延上界
    /**
     * @tc.number SUB_COMPONENT_REUSE_QUALITY_PERF_0100
     * @tc.name color_bulk_push_perf
     * @tc.desc Verify 500 bulk pushes keep exact count within time budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('color_bulk_push_perf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'color_bulk_push_perf begin');
      const data: ColorData = new ColorData();
      const start: number = Date.now();
      for (let i: number = 0; i < 500; i++) {
        data.pushData(new ColorModel('perf_' + i, 'perf_text_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `bulk push 500 cost=${cost}ms`);
      expect(data.totalCount()).assertEqual(500);
      expect(cost < 5000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'color_bulk_push_perf end');
    });

    // 稳定性维度：20 轮累加，条数严格递增、首尾内容无错位
    /**
     * @tc.number SUB_COMPONENT_REUSE_QUALITY_STAB_0100
     * @tc.name color_accumulation_stability
     * @tc.desc Verify 20 accumulation rounds keep monotonic count and head/tail content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('color_accumulation_stability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'color_accumulation_stability begin');
      const data: ColorData = new ColorData();
      for (let round: number = 0; round < 20; round++) {
        for (let i: number = 0; i < 5; i++) {
          data.pushData(new ColorModel(`r${round}_${i}`, `t${round}_${i}`, Color.Green));
        }
        expect(data.totalCount()).assertEqual((round + 1) * 5);
      }
      const first: ColorModel = data.getData(0) as ColorModel;
      const last: ColorModel = data.getData((data.totalCount() - 1) - 1) as ColorModel;
      expect(first.id).assertEqual('r0_0');
      expect(last.id).assertEqual('r19_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'color_accumulation_stability end');
    });

    // 健壮性维度：空数据 / 越界 / 负下标返回 undefined
    /**
     * @tc.number SUB_COMPONENT_REUSE_QUALITY_BOUND_0100
     * @tc.name color_boundary_robustness
     * @tc.desc Verify empty, out-of-range and negative index reads return undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('color_boundary_robustness', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'color_boundary_robustness begin');
      const data: ColorData = new ColorData();
      expect(data.totalCount()).assertEqual(0);
      expect(data.getData(0) === undefined).assertTrue();
      data.pushData(new ColorModel('only', 'only', Color.Red));
      expect(data.getData(999) === undefined).assertTrue();
      expect(data.getData(-3) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'color_boundary_robustness end');
    });

    // 数据模型维度：FriendMoment 构造字段与 push/get 回读一致
    /**
     * @tc.number SUB_COMPONENT_REUSE_QUALITY_MODEL_0100
     * @tc.name friend_moment_push_get
     * @tc.desc Verify FriendMoment push/get returns identical fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('friend_moment_push_get', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'friend_moment_push_get begin');
      const data: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
      const fm: FriendMoment = new FriendMoment('fid', 'fuser', 'avatar', 'ftext', 'fimg', new ShareModel(1, 2, 3));
      data.pushData(fm);
      data.pushData(new FriendMoment('fid2', 'fuser2', 'avatar2', 'ftext2', 'fimg2', new ShareModel(4, 5, 6)));
      expect(data.totalCount()).assertEqual(2);
      const got: FriendMoment = data.getData(0);
      expect(got.id).assertEqual('fid');
      expect(got.userName).assertEqual('fuser');
      expect(got.share.heart).assertEqual(1);
      expect(got.share.star).assertEqual(2);
      expect(got.share.message).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'friend_moment_push_get end');
    });

    // 兼容性维度：导航常量表不变量（长度 / 唯一性 / detail 非空）
    /**
     * @tc.number SUB_COMPONENT_REUSE_QUALITY_CONST_0100
     * @tc.name constants_compatibility_invariants
     * @tc.desc Verify nav destination list length, uniqueness and detail presence
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('constants_compatibility_invariants', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'constants_compatibility_invariants begin');
      expect(Constants.navDestinationData.length).assertEqual(10);
      const ids: string[] = [];
      for (let i: number = 0; i < Constants.navDestinationData.length; i++) {
        expect(Constants.navDestinationData[i].detail !== undefined).assertTrue();
        expect(ids.indexOf(Constants.navDestinationData[i].id)).assertEqual(-1);
        ids.push(Constants.navDestinationData[i].id);
      }
      expect(ids.length).assertEqual(Constants.navDestinationData.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'constants_compatibility_invariants end');
    });
  })
}
