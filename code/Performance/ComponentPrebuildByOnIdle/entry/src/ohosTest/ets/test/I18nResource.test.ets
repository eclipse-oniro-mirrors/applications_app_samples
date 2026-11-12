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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  avatarData,
  furnitureData,
  goodsData,
  natureData,
  travelData
} from '@ohos/customreusablepool/src/main/ets/data/MockData';
import { TitleDataSource } from '@ohos/customreusablepool/src/main/ets/data/TitleDataSource';
import { WaterFlowDataSource } from '@ohos/customreusablepool/src/main/ets/data/WaterFlowDataSource';
import { ViewItem } from '@ohos/customreusablepool/src/main/ets/data/ViewItem';
import { Constants } from '@ohos/customreusablepool/src/main/ets/constants/Constants';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_I18nResource]';

function makeItem(id: string, type: number): ViewItem {
  const item: ViewItem = new ViewItem();
  item.id = id;
  item.name = 'name_' + id;
  item.des = 'des_' + id;
  item.type = type;
  item.image = 'image_' + id;
  return item;
}

function mockDataOf(selector: number): ViewItem[] {
  if (selector === 1) {
    return goodsData();
  } else if (selector === 2) {
    return travelData();
  } else if (selector === 3) {
    return avatarData();
  } else if (selector === 4) {
    return natureData();
  }
  return furnitureData();
}

@Builder
function poolProbeBuilder(data: ESObject) {
}

const POOL_BUILDER: WrappedBuilder<ESObject> = wrapBuilder<ESObject>(poolProbeBuilder);

class PoolProbeItem {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}


export default function I18nResourceTest() {
  describe('I18nResourceTest', () => {
  describe('i18nConstants', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_I18N_0001
     * @tc.name testI18nConstants0001
     * @tc.desc Verify i18n resource behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testI18nConstants0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nConstants0001 begin');
      const index: number = 0;
      const expected: string[] = ['首页', '风景', '商品', '旅游', '头像'];
      const actual: string[] = [Constants.HOME, Constants.FILM, Constants.TELEPLAY, Constants.ANIMATION, Constants.SPORT];
      const ci: number = index % expected.length;
      expect(actual[ci]).assertEqual(expected[ci]);
      expect(actual[ci].length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nConstants0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_I18N_0064
     * @tc.name testI18nConstants0064
     * @tc.desc Verify i18n resource behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testI18nConstants0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nConstants0064 begin');
      const index: number = 63;
      const expected: string[] = ['首页', '风景', '商品', '旅游', '头像'];
      const actual: string[] = [Constants.HOME, Constants.FILM, Constants.TELEPLAY, Constants.ANIMATION, Constants.SPORT];
      const ci: number = index % expected.length;
      expect(actual[ci]).assertEqual(expected[ci]);
      expect(actual[ci].length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nConstants0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_I18N_0001
     * @tc.name testI18nImage0001
     * @tc.desc Verify i18n resource behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testI18nImage0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nImage0001 begin');
      const index: number = 0;
      const selector: number = index % 5;
      const data: ViewItem[] = mockDataOf(selector);
      const target: number = index % 100;
      expect(data[target].image !== undefined).assertTrue();
      expect(typeof data[target].image === 'object').assertTrue();
      expect(data[target].name.indexOf('\n')).assertEqual(-1);
      expect(data[target].name.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nImage0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_I18N_0064
     * @tc.name testI18nImage0064
     * @tc.desc Verify i18n resource behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testI18nImage0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nImage0064 begin');
      const index: number = 63;
      const selector: number = index % 5;
      const data: ViewItem[] = mockDataOf(selector);
      const target: number = index % 100;
      expect(data[target].image !== undefined).assertTrue();
      expect(typeof data[target].image === 'object').assertTrue();
      expect(data[target].name.indexOf('\n')).assertEqual(-1);
      expect(data[target].name.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nImage0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_I18N_0001
     * @tc.name testI18nTitle0001
     * @tc.desc Verify i18n resource behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testI18nTitle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nTitle0001 begin');
      const index: number = 0;
      const data: TitleDataSource = new TitleDataSource();
      const samples: string[] = ['首页', '风景', '商品', '旅游', '头像'];
      data.addItem(samples[index % samples.length]);
      expect(data.getData(0)).assertEqual(samples[index % samples.length]);
      expect(data.getData(0).length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nTitle0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_I18N_0064
     * @tc.name testI18nTitle0064
     * @tc.desc Verify i18n resource behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testI18nTitle0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nTitle0064 begin');
      const index: number = 63;
      const data: TitleDataSource = new TitleDataSource();
      const samples: string[] = ['首页', '风景', '商品', '旅游', '头像'];
      data.addItem(samples[index % samples.length]);
      expect(data.getData(0)).assertEqual(samples[index % samples.length]);
      expect(data.getData(0).length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nTitle0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_I18N_0001
     * @tc.name testI18nWaterFlow0001
     * @tc.desc Verify i18n resource behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testI18nWaterFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nWaterFlow0001 begin');
      const index: number = 0;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const item: ViewItem = makeItem('i18n_' + index, index % 2);
      item.name = '名称_' + index;
      item.des = '描述_' + index;
      data.addItems([item]);
      expect(data.getData(0).name).assertEqual('名称_' + index);
      expect(data.getData(0).des).assertEqual('描述_' + index);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nWaterFlow0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_I18N_0064
     * @tc.name testI18nWaterFlow0064
     * @tc.desc Verify i18n resource behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testI18nWaterFlow0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nWaterFlow0064 begin');
      const index: number = 63;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const item: ViewItem = makeItem('i18n_' + index, index % 2);
      item.name = '名称_' + index;
      item.des = '描述_' + index;
      data.addItems([item]);
      expect(data.getData(0).name).assertEqual('名称_' + index);
      expect(data.getData(0).des).assertEqual('描述_' + index);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nWaterFlow0064 end');
    });


  });
  });
}
