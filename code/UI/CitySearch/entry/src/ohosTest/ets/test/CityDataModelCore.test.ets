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
import { AlphabetListItemType, AlphabetListItemView, HotListItemView } from '../../../main/ets/CitySearchTestBridge';

const DOMAIN: number = 0xF811;
const TAG: string = 'CityDataModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

@Builder
function dummyTextBuilder(item: string) {
  Text(item);
}

const DUMMY_BUILDER: WrappedBuilder<[string]> = wrapBuilder(dummyTextBuilder);

export default function cityDataModelCoreTest(): void {
  describe('CityDataModelCoreTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0001
     * @tc.name      CitySearch_CityDataModel_0001
     * @tc.desc      Verify AlphabetListItemType stores name and single-item list correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0001 begin');
      const item: AlphabetListItemType = new AlphabetListItemType('A', ['阿尔山']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name=${item.name}, expected='A'`);
      expect(item.name).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList.length=${item.dataList.length}, expected=1`);
      expect(item.dataList.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList[0]=${item.dataList[0]}, expected='阿尔山'`);
      expect(item.dataList[0]).assertEqual('阿尔山');
      log('CitySearch_CityDataModel_0001 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0002
     * @tc.name      CitySearch_CityDataModel_0002
     * @tc.desc      Verify AlphabetListItemType stores a multi-item list in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0002 begin');
      const item: AlphabetListItemType = new AlphabetListItemType('B', ['北京', '亳州', '包头']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList.length=${item.dataList.length}, expected=3`);
      expect(item.dataList.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList[0]=${item.dataList[0]}, expected='北京'`);
      expect(item.dataList[0]).assertEqual('北京');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList[1]=${item.dataList[1]}, expected='亳州'`);
      expect(item.dataList[1]).assertEqual('亳州');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList[2]=${item.dataList[2]}, expected='包头'`);
      expect(item.dataList[2]).assertEqual('包头');
      log('CitySearch_CityDataModel_0002 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0003
     * @tc.name      CitySearch_CityDataModel_0003
     * @tc.desc      Verify AlphabetListItemType accepts an empty list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0003 begin');
      const item: AlphabetListItemType = new AlphabetListItemType('C', []);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name=${item.name}, expected='C'`);
      expect(item.name).assertEqual('C');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList.length=${item.dataList.length}, expected=0`);
      expect(item.dataList.length).assertEqual(0);
      log('CitySearch_CityDataModel_0003 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0004
     * @tc.name      CitySearch_CityDataModel_0004
     * @tc.desc      Verify AlphabetListItemType accepts an empty name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0004 begin');
      const item: AlphabetListItemType = new AlphabetListItemType('', ['安庆']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name=${item.name}, expected=''`);
      expect(item.name).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList.length=${item.dataList.length}, expected=1`);
      expect(item.dataList.length).assertEqual(1);
      log('CitySearch_CityDataModel_0004 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0005
     * @tc.name      CitySearch_CityDataModel_0005
     * @tc.desc      Verify AlphabetListItemType name field is writable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0005 begin');
      const item: AlphabetListItemType = new AlphabetListItemType('A', ['安阳']);
      item.name = 'F';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name=${item.name}, expected='F'`);
      expect(item.name).assertEqual('F');
      log('CitySearch_CityDataModel_0005 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0006
     * @tc.name      CitySearch_CityDataModel_0006
     * @tc.desc      Verify AlphabetListItemType list supports append after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0006 begin');
      const item: AlphabetListItemType = new AlphabetListItemType('J', ['济南']);
      item.dataList.push('九江');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList.length=${item.dataList.length}, expected=2`);
      expect(item.dataList.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList[1]=${item.dataList[1]}, expected='九江'`);
      expect(item.dataList[1]).assertEqual('九江');
      log('CitySearch_CityDataModel_0006 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0007
     * @tc.name      CitySearch_CityDataModel_0007
     * @tc.desc      Verify AlphabetListItemType name field keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0007 begin');
      const item: AlphabetListItemType = new AlphabetListItemType('H', ['合肥']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.name=${typeof item.name}, expected='string'`);
      expect(typeof item.name).assertEqual('string');
      log('CitySearch_CityDataModel_0007 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0008
     * @tc.name      CitySearch_CityDataModel_0008
     * @tc.desc      Verify AlphabetListItemType dataList field is a real array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0008 begin');
      const item: AlphabetListItemType = new AlphabetListItemType('H', ['杭州']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.dataList=${typeof item.dataList}`);
      expect(typeof item.dataList).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(item.dataList)=${Array.isArray(item.dataList)}`);
      expect(Array.isArray(item.dataList)).assertTrue();
      log('CitySearch_CityDataModel_0008 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0009
     * @tc.name      CitySearch_CityDataModel_0009
     * @tc.desc      Verify two AlphabetListItemType instances keep independent lists.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0009 begin');
      const first: AlphabetListItemType = new AlphabetListItemType('N', ['南京']);
      const second: AlphabetListItemType = new AlphabetListItemType('N', ['南昌']);
      second.dataList.push('宁波');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.dataList.length=${first.dataList.length}, expected=1`);
      expect(first.dataList.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.dataList.length=${second.dataList.length}, expected=2`);
      expect(second.dataList.length).assertEqual(2);
      log('CitySearch_CityDataModel_0009 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0010
     * @tc.name      CitySearch_CityDataModel_0010
     * @tc.desc      Verify AlphabetListItemType holds a large list without truncation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0010 begin');
      const large: string[] = [];
      for (let i: number = 0; i < 100; i++) {
        large.push('城市' + i);
      }
      const item: AlphabetListItemType = new AlphabetListItemType('Z', large);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList.length=${item.dataList.length}, expected=100`);
      expect(item.dataList.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.dataList[99]=${item.dataList[99]}, expected='城市99'`);
      expect(item.dataList[99]).assertEqual('城市99');
      log('CitySearch_CityDataModel_0010 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0011
     * @tc.name      CitySearch_CityDataModel_0011
     * @tc.desc      Verify AlphabetListItemView exposes its inner alphabet item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0011 begin');
      const inner: AlphabetListItemType = new AlphabetListItemType('A', ['阿尔山']);
      const view: AlphabetListItemView = new AlphabetListItemView(inner, DUMMY_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.alphabetListItem.name=${view.alphabetListItem.name}`);
      expect(view.alphabetListItem.name).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${view.alphabetListItem.dataList[0]}, expected='阿尔山'`);
      expect(view.alphabetListItem.dataList[0]).assertEqual('阿尔山');
      log('CitySearch_CityDataModel_0011 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0012
     * @tc.name      CitySearch_CityDataModel_0012
     * @tc.desc      Verify AlphabetListItemView contentBuilder is an object wrapper.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0012 begin');
      const inner: AlphabetListItemType = new AlphabetListItemType('B', ['北京']);
      const view: AlphabetListItemView = new AlphabetListItemView(inner, DUMMY_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof view.contentBuilder=${typeof view.contentBuilder}`);
      expect(typeof view.contentBuilder).assertEqual('object');
      log('CitySearch_CityDataModel_0012 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0013
     * @tc.name      CitySearch_CityDataModel_0013
     * @tc.desc      Verify AlphabetListItemView shares list by reference with inner item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0013 begin');
      const inner: AlphabetListItemType = new AlphabetListItemType('C', ['重庆']);
      const view: AlphabetListItemView = new AlphabetListItemView(inner, DUMMY_BUILDER);
      inner.dataList.push('成都');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${view.alphabetListItem.dataList.length}, expected=2`);
      expect(view.alphabetListItem.dataList.length).assertEqual(2);
      log('CitySearch_CityDataModel_0013 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0014
     * @tc.name      CitySearch_CityDataModel_0014
     * @tc.desc      Verify two views holding the same inner item observe the same name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0014 begin');
      const inner: AlphabetListItemType = new AlphabetListItemType('F', ['福州']);
      const first: AlphabetListItemView = new AlphabetListItemView(inner, DUMMY_BUILDER);
      const second: AlphabetListItemView = new AlphabetListItemView(inner, DUMMY_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.alphabetListItem.name=${first.alphabetListItem.name}`);
      expect(first.alphabetListItem.name).assertEqual(second.alphabetListItem.name);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${first.alphabetListItem === second.alphabetListItem}`);
      expect(first.alphabetListItem === second.alphabetListItem).assertTrue();
      log('CitySearch_CityDataModel_0014 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0015
     * @tc.name      CitySearch_CityDataModel_0015
     * @tc.desc      Verify AlphabetListItemView alphabetListItem field is writable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0015 begin');
      const first: AlphabetListItemType = new AlphabetListItemType('G', ['广州']);
      const replacement: AlphabetListItemType = new AlphabetListItemType('S', ['上海']);
      const view: AlphabetListItemView = new AlphabetListItemView(first, DUMMY_BUILDER);
      view.alphabetListItem = replacement;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.alphabetListItem.name=${view.alphabetListItem.name}`);
      expect(view.alphabetListItem.name).assertEqual('S');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${view.alphabetListItem.dataList[0]}, expected='上海'`);
      expect(view.alphabetListItem.dataList[0]).assertEqual('上海');
      log('CitySearch_CityDataModel_0015 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0016
     * @tc.name      CitySearch_CityDataModel_0016
     * @tc.desc      Verify AlphabetListItemView contentBuilder field is writable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0016 begin');
      const inner: AlphabetListItemType = new AlphabetListItemType('J', ['济南']);
      const view: AlphabetListItemView = new AlphabetListItemView(inner, DUMMY_BUILDER);
      view.contentBuilder = DUMMY_BUILDER;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof view.contentBuilder=${typeof view.contentBuilder}`);
      expect(typeof view.contentBuilder).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${view.contentBuilder === DUMMY_BUILDER}`);
      expect(view.contentBuilder === DUMMY_BUILDER).assertTrue();
      log('CitySearch_CityDataModel_0016 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0017
     * @tc.name      CitySearch_CityDataModel_0017
     * @tc.desc      Verify contentBuilder exposes a callable builder function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0017 begin');
      const inner: AlphabetListItemType = new AlphabetListItemType('L', ['兰州']);
      const view: AlphabetListItemView = new AlphabetListItemView(inner, DUMMY_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof view.contentBuilder.builder}`);
      expect(typeof view.contentBuilder.builder).assertEqual('function');
      log('CitySearch_CityDataModel_0017 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0018
     * @tc.name      CitySearch_CityDataModel_0018
     * @tc.desc      Verify HotListItemView stores its hot city name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0018 begin');
      const view: HotListItemView = new HotListItemView('北京', DUMMY_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.hotListItem=${view.hotListItem}, expected='北京'`);
      expect(view.hotListItem).assertEqual('北京');
      log('CitySearch_CityDataModel_0018 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0019
     * @tc.name      CitySearch_CityDataModel_0019
     * @tc.desc      Verify HotListItemView contentBuilder is an object wrapper.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0019 begin');
      const view: HotListItemView = new HotListItemView('上海', DUMMY_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof view.contentBuilder=${typeof view.contentBuilder}`);
      expect(typeof view.contentBuilder).assertEqual('object');
      log('CitySearch_CityDataModel_0019 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0020
     * @tc.name      CitySearch_CityDataModel_0020
     * @tc.desc      Verify HotListItemView hotListItem field is writable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0020 begin');
      const view: HotListItemView = new HotListItemView('广州', DUMMY_BUILDER);
      view.hotListItem = '深圳';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.hotListItem=${view.hotListItem}, expected='深圳'`);
      expect(view.hotListItem).assertEqual('深圳');
      log('CitySearch_CityDataModel_0020 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0021
     * @tc.name      CitySearch_CityDataModel_0021
     * @tc.desc      Verify HotListItemView contentBuilder exposes a callable builder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0021 begin');
      const view: HotListItemView = new HotListItemView('杭州', DUMMY_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof view.contentBuilder.builder}`);
      expect(typeof view.contentBuilder.builder).assertEqual('function');
      log('CitySearch_CityDataModel_0021 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0022
     * @tc.name      CitySearch_CityDataModel_0022
     * @tc.desc      Verify two HotListItemView instances stay independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0022 begin');
      const first: HotListItemView = new HotListItemView('南京', DUMMY_BUILDER);
      const second: HotListItemView = new HotListItemView('苏州', DUMMY_BUILDER);
      second.hotListItem = '天津';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.hotListItem=${first.hotListItem}, expected='南京'`);
      expect(first.hotListItem).assertEqual('南京');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.hotListItem=${second.hotListItem}, expected='天津'`);
      expect(second.hotListItem).assertEqual('天津');
      log('CitySearch_CityDataModel_0022 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0023
     * @tc.name      CitySearch_CityDataModel_0023
     * @tc.desc      Verify HotListItemView accepts an empty city name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0023 begin');
      const view: HotListItemView = new HotListItemView('', DUMMY_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.hotListItem=${view.hotListItem}, expected=''`);
      expect(view.hotListItem).assertEqual('');
      log('CitySearch_CityDataModel_0023 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_CITYDATAMODEL_0024
     * @tc.name      CitySearch_CityDataModel_0024
     * @tc.desc      Verify HotListItemView keeps string type for long names.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CityDataModel_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('CitySearch_CityDataModel_0024 begin');
      const longName: string = '城市名称测试'.repeat(20);
      const view: HotListItemView = new HotListItemView(longName, DUMMY_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.hotListItem=${view.hotListItem}, expected=longName`);
      expect(view.hotListItem).assertEqual(longName);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof view.hotListItem=${typeof view.hotListItem}`);
      expect(typeof view.hotListItem).assertEqual('string');
      log('CitySearch_CityDataModel_0024 end');
    })
  })
}
