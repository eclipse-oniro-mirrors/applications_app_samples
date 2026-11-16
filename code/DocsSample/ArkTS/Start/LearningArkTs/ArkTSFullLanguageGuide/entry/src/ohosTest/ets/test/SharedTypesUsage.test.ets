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

import { describe, beforeEach, it, expect } from '@ohos/hypium';
import { getProfileName, canRead } from '../../../main/ets/pages/SharedTypesUsage';
import { UserIdentity } from '../../../main/ets/common/Types';
import { logBegin, logEnd } from './ArkTSGuideUiSupport';

function profileNameMatrix(ids: number[]): string[] {
  const names: string[] = [];
  for (let i = 0; i < ids.length; i++) {
    names.push(getProfileName({ id: ids[i] }));
  }
  return names;
}

function readDecisionMatrix(ids: number[]): boolean[] {
  const results: boolean[] = [];
  for (let i = 0; i < ids.length; i++) {
    results.push(canRead({ id: ids[i] }));
  }
  return results;
}

/**
 * pages/SharedTypesUsage.ets 共用类型 UserIdentity 的使用契约。
 */
export default function ArkTSSharedTypesTest(): void {
  describe('ArkTSSharedTypesTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testProfileNamePositiveId0001
     * @tc.name      testProfileNamePositiveId0001
     * @tc.desc      Verify getProfileName prefixes the id with "user-"
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testProfileNamePositiveId0001', 0, () => {
      logBegin('testProfileNamePositiveId0001');
      const identity: UserIdentity = { id: 7 };
      expect(getProfileName(identity)).assertEqual('user-7');
      expect(getProfileName(identity).length).assertEqual(6);
      expect(getProfileName(identity).indexOf('user-')).assertEqual(0);
      logEnd('testProfileNamePositiveId0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testProfileNameZeroId0002
     * @tc.name      testProfileNameZeroId0002
     * @tc.desc      Verify id 0 still yields the "user-0" profile name
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testProfileNameZeroId0002', 0, () => {
      logBegin('testProfileNameZeroId0002');
      expect(getProfileName({ id: 0 })).assertEqual('user-0');
      expect(getProfileName({ id: 0 })).assertEqual('user-' + '0');
      logEnd('testProfileNameZeroId0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testProfileNameLargeId0003
     * @tc.name      testProfileNameLargeId0003
     * @tc.desc      Verify large ids are stringified without truncation
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testProfileNameLargeId0003', 0, () => {
      logBegin('testProfileNameLargeId0003');
      expect(getProfileName({ id: 123456789 })).assertEqual('user-123456789');
      expect(getProfileName({ id: 123456789 }).length).assertEqual(14);
      logEnd('testProfileNameLargeId0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testProfileNameNegativeId0004
     * @tc.name      testProfileNameNegativeId0004
     * @tc.desc      Verify negative ids are formatted as "user-" plus the negative number
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testProfileNameNegativeId0004', 0, () => {
      logBegin('testProfileNameNegativeId0004');
      expect(getProfileName({ id: -3 })).assertEqual('user--3');
      expect(getProfileName({ id: -3 }).indexOf('user-')).assertEqual(0);
      expect(getProfileName({ id: -3 }).length).assertEqual(7);
      logEnd('testProfileNameNegativeId0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testProfileNameMatrix0005
     * @tc.name      testProfileNameMatrix0005
     * @tc.desc      Verify a matrix of ids maps to the expected prefixed names
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testProfileNameMatrix0005', 0, () => {
      logBegin('testProfileNameMatrix0005');
      const names: string[] = profileNameMatrix([1, 2, 10, 99]);
      expect(names.join(',')).assertEqual('user-1,user-2,user-10,user-99');
      expect(names.length).assertEqual(4);
      logEnd('testProfileNameMatrix0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testProfileNameDeterministic0006
     * @tc.name      testProfileNameDeterministic0006
     * @tc.desc      Verify getProfileName has no hidden state across repeated calls
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testProfileNameDeterministic0006', 0, () => {
      logBegin('testProfileNameDeterministic0006');
      const identity: UserIdentity = { id: 5 };
      expect(getProfileName(identity)).assertEqual(getProfileName(identity));
      identity.id = 6;
      expect(getProfileName(identity)).assertEqual('user-6');
      logEnd('testProfileNameDeterministic0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testCanReadPositiveId0007
     * @tc.name      testCanReadPositiveId0007
     * @tc.desc      Verify canRead grants read permission for positive ids
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testCanReadPositiveId0007', 0, () => {
      logBegin('testCanReadPositiveId0007');
      expect(canRead({ id: 1 })).assertTrue();
      expect(canRead({ id: 999 })).assertTrue();
      expect(canRead({ id: 1 })).assertEqual(true);
      logEnd('testCanReadPositiveId0007');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testCanReadZeroId0008
     * @tc.name      testCanReadZeroId0008
     * @tc.desc      Verify id 0 is denied read permission (strict greater-than boundary)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testCanReadZeroId0008', 0, () => {
      logBegin('testCanReadZeroId0008');
      expect(canRead({ id: 0 })).assertFalse();
      expect(canRead({ id: 0 })).assertEqual(false);
      logEnd('testCanReadZeroId0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testCanReadNegativeId0009
     * @tc.name      testCanReadNegativeId0009
     * @tc.desc      Verify negative ids are denied read permission
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testCanReadNegativeId0009', 0, () => {
      logBegin('testCanReadNegativeId0009');
      expect(canRead({ id: -1 })).assertFalse();
      expect(canRead({ id: -2147483647 })).assertFalse();
      logEnd('testCanReadNegativeId0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHARED_TYPES_testCanReadBoundaryMatrix0010
     * @tc.name      testCanReadBoundaryMatrix0010
     * @tc.desc      Verify the permission boundary flips exactly between -1, 0 and 1
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testCanReadBoundaryMatrix0010', 0, () => {
      logBegin('testCanReadBoundaryMatrix0010');
      const results: boolean[] = readDecisionMatrix([-2, -1, 0, 1, 2]);
      expect(results.join(',')).assertEqual('false,false,false,true,true');
      expect(results.length).assertEqual(5);
      logEnd('testCanReadBoundaryMatrix0010');
    });

  });
}
