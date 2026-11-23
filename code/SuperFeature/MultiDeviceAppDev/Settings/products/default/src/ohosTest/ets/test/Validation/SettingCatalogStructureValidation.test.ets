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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import {
  SettingsCatalogModel,
  SETTINGS_GROUP_KEYS,
  SETTINGS_GROUP_SIZES,
  SETTINGS_CONNECTIONS_ITEMS,
  SETTINGS_SECURITY_ITEMS,
  SETTINGS_SYSTEM_ITEMS,
  SETTINGS_WIFI_NAMES,
  SETTINGS_WIFI_SUMMARIES,
  SETTINGS_WIFI_SIGNALS,
  SETTINGS_WIFI_SECURED,
  SETTINGS_WIFI_CONNECTED
} from '../Shared/SettingsCatalogModel';

const DATASET = 'SettingCatalogStructureValidation';
const DOMAIN: number = 0xF813;
const TAG: string = '[SettingCatalogStructure]';

export default function settingCatalogStructureValidationSuite() {
  describe('SettingCatalogStructureValidation', () => {
    let m: SettingsCatalogModel = new SettingsCatalogModel();

    beforeEach(() => {
      m = new SettingsCatalogModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1540
     * @tc.name    SettingCatalogStructureValidation1
     * @tc.desc    settings list ships five groups
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupCount()).assertEqual(5);
      expect(m.groupCount()).assertEqual(SETTINGS_GROUP_KEYS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1541
     * @tc.name    SettingCatalogStructureValidation2
     * @tc.desc    group sizes match the shipped layout
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupSize(0)).assertEqual(4);
      expect(m.groupSize(1)).assertEqual(1);
      expect(m.groupSize(2)).assertEqual(1);
      expect(m.groupSize(3)).assertEqual(5);
      expect(m.groupSize(4)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1542
     * @tc.name    SettingCatalogStructureValidation3
     * @tc.desc    group sizes match the declared table
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let trace: string = '';
      for (let i = 0; i < SETTINGS_GROUP_SIZES.length; i++) {
        trace += String(m.groupSize(i)) + ',';
      }
      expect(trace).assertEqual('4,1,1,5,3,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1543
     * @tc.name    SettingCatalogStructureValidation4
     * @tc.desc    group keys keep the declared order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let trace: string = '';
      const keys: string[] = m.groupKeys();
      for (let i = 0; i < keys.length; i++) {
        trace += keys[i] + ',';
      }
      expect(trace).assertEqual('connections,display,sound,security,system,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1544
     * @tc.name    SettingCatalogStructureValidation5
     * @tc.desc    group size lookup past the tail reports minus one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupSize(5)).assertEqual(-1);
      expect(m.groupSize(-1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1545
     * @tc.name    SettingCatalogStructureValidation6
     * @tc.desc    items of the first group keep their order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const items: string[] = m.itemsOf(0);
      let trace: string = '';
      for (let i = 0; i < items.length; i++) {
        trace += items[i] + ',';
      }
      expect(trace).assertEqual('wlan,bluetooth,mobileData,moreConnections,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1546
     * @tc.name    SettingCatalogStructureValidation7
     * @tc.desc    items of the security group keep their order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.itemsOf(3).length).assertEqual(5);
      expect(m.itemsOf(3)[0]).assertEqual('biometricsPassword');
      expect(m.itemsOf(3)[4]).assertEqual('privacy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1547
     * @tc.name    SettingCatalogStructureValidation8
     * @tc.desc    items of the system group keep their order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.itemsOf(4).length).assertEqual(3);
      expect(m.itemsOf(4)[0]).assertEqual('usersAccounts');
      expect(m.itemsOf(4)[2]).assertEqual('aboutDevice');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1548
     * @tc.name    SettingCatalogStructureValidation9
     * @tc.desc    items lookup past the tail returns an empty list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.itemsOf(5).length).assertEqual(0);
      expect(m.itemsOf(-1).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1549
     * @tc.name    SettingCatalogStructureValidation10
     * @tc.desc    largest group is the security block
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.largestGroupIndex()).assertEqual(3);
      expect(m.groupSize(m.largestGroupIndex())).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1550
     * @tc.name    SettingCatalogStructureValidation11
     * @tc.desc    smallest groups are the single row blocks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.smallestGroupIndex() === 1 || m.smallestGroupIndex() === 2).assertTrue();
      expect(m.groupSize(m.smallestGroupIndex())).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1551
     * @tc.name    SettingCatalogStructureValidation12
     * @tc.desc    two groups hold a single entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupsWithSize(1)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1552
     * @tc.name    SettingCatalogStructureValidation13
     * @tc.desc    one group holds four entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups13', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupsWithSize(4)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1553
     * @tc.name    SettingCatalogStructureValidation14
     * @tc.desc    no group holds nine entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups14', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupsWithSize(9)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1554
     * @tc.name    SettingCatalogStructureValidation15
     * @tc.desc    group sizes add up to the item count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'groups15', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum: number = 0;
      for (let i = 0; i < m.groupCount(); i++) {
        sum += m.groupSize(i);
      }
      expect(sum).assertEqual(m.itemCount());
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1555
     * @tc.name    SettingCatalogStructureValidation16
     * @tc.desc    settings list ships fourteen entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.itemCount()).assertEqual(14);
      expect(m.itemCount() > m.groupCount()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1556
     * @tc.name    SettingCatalogStructureValidation17
     * @tc.desc    first flattened entry is the wlan row
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.globalItemAt(0)).assertEqual('wlan');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1557
     * @tc.name    SettingCatalogStructureValidation18
     * @tc.desc    flattened position four starts the display block
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.globalItemAt(4)).assertEqual('brightness');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1558
     * @tc.name    SettingCatalogStructureValidation19
     * @tc.desc    flattened position five is the volume row
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.globalItemAt(5)).assertEqual('volume');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1559
     * @tc.name    SettingCatalogStructureValidation20
     * @tc.desc    flattened position six starts the security block
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.globalItemAt(6)).assertEqual('biometricsPassword');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1560
     * @tc.name    SettingCatalogStructureValidation21
     * @tc.desc    flattened position eleven starts the system block
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.globalItemAt(11)).assertEqual('usersAccounts');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1561
     * @tc.name    SettingCatalogStructureValidation22
     * @tc.desc    last flattened entry is the about row
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.globalItemAt(13)).assertEqual('aboutDevice');
      expect(m.globalItemAt(m.itemCount() - 1)).assertEqual('aboutDevice');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1562
     * @tc.name    SettingCatalogStructureValidation23
     * @tc.desc    flattened lookup past the tail is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.globalItemAt(14)).assertEqual('');
      expect(m.globalItemAt(999)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1563
     * @tc.name    SettingCatalogStructureValidation24
     * @tc.desc    flattened lookup before the head is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.globalItemAt(-1)).assertEqual('');
      expect(m.globalItemAt(-14)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1564
     * @tc.name    SettingCatalogStructureValidation25
     * @tc.desc    flattened positions follow the group boundaries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let trace: string = '';
      const boundaries: number[] = [0, 4, 5, 6, 11];
      for (let i = 0; i < boundaries.length; i++) {
        trace += m.globalItemAt(boundaries[i]) + ',';
      }
      expect(trace).assertEqual('wlan,brightness,volume,biometricsPassword,usersAccounts,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1565
     * @tc.name    SettingCatalogStructureValidation26
     * @tc.desc    every entry key is unique across groups
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueItems()).assertTrue();
      expect(m.itemCount()).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1566
     * @tc.name    SettingCatalogStructureValidation27
     * @tc.desc    wlan entry is present exactly once
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.containsItem('wlan')).assertTrue();
      let hits: number = 0;
      for (let i = 0; i < m.itemCount(); i++) {
        if (m.globalItemAt(i) === 'wlan') {
          hits++;
        }
      }
      expect(hits).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1567
     * @tc.name    SettingCatalogStructureValidation28
     * @tc.desc    nfc entry is presented on a nested page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items13', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.containsItem('nfc')).assertFalse();
      expect(m.containsItem('moreConnections')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1568
     * @tc.name    SettingCatalogStructureValidation29
     * @tc.desc    group lookup by key resolves the security block
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items14', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupIndexOfKey('security')).assertEqual(3);
      expect(m.groupSize(m.groupIndexOfKey('security'))).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1569
     * @tc.name    SettingCatalogStructureValidation30
     * @tc.desc    group lookup by unknown key reports minus one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items15', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupIndexOfKey('network')).assertEqual(-1);
      expect(m.groupIndexOfKey('')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1570
     * @tc.name    SettingCatalogStructureValidation31
     * @tc.desc    connections group closes with the nested entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items16', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(SETTINGS_CONNECTIONS_ITEMS[3]).assertEqual('moreConnections');
      expect(m.itemsOf(0)[3]).assertEqual('moreConnections');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1571
     * @tc.name    SettingCatalogStructureValidation32
     * @tc.desc    security group exposes five rows in order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items17', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(SETTINGS_SECURITY_ITEMS.length).assertEqual(5);
      expect(m.itemsOf(3)[1]).assertEqual('application');
      expect(m.itemsOf(3)[2]).assertEqual('storage');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1572
     * @tc.name    SettingCatalogStructureValidation33
     * @tc.desc    system group exposes three rows in order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'items18', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(SETTINGS_SYSTEM_ITEMS.length).assertEqual(3);
      expect(m.itemsOf(4)[1]).assertEqual('systemUpdate');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1573
     * @tc.name    SettingCatalogStructureValidation34
     * @tc.desc    prefix s finds three entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'search1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.search('s').length).assertEqual(3);
      expect(m.search('s')[0]).assertEqual('storage');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1574
     * @tc.name    SettingCatalogStructureValidation35
     * @tc.desc    prefix b finds three entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'search2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hits: string[] = m.search('b');
      expect(hits.length).assertEqual(3);
      expect(hits[0]).assertEqual('bluetooth');
      expect(hits[1]).assertEqual('brightness');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1575
     * @tc.name    SettingCatalogStructureValidation36
     * @tc.desc    prefix v finds the single volume row
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'search3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.search('v').length).assertEqual(1);
      expect(m.search('v')[0]).assertEqual('volume');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1576
     * @tc.name    SettingCatalogStructureValidation37
     * @tc.desc    empty prefix returns every entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'search4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.search('').length).assertEqual(m.itemCount());
      expect(m.search('').length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1577
     * @tc.name    SettingCatalogStructureValidation38
     * @tc.desc    unknown prefix returns no entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'search5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.search('zzz').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1578
     * @tc.name    SettingCatalogStructureValidation39
     * @tc.desc    prefix matching is anchored to the start
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'search6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.search('lan').length).assertEqual(0);
      expect(m.search('wlan').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1579
     * @tc.name    SettingCatalogStructureValidation40
     * @tc.desc    wlan page lists four networks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.wifiCount()).assertEqual(4);
      expect(m.wifiCount()).assertEqual(SETTINGS_WIFI_NAMES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1580
     * @tc.name    SettingCatalogStructureValidation41
     * @tc.desc    network names keep the shipped order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let trace: string = '';
      for (let i = 0; i < m.wifiCount(); i++) {
        trace += m.wifiNameAt(i) + ',';
      }
      expect(trace).assertEqual('UX,Huwe-yee,UX-5G,E1-AP,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1581
     * @tc.name    SettingCatalogStructureValidation42
     * @tc.desc    network summaries follow the shipped states
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let trace: string = '';
      for (let i = 0; i < m.wifiCount(); i++) {
        trace += m.wifiSummaryAt(i) + ',';
      }
      expect(trace).assertEqual('connected,encrypted,open,saveOpen,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1582
     * @tc.name    SettingCatalogStructureValidation43
     * @tc.desc    exactly one network is connected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.connectedWifiIndex()).assertEqual(0);
      expect(SETTINGS_WIFI_CONNECTED.filter((value: boolean) => value).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1583
     * @tc.name    SettingCatalogStructureValidation44
     * @tc.desc    connected network is UX
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.wifiNameAt(m.connectedWifiIndex())).assertEqual('UX');
      expect(m.wifiSummaryAt(m.connectedWifiIndex())).assertEqual('connected');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1584
     * @tc.name    SettingCatalogStructureValidation45
     * @tc.desc    exactly one network requires a password
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.securedWifiCount()).assertEqual(1);
      expect(SETTINGS_WIFI_SECURED[1]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1585
     * @tc.name    SettingCatalogStructureValidation46
     * @tc.desc    secured network is Huwe-yee
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.wifiNameAt(1)).assertEqual('Huwe-yee');
      expect(m.wifiSummaryAt(1)).assertEqual('encrypted');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1586
     * @tc.name    SettingCatalogStructureValidation47
     * @tc.desc    remaining three networks are open
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.openWifiCount()).assertEqual(3);
      expect(m.openWifiCount() + m.securedWifiCount()).assertEqual(m.wifiCount());
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1587
     * @tc.name    SettingCatalogStructureValidation48
     * @tc.desc    every network reports the strongest signal
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.strongestSignalCount()).assertEqual(4);
      expect(SETTINGS_WIFI_SIGNALS[0]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1588
     * @tc.name    SettingCatalogStructureValidation49
     * @tc.desc    network names are unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueWifiNames()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1589
     * @tc.name    SettingCatalogStructureValidation50
     * @tc.desc    network name lookup past the tail is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.wifiNameAt(4)).assertEqual('');
      expect(m.wifiNameAt(-1)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1590
     * @tc.name    SettingCatalogStructureValidation51
     * @tc.desc    network summary lookup past the tail is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.wifiSummaryAt(4)).assertEqual('');
      expect(m.wifiSummaryAt(-1)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1591
     * @tc.name    SettingCatalogStructureValidation52
     * @tc.desc    saved open network is E1-AP
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi13', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.wifiNameAt(3)).assertEqual('E1-AP');
      expect(m.wifiSummaryAt(3)).assertEqual('saveOpen');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1592
     * @tc.name    SettingCatalogStructureValidation53
     * @tc.desc    fifth generation band is open
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi14', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.wifiNameAt(2)).assertEqual('UX-5G');
      expect(m.wifiSummaryAt(2)).assertEqual('open');
      expect(SETTINGS_WIFI_SECURED[2]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1593
     * @tc.name    SettingCatalogStructureValidation54
     * @tc.desc    only the first network is connected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'wifi15', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(SETTINGS_WIFI_CONNECTED[0]).assertTrue();
      expect(SETTINGS_WIFI_CONNECTED[1] || SETTINGS_WIFI_CONNECTED[2] || SETTINGS_WIFI_CONNECTED[3]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1594
     * @tc.name    SettingCatalogStructureValidation55
     * @tc.desc    wlan toggle defaults to enabled
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'toggle1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.toggleDefault('wlan')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1595
     * @tc.name    SettingCatalogStructureValidation56
     * @tc.desc    nfc toggle keeps the component default
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'toggle2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.toggleDefault('nfc')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1596
     * @tc.name    SettingCatalogStructureValidation57
     * @tc.desc    bluetooth row has no explicit toggle
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'toggle3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.toggleDefault('bluetooth')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1597
     * @tc.name    SettingCatalogStructureValidation58
     * @tc.desc    unknown key never enables the toggle
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'toggle4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.toggleDefault('')).assertFalse();
      expect(m.toggleDefault('WLAN')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1598
     * @tc.name    SettingCatalogStructureValidation59
     * @tc.desc    only one settings toggle defaults on
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'toggle5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let enabled: number = 0;
      const keys: string[] = ['wlan', 'nfc', 'bluetooth', 'mobileData'];
      for (let i = 0; i < keys.length; i++) {
        if (m.toggleDefault(keys[i])) {
          enabled++;
        }
      }
      expect(enabled).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1599
     * @tc.name    SettingCatalogStructureValidation60
     * @tc.desc    catalog rebuild is deterministic
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const other: SettingsCatalogModel = new SettingsCatalogModel();
      expect(other.itemCount()).assertEqual(m.itemCount());
      expect(other.groupSize(3)).assertEqual(5);
      expect(other.search('b').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1600
     * @tc.name    SettingCatalogStructureValidation61
     * @tc.desc    item catalog is larger than the wlan catalog
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.itemCount()).assertEqual(14);
      expect(m.wifiCount()).assertEqual(4);
      expect(m.itemCount() > m.wifiCount() * 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1601
     * @tc.name    SettingCatalogStructureValidation62
     * @tc.desc    security block alone holds five entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupSize(3)).assertEqual(5);
      expect(m.groupSize(3) > m.groupSize(0) - 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1602
     * @tc.name    SettingCatalogStructureValidation63
     * @tc.desc    flattened order ends at the about row after three system rows
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'combined4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.globalItemAt(11)).assertEqual('usersAccounts');
      expect(m.globalItemAt(12)).assertEqual('systemUpdate');
      expect(m.globalItemAt(13)).assertEqual('aboutDevice');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })
  })
}
