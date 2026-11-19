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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AlphabetListItemType, CITY_DATA, HOT_CITY } from '../../../main/ets/CitySearchTestBridge';

const DOMAIN: number = 0xF811;
const TAG: string = 'CityDataIntegrityCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function findGroup(name: string): AlphabetListItemType | undefined {
  for (const group of CITY_DATA) {
    if (group.name === name) {
      return group;
    }
  }
  return undefined;
}

export default function cityDataIntegrityCoreTest(): void {
  describe('CityDataIntegrityCoreTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0101
     * @tc.name      CitySearch_CityDataIntegrity_0101
     * @tc.desc      Verify group A holds four A-cities starting with 阿尔山.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0101 begin');
      const group: AlphabetListItemType | undefined = findGroup('A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='A'`);
      expect(group!.name).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=4`);
      expect(group!.dataList.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='阿尔山'`);
      expect(group!.dataList[0]).assertEqual('阿尔山');
      log('CitySearch_CityDataIntegrity_0101 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0102
     * @tc.name      CitySearch_CityDataIntegrity_0102
     * @tc.desc      Verify group B holds four B-cities starting with 北京.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0102 begin');
      const group: AlphabetListItemType | undefined = findGroup('B');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='B'`);
      expect(group!.name).assertEqual('B');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=4`);
      expect(group!.dataList.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='北京'`);
      expect(group!.dataList[0]).assertEqual('北京');
      log('CitySearch_CityDataIntegrity_0102 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0103
     * @tc.name      CitySearch_CityDataIntegrity_0103
     * @tc.desc      Verify group C holds four C-cities starting with 重庆.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0103 begin');
      const group: AlphabetListItemType | undefined = findGroup('C');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='C'`);
      expect(group!.name).assertEqual('C');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=4`);
      expect(group!.dataList.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='重庆'`);
      expect(group!.dataList[0]).assertEqual('重庆');
      log('CitySearch_CityDataIntegrity_0103 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0104
     * @tc.name      CitySearch_CityDataIntegrity_0104
     * @tc.desc      Verify group F holds four F-cities starting with 福州.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0104 begin');
      const group: AlphabetListItemType | undefined = findGroup('F');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='F'`);
      expect(group!.name).assertEqual('F');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=4`);
      expect(group!.dataList.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='福州'`);
      expect(group!.dataList[0]).assertEqual('福州');
      log('CitySearch_CityDataIntegrity_0104 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0105
     * @tc.name      CitySearch_CityDataIntegrity_0105
     * @tc.desc      Verify group G holds four G-cities starting with 广州.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0105 begin');
      const group: AlphabetListItemType | undefined = findGroup('G');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='G'`);
      expect(group!.name).assertEqual('G');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=4`);
      expect(group!.dataList.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='广州'`);
      expect(group!.dataList[0]).assertEqual('广州');
      log('CitySearch_CityDataIntegrity_0105 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0106
     * @tc.name      CitySearch_CityDataIntegrity_0106
     * @tc.desc      Verify group H holds six H-cities starting with 哈尔滨.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0106 begin');
      const group: AlphabetListItemType | undefined = findGroup('H');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='H'`);
      expect(group!.name).assertEqual('H');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=6`);
      expect(group!.dataList.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='哈尔滨'`);
      expect(group!.dataList[0]).assertEqual('哈尔滨');
      log('CitySearch_CityDataIntegrity_0106 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0107
     * @tc.name      CitySearch_CityDataIntegrity_0107
     * @tc.desc      Verify group J holds three J-cities starting with 济南.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0107 begin');
      const group: AlphabetListItemType | undefined = findGroup('J');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='J'`);
      expect(group!.name).assertEqual('J');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=3`);
      expect(group!.dataList.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='济南'`);
      expect(group!.dataList[0]).assertEqual('济南');
      log('CitySearch_CityDataIntegrity_0107 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0108
     * @tc.name      CitySearch_CityDataIntegrity_0108
     * @tc.desc      Verify group L holds three L-cities starting with 兰州.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0108 begin');
      const group: AlphabetListItemType | undefined = findGroup('L');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='L'`);
      expect(group!.name).assertEqual('L');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=3`);
      expect(group!.dataList.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='兰州'`);
      expect(group!.dataList[0]).assertEqual('兰州');
      log('CitySearch_CityDataIntegrity_0108 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0109
     * @tc.name      CitySearch_CityDataIntegrity_0109
     * @tc.desc      Verify group N holds three N-cities starting with 南昌.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0109 begin');
      const group: AlphabetListItemType | undefined = findGroup('N');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='N'`);
      expect(group!.name).assertEqual('N');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=3`);
      expect(group!.dataList.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='南昌'`);
      expect(group!.dataList[0]).assertEqual('南昌');
      log('CitySearch_CityDataIntegrity_0109 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0110
     * @tc.name      CitySearch_CityDataIntegrity_0110
     * @tc.desc      Verify group Q holds three Q-cities starting with 青岛.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0110 begin');
      const group: AlphabetListItemType | undefined = findGroup('Q');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='Q'`);
      expect(group!.name).assertEqual('Q');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=3`);
      expect(group!.dataList.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='青岛'`);
      expect(group!.dataList[0]).assertEqual('青岛');
      log('CitySearch_CityDataIntegrity_0110 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0111
     * @tc.name      CitySearch_CityDataIntegrity_0111
     * @tc.desc      Verify group S holds seven S-cities starting with 上海.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0111 begin');
      const group: AlphabetListItemType | undefined = findGroup('S');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='S'`);
      expect(group!.name).assertEqual('S');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=7`);
      expect(group!.dataList.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='上海'`);
      expect(group!.dataList[0]).assertEqual('上海');
      log('CitySearch_CityDataIntegrity_0111 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0112
     * @tc.name      CitySearch_CityDataIntegrity_0112
     * @tc.desc      Verify group T holds six T-cities starting with 天津.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0112 begin');
      const group: AlphabetListItemType | undefined = findGroup('T');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='T'`);
      expect(group!.name).assertEqual('T');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=6`);
      expect(group!.dataList.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='天津'`);
      expect(group!.dataList[0]).assertEqual('天津');
      log('CitySearch_CityDataIntegrity_0112 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0113
     * @tc.name      CitySearch_CityDataIntegrity_0113
     * @tc.desc      Verify group W holds five W-cities starting with 武汉.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0113 begin');
      const group: AlphabetListItemType | undefined = findGroup('W');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='W'`);
      expect(group!.name).assertEqual('W');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=5`);
      expect(group!.dataList.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='武汉'`);
      expect(group!.dataList[0]).assertEqual('武汉');
      log('CitySearch_CityDataIntegrity_0113 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0114
     * @tc.name      CitySearch_CityDataIntegrity_0114
     * @tc.desc      Verify group X holds seven X-cities starting with 西安.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0114 begin');
      const group: AlphabetListItemType | undefined = findGroup('X');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='X'`);
      expect(group!.name).assertEqual('X');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=7`);
      expect(group!.dataList.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='西安'`);
      expect(group!.dataList[0]).assertEqual('西安');
      log('CitySearch_CityDataIntegrity_0114 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0115
     * @tc.name      CitySearch_CityDataIntegrity_0115
     * @tc.desc      Verify group Y holds six Y-cities starting with 银川.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0115 begin');
      const group: AlphabetListItemType | undefined = findGroup('Y');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='Y'`);
      expect(group!.name).assertEqual('Y');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}, expected=6`);
      expect(group!.dataList.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='银川'`);
      expect(group!.dataList[0]).assertEqual('银川');
      log('CitySearch_CityDataIntegrity_0115 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0116
     * @tc.name      CitySearch_CityDataIntegrity_0116
     * @tc.desc      Verify group Z holds eighteen Z-cities starting with 郑州.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0116 begin');
      const group: AlphabetListItemType | undefined = findGroup('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse group === undefined=${group === undefined}`);
      expect(group === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.name=${group!.name}, expected='Z'`);
      expect(group!.name).assertEqual('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList.length=${group!.dataList.length}`);
      expect(group!.dataList.length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual group!.dataList[0]=${group!.dataList[0]}, expected='郑州'`);
      expect(group!.dataList[0]).assertEqual('郑州');
      log('CitySearch_CityDataIntegrity_0116 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0117
     * @tc.name      CitySearch_CityDataIntegrity_0117
     * @tc.desc      Verify CITY_DATA exposes exactly sixteen alphabet groups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0117 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CITY_DATA.length=${CITY_DATA.length}, expected=16`);
      expect(CITY_DATA.length).assertEqual(16);
      log('CitySearch_CityDataIntegrity_0117 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0118
     * @tc.name      CitySearch_CityDataIntegrity_0118
     * @tc.desc      Verify every group name is one uppercase letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0118 begin');
      let allSingleUppercase: boolean = true;
      for (const group of CITY_DATA) {
        if (!/^[A-Z]$/.test(group.name)) {
          allSingleUppercase = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allSingleUppercase=${allSingleUppercase}`);
      expect(allSingleUppercase).assertTrue();
      log('CitySearch_CityDataIntegrity_0118 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0119
     * @tc.name      CitySearch_CityDataIntegrity_0119
     * @tc.desc      Verify no duplicated alphabet group names exist.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0119 begin');
      const names: Set<string> = new Set<string>();
      for (const group of CITY_DATA) {
        names.add(group.name);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names.size=${names.size}, expected=CITY_DATA.length`);
      expect(names.size).assertEqual(CITY_DATA.length);
      log('CitySearch_CityDataIntegrity_0119 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0120
     * @tc.name      CitySearch_CityDataIntegrity_0120
     * @tc.desc      Verify every alphabet group has a non-empty city list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0120 begin');
      let allNonEmpty: boolean = true;
      for (const group of CITY_DATA) {
        if (group.dataList.length === 0) {
          allNonEmpty = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNonEmpty=${allNonEmpty}`);
      expect(allNonEmpty).assertTrue();
      log('CitySearch_CityDataIntegrity_0120 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0121
     * @tc.name      CitySearch_CityDataIntegrity_0121
     * @tc.desc      Verify total city count across all groups is 87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0121 begin');
      let total: number = 0;
      for (const group of CITY_DATA) {
        total += group.dataList.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual total=${total}, expected=87`);
      expect(total).assertEqual(87);
      log('CitySearch_CityDataIntegrity_0121 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0122
     * @tc.name      CitySearch_CityDataIntegrity_0122
     * @tc.desc      Verify every stored city name is a non-empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0122 begin');
      let allNamed: boolean = true;
      for (const group of CITY_DATA) {
        for (const city of group.dataList) {
          if (city.length === 0 || typeof city !== 'string') {
            allNamed = false;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNamed=${allNamed}`);
      expect(allNamed).assertTrue();
      log('CitySearch_CityDataIntegrity_0122 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0123
     * @tc.name      CitySearch_CityDataIntegrity_0123
     * @tc.desc      Verify CITY_DATA is a stable module-level reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0123 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue CITY_DATA === CITY_DATA=${CITY_DATA === CITY_DATA}`);
      expect(CITY_DATA === CITY_DATA).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CITY_DATA.length=${CITY_DATA.length}, expected=16`);
      expect(CITY_DATA.length).assertEqual(16);
      log('CitySearch_CityDataIntegrity_0123 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0124
     * @tc.name      CitySearch_CityDataIntegrity_0124
     * @tc.desc      Verify CITY_DATA is a real array object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0124 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof CITY_DATA=${typeof CITY_DATA}, expected='object'`);
      expect(typeof CITY_DATA).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(CITY_DATA)=${Array.isArray(CITY_DATA)}`);
      expect(Array.isArray(CITY_DATA)).assertTrue();
      log('CitySearch_CityDataIntegrity_0124 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0125
     * @tc.name      CitySearch_CityDataIntegrity_0125
     * @tc.desc      Verify HOT_CITY exposes exactly twelve hot cities.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0125 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual HOT_CITY.length=${HOT_CITY.length}, expected=12`);
      expect(HOT_CITY.length).assertEqual(12);
      log('CitySearch_CityDataIntegrity_0125 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0126
     * @tc.name      CitySearch_CityDataIntegrity_0126
     * @tc.desc      Verify HOT_CITY starts with 北京 and ends with 成都.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0126 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual HOT_CITY[0]=${HOT_CITY[0]}, expected='北京'`);
      expect(HOT_CITY[0]).assertEqual('北京');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${HOT_CITY[HOT_CITY.length - 1]}, expected='成都'`);
      expect(HOT_CITY[HOT_CITY.length - 1]).assertEqual('成都');
      log('CitySearch_CityDataIntegrity_0126 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0127
     * @tc.name      CitySearch_CityDataIntegrity_0127
     * @tc.desc      Verify HOT_CITY contains no duplicated city names.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0127 begin');
      const names: Set<string> = new Set<string>();
      for (const city of HOT_CITY) {
        names.add(city);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names.size=${names.size}, expected=HOT_CITY.length`);
      expect(names.size).assertEqual(HOT_CITY.length);
      log('CitySearch_CityDataIntegrity_0127 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0128
     * @tc.name      CitySearch_CityDataIntegrity_0128
     * @tc.desc      Verify every hot city exists in the full city data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0128 begin');
      let allCovered: boolean = true;
      for (const hotCity of HOT_CITY) {
        let found: boolean = false;
        for (const group of CITY_DATA) {
          if (group.dataList.includes(hotCity)) {
            found = true;
          }
        }
        if (!found) {
          allCovered = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allCovered=${allCovered}`);
      expect(allCovered).assertTrue();
      log('CitySearch_CityDataIntegrity_0128 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0129
     * @tc.name      CitySearch_CityDataIntegrity_0129
     * @tc.desc      Verify HOT_CITY is a real array object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0129 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof HOT_CITY=${typeof HOT_CITY}, expected='object'`);
      expect(typeof HOT_CITY).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(HOT_CITY)=${Array.isArray(HOT_CITY)}`);
      expect(Array.isArray(HOT_CITY)).assertTrue();
      log('CitySearch_CityDataIntegrity_0129 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAINTEGRITY_0130
     * @tc.name      CitySearch_CityDataIntegrity_0130
     * @tc.desc      Verify the first four hot cities follow the documented order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataIntegrity_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataIntegrity_0130 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual HOT_CITY[0]=${HOT_CITY[0]}, expected='北京'`);
      expect(HOT_CITY[0]).assertEqual('北京');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual HOT_CITY[1]=${HOT_CITY[1]}, expected='上海'`);
      expect(HOT_CITY[1]).assertEqual('上海');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual HOT_CITY[2]=${HOT_CITY[2]}, expected='广州'`);
      expect(HOT_CITY[2]).assertEqual('广州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual HOT_CITY[3]=${HOT_CITY[3]}, expected='深圳'`);
      expect(HOT_CITY[3]).assertEqual('深圳');
      log('CitySearch_CityDataIntegrity_0130 end');
    })
  })
}
