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

import { ServiceData } from '@ohos/connect_cloud';
import { Logger } from '@ohos/common';
import {
  CharacteristicMethod,
  CharacteristicPermissions,
  Characteristics,
  CharacteristicsArray,
  CharacteristicType,
  ControlValue,
  EnumEntry,
  EnumList,
  isSupportPermissions,
  ProfileModel,
  ProfileModelArray,
  ProfileServices,
  UnitType
} from './ViewModel';

export type ProfileValue = string | number | boolean | RecordObject[] | undefined;
export type RecordObject = Record<string, ProfileValue>;

const TAG = 'ProfileBuilder';

export class ProfileBuilder {
  private profile: RecordObject;

  private constructor(profile: RecordObject) {
    this.profile = profile;
  }

  public static profileBuilder(profile: RecordObject): ProfileBuilder {
    let profileModel = new ProfileBuilder(profile);
    return profileModel;
  }

  public buildProfileModel(): ProfileModel {
    let prodId: string = this.getProfileString(this.profile, 'prodId');
    let deviceModel: string = this.getProfileString(this.profile, 'deviceModel');
    let deviceTypeId: string = this.getProfileString(this.profile, 'deviceTypeId');
    let deviceTypeName: string = this.getProfileString(this.profile, 'deviceTypeName');
    let deviceTypeNameEn: string = this.getProfileString(this.profile, 'deviceTypeNameEn');
    let deviceName: string = this.getProfileString(this.profile, 'deviceName');
    let manufacturerId: string = this.getProfileString(this.profile, 'manufacturerId');
    let manufacturerName: string = this.getProfileString(this.profile, 'manufacturerName');
    let typicalService: string = this.getProfileString(this.profile, 'typicalService');
    let description: string = this.getProfileString(this.profile, 'description');
    let services = this.buildProfileModelArray();
    services.sort((item1, item2) => {
      if (item1.serviceId == 'switch') {
        return -1;
      }
      if (item1.serviceId == 'restart') {
        return -1;
      }
      return 0;
    });
    let profileModel =
      new ProfileModel(prodId, deviceModel, deviceTypeId, deviceTypeName,
        deviceTypeNameEn, deviceName, manufacturerId,
        manufacturerName, typicalService, description, services);
    return profileModel;
  }

  public initValue(profileModelArray: ProfileModelArray, services: Array<ServiceData>) {
    for (let i = 0; i < services.length; i++) {
      let serviceData = services[i];
      let sid = serviceData.sid;
      let data = serviceData.data;
      let profileServices = profileModelArray.find((item) => item.serviceId == sid);
      if (profileServices == undefined) {
        continue;
      }
      let characteristics = profileServices.characteristics;
      for (let i = 0; i < characteristics.length; i++) {
        let characteristic = characteristics[i];
        // 给初始值
        characteristic.value = data?.[characteristic.characteristicName];
      }
    }
  }

  private buildProfileModelArray(): ProfileModelArray {
    let profileModelArray: ProfileModelArray = new ProfileModelArray();
    let services = this.profile['services'];
    if (!Array.isArray(services)) {
      Logger.error(TAG, 'Profile services field is missing or invalid');
      return profileModelArray;
    }
    let array: RecordObject[] = services as RecordObject[];

    for (let i = 0; i < array.length; i++) {
      let service = this.buildProfileServices(array[i]);
      if (service == undefined) {
        continue;
      }
      profileModelArray.push(service);
    }
    return profileModelArray;
  }

  private buildProfileServices(recordObject: RecordObject): ProfileServices | undefined {
    let value = recordObject['characteristics'];
    if (!Array.isArray(value)) {
      Logger.error(TAG, 'Profile characteristics field is missing or invalid');
      return undefined;
    }
    let characteristics: RecordObject[] = value as RecordObject[];
    let characteristicsArray: CharacteristicsArray = new CharacteristicsArray();
    for (let i = 0; i < characteristics.length; i++) {
      let characteristic = this.buildCharacteristicsArray(characteristics[i]);
      if (characteristic == undefined) {
        continue;
      }
      characteristicsArray.push(characteristic);
    }
    if (characteristicsArray.length == 0) {
      return undefined;
    }
    let serviceId: string = this.getProfileString(recordObject, 'serviceId');
    let serviceType: string = this.getProfileString(recordObject, 'serviceType');
    let serviceName: string = this.getProfileString(recordObject, 'serviceName');
    let serviceNameEn: string = this.getProfileString(recordObject, 'serviceNameEn');
    let description: string = this.getProfileString(recordObject, 'description');

    let profileServices =
      new ProfileServices(serviceId, serviceType, serviceName, serviceNameEn, description, characteristicsArray);
    return profileServices;
  }

