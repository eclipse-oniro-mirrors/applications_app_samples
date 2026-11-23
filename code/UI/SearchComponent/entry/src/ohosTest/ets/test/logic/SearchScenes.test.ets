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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SceneModuleInfo } from '../../../../main/ets/bridge/SearchComponentBridge';
import { searchScenes } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for searchScenes (92 cases). */
export default function searchScenesTest(): void {
  describe('SearchScenesTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0001
     * @tc.name      SearchComponent_SearchScenes_0001
     * @tc.desc      searchScenes(value="Hello", category="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchScenes_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchScenes_0001 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', '');
      logInfo(`searchScenes(value="Hello", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0002
     * @tc.name      SearchComponent_SearchScenes_0002
     * @tc.desc      searchScenes(value=" ", category="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchScenes_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchScenes_0002 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', '');
      logInfo(`searchScenes(value=" ", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`searchScenes(value=" ", category=""): actual[0].name=${actual[0].name}`);
      expect(actual[0].name).assertEqual('XComponent + Vsync \u5b9e\u73b0\u81ea\u5b9a\u4e49\u52a8\u753b');
      logInfo(`searchScenes(value=" ", category=""): actual[0].appUri=${actual[0].appUri}`);
      expect(actual[0].appUri).assertEqual('xcomponentvsync/XcomponentVsync');
      logInfo(`searchScenes(value=" ", category=""): actual[0].param=${actual[0].param}`);
      expect(actual[0].param).assertEqual('');
      logInfo(`searchScenes(value=" ", category=""): actual[0].ratingNumber=${actual[0].ratingNumber}`);
      expect(actual[0].ratingNumber).assertEqual(4);
      logInfo(`searchScenes(value=" ", category=""): actual[0].category=${actual[0].category}`);
      expect(actual[0].category).assertEqual('Native');
      logInfo(`searchScenes(value=" ", category=""): actual[0].serialNumber=${actual[0].serialNumber}`);
      expect(actual[0].serialNumber).assertEqual(97);
      logInfo(`searchScenes(value=" ", category=""): actual[0].swiperImage=${actual[0].swiperImage}`);
      expect(actual[0].swiperImage).assertEqual('');
      logInfo(`${BUNDLE}SearchScenes_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0003
     * @tc.name      SearchComponent_SearchScenes_0003
     * @tc.desc      searchScenes(value="A", category="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0003 begin`);
      const actual: SceneModuleInfo[] = searchScenes('A', '');
      logInfo(`searchScenes(value="A", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(26);
      logInfo(`searchScenes(value="A", category=""): actual[0].name=${actual[0].name}`);
      expect(actual[0].name).assertEqual('MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b');
      logInfo(`searchScenes(value="A", category=""): actual[0].appUri=${actual[0].appUri}`);
      expect(actual[0].appUri).assertEqual('barchart/BarChartPage');
      logInfo(`searchScenes(value="A", category=""): actual[0].param=${actual[0].param}`);
      expect(actual[0].param).assertEqual('');
      logInfo(`searchScenes(value="A", category=""): actual[0].ratingNumber=${actual[0].ratingNumber}`);
      expect(actual[0].ratingNumber).assertEqual(1);
      logInfo(`searchScenes(value="A", category=""): actual[0].category=${actual[0].category}`);
      expect(actual[0].category).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`searchScenes(value="A", category=""): actual[0].serialNumber=${actual[0].serialNumber}`);
      expect(actual[0].serialNumber).assertEqual(4);
      logInfo(`searchScenes(value="A", category=""): actual[0].swiperImage=${actual[0].swiperImage}`);
      expect(actual[0].swiperImage).assertEqual('');
      logInfo(`${BUNDLE}SearchScenes_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0004
     * @tc.name      SearchComponent_SearchScenes_0004
     * @tc.desc      searchScenes(value="abc", category="") returns "UI??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0004 begin`);
      const actual: SceneModuleInfo[] = searchScenes('abc', '');
      logInfo(`searchScenes(value="abc", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`searchScenes(value="abc", category=""): actual[0].name.length=${actual[0].name.length}`);
      expect(actual[0].name.length).assertEqual(33);
      logInfo(`searchScenes(value="abc", category=""): actual[0].name.substring(...${actual[0].name.substring(0, 21)}`);
      expect(actual[0].name.substring(0, 21)).assertEqual('tabContent\u5185\u5bb9\u53ef\u4ee5\u5728tabBar');
      logInfo(`searchScenes(value="abc", category=""): actual[0].name.substring(27)=${actual[0].name.substring(27)}`);
      expect(actual[0].name.substring(27)).assertEqual('\u6ed1\u52a8\u4e8b\u4ef6\u6848\u4f8b');
      logInfo(`searchScenes(value="abc", category=""): actual[0].appUri=${actual[0].appUri}`);
      expect(actual[0].appUri).assertEqual('tabcontentoverflow/TabContentOverFlow');
      logInfo(`searchScenes(value="abc", category=""): actual[0].param=${actual[0].param}`);
      expect(actual[0].param).assertEqual('');
      logInfo(`searchScenes(value="abc", category=""): actual[0].ratingNumber=${actual[0].ratingNumber}`);
      expect(actual[0].ratingNumber).assertEqual(3);
      logInfo(`searchScenes(value="abc", category=""): actual[0].category=${actual[0].category}`);
      expect(actual[0].category).assertEqual('UI\u5e03\u5c40');
      logInfo(`${BUNDLE}SearchScenes_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0005
     * @tc.name      SearchComponent_SearchScenes_0005
     * @tc.desc      searchScenes(value="123", category="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0005 begin`);
      const actual: SceneModuleInfo[] = searchScenes('123', '');
      logInfo(`searchScenes(value="123", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`searchScenes(value="123", category=""): actual[0].name=${actual[0].name}`);
      expect(actual[0].name).assertEqual('NavDestination\u5f39\u7a97');
      logInfo(`searchScenes(value="123", category=""): actual[0].appUri=${actual[0].appUri}`);
      expect(actual[0].appUri).assertEqual('navdestinationdialog/NavDestinationDialog');
      logInfo(`searchScenes(value="123", category=""): actual[0].param=${actual[0].param}`);
      expect(actual[0].param).assertEqual('');
      logInfo(`searchScenes(value="123", category=""): actual[0].ratingNumber=${actual[0].ratingNumber}`);
      expect(actual[0].ratingNumber).assertEqual(2);
      logInfo(`searchScenes(value="123", category=""): actual[0].category=${actual[0].category}`);
      expect(actual[0].category).assertEqual('UI\u5e03\u5c40');
      logInfo(`searchScenes(value="123", category=""): actual[0].serialNumber=${actual[0].serialNumber}`);
      expect(actual[0].serialNumber).assertEqual(123);
      logInfo(`searchScenes(value="123", category=""): actual[0].swiperImage=${actual[0].swiperImage}`);
      expect(actual[0].swiperImage).assertEqual('');
      logInfo(`${BUNDLE}SearchScenes_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0006
     * @tc.name      SearchComponent_SearchScenes_0006
     * @tc.desc      searchScenes(value="Hello", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0006 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'a');
      logInfo(`searchScenes(value="Hello", category="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0007
     * @tc.name      SearchComponent_SearchScenes_0007
     * @tc.desc      searchScenes(value="Hello", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0007 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'abc');
      logInfo(`searchScenes(value="Hello", category="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0008
     * @tc.name      SearchComponent_SearchScenes_0008
     * @tc.desc      searchScenes(value="Hello", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0008 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'Hello World');
      logInfo(`searchScenes(value="Hello", category="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0009
     * @tc.name      SearchComponent_SearchScenes_0009
     * @tc.desc      searchScenes(value="Hello", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0009 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', ' ');
      logInfo(`searchScenes(value="Hello", category=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0010
     * @tc.name      SearchComponent_SearchScenes_0010
     * @tc.desc      searchScenes(value="Hello", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0010 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', '123');
      logInfo(`searchScenes(value="Hello", category="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0011
     * @tc.name      SearchComponent_SearchScenes_0011
     * @tc.desc      searchScenes(value="Hello", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0011 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', ' a ');
      logInfo(`searchScenes(value="Hello", category=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0012
     * @tc.name      SearchComponent_SearchScenes_0012
     * @tc.desc      searchScenes(value="Hello", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0012 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'aa');
      logInfo(`searchScenes(value="Hello", category="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0013
     * @tc.name      SearchComponent_SearchScenes_0013
     * @tc.desc      searchScenes(value="Hello", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0013 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'a_1');
      logInfo(`searchScenes(value="Hello", category="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0014
     * @tc.name      SearchComponent_SearchScenes_0014
     * @tc.desc      searchScenes(value="Hello", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0014 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'xa');
      logInfo(`searchScenes(value="Hello", category="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0015
     * @tc.name      SearchComponent_SearchScenes_0015
     * @tc.desc      searchScenes(value="Hello", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0015 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', ' abc ');
      logInfo(`searchScenes(value="Hello", category=" ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0016
     * @tc.name      SearchComponent_SearchScenes_0016
     * @tc.desc      searchScenes(value="Hello", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0016 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'abcabc');
      logInfo(`searchScenes(value="Hello", category="abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0017
     * @tc.name      SearchComponent_SearchScenes_0017
     * @tc.desc      searchScenes(value="Hello", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0017 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'abc_1');
      logInfo(`searchScenes(value="Hello", category="abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0018
     * @tc.name      SearchComponent_SearchScenes_0018
     * @tc.desc      searchScenes(value="Hello", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0018 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'xabc');
      logInfo(`searchScenes(value="Hello", category="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0019
     * @tc.name      SearchComponent_SearchScenes_0019
     * @tc.desc      searchScenes(value="Hello", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0019 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', ' Hello World ');
      logInfo(`searchScenes(value="Hello", category=" He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0020
     * @tc.name      SearchComponent_SearchScenes_0020
     * @tc.desc      searchScenes(value="Hello", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0020 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'Hello WorldHello World');
      logInfo(`searchScenes(value="Hello", category="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0021
     * @tc.name      SearchComponent_SearchScenes_0021
     * @tc.desc      searchScenes(value="Hello", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0021 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'Hello World_1');
      logInfo(`searchScenes(value="Hello", category="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0022
     * @tc.name      SearchComponent_SearchScenes_0022
     * @tc.desc      searchScenes(value="Hello", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0022 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'xHello World');
      logInfo(`searchScenes(value="Hello", category="xHe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0023
     * @tc.name      SearchComponent_SearchScenes_0023
     * @tc.desc      searchScenes(value="Hello", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0023 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', '   ');
      logInfo(`searchScenes(value="Hello", category="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0024
     * @tc.name      SearchComponent_SearchScenes_0024
     * @tc.desc      searchScenes(value="Hello", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0024 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', '  ');
      logInfo(`searchScenes(value="Hello", category="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0025
     * @tc.name      SearchComponent_SearchScenes_0025
     * @tc.desc      searchScenes(value="Hello", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0025 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', ' _1');
      logInfo(`searchScenes(value="Hello", category=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0026
     * @tc.name      SearchComponent_SearchScenes_0026
     * @tc.desc      searchScenes(value="Hello", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0026 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', 'x ');
      logInfo(`searchScenes(value="Hello", category="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0027
     * @tc.name      SearchComponent_SearchScenes_0027
     * @tc.desc      searchScenes(value="Hello", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0027 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', ' 123 ');
      logInfo(`searchScenes(value="Hello", category=" 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0028
     * @tc.name      SearchComponent_SearchScenes_0028
     * @tc.desc      searchScenes(value="Hello", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0028 begin`);
      const actual: SceneModuleInfo[] = searchScenes('Hello', '123123');
      logInfo(`searchScenes(value="Hello", category="123...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0029
     * @tc.name      SearchComponent_SearchScenes_0029
     * @tc.desc      searchScenes(value="hello world", category="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0029 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', '');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0030
     * @tc.name      SearchComponent_SearchScenes_0030
     * @tc.desc      searchScenes(value="hello world", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0030 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'a');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0031
     * @tc.name      SearchComponent_SearchScenes_0031
     * @tc.desc      searchScenes(value="hello world", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0031 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'abc');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0032
     * @tc.name      SearchComponent_SearchScenes_0032
     * @tc.desc      searchScenes(value="hello world", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0032 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'Hello World');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0033
     * @tc.name      SearchComponent_SearchScenes_0033
     * @tc.desc      searchScenes(value="hello world", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0033 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', ' ');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0034
     * @tc.name      SearchComponent_SearchScenes_0034
     * @tc.desc      searchScenes(value="hello world", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0034 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', '123');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0035
     * @tc.name      SearchComponent_SearchScenes_0035
     * @tc.desc      searchScenes(value="hello world", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0035 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', ' a ');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0036
     * @tc.name      SearchComponent_SearchScenes_0036
     * @tc.desc      searchScenes(value="hello world", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0036 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'aa');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0037
     * @tc.name      SearchComponent_SearchScenes_0037
     * @tc.desc      searchScenes(value="hello world", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0037 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'a_1');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0038
     * @tc.name      SearchComponent_SearchScenes_0038
     * @tc.desc      searchScenes(value="hello world", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0038 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'xa');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0039
     * @tc.name      SearchComponent_SearchScenes_0039
     * @tc.desc      searchScenes(value="hello world", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0039 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', ' abc ');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0040
     * @tc.name      SearchComponent_SearchScenes_0040
     * @tc.desc      searchScenes(value="hello world", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0040 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'abcabc');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0041
     * @tc.name      SearchComponent_SearchScenes_0041
     * @tc.desc      searchScenes(value="hello world", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0041 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'abc_1');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0042
     * @tc.name      SearchComponent_SearchScenes_0042
     * @tc.desc      searchScenes(value="hello world", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0042 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'xabc');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0043
     * @tc.name      SearchComponent_SearchScenes_0043
     * @tc.desc      searchScenes(value="hello world", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0043 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', ' Hello World ');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0044
     * @tc.name      SearchComponent_SearchScenes_0044
     * @tc.desc      searchScenes(value="hello world", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0044 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'Hello WorldHello World');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0045
     * @tc.name      SearchComponent_SearchScenes_0045
     * @tc.desc      searchScenes(value="hello world", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0045 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'Hello World_1');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0046
     * @tc.name      SearchComponent_SearchScenes_0046
     * @tc.desc      searchScenes(value="hello world", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0046 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'xHello World');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0047
     * @tc.name      SearchComponent_SearchScenes_0047
     * @tc.desc      searchScenes(value="hello world", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0047 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', '   ');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0048
     * @tc.name      SearchComponent_SearchScenes_0048
     * @tc.desc      searchScenes(value="hello world", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0048 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', '  ');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0049
     * @tc.name      SearchComponent_SearchScenes_0049
     * @tc.desc      searchScenes(value="hello world", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0049 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', ' _1');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0050
     * @tc.name      SearchComponent_SearchScenes_0050
     * @tc.desc      searchScenes(value="hello world", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0050 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', 'x ');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0051
     * @tc.name      SearchComponent_SearchScenes_0051
     * @tc.desc      searchScenes(value="hello world", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0051 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', ' 123 ');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0052
     * @tc.name      SearchComponent_SearchScenes_0052
     * @tc.desc      searchScenes(value="hello world", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0052 begin`);
      const actual: SceneModuleInfo[] = searchScenes('hello world', '123123');
      logInfo(`searchScenes(value="hello world", categor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0053
     * @tc.name      SearchComponent_SearchScenes_0053
     * @tc.desc      searchScenes(value="", category="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0053 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', '');
      logInfo(`searchScenes(value="", category=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0054
     * @tc.name      SearchComponent_SearchScenes_0054
     * @tc.desc      searchScenes(value="", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0054 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'a');
      logInfo(`searchScenes(value="", category="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0055
     * @tc.name      SearchComponent_SearchScenes_0055
     * @tc.desc      searchScenes(value="", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0055 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'abc');
      logInfo(`searchScenes(value="", category="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0056
     * @tc.name      SearchComponent_SearchScenes_0056
     * @tc.desc      searchScenes(value="", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0056 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'Hello World');
      logInfo(`searchScenes(value="", category="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0057
     * @tc.name      SearchComponent_SearchScenes_0057
     * @tc.desc      searchScenes(value="", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0057 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', ' ');
      logInfo(`searchScenes(value="", category=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0058
     * @tc.name      SearchComponent_SearchScenes_0058
     * @tc.desc      searchScenes(value="", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0058 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', '123');
      logInfo(`searchScenes(value="", category="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0059
     * @tc.name      SearchComponent_SearchScenes_0059
     * @tc.desc      searchScenes(value="", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0059 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', ' a ');
      logInfo(`searchScenes(value="", category=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0060
     * @tc.name      SearchComponent_SearchScenes_0060
     * @tc.desc      searchScenes(value="", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0060 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'aa');
      logInfo(`searchScenes(value="", category="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0061
     * @tc.name      SearchComponent_SearchScenes_0061
     * @tc.desc      searchScenes(value="", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0061 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'a_1');
      logInfo(`searchScenes(value="", category="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0062
     * @tc.name      SearchComponent_SearchScenes_0062
     * @tc.desc      searchScenes(value="", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0062 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'xa');
      logInfo(`searchScenes(value="", category="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0063
     * @tc.name      SearchComponent_SearchScenes_0063
     * @tc.desc      searchScenes(value="", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0063 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', ' abc ');
      logInfo(`searchScenes(value="", category=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0064
     * @tc.name      SearchComponent_SearchScenes_0064
     * @tc.desc      searchScenes(value="", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0064 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'abcabc');
      logInfo(`searchScenes(value="", category="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0065
     * @tc.name      SearchComponent_SearchScenes_0065
     * @tc.desc      searchScenes(value="", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0065 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'abc_1');
      logInfo(`searchScenes(value="", category="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0066
     * @tc.name      SearchComponent_SearchScenes_0066
     * @tc.desc      searchScenes(value="", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0066 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'xabc');
      logInfo(`searchScenes(value="", category="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0067
     * @tc.name      SearchComponent_SearchScenes_0067
     * @tc.desc      searchScenes(value="", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0067 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', ' Hello World ');
      logInfo(`searchScenes(value="", category=" Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0068
     * @tc.name      SearchComponent_SearchScenes_0068
     * @tc.desc      searchScenes(value="", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0068 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'Hello WorldHello World');
      logInfo(`searchScenes(value="", category="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0069
     * @tc.name      SearchComponent_SearchScenes_0069
     * @tc.desc      searchScenes(value="", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0069 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'Hello World_1');
      logInfo(`searchScenes(value="", category="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0070
     * @tc.name      SearchComponent_SearchScenes_0070
     * @tc.desc      searchScenes(value="", category="xHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0070 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'xHello World');
      logInfo(`searchScenes(value="", category="xHello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0071
     * @tc.name      SearchComponent_SearchScenes_0071
     * @tc.desc      searchScenes(value="", category="   ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0071 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', '   ');
      logInfo(`searchScenes(value="", category="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0072
     * @tc.name      SearchComponent_SearchScenes_0072
     * @tc.desc      searchScenes(value="", category="  ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0072 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', '  ');
      logInfo(`searchScenes(value="", category="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0073
     * @tc.name      SearchComponent_SearchScenes_0073
     * @tc.desc      searchScenes(value="", category=" _1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0073 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', ' _1');
      logInfo(`searchScenes(value="", category=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0074
     * @tc.name      SearchComponent_SearchScenes_0074
     * @tc.desc      searchScenes(value="", category="x ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0074 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', 'x ');
      logInfo(`searchScenes(value="", category="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0075
     * @tc.name      SearchComponent_SearchScenes_0075
     * @tc.desc      searchScenes(value="", category=" 123 ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0075 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', ' 123 ');
      logInfo(`searchScenes(value="", category=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0076
     * @tc.name      SearchComponent_SearchScenes_0076
     * @tc.desc      searchScenes(value="", category="123123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0076 begin`);
      const actual: SceneModuleInfo[] = searchScenes('', '123123');
      logInfo(`searchScenes(value="", category="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0077
     * @tc.name      SearchComponent_SearchScenes_0077
     * @tc.desc      searchScenes(value=" ", category="a") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0077 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'a');
      logInfo(`searchScenes(value=" ", category="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0078
     * @tc.name      SearchComponent_SearchScenes_0078
     * @tc.desc      searchScenes(value=" ", category="abc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0078 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'abc');
      logInfo(`searchScenes(value=" ", category="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0079
     * @tc.name      SearchComponent_SearchScenes_0079
     * @tc.desc      searchScenes(value=" ", category="Hello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0079 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'Hello World');
      logInfo(`searchScenes(value=" ", category="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0080
     * @tc.name      SearchComponent_SearchScenes_0080
     * @tc.desc      searchScenes(value=" ", category=" ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0080 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', ' ');
      logInfo(`searchScenes(value=" ", category=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0081
     * @tc.name      SearchComponent_SearchScenes_0081
     * @tc.desc      searchScenes(value=" ", category="123") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0081 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', '123');
      logInfo(`searchScenes(value=" ", category="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0082
     * @tc.name      SearchComponent_SearchScenes_0082
     * @tc.desc      searchScenes(value=" ", category=" a ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0082 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', ' a ');
      logInfo(`searchScenes(value=" ", category=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0083
     * @tc.name      SearchComponent_SearchScenes_0083
     * @tc.desc      searchScenes(value=" ", category="aa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0083 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'aa');
      logInfo(`searchScenes(value=" ", category="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0084
     * @tc.name      SearchComponent_SearchScenes_0084
     * @tc.desc      searchScenes(value=" ", category="a_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0084 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'a_1');
      logInfo(`searchScenes(value=" ", category="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0085
     * @tc.name      SearchComponent_SearchScenes_0085
     * @tc.desc      searchScenes(value=" ", category="xa") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0085 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'xa');
      logInfo(`searchScenes(value=" ", category="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0086
     * @tc.name      SearchComponent_SearchScenes_0086
     * @tc.desc      searchScenes(value=" ", category=" abc ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0086 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', ' abc ');
      logInfo(`searchScenes(value=" ", category=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0087
     * @tc.name      SearchComponent_SearchScenes_0087
     * @tc.desc      searchScenes(value=" ", category="abcabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0087 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'abcabc');
      logInfo(`searchScenes(value=" ", category="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0088
     * @tc.name      SearchComponent_SearchScenes_0088
     * @tc.desc      searchScenes(value=" ", category="abc_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0088 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'abc_1');
      logInfo(`searchScenes(value=" ", category="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0089
     * @tc.name      SearchComponent_SearchScenes_0089
     * @tc.desc      searchScenes(value=" ", category="xabc") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0089 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'xabc');
      logInfo(`searchScenes(value=" ", category="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0090
     * @tc.name      SearchComponent_SearchScenes_0090
     * @tc.desc      searchScenes(value=" ", category=" Hello World ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_SearchScenes_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SearchScenes_0090 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', ' Hello World ');
      logInfo(`searchScenes(value=" ", category=" Hello ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0091
     * @tc.name      SearchComponent_SearchScenes_0091
     * @tc.desc      searchScenes(value=" ", category="Hello WorldHello World") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0091 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'Hello WorldHello World');
      logInfo(`searchScenes(value=" ", category="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_SCENES_0092
     * @tc.name      SearchComponent_SearchScenes_0092
     * @tc.desc      searchScenes(value=" ", category="Hello World_1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchScenes_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchScenes_0092 begin`);
      const actual: SceneModuleInfo[] = searchScenes(' ', 'Hello World_1');
      logInfo(`searchScenes(value=" ", category="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchScenes_0092 end`);
    });
  });
}
