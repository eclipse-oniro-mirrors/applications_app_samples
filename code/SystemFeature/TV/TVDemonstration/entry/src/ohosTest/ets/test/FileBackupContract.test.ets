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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { bundleManager, common, UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { startAppWithRetry } from './TestScenarioUtils';


// Shared launch signal: every sandbox-facing suite observes the same application ability.
const FILE_BACKUP_CONTRACT_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};

const BACKUP_MODULE: string = 'entry';
const BACKUP_EXTENSION: string = 'EntryBackupAbility';
const BACKUP_METADATA: string = 'ohos.extension.backup';

interface BackupProfile {
  allowToBackupRestore: boolean;
}

export default function fileBackupContractTest(): void {
  describe('BackupProfileContractTest', () => {
    let baselineProfile: string;

    const parseProfile = (source: string): BackupProfile => {
      return JSON.parse(source) as BackupProfile;
    };

    const assertBackupEnabled = (source: string): void => {
      const profile: BackupProfile = parseProfile(source);
      expect(profile.allowToBackupRestore).assertTrue();
      expect(source.trim().startsWith('{')).assertTrue();
      expect(source.trim().endsWith('}')).assertTrue();
    };

    beforeAll((): void => {
      const profiles: string[] = bundleManager.getProfileByExtensionAbilitySync(
        BACKUP_MODULE, BACKUP_EXTENSION, BACKUP_METADATA
      );
      baselineProfile = profiles[0];
    });

    beforeEach((): void => {
      const profiles: string[] = bundleManager.getProfileByExtensionAbilitySync(
        BACKUP_MODULE, BACKUP_EXTENSION, BACKUP_METADATA
      );
      expect(profiles.length).assertEqual(1);
      baselineProfile = profiles[0];
    });

    afterEach((): void => {
      const current: string[] = bundleManager.getProfileByExtensionAbilitySync(
        BACKUP_MODULE, BACKUP_EXTENSION, BACKUP_METADATA
      );
      expect(current.length).assertEqual(1);
      expect(current[0]).assertEqual(baselineProfile);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BACKUP_PROFILE_0100
     * @tc.name backupProfileSynchronousContent001
     * @tc.desc Verify getProfileByExtensionAbilitySync parses the installed backup enablement profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupProfileSynchronousContent001', 0, (): void => {
      const profiles: string[] = bundleManager.getProfileByExtensionAbilitySync(
        BACKUP_MODULE, BACKUP_EXTENSION, BACKUP_METADATA
      );
      expect(profiles.length).assertEqual(1);
      assertBackupEnabled(profiles[0]);

      // Reading through BMS verifies the profile embedded in the installed HAP, not the
      // source-tree JSON file that could diverge because of packaging configuration.
      expect(profiles[0]).assertEqual(baselineProfile);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BACKUP_PROFILE_0200
     * @tc.name backupProfilePromiseConsistency002
     * @tc.desc Verify Promise getProfileByExtensionAbility matches the synchronous installed profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupProfilePromiseConsistency002', 0, async (): Promise<void> => {
      const profiles: string[] = await bundleManager.getProfileByExtensionAbility(
        BACKUP_MODULE, BACKUP_EXTENSION, BACKUP_METADATA
      );
      expect(profiles.length).assertEqual(1);
      expect(profiles[0]).assertEqual(baselineProfile);
      assertBackupEnabled(profiles[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BACKUP_PROFILE_0300
     * @tc.name backupProfileCallbackConsistency003
     * @tc.desc Verify callback getProfileByExtensionAbility returns the same installed backup profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupProfileCallbackConsistency003', 0, async (): Promise<void> => {
      let callbackProfile: string = '';
      await new Promise<void>((resolve, reject) => {
        bundleManager.getProfileByExtensionAbility(
          BACKUP_MODULE, BACKUP_EXTENSION, BACKUP_METADATA,
          (error: BusinessError, profiles: string[]): void => {
            if (error && error.code !== 0) {
              reject(error);
              return;
            }
            expect(profiles.length).assertEqual(1);
            callbackProfile = profiles[0];
            resolve();
          }
        );
      });
      expect(callbackProfile).assertEqual(baselineProfile);
      assertBackupEnabled(callbackProfile);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BACKUP_PROFILE_0400
     * @tc.name backupProfileMetadataEnumeration004
     * @tc.desc Verify getProfileByExtensionAbility without metadataName enumerates the sole backup profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupProfileMetadataEnumeration004', 0, async (): Promise<void> => {
      const synchronous: string[] = bundleManager.getProfileByExtensionAbilitySync(
        BACKUP_MODULE, BACKUP_EXTENSION
      );
      const asynchronous: string[] = await bundleManager.getProfileByExtensionAbility(
        BACKUP_MODULE, BACKUP_EXTENSION
      );
      expect(synchronous.length).assertEqual(1);
      expect(asynchronous.length).assertEqual(1);
      expect(synchronous[0]).assertEqual(baselineProfile);
      expect(asynchronous[0]).assertEqual(baselineProfile);
      assertBackupEnabled(synchronous[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BACKUP_PROFILE_0500
     * @tc.name backupProfileConcurrentQueries005
     * @tc.desc Verify concurrent getProfileByExtensionAbility requests preserve one immutable profile snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupProfileConcurrentQueries005', 0, async (): Promise<void> => {
      const requests: Promise<string[]>[] = [];
      for (let index: number = 0; index < 8; index++) {
        requests.push(bundleManager.getProfileByExtensionAbility(
          BACKUP_MODULE, BACKUP_EXTENSION, BACKUP_METADATA
        ));
      }
      const snapshots: string[][] = await Promise.all(requests);
      for (let index: number = 0; index < snapshots.length; index++) {
        expect(snapshots[index].length).assertEqual(1);
        expect(snapshots[index][0]).assertEqual(baselineProfile);
        assertBackupEnabled(snapshots[index][0]);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BACKUP_PROFILE_0600
     * @tc.name backupProfileMissingModule006
     * @tc.desc Verify getProfileByExtensionAbilitySync rejects a module absent from TVDemonstation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupProfileMissingModule006', 0, (): void => {
      let failureCode: number = 0;
      try {
        bundleManager.getProfileByExtensionAbilitySync(
          'missing_entry_module', BACKUP_EXTENSION, BACKUP_METADATA
        );
        expect().assertFail();
      } catch (error) {
        const failure: BusinessError = error as BusinessError;
        failureCode = failure.code;
      }
      expect(failureCode).assertEqual(17700003);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BACKUP_PROFILE_0700
     * @tc.name backupProfileMissingExtension007
     * @tc.desc Verify getProfileByExtensionAbility rejects a missing backup extension name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupProfileMissingExtension007', 0, async (): Promise<void> => {
      let failureCode: number = 0;
      try {
        await bundleManager.getProfileByExtensionAbility(
          BACKUP_MODULE, 'MissingBackupExtension', BACKUP_METADATA
        );
        expect().assertFail();
      } catch (error) {
        const failure: BusinessError = error as BusinessError;
        failureCode = failure.code;
      }
      expect(failureCode).assertEqual(17700003);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BACKUP_PROFILE_0800
     * @tc.name backupProfileMissingMetadata008
     * @tc.desc Verify getProfileByExtensionAbilitySync rejects metadata without a packaged profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupProfileMissingMetadata008', 0, (): void => {
      let failureCode: number = 0;
      try {
        bundleManager.getProfileByExtensionAbilitySync(
          BACKUP_MODULE, BACKUP_EXTENSION, 'missing.backup.profile'
        );
        expect().assertFail();
      } catch (error) {
        const failure: BusinessError = error as BusinessError;
        failureCode = failure.code;
      }
      expect(failureCode).assertEqual(17700024);
    });
  });

}