  private buildCharacteristicsArray(recordObject: RecordObject): Characteristics | undefined {

    let characteristicName: string = this.getProfileString(recordObject, 'characteristicName');
    let characteristicType: CharacteristicType =
      this.getCharacteristicType(this.getProfileString(recordObject, 'characteristicType'));
    let description: string = this.getProfileString(recordObject, 'description');
    let method: CharacteristicMethod = this.getMethod(this.getProfileString(recordObject, 'method'));
    let permission: CharacteristicPermissions = this.getPermission(this.getProfileString(recordObject, 'permission'));
    let attrName: string = this.getProfileString(recordObject, 'attrName');
    let attrNameEn: string = this.getProfileString(recordObject, 'attrNameEn');
    let ecaFlag: string = this.getProfileString(recordObject, 'ecaFlag');

    let characteristics: Characteristics =
      new Characteristics(characteristicName, characteristicType, description, method, permission, attrName, attrNameEn,
        ecaFlag);

    let length: string = this.getProfileString(recordObject, 'maxLength');
    if (length.length > 0) {
      characteristics.setMaxLength(Number(length));
    }
    let enumList = this.buildEnumList(recordObject['enumList'] as RecordObject[] | undefined);
    characteristics.setEnumList(enumList);
    let unitType = this.buildUnitType(recordObject);
    characteristics.setUnitType(unitType);

    return characteristics;
  }

  private buildUnitType(recordObject: RecordObject): UnitType | undefined {
    let minObj: ProfileValue = recordObject['min'];
    let min = 0;
    if (typeof minObj == 'number') {
      min = minObj;
    }
    let maxObj: ProfileValue = recordObject['max'];
    let max = 0;
    if (typeof maxObj == 'number') {
      max = maxObj;
    }
    let stepObj: ProfileValue = recordObject['step'];
    let step = 0;
    if (typeof stepObj == 'number') {
      step = stepObj;
    }
    let unit = this.getProfileString(recordObject, 'unit');
    let unitEn = this.getProfileString(recordObject, 'unitEn');
    let unitType = new UnitType(min, max, step, unit, unitEn);
    return unitType;
  }

  private buildEnumList(array: RecordObject[] | undefined): EnumList | undefined {
    if (!Array.isArray(array)) {
      return undefined;
    }
    let enumList = new EnumList();
    for (let i = 0; i < array.length; i++) {
      let item = array[i];
      let descCh: string = this.getProfileString(item, 'descCh');
      let descEn: string = this.getProfileString(item, 'descEn');
      let enumVal: ControlValue = item['enumVal'] as ControlValue;
      let enumEntry = new EnumEntry(descCh, descEn, enumVal);
      enumList.push(enumEntry);
    }
    return enumList;
  }

  private getCharacteristicType(characteristicType: string): CharacteristicType {
    if (characteristicType == 'string') {
      return CharacteristicType.STRING;
    } else if (characteristicType == 'enum') {
      return CharacteristicType.ENUM;
    } else if (characteristicType.indexOf('int') != -1) {
      return CharacteristicType.INT;
    } else if (characteristicType == 'float') {
      return CharacteristicType.FLOAT;
    } else if (characteristicType == 'bool') {
      return CharacteristicType.BOOL;
    }
    return CharacteristicType.STRING;
  }

  private getMethod(characteristicType: string): CharacteristicMethod {
    let method = 0;
    for (let i = 0; i < characteristicType.length; i++) {
      let char = characteristicType.charAt(i);
      if (char == 'R') {
        method |= CharacteristicMethod.READ;
      }
      if (char == 'W') {
        method |= CharacteristicMethod.WRITE;
      }
    }
    return method;
  }

  private getPermission(permission: string): CharacteristicPermissions {
    let characteristicPermissions = 0;
    for (let i = 0; i < permission.length; i++) {
      let char = permission.charAt(i);
      if (char == 'G') {
        characteristicPermissions |= CharacteristicPermissions.GET;
      }
      if (char == 'P') {
        characteristicPermissions |= CharacteristicPermissions.PUT;
      }
      if (char == 'R') {
        characteristicPermissions |= CharacteristicPermissions.REPORT;
      }
    }
    return characteristicPermissions;
  }

  private getProfileString(profile: RecordObject, key: string): string {
    let value: ProfileValue = profile[key];
    if (typeof value == 'string') {
      return value;
    }
    return '';
  }
}
