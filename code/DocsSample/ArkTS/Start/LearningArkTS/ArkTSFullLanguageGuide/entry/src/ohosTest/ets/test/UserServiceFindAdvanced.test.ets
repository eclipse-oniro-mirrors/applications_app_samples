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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UserService } from '../../../main/ets/common/Service';
import { User } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_USER_SERVICE]';

export default function UserServiceFindAdvanced(): void {
  describe('UserServiceFindAdvanced', () => {
    /**
     * @tc.number    SUB_ARKTS_GUIDE_USERSERVICE_testUserServiceFindAdvanced0001
     * @tc.name      testUserServiceFindAdvanced0001
     * @tc.desc      UserService.findById returns documented result for id 260.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUserServiceFindAdvanced0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserServiceFindAdvanced0001 begin');
      const id: number = 260;
      const service: UserService = new UserService();
      const result: User | null = service.findById(id);
      const expectedNull: boolean = id <= 0;
      expect(result === null).assertEqual(expectedNull);
      if (expectedNull) {
        expect(result).assertNull();
        expect(service.findById(id) === null).assertTrue();
      } else {
        expect((result as User).id).assertEqual(id);
        expect((result as User).name).assertEqual('Alice');
        expect((result as User).id <= 0).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserServiceFindAdvanced0001 end');
    })

  });
}
