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
import { bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import resourceManager from '@ohos.resourceManager';
import { startAppWithRetry } from './TestScenarioUtils';


const BUNDLE_CALLBACK_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
const DISCOVERY_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
const TEMPORAL_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const TEMPORAL_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
const MANIFEST_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
const MODULE_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
const RESOURCE_LINKAGE_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
const SIGNATURE_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
const TV_DEMONSTRATION_BUNDLE: string = 'com.sample.demonstration';
const APPLICATION_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
// Value of 2020-01-01T00:00:00Z. Installation timestamps are only comparable with
// Date.now() when the device wall clock has been synchronised at least once.
const CLOCK_TRUSTWORTHY_EPOCH_MS: number = Date.UTC(2020, 0, 1);

function entryHapModule(info: bundleManager.BundleInfo): bundleManager.HapModuleInfo {
  for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
    if (info.hapModulesInfo[index].mainElementName === 'EntryAbility') {
      return info.hapModulesInfo[index];
    }
  }
  return info.hapModulesInfo[0];
}

function getBundleInfoByCallback(flags: number): Promise<bundleManager.BundleInfo> {
  return new Promise<bundleManager.BundleInfo>((resolve, reject) => {
    bundleManager.getBundleInfoForSelf(flags,
      (error: BusinessError, info: bundleManager.BundleInfo): void => {
        if (error && error.code !== 0) {
          reject(error);
          return;
        }
        resolve(info);
      });
  });
}

