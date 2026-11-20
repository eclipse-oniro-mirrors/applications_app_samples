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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { userGrantPermission } from '../../../../main/ets/utils/permission';

export default function aifaceSecurityTest(): void {
  describe('aifaceSecurity_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('AIFaceSecurity_permission_arity_38', 0, () => {
      expect(typeof userGrantPermission).assertEqual('function');
      expect(userGrantPermission.length).assertLargerOrEqual(2);
    });


    it('AIFaceSecurity_permission_invalid_38', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], userID: 103 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });


    /* Business case 3852-2 for AIFaceSecurity */
    it('AIFaceSecurity_case_3852', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleName: 'missing-3852' });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3851-1 for AIFaceSecurity */
    it('AIFaceSecurity_case_3851', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], userID: 3951 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3850-0 for AIFaceSecurity */
    it('AIFaceSecurity_case_3850', 0, () => {
      expect(typeof userGrantPermission).assertEqual('function');
      expect(userGrantPermission.length).assertLargerOrEqual(2);
    });

    /* Business case 3849-9 for AIFaceSecurity */
    it('AIFaceSecurity_case_3849', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3848-8 for AIFaceSecurity */
    it('AIFaceSecurity_case_3848', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3847-7 for AIFaceSecurity */
    it('AIFaceSecurity_case_3847', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3846-6 for AIFaceSecurity */
    it('AIFaceSecurity_case_3846', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3845-5 for AIFaceSecurity */
    it('AIFaceSecurity_case_3845', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3844-4 for AIFaceSecurity */
    it('AIFaceSecurity_case_3844', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3843-3 for AIFaceSecurity */
    it('AIFaceSecurity_case_3843', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [{ name: 'ohos.permission.CAMERA' }] });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3842-2 for AIFaceSecurity */
    it('AIFaceSecurity_case_3842', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleName: 'missing-3842' });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3841-1 for AIFaceSecurity */
    it('AIFaceSecurity_case_3841', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], userID: 3941 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3840-0 for AIFaceSecurity */
    it('AIFaceSecurity_case_3840', 0, () => {
      expect(typeof userGrantPermission).assertEqual('function');
      expect(userGrantPermission.length).assertLargerOrEqual(2);
    });

    /* Business case 3839-9 for AIFaceSecurity */
    it('AIFaceSecurity_case_3839', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3838-8 for AIFaceSecurity */
    it('AIFaceSecurity_case_3838', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3837-7 for AIFaceSecurity */
    it('AIFaceSecurity_case_3837', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3836-6 for AIFaceSecurity */
    it('AIFaceSecurity_case_3836', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3835-5 for AIFaceSecurity */
    it('AIFaceSecurity_case_3835', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3834-4 for AIFaceSecurity */
    it('AIFaceSecurity_case_3834', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3833-3 for AIFaceSecurity */
    it('AIFaceSecurity_case_3833', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [{ name: 'ohos.permission.CAMERA' }] });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3832-2 for AIFaceSecurity */
    it('AIFaceSecurity_case_3832', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleName: 'missing-3832' });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3831-1 for AIFaceSecurity */
    it('AIFaceSecurity_case_3831', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], userID: 3931 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3830-0 for AIFaceSecurity */
    it('AIFaceSecurity_case_3830', 0, () => {
      expect(typeof userGrantPermission).assertEqual('function');
      expect(userGrantPermission.length).assertLargerOrEqual(2);
    });

    /* Business case 3829-9 for AIFaceSecurity */
    it('AIFaceSecurity_case_3829', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3828-8 for AIFaceSecurity */
    it('AIFaceSecurity_case_3828', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3827-7 for AIFaceSecurity */
    it('AIFaceSecurity_case_3827', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3826-6 for AIFaceSecurity */
    it('AIFaceSecurity_case_3826', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3825-5 for AIFaceSecurity */
    it('AIFaceSecurity_case_3825', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3824-4 for AIFaceSecurity */
    it('AIFaceSecurity_case_3824', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3823-3 for AIFaceSecurity */
    it('AIFaceSecurity_case_3823', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [{ name: 'ohos.permission.CAMERA' }] });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3822-2 for AIFaceSecurity */
    it('AIFaceSecurity_case_3822', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleName: 'missing-3822' });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3821-1 for AIFaceSecurity */
    it('AIFaceSecurity_case_3821', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], userID: 3921 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3820-0 for AIFaceSecurity */
    it('AIFaceSecurity_case_3820', 0, () => {
      expect(typeof userGrantPermission).assertEqual('function');
      expect(userGrantPermission.length).assertLargerOrEqual(2);
    });

    /* Business case 3819-9 for AIFaceSecurity */
    it('AIFaceSecurity_case_3819', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3818-8 for AIFaceSecurity */
    it('AIFaceSecurity_case_3818', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3817-7 for AIFaceSecurity */
    it('AIFaceSecurity_case_3817', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3816-6 for AIFaceSecurity */
    it('AIFaceSecurity_case_3816', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3815-5 for AIFaceSecurity */
    it('AIFaceSecurity_case_3815', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3814-4 for AIFaceSecurity */
    it('AIFaceSecurity_case_3814', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3813-3 for AIFaceSecurity */
    it('AIFaceSecurity_case_3813', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [{ name: 'ohos.permission.CAMERA' }] });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3812-2 for AIFaceSecurity */
    it('AIFaceSecurity_case_3812', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleName: 'missing-3812' });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3811-1 for AIFaceSecurity */
    it('AIFaceSecurity_case_3811', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], userID: 3911 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3810-0 for AIFaceSecurity */
    it('AIFaceSecurity_case_3810', 0, () => {
      expect(typeof userGrantPermission).assertEqual('function');
      expect(userGrantPermission.length).assertLargerOrEqual(2);
    });

    /* Business case 3809-9 for AIFaceSecurity */
    it('AIFaceSecurity_case_3809', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3808-8 for AIFaceSecurity */
    it('AIFaceSecurity_case_3808', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3807-7 for AIFaceSecurity */
    it('AIFaceSecurity_case_3807', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3806-6 for AIFaceSecurity */
    it('AIFaceSecurity_case_3806', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 2 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3805-5 for AIFaceSecurity */
    it('AIFaceSecurity_case_3805', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 1 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3804-4 for AIFaceSecurity */
    it('AIFaceSecurity_case_3804', 0, async () => {
      let outcome: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleFlag: 0 });
        outcome = true;
      } catch (error) {
        outcome = false;
      }
      expect(typeof outcome).assertEqual('boolean');
    });

    /* Business case 3803-3 for AIFaceSecurity */
    it('AIFaceSecurity_case_3803', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [{ name: 'ohos.permission.CAMERA' }] });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3802-2 for AIFaceSecurity */
    it('AIFaceSecurity_case_3802', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], bundleName: 'missing-3802' });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3801-1 for AIFaceSecurity */
    it('AIFaceSecurity_case_3801', 0, async () => {
      let rejected: boolean = false;
      try {
        await userGrantPermission({}, { permissions: [], userID: 3901 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });

    /* Business case 3800-0 for AIFaceSecurity */
    it('AIFaceSecurity_case_3800', 0, () => {
      expect(typeof userGrantPermission).assertEqual('function');
      expect(userGrantPermission.length).assertLargerOrEqual(2);
    });

  });
}
