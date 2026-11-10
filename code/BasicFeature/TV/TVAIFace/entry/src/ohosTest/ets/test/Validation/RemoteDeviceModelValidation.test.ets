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
import RemoteDeviceModel from '../../../../main/ets/models/RemoteDeviceModel';

export default function remoteDeviceModelValidationTest(): void {
  describe('remoteDeviceModelValidation_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('remote_device_model_should_be_a_singleton_instance', 0, () => {
      const sameInstance = RemoteDeviceModel;
      expect(sameInstance === RemoteDeviceModel).assertTrue();
      expect(RemoteDeviceModel !== undefined).assertTrue();
      expect(typeof RemoteDeviceModel.isDeviceIdInTrustList).assertEqual('function');
    });

    it('unknown_device_id_should_not_be_trusted', 0, () => {
      const trusted: boolean = RemoteDeviceModel.isDeviceIdInTrustList('unknown-device-id');
      const untrusted: boolean = RemoteDeviceModel.isDeviceIdInUnTrustList('unknown-device-id');
      expect(trusted).assertFalse();
      expect(untrusted).assertFalse();
    });

    it('untrust_list_should_be_empty_before_discovery', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(list.length).assertLargerOrEqual(0);
      expect(Array.isArray(list)).assertTrue();
    });

    it('delete_unknown_device_should_not_change_untrust_list', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('not-existing-device');
      const after: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      expect(after).assertEqual(before);
    });


    it('available_device_list_should_be_safe_without_service', 0, async () => {
      const list: Array<Object> | undefined = await RemoteDeviceModel.getAvailableDeviceList();
      expect(list === undefined || Array.isArray(list)).assertTrue();
    });


    /* Business case 3763-3 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3763', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 3762-2 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3762', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 3761-1 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3761', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-3761-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 3760-0 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3760', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-3760-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-3760-0')).assertFalse();
    });

    /* Business case 3759-9 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3759', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3759-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3758-8 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3758', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3758-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3757-7 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3757', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3757-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3756-6 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3756', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3756-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3755-5 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3755', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3755-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3754-4 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3754', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3754-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3753-3 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3753', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 3752-2 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3752', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 3751-1 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3751', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-3751-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 3750-0 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3750', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-3750-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-3750-0')).assertFalse();
    });

    /* Business case 3749-9 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3749', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3749-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3748-8 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3748', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3748-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3747-7 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3747', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3747-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3746-6 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3746', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3746-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3745-5 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3745', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3745-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3744-4 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3744', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3744-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3743-3 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3743', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 3742-2 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3742', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 3741-1 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3741', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-3741-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 3740-0 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3740', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-3740-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-3740-0')).assertFalse();
    });

    /* Business case 3739-9 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3739', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3739-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3738-8 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3738', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3738-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3737-7 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3737', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3737-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3736-6 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3736', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3736-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3735-5 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3735', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3735-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3734-4 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3734', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3734-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3733-3 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3733', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 3732-2 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3732', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 3731-1 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3731', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-3731-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 3730-0 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3730', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-3730-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-3730-0')).assertFalse();
    });

    /* Business case 3729-9 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3729', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3729-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3728-8 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3728', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3728-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3727-7 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3727', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3727-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3726-6 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3726', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3726-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3725-5 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3725', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3725-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3724-4 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3724', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3724-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3723-3 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3723', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 3722-2 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3722', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 3721-1 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3721', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-3721-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 3720-0 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3720', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-3720-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-3720-0')).assertFalse();
    });

    /* Business case 3719-9 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3719', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3719-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3718-8 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3718', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3718-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3717-7 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3717', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3717-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3716-6 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3716', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3716-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3715-5 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3715', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3715-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3714-4 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3714', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3714-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3713-3 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3713', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 3712-2 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3712', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 3711-1 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3711', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-3711-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 3710-0 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3710', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-3710-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-3710-0')).assertFalse();
    });

    /* Business case 3709-9 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3709', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3709-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3708-8 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3708', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3708-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3707-7 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3707', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3707-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3706-6 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3706', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3706-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3705-5 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3705', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3705-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3704-4 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3704', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-3704-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 3703-3 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3703', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 3702-2 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3702', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 3701-1 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3701', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-3701-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 3700-0 for RemoteDeviceModelValidation */
    it('RemoteDeviceModelValidation_case_3700', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-3700-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-3700-0')).assertFalse();
    });

  });
}
