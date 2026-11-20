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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import type { common } from '@kit.AbilityKit';
import type { resourceManager } from '@kit.LocalizationKit';
import { Device, CommonConstants } from '@ohos/common';
import TabsConfig from '@ohos/nearbydevice/src/main/ets/model/TabsConfig';
import StringUtil from '@ohos/nearbydevice/src/main/ets/util/StringUtil';
import { getImageFromDevice } from '@ohos/nearbydevice/src/main/ets/util/CommonUtil';
import { parseProfileServices } from '@ohos/nearbydevice/src/main/ets/util/ThingModelParser';
import type {
  CharacteristicsDto,
  EnumEntryDto,
  ServiceDto
} from '@ohos/nearbydevice/src/main/ets/view/profileview/ThingModelDto';
import {
  CharacteristicMethod,
  CharacteristicPermissions,
  CharacteristicType
} from '@ohos/nearbydevice/src/main/ets/view/profileview/ViewModel';
import PreferenceConstants from '@ohos/nearbydevice/src/main/ets/constants/PreferenceConstants';
import OpenValleyConstants from '@ohos/nearbydevice/src/main/ets/model/ble/openvalley/OpenValleyConstants';
import HomeTabsConfig from '../../../../main/ets/common/constants/TabsConfig';

// 首页与附近设备模块的中文文案，用于校验资源表接线是否正确
const HOME_NEARBY_TITLE: string = '附近设备';
const HOME_MINE_TITLE: string = '我的';
const NEARBY_TAB_MAIN: string = '附近设备';
const NEARBY_TAB_SCAN: string = '可连接设备(ble本地控)';
const NEARBY_TAB_WIFI: string = '局域网本地控';

// 应用主模块（tv）的资源管理器，测试模块自己的资源表里没有这些字符串
function appResourceManager(): resourceManager.ResourceManager {
  const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  try {
    return context.createModuleContext('tv').resourceManager;
  } catch (err) {
    return context.createModuleContext('entry').resourceManager;
  }
}

function textByName(name: string): string {
  return appResourceManager().getStringByNameSync(name);
}

// 构造物模型 DTO，供 parseProfileServices 相关用例使用
function buildCharacteristic(name: string, withEnum: boolean): CharacteristicsDto {
  const enumList: EnumEntryDto[] = [
    { descCh: '低', descEn: 'low', enumVal: 0 },
    { descCh: '高', descEn: 'high', enumVal: 100 }
  ];
  const characteristic: CharacteristicsDto = {
    characteristicName: name,
    characteristicType: CharacteristicType.INT,
    description: name + ' desc',
    method: CharacteristicMethod.READ,
    permission: CharacteristicPermissions.GET,
    attrName: name,
    attrNameEn: name,
    ecaFlag: '1',
    enumList: withEnum ? enumList : undefined
  };
  return characteristic;
}

function buildService(id: string, characteristics: CharacteristicsDto[]): ServiceDto {
  const service: ServiceDto = {
    serviceId: id,
    serviceType: 'svc',
    serviceName: '服务' + id,
    serviceNameEn: 'service ' + id,
    description: 'desc',
    characteristics: characteristics
  };
  return service;
}

