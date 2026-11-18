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
const TAG: string = '[Sample_ComponentReuse_FriendField]';

interface FriendCase {
  name: string;
  id: string;
  userName: string;
  heart: number;
  star: number;
  message: number;
}

const FRIEND_CASES: FriendCase[] = [
  { name: 'zero', id: 'ff_zero', userName: 'u_zero', heart: 0, star: 0, message: 0 },
  { name: 'small', id: 'ff_small', userName: 'u_small', heart: 1, star: 2, message: 3 },
  { name: 'medium', id: 'ff_medium', userName: 'u_medium', heart: 10, star: 20, message: 30 },
  { name: 'large', id: 'ff_large', userName: 'u_large', heart: 1000, star: 2000, message: 3000 },
  { name: 'skewed', id: 'ff_skewed', userName: 'u_skewed', heart: 0, star: 999, message: 1 }
];

export default function friendMomentFieldMatrixTest() {
  describe('friendMomentFieldMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    FRIEND_CASES.forEach((c: FriendCase) => {
      it(`friend_field_${c.name}`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', `friend_field_${c.name} begin`);
        const data: FriendMomentsData = new FriendMomentsData(undefined, Constants.NAV_DESTINATION_ITEM_3);
        data.pushData(new FriendMoment(c.id, c.userName, 'avatar', 'text', 'img',
          new ShareModel(c.heart, c.star, c.message)));
        data.pushData(new FriendMoment('tail', 'tail', 'a', 't', 'i', new ShareModel(0, 0, 0)));
        expect(data.totalCount()).assertEqual(2);
        const got: FriendMoment = data.getData(0);
        expect(got.id).assertEqual(c.id);
        expect(got.userName).assertEqual(c.userName);
        expect(got.share.heart).assertEqual(c.heart);
        expect(got.share.star).assertEqual(c.star);
        expect(got.share.message).assertEqual(c.message);
        hilog.info(DOMAIN, TAG, '%{public}s', `friend_field_${c.name} end`);
      });
    });
  })
}