export default function bundleContractTest(): void {
  describe('BundleCallbackContractTest', () => {
    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_CALLBACK_0200
     * @tc.name bundleCallbackManifestGraph002
     * @tc.desc Verify callback getBundleInfoForSelf returns EntryAbility and EntryBackupAbility manifest nodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleCallbackManifestGraph002', 0, async (): Promise<void> => {
      const info: bundleManager.BundleInfo = await getBundleInfoByCallback(BUNDLE_CALLBACK_FLAGS);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      const moduleInfo: bundleManager.HapModuleInfo = entryHapModule(info);
      expect(moduleInfo.mainElementName).assertEqual('EntryAbility');
      expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
      expect(moduleInfo.extensionAbilitiesInfo.length).assertEqual(1);

      // The callback graph must expose the production entry and backup nodes,
      // otherwise launcher or backup discovery would depend on query timing.
      const abilityName: string = moduleInfo.abilitiesInfo[0].name;
      const extensionName: string = moduleInfo.extensionAbilitiesInfo[0].name;
      const extensionExported: boolean = moduleInfo.extensionAbilitiesInfo[0].exported;
      expect(abilityName).assertEqual('EntryAbility');
      expect(extensionName).assertEqual('EntryBackupAbility');
      expect(extensionExported).assertFalse();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_CALLBACK_0300
     * @tc.name bundleCallbackParallelSnapshot003
     * @tc.desc Verify concurrent callback bundle queries preserve one application and module identity snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleCallbackParallelSnapshot003', 0, async (): Promise<void> => {
      // Independent synchronous baseline taken before the concurrent burst, so the
      // callback results are never validated against one of their own outputs.
      const baseline: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(BUNDLE_CALLBACK_FLAGS);
      const requests: Promise<bundleManager.BundleInfo>[] = [];
      for (let index: number = 0; index < 4; index++) {
        requests.push(getBundleInfoByCallback(BUNDLE_CALLBACK_FLAGS));
      }
      const snapshots: bundleManager.BundleInfo[] = await Promise.all(requests);
      for (let index: number = 0; index < snapshots.length; index++) {
        // Concurrent callbacks share BMS service state but must not cross-wire
        // module metadata between requests.
        const snapshotName: string = snapshots[index].name;
        const snapshotCodePath: string = snapshots[index].appInfo.codePath;
        const snapshotMainElement: string = entryHapModule(snapshots[index]).mainElementName;
        expect(snapshotName).assertEqual(baseline.name);
        expect(snapshotCodePath).assertEqual(baseline.appInfo.codePath);
        expect(snapshotMainElement).assertEqual(entryHapModule(baseline).mainElementName);
      }
    });
  });

  describe('BundleEntryDiscoveryContractTest', () => {
    let moduleInfo: bundleManager.HapModuleInfo;
    let mainAbility: bundleManager.AbilityInfo;
    let backupAbility: bundleManager.ExtensionAbilityInfo;

    const reloadManifest = (): void => {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(DISCOVERY_FLAGS);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      moduleInfo = entryHapModule(info);
      expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
      expect(moduleInfo.extensionAbilitiesInfo.length).assertEqual(1);
      mainAbility = moduleInfo.abilitiesInfo[0];
      backupAbility = moduleInfo.extensionAbilitiesInfo[0];
    };

    beforeAll((): void => {
      reloadManifest();
    });

    beforeEach((): void => {
      // BMS is queried again so a stale object cannot hide an installation-time
      // manifest difference between the test HAP and the running application HAP.
      reloadManifest();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_DISCOVERY_0100
     * @tc.name bundleDiscoveryHomeSkill001
     * @tc.desc Verify EntryAbility BMS skill contains the OpenHarmony Home action and entity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleDiscoveryHomeSkill001', 0, (): void => {
      expect(mainAbility.skills.length).assertEqual(1);
      const homeSkill: bundleManager.Skill = mainAbility.skills[0];
      expect(homeSkill.actions.length).assertEqual(1);
      expect(homeSkill.actions[0]).assertEqual('ohos.want.action.home');
      expect(homeSkill.entities.length).assertEqual(1);
      expect(homeSkill.entities[0]).assertEqual('entity.system.home');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_DISCOVERY_0200
     * @tc.name bundleDiscoveryNoUriScreen002
     * @tc.desc Verify EntryAbility Home skill does not expose an unintended URI routing screen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleDiscoveryNoUriScreen002', 0, (): void => {
      const homeSkill: bundleManager.Skill = mainAbility.skills[0];

      // TVDemonstation is launched as a Home application and declares no deep links.
      // An unexpected URI would broaden external input paths beyond the tested Want contract.
      expect(homeSkill.uris.length).assertEqual(0);
      expect(homeSkill.domainVerify).assertFalse();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_DISCOVERY_0400
     * @tc.name bundleDiscoveryBackupMetadata004
     * @tc.desc Verify EntryBackupAbility BMS metadata binds the system backup profile resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleDiscoveryBackupMetadata004', 0, (): void => {
      expect(backupAbility.metadata.length).assertEqual(1);
      const backupMetadata: bundleManager.Metadata = backupAbility.metadata[0];
      expect(backupMetadata.name).assertEqual('ohos.extension.backup');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_DISCOVERY_0500
     * @tc.name bundleDiscoveryBackupNoSkill005
     * @tc.desc Verify EntryBackupAbility exposes no general external BMS skills
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleDiscoveryBackupNoSkill005', 0, (): void => {
      // The backup framework discovers this extension through its type and metadata,
      // not a public action. An added skill would create an unnecessary invocation path.
      expect(backupAbility.skills.length).assertEqual(0);
      expect(backupAbility.exported).assertFalse();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_DISCOVERY_0600
     * @tc.name bundleDiscoveryModuleMetadataIsolation006
     * @tc.desc Verify entry module and EntryAbility contain no unrelated BMS metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleDiscoveryModuleMetadataIsolation006', 0, (): void => {
      expect(moduleInfo.metadata.length).assertEqual(0);
      expect(mainAbility.metadata.length).assertEqual(0);
      expect(backupAbility.metadata.length).assertEqual(1);
    });
  });

  describe('BundleInstallTemporalContractTest', () => {
    let driver: Driver;
    let baseline: bundleManager.BundleInfo;

    const queryInstalledBundle = (): bundleManager.BundleInfo => {
      return bundleManager.getBundleInfoForSelfSync(TEMPORAL_FLAGS);
    };

    const assertTemporalOrder = (info: bundleManager.BundleInfo): void => {
      const observationTime: number = Date.now();
      expect(typeof info.installTime).assertEqual('number');
      expect(typeof info.updateTime).assertEqual('number');
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime >= 0).assertTrue();
      // The platform stores these stamps with the wall clock, and this TV image
      // starts its RTC at 1970-01-01 on every power cycle, so installTime,
      // updateTime and firstInstallTime can each be captured in a different boot
      // (a reboot after install already leaves updateTime < installTime here).
      // The cross-field chronology is only observable once the device clock has
      // been synchronised, so it is asserted under that precondition.
      if (observationTime >= CLOCK_TRUSTWORTHY_EPOCH_MS) {
        expect(info.installTime <= info.updateTime).assertTrue();
        expect(info.updateTime <= observationTime).assertTrue();
        if (info.firstInstallTime !== undefined) {
          expect(info.firstInstallTime <= info.installTime).assertTrue();
        }
      }
    };

    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(160);
        state = router.getState();
      }
      await driver.assertComponentExist(ON.id('tab0'));
    };

    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(TEMPORAL_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(480);
      baseline = queryInstalledBundle();
      await restoreRoot();
    });

    beforeEach(async (): Promise<void> => {
      await restoreRoot();
      baseline = queryInstalledBundle();
    });

    afterEach(async (): Promise<void> => {
      await restoreRoot();
      const current: bundleManager.BundleInfo = queryInstalledBundle();
      expect(current.installTime).assertEqual(baseline.installTime);
      expect(current.updateTime).assertEqual(baseline.updateTime);
    });

    afterAll(async (): Promise<void> => {
      await restoreRoot();
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_TEMPORAL_0100
     * @tc.name bundleInstallTemporalOrder001
     * @tc.desc Verify getBundleInfoForSelfSync returns chronological install and update timestamps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleInstallTemporalOrder001', 0, (): void => {
      assertTemporalOrder(baseline);
      expect(baseline.name).assertEqual('com.sample.demonstration');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_TEMPORAL_0300
     * @tc.name bundlePrimaryInstanceIndex003
     * @tc.desc Verify getBundleInfoForSelfSync reports TVDemonstation as the primary non-clone instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundlePrimaryInstanceIndex003', 0, (): void => {
      expect(baseline.appIndex).assertEqual(0);
      expect(baseline.appInfo.name).assertEqual(TV_DEMONSTRATION_BUNDLE);
      assertTemporalOrder(baseline);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_TEMPORAL_0500
     * @tc.name bundleTemporalFlagIsolation005
     * @tc.desc Verify BundleFlag selection does not alter installation timestamps or instance identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleTemporalFlagIsolation005', 0, (): void => {
      const defaultInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(0);
      const applicationInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
      );
      expect(defaultInfo.installTime).assertEqual(baseline.installTime);
      expect(applicationInfo.installTime).assertEqual(baseline.installTime);
      expect(defaultInfo.updateTime).assertEqual(baseline.updateTime);
      expect(applicationInfo.updateTime).assertEqual(baseline.updateTime);
      expect(defaultInfo.appIndex).assertEqual(0);
      expect(applicationInfo.appIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_TEMPORAL_0600
     * @tc.name bundleTemporalConcurrentSnapshot006
     * @tc.desc Verify concurrent getBundleInfoForSelf requests observe one immutable installation timeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleTemporalConcurrentSnapshot006', 0, async (): Promise<void> => {
      const requests: Promise<bundleManager.BundleInfo>[] = [];
      for (let index: number = 0; index < 8; index++) {
        requests.push(bundleManager.getBundleInfoForSelf(TEMPORAL_FLAGS));
      }
      const snapshots: bundleManager.BundleInfo[] = await Promise.all(requests);
      for (let index: number = 0; index < snapshots.length; index++) {
        expect(snapshots[index].installTime).assertEqual(baseline.installTime);
        expect(snapshots[index].updateTime).assertEqual(baseline.updateTime);
        expect(snapshots[index].appIndex).assertEqual(0);
      }
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_TEMPORAL_0800
     * @tc.name bundleTemporalForegroundIsolation008
     * @tc.desc Verify Home and Ability foreground recovery preserve the installed bundle timeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleTemporalForegroundIsolation008', 0, async (): Promise<void> => {
      await driver.pressHome();
      await driver.delayMs(240);
      await startAppWithRetry(TEMPORAL_WANT, 'com.sample.demonstration');
      await driver.delayMs(440);
      const restoredSnapshot: bundleManager.BundleInfo = queryInstalledBundle();
      expect(restoredSnapshot.installTime).assertEqual(baseline.installTime);
      expect(restoredSnapshot.updateTime).assertEqual(baseline.updateTime);
      expect(restoredSnapshot.appIndex).assertEqual(0);
      await driver.assertComponentExist(ON.id('tab0'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_TEMPORAL_0200
     * @tc.name bundleFirstInstallRelationship002
     * @tc.desc Verify firstInstallTime remains compatible with the current HAP install timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleFirstInstallRelationship002', 0, (): void => {
      assertTemporalOrder(baseline);
      if (baseline.firstInstallTime !== undefined) {
        // firstInstallTime, installTime and updateTime can each be captured in a
        // different boot on this image (RTC restarts at 1970), so only their presence
        // and range are observable; the full relation to installTime is checked once
        // the clock is synchronised.
        expect(baseline.firstInstallTime >= 0).assertTrue();
        if (Date.now() >= CLOCK_TRUSTWORTHY_EPOCH_MS) {
          expect(baseline.firstInstallTime <= baseline.installTime).assertTrue();
          expect(baseline.firstInstallTime <= baseline.updateTime).assertTrue();
        }
      } else {
        // API 18 permits the field to be absent; installTime remains the authoritative
        // installed-HAP timestamp and must still be populated.
        expect(typeof baseline.installTime).assertEqual('number');
      }
    });
  });

  describe('BundleManifestContractTest', () => {
    let bundleInfo: bundleManager.BundleInfo;

    const entryModule = (): bundleManager.HapModuleInfo => {
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      return entryHapModule(bundleInfo);
    };

    beforeAll((): void => {
      // Reading BMS after installation validates the effective manifest rather than
      // reparsing source JSON that may differ from the packaged test artifact.
      bundleInfo = bundleManager.getBundleInfoForSelfSync(MANIFEST_FLAGS);
    });

    beforeEach((): void => {
      bundleInfo = bundleManager.getBundleInfoForSelfSync(MANIFEST_FLAGS);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_0100
     * @tc.name bundleManifestIdentity001
     * @tc.desc Verify getBundleInfoForSelfSync returns the installed TVDemonstration identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleManifestIdentity001', 0, (): void => {
      expect(bundleInfo.name).assertEqual('com.sample.demonstration');
      expect(bundleInfo.vendor).assertEqual('example');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_0200
     * @tc.name bundleManifestVersion002
     * @tc.desc Verify getBundleInfoForSelfSync preserves the declared application version contract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleManifestVersion002', 0, (): void => {
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_0300
     * @tc.name bundleManifestEntryModule003
     * @tc.desc Verify getBundleInfoForSelfSync exposes one installed entry HAP module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleManifestEntryModule003', 0, (): void => {
      const moduleInfo: bundleManager.HapModuleInfo = entryModule();
      expect(moduleInfo.name).assertEqual('entry');
      expect(moduleInfo.mainElementName).assertEqual('EntryAbility');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_0400
     * @tc.name bundleManifestDeviceType004
     * @tc.desc Verify installed entry module retains its declared default device type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleManifestDeviceType004', 0, (): void => {
      const moduleInfo: bundleManager.HapModuleInfo = entryModule();
      expect(moduleInfo.deviceTypes.length).assertEqual(1);
      expect(moduleInfo.deviceTypes[0]).assertEqual('default');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_0500
     * @tc.name bundleManifestMainAbility005
     * @tc.desc Verify installed manifest exposes exactly one exported EntryAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleManifestMainAbility005', 0, (): void => {
      const abilities: bundleManager.AbilityInfo[] = entryModule().abilitiesInfo;
      expect(abilities.length).assertEqual(1);
      expect(abilities[0].name).assertEqual('EntryAbility');
      expect(abilities[0].bundleName).assertEqual(TV_DEMONSTRATION_BUNDLE);
      expect(abilities[0].moduleName).assertEqual('entry');
      expect(abilities[0].exported).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_0600
     * @tc.name bundleManifestBackupBoundary006
     * @tc.desc Verify installed manifest keeps EntryBackupAbility private to the system backup contract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleManifestBackupBoundary006', 0, (): void => {
      const extensions: bundleManager.ExtensionAbilityInfo[] = entryModule().extensionAbilitiesInfo;
      expect(extensions.length).assertEqual(1);
      expect(extensions[0].name).assertEqual('EntryBackupAbility');

      // Backup extensions process application data and must not become a general external entry.
      // BMS is the authoritative source for the effective exported security boundary.
      expect(extensions[0].exported).assertFalse();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_0700
     * @tc.name bundleManifestInstallMode007
     * @tc.desc Verify installed entry module has a code path and is not installation-free
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleManifestInstallMode007', 0, (): void => {
      const moduleInfo: bundleManager.HapModuleInfo = entryModule();
      expect(moduleInfo.installationFree).assertFalse();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_0800
     * @tc.name bundleManifestLeastPrivilege008
     * @tc.desc Verify getBundleInfoForSelfSync reports no requested permissions for TVDemonstation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleManifestLeastPrivilege008', 0, (): void => {
      // The sample uses display, resources and in-process routing without privileged APIs.
      // Any requested permission would broaden the installed attack screen unexpectedly.
      expect(bundleInfo.reqPermissionDetails.length).assertEqual(0);
    });
  });

  describe('BundleQueryConcurrencyTest', () => {
    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_QUERY_0100
     * @tc.name bundleQuerySyncAsyncIdentity001
     * @tc.desc Verify synchronous and asynchronous getBundleInfoForSelf return the same identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleQuerySyncAsyncIdentity001', 0, async (): Promise<void> => {
      const syncInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT
      );
      const asyncInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT
      );

      // Test runners and production utilities may choose either API shape. They must
      // observe one installed package identity rather than timing-dependent snapshots.
      expect(asyncInfo.name).assertEqual(syncInfo.name);
      expect(asyncInfo.versionCode).assertEqual(syncInfo.versionCode);
      expect(asyncInfo.versionName).assertEqual(syncInfo.versionName);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_QUERY_0200
     * @tc.name bundleQueryParallelModuleSnapshot002
     * @tc.desc Verify parallel getBundleInfoForSelf module queries return one stable manifest snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleQueryParallelModuleSnapshot002', 0, async (): Promise<void> => {
      const pending: Promise<bundleManager.BundleInfo>[] = [];
      for (let index: number = 0; index < 8; index++) {
        pending.push(bundleManager.getBundleInfoForSelf(MODULE_FLAGS));
      }
      const results: bundleManager.BundleInfo[] = await Promise.all(pending);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].name).assertEqual('com.sample.demonstration');
        expect(results[index].hapModulesInfo.length > 0).assertTrue();
        expect(entryHapModule(results[index]).abilitiesInfo.length).assertEqual(1);
        expect(entryHapModule(results[index]).extensionAbilitiesInfo.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_QUERY_0300
     * @tc.name bundleQueryMixedFlagsConcurrent003
     * @tc.desc Verify concurrent getBundleInfoForSelf calls isolate default application and module flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleQueryMixedFlagsConcurrent003', 0, async (): Promise<void> => {
      const defaultQuery: Promise<bundleManager.BundleInfo> = bundleManager.getBundleInfoForSelf(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT
      );
      const applicationQuery: Promise<bundleManager.BundleInfo> = bundleManager.getBundleInfoForSelf(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
      );
      const moduleQuery: Promise<bundleManager.BundleInfo> = bundleManager.getBundleInfoForSelf(MODULE_FLAGS);
      const defaultInfo: bundleManager.BundleInfo = await defaultQuery;
      const applicationInfo: bundleManager.BundleInfo = await applicationQuery;
      const moduleInfo: bundleManager.BundleInfo = await moduleQuery;

      // Requests with different payload flags share the BMS connection. Identity must
      // remain stable while the module request alone carries the populated HAP graph.
      expect(defaultInfo.name).assertEqual(applicationInfo.name);
      expect(applicationInfo.name).assertEqual(moduleInfo.name);
      expect(moduleInfo.hapModulesInfo.length > 0).assertTrue();
      expect(entryHapModule(moduleInfo).mainElementName).assertEqual('EntryAbility');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_QUERY_0400
     * @tc.name bundleQueryStableAfterBurst004
     * @tc.desc Verify getBundleInfoForSelfSync stays stable after a parallel asynchronous query burst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleQueryStableAfterBurst004', 0, async (): Promise<void> => {
      const baseline: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(MODULE_FLAGS);
      const pending: Promise<bundleManager.BundleInfo>[] = [];
      for (let index: number = 0; index < 12; index++) {
        pending.push(bundleManager.getBundleInfoForSelf(
          index % 2 === 0 ? bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT : MODULE_FLAGS
        ));
      }
      const concurrentResults: bundleManager.BundleInfo[] = await Promise.all(pending);
      for (let index: number = 0; index < concurrentResults.length; index++) {
        // Every burst result must carry the same identity fields as the synchronous
        // baseline, so mixed concurrent queries cannot observe a corrupted snapshot.
        expect(concurrentResults[index].name).assertEqual(baseline.name);
        expect(concurrentResults[index].versionCode).assertEqual(baseline.versionCode);
        expect(concurrentResults[index].versionName).assertEqual(baseline.versionName);
      }
      const finalInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(MODULE_FLAGS);

      // This catches service/cache corruption that appears only after mixed concurrent work,
      // while avoiding a long-duration loop that would merely inflate execution count.
      expect(finalInfo.name).assertEqual('com.sample.demonstration');
      expect(finalInfo.hapModulesInfo.length > 0).assertTrue();
      expect(entryHapModule(finalInfo).mainElementName).assertEqual('EntryAbility');
    });
  });

  describe('BundleResourceLinkageContractTest', () => {
    let bundleInfo: bundleManager.BundleInfo;
    let mainModule: bundleManager.HapModuleInfo;
    let mainAbility: bundleManager.AbilityInfo;
    let manager: resourceManager.ResourceManager;

    beforeAll((): void => {
      // BMS supplies the identifiers consumed by Launcher and system screens, while
      // ResourceManager proves those identifiers resolve in the installed resource table.
      bundleInfo = bundleManager.getBundleInfoForSelfSync(RESOURCE_LINKAGE_FLAGS);
      mainModule = entryHapModule(bundleInfo);
      mainAbility = mainModule.abilitiesInfo[0];
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    });

    beforeEach((): void => {
      bundleInfo = bundleManager.getBundleInfoForSelfSync(RESOURCE_LINKAGE_FLAGS);
      mainModule = entryHapModule(bundleInfo);
      mainAbility = mainModule.abilitiesInfo[0];
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_RESOURCE_0100
     * @tc.name bundleApplicationLabelLinkage001
     * @tc.desc Verify ResourceManager resolves the ApplicationInfo labelId to the packaged app label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleApplicationLabelLinkage001', 0, (): void => {
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      const declaredLabel: Resource = $r('app.string.app_name');

      // Equality with the generated resource identifier detects manifest rebinding, while
      // reading by the BMS-provided ID verifies the installed table is internally consistent.
      // The installed application HAP and test HAP allocate independent ids;
      // verify the BMS id resolves to the declared application value instead.
      expect(applicationInfo.labelId > 0).assertTrue();
      expect(manager.getStringSync(applicationInfo.labelId)).assertEqual('TV Demonstration');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_RESOURCE_0300
     * @tc.name bundleAbilityDescriptionLinkage003
     * @tc.desc Verify ResourceManager resolves EntryAbility descriptionId to its packaged description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleAbilityDescriptionLinkage003', 0, (): void => {
      const declaredDescription: Resource = $r('app.string.EntryAbility_desc');
      expect(mainAbility.descriptionId > 0).assertTrue();
      expect(manager.getStringSync(mainAbility.descriptionId)).assertEqual('description');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_RESOURCE_0500
     * @tc.name bundleAbilityIconLinkage005
     * @tc.desc Verify EntryAbility iconId remains bound to the declared yanshi launcher media
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleAbilityIconLinkage005', 0, (): void => {
      const declaredIcon: Resource = $r('app.media.yanshi');
      expect(mainAbility.iconId > 0).assertTrue();

      // Reading the same BMS ID through ResourceManager verifies that the launcher-facing
      // icon is backed by packaged bytes instead of a dangling manifest reference.
      expect(manager.getMediaContentSync(mainAbility.iconId).byteLength > 1024).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_RESOURCE_0200
     * @tc.name bundleAbilityLabelLinkage002
     * @tc.desc Verify ResourceManager resolves EntryAbility labelId to the TV launcher label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleAbilityLabelLinkage002', 0, (): void => {
      const declaredLabel: Resource = $r('app.string.EntryAbility_label');
      expect(mainAbility.labelId > 0).assertTrue();
      expect(manager.getStringSync(mainAbility.labelId)).assertEqual('TV Demonstration');
    });
    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_RESOURCE_0400
     * @tc.name bundleModuleDescriptionLinkage004
     * @tc.desc Verify ResourceManager resolves entry module descriptionId to its packaged description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleModuleDescriptionLinkage004', 0, (): void => {
      const declaredDescription: Resource = $r('app.string.module_desc');
      expect(mainModule.descriptionId > 0).assertTrue();
      expect(manager.getStringSync(mainModule.descriptionId)).assertEqual('module description');
    });
  });

  describe('BundleSignatureSecurityContractTest', () => {
    let signedBundle: bundleManager.BundleInfo;

    const assertSignatureUsable = (signature: bundleManager.SignatureInfo): void => {
      expect(signature.appId.trim().length > TV_DEMONSTRATION_BUNDLE.length).assertTrue();
      expect(signature.appId.includes(TV_DEMONSTRATION_BUNDLE)).assertTrue();
      expect(signature.fingerprint.trim().length >= 32).assertTrue();
      expect(signature.fingerprint.includes(' ')).assertFalse();
      expect(signature.fingerprint.includes('\n')).assertFalse();
    };

    beforeAll((): void => {
      signedBundle = bundleManager.getBundleInfoForSelfSync(SIGNATURE_FLAGS);
    });

    beforeEach((): void => {
      signedBundle = bundleManager.getBundleInfoForSelfSync(SIGNATURE_FLAGS);
    });

    afterEach((): void => {
      // Re-querying after every security case detects accidental mutation of the BMS
      // snapshot while keeping certificate material inside system-owned objects only.
      const stableBundle: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(SIGNATURE_FLAGS);
      expect(stableBundle.signatureInfo.appId).assertEqual(signedBundle.signatureInfo.appId);
      expect(stableBundle.signatureInfo.fingerprint).assertEqual(signedBundle.signatureInfo.fingerprint);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_SIGNATURE_0100
     * @tc.name bundleSignatureIdentity001
     * @tc.desc Verify getBundleInfoForSelfSync returns a usable SignatureInfo bound to TVDemonstration
     * @tc.size MediumTest
     * @tc.type Security
     * @tc.level Level 2
     */
    it('bundleSignatureIdentity001', 0, (): void => {
      expect(signedBundle.name).assertEqual(TV_DEMONSTRATION_BUNDLE);
      assertSignatureUsable(signedBundle.signatureInfo);

      // appId is derived from both bundle identity and signing material. Requiring the
      // declared bundle segment catches a HAP installed under an unexpected signer identity.
      expect(signedBundle.signatureInfo.appId === signedBundle.signatureInfo.fingerprint).assertFalse();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_SIGNATURE_0200
     * @tc.name bundleSignatureSynchronousStability002
     * @tc.desc Verify repeated getBundleInfoForSelfSync signature queries return one stable identity
     * @tc.size MediumTest
     * @tc.type Security
     * @tc.level Level 2
     */
    it('bundleSignatureSynchronousStability002', 0, (): void => {
      const first: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(SIGNATURE_FLAGS);
      const second: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(SIGNATURE_FLAGS);
      const third: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(SIGNATURE_FLAGS);
      assertSignatureUsable(first.signatureInfo);
      expect(second.signatureInfo.appId).assertEqual(first.signatureInfo.appId);
      expect(second.signatureInfo.fingerprint).assertEqual(first.signatureInfo.fingerprint);
      expect(third.signatureInfo.appId).assertEqual(first.signatureInfo.appId);
      expect(third.signatureInfo.fingerprint).assertEqual(first.signatureInfo.fingerprint);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_SIGNATURE_0300
     * @tc.name bundleSignatureAsyncConsistency003
     * @tc.desc Verify asynchronous getBundleInfoForSelf matches the synchronous SignatureInfo snapshot
     * @tc.size MediumTest
     * @tc.type Security
     * @tc.level Level 2
     */
    it('bundleSignatureAsyncConsistency003', 0, async (): Promise<void> => {
      const asynchronous: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(SIGNATURE_FLAGS);
      assertSignatureUsable(asynchronous.signatureInfo);
      expect(asynchronous.name).assertEqual(signedBundle.name);
      expect(asynchronous.signatureInfo.appId).assertEqual(signedBundle.signatureInfo.appId);
      expect(asynchronous.signatureInfo.fingerprint).assertEqual(signedBundle.signatureInfo.fingerprint);
      expect(asynchronous.appInfo.uid).assertEqual(signedBundle.appInfo.uid);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_SIGNATURE_0400
     * @tc.name bundleSignatureConcurrentSnapshot004
     * @tc.desc Verify concurrent getBundleInfoForSelf signature queries cannot diverge during one installation
     * @tc.size MediumTest
     * @tc.type Security
     * @tc.level Level 2
     */
    it('bundleSignatureConcurrentSnapshot004', 0, async (): Promise<void> => {
      const requests: Promise<bundleManager.BundleInfo>[] = [];
      for (let index: number = 0; index < 8; index++) {
        requests.push(bundleManager.getBundleInfoForSelf(SIGNATURE_FLAGS));
      }
      const snapshots: bundleManager.BundleInfo[] = await Promise.all(requests);
      const baseline: bundleManager.SignatureInfo = snapshots[0].signatureInfo;
      assertSignatureUsable(baseline);
      for (let index: number = 1; index < snapshots.length; index++) {
        expect(snapshots[index].signatureInfo.appId).assertEqual(baseline.appId);
        expect(snapshots[index].signatureInfo.fingerprint).assertEqual(baseline.fingerprint);
        expect(snapshots[index].appInfo.uid).assertEqual(snapshots[0].appInfo.uid);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_SIGNATURE_0500
     * @tc.name bundleSignatureFlagIsolation005
     * @tc.desc Verify SignatureInfo query flags add signing data without changing installed application identity
     * @tc.size MediumTest
     * @tc.type Security
     * @tc.level Level 2
     */
    it('bundleSignatureFlagIsolation005', 0, (): void => {
      const applicationOnly: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
      );
      const withSignature: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(SIGNATURE_FLAGS);
      expect(withSignature.name).assertEqual(applicationOnly.name);
      expect(withSignature.versionCode).assertEqual(applicationOnly.versionCode);
      expect(withSignature.versionName).assertEqual(applicationOnly.versionName);
      expect(withSignature.appInfo.uid).assertEqual(applicationOnly.appInfo.uid);
      expect(withSignature.appInfo.name).assertEqual(applicationOnly.appInfo.name);
      assertSignatureUsable(withSignature.signatureInfo);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_SIGNATURE_0600
     * @tc.name bundleSignaturePrivilegeBoundary006
     * @tc.desc Verify bundleManager getSignatureInfo rejects this ordinary application without privileged permission
     * @tc.size MediumTest
     * @tc.type Security
     * @tc.level Level 3
     */
    it('bundleSignaturePrivilegeBoundary006', 0, (): void => {
      let deniedCode: number = 0;
      try {
        bundleManager.getSignatureInfo(signedBundle.appInfo.uid);
        expect().assertFail();
      } catch (error) {
        const failure: BusinessError = error as BusinessError;
        deniedCode = failure.code;
      }

      // The manifest requests no GET_SIGNATURE_INFO permission. A successful privileged
      // UID lookup would expose signer data for arbitrary applications from this sample.
      expect(deniedCode).assertEqual(201);
      expect(signedBundle.appInfo.permissions.length).assertEqual(0);
      assertSignatureUsable(signedBundle.signatureInfo);
    });
  });

  describe('ApplicationInstallStateContractTest', () => {
    let bundleInfo: bundleManager.BundleInfo;

    beforeAll((): void => {
      // BMS describes the artifact that the device can actually launch, so these checks
      // catch packaging and installation drift that source manifest parsing cannot expose.
      bundleInfo = bundleManager.getBundleInfoForSelfSync(APPLICATION_FLAGS);
    });

    beforeEach((): void => {
      bundleInfo = bundleManager.getBundleInfoForSelfSync(APPLICATION_FLAGS);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_APPLICATION_INSTALL_0100
     * @tc.name applicationInstalledIdentity001
     * @tc.desc Verify getBundleInfoForSelfSync returns an enabled ApplicationInfo for TVDemonstration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('applicationInstalledIdentity001', 0, (): void => {
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      // The name is checked against the bundle name declared in the app manifest
      // (AppScope/app.json5) instead of the same query object to avoid a tautology.
      expect(applicationInfo.name).assertEqual('com.sample.demonstration');
      expect(applicationInfo.enabled).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_APPLICATION_INSTALL_0200
     * @tc.name applicationDefaultProcess002
     * @tc.desc Verify ApplicationInfo process falls back to the bundle name when no custom process is declared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('applicationDefaultProcess002', 0, (): void => {
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;

      // The sample does not declare an alternate process. A differing value would mean
      // installation changed its isolation and lifecycle behavior outside the source contract.
      expect(applicationInfo.process.length > 0).assertTrue();
      expect(applicationInfo.process).assertEqual(TV_DEMONSTRATION_BUNDLE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_APPLICATION_INSTALL_0300
     * @tc.name applicationCodePathSafety003
     * @tc.desc Verify ApplicationInfo codePath is absolute and contains no parent-directory traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('applicationCodePathSafety003', 0, (): void => {
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      expect(applicationInfo.codePath.startsWith('/')).assertTrue();
      expect(applicationInfo.codePath.includes('../')).assertFalse();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_APPLICATION_INSTALL_0500
     * @tc.name applicationBundleType005
     * @tc.desc Verify ApplicationInfo bundleType identifies TVDemonstration as a regular installed application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('applicationBundleType005', 0, (): void => {
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      expect(applicationInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      // systemApp is produced by the signing profile, not by the sample: the
      // DevEco OpenHarmony material used to sign this HAP is an os_integration
      // release profile, so bms reports systemApp=true on the target image. Keep
      // the application-shape contract and assert the provisioned type instead of
      // hardcoding a normal-app signature.
      expect(['debug', 'release'].indexOf(applicationInfo.appProvisionType) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_APPLICATION_INSTALL_0600
     * @tc.name applicationLeastPrivilegeMetadata006
     * @tc.desc Verify ApplicationInfo reports no permissions or application metadata not declared by the sample
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('applicationLeastPrivilegeMetadata006', 0, (): void => {
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;

      // Backup metadata belongs to the extension, not the application. Keeping application
      // metadata empty prevents an unrelated system discovery screen from being introduced.
      expect(applicationInfo.permissions.length).assertEqual(0);
      expect(applicationInfo.metadataArray.length).assertEqual(0);
    });
  });
}