export default function nearbyDeviceTest(): void {
  describe('NearbyDeviceTest', () => {
    beforeAll(() => {
      console.info('[Suite] NearbyDeviceTest start');
    });

    afterAll(() => {
      console.info('[Suite] NearbyDeviceTest end');
    });

    it('home_tab_nearby_entry_uses_nearby_text', 0, () => {
      expect(
        HomeTabsConfig.tabItems[0].index
      ).assertEqual(
        0
      );
      expect(
        textByName('tab_scan')
      ).assertEqual(
        HOME_NEARBY_TITLE
      );
    });

    it('home_tab_mine_entry_uses_mine_text', 0, () => {
      expect(
        HomeTabsConfig.tabItems[1].index
      ).assertEqual(
        1
      );
      expect(
        textByName('tab_personal')
      ).assertEqual(
        HOME_MINE_TITLE
      );
    });

    it('nearby_tab_count_is_three', 0, () => {
      expect(
        TabsConfig.tabItems.length
      ).assertEqual(
        3
      );
    });

    it('nearby_tab_indexes_are_continuous', 0, () => {
      for (let i = 0; i < TabsConfig.tabItems.length; i++) {
        expect(
          TabsConfig.tabItems[i].index
        ).assertEqual(
          i
        );
      }
    });

    it('nearby_tab_first_title_is_nearby_devices', 0, () => {
      expect(
        textByName('devices_main')
      ).assertEqual(
        NEARBY_TAB_MAIN
      );
    });

    it('nearby_tab_second_title_is_ble_scan', 0, () => {
      expect(
        textByName('devices_scan')
      ).assertEqual(
        NEARBY_TAB_SCAN
      );
    });

    it('nearby_tab_third_title_is_wifi', 0, () => {
      expect(
        textByName('devices_wifi')
      ).assertEqual(
        NEARBY_TAB_WIFI
      );
    });

    it('nearby_tab_titles_are_distinct', 0, () => {
      const ids: number[] = [];
      for (let i = 0; i < TabsConfig.tabItems.length; i++) {
        ids.push(TabsConfig.tabItems[i].title.id);
      }
      expect(
        ids.length
      ).assertEqual(
        new Set<number>(ids).size
      );
    });

    it('nearby_tab_indexes_are_unique', 0, () => {
      const indexes: number[] = [];
      for (let i = 0; i < TabsConfig.tabItems.length; i++) {
        indexes.push(TabsConfig.tabItems[i].index);
      }
      expect(
        indexes.length
      ).assertEqual(
        new Set<number>(indexes).size
      );
    });

    it('replace_all_replaces_single_occurrence', 0, () => {
      expect(
        StringUtil.replaceAll('a-b', '-', '_')
      ).assertEqual(
        'a_b'
      );
    });

    it('replace_all_replaces_all_occurrences', 0, () => {
      expect(
        StringUtil.replaceAll('a-b-c', '-', '_')
      ).assertEqual(
        'a_b_c'
      );
    });

    it('replace_all_keeps_string_when_no_match', 0, () => {
      expect(
        StringUtil.replaceAll('abc', 'x', 'y')
      ).assertEqual(
        'abc'
      );
    });

    it('replace_all_supports_multi_character_search', 0, () => {
      expect(
        StringUtil.replaceAll('hello world', 'world', 'ohos')
      ).assertEqual(
        'hello ohos'
      );
    });

    it('replace_all_supports_empty_replacement', 0, () => {
      expect(
        StringUtil.replaceAll('a-b', '-', '')
      ).assertEqual(
        'ab'
      );
    });

    it('replace_all_is_case_sensitive', 0, () => {
      expect(
        StringUtil.replaceAll('a-A', 'a', 'x')
      ).assertEqual(
        'x-A'
      );
    });

    it('replace_all_supports_chinese_text', 0, () => {
      expect(
        StringUtil.replaceAll('设备-设备', '-', '/')
      ).assertEqual(
        '设备/设备'
      );
    });

    it('is_empty_true_for_empty_string', 0, () => {
      expect(
        StringUtil.isEmpty('')
      ).assertTrue();
    });

    it('is_empty_true_for_blank_space', 0, () => {
      expect(
        StringUtil.isEmpty('   ')
      ).assertTrue();
    });

    it('is_empty_true_for_tab', 0, () => {
      expect(
        StringUtil.isEmpty('	')
      ).assertTrue();
    });

    it('is_empty_true_for_newline', 0, () => {
      expect(
        StringUtil.isEmpty('\n')
      ).assertTrue();
    });

    it('is_empty_false_for_normal_text', 0, () => {
      expect(
        StringUtil.isEmpty('ohos')
      ).assertFalse();
    });

    it('is_empty_false_for_padded_text', 0, () => {
      expect(
        StringUtil.isEmpty('  ohos  ')
      ).assertFalse();
    });

    it('is_empty_true_for_undefined', 0, () => {
      expect(
        StringUtil.isEmpty(undefined)
      ).assertTrue();
    });

    it('is_empty_true_for_null', 0, () => {
      expect(
        StringUtil.isEmpty(null)
      ).assertTrue();
    });

    it('device_image_defaults_when_no_icons', 0, () => {
      const device: Device = new Device();
      expect(
        getImageFromDevice(device)
      ).assertEqual(
        CommonConstants.DEFAULT_DEVICE_ICON
      );
    });

    it('device_image_defaults_when_only_one_icon', 0, () => {
      const device: Device = new Device();
      device.deviceIcons = ['file://bundle/only.png'];
      expect(
        getImageFromDevice(device)
      ).assertEqual(
        CommonConstants.DEFAULT_DEVICE_ICON
      );
    });

    it('device_image_defaults_when_second_icon_empty', 0, () => {
      const device: Device = new Device();
      device.deviceIcons = ['file://bundle/first.png', ''];
      expect(
        getImageFromDevice(device)
      ).assertEqual(
        CommonConstants.DEFAULT_DEVICE_ICON
      );
    });

    it('device_image_defaults_when_second_icon_blank', 0, () => {
      const device: Device = new Device();
      device.deviceIcons = ['file://bundle/first.png', '   '];
      expect(
        getImageFromDevice(device)
      ).assertEqual(
        CommonConstants.DEFAULT_DEVICE_ICON
      );
    });

    it('device_image_returns_second_icon', 0, () => {
      const device: Device = new Device();
      device.deviceIcons = ['file://bundle/first.png', 'file://bundle/second.png'];
      expect(
        getImageFromDevice(device)
      ).assertEqual(
        'file://bundle/second.png'
      );
    });

    it('device_image_uses_second_of_three_icons', 0, () => {
      const device: Device = new Device();
      device.deviceIcons = ['file://bundle/a.png', 'file://bundle/b.png', 'file://bundle/c.png'];
      expect(
        getImageFromDevice(device)
      ).assertEqual(
        'file://bundle/b.png'
      );
    });

    it('preference_constants_are_stable', 0, () => {
      expect(
        PreferenceConstants.KEY_NAME
      ).assertEqual(
        'IpDevices'
      );
      expect(
        PreferenceConstants.PREFERENCES_NAME
      ).assertEqual(
        'IpStore'
      );
      expect(
        PreferenceConstants.PREFERENCE_IP_ARRAY_KEY
      ).assertEqual(
        'IdArr'
      );
      expect(
        PreferenceConstants.DURATION
      ).assertEqual(
        3000
      );
    });

    it('openvalley_name_prefix_and_timeout', 0, () => {
      expect(
        OpenValleyConstants.NAME_PREFIX
      ).assertEqual(
        'ccBle-'
      );
      expect(
        OpenValleyConstants.BLE_CONNECT_TIMEOUT
      ).assertEqual(
        10000
      );
    });

    it('openvalley_mtu_and_split_count', 0, () => {
      expect(
        OpenValleyConstants.DEFAULT_MTU
      ).assertEqual(
        244
      );
      expect(
        OpenValleyConstants.DEFAULT_WRITE_DATA_SPLIT_COUNT
      ).assertEqual(
        240
      );
    });

    it('openvalley_uuids_are_uppercase', 0, () => {
      const uuids: string[] = [
        OpenValleyConstants.UUID_SERVICE,
        OpenValleyConstants.UUID_CHARACTERISTIC_INDICATE,
        OpenValleyConstants.UUID_CHARACTERISTIC_INDICATE_DESCRIPTOR,
        OpenValleyConstants.UUID_CHARACTERISTIC_WRITE
      ];
      for (let i = 0; i < uuids.length; i++) {
        expect(
          uuids[i] === uuids[i].toUpperCase()
        ).assertTrue();
      }
    });

    it('parse_profile_services_empty_input', 0, () => {
      expect(
        parseProfileServices([]).length
      ).assertEqual(
        0
      );
    });

    it('parse_profile_service_fields', 0, () => {
      const services = parseProfileServices([buildService('svc-1', [buildCharacteristic('brightness', true)])]);
      expect(
        services.length
      ).assertEqual(
        1
      );
      expect(
        services[0].serviceId
      ).assertEqual(
        'svc-1'
      );
      expect(
        services[0].serviceName
      ).assertEqual(
        '服务svc-1'
      );
      expect(
        services[0].serviceNameEn
      ).assertEqual(
        'service svc-1'
      );
      expect(
        services[0].description
      ).assertEqual(
        'desc'
      );
    });

    it('parse_profile_service_characteristic_count', 0, () => {
      const services = parseProfileServices([
        buildService('svc-1', [buildCharacteristic('brightness', true), buildCharacteristic('switch', false)])
      ]);
      expect(
        services[0].characteristics.length
      ).assertEqual(
        2
      );
    });

    it('parse_profile_characteristic_fields', 0, () => {
      const services = parseProfileServices([buildService('svc-1', [buildCharacteristic('brightness', true)])]);
      const characteristic = services[0].characteristics[0];
      expect(
        characteristic.characteristicName
      ).assertEqual(
        'brightness'
      );
      expect(
        characteristic.characteristicType
      ).assertEqual(
        CharacteristicType.INT
      );
      expect(
        characteristic.method
      ).assertEqual(
        CharacteristicMethod.READ
      );
      expect(
        characteristic.permission
      ).assertEqual(
        CharacteristicPermissions.GET
      );
      expect(
        characteristic.attrName
      ).assertEqual(
        'brightness'
      );
      expect(
        characteristic.ecaFlag
      ).assertEqual(
        '1'
      );
    });

    it('parse_profile_enum_list_entries', 0, () => {
      const services = parseProfileServices([buildService('svc-1', [buildCharacteristic('brightness', true)])]);
      const enumList = services[0].characteristics[0].enumList;
      expect(
        enumList?.length
      ).assertEqual(
        2
      );
      expect(
        enumList?.[0].descCh
      ).assertEqual(
        '低'
      );
      expect(
        enumList?.[0].enumVal
      ).assertEqual(
        0
      );
      expect(
        enumList?.[1].descEn
      ).assertEqual(
        'high'
      );
      expect(
        enumList?.[1].enumVal
      ).assertEqual(
        100
      );
    });

    it('parse_profile_characteristic_without_enum_list', 0, () => {
      const services = parseProfileServices([buildService('svc-1', [buildCharacteristic('switch', false)])]);
      expect(
        services[0].characteristics[0].enumList === undefined
      ).assertTrue();
    });

    it('parse_profile_multiple_services_keep_order', 0, () => {
      const services = parseProfileServices([
        buildService('svc-a', []),
        buildService('svc-b', [buildCharacteristic('switch', false)])
      ]);
      expect(
        services.length
      ).assertEqual(
        2
      );
      expect(
        services[0].serviceId
      ).assertEqual(
        'svc-a'
      );
      expect(
        services[1].serviceId
      ).assertEqual(
        'svc-b'
      );
    });

    it('parse_profile_service_without_characteristics', 0, () => {
      const services = parseProfileServices([buildService('svc-empty', [])]);
      expect(
        services[0].characteristics.length
      ).assertEqual(
        0
      );
    });
  });
}
