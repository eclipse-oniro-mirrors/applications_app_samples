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

import { describe, it, expect } from '@ohos/hypium';
import {
  SETTINGS_ITEM_COUNT,
  SETTINGS_NAVBAR_RATIO,
  SettingsEntry,
  SettingsModel
} from './Shared/SettingsModel';
import {
  averageOf,
  rangeOf,
  resolveBreakpoint,
  safeDivide,
  WIDTH_LG,
  WIDTH_MD,
  WIDTH_SM,
  WIDTH_XS
} from './Shared/SharedDriver';

const DATASET = 'SettingsExtensionTest_';

export default function settingsExtensionSuite() {
  describe('SettingsFeatureExtension', () => {
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1330
     * @tc.name    SettingsExtension1330
     * @tc.desc    Breakpoint resolver maps negative width to unknown
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'resolveBreakpoint_001', 0, () => {
      expect(resolveBreakpoint(-1)).assertEqual('unknown');
      expect(resolveBreakpoint(-1000)).assertEqual('unknown');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1331
     * @tc.name    SettingsExtension1331
     * @tc.desc    Breakpoint resolver covers the xs to sm transition
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'resolveBreakpoint_002', 0, () => {
      expect(resolveBreakpoint(0)).assertEqual('xs');
      expect(resolveBreakpoint(319)).assertEqual('xs');
      expect(resolveBreakpoint(320)).assertEqual('sm');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1332
     * @tc.name    SettingsExtension1332
     * @tc.desc    Breakpoint resolver covers the sm to md transition
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'resolveBreakpoint_003', 0, () => {
      expect(resolveBreakpoint(599)).assertEqual('sm');
      expect(resolveBreakpoint(600)).assertEqual('md');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1333
     * @tc.name    SettingsExtension1333
     * @tc.desc    Breakpoint resolver covers the md to lg transition and above
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'resolveBreakpoint_004', 0, () => {
      expect(resolveBreakpoint(839)).assertEqual('md');
      expect(resolveBreakpoint(840)).assertEqual('lg');
      expect(resolveBreakpoint(9999)).assertEqual('lg');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1334
     * @tc.name    SettingsExtension1334
     * @tc.desc    Sample range handles empty, single and mixed samples
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'rangeOf_001', 0, () => {
      expect(rangeOf([])).assertEqual(0);
      expect(rangeOf([5])).assertEqual(0);
      expect(rangeOf([3, 1, 4, 1, 5])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1335
     * @tc.name    SettingsExtension1335
     * @tc.desc    Sample average handles empty and uneven sample sets
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'averageOf_001', 0, () => {
      expect(averageOf([])).assertEqual(0);
      expect(averageOf([1, 2])).assertEqual(1.5);
      expect(averageOf([2, 4, 6])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1336
     * @tc.name    SettingsExtension1336
     * @tc.desc    Safe division guards a zero divisor and keeps the sign
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'safeDivide_001', 0, () => {
      expect(safeDivide(10, 0)).assertEqual(0);
      expect(safeDivide(0, 5)).assertEqual(0);
      expect(safeDivide(-6, 3)).assertEqual(-2);
      expect(safeDivide(1, 4)).assertEqual(0.25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1337
     * @tc.name    SettingsExtension1337
     * @tc.desc    Shared window width probes increase strictly from xs to lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'widthProbes_001', 0, () => {
      expect(WIDTH_XS < WIDTH_SM).assertTrue();
      expect(WIDTH_SM < WIDTH_MD).assertTrue();
      expect(WIDTH_MD < WIDTH_LG).assertTrue();
      expect(WIDTH_MD >= 600).assertTrue();
      expect(WIDTH_LG >= 840).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1338
     * @tc.name    SettingsExtension1338
     * @tc.desc    Settings item count matches the seeded entry list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getItemCount_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getItemCount()).assertEqual(SETTINGS_ITEM_COUNT);
      expect(model.getEntries().length).assertEqual(SETTINGS_ITEM_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1339
     * @tc.name    SettingsExtension1339
     * @tc.desc    Seeded entries keep their original key, toggle and state flags
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'seedEntries_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      const entries: SettingsEntry[] = model.getEntries();
      expect(entries[0].key).assertEqual('wlan');
      expect(entries[0].hasToggle).assertTrue();
      expect(entries[0].enabled).assertTrue();
      expect(entries[1].enabled).assertFalse();
      expect(entries[3].key).assertEqual('moreConnections');
      expect(entries[3].hasToggle).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1340
     * @tc.name    SettingsExtension1340
     * @tc.desc    Only the WLAN switch starts enabled
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getEnabledCount_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getEnabledCount()).assertEqual(1);
      expect(model.isEnabled('wlan')).assertTrue();
      expect(model.isEnabled('bluetooth')).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1341
     * @tc.name    SettingsExtension1341
     * @tc.desc    Unknown keys are reported as disabled
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isEnabled_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isEnabled('')).assertFalse();
      expect(model.isEnabled('missing')).assertFalse();
      expect(model.isEnabled('WLAN')).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1342
     * @tc.name    SettingsExtension1342
     * @tc.desc    Entry lookup is exact and rejects padded or upper case keys
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getEntry_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getEntry(' wlan') === undefined).assertTrue();
      expect(model.getEntry('wlan ') === undefined).assertTrue();
      expect(model.getEntry('WLAN') === undefined).assertTrue();
      expect((model.getEntry('wlan') as SettingsEntry).key).assertEqual('wlan');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1343
     * @tc.name    SettingsExtension1343
     * @tc.desc    Toggle is rejected for an entry without a switch
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isToggleRejected_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isToggleRejected('moreConnections')).assertTrue();
      expect(model.isEnabled('moreConnections')).assertFalse();
      expect(model.toggle('moreConnections')).assertFalse();
      expect(model.isEnabled('moreConnections')).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1344
     * @tc.name    SettingsExtension1344
     * @tc.desc    Toggle is rejected for a missing entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isToggleRejected_002', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isToggleRejected('missing')).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1345
     * @tc.name    SettingsExtension1345
     * @tc.desc    Toggle is accepted for an entry that owns a switch
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isToggleRejected_003', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isToggleRejected('wlan')).assertFalse();
      expect(model.isEnabled('wlan')).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1346
     * @tc.name    SettingsExtension1346
     * @tc.desc    Navbar width uses the fixed forty percent ratio
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'navbarWidth_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(1000)).assertEqual(400);
      expect(model.navbarWidth(0)).assertEqual(0);
      expect(SETTINGS_NAVBAR_RATIO).assertEqual(0.4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1347
     * @tc.name    SettingsExtension1347
     * @tc.desc    Split mode turns on at the six hundred vp boundary
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'isSplitMode_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(599.999)).assertFalse();
      expect(model.isSplitMode(600)).assertTrue();
      expect(model.isSplitMode(-1)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1348
     * @tc.name    SettingsExtension1348
     * @tc.desc    Entry accessor returns the same backing list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getEntries_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getEntries() === model.getEntries()).assertTrue();
      expect(model.getEntries()[0] === model.getEntry('wlan')).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1349
     * @tc.name    SettingsExtension1349
     * @tc.desc    Three seeded entries own a toggle
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleCount_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getToggleCount()).assertEqual(3);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1350
     * @tc.name    SettingsExtension1350
     * @tc.desc    Toggling WLAN off drives the enabled count to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleOff_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.toggle('wlan')).assertTrue();
      expect(model.getEnabledCount()).assertEqual(0);
      expect(model.isEnabled('wlan')).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1351
     * @tc.name    SettingsExtension1351
     * @tc.desc    Toggling WLAN twice restores the enabled count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleRoundTrip_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.toggle('wlan');
      model.toggle('wlan');
      expect(model.getEnabledCount()).assertEqual(1);
      expect(model.isEnabled('wlan')).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1352
     * @tc.name    SettingsExtension1352
     * @tc.desc    Enabled check reflects a toggle immediately
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleReflect_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.toggle('bluetooth')).assertTrue();
      expect(model.isEnabled('bluetooth')).assertTrue();
      const entry: SettingsEntry | undefined = model.getEntry('bluetooth');
      expect((entry as SettingsEntry).enabled).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1353
     * @tc.name    SettingsExtension1353
     * @tc.desc    Toggling Bluetooth does not change WLAN state
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleOther_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.toggle('bluetooth');
      expect(model.isEnabled('wlan')).assertTrue();
      expect(model.isEnabled('bluetooth')).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1354
     * @tc.name    SettingsExtension1354
     * @tc.desc    Toggle success flips only the enabled flag
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleFlag_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.toggle('wlan');
      const entry: SettingsEntry = model.getEntry('wlan') as SettingsEntry;
      expect(entry.key).assertEqual('wlan');
      expect(entry.title).assertEqual('WLAN');
      expect(entry.hasToggle).assertTrue();
      expect(entry.enabled).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1355
     * @tc.name    SettingsExtension1355
     * @tc.desc    Two entries toggle independently
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleTwice_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.toggle('wlan');
      model.toggle('bluetooth');
      expect(model.getEnabledCount()).assertEqual(1);
      expect(model.isEnabled('wlan')).assertFalse();
      expect(model.isEnabled('bluetooth')).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1356
     * @tc.name    SettingsExtension1356
     * @tc.desc    Seeded entry keys are unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'uniqueKeys_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.hasUniqueKeys()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1357
     * @tc.name    SettingsExtension1357
     * @tc.desc    Duplicating a key through the exposed list breaks uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'duplicateKey_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      const entries: SettingsEntry[] = model.getEntries();
      entries[1].key = entries[0].key;
      expect(model.hasUniqueKeys()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1358
     * @tc.name    SettingsExtension1358
     * @tc.desc    Appending an entry raises item count and enables lookup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'appendEntry_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().push({ key: 'nfc', title: 'NFC', hasToggle: true, enabled: false });
      expect(model.getItemCount()).assertEqual(SETTINGS_ITEM_COUNT + 1);
      expect(model.getEntry('nfc') !== undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1359
     * @tc.name    SettingsExtension1359
     * @tc.desc    Entry field mutation stays visible through the model
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'entryAlias_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries()[0].enabled = false;
      expect(model.isEnabled('wlan')).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1360
     * @tc.name    SettingsExtension1360
     * @tc.desc    Every entry key matches its title ignoring case
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'keyTitle_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      for (let i = 0; i < model.getItemCount(); i++) {
        const entry: SettingsEntry = model.getEntries()[i];
        expect(entry.key.toLowerCase()).assertEqual(entry.title.toLowerCase());
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1361
     * @tc.name    SettingsExtension1361
     * @tc.desc    Entry keys stay lower camel while titles keep mixed case
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'entryKeyCase_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      for (let i = 0; i < model.getItemCount(); i++) {
        const entry: SettingsEntry = model.getEntries()[i];
        expect(entry.key.charAt(0)).assertEqual(entry.key.charAt(0).toLowerCase());
        expect(entry.key.indexOf(' ')).assertEqual(-1);
      }
      expect(model.getEntries()[0].title).assertEqual('WLAN');
      expect(model.getEntries()[1].title).assertEqual('Bluetooth');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1362
     * @tc.name    SettingsExtension1362
     * @tc.desc    Every entry title is non empty and unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'titleText_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      const titles: Set<string> = new Set<string>();
      for (let i = 0; i < model.getItemCount(); i++) {
        const entry: SettingsEntry = model.getEntries()[i];
        expect(entry.title.length > 0).assertTrue();
        titles.add(entry.title);
      }
      expect(titles.size).assertEqual(model.getItemCount());
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1363
     * @tc.name    SettingsExtension1363
     * @tc.desc    Navbar width doubles when the window width doubles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navbarLinear_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(500)).assertEqual(200);
      expect(model.navbarWidth(1000)).assertEqual(model.navbarWidth(500) * 2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1364
     * @tc.name    SettingsExtension1364
     * @tc.desc    Successive toggles keep the toggle count unchanged
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleCountStable_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.toggle('wlan');
      model.toggle('bluetooth');
      model.toggle('mobileData');
      expect(model.getToggleCount()).assertEqual(3);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1365
     * @tc.name    SettingsExtension1365
     * @tc.desc    Rejected toggles never change the enabled count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'enabledAfterReject_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.toggle('moreConnections')).assertFalse();
      expect(model.toggle('missing')).assertFalse();
      expect(model.getEnabledCount()).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1366
     * @tc.name    SettingsExtension1366
     * @tc.desc    Two models keep independent toggle state
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'modelIsolation_001', 0, () => {
      const first: SettingsModel = new SettingsModel();
      const second: SettingsModel = new SettingsModel();
      first.toggle('wlan');
      expect(second.isEnabled('wlan')).assertTrue();
      expect(second.getEnabledCount()).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1367
     * @tc.name    SettingsExtension1367
     * @tc.desc    Seeded item count matches the shared constant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'itemCountConstant_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getItemCount()).assertEqual(SETTINGS_ITEM_COUNT);
      expect(model.getEntries().length).assertEqual(SETTINGS_ITEM_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1368
     * @tc.name    SettingsExtension1368
     * @tc.desc    Turning the only switch off leaves every entry disabled
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'disabledAll_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.toggle('wlan');
      for (let i = 0; i < model.getItemCount(); i++) {
        expect(model.getEntries()[i].enabled).assertFalse();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1369
     * @tc.name    SettingsExtension1369
     * @tc.desc    Turning every switch on raises the enabled count to three
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleAll_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.toggle('bluetooth');
      model.toggle('mobileData');
      expect(model.getEnabledCount()).assertEqual(3);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1370
     * @tc.name    SettingsExtension1370
     * @tc.desc    Turning the extra switches back restores the seed count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleAllBack_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.toggle('bluetooth');
      model.toggle('mobileData');
      model.toggle('bluetooth');
      model.toggle('mobileData');
      expect(model.getEnabledCount()).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1371
     * @tc.name    SettingsExtension1371
     * @tc.desc    Turning one switch off while another on keeps the count at one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleMixed_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.toggle('wlan');
      model.toggle('mobileData');
      expect(model.getEnabledCount()).assertEqual(1);
      expect(model.isEnabled('mobileData')).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1372
     * @tc.name    SettingsExtension1372
     * @tc.desc    Seeded titles keep their published order and casing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'titleOrder_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getEntries()[0].title).assertEqual('WLAN');
      expect(model.getEntries()[1].title).assertEqual('Bluetooth');
      expect(model.getEntries()[2].title).assertEqual('MobileData');
      expect(model.getEntries()[3].title).assertEqual('MoreConnections');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1373
     * @tc.name    SettingsExtension1373
     * @tc.desc    An entry with an empty key is registered and found by exact lookup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'emptyKeyEntry_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().push({ key: '', title: 'Empty', hasToggle: false, enabled: false });
      expect(model.getItemCount()).assertEqual(5);
      expect(model.getEntry('') === model.getEntries()[4]).assertTrue();
      expect(model.hasUniqueKeys()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1374
     * @tc.name    SettingsExtension1374
     * @tc.desc    Lookup returns the exact entry object held by the list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'entryIdentity_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getEntry('wlan') === model.getEntries()[0]).assertTrue();
      expect(model.getEntry('moreConnections') === model.getEntries()[3]).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1375
     * @tc.name    SettingsExtension1375
     * @tc.desc    Entry lookup rejects an empty key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'entryEmptyKey_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getEntry('') === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1376
     * @tc.name    SettingsExtension1376
     * @tc.desc    Prefix lookups never resolve a longer entry key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'prefixLookup_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.getEntry('wlanx') === undefined).assertTrue();
      expect(model.getEntry('blue') === undefined).assertTrue();
      expect(model.getEntry('more') === undefined).assertTrue();
      expect((model.getEntry('moreConnections') as SettingsEntry).hasToggle).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1377
     * @tc.name    SettingsExtension1377
     * @tc.desc    Flipping a has toggle flag updates the toggle count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleFlagMutate_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries()[3].hasToggle = true;
      expect(model.getToggleCount()).assertEqual(4);
      expect(model.isToggleRejected('moreConnections')).assertFalse();
      model.getEntries()[3].hasToggle = false;
      expect(model.getToggleCount()).assertEqual(3);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1378
     * @tc.name    SettingsExtension1378
     * @tc.desc    Navbar width keeps a negative window width
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navbarNegative_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(-100)).assertEqual(-40);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1379
     * @tc.name    SettingsExtension1379
     * @tc.desc    Navbar width keeps a fractional input
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navbarFraction_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(2.5)).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1380
     * @tc.name    SettingsExtension1380
     * @tc.desc    Appending an enabled switch raises both counters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'appendToggleEntry_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().push({ key: 'nfc', title: 'NFC', hasToggle: true, enabled: true });
      expect(model.getItemCount()).assertEqual(5);
      expect(model.getToggleCount()).assertEqual(4);
      expect(model.getEnabledCount()).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1381
     * @tc.name    SettingsExtension1381
     * @tc.desc    Appending an enabled entry without a switch only raises the enabled count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'appendPlainEntry_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().push({ key: 'battery', title: 'Battery', hasToggle: false, enabled: true });
      expect(model.getItemCount()).assertEqual(5);
      expect(model.getToggleCount()).assertEqual(3);
      expect(model.getEnabledCount()).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1382
     * @tc.name    SettingsExtension1382
     * @tc.desc    Popping the last entry lowers the item count only
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'popEntry_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().pop();
      expect(model.getItemCount()).assertEqual(3);
      expect(model.getToggleCount()).assertEqual(3);
      expect(model.getEnabledCount()).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1383
     * @tc.name    SettingsExtension1383
     * @tc.desc    Removing the only enabled entry drops the enabled count to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'spliceWlan_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().splice(0, 1);
      expect(model.getItemCount()).assertEqual(3);
      expect(model.getEnabledCount()).assertEqual(0);
      expect(model.isEnabled('wlan')).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1384
     * @tc.name    SettingsExtension1384
     * @tc.desc    Clearing every entry empties all counters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clearEntries_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      const entries: SettingsEntry[] = model.getEntries();
      entries.splice(0, entries.length);
      expect(model.getItemCount()).assertEqual(0);
      expect(model.getToggleCount()).assertEqual(0);
      expect(model.getEnabledCount()).assertEqual(0);
      expect(model.hasUniqueKeys()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1385
     * @tc.name    SettingsExtension1385
     * @tc.desc    Toggling and lookup fail after clearing every entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clearToggle_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      const entries: SettingsEntry[] = model.getEntries();
      entries.splice(0, entries.length);
      expect(model.toggle('wlan')).assertFalse();
      expect(model.getEntry('wlan') === undefined).assertTrue();
      expect(model.isToggleRejected('wlan')).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1386
     * @tc.name    SettingsExtension1386
     * @tc.desc    Duplicating a title with a new key keeps keys unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'duplicateTitle_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().push({ key: 'wlan2', title: 'WLAN', hasToggle: true, enabled: false });
      expect(model.hasUniqueKeys()).assertTrue();
      expect(model.getEntry('wlan2') !== undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1387
     * @tc.name    SettingsExtension1387
     * @tc.desc    Direct flag edits drive the enabled count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'directFlagEdit_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries()[0].enabled = false;
      model.getEntries()[1].enabled = true;
      expect(model.getEnabledCount()).assertEqual(1);
      expect(model.isEnabled('bluetooth')).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1388
     * @tc.name    SettingsExtension1388
     * @tc.desc    Appending a disabled switch leaves the enabled count unchanged
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'appendDisabled_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().push({ key: 'nfc', title: 'NFC', hasToggle: true, enabled: false });
      expect(model.getToggleCount()).assertEqual(4);
      expect(model.getEnabledCount()).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1389
     * @tc.name    SettingsExtension1389
     * @tc.desc    Toggling an entry without a switch is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleNoSwitchRejected_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.toggle('moreConnections')).assertFalse();
      expect(model.isEnabled('moreConnections')).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1390
     * @tc.name    SettingsExtension1390
     * @tc.desc    Toggling an empty key is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleEmptyKeyRejected_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.toggle('')).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1391
     * @tc.name    SettingsExtension1391
     * @tc.desc    An entry with a switch is not a rejected toggle target
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isToggleRejectedHasSwitch_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isToggleRejected('bluetooth')).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1392
     * @tc.name    SettingsExtension1392
     * @tc.desc    Enabling every entry raises the enabled count to four
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'enableAllFour_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().forEach((entry: SettingsEntry) => {
        entry.enabled = true;
      });
      expect(model.getEnabledCount()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1393
     * @tc.name    SettingsExtension1393
     * @tc.desc    An enabled entry without a switch raises only the enabled count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'appendEnabledNoToggle_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().push({ key: 'extra', title: 'Extra', hasToggle: false, enabled: true });
      expect(model.getEnabledCount()).assertEqual(2);
      expect(model.getToggleCount()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1394
     * @tc.name    SettingsExtension1394
     * @tc.desc    Appending a duplicate key breaks key uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'duplicateKeyAppend_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().push({ key: 'wlan', title: 'Dup', hasToggle: false, enabled: false });
      expect(model.hasUniqueKeys()).assertFalse();
      expect(model.getItemCount()).assertEqual(SETTINGS_ITEM_COUNT + 1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1395
     * @tc.name    SettingsExtension1395
     * @tc.desc    Navbar width of a negative five vp window is minus two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navbarNegativeFive_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(-5)).assertEqual(-2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1396
     * @tc.name    SettingsExtension1396
     * @tc.desc    Navbar width of a half vp window is exactly zero point two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navbarQuarter_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(0.5)).assertEqual(0.2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1397
     * @tc.name    SettingsExtension1397
     * @tc.desc    Split mode separates widths just above and just below six hundred
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'splitJustAbove_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(600.0001)).assertTrue();
      expect(model.isSplitMode(599.9999)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1398
     * @tc.name    SettingsExtension1398
     * @tc.desc    Enabled check reports false for empty and missing keys
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'enabledMissing_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isEnabled('')).assertFalse();
      expect(model.isEnabled('missing')).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1399
     * @tc.name    SettingsExtension1399
     * @tc.desc    Popping the non switch entry leaves three toggles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleCountAfterPop_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      model.getEntries().pop();
      expect(model.getItemCount()).assertEqual(3);
      expect(model.getToggleCount()).assertEqual(3);
      expect(model.getEntry('moreConnections') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1400
     * @tc.name    SettingsExtension1400
     * @tc.desc    Directly enabling Bluetooth raises the enabled count to two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'directEnableBluetooth_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      const bluetooth: SettingsEntry | undefined = model.getEntry('bluetooth');
      expect(bluetooth !== undefined).assertTrue();
      (bluetooth as SettingsEntry).enabled = true;
      expect(model.isEnabled('bluetooth')).assertTrue();
      expect(model.getEnabledCount()).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1401
     * @tc.name    SettingsExtension1401
     * @tc.desc    Toggling mobile data on raises the enabled count to two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'toggleMobileDataOn_001', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.toggle('mobileData')).assertTrue();
      expect(model.isEnabled('mobileData')).assertTrue();
      expect(model.getEnabledCount()).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1402
     * @tc.name    SettingsExtension1402
     * @tc.desc    Sample average of one value and exact division stay exact
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'averageOfSingle_001', 0, () => {
      expect(averageOf([42])).assertEqual(42);
      expect(safeDivide(9, 3)).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1403
     * @tc.name    SettingsExtension1403
     * @tc.desc    Sample range of repeated values is zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'rangeOfRepeated_001', 0, () => {
      expect(rangeOf([5, 5, 5])).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1404
     * @tc.name    SettingsExtension1404
     * @tc.desc    Navbar width of 5 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav00', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(5)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1405
     * @tc.name    SettingsExtension1405
     * @tc.desc    Navbar width of 10 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav01', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(10)).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1406
     * @tc.name    SettingsExtension1406
     * @tc.desc    Navbar width of 15 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav02', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(15)).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1407
     * @tc.name    SettingsExtension1407
     * @tc.desc    Navbar width of 20 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav03', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(20)).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1408
     * @tc.name    SettingsExtension1408
     * @tc.desc    Navbar width of 25 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav04', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(25)).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1409
     * @tc.name    SettingsExtension1409
     * @tc.desc    Navbar width of 30 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav05', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(30)).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1410
     * @tc.name    SettingsExtension1410
     * @tc.desc    Navbar width of 40 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav06', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(40)).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1411
     * @tc.name    SettingsExtension1411
     * @tc.desc    Navbar width of 45 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav07', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(45)).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1412
     * @tc.name    SettingsExtension1412
     * @tc.desc    Navbar width of 50 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav08', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(50)).assertEqual(20);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1413
     * @tc.name    SettingsExtension1413
     * @tc.desc    Navbar width of 55 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav09', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(55)).assertEqual(22);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1414
     * @tc.name    SettingsExtension1414
     * @tc.desc    Navbar width of 60 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav10', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(60)).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1415
     * @tc.name    SettingsExtension1415
     * @tc.desc    Navbar width of 65 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav11', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(65)).assertEqual(26);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1416
     * @tc.name    SettingsExtension1416
     * @tc.desc    Navbar width of 70 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav12', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(70)).assertEqual(28);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1417
     * @tc.name    SettingsExtension1417
     * @tc.desc    Navbar width of 75 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav13', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(75)).assertEqual(30);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1418
     * @tc.name    SettingsExtension1418
     * @tc.desc    Navbar width of 80 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav14', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(80)).assertEqual(32);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1419
     * @tc.name    SettingsExtension1419
     * @tc.desc    Navbar width of 85 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav15', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(85)).assertEqual(34);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1420
     * @tc.name    SettingsExtension1420
     * @tc.desc    Navbar width of 90 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav16', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(90)).assertEqual(36);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1421
     * @tc.name    SettingsExtension1421
     * @tc.desc    Navbar width of 95 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav17', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(95)).assertEqual(38);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1422
     * @tc.name    SettingsExtension1422
     * @tc.desc    Navbar width of 100 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav18', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(100)).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1423
     * @tc.name    SettingsExtension1423
     * @tc.desc    Navbar width of 105 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav19', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(105)).assertEqual(42);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1424
     * @tc.name    SettingsExtension1424
     * @tc.desc    Navbar width of 110 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav20', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(110)).assertEqual(44);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1425
     * @tc.name    SettingsExtension1425
     * @tc.desc    Navbar width of 115 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav21', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(115)).assertEqual(46);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1426
     * @tc.name    SettingsExtension1426
     * @tc.desc    Navbar width of 120 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav22', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(120)).assertEqual(48);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1427
     * @tc.name    SettingsExtension1427
     * @tc.desc    Navbar width of 125 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav23', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(125)).assertEqual(50);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1428
     * @tc.name    SettingsExtension1428
     * @tc.desc    Navbar width of 130 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav24', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(130)).assertEqual(52);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1429
     * @tc.name    SettingsExtension1429
     * @tc.desc    Navbar width of 135 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav25', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(135)).assertEqual(54);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1430
     * @tc.name    SettingsExtension1430
     * @tc.desc    Navbar width of 140 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav26', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(140)).assertEqual(56);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1431
     * @tc.name    SettingsExtension1431
     * @tc.desc    Navbar width of 145 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav27', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(145)).assertEqual(58);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1432
     * @tc.name    SettingsExtension1432
     * @tc.desc    Navbar width of 150 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav28', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(150)).assertEqual(60);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1433
     * @tc.name    SettingsExtension1433
     * @tc.desc    Navbar width of 160 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav29', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(160)).assertEqual(64);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1434
     * @tc.name    SettingsExtension1434
     * @tc.desc    Navbar width of 175 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav30', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(175)).assertEqual(70);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1435
     * @tc.name    SettingsExtension1435
     * @tc.desc    Navbar width of 200 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav31', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(200)).assertEqual(80);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1436
     * @tc.name    SettingsExtension1436
     * @tc.desc    Navbar width of 225 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav32', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(225)).assertEqual(90);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1437
     * @tc.name    SettingsExtension1437
     * @tc.desc    Navbar width of 250 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav33', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(250)).assertEqual(100);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1438
     * @tc.name    SettingsExtension1438
     * @tc.desc    Navbar width of 275 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav34', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(275)).assertEqual(110);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1439
     * @tc.name    SettingsExtension1439
     * @tc.desc    Navbar width of 300 vp keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nav35', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(300)).assertEqual(120);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1440
     * @tc.name    SettingsExtension1440
     * @tc.desc    Fractional navbar width 1.25 keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5navf01', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(1.25)).assertEqual(0.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1441
     * @tc.name    SettingsExtension1441
     * @tc.desc    Fractional navbar width 3.75 keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5navf03', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(3.75)).assertEqual(1.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1442
     * @tc.name    SettingsExtension1442
     * @tc.desc    Fractional navbar width 0.25 keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5navf04', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(0.25)).assertEqual(0.1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1443
     * @tc.name    SettingsExtension1443
     * @tc.desc    Fractional navbar width -0.5 keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5navf05', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(-0.5)).assertEqual(-0.2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1444
     * @tc.name    SettingsExtension1444
     * @tc.desc    Fractional navbar width -12.5 keeps the ratio value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5navf07', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.navbarWidth(-12.5)).assertEqual(-5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1445
     * @tc.name    SettingsExtension1445
     * @tc.desc    Split mode at 0 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split00', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(0)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1446
     * @tc.name    SettingsExtension1446
     * @tc.desc    Split mode at 1 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split01', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(1)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1447
     * @tc.name    SettingsExtension1447
     * @tc.desc    Split mode at 99 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split02', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(99)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1448
     * @tc.name    SettingsExtension1448
     * @tc.desc    Split mode at 300 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split03', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(300)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1449
     * @tc.name    SettingsExtension1449
     * @tc.desc    Split mode at 500 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split04', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(500)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1450
     * @tc.name    SettingsExtension1450
     * @tc.desc    Split mode at 599 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split05', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(599)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1451
     * @tc.name    SettingsExtension1451
     * @tc.desc    Split mode at 599.5 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split06', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(599.5)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1452
     * @tc.name    SettingsExtension1452
     * @tc.desc    Split mode at 599.9 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split07', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(599.9)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1453
     * @tc.name    SettingsExtension1453
     * @tc.desc    Split mode at 599.99 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split08', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(599.99)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1454
     * @tc.name    SettingsExtension1454
     * @tc.desc    Split mode at 599.999 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split09', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(599.999)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1455
     * @tc.name    SettingsExtension1455
     * @tc.desc    Split mode at 600 returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split10', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(600)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1456
     * @tc.name    SettingsExtension1456
     * @tc.desc    Split mode at 600.001 returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split11', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(600.001)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1457
     * @tc.name    SettingsExtension1457
     * @tc.desc    Split mode at 600.01 returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split12', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(600.01)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1458
     * @tc.name    SettingsExtension1458
     * @tc.desc    Split mode at 600.1 returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split13', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(600.1)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1459
     * @tc.name    SettingsExtension1459
     * @tc.desc    Split mode at 601 returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split14', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(601)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1460
     * @tc.name    SettingsExtension1460
     * @tc.desc    Split mode at 700 returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split15', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(700)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1461
     * @tc.name    SettingsExtension1461
     * @tc.desc    Split mode at 800 returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split16', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(800)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1462
     * @tc.name    SettingsExtension1462
     * @tc.desc    Split mode at 1000 returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split17', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(1000)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1463
     * @tc.name    SettingsExtension1463
     * @tc.desc    Split mode at 2000 returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split18', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(2000)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1464
     * @tc.name    SettingsExtension1464
     * @tc.desc    Split mode at -1 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split19', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(-1)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1465
     * @tc.name    SettingsExtension1465
     * @tc.desc    Split mode at -600 returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5split20', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.isSplitMode(-600)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1466
     * @tc.name    SettingsExtension1466
     * @tc.desc    Toggling wlan flips its switch state
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tg0', 0, () => {
      const model: SettingsModel = new SettingsModel();
      const before: boolean = model.isEnabled('wlan');
      expect(model.toggle('wlan')).assertTrue();
      expect(model.isEnabled('wlan')).assertEqual(!before);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1467
     * @tc.name    SettingsExtension1467
     * @tc.desc    Toggling bluetooth flips its switch state
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tg1', 0, () => {
      const model: SettingsModel = new SettingsModel();
      const before: boolean = model.isEnabled('bluetooth');
      expect(model.toggle('bluetooth')).assertTrue();
      expect(model.isEnabled('bluetooth')).assertEqual(!before);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1468
     * @tc.name    SettingsExtension1468
     * @tc.desc    Toggling mobileData flips its switch state
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tg2', 0, () => {
      const model: SettingsModel = new SettingsModel();
      const before: boolean = model.isEnabled('mobileData');
      expect(model.toggle('mobileData')).assertTrue();
      expect(model.isEnabled('mobileData')).assertEqual(!before);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1469
     * @tc.name    SettingsExtension1469
     * @tc.desc    Toggling the non switch key 1 is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tgrej0', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.toggle('moreConnections')).assertFalse();
      expect(model.getItemCount()).assertEqual(SETTINGS_ITEM_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1470
     * @tc.name    SettingsExtension1470
     * @tc.desc    Toggling the non switch key 2 is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tgrej1', 0, () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.toggle('')).assertFalse();
      expect(model.getItemCount()).assertEqual(SETTINGS_ITEM_COUNT);
    })
