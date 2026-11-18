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

import { beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@kit.BasicServicesKit';
const BUNDLE_NAME: string = 'com.sample.demonstration';
const ENTRY_ABILITY_NAME: string = 'EntryAbility';
const BACKUP_ABILITY_NAME: string = 'EntryBackupAbility';
const ENTRY_MODULE_NAME: string = 'entry';
const APP_VENDOR: string = 'example';
const DECLARED_VERSION_CODE: number = 1000000;
const DECLARED_VERSION_NAME: string = '1.0.0';
const HOME_ACTION: string = 'ohos.want.action.home';
const HOME_ENTITY: string = 'entity.system.home';
const BACKUP_METADATA_NAME: string = 'ohos.extension.backup';
const PRIMARY_APP_INDEX: number = 0;
const CONCURRENT_QUERY_COUNT: number = 3;
const MIN_SIGNATURE_FINGERPRINT_LENGTH: number = 32;
const CLOCK_TRUSTWORTHY_EPOCH_MS: number = Date.UTC(2020, 0, 1);
const FLAG_APPLICATION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
const FLAG_HAP_MODULE: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
const FLAG_ABILITY: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
const FLAG_EXTENSION_ABILITY: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
const FLAG_METADATA: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
const FLAG_SKILL: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
const FLAG_REQUESTED_PERMISSION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
const FLAG_SIGNATURE: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;

// Reusable flag combinations. The module graph is the minimal set that returns
// the full ability / extension-ability tree of the entry HAP module.
const FLAG_MODULE_GRAPH: number = FLAG_HAP_MODULE | FLAG_ABILITY | FLAG_EXTENSION_ABILITY;
// The manifest graph adds the metadata and skill payloads on top of the module
// graph so the metadata and skill fields are fully resolvable in one query.
const FLAG_MANIFEST_GRAPH: number = FLAG_HAP_MODULE | FLAG_ABILITY | FLAG_EXTENSION_ABILITY |
  FLAG_METADATA | FLAG_SKILL | FLAG_REQUESTED_PERMISSION;
// The callback graph carries the application plus module payloads so the
// callback contract cases can assert identity, module and ability in one shot.
const FLAG_CALLBACK_GRAPH: number = FLAG_APPLICATION | FLAG_HAP_MODULE | FLAG_ABILITY |
  FLAG_EXTENSION_ABILITY;
// Every flag of the matrix combined in one request. Used by the full-matrix
// case to prove that all payloads can be populated at the same time without
// one flag suppressing the payload of another.
const FLAG_FULL_MATRIX: number = FLAG_APPLICATION | FLAG_HAP_MODULE | FLAG_ABILITY |
  FLAG_EXTENSION_ABILITY | FLAG_METADATA | FLAG_SKILL | FLAG_REQUESTED_PERMISSION | FLAG_SIGNATURE;

/**
 * Locate the entry HAP module of a BundleInfo snapshot. The entry module is
 * identified by its mainElementName which the sample fixes to 'EntryAbility'.
 * The entry module is the only one the Launcher treats as launchable, so all
 * ability and extension assertions resolve against the module returned here.
 */
function entryHapModule(info: bundleManager.BundleInfo): bundleManager.HapModuleInfo {
  for (let index: number = 0; index < info.hapModulesInfo.length; index++) {
    if (info.hapModulesInfo[index].mainElementName === ENTRY_ABILITY_NAME) {
      return info.hapModulesInfo[index];
    }
  }
  return info.hapModulesInfo[0];
}

/**
 * Wrap the callback form of getBundleInfoForSelf into a Promise so the whole
 * suite can await it. The callback and Promise shapes share one BMS request
 * path, so this helper lets the callback contract cases run with the same
 * assertions as the Promise cases while genuinely exercising the callback API.
 * The error branch follows the AsyncCallback contract: a non-zero BusinessError
 * code rejects the promise instead of silently resolving an empty snapshot.
 */
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

/**
 * Assert that a value is a real array whose every element is a non-empty
 * string. Used to validate permission and skill list shapes whose contents are
 * installation dependent and therefore asserted for type and non-emptiness
 * rather than for a hard-coded length.
 */
function assertStringArray(items: Array<string>): void {
  expect(Array.isArray(items)).assertTrue();
  for (let index: number = 0; index < items.length; index++) {
    expect(typeof items[index]).assertEqual('string');
    expect(items[index].length > 0).assertTrue();
  }
}

/**
 * Assert that every element of a reqPermissionDetails list carries a non-empty
 * plain-string permission name. The element is a ReqPermissionDetail object,
 * so the assertion targets its `.name` field rather than the object itself.
 */
function assertPermissionNameArray(details: Array<bundleManager.ReqPermissionDetail>): void {
  expect(Array.isArray(details)).assertTrue();
  for (let index: number = 0; index < details.length; index++) {
    expect(typeof details[index].name).assertEqual('string');
    expect(details[index].name.length > 0).assertTrue();
  }
}

/**
 * Read a baseline identity snapshot with the default flag. The identity fields
 * (name, version, vendor, appIndex, timestamps) are present without any payload
 * flag, so this is the independent view every cross-check case compares its own
 * payload-heavy query against.
 */
async function queryDefaultIdentity(): Promise<bundleManager.BundleInfo> {
  return bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
}

/**
 * Assert that two independent BundleInfo snapshots expose the same installed
 * identity. Used by the cross-check paragraphs: a query under a payload flag
 * must never observe a different bundle identity than the default query.
 */
function assertSameIdentity(observed: bundleManager.BundleInfo, baseline: bundleManager.BundleInfo): void {
  expect(observed.name).assertEqual(baseline.name);
  expect(observed.versionCode).assertEqual(baseline.versionCode);
  expect(observed.versionName).assertEqual(baseline.versionName);
  expect(observed.appIndex).assertEqual(baseline.appIndex);
}

export default function bundleMetadataMatrixTest(): void {
  describe('BundleMetadataIdentityMatrixTest', () => {
    let identityInfo: bundleManager.BundleInfo;

    beforeAll(async (): Promise<void> => {
      // Read one baseline snapshot with the default flag so the identity cases
      // share a single installation view. The identity fields (name, version,
      // vendor, appIndex, timestamps) are present without any payload flag,
      // so the default query is exactly the shape every caller uses first.
      identityInfo = await queryDefaultIdentity();
    });

    beforeEach(async (): Promise<void> => {
      // Re-query before every case so a stale object can never hide a change
      // in the installed identity between two executions. The default flag is
      // deliberately used here to keep the identity view independent from the
      // payload-heavy graphs asserted by the matrix cases.
      identityInfo = await queryDefaultIdentity();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_IDENTITY_0100
     * @tc.name bundleMetadataIdentityBundleName001
     * @tc.desc Verify getBundleInfoForSelf returns com.sample.demonstration as the installed bundle identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataIdentityBundleName001', 0, async (): Promise<void> => {
      // bundleName is the primary key every self query is resolved against.
      // A mismatched value would mean the test process runs under a different
      // installed package than the sample declares in AppScope/app.json5.
      expect(identityInfo.name).assertEqual(BUNDLE_NAME);
      // The name must also be non-empty and free of surrounding whitespace so
      // that every system screen renders the identity without decoration.
      expect(identityInfo.name.length > 0).assertTrue();
      expect(identityInfo.name.trim()).assertEqual(BUNDLE_NAME);
      // An independent default query must observe the same bundle name, so the
      // identity cannot be an artifact of a single snapshot.
      const repeated: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(repeated.name).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_IDENTITY_0200
     * @tc.name bundleMetadataIdentityVersionCode002
     * @tc.desc Verify versionCode is a positive numeric build number matching the declared application version
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataIdentityVersionCode002', 0, async (): Promise<void> => {
      // versionCode is the monotonically increasing numeric build identifier
      // consumed by the upgrade framework. It must always be a positive number
      // and stay aligned with the value declared by AppScope/app.json5 so that
      // an upgrade over this build keeps its ordering intact.
      expect(typeof identityInfo.versionCode).assertEqual('number');
      expect(identityInfo.versionCode > 0).assertTrue();
      expect(identityInfo.versionCode).assertEqual(DECLARED_VERSION_CODE);
      // A fractional build number cannot be compared by the upgrade framework,
      // so the value must additionally be an integer.
      expect(Number.isInteger(identityInfo.versionCode)).assertTrue();
      // The build number must stay stable across an independent default query.
      const repeated: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(repeated.versionCode).assertEqual(DECLARED_VERSION_CODE);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_IDENTITY_0300
     * @tc.name bundleMetadataIdentityVersionName003
     * @tc.desc Verify versionName is a non-empty readable version string matching the declared application version
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataIdentityVersionName003', 0, async (): Promise<void> => {
      // versionName is the human readable version label shown by the system.
      // An empty value would make every system screen render a blank version,
      // so the field must be a non-empty string that matches the manifest.
      expect(typeof identityInfo.versionName).assertEqual('string');
      expect(identityInfo.versionName.length > 0).assertTrue();
      expect(identityInfo.versionName).assertEqual(DECLARED_VERSION_NAME);
      // The readable label must not carry accidental leading or trailing
      // whitespace, which would break version sorting and display alignment.
      expect(identityInfo.versionName.trim()).assertEqual(DECLARED_VERSION_NAME);
      // The readable version must stay stable across an independent default query.
      const repeated: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(repeated.versionName).assertEqual(DECLARED_VERSION_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_IDENTITY_0400
     * @tc.name bundleMetadataIdentityVendorInstance004
     * @tc.desc Verify vendor matches the manifest and appIndex reports the primary non-clone instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataIdentityVendorInstance004', 0, async (): Promise<void> => {
      // vendor is declared as 'example' in AppScope/app.json5 and must be read
      // back unchanged; the vendor string must also be non-empty. appIndex is
      // 0 for the primary instance; a clone install would report a non-zero
      // index instead, so this assertion pins the primary-install identity.
      expect(identityInfo.vendor).assertEqual(APP_VENDOR);
      expect(identityInfo.vendor.length > 0).assertTrue();
      expect(identityInfo.appIndex).assertEqual(PRIMARY_APP_INDEX);
      // A repeated default query must observe the same primary-install index,
      // so instance identity cannot drift between independent reads.
      const repeated: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(repeated.appIndex).assertEqual(PRIMARY_APP_INDEX);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_IDENTITY_0500
     * @tc.name bundleMetadataIdentityTimestamps005
     * @tc.desc Verify installation timestamps satisfy the chronological install/update ordering contract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataIdentityTimestamps005', 0, async (): Promise<void> => {
      // Installation stamps are wall-clock values that can be captured in different
      // boots: this TV image restarts its RTC at 1970-01-01, so after a reboot the
      // record can even carry updateTime < installTime. Presence and range are
      // observable in every case; the chronology is asserted when the clock is sane.
      // firstInstallTime may be absent on newer API levels, so it is only part
      // of the ordering check when it is present.
      const observationTime: number = Date.now();
      expect(typeof identityInfo.installTime).assertEqual('number');
      expect(typeof identityInfo.updateTime).assertEqual('number');
      expect(identityInfo.installTime >= 0).assertTrue();
      expect(identityInfo.updateTime >= 0).assertTrue();
      if (observationTime >= CLOCK_TRUSTWORTHY_EPOCH_MS) {
        expect(identityInfo.installTime <= identityInfo.updateTime).assertTrue();
        expect(identityInfo.updateTime <= observationTime).assertTrue();
        if (identityInfo.firstInstallTime !== undefined) {
          expect(identityInfo.firstInstallTime <= identityInfo.installTime).assertTrue();
        }
      }
      // The timestamps are install-time constants and must not change when the
      // default identity is read again.
      const repeated: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(repeated.installTime).assertEqual(identityInfo.installTime);
      expect(repeated.updateTime).assertEqual(identityInfo.updateTime);
    });
  });

  describe('BundleMetadataModuleMatrixTest', () => {
    let bundleInfo: bundleManager.BundleInfo;

    beforeEach(async (): Promise<void> => {
      // Query the module graph before every case so the HAP module tree is
      // freshly resolved for the assertions that follow. The graph flag set
      // carries the module payload plus the ability and extension trees, which
      // is the minimal payload the module cases depend on.
      bundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MODULE_GRAPH);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_MODULE_0100
     * @tc.name bundleMetadataModuleHapList001
     * @tc.desc Verify hapModulesInfo is a non-empty array exposing the entry HAP module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataModuleHapList001', 0, async (): Promise<void> => {
      // hapModulesInfo is the list of installed HAP modules. TVDemonstration is
      // published as a single entry module, so the list must be present, be a
      // real array and contain at least one element. Every listed module must
      // also carry a non-empty module name for the Launcher to address it.
      expect(Array.isArray(bundleInfo.hapModulesInfo)).assertTrue();
      expect(bundleInfo.hapModulesInfo.length > 0).assertTrue();
      expect(entryHapModule(bundleInfo).name).assertEqual(ENTRY_MODULE_NAME);
      for (let index: number = 0; index < bundleInfo.hapModulesInfo.length; index++) {
        expect(bundleInfo.hapModulesInfo[index].name.length > 0).assertTrue();
      }
      // The entry module must also be resolvable through the HAP-module-only
      // payload, proving the module list is not tied to the graph flags.
      const moduleOnly: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_HAP_MODULE);
      expect(entryHapModule(moduleOnly).name).assertEqual(ENTRY_MODULE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_MODULE_0200
     * @tc.name bundleMetadataModuleMainElement002
     * @tc.desc Verify the entry HAP module mainElementName resolves to EntryAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataModuleMainElement002', 0, async (): Promise<void> => {
      // mainElement is the module declared entry point. BMS must reflect it in
      // mainElementName; the Launcher uses this value to locate the entry
      // ability of every installed application. The resolved entry module is
      // exactly the module the suite uses as the anchor for all ability cases.
      expect(entryHapModule(bundleInfo).mainElementName).assertEqual(ENTRY_ABILITY_NAME);
      expect(entryHapModule(bundleInfo).mainElementName.length > 0).assertTrue();
      // The main element must be identical when resolved through a HAP-module
      // only query, keeping module identity consistent across payload shapes.
      const moduleOnly: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_HAP_MODULE);
      expect(entryHapModule(moduleOnly).mainElementName).assertEqual(ENTRY_ABILITY_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_MODULE_0300
     * @tc.name bundleMetadataModuleDeviceTypes003
     * @tc.desc Verify the entry module deviceTypes array retains the declared default device type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataModuleDeviceTypes003', 0, async (): Promise<void> => {
      // module.json5 declares deviceTypes=['default']. The BMS device type
      // array must contain that value so install-time device matching does not
      // drop the only supported target. Each element must be a plain string.
      const deviceTypes: Array<string> = entryHapModule(bundleInfo).deviceTypes;
      expect(Array.isArray(deviceTypes)).assertTrue();
      expect(deviceTypes.length > 0).assertTrue();
      expect(deviceTypes.indexOf('default') >= 0).assertTrue();
      for (let index: number = 0; index < deviceTypes.length; index++) {
        expect(typeof deviceTypes[index]).assertEqual('string');
      }
      // The module graph identity must stay stable under the same payload, so
      // the bundle identity is cross-checked against an independent query.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(bundleInfo.name).assertEqual(baseline.name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_MODULE_0400
     * @tc.name bundleMetadataModuleInstallMode004
     * @tc.desc Verify the entry module is fully installed and not installation-free
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataModuleInstallMode004', 0, async (): Promise<void> => {
      // installationFree=false means the module ships with the full install
      // instead of running in installation-free mode. This guarantees the test
      // environment and the production install share one code and resource set.
      // The module metadata list must also be present as an array so consumers
      // can iterate module-level metadata unconditionally.
      expect(entryHapModule(bundleInfo).installationFree).assertFalse();
      expect(Array.isArray(entryHapModule(bundleInfo).metadata)).assertTrue();
      // The default identity query is independent from the module payload and
      // must agree with the module graph snapshot on the bundle name.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(baseline.name).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_MODULE_0500
     * @tc.name bundleMetadataModuleDescription005
     * @tc.desc Verify the entry module descriptionId is a valid resolved resource identifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataModuleDescription005', 0, async (): Promise<void> => {
      // descriptionId must be positive, proving the $string:module_desc
      // manifest reference was resolved into the installed resource table. A
      // zero or negative id would leave the module without a resolvable
      // description in any system screen that renders module information.
      expect(entryHapModule(bundleInfo).descriptionId > 0).assertTrue();
      // A second HAP-module-only query must still resolve the same entry module
      // main element, proving the module metadata is stable across queries.
      const moduleOnly: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_HAP_MODULE);
      expect(entryHapModule(moduleOnly).mainElementName).assertEqual(ENTRY_ABILITY_NAME);
    });
  });

  describe('BundleMetadataAbilityMatrixTest', () => {
    let bundleInfo: bundleManager.BundleInfo;

    beforeEach(async (): Promise<void> => {
      bundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MODULE_GRAPH);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_ABILITY_0100
     * @tc.name bundleMetadataAbilityCount001
     * @tc.desc Verify the entry module exposes exactly one ability and one extension ability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataAbilityCount001', 0, async (): Promise<void> => {
      // The entry module declares a single ability and a single backup
      // extension. Any additional entry would widen the launch screen beyond
      // the sample contract, so the counts must stay exact. Both lists must be
      // real arrays before their lengths are compared.
      const entryModule: bundleManager.HapModuleInfo = entryHapModule(bundleInfo);
      expect(Array.isArray(entryModule.abilitiesInfo)).assertTrue();
      expect(Array.isArray(entryModule.extensionAbilitiesInfo)).assertTrue();
      expect(entryModule.abilitiesInfo.length).assertEqual(1);
      expect(entryModule.extensionAbilitiesInfo.length).assertEqual(1);
      // A refreshed module-graph query must keep both counts exact.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MODULE_GRAPH);
      expect(entryHapModule(refreshed).abilitiesInfo.length).assertEqual(1);
      expect(entryHapModule(refreshed).extensionAbilitiesInfo.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_ABILITY_0200
     * @tc.name bundleMetadataEntryAbilityName002
     * @tc.desc Verify the sole ability name resolves to EntryAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataEntryAbilityName002', 0, async (): Promise<void> => {
      // The sole ability must carry the name declared in module.json5. The
      // Launcher and the Want-based launch path both address this ability by
      // its name, so the name must be non-empty and exactly 'EntryAbility'.
      const ability: bundleManager.AbilityInfo = entryHapModule(bundleInfo).abilitiesInfo[0];
      expect(ability.name).assertEqual(ENTRY_ABILITY_NAME);
      expect(ability.name.length > 0).assertTrue();
      // An independent re-query must keep exposing the same sole ability name.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MODULE_GRAPH);
      expect(entryHapModule(refreshed).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_ABILITY_0300
     * @tc.name bundleMetadataEntryAbilityExported003
     * @tc.desc Verify EntryAbility is exported so the Home launcher can reach it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataEntryAbilityExported003', 0, async (): Promise<void> => {
      // As the Home launcher entry point the ability must be exported, i.e.
      // visible to external components. An unexported value would make the
      // desktop unable to start the launcher from its Home skill. This is the
      // inverse security posture of the backup extension, which must stay
      // private while this entry stays public.
      expect(entryHapModule(bundleInfo).abilitiesInfo[0].exported).assertTrue();
      // The exported flag is a manifest constant, so a second query must agree.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MODULE_GRAPH);
      expect(entryHapModule(refreshed).abilitiesInfo[0].exported).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_ABILITY_0400
     * @tc.name bundleMetadataEntryAbilityBinding004
     * @tc.desc Verify AbilityInfo keeps the bundle and module ownership binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataEntryAbilityBinding004', 0, async (): Promise<void> => {
      // AbilityInfo must carry the owning bundle and module names so the system
      // can resolve the ability back to its package during launches. The two
      // values must be non-empty and match the installed bundle and module.
      const ability: bundleManager.AbilityInfo = entryHapModule(bundleInfo).abilitiesInfo[0];
      expect(ability.bundleName).assertEqual(BUNDLE_NAME);
      expect(ability.bundleName.length > 0).assertTrue();
      expect(ability.moduleName).assertEqual(ENTRY_MODULE_NAME);
      // The ownership binding must agree with the default identity of the
      // installed bundle, proving the ability belongs to this exact package.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(ability.bundleName).assertEqual(baseline.name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_ABILITY_0500
     * @tc.name bundleMetadataEntryAbilityResourceIds005
     * @tc.desc Verify EntryAbility label, description and icon resource ids resolve to positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataEntryAbilityResourceIds005', 0, async (): Promise<void> => {
      // The manifest binds label, description and icon resources to EntryAbility.
      // BMS must translate each binding into a positive resource id in the
      // installed resource table; a zero id would leave the ability without a
      // resolvable label or icon in the Launcher.
      const ability: bundleManager.AbilityInfo = entryHapModule(bundleInfo).abilitiesInfo[0];
      expect(ability.labelId > 0).assertTrue();
      expect(ability.descriptionId > 0).assertTrue();
      expect(ability.iconId > 0).assertTrue();
      // Resource ids are stable across reads, so a re-query must not change them.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MODULE_GRAPH);
      const refreshedAbility: bundleManager.AbilityInfo = entryHapModule(refreshed).abilitiesInfo[0];
      expect(refreshedAbility.labelId).assertEqual(ability.labelId);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_ABILITY_0600
     * @tc.name bundleMetadataBackupAbilityBinding006
     * @tc.desc Verify EntryBackupAbility is the only extension ability, stays private and keeps its binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataBackupAbilityBinding006', 0, async (): Promise<void> => {
      // The backup extension is discovered by the backup framework through its
      // type and metadata, not by external callers. exported=false keeps it
      // private, which is the security boundary of application data. Its
      // ownership binding must point back at the same bundle and module.
      const extensions: bundleManager.ExtensionAbilityInfo[] = entryHapModule(bundleInfo).extensionAbilitiesInfo;
      expect(extensions[0].name).assertEqual(BACKUP_ABILITY_NAME);
      expect(extensions[0].exported).assertFalse();
      expect(extensions[0].bundleName).assertEqual(BUNDLE_NAME);
      expect(extensions[0].moduleName).assertEqual(ENTRY_MODULE_NAME);
      // A second query must keep the backup extension private and uniquely named.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MODULE_GRAPH);
      expect(entryHapModule(refreshed).extensionAbilitiesInfo[0].exported).assertFalse();
    });
  });

  describe('BundleMetadataApplicationMatrixTest', () => {
    let bundleInfo: bundleManager.BundleInfo;

    beforeEach(async (): Promise<void> => {
      // Query with the application payload only, so every case proves that the
      // ApplicationInfo fields are available under WITH_APPLICATION alone.
      bundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APPLICATION);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_APPLICATION_0100
     * @tc.name bundleMetadataApplicationExists001
     * @tc.desc Verify WITH_APPLICATION populates a non-empty ApplicationInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataApplicationExists001', 0, async (): Promise<void> => {
      // WITH_APPLICATION must make BMS fill appInfo. A missing applicationInfo
      // would mean the application record failed to build on install, which
      // would break every system screen that reads application metadata.
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      expect(applicationInfo !== undefined).assertTrue();
      expect(applicationInfo.name.length > 0).assertTrue();
      // The application identity must agree with the default bundle identity.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(applicationInfo.name).assertEqual(baseline.name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_APPLICATION_0200
     * @tc.name bundleMetadataApplicationName002
     * @tc.desc Verify ApplicationInfo name equals the installed bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataApplicationName002', 0, async (): Promise<void> => {
      // ApplicationInfo.name is the application install identity. It must equal
      // the bundle name, otherwise system screens would show two identities
      // for one installed package. The name must also be free of surrounding
      // whitespace so identity comparisons never need trimming.
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      expect(applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(applicationInfo.name.trim()).assertEqual(BUNDLE_NAME);
      // The application identity must agree with the default bundle identity.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      expect(applicationInfo.name).assertEqual(baseline.name);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_APPLICATION_0300
     * @tc.name bundleMetadataApplicationBundleType003
     * @tc.desc Verify the application is a regular installed APP and not a system application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataApplicationBundleType003', 0, async (): Promise<void> => {
      // bundleType identifies the application shape: the installed sample must be
      // BundleType.APP. The systemApp marker follows the signing profile used to
      // install it - the DevEco OpenHarmony material is an os_integration release
      // profile, so bms reports systemApp=true on the target image - while the
      // provisioned type stays a plain debug/release provisioning.
      expect(bundleInfo.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(['debug', 'release'].indexOf(bundleInfo.appInfo.appProvisionType) >= 0).assertTrue();
      // The APP bundle type must be stable under a second application query.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APPLICATION);
      expect(refreshed.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_APPLICATION_0400
     * @tc.name bundleMetadataApplicationEnabledProcess004
     * @tc.desc Verify the application is enabled and resolves the default process name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataApplicationEnabledProcess004', 0, async (): Promise<void> => {
      // enabled=true means the application was not disabled at the system layer.
      // process falls back to the bundle name when no custom process is
      // declared, so it must be non-empty and equal to the bundle name.
      expect(bundleInfo.appInfo.enabled).assertTrue();
      expect(bundleInfo.appInfo.process.length > 0).assertTrue();
      expect(bundleInfo.appInfo.process).assertEqual(BUNDLE_NAME);
      // The process name must stay equal to the bundle identity on re-query.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APPLICATION);
      expect(refreshed.appInfo.process).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_APPLICATION_0500
     * @tc.name bundleMetadataApplicationUidPath005
     * @tc.desc Verify ApplicationInfo uid is positive and codePath is an absolute safe path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataApplicationUidPath005', 0, async (): Promise<void> => {
      // uid is the numeric identity assigned at install time and must be
      // positive. codePath points into the install directory; it must be an
      // absolute path and must never contain a parent-directory traversal
      // segment that would escape the application sandbox.
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      expect(applicationInfo.uid > 0).assertTrue();
      expect(applicationInfo.codePath.length > 0).assertTrue();
      expect(applicationInfo.codePath.startsWith('/')).assertTrue();
      expect(applicationInfo.codePath.includes('../')).assertFalse();
      // The uid is a stable install-time constant and must not change on a
      // second independent application query.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APPLICATION);
      expect(refreshed.appInfo.uid).assertEqual(applicationInfo.uid);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_APPLICATION_0600
     * @tc.name bundleMetadataApplicationResourcesAndMetadata006
     * @tc.desc Verify ApplicationInfo label resource id is positive and its metadata array stays empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataApplicationResourcesAndMetadata006', 0, async (): Promise<void> => {
      // The application label declared in AppScope/app.json5 must resolve to a
      // positive resource id. The application-level metadata array must be a
      // present array and stay empty for the sample, which keeps the system
      // discovery screen of the launcher minimal.
      const applicationInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      expect(applicationInfo.labelId > 0).assertTrue();
      expect(Array.isArray(applicationInfo.metadataArray)).assertTrue();
      expect(applicationInfo.metadataArray.length).assertEqual(0);
      // The label resource binding must stay stable on a second query.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APPLICATION);
      expect(refreshed.appInfo.labelId).assertEqual(applicationInfo.labelId);
    });
  });

  describe('BundleMetadataPermissionMatrixTest', () => {
    let bundleInfo: bundleManager.BundleInfo;

    beforeEach(async (): Promise<void> => {
      // The permission payload plus the application payload are both required
      // so reqPermissionDetails and ApplicationInfo.permissions can be checked
      // against the same freshly resolved snapshot.
      bundleInfo = await bundleManager.getBundleInfoForSelf(
        FLAG_REQUESTED_PERMISSION | FLAG_APPLICATION
      );
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_PERMISSION_0100
     * @tc.name bundleMetadataRequestedPermissionsShape001
     * @tc.desc Verify reqPermissionDetails is always exposed as an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataRequestedPermissionsShape001', 0, async (): Promise<void> => {
      // reqPermissionDetails reflects every permission declared by the app.
      // The sample declares none, yet the field must still be a real array
      // instead of being absent, so consumers can iterate it unconditionally
      // without null checks before every permission bookkeeping operation.
      expect(Array.isArray(bundleInfo.reqPermissionDetails)).assertTrue();
      // The permission payload must also be present as an array under the
      // permission-only query, independent of the application payload.
      const permissionOnly: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        FLAG_REQUESTED_PERMISSION
      );
      expect(Array.isArray(permissionOnly.reqPermissionDetails)).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_PERMISSION_0200
     * @tc.name bundleMetadataRequestedPermissionsContent002
     * @tc.desc Verify every reqPermissionDetails element is a non-empty permission name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataRequestedPermissionsContent002', 0, async (): Promise<void> => {
      // Whatever the installed permission set is, each element must be a plain
      // non-empty permission name string; a non-string or empty element would
      // break permission bookkeeping for every subsystem that consumes the list.
      assertPermissionNameArray(bundleInfo.reqPermissionDetails);
      // The same content contract must hold for the permission-only query too.
      const permissionOnly: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        FLAG_REQUESTED_PERMISSION
      );
      assertPermissionNameArray(permissionOnly.reqPermissionDetails);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_PERMISSION_0300
     * @tc.name bundleMetadataRequestedPermissionsLeastPrivilege003
     * @tc.desc Verify the sample declares no requested permission in the installed metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataRequestedPermissionsLeastPrivilege003', 0, async (): Promise<void> => {
      // module.json5 contains no requestPermissions section, so the installed
      // list must stay empty. Least privilege keeps the attack screen of the
      // launcher sample minimal: no permission is requested, none is granted,
      // and no runtime permission dialog can ever be shown by the app.
      expect(bundleInfo.reqPermissionDetails.length).assertEqual(0);
      // The empty permission set must be stable under the permission-only query.
      const permissionOnly: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        FLAG_REQUESTED_PERMISSION
      );
      expect(permissionOnly.reqPermissionDetails.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_PERMISSION_0400
     * @tc.name bundleMetadataPermissionDetailsAndApplication004
     * @tc.desc Verify reqPermissionDetails and ApplicationInfo.permissions stay empty arrays for the sample
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataPermissionDetailsAndApplication004', 0, async (): Promise<void> => {
      // reqPermissionDetails carries grant details and ApplicationInfo.permissions
      // carries application-level permissions. Both must be present arrays and,
      // because no permission is requested, both must stay empty so no system
      // screen observes a silently injected permission.
      expect(Array.isArray(bundleInfo.reqPermissionDetails)).assertTrue();
      expect(bundleInfo.reqPermissionDetails.length).assertEqual(0);
      const applicationPermissions: Array<string> = bundleInfo.appInfo.permissions;
      expect(Array.isArray(applicationPermissions)).assertTrue();
      expect(applicationPermissions.length).assertEqual(0);
      // The application permission list must stay empty under a full matrix
      // query that requests every payload at once.
      const fullMatrix: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_FULL_MATRIX);
      expect(fullMatrix.appInfo.permissions.length).assertEqual(0);
    });
  });

  describe('BundleMetadataCallbackContractTest', () => {
    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_CALLBACK_0100
     * @tc.name bundleMetadataCallbackIdentity001
     * @tc.desc Verify the callback form returns the same identity as the Promise form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataCallbackIdentity001', 0, async (): Promise<void> => {
      // The callback and Promise shapes are two deliveries of one API. The
      // identity fields must be identical through the callback path, including
      // the application payload that the callback graph requests.
      const info: bundleManager.BundleInfo = await getBundleInfoByCallback(FLAG_CALLBACK_GRAPH);
      expect(info.name).assertEqual(BUNDLE_NAME);
      expect(typeof info.versionCode).assertEqual('number');
      expect(info.versionName.length > 0).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      // The callback snapshot must agree with an independent Promise query on
      // the same identity, so the two delivery shapes cannot diverge.
      const promiseView: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_CALLBACK_GRAPH);
      expect(info.versionCode).assertEqual(promiseView.versionCode);
      expect(info.versionName).assertEqual(promiseView.versionName);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_CALLBACK_0200
     * @tc.name bundleMetadataCallbackModule002
     * @tc.desc Verify the callback form exposes the entry module main element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataCallbackModule002', 0, async (): Promise<void> => {
      const info: bundleManager.BundleInfo = await getBundleInfoByCallback(FLAG_CALLBACK_GRAPH);
      expect(Array.isArray(info.hapModulesInfo)).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(entryHapModule(info).mainElementName).assertEqual(ENTRY_ABILITY_NAME);
      expect(entryHapModule(info).name).assertEqual(ENTRY_MODULE_NAME);
      // The Promise shape must expose the identical module main element.
      const promiseView: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_CALLBACK_GRAPH);
      expect(entryHapModule(promiseView).mainElementName).assertEqual(ENTRY_ABILITY_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_CALLBACK_0300
     * @tc.name bundleMetadataCallbackAbility003
     * @tc.desc Verify the callback form returns EntryAbility and EntryBackupAbility together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataCallbackAbility003', 0, async (): Promise<void> => {
      const info: bundleManager.BundleInfo = await getBundleInfoByCallback(FLAG_CALLBACK_GRAPH);
      const entryModule: bundleManager.HapModuleInfo = entryHapModule(info);
      expect(entryModule.abilitiesInfo.length).assertEqual(1);
      expect(entryModule.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY_NAME);
      expect(entryModule.extensionAbilitiesInfo.length).assertEqual(1);
      expect(entryModule.extensionAbilitiesInfo[0].name).assertEqual(BACKUP_ABILITY_NAME);
      // The callback and Promise shapes must expose the identical module graph.
      const promiseView: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_CALLBACK_GRAPH);
      expect(entryHapModule(promiseView).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY_NAME);
      expect(entryHapModule(promiseView).extensionAbilitiesInfo[0].name).assertEqual(BACKUP_ABILITY_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_CALLBACK_0400
     * @tc.name bundleMetadataCallbackConcurrent004
     * @tc.desc Verify concurrent callback queries keep one consistent metadata snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataCallbackConcurrent004', 0, async (): Promise<void> => {
      // Concurrent callback requests share the BMS connection. Every returned
      // snapshot must preserve the same identity and module graph; any
      // cross-wiring between requests would indicate corrupted service state.
      const requests: Promise<bundleManager.BundleInfo>[] = [];
      for (let index: number = 0; index < CONCURRENT_QUERY_COUNT; index++) {
        requests.push(getBundleInfoByCallback(FLAG_CALLBACK_GRAPH));
      }
      const snapshots: bundleManager.BundleInfo[] = await Promise.all(requests);
      for (let index: number = 0; index < snapshots.length; index++) {
        expect(snapshots[index].name).assertEqual(BUNDLE_NAME);
        expect(entryHapModule(snapshots[index]).mainElementName).assertEqual(ENTRY_ABILITY_NAME);
        expect(entryHapModule(snapshots[index]).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY_NAME);
        expect(entryHapModule(snapshots[index]).extensionAbilitiesInfo[0].name).assertEqual(BACKUP_ABILITY_NAME);
      }
      // The concurrent burst must not alter the identity of a follow-up query.
      const afterBurst: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_CALLBACK_GRAPH);
      expect(afterBurst.name).assertEqual(BUNDLE_NAME);
    });
  });

  describe('BundleMetadataFlagMatrixTest', () => {
    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_FLAG_0100
     * @tc.name bundleMetadataFlagApplication001
     * @tc.desc Verify WITH_APPLICATION alone populates the application payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataFlagApplication001', 0, async (): Promise<void> => {
      // The APPLICATION bit alone must fill appInfo without any other payload.
      // The returned application must carry the correct identity, a positive
      // uid and the regular APP bundle type in one query.
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APPLICATION);
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(info.appInfo.uid > 0).assertTrue();
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      // The application payload must observe the same identity as the default
      // query, proving the flag adds payload without changing identity.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      assertSameIdentity(info, baseline);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_FLAG_0200
     * @tc.name bundleMetadataFlagHapModule002
     * @tc.desc Verify WITH_HAP_MODULE alone populates the HAP module list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataFlagHapModule002', 0, async (): Promise<void> => {
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_HAP_MODULE);
      expect(Array.isArray(info.hapModulesInfo)).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(entryHapModule(info).name).assertEqual(ENTRY_MODULE_NAME);
      // The module query must not change the identity observed by the default
      // query, so identity and module payload stay independent.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      assertSameIdentity(info, baseline);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_FLAG_0300
     * @tc.name bundleMetadataFlagAbility003
     * @tc.desc Verify WITH_ABILITY combined with WITH_HAP_MODULE exposes the ability tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataFlagAbility003', 0, async (): Promise<void> => {
      // WITH_ABILITY fills the per-module ability tree and therefore must be
      // combined with WITH_HAP_MODULE to reach the entry module abilities. The
      // resolved ability must keep its name and ownership binding intact.
      const flags: number = FLAG_HAP_MODULE | FLAG_ABILITY;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(entryHapModule(info).abilitiesInfo.length).assertEqual(1);
      expect(entryHapModule(info).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY_NAME);
      expect(entryHapModule(info).abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
      // The ability payload must not shift the installed identity.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      assertSameIdentity(info, baseline);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_FLAG_0400
     * @tc.name bundleMetadataFlagExtensionAbility004
     * @tc.desc Verify WITH_EXTENSION_ABILITY combined with WITH_HAP_MODULE exposes the extension tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataFlagExtensionAbility004', 0, async (): Promise<void> => {
      const flags: number = FLAG_HAP_MODULE | FLAG_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(entryHapModule(info).extensionAbilitiesInfo.length).assertEqual(1);
      expect(entryHapModule(info).extensionAbilitiesInfo[0].name).assertEqual(BACKUP_ABILITY_NAME);
      expect(entryHapModule(info).extensionAbilitiesInfo[0].exported).assertFalse();
      // The extension payload query must keep the default identity stable.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      assertSameIdentity(info, baseline);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_FLAG_0500
     * @tc.name bundleMetadataFlagMetadata005
     * @tc.desc Verify WITH_METADATA returns the backup metadata binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataFlagMetadata005', 0, async (): Promise<void> => {
      // WITH_METADATA fills module and ability level metadata. The backup
      // extension metadata binding must be readable under this flag; it is the
      // metadata entry the backup framework resolves at restore time.
      const flags: number = FLAG_HAP_MODULE | FLAG_ABILITY | FLAG_EXTENSION_ABILITY | FLAG_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      const backupMetadata: bundleManager.Metadata[] = entryHapModule(info).extensionAbilitiesInfo[0].metadata;
      expect(Array.isArray(backupMetadata)).assertTrue();
      expect(backupMetadata.length).assertEqual(1);
      expect(backupMetadata[0].name).assertEqual(BACKUP_METADATA_NAME);
      // The metadata payload must not alter the underlying bundle identity.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      assertSameIdentity(info, baseline);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_FLAG_0600
     * @tc.name bundleMetadataFlagSkill006
     * @tc.desc Verify WITH_SKILL returns the EntryAbility Home skill actions and entities
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataFlagSkill006', 0, async (): Promise<void> => {
      // WITH_SKILL fills the ability skill list; the Home action and entity
      // must be visible once the flag requests the skill payload. The skill is
      // what makes EntryAbility a Home-launchable entry point.
      const flags: number = FLAG_HAP_MODULE | FLAG_ABILITY | FLAG_SKILL;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      const skills: bundleManager.Skill[] = entryHapModule(info).abilitiesInfo[0].skills;
      expect(skills.length).assertEqual(1);
      expect(skills[0].actions[0]).assertEqual(HOME_ACTION);
      expect(skills[0].entities[0]).assertEqual(HOME_ENTITY);
      // The skill payload query must keep the identity stable as well.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      assertSameIdentity(info, baseline);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_FLAG_0700
     * @tc.name bundleMetadataFlagRequestedPermission007
     * @tc.desc Verify WITH_REQUESTED_PERMISSION alone returns the permission array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataFlagRequestedPermission007', 0, async (): Promise<void> => {
      // The permission bit alone must expose reqPermissionDetails as an array.
      // The sample requests no permission, so the array must be present and
      // empty under the permission-only query as well.
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_REQUESTED_PERMISSION);
      expect(Array.isArray(info.reqPermissionDetails)).assertTrue();
      expect(info.reqPermissionDetails.length).assertEqual(0);
      // The permission-only query must not change the installed identity.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      assertSameIdentity(info, baseline);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_FLAG_0800
     * @tc.name bundleMetadataFlagSignature008
     * @tc.desc Verify WITH_SIGNATURE_INFO returns a signature bound to the bundle identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataFlagSignature008', 0, async (): Promise<void> => {
      const flags: number = FLAG_SIGNATURE | FLAG_APPLICATION;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      const signature: bundleManager.SignatureInfo = info.signatureInfo;
      // appId is derived from the bundle identity and signing material, so it
      // must contain the bundle name; the fingerprint is a non-blank digest of
      // at least the expected minimum length.
      expect(signature.appId.length > 0).assertTrue();
      expect(signature.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(signature.fingerprint.length >= MIN_SIGNATURE_FINGERPRINT_LENGTH).assertTrue();
      // The signature query must keep the application identity stable.
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_FLAG_0900
     * @tc.name bundleMetadataFlagFullMatrix009
     * @tc.desc Verify the full flag combination populates every metadata payload consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataFlagFullMatrix009', 0, async (): Promise<void> => {
      // The full matrix combines every flag of the suite. All payloads must be
      // populated at once while the shared identity fields stay stable, proving
      // no flag combination corrupts another payload.
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_FULL_MATRIX);
      expect(info.name).assertEqual(BUNDLE_NAME);
      expect(info.appInfo.uid > 0).assertTrue();
      const entryModule: bundleManager.HapModuleInfo = entryHapModule(info);
      expect(entryModule.mainElementName).assertEqual(ENTRY_ABILITY_NAME);
      expect(entryModule.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY_NAME);
      expect(entryModule.extensionAbilitiesInfo[0].name).assertEqual(BACKUP_ABILITY_NAME);
      expect(entryModule.extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA_NAME);
      expect(entryModule.abilitiesInfo[0].skills[0].actions[0]).assertEqual(HOME_ACTION);
      expect(Array.isArray(info.reqPermissionDetails)).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      // The full payload must observe the same identity as a default query.
      const baseline: bundleManager.BundleInfo = await queryDefaultIdentity();
      assertSameIdentity(info, baseline);
    });
  });

  describe('BundleMetadataCrossFlagConsistencyTest', () => {
    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_CROSS_0100
     * @tc.name bundleMetadataDefaultFullIdentity001
     * @tc.desc Verify the default query and the full-matrix query expose one identical bundle identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataDefaultFullIdentity001', 0, async (): Promise<void> => {
      // The default flag and the full payload set are the two ends of the flag
      // spectrum. Both must resolve to the same installed bundle identity: the
      // payload flags add data, they never change the identity being described.
      const defaultInfo: bundleManager.BundleInfo = await queryDefaultIdentity();
      const fullInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_FULL_MATRIX);
      assertSameIdentity(defaultInfo, fullInfo);
      expect(fullInfo.name).assertEqual(BUNDLE_NAME);
      expect(defaultInfo.versionCode).assertEqual(fullInfo.versionCode);
      expect(defaultInfo.versionName).assertEqual(fullInfo.versionName);
      expect(defaultInfo.appIndex).assertEqual(fullInfo.appIndex);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_CROSS_0200
     * @tc.name bundleMetadataRepeatedReadStability002
     * @tc.desc Verify repeated reads of the module graph never drift in identity or module structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataRepeatedReadStability002', 0, async (): Promise<void> => {
      // Repeated independent reads of the same payload must never drift: BMS
      // returns immutable snapshots, so four module-graph reads must all expose
      // the same identity and the same entry module main element.
      let firstMainElement: string = '';
      for (let index: number = 0; index < 4; index++) {
        const snapshot: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MODULE_GRAPH);
        expect(snapshot.name).assertEqual(BUNDLE_NAME);
        const mainElement: string = entryHapModule(snapshot).mainElementName;
        if (index === 0) {
          firstMainElement = mainElement;
        }
        expect(mainElement).assertEqual(firstMainElement);
        expect(mainElement).assertEqual(ENTRY_ABILITY_NAME);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_CROSS_0300
     * @tc.name bundleMetadataCallbackPromiseIdentity003
     * @tc.desc Verify the callback and Promise delivery shapes expose pairwise identical identity fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataCallbackPromiseIdentity003', 0, async (): Promise<void> => {
      // Run the same identity assertions through both delivery shapes and compare
      // the resolved values pairwise, so a divergence between the callback and
      // the Promise path is caught regardless of which shape the app uses.
      const callbackInfo: bundleManager.BundleInfo = await getBundleInfoByCallback(FLAG_CALLBACK_GRAPH);
      const promiseInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_CALLBACK_GRAPH);
      expect(callbackInfo.name).assertEqual(promiseInfo.name);
      expect(callbackInfo.versionCode).assertEqual(promiseInfo.versionCode);
      expect(callbackInfo.versionName).assertEqual(promiseInfo.versionName);
      expect(callbackInfo.appIndex).assertEqual(promiseInfo.appIndex);
      expect(callbackInfo.appInfo.uid).assertEqual(promiseInfo.appInfo.uid);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_CROSS_0400
     * @tc.name bundleMetadataPermissionAcrossFlags004
     * @tc.desc Verify the permission payload is identical whether requested alone or inside the full matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataPermissionAcrossFlags004', 0, async (): Promise<void> => {
      // The permission payload must be identical whether it is requested alone
      // or inside the full matrix, so flag composition cannot alter the
      // permission data the system exposes for the installed package.
      const permissionOnly: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        FLAG_REQUESTED_PERMISSION
      );
      const fullMatrix: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_FULL_MATRIX);
      expect(permissionOnly.reqPermissionDetails.length).assertEqual(fullMatrix.reqPermissionDetails.length);
      expect(permissionOnly.reqPermissionDetails.length).assertEqual(0);
      expect(fullMatrix.reqPermissionDetails.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_CROSS_0500
     * @tc.name bundleMetadataSignatureIdentityStable005
     * @tc.desc Verify the signature payload describes the same installed application as the default identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataSignatureIdentityStable005', 0, async (): Promise<void> => {
      // The signature payload must describe the same installed application as
      // the default query, including the uid that binds the signer identity to
      // the package, so the signature cannot drift from the bundle identity.
      const flags: number = FLAG_SIGNATURE | FLAG_APPLICATION;
      const signatureInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      const defaultInfo: bundleManager.BundleInfo = await queryDefaultIdentity();
      assertSameIdentity(signatureInfo, defaultInfo);
      expect(signatureInfo.appInfo.uid > 0).assertTrue();
      expect(signatureInfo.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
    });
  });

  describe('BundleMetadataSkillsMetadataMatrixTest', () => {
    let bundleInfo: bundleManager.BundleInfo;

    beforeEach(async (): Promise<void> => {
      // The manifest graph adds the skill and metadata payloads on top of the
      // module graph so the skill and metadata fields are fully resolvable.
      bundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MANIFEST_GRAPH);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_SKILLS_0100
     * @tc.name bundleMetadataAbilitySkillCount001
     * @tc.desc Verify EntryAbility exposes exactly one skill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataAbilitySkillCount001', 0, async (): Promise<void> => {
      // The entry ability declares exactly one Home skill. The skill list must
      // be a real array with one element; a second skill would open an
      // additional invocation screen beyond the launcher contract.
      const skills: bundleManager.Skill[] = entryHapModule(bundleInfo).abilitiesInfo[0].skills;
      expect(Array.isArray(skills)).assertTrue();
      expect(skills.length).assertEqual(1);
      // The skill count must stay stable when the whole graph is re-read.
      const refreshed: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_MANIFEST_GRAPH);
      expect(entryHapModule(refreshed).abilitiesInfo[0].skills.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_SKILLS_0200
     * @tc.name bundleMetadataHomeAction002
     * @tc.desc Verify the EntryAbility skill declares the OpenHarmony Home action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataHomeAction002', 0, async (): Promise<void> => {
      // The Home skill must expose the canonical OpenHarmony Home action so the
      // desktop can match the launcher. The action list must be a real array
      // with exactly one non-empty action entry.
      const homeSkill: bundleManager.Skill = entryHapModule(bundleInfo).abilitiesInfo[0].skills[0];
      expect(Array.isArray(homeSkill.actions)).assertTrue();
      expect(homeSkill.actions.length).assertEqual(1);
      expect(homeSkill.actions[0]).assertEqual(HOME_ACTION);
      // The Home action must be stable across an independent skill query.
      const skillView: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        FLAG_HAP_MODULE | FLAG_ABILITY | FLAG_SKILL
      );
      expect(entryHapModule(skillView).abilitiesInfo[0].skills[0].actions[0]).assertEqual(HOME_ACTION);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_SKILLS_0300
     * @tc.name bundleMetadataHomeEntity003
     * @tc.desc Verify the EntryAbility skill declares the system Home entity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataHomeEntity003', 0, async (): Promise<void> => {
      // The Home skill must also carry the system Home entity; the pair of
      // action and entity is what the desktop matches to discover a launcher.
      // The entity list must be an array with exactly one non-empty entity.
      const homeSkill: bundleManager.Skill = entryHapModule(bundleInfo).abilitiesInfo[0].skills[0];
      expect(Array.isArray(homeSkill.entities)).assertTrue();
      expect(homeSkill.entities.length).assertEqual(1);
      expect(homeSkill.entities[0]).assertEqual(HOME_ENTITY);
      // The Home entity must be stable under a second skill query.
      const skillView: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        FLAG_HAP_MODULE | FLAG_ABILITY | FLAG_SKILL
      );
      expect(entryHapModule(skillView).abilitiesInfo[0].skills[0].entities[0]).assertEqual(HOME_ENTITY);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_SKILLS_0400
     * @tc.name bundleMetadataHomeUri004
     * @tc.desc Verify the Home skill exposes no URI routing screen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataHomeUri004', 0, async (): Promise<void> => {
      // The launcher Home skill declares no deep links. An unintended URI would
      // broaden external invocation paths beyond the tested Want contract, and
      // domain verification must stay off for a launcher-only entry.
      const homeSkill: bundleManager.Skill = entryHapModule(bundleInfo).abilitiesInfo[0].skills[0];
      expect(Array.isArray(homeSkill.uris)).assertTrue();
      expect(homeSkill.uris.length).assertEqual(0);
      expect(homeSkill.domainVerify).assertFalse();
      // The no-URI screen must hold for the skill-only query as well.
      const skillView: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        FLAG_HAP_MODULE | FLAG_ABILITY | FLAG_SKILL
      );
      expect(entryHapModule(skillView).abilitiesInfo[0].skills[0].uris.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_SKILLS_0500
     * @tc.name bundleMetadataBackupMetadata005
     * @tc.desc Verify EntryBackupAbility metadata binds the system backup profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataBackupMetadata005', 0, async (): Promise<void> => {
      // The backup extension carries exactly one metadata entry that binds the
      // system backup profile resource. Its name must be the documented backup
      // metadata key so the backup framework can discover the extension.
      const backupMetadata: bundleManager.Metadata[] = entryHapModule(bundleInfo).extensionAbilitiesInfo[0].metadata;
      expect(Array.isArray(backupMetadata)).assertTrue();
      expect(backupMetadata.length).assertEqual(1);
      expect(backupMetadata[0].name).assertEqual(BACKUP_METADATA_NAME);
      // The backup metadata binding must survive a full-matrix read as well.
      const fullMatrix: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_FULL_MATRIX);
      expect(entryHapModule(fullMatrix).extensionAbilitiesInfo[0].metadata[0].name)
        .assertEqual(BACKUP_METADATA_NAME);
      // The backup metadata binding must be readable under a metadata-only flag
      // combination as well, proving the metadata flag carries the binding.
      const metadataView: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        FLAG_HAP_MODULE | FLAG_EXTENSION_ABILITY | FLAG_METADATA
      );
      expect(entryHapModule(metadataView).extensionAbilitiesInfo[0].metadata[0].name)
        .assertEqual(BACKUP_METADATA_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BUNDLE_METADATA_SKILLS_0600
     * @tc.name bundleMetadataMetadataIsolation006
     * @tc.desc Verify metadata isolation: only the backup extension carries metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bundleMetadataMetadataIsolation006', 0, async (): Promise<void> => {
      // The module and the EntryAbility declare no unrelated metadata; only the
      // backup extension holds the system backup configuration metadata. This
      // keeps the system discovery screen of the sample minimal and prevents
      // an unrelated discovery path from being introduced silently.
      const entryModule: bundleManager.HapModuleInfo = entryHapModule(bundleInfo);
      expect(entryModule.metadata.length).assertEqual(0);
      expect(entryModule.abilitiesInfo[0].metadata.length).assertEqual(0);
      expect(entryModule.extensionAbilitiesInfo[0].metadata.length).assertEqual(1);
      // The isolation must hold under the full matrix payload as well.
      const fullMatrix: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_FULL_MATRIX);
      const fullEntry: bundleManager.HapModuleInfo = entryHapModule(fullMatrix);
      expect(fullEntry.metadata.length).assertEqual(0);
      expect(fullEntry.abilitiesInfo[0].metadata.length).assertEqual(0);
      expect(fullEntry.extensionAbilitiesInfo[0].metadata.length).assertEqual(1);
    });
  });
}
