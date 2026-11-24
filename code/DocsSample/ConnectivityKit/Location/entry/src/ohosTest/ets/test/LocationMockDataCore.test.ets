/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { listData, heatCity, ListItem, ProvinceWithSubCities } from '../../../main/ets/mock/LocationMock';

const DOMAIN: number = 0xF814;
const TAG: string = 'LocationMockDataCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function findGroup(letter: string): ListItem {
  for (const group of listData) {
    if (group.name === letter) {
      return group;
    }
  }
  return listData[0];
}

function collectAllCityNames(): string[] {
  const names: string[] = [];
  for (const group of listData) {
    for (const item of group.city) {
      if (typeof item === 'string') {
        names.push(item);
      } else {
        names.push(item.name);
        for (const sub of item.city) {
          names.push(sub);
        }
      }
    }
  }
  return names;
}

export default function locationMockDataCoreTest(): void {
  describe('LocationMockDataCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0101
     * @tc.name      testLocationMockListDataLength0101
     * @tc.desc      Verify the province list data contains exactly 15 letter groups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockListDataLength0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockListDataLength0101 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listData.length=${listData.length}, expected=15`);
      expect(listData.length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(listData)=${Array.isArray(listData)}`);
      expect(Array.isArray(listData)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof listData=${typeof listData}, expected='object'`);
      expect(typeof listData).assertEqual('object');
      log('testLocationMockListDataLength0101 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0102
     * @tc.name      testLocationMockGroupStructure0102
     * @tc.desc      Verify every letter group exposes a string name and a non-empty city array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupStructure0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupStructure0102 begin');
      let allValid: boolean = true;
      for (const group of listData) {
        if (typeof group.name !== 'string' || !Array.isArray(group.city) || group.city.length === 0) {
          allValid = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allValid=${allValid}`);
      expect(allValid).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listData[0].name=${listData[0].name}, expected='A'`);
      expect(listData[0].name).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listData[14].name=${listData[14].name}, expected='Z'`);
      expect(listData[14].name).assertEqual('Z');
      log('testLocationMockGroupStructure0102 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0103
     * @tc.name      testLocationMockLetterSequence0103
     * @tc.desc      Verify the letter groups keep the documented pinyin index order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockLetterSequence0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockLetterSequence0103 begin');
      const letters: string[] = [];
      for (const group of listData) {
        letters.push(group.name);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual letters.length=${letters.length}, expected=15`);
      expect(letters.length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual letters.join(',')=${letters.join(',')}`);
      expect(letters.join(',')).assertEqual('A,B,C,F,G,H,J,L,N,Q,S,T,X,Y,Z');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual letters[0]=${letters[0]}, expected='A'`);
      expect(letters[0]).assertEqual('A');
      log('testLocationMockLetterSequence0103 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0104
     * @tc.name      testLocationMockLetterUnique0104
     * @tc.desc      Verify no duplicate letter group exists in the province list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockLetterUnique0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockLetterUnique0104 begin');
      const letters: Set<string> = new Set<string>();
      for (const group of listData) {
        letters.add(group.name);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual letters.size=${letters.size}, expected=15`);
      expect(letters.size).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listData.length=${listData.length}, expected=letters.size`);
      expect(listData.length).assertEqual(letters.size);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof letters.size=${typeof letters.size}`);
      expect(typeof letters.size).assertEqual('number');
      log('testLocationMockLetterUnique0104 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0105
     * @tc.name      testLocationMockNestedGroups0105
     * @tc.desc      Verify the nested province groups are exactly A, B, C, F and Z.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockNestedGroups0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockNestedGroups0105 begin');
      const nested: string[] = [];
      for (const group of listData) {
        if (typeof group.city[0] !== 'string') {
          nested.push(group.name);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nested.length=${nested.length}, expected=5`);
      expect(nested.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nested.join(',')=${nested.join(',')}, expected='A,B,C,F,Z'`);
      expect(nested.join(',')).assertEqual('A,B,C,F,Z');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nested[0]=${nested[0]}, expected='A'`);
      expect(nested[0]).assertEqual('A');
      log('testLocationMockNestedGroups0105 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0106
     * @tc.name      testLocationMockFlatGroups0106
     * @tc.desc      Verify the flat string city groups are exactly the ten documented letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockFlatGroups0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockFlatGroups0106 begin');
      const flat: string[] = [];
      for (const group of listData) {
        if (typeof group.city[0] === 'string') {
          flat.push(group.name);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flat.length=${flat.length}, expected=10`);
      expect(flat.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flat.join(',')=${flat.join(',')}`);
      expect(flat.join(',')).assertEqual('G,H,J,L,N,Q,S,T,X,Y');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flat[9]=${flat[9]}, expected='Y'`);
      expect(flat[9]).assertEqual('Y');
      log('testLocationMockFlatGroups0106 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0107
     * @tc.name      testLocationMockSingleLetterName0107
     * @tc.desc      Verify every group name is a single character for the alphabetical indexer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockSingleLetterName0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockSingleLetterName0107 begin');
      let allSingle: boolean = true;
      for (const group of listData) {
        if (group.name.length !== 1) {
          allSingle = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allSingle=${allSingle}`);
      expect(allSingle).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual findGroup('H').name.length=${findGroup('H').name.length}`);
      expect(findGroup('H').name.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual findGroup('H').name=${findGroup('H').name}, expected='H'`);
      expect(findGroup('H').name).assertEqual('H');
      log('testLocationMockSingleLetterName0107 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0108
     * @tc.name      testLocationMockGroupA0108
     * @tc.desc      Verify group A holds province Anhui with Bozhou and Anqing sub cities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupA0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupA0108 begin');
      const group: ListItem = findGroup('A');
      const provinces: ProvinceWithSubCities[] = group.city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='A'`);
      expect(group.name).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces.length=${provinces.length}, expected=1`);
      expect(provinces.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].name=${provinces[0].name}, expected='安徽'`);
      expect(provinces[0].name).assertEqual('安徽');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.join(',')=${provinces[0].city.join(',')}`);
      expect(provinces[0].city.join(',')).assertEqual('亳州,安庆');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].name=${typeof provinces[0].name}`);
      expect(typeof provinces[0].name).assertEqual('string');
      log('testLocationMockGroupA0108 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0109
     * @tc.name      testLocationMockGroupB0109
     * @tc.desc      Verify group B holds province Beijing with Chaoyang and Daxing districts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupB0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupB0109 begin');
      const group: ListItem = findGroup('B');
      const provinces: ProvinceWithSubCities[] = group.city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='B'`);
      expect(group.name).assertEqual('B');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces.length=${provinces.length}, expected=1`);
      expect(provinces.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].name=${provinces[0].name}, expected='北京'`);
      expect(provinces[0].name).assertEqual('北京');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.join(',')=${provinces[0].city.join(',')}`);
      expect(provinces[0].city.join(',')).assertEqual('朝阳区,大兴区');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].city[1]=${typeof provinces[0].city[1]}`);
      expect(typeof provinces[0].city[1]).assertEqual('string');
      log('testLocationMockGroupB0109 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0110
     * @tc.name      testLocationMockGroupC0110
     * @tc.desc      Verify group C holds province Chongqing with Banan and Changshou districts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupC0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupC0110 begin');
      const group: ListItem = findGroup('C');
      const provinces: ProvinceWithSubCities[] = group.city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='C'`);
      expect(group.name).assertEqual('C');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces.length=${provinces.length}, expected=1`);
      expect(provinces.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].name=${provinces[0].name}, expected='重庆'`);
      expect(provinces[0].name).assertEqual('重庆');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.join(',')=${provinces[0].city.join(',')}`);
      expect(provinces[0].city.join(',')).assertEqual('巴南区,长寿区');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].name=${typeof provinces[0].name}`);
      expect(typeof provinces[0].name).assertEqual('string');
      log('testLocationMockGroupC0110 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0111
     * @tc.name      testLocationMockGroupF0111
     * @tc.desc      Verify group F holds province Fujian with Fuzhou and Fu'an sub cities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupF0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupF0111 begin');
      const group: ListItem = findGroup('F');
      const provinces: ProvinceWithSubCities[] = group.city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='F'`);
      expect(group.name).assertEqual('F');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces.length=${provinces.length}, expected=1`);
      expect(provinces.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].name=${provinces[0].name}, expected='福建'`);
      expect(provinces[0].name).assertEqual('福建');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.join(',')=${provinces[0].city.join(',')}`);
      expect(provinces[0].city.join(',')).assertEqual('福州,福安');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].city[0]=${typeof provinces[0].city[0]}`);
      expect(typeof provinces[0].city[0]).assertEqual('string');
      log('testLocationMockGroupF0111 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0112
     * @tc.name      testLocationMockGroupZ0112
     * @tc.desc      Verify group Z holds province Zhejiang with Ningbo and Hangzhou sub cities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupZ0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupZ0112 begin');
      const group: ListItem = findGroup('Z');
      const provinces: ProvinceWithSubCities[] = group.city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='Z'`);
      expect(group.name).assertEqual('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces.length=${provinces.length}, expected=1`);
      expect(provinces.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].name=${provinces[0].name}, expected='浙江'`);
      expect(provinces[0].name).assertEqual('浙江');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.join(',')=${provinces[0].city.join(',')}`);
      expect(provinces[0].city.join(',')).assertEqual('宁波,杭州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].city[1]=${typeof provinces[0].city[1]}`);
      expect(typeof provinces[0].city[1]).assertEqual('string');
      log('testLocationMockGroupZ0112 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0113
     * @tc.name      testLocationMockGroupG0113
     * @tc.desc      Verify group G lists Gansu, Guangdong, Guangxi and Guizhou as flat cities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupG0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupG0113 begin');
      const group: ListItem = findGroup('G');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='G'`);
      expect(group.name).assertEqual('G');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=4`);
      expect(cities.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.join(',')=${cities.join(',')}, expected='甘肃,广东,广西,贵州'`);
      expect(cities.join(',')).assertEqual('甘肃,广东,广西,贵州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[0]=${typeof cities[0]}, expected='string'`);
      expect(typeof cities[0]).assertEqual('string');
      log('testLocationMockGroupG0113 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0114
     * @tc.name      testLocationMockGroupH0114
     * @tc.desc      Verify group H lists its six flat provinces in the documented order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupH0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupH0114 begin');
      const group: ListItem = findGroup('H');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='H'`);
      expect(group.name).assertEqual('H');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=6`);
      expect(cities.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.join(',')=${cities.join(',')}`);
      expect(cities.join(',')).assertEqual('海南,河北,河南,黑龙江,湖北,湖南');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[3]=${cities[3]}, expected='黑龙江'`);
      expect(cities[3]).assertEqual('黑龙江');
      log('testLocationMockGroupH0114 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0115
     * @tc.name      testLocationMockGroupJ0115
     * @tc.desc      Verify group J lists Jilin, Jiangsu and Jiangxi as flat cities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupJ0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupJ0115 begin');
      const group: ListItem = findGroup('J');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='J'`);
      expect(group.name).assertEqual('J');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=3`);
      expect(cities.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.join(',')=${cities.join(',')}, expected='吉林,江苏,江西'`);
      expect(cities.join(',')).assertEqual('吉林,江苏,江西');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[2]=${typeof cities[2]}, expected='string'`);
      expect(typeof cities[2]).assertEqual('string');
      log('testLocationMockGroupJ0115 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0116
     * @tc.name      testLocationMockGroupL0116
     * @tc.desc      Verify group L lists only Liaoning as a flat city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupL0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupL0116 begin');
      const group: ListItem = findGroup('L');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='L'`);
      expect(group.name).assertEqual('L');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=1`);
      expect(cities.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='辽宁'`);
      expect(cities[0]).assertEqual('辽宁');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[0]=${typeof cities[0]}, expected='string'`);
      expect(typeof cities[0]).assertEqual('string');
      log('testLocationMockGroupL0116 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0117
     * @tc.name      testLocationMockGroupN0117
     * @tc.desc      Verify group N lists Inner Mongolia and Ningxia as flat cities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupN0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupN0117 begin');
      const group: ListItem = findGroup('N');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='N'`);
      expect(group.name).assertEqual('N');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=2`);
      expect(cities.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.join(',')=${cities.join(',')}, expected='内蒙古,宁夏'`);
      expect(cities.join(',')).assertEqual('内蒙古,宁夏');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[1]=${cities[1]}, expected='宁夏'`);
      expect(cities[1]).assertEqual('宁夏');
      log('testLocationMockGroupN0117 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0118
     * @tc.name      testLocationMockGroupQ0118
     * @tc.desc      Verify group Q lists only Qinghai as a flat city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupQ0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupQ0118 begin');
      const group: ListItem = findGroup('Q');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='Q'`);
      expect(group.name).assertEqual('Q');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=1`);
      expect(cities.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='青海'`);
      expect(cities[0]).assertEqual('青海');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[0]=${typeof cities[0]}, expected='string'`);
      expect(typeof cities[0]).assertEqual('string');
      log('testLocationMockGroupQ0118 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0119
     * @tc.name      testLocationMockGroupS0119
     * @tc.desc      Verify group S lists its five flat provinces in the documented order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupS0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupS0119 begin');
      const group: ListItem = findGroup('S');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='S'`);
      expect(group.name).assertEqual('S');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=5`);
      expect(cities.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.join(',')=${cities.join(',')}`);
      expect(cities.join(',')).assertEqual('山东,山西,陕西,上海,四川');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[3]=${cities[3]}, expected='上海'`);
      expect(cities[3]).assertEqual('上海');
      log('testLocationMockGroupS0119 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0120
     * @tc.name      testLocationMockGroupT0120
     * @tc.desc      Verify group T lists only Tianjin as a flat city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupT0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupT0120 begin');
      const group: ListItem = findGroup('T');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='T'`);
      expect(group.name).assertEqual('T');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=1`);
      expect(cities.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='天津'`);
      expect(cities[0]).assertEqual('天津');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[0]=${typeof cities[0]}, expected='string'`);
      expect(typeof cities[0]).assertEqual('string');
      log('testLocationMockGroupT0120 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0121
     * @tc.name      testLocationMockGroupX0121
     * @tc.desc      Verify group X lists Tibet and Xinjiang as flat cities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupX0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupX0121 begin');
      const group: ListItem = findGroup('X');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='X'`);
      expect(group.name).assertEqual('X');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=2`);
      expect(cities.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.join(',')=${cities.join(',')}, expected='西藏,新疆'`);
      expect(cities.join(',')).assertEqual('西藏,新疆');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='西藏'`);
      expect(cities[0]).assertEqual('西藏');
      log('testLocationMockGroupX0121 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0122
     * @tc.name      testLocationMockGroupY0122
     * @tc.desc      Verify group Y lists only Yunnan as a flat city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGroupY0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGroupY0122 begin');
      const group: ListItem = findGroup('Y');
      const cities: string[] = group.city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group.name=${group.name}, expected='Y'`);
      expect(group.name).assertEqual('Y');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=1`);
      expect(cities.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='云南'`);
      expect(cities[0]).assertEqual('云南');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[0]=${typeof cities[0]}, expected='string'`);
      expect(typeof cities[0]).assertEqual('string');
      log('testLocationMockGroupY0122 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0123
     * @tc.name      testLocationMockNestedSubCityCount0123
     * @tc.desc      Verify nested province groups carry exactly ten sub cities in total.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockNestedSubCityCount0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockNestedSubCityCount0123 begin');
      let nestedCount: number = 0;
      for (const group of listData) {
        for (const item of group.city) {
          if (typeof item !== 'string') {
            nestedCount += item.city.length;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nestedCount=${nestedCount}, expected=10`);
      expect(nestedCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nestedCount=${typeof nestedCount}, expected='number'`);
      expect(typeof nestedCount).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue nestedCount > 0=${nestedCount > 0}`);
      expect(nestedCount > 0).assertTrue();
      log('testLocationMockNestedSubCityCount0123 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0124
     * @tc.name      testLocationMockFlatCityCount0124
     * @tc.desc      Verify flat groups carry exactly twenty-six city strings in total.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockFlatCityCount0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockFlatCityCount0124 begin');
      let flatCount: number = 0;
      for (const group of listData) {
        for (const item of group.city) {
          if (typeof item === 'string') {
            flatCount += 1;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual flatCount=${flatCount}, expected=26`);
      expect(flatCount).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue flatCount >= 1=${flatCount >= 1}`);
      expect(flatCount >= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof flatCount=${typeof flatCount}, expected='number'`);
      expect(typeof flatCount).assertEqual('number');
      log('testLocationMockFlatCityCount0124 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0125
     * @tc.name      testLocationMockGansuCity0125
     * @tc.desc      Verify Gansu is the first flat city of group G.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGansuCity0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGansuCity0125 begin');
      const cities: string[] = findGroup('G').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='甘肃'`);
      expect(cities[0]).assertEqual('甘肃');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('甘肃')=${cities.indexOf('甘肃')}, expected=0`);
      expect(cities.indexOf('甘肃')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue cities[0].length > 0=${cities[0].length > 0}`);
      expect(cities[0].length > 0).assertTrue();
      log('testLocationMockGansuCity0125 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0126
     * @tc.name      testLocationMockGuangdongCity0126
     * @tc.desc      Verify Guangdong is the second flat city of group G.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGuangdongCity0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGuangdongCity0126 begin');
      const cities: string[] = findGroup('G').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[1]=${cities[1]}, expected='广东'`);
      expect(cities[1]).assertEqual('广东');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('广东')=${cities.indexOf('广东')}, expected=1`);
      expect(cities.indexOf('广东')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[1].length=${cities[1].length}, expected=2`);
      expect(cities[1].length).assertEqual(2);
      log('testLocationMockGuangdongCity0126 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0127
     * @tc.name      testLocationMockGuangxiCity0127
     * @tc.desc      Verify Guangxi is the third flat city of group G.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGuangxiCity0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGuangxiCity0127 begin');
      const cities: string[] = findGroup('G').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[2]=${cities[2]}, expected='广西'`);
      expect(cities[2]).assertEqual('广西');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('广西')=${cities.indexOf('广西')}, expected=2`);
      expect(cities.indexOf('广西')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[2]=${typeof cities[2]}, expected='string'`);
      expect(typeof cities[2]).assertEqual('string');
      log('testLocationMockGuangxiCity0127 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0128
     * @tc.name      testLocationMockGuizhouCity0128
     * @tc.desc      Verify Guizhou is the last flat city of group G.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGuizhouCity0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGuizhouCity0128 begin');
      const cities: string[] = findGroup('G').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[3]=${cities[3]}, expected='贵州'`);
      expect(cities[3]).assertEqual('贵州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('贵州')=${cities.indexOf('贵州')}, expected=3`);
      expect(cities.indexOf('贵州')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length - 1=${cities.length - 1}`);
      expect(cities.length - 1).assertEqual(cities.indexOf('贵州'));
      log('testLocationMockGuizhouCity0128 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0129
     * @tc.name      testLocationMockHainanCity0129
     * @tc.desc      Verify Hainan is the first flat city of group H.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHainanCity0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHainanCity0129 begin');
      const cities: string[] = findGroup('H').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='海南'`);
      expect(cities[0]).assertEqual('海南');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('海南')=${cities.indexOf('海南')}, expected=0`);
      expect(cities.indexOf('海南')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue cities[0].length > 0=${cities[0].length > 0}`);
      expect(cities[0].length > 0).assertTrue();
      log('testLocationMockHainanCity0129 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0130
     * @tc.name      testLocationMockHebeiCity0130
     * @tc.desc      Verify Hebei is the second flat city of group H.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHebeiCity0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHebeiCity0130 begin');
      const cities: string[] = findGroup('H').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[1]=${cities[1]}, expected='河北'`);
      expect(cities[1]).assertEqual('河北');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('河北')=${cities.indexOf('河北')}, expected=1`);
      expect(cities.indexOf('河北')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[1]=${typeof cities[1]}, expected='string'`);
      expect(typeof cities[1]).assertEqual('string');
      log('testLocationMockHebeiCity0130 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0131
     * @tc.name      testLocationMockHenanCity0131
     * @tc.desc      Verify Henan is the third flat city of group H.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHenanCity0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHenanCity0131 begin');
      const cities: string[] = findGroup('H').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[2]=${cities[2]}, expected='河南'`);
      expect(cities[2]).assertEqual('河南');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('河南')=${cities.indexOf('河南')}, expected=2`);
      expect(cities.indexOf('河南')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[2].length=${cities[2].length}, expected=2`);
      expect(cities[2].length).assertEqual(2);
      log('testLocationMockHenanCity0131 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0132
     * @tc.name      testLocationMockHeilongjiangCity0132
     * @tc.desc      Verify Heilongjiang is the fourth flat city of group H.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeilongjiangCity0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeilongjiangCity0132 begin');
      const cities: string[] = findGroup('H').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[3]=${cities[3]}, expected='黑龙江'`);
      expect(cities[3]).assertEqual('黑龙江');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('黑龙江')=${cities.indexOf('黑龙江')}, expected=3`);
      expect(cities.indexOf('黑龙江')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[3].length=${cities[3].length}, expected=3`);
      expect(cities[3].length).assertEqual(3);
      log('testLocationMockHeilongjiangCity0132 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0133
     * @tc.name      testLocationMockHubeiCity0133
     * @tc.desc      Verify Hubei is the fifth flat city of group H.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHubeiCity0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHubeiCity0133 begin');
      const cities: string[] = findGroup('H').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[4]=${cities[4]}, expected='湖北'`);
      expect(cities[4]).assertEqual('湖北');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('湖北')=${cities.indexOf('湖北')}, expected=4`);
      expect(cities.indexOf('湖北')).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[4]=${typeof cities[4]}, expected='string'`);
      expect(typeof cities[4]).assertEqual('string');
      log('testLocationMockHubeiCity0133 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0134
     * @tc.name      testLocationMockHunanCity0134
     * @tc.desc      Verify Hunan is the last flat city of group H.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHunanCity0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHunanCity0134 begin');
      const cities: string[] = findGroup('H').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[5]=${cities[5]}, expected='湖南'`);
      expect(cities[5]).assertEqual('湖南');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length - 1=${cities.length - 1}`);
      expect(cities.length - 1).assertEqual(cities.indexOf('湖南'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[5].length=${cities[5].length}, expected=2`);
      expect(cities[5].length).assertEqual(2);
      log('testLocationMockHunanCity0134 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0135
     * @tc.name      testLocationMockJilinCity0135
     * @tc.desc      Verify Jilin is the first flat city of group J.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockJilinCity0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockJilinCity0135 begin');
      const cities: string[] = findGroup('J').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='吉林'`);
      expect(cities[0]).assertEqual('吉林');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('吉林')=${cities.indexOf('吉林')}, expected=0`);
      expect(cities.indexOf('吉林')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue cities[0].length > 0=${cities[0].length > 0}`);
      expect(cities[0].length > 0).assertTrue();
      log('testLocationMockJilinCity0135 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0136
     * @tc.name      testLocationMockJiangsuCity0136
     * @tc.desc      Verify Jiangsu is the second flat city of group J.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockJiangsuCity0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockJiangsuCity0136 begin');
      const cities: string[] = findGroup('J').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[1]=${cities[1]}, expected='江苏'`);
      expect(cities[1]).assertEqual('江苏');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('江苏')=${cities.indexOf('江苏')}, expected=1`);
      expect(cities.indexOf('江苏')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[1]=${typeof cities[1]}, expected='string'`);
      expect(typeof cities[1]).assertEqual('string');
      log('testLocationMockJiangsuCity0136 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0137
     * @tc.name      testLocationMockJiangxiCity0137
     * @tc.desc      Verify Jiangxi is the last flat city of group J.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockJiangxiCity0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockJiangxiCity0137 begin');
      const cities: string[] = findGroup('J').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[2]=${cities[2]}, expected='江西'`);
      expect(cities[2]).assertEqual('江西');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length - 1=${cities.length - 1}`);
      expect(cities.length - 1).assertEqual(cities.indexOf('江西'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=3`);
      expect(cities.length).assertEqual(3);
      log('testLocationMockJiangxiCity0137 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0138
     * @tc.name      testLocationMockLiaoningCity0138
     * @tc.desc      Verify Liaoning is the only flat city of group L.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockLiaoningCity0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockLiaoningCity0138 begin');
      const cities: string[] = findGroup('L').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='辽宁'`);
      expect(cities[0]).assertEqual('辽宁');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=1`);
      expect(cities.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[0]=${typeof cities[0]}, expected='string'`);
      expect(typeof cities[0]).assertEqual('string');
      log('testLocationMockLiaoningCity0138 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0139
     * @tc.name      testLocationMockInnerMongoliaCity0139
     * @tc.desc      Verify Inner Mongolia is the first flat city of group N.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockInnerMongoliaCity0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockInnerMongoliaCity0139 begin');
      const cities: string[] = findGroup('N').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='内蒙古'`);
      expect(cities[0]).assertEqual('内蒙古');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('内蒙古')=${cities.indexOf('内蒙古')}, expected=0`);
      expect(cities.indexOf('内蒙古')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0].length=${cities[0].length}, expected=3`);
      expect(cities[0].length).assertEqual(3);
      log('testLocationMockInnerMongoliaCity0139 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0140
     * @tc.name      testLocationMockNingxiaCity0140
     * @tc.desc      Verify Ningxia is the last flat city of group N.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockNingxiaCity0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockNingxiaCity0140 begin');
      const cities: string[] = findGroup('N').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[1]=${cities[1]}, expected='宁夏'`);
      expect(cities[1]).assertEqual('宁夏');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length - 1=${cities.length - 1}`);
      expect(cities.length - 1).assertEqual(cities.indexOf('宁夏'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[1]=${typeof cities[1]}, expected='string'`);
      expect(typeof cities[1]).assertEqual('string');
      log('testLocationMockNingxiaCity0140 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0141
     * @tc.name      testLocationMockQinghaiCity0141
     * @tc.desc      Verify Qinghai is the only flat city of group Q.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockQinghaiCity0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockQinghaiCity0141 begin');
      const cities: string[] = findGroup('Q').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='青海'`);
      expect(cities[0]).assertEqual('青海');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=1`);
      expect(cities.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue cities[0].length > 0=${cities[0].length > 0}`);
      expect(cities[0].length > 0).assertTrue();
      log('testLocationMockQinghaiCity0141 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0142
     * @tc.name      testLocationMockShandongCity0142
     * @tc.desc      Verify Shandong is the first flat city of group S.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockShandongCity0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockShandongCity0142 begin');
      const cities: string[] = findGroup('S').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='山东'`);
      expect(cities[0]).assertEqual('山东');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('山东')=${cities.indexOf('山东')}, expected=0`);
      expect(cities.indexOf('山东')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=5`);
      expect(cities.length).assertEqual(5);
      log('testLocationMockShandongCity0142 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0143
     * @tc.name      testLocationMockShanxiCity0143
     * @tc.desc      Verify Shanxi is the second flat city of group S.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockShanxiCity0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockShanxiCity0143 begin');
      const cities: string[] = findGroup('S').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[1]=${cities[1]}, expected='山西'`);
      expect(cities[1]).assertEqual('山西');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('山西')=${cities.indexOf('山西')}, expected=1`);
      expect(cities.indexOf('山西')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[1]=${typeof cities[1]}, expected='string'`);
      expect(typeof cities[1]).assertEqual('string');
      log('testLocationMockShanxiCity0143 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0144
     * @tc.name      testLocationMockShaanxiCity0144
     * @tc.desc      Verify Shaanxi is the third flat city of group S.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockShaanxiCity0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockShaanxiCity0144 begin');
      const cities: string[] = findGroup('S').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[2]=${cities[2]}, expected='陕西'`);
      expect(cities[2]).assertEqual('陕西');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('陕西')=${cities.indexOf('陕西')}, expected=2`);
      expect(cities.indexOf('陕西')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[2].length=${cities[2].length}, expected=2`);
      expect(cities[2].length).assertEqual(2);
      log('testLocationMockShaanxiCity0144 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0145
     * @tc.name      testLocationMockShanghaiCity0145
     * @tc.desc      Verify Shanghai is the fourth flat city of group S.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockShanghaiCity0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockShanghaiCity0145 begin');
      const cities: string[] = findGroup('S').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[3]=${cities[3]}, expected='上海'`);
      expect(cities[3]).assertEqual('上海');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('上海')=${cities.indexOf('上海')}, expected=3`);
      expect(cities.indexOf('上海')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[3]=${typeof cities[3]}, expected='string'`);
      expect(typeof cities[3]).assertEqual('string');
      log('testLocationMockShanghaiCity0145 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0146
     * @tc.name      testLocationMockSichuanCity0146
     * @tc.desc      Verify Sichuan is the last flat city of group S.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockSichuanCity0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockSichuanCity0146 begin');
      const cities: string[] = findGroup('S').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[4]=${cities[4]}, expected='四川'`);
      expect(cities[4]).assertEqual('四川');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length - 1=${cities.length - 1}`);
      expect(cities.length - 1).assertEqual(cities.indexOf('四川'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=5`);
      expect(cities.length).assertEqual(5);
      log('testLocationMockSichuanCity0146 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0147
     * @tc.name      testLocationMockTianjinCity0147
     * @tc.desc      Verify Tianjin is the only flat city of group T.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockTianjinCity0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockTianjinCity0147 begin');
      const cities: string[] = findGroup('T').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='天津'`);
      expect(cities[0]).assertEqual('天津');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=1`);
      expect(cities.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue cities[0].length > 0=${cities[0].length > 0}`);
      expect(cities[0].length > 0).assertTrue();
      log('testLocationMockTianjinCity0147 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0148
     * @tc.name      testLocationMockTibetCity0148
     * @tc.desc      Verify Tibet is the first flat city of group X.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockTibetCity0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockTibetCity0148 begin');
      const cities: string[] = findGroup('X').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='西藏'`);
      expect(cities[0]).assertEqual('西藏');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.indexOf('西藏')=${cities.indexOf('西藏')}, expected=0`);
      expect(cities.indexOf('西藏')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=2`);
      expect(cities.length).assertEqual(2);
      log('testLocationMockTibetCity0148 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0149
     * @tc.name      testLocationMockXinjiangCity0149
     * @tc.desc      Verify Xinjiang is the last flat city of group X.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockXinjiangCity0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockXinjiangCity0149 begin');
      const cities: string[] = findGroup('X').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[1]=${cities[1]}, expected='新疆'`);
      expect(cities[1]).assertEqual('新疆');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length - 1=${cities.length - 1}`);
      expect(cities.length - 1).assertEqual(cities.indexOf('新疆'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cities[1]=${typeof cities[1]}, expected='string'`);
      expect(typeof cities[1]).assertEqual('string');
      log('testLocationMockXinjiangCity0149 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0150
     * @tc.name      testLocationMockYunnanCity0150
     * @tc.desc      Verify Yunnan is the only flat city of group Y.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockYunnanCity0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockYunnanCity0150 begin');
      const cities: string[] = findGroup('Y').city as string[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities[0]=${cities[0]}, expected='云南'`);
      expect(cities[0]).assertEqual('云南');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cities.length=${cities.length}, expected=1`);
      expect(cities.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue cities[0].length > 0=${cities[0].length > 0}`);
      expect(cities[0].length > 0).assertTrue();
      log('testLocationMockYunnanCity0150 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0151
     * @tc.name      testLocationMockBozhouSubCity0151
     * @tc.desc      Verify Bozhou is the first sub city of province Anhui.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockBozhouSubCity0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockBozhouSubCity0151 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('A').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[0]=${provinces[0].city[0]}, expected='亳州'`);
      expect(provinces[0].city[0]).assertEqual('亳州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${provinces[0].city.indexOf('亳州')}, expected=0`);
      expect(provinces[0].city.indexOf('亳州')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].city[0]=${typeof provinces[0].city[0]}`);
      expect(typeof provinces[0].city[0]).assertEqual('string');
      log('testLocationMockBozhouSubCity0151 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0152
     * @tc.name      testLocationMockAnqingSubCity0152
     * @tc.desc      Verify Anqing is the last sub city of province Anhui.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockAnqingSubCity0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockAnqingSubCity0152 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('A').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[1]=${provinces[0].city[1]}, expected='安庆'`);
      expect(provinces[0].city[1]).assertEqual('安庆');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.length - 1=${provinces[0].city.length - 1}`);
      expect(provinces[0].city.length - 1).assertEqual(provinces[0].city.indexOf('安庆'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].city[1]=${typeof provinces[0].city[1]}`);
      expect(typeof provinces[0].city[1]).assertEqual('string');
      log('testLocationMockAnqingSubCity0152 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0153
     * @tc.name      testLocationMockChaoyangSubCity0153
     * @tc.desc      Verify Chaoyang district is the first sub city of province Beijing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockChaoyangSubCity0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockChaoyangSubCity0153 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('B').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[0]=${provinces[0].city[0]}, expected='朝阳区'`);
      expect(provinces[0].city[0]).assertEqual('朝阳区');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${provinces[0].city.indexOf('朝阳区')}, expected=0`);
      expect(provinces[0].city.indexOf('朝阳区')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[0].length=${provinces[0].city[0].length}`);
      expect(provinces[0].city[0].length).assertEqual(3);
      log('testLocationMockChaoyangSubCity0153 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0154
     * @tc.name      testLocationMockDaxingSubCity0154
     * @tc.desc      Verify Daxing district is the last sub city of province Beijing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockDaxingSubCity0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockDaxingSubCity0154 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('B').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[1]=${provinces[0].city[1]}, expected='大兴区'`);
      expect(provinces[0].city[1]).assertEqual('大兴区');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.length - 1=${provinces[0].city.length - 1}`);
      expect(provinces[0].city.length - 1).assertEqual(provinces[0].city.indexOf('大兴区'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].city[1]=${typeof provinces[0].city[1]}`);
      expect(typeof provinces[0].city[1]).assertEqual('string');
      log('testLocationMockDaxingSubCity0154 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0155
     * @tc.name      testLocationMockBananSubCity0155
     * @tc.desc      Verify Banan district is the first sub city of province Chongqing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockBananSubCity0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockBananSubCity0155 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('C').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[0]=${provinces[0].city[0]}, expected='巴南区'`);
      expect(provinces[0].city[0]).assertEqual('巴南区');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${provinces[0].city.indexOf('巴南区')}, expected=0`);
      expect(provinces[0].city.indexOf('巴南区')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[0].length=${provinces[0].city[0].length}`);
      expect(provinces[0].city[0].length).assertEqual(3);
      log('testLocationMockBananSubCity0155 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0156
     * @tc.name      testLocationMockChangshouSubCity0156
     * @tc.desc      Verify Changshou district is the last sub city of province Chongqing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockChangshouSubCity0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockChangshouSubCity0156 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('C').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[1]=${provinces[0].city[1]}, expected='长寿区'`);
      expect(provinces[0].city[1]).assertEqual('长寿区');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.length - 1=${provinces[0].city.length - 1}`);
      expect(provinces[0].city.length - 1).assertEqual(provinces[0].city.indexOf('长寿区'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].city[1]=${typeof provinces[0].city[1]}`);
      expect(typeof provinces[0].city[1]).assertEqual('string');
      log('testLocationMockChangshouSubCity0156 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0157
     * @tc.name      testLocationMockFuzhouSubCity0157
     * @tc.desc      Verify Fuzhou is the first sub city of province Fujian.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockFuzhouSubCity0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockFuzhouSubCity0157 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('F').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[0]=${provinces[0].city[0]}, expected='福州'`);
      expect(provinces[0].city[0]).assertEqual('福州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${provinces[0].city.indexOf('福州')}, expected=0`);
      expect(provinces[0].city.indexOf('福州')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.length=${provinces[0].city.length}`);
      expect(provinces[0].city.length).assertEqual(2);
      log('testLocationMockFuzhouSubCity0157 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0158
     * @tc.name      testLocationMockFuanSubCity0158
     * @tc.desc      Verify Fuan is the last sub city of province Fujian.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockFuanSubCity0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockFuanSubCity0158 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('F').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[1]=${provinces[0].city[1]}, expected='福安'`);
      expect(provinces[0].city[1]).assertEqual('福安');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.length - 1=${provinces[0].city.length - 1}`);
      expect(provinces[0].city.length - 1).assertEqual(provinces[0].city.indexOf('福安'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].city[1]=${typeof provinces[0].city[1]}`);
      expect(typeof provinces[0].city[1]).assertEqual('string');
      log('testLocationMockFuanSubCity0158 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0159
     * @tc.name      testLocationMockNingboSubCity0159
     * @tc.desc      Verify Ningbo is the first sub city of province Zhejiang.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockNingboSubCity0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockNingboSubCity0159 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('Z').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[0]=${provinces[0].city[0]}, expected='宁波'`);
      expect(provinces[0].city[0]).assertEqual('宁波');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${provinces[0].city.indexOf('宁波')}, expected=0`);
      expect(provinces[0].city.indexOf('宁波')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.length=${provinces[0].city.length}`);
      expect(provinces[0].city.length).assertEqual(2);
      log('testLocationMockNingboSubCity0159 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0160
     * @tc.name      testLocationMockHangzhouSubCity0160
     * @tc.desc      Verify Hangzhou is the last sub city of province Zhejiang.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHangzhouSubCity0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHangzhouSubCity0160 begin');
      const provinces: ProvinceWithSubCities[] = findGroup('Z').city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city[1]=${provinces[0].city[1]}, expected='杭州'`);
      expect(provinces[0].city[1]).assertEqual('杭州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].city.length - 1=${provinces[0].city.length - 1}`);
      expect(provinces[0].city.length - 1).assertEqual(provinces[0].city.indexOf('杭州'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof provinces[0].city[1]=${typeof provinces[0].city[1]}`);
      expect(typeof provinces[0].city[1]).assertEqual('string');
      log('testLocationMockHangzhouSubCity0160 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0161
     * @tc.name      testLocationMockHeatCityLength0161
     * @tc.desc      Verify the hot city list contains exactly twelve cities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatCityLength0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatCityLength0161 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.length=${heatCity.length}, expected=12`);
      expect(heatCity.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(heatCity)=${Array.isArray(heatCity)}`);
      expect(Array.isArray(heatCity)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity=${typeof heatCity}, expected='object'`);
      expect(typeof heatCity).assertEqual('object');
      log('testLocationMockHeatCityLength0161 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0162
     * @tc.name      testLocationMockHeatCitySequence0162
     * @tc.desc      Verify the hot city list keeps the documented display order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatCitySequence0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatCitySequence0162 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.join(',')=${heatCity.join(',')}`);
      expect(heatCity.join(',')).assertEqual('北京,上海,广州,深圳,杭州,南京,苏州,天津,武汉,长沙,重庆,成都');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[0]=${heatCity[0]}, expected='北京'`);
      expect(heatCity[0]).assertEqual('北京');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[11]=${heatCity[11]}, expected='成都'`);
      expect(heatCity[11]).assertEqual('成都');
      log('testLocationMockHeatCitySequence0162 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0163
     * @tc.name      testLocationMockHeatCityUnique0163
     * @tc.desc      Verify no duplicate city exists in the hot city list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatCityUnique0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatCityUnique0163 begin');
      const unique: Set<string> = new Set<string>();
      for (const city of heatCity) {
        unique.add(city);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual unique.size=${unique.size}, expected=12`);
      expect(unique.size).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual unique.size=${unique.size}, expected=heatCity.length`);
      expect(unique.size).assertEqual(heatCity.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof unique.size=${typeof unique.size}, expected='number'`);
      expect(typeof unique.size).assertEqual('number');
      log('testLocationMockHeatCityUnique0163 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0164
     * @tc.name      testLocationMockHeatBeijing0164
     * @tc.desc      Verify Beijing is the first hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatBeijing0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatBeijing0164 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[0]=${heatCity[0]}, expected='北京'`);
      expect(heatCity[0]).assertEqual('北京');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('北京')=${heatCity.indexOf('北京')}, expected=0`);
      expect(heatCity.indexOf('北京')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[0]=${typeof heatCity[0]}, expected='string'`);
      expect(typeof heatCity[0]).assertEqual('string');
      log('testLocationMockHeatBeijing0164 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0165
     * @tc.name      testLocationMockHeatShanghai0165
     * @tc.desc      Verify Shanghai is the second hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatShanghai0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatShanghai0165 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[1]=${heatCity[1]}, expected='上海'`);
      expect(heatCity[1]).assertEqual('上海');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('上海')=${heatCity.indexOf('上海')}, expected=1`);
      expect(heatCity.indexOf('上海')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[1]=${typeof heatCity[1]}, expected='string'`);
      expect(typeof heatCity[1]).assertEqual('string');
      log('testLocationMockHeatShanghai0165 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0166
     * @tc.name      testLocationMockHeatGuangzhou0166
     * @tc.desc      Verify Guangzhou is the third hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatGuangzhou0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatGuangzhou0166 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[2]=${heatCity[2]}, expected='广州'`);
      expect(heatCity[2]).assertEqual('广州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('广州')=${heatCity.indexOf('广州')}, expected=2`);
      expect(heatCity.indexOf('广州')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[2]=${typeof heatCity[2]}, expected='string'`);
      expect(typeof heatCity[2]).assertEqual('string');
      log('testLocationMockHeatGuangzhou0166 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0167
     * @tc.name      testLocationMockHeatShenzhen0167
     * @tc.desc      Verify Shenzhen is the fourth hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatShenzhen0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatShenzhen0167 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[3]=${heatCity[3]}, expected='深圳'`);
      expect(heatCity[3]).assertEqual('深圳');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('深圳')=${heatCity.indexOf('深圳')}, expected=3`);
      expect(heatCity.indexOf('深圳')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[3]=${typeof heatCity[3]}, expected='string'`);
      expect(typeof heatCity[3]).assertEqual('string');
      log('testLocationMockHeatShenzhen0167 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0168
     * @tc.name      testLocationMockHeatHangzhou0168
     * @tc.desc      Verify Hangzhou is the fifth hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatHangzhou0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatHangzhou0168 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[4]=${heatCity[4]}, expected='杭州'`);
      expect(heatCity[4]).assertEqual('杭州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('杭州')=${heatCity.indexOf('杭州')}, expected=4`);
      expect(heatCity.indexOf('杭州')).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[4]=${typeof heatCity[4]}, expected='string'`);
      expect(typeof heatCity[4]).assertEqual('string');
      log('testLocationMockHeatHangzhou0168 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0169
     * @tc.name      testLocationMockHeatNanjing0169
     * @tc.desc      Verify Nanjing is the sixth hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatNanjing0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatNanjing0169 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[5]=${heatCity[5]}, expected='南京'`);
      expect(heatCity[5]).assertEqual('南京');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('南京')=${heatCity.indexOf('南京')}, expected=5`);
      expect(heatCity.indexOf('南京')).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[5]=${typeof heatCity[5]}, expected='string'`);
      expect(typeof heatCity[5]).assertEqual('string');
      log('testLocationMockHeatNanjing0169 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0170
     * @tc.name      testLocationMockHeatSuzhou0170
     * @tc.desc      Verify Suzhou is the seventh hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatSuzhou0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatSuzhou0170 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[6]=${heatCity[6]}, expected='苏州'`);
      expect(heatCity[6]).assertEqual('苏州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('苏州')=${heatCity.indexOf('苏州')}, expected=6`);
      expect(heatCity.indexOf('苏州')).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[6]=${typeof heatCity[6]}, expected='string'`);
      expect(typeof heatCity[6]).assertEqual('string');
      log('testLocationMockHeatSuzhou0170 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0171
     * @tc.name      testLocationMockHeatTianjin0171
     * @tc.desc      Verify Tianjin is the eighth hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatTianjin0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatTianjin0171 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[7]=${heatCity[7]}, expected='天津'`);
      expect(heatCity[7]).assertEqual('天津');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('天津')=${heatCity.indexOf('天津')}, expected=7`);
      expect(heatCity.indexOf('天津')).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[7]=${typeof heatCity[7]}, expected='string'`);
      expect(typeof heatCity[7]).assertEqual('string');
      log('testLocationMockHeatTianjin0171 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0172
     * @tc.name      testLocationMockHeatWuhan0172
     * @tc.desc      Verify Wuhan is the ninth hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatWuhan0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatWuhan0172 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[8]=${heatCity[8]}, expected='武汉'`);
      expect(heatCity[8]).assertEqual('武汉');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('武汉')=${heatCity.indexOf('武汉')}, expected=8`);
      expect(heatCity.indexOf('武汉')).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[8]=${typeof heatCity[8]}, expected='string'`);
      expect(typeof heatCity[8]).assertEqual('string');
      log('testLocationMockHeatWuhan0172 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0173
     * @tc.name      testLocationMockHeatChangsha0173
     * @tc.desc      Verify Changsha is the tenth hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatChangsha0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatChangsha0173 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[9]=${heatCity[9]}, expected='长沙'`);
      expect(heatCity[9]).assertEqual('长沙');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('长沙')=${heatCity.indexOf('长沙')}, expected=9`);
      expect(heatCity.indexOf('长沙')).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[9]=${typeof heatCity[9]}, expected='string'`);
      expect(typeof heatCity[9]).assertEqual('string');
      log('testLocationMockHeatChangsha0173 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0174
     * @tc.name      testLocationMockHeatChongqing0174
     * @tc.desc      Verify Chongqing is the eleventh hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatChongqing0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatChongqing0174 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[10]=${heatCity[10]}, expected='重庆'`);
      expect(heatCity[10]).assertEqual('重庆');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.indexOf('重庆')=${heatCity.indexOf('重庆')}`);
      expect(heatCity.indexOf('重庆')).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[10]=${typeof heatCity[10]}`);
      expect(typeof heatCity[10]).assertEqual('string');
      log('testLocationMockHeatChongqing0174 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0175
     * @tc.name      testLocationMockHeatChengdu0175
     * @tc.desc      Verify Chengdu is the twelfth hot city.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatChengdu0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatChengdu0175 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity[11]=${heatCity[11]}, expected='成都'`);
      expect(heatCity[11]).assertEqual('成都');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.length - 1=${heatCity.length - 1}`);
      expect(heatCity.length - 1).assertEqual(heatCity.indexOf('成都'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof heatCity[11]=${typeof heatCity[11]}`);
      expect(typeof heatCity[11]).assertEqual('string');
      log('testLocationMockHeatChengdu0175 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0176
     * @tc.name      testLocationMockProvinceModel0176
     * @tc.desc      Verify the ProvinceWithSubCities model accepts a documented province payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockProvinceModel0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockProvinceModel0176 begin');
      const province: ProvinceWithSubCities = { name: '安徽', city: ['亳州', '安庆'] };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual province.name=${province.name}, expected='安徽'`);
      expect(province.name).assertEqual('安徽');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual province.city.length=${province.city.length}, expected=2`);
      expect(province.city.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof province.name=${typeof province.name}`);
      expect(typeof province.name).assertEqual('string');
      log('testLocationMockProvinceModel0176 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0177
     * @tc.name      testLocationMockFlatItemModel0177
     * @tc.desc      Verify the ListItem model accepts a flat string city payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockFlatItemModel0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockFlatItemModel0177 begin');
      const item: ListItem = { name: 'G', city: ['甘肃', '广东', '广西', '贵州'] };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name=${item.name}, expected='G'`);
      expect(item.name).assertEqual('G');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.city.length=${item.city.length}, expected=4`);
      expect(item.city.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.city[0]=${typeof item.city[0]}`);
      expect(typeof item.city[0]).assertEqual('string');
      log('testLocationMockFlatItemModel0177 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0178
     * @tc.name      testLocationMockNestedItemModel0178
     * @tc.desc      Verify the ListItem model accepts a nested province payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockNestedItemModel0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockNestedItemModel0178 begin');
      const province: ProvinceWithSubCities = { name: '浙江', city: ['宁波', '杭州'] };
      const item: ListItem = { name: 'Z', city: [province] };
      const provinces: ProvinceWithSubCities[] = item.city as ProvinceWithSubCities[];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name=${item.name}, expected='Z'`);
      expect(item.name).assertEqual('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces.length=${provinces.length}, expected=1`);
      expect(provinces.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual provinces[0].name=${provinces[0].name}, expected='浙江'`);
      expect(provinces[0].name).assertEqual('浙江');
      log('testLocationMockNestedItemModel0178 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0179
     * @tc.name      testLocationMockBeijingInProvinces0179
     * @tc.desc      Verify hot city Beijing also appears in the province name collection.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockBeijingInProvinces0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockBeijingInProvinces0179 begin');
      const names: string[] = collectAllCityNames();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue names.indexOf('北京') >= 0=${names.indexOf('北京') >= 0}`);
      expect(names.indexOf('北京') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names.length=${names.length}, expected=41`);
      expect(names.length).assertEqual(41);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof names[0]=${typeof names[0]}, expected='string'`);
      expect(typeof names[0]).assertEqual('string');
      log('testLocationMockBeijingInProvinces0179 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0180
     * @tc.name      testLocationMockGuangzhouNotInList0180
     * @tc.desc      Verify hot city Guangzhou never appears in the province list data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockGuangzhouNotInList0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockGuangzhouNotInList0180 begin');
      const names: string[] = collectAllCityNames();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names.indexOf('广州')=${names.indexOf('广州')}, expected=-1`);
      expect(names.indexOf('广州')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names.length=${names.length}, expected=41`);
      expect(names.length).assertEqual(41);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names.indexOf('深圳')=${names.indexOf('深圳')}, expected=-1`);
      expect(names.indexOf('深圳')).assertEqual(-1);
      log('testLocationMockGuangzhouNotInList0180 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0181
     * @tc.name      testLocationMockHeatCityNonEmpty0181
     * @tc.desc      Verify every hot city name is a non-empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockHeatCityNonEmpty0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockHeatCityNonEmpty0181 begin');
      let allNonEmpty: boolean = true;
      for (const city of heatCity) {
        if (typeof city !== 'string' || city.length === 0) {
          allNonEmpty = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNonEmpty=${allNonEmpty}`);
      expect(allNonEmpty).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual heatCity.length=${heatCity.length}, expected=12`);
      expect(heatCity.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue heatCity[0].length > 0=${heatCity[0].length > 0}`);
      expect(heatCity[0].length > 0).assertTrue();
      log('testLocationMockHeatCityNonEmpty0181 end');
    })

    /**
     * @tc.number    SUB_LOCATION_MOCKDATA_0182
     * @tc.name      testLocationMockAllNamesNonEmpty0182
     * @tc.desc      Verify every city name collected from the province list is non-empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLocationMockAllNamesNonEmpty0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLocationMockAllNamesNonEmpty0182 begin');
      const names: string[] = collectAllCityNames();
      let allNonEmpty: boolean = true;
      for (const name of names) {
        if (typeof name !== 'string' || name.length === 0) {
          allNonEmpty = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNonEmpty=${allNonEmpty}`);
      expect(allNonEmpty).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names.length=${names.length}, expected=41`);
      expect(names.length).assertEqual(41);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue names[0].length > 0=${names[0].length > 0}`);
      expect(names[0].length > 0).assertTrue();
      log('testLocationMockAllNamesNonEmpty0182 end');
    })
  })
}
