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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { listItemNames } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for listItemNames (68 cases). */
export default function listItemNamesTest(): void {
  describe('ListItemNamesTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0001
     * @tc.name      DragAndExchange_ListItemNames_0001
     * @tc.desc      listItemNames(count=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListItemNames_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0001 begin`);
      const actual: string[] = listItemNames(0);
      logInfo(`listItemNames(count=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0002
     * @tc.name      DragAndExchange_ListItemNames_0002
     * @tc.desc      listItemNames(count=1) returns ["Item1"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListItemNames_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0002 begin`);
      const actual: string[] = listItemNames(1);
      logInfo(`listItemNames(count=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`listItemNames(count=1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Item1"]');
      logInfo(`${BUNDLE}ListItemNames_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0003
     * @tc.name      DragAndExchange_ListItemNames_0003
     * @tc.desc      listItemNames(count=2) returns ["Item1","Item2"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListItemNames_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0003 begin`);
      const actual: string[] = listItemNames(2);
      logInfo(`listItemNames(count=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`listItemNames(count=2): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Item1","Item2"]');
      logInfo(`${BUNDLE}ListItemNames_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0004
     * @tc.name      DragAndExchange_ListItemNames_0004
     * @tc.desc      listItemNames(count=5) returns ["Item1","Item2","Item3","Item4","Item5"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0004 begin`);
      const actual: string[] = listItemNames(5);
      logInfo(`listItemNames(count=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`listItemNames(count=5): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Item1","Item2","Item3","Item4","Item5"]');
      logInfo(`${BUNDLE}ListItemNames_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0005
     * @tc.name      DragAndExchange_ListItemNames_0005
     * @tc.desc      listItemNames(count=10) returns ["Item7","Item8","Item9","Item10"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0005 begin`);
      const actual: string[] = listItemNames(10);
      logInfo(`listItemNames(count=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`listItemNames(count=10): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=10): JSON.stringify(actual.slice(6, 10))=${JSON.stringify(actual.slice(6, 10))}`);
      expect(JSON.stringify(actual.slice(6, 10))).assertEqual('["Item7","Item8","Item9","Item10"]');
      logInfo(`${BUNDLE}ListItemNames_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0006
     * @tc.name      DragAndExchange_ListItemNames_0006
     * @tc.desc      listItemNames(count=100) returns ["Item97","Item98","Item99","Item100"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0006 begin`);
      const actual: string[] = listItemNames(100);
      logInfo(`listItemNames(count=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`listItemNames(count=100): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=100): JSON.stringify(actual.slice(48, 54))=${JSON.stringify(actual.slice(48, 54))}`);
      expect(JSON.stringify(actual.slice(48, 54)))
        .assertEqual('["Item49","Item50","Item51","Item52","Item53","Item54"]');
      logInfo(`listItemNames(count=100): JSON.stringify(actual.slice(96, 1...${JSON.stringify(actual.slice(96, 100))}`);
      expect(JSON.stringify(actual.slice(96, 100))).assertEqual('["Item97","Item98","Item99","Item100"]');
      logInfo(`${BUNDLE}ListItemNames_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0007
     * @tc.name      DragAndExchange_ListItemNames_0007
     * @tc.desc      listItemNames(count=3) returns ["Item1","Item2","Item3"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0007 begin`);
      const actual: string[] = listItemNames(3);
      logInfo(`listItemNames(count=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listItemNames(count=3): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Item1","Item2","Item3"]');
      logInfo(`${BUNDLE}ListItemNames_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0008
     * @tc.name      DragAndExchange_ListItemNames_0008
     * @tc.desc      listItemNames(count=15) returns ["Item13","Item14","Item15"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0008 begin`);
      const actual: string[] = listItemNames(15);
      logInfo(`listItemNames(count=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`listItemNames(count=15): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=15): JSON.stringify(actual.slice(6, 12))=${JSON.stringify(actual.slice(6, 12))}`);
      expect(JSON.stringify(actual.slice(6, 12))).assertEqual('["Item7","Item8","Item9","Item10","Item11","Item12"]');
      logInfo(`listItemNames(count=15): JSON.stringify(actual.slice(12, 15))=${JSON.stringify(actual.slice(12, 15))}`);
      expect(JSON.stringify(actual.slice(12, 15))).assertEqual('["Item13","Item14","Item15"]');
      logInfo(`${BUNDLE}ListItemNames_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0009
     * @tc.name      DragAndExchange_ListItemNames_0009
     * @tc.desc      listItemNames(count=20) returns ["Item19","Item20"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0009 begin`);
      const actual: string[] = listItemNames(20);
      logInfo(`listItemNames(count=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(20);
      logInfo(`listItemNames(count=20): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=20): JSON.stringify(actual.slice(12, 18))=${JSON.stringify(actual.slice(12, 18))}`);
      expect(JSON.stringify(actual.slice(12, 18)))
        .assertEqual('["Item13","Item14","Item15","Item16","Item17","Item18"]');
      logInfo(`listItemNames(count=20): JSON.stringify(actual.slice(18, 20))=${JSON.stringify(actual.slice(18, 20))}`);
      expect(JSON.stringify(actual.slice(18, 20))).assertEqual('["Item19","Item20"]');
      logInfo(`${BUNDLE}ListItemNames_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0010
     * @tc.name      DragAndExchange_ListItemNames_0010
     * @tc.desc      listItemNames(count=25) returns ["Item25"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0010 begin`);
      const actual: string[] = listItemNames(25);
      logInfo(`listItemNames(count=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(25);
      logInfo(`listItemNames(count=25): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=25): JSON.stringify(actual.slice(12, 18))=${JSON.stringify(actual.slice(12, 18))}`);
      expect(JSON.stringify(actual.slice(12, 18)))
        .assertEqual('["Item13","Item14","Item15","Item16","Item17","Item18"]');
      logInfo(`listItemNames(count=25): JSON.stringify(actual.slice(24, 25))=${JSON.stringify(actual.slice(24, 25))}`);
      expect(JSON.stringify(actual.slice(24, 25))).assertEqual('["Item25"]');
      logInfo(`${BUNDLE}ListItemNames_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0011
     * @tc.name      DragAndExchange_ListItemNames_0011
     * @tc.desc      listItemNames(count=30) returns ["Item25","Item26","Item27","Item28","Item29","Item30"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0011 begin`);
      const actual: string[] = listItemNames(30);
      logInfo(`listItemNames(count=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`listItemNames(count=30): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=30): JSON.stringify(actual.slice(12, 18))=${JSON.stringify(actual.slice(12, 18))}`);
      expect(JSON.stringify(actual.slice(12, 18)))
        .assertEqual('["Item13","Item14","Item15","Item16","Item17","Item18"]');
      logInfo(`listItemNames(count=30): JSON.stringify(actual.slice(24, 30))=${JSON.stringify(actual.slice(24, 30))}`);
      expect(JSON.stringify(actual.slice(24, 30)))
        .assertEqual('["Item25","Item26","Item27","Item28","Item29","Item30"]');
      logInfo(`${BUNDLE}ListItemNames_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0012
     * @tc.name      DragAndExchange_ListItemNames_0012
     * @tc.desc      listItemNames(count=35) returns ["Item31","Item32","Item33","Item34","Item35"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0012 begin`);
      const actual: string[] = listItemNames(35);
      logInfo(`listItemNames(count=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(35);
      logInfo(`listItemNames(count=35): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=35): JSON.stringify(actual.slice(18, 24))=${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=35): JSON.stringify(actual.slice(30, 35))=${JSON.stringify(actual.slice(30, 35))}`);
      expect(JSON.stringify(actual.slice(30, 35))).assertEqual('["Item31","Item32","Item33","Item34","Item35"]');
      logInfo(`${BUNDLE}ListItemNames_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0013
     * @tc.name      DragAndExchange_ListItemNames_0013
     * @tc.desc      listItemNames(count=40) returns ["Item37","Item38","Item39","Item40"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0013 begin`);
      const actual: string[] = listItemNames(40);
      logInfo(`listItemNames(count=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(40);
      logInfo(`listItemNames(count=40): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=40): JSON.stringify(actual.slice(18, 24))=${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=40): JSON.stringify(actual.slice(36, 40))=${JSON.stringify(actual.slice(36, 40))}`);
      expect(JSON.stringify(actual.slice(36, 40))).assertEqual('["Item37","Item38","Item39","Item40"]');
      logInfo(`${BUNDLE}ListItemNames_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0014
     * @tc.name      DragAndExchange_ListItemNames_0014
     * @tc.desc      listItemNames(count=45) returns ["Item43","Item44","Item45"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0014 begin`);
      const actual: string[] = listItemNames(45);
      logInfo(`listItemNames(count=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(45);
      logInfo(`listItemNames(count=45): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=45): JSON.stringify(actual.slice(24, 30))=${JSON.stringify(actual.slice(24, 30))}`);
      expect(JSON.stringify(actual.slice(24, 30)))
        .assertEqual('["Item25","Item26","Item27","Item28","Item29","Item30"]');
      logInfo(`listItemNames(count=45): JSON.stringify(actual.slice(42, 45))=${JSON.stringify(actual.slice(42, 45))}`);
      expect(JSON.stringify(actual.slice(42, 45))).assertEqual('["Item43","Item44","Item45"]');
      logInfo(`${BUNDLE}ListItemNames_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0015
     * @tc.name      DragAndExchange_ListItemNames_0015
     * @tc.desc      listItemNames(count=50) returns ["Item49","Item50"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0015 begin`);
      const actual: string[] = listItemNames(50);
      logInfo(`listItemNames(count=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(50);
      logInfo(`listItemNames(count=50): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=50): JSON.stringify(actual.slice(24, 30))=${JSON.stringify(actual.slice(24, 30))}`);
      expect(JSON.stringify(actual.slice(24, 30)))
        .assertEqual('["Item25","Item26","Item27","Item28","Item29","Item30"]');
      logInfo(`listItemNames(count=50): JSON.stringify(actual.slice(48, 50))=${JSON.stringify(actual.slice(48, 50))}`);
      expect(JSON.stringify(actual.slice(48, 50))).assertEqual('["Item49","Item50"]');
      logInfo(`${BUNDLE}ListItemNames_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0016
     * @tc.name      DragAndExchange_ListItemNames_0016
     * @tc.desc      listItemNames(count=55) returns ["Item55"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0016 begin`);
      const actual: string[] = listItemNames(55);
      logInfo(`listItemNames(count=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(55);
      logInfo(`listItemNames(count=55): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=55): JSON.stringify(actual.slice(30, 36))=${JSON.stringify(actual.slice(30, 36))}`);
      expect(JSON.stringify(actual.slice(30, 36)))
        .assertEqual('["Item31","Item32","Item33","Item34","Item35","Item36"]');
      logInfo(`listItemNames(count=55): JSON.stringify(actual.slice(54, 55))=${JSON.stringify(actual.slice(54, 55))}`);
      expect(JSON.stringify(actual.slice(54, 55))).assertEqual('["Item55"]');
      logInfo(`${BUNDLE}ListItemNames_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0017
     * @tc.name      DragAndExchange_ListItemNames_0017
     * @tc.desc      listItemNames(count=60) returns ["Item55","Item56","Item57","Item58","Item59","Item60"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0017 begin`);
      const actual: string[] = listItemNames(60);
      logInfo(`listItemNames(count=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(60);
      logInfo(`listItemNames(count=60): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=60): JSON.stringify(actual.slice(30, 36))=${JSON.stringify(actual.slice(30, 36))}`);
      expect(JSON.stringify(actual.slice(30, 36)))
        .assertEqual('["Item31","Item32","Item33","Item34","Item35","Item36"]');
      logInfo(`listItemNames(count=60): JSON.stringify(actual.slice(54, 60))=${JSON.stringify(actual.slice(54, 60))}`);
      expect(JSON.stringify(actual.slice(54, 60)))
        .assertEqual('["Item55","Item56","Item57","Item58","Item59","Item60"]');
      logInfo(`${BUNDLE}ListItemNames_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0018
     * @tc.name      DragAndExchange_ListItemNames_0018
     * @tc.desc      listItemNames(count=65) returns ["Item61","Item62","Item63","Item64","Item65"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0018 begin`);
      const actual: string[] = listItemNames(65);
      logInfo(`listItemNames(count=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`listItemNames(count=65): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=65): JSON.stringify(actual.slice(30, 36))=${JSON.stringify(actual.slice(30, 36))}`);
      expect(JSON.stringify(actual.slice(30, 36)))
        .assertEqual('["Item31","Item32","Item33","Item34","Item35","Item36"]');
      logInfo(`listItemNames(count=65): JSON.stringify(actual.slice(60, 65))=${JSON.stringify(actual.slice(60, 65))}`);
      expect(JSON.stringify(actual.slice(60, 65))).assertEqual('["Item61","Item62","Item63","Item64","Item65"]');
      logInfo(`${BUNDLE}ListItemNames_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0019
     * @tc.name      DragAndExchange_ListItemNames_0019
     * @tc.desc      listItemNames(count=70) returns ["Item67","Item68","Item69","Item70"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0019 begin`);
      const actual: string[] = listItemNames(70);
      logInfo(`listItemNames(count=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`listItemNames(count=70): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=70): JSON.stringify(actual.slice(36, 42))=${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`listItemNames(count=70): JSON.stringify(actual.slice(66, 70))=${JSON.stringify(actual.slice(66, 70))}`);
      expect(JSON.stringify(actual.slice(66, 70))).assertEqual('["Item67","Item68","Item69","Item70"]');
      logInfo(`${BUNDLE}ListItemNames_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0020
     * @tc.name      DragAndExchange_ListItemNames_0020
     * @tc.desc      listItemNames(count=75) returns ["Item73","Item74","Item75"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0020 begin`);
      const actual: string[] = listItemNames(75);
      logInfo(`listItemNames(count=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`listItemNames(count=75): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=75): JSON.stringify(actual.slice(36, 42))=${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`listItemNames(count=75): JSON.stringify(actual.slice(72, 75))=${JSON.stringify(actual.slice(72, 75))}`);
      expect(JSON.stringify(actual.slice(72, 75))).assertEqual('["Item73","Item74","Item75"]');
      logInfo(`${BUNDLE}ListItemNames_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0021
     * @tc.name      DragAndExchange_ListItemNames_0021
     * @tc.desc      listItemNames(count=80) returns ["Item79","Item80"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0021 begin`);
      const actual: string[] = listItemNames(80);
      logInfo(`listItemNames(count=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`listItemNames(count=80): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=80): JSON.stringify(actual.slice(42, 48))=${JSON.stringify(actual.slice(42, 48))}`);
      expect(JSON.stringify(actual.slice(42, 48)))
        .assertEqual('["Item43","Item44","Item45","Item46","Item47","Item48"]');
      logInfo(`listItemNames(count=80): JSON.stringify(actual.slice(78, 80))=${JSON.stringify(actual.slice(78, 80))}`);
      expect(JSON.stringify(actual.slice(78, 80))).assertEqual('["Item79","Item80"]');
      logInfo(`${BUNDLE}ListItemNames_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0022
     * @tc.name      DragAndExchange_ListItemNames_0022
     * @tc.desc      listItemNames(count=85) returns ["Item85"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0022 begin`);
      const actual: string[] = listItemNames(85);
      logInfo(`listItemNames(count=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`listItemNames(count=85): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=85): JSON.stringify(actual.slice(42, 48))=${JSON.stringify(actual.slice(42, 48))}`);
      expect(JSON.stringify(actual.slice(42, 48)))
        .assertEqual('["Item43","Item44","Item45","Item46","Item47","Item48"]');
      logInfo(`listItemNames(count=85): JSON.stringify(actual.slice(84, 85))=${JSON.stringify(actual.slice(84, 85))}`);
      expect(JSON.stringify(actual.slice(84, 85))).assertEqual('["Item85"]');
      logInfo(`${BUNDLE}ListItemNames_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0023
     * @tc.name      DragAndExchange_ListItemNames_0023
     * @tc.desc      listItemNames(count=90) returns ["Item85","Item86","Item87","Item88","Item89","Item90"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0023 begin`);
      const actual: string[] = listItemNames(90);
      logInfo(`listItemNames(count=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(90);
      logInfo(`listItemNames(count=90): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=90): JSON.stringify(actual.slice(42, 48))=${JSON.stringify(actual.slice(42, 48))}`);
      expect(JSON.stringify(actual.slice(42, 48)))
        .assertEqual('["Item43","Item44","Item45","Item46","Item47","Item48"]');
      logInfo(`listItemNames(count=90): JSON.stringify(actual.slice(84, 90))=${JSON.stringify(actual.slice(84, 90))}`);
      expect(JSON.stringify(actual.slice(84, 90)))
        .assertEqual('["Item85","Item86","Item87","Item88","Item89","Item90"]');
      logInfo(`${BUNDLE}ListItemNames_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0024
     * @tc.name      DragAndExchange_ListItemNames_0024
     * @tc.desc      listItemNames(count=95) returns ["Item91","Item92","Item93","Item94","Item95"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0024 begin`);
      const actual: string[] = listItemNames(95);
      logInfo(`listItemNames(count=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`listItemNames(count=95): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=95): JSON.stringify(actual.slice(48, 54))=${JSON.stringify(actual.slice(48, 54))}`);
      expect(JSON.stringify(actual.slice(48, 54)))
        .assertEqual('["Item49","Item50","Item51","Item52","Item53","Item54"]');
      logInfo(`listItemNames(count=95): JSON.stringify(actual.slice(90, 95))=${JSON.stringify(actual.slice(90, 95))}`);
      expect(JSON.stringify(actual.slice(90, 95))).assertEqual('["Item91","Item92","Item93","Item94","Item95"]');
      logInfo(`${BUNDLE}ListItemNames_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0025
     * @tc.name      DragAndExchange_ListItemNames_0025
     * @tc.desc      listItemNames(count=105) returns ["Item102","Item103","Item104","Item105"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0025 begin`);
      const actual: string[] = listItemNames(105);
      logInfo(`listItemNames(count=105): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`listItemNames(count=105): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=105): JSON.stringify(actual.slice(54, 60))=${JSON.stringify(actual.slice(54, 60))}`);
      expect(JSON.stringify(actual.slice(54, 60)))
        .assertEqual('["Item55","Item56","Item57","Item58","Item59","Item60"]');
      logInfo(`listItemNames(count=105): JSON.stringify(actual.slice(101,...${JSON.stringify(actual.slice(101, 105))}`);
      expect(JSON.stringify(actual.slice(101, 105))).assertEqual('["Item102","Item103","Item104","Item105"]');
      logInfo(`${BUNDLE}ListItemNames_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0026
     * @tc.name      DragAndExchange_ListItemNames_0026
     * @tc.desc      listItemNames(count=110) returns ["Item107","Item108","Item109","Item110"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0026 begin`);
      const actual: string[] = listItemNames(110);
      logInfo(`listItemNames(count=110): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(110);
      logInfo(`listItemNames(count=110): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=110): JSON.stringify(actual.slice(54, 60))=${JSON.stringify(actual.slice(54, 60))}`);
      expect(JSON.stringify(actual.slice(54, 60)))
        .assertEqual('["Item55","Item56","Item57","Item58","Item59","Item60"]');
      logInfo(`listItemNames(count=110): JSON.stringify(actual.slice(106,...${JSON.stringify(actual.slice(106, 110))}`);
      expect(JSON.stringify(actual.slice(106, 110))).assertEqual('["Item107","Item108","Item109","Item110"]');
      logInfo(`${BUNDLE}ListItemNames_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0027
     * @tc.name      DragAndExchange_ListItemNames_0027
     * @tc.desc      listItemNames(count=115) returns ["Item112","Item113","Item114","Item115"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0027 begin`);
      const actual: string[] = listItemNames(115);
      logInfo(`listItemNames(count=115): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(115);
      logInfo(`listItemNames(count=115): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=115): JSON.stringify(actual.slice(60, 66))=${JSON.stringify(actual.slice(60, 66))}`);
      expect(JSON.stringify(actual.slice(60, 66)))
        .assertEqual('["Item61","Item62","Item63","Item64","Item65","Item66"]');
      logInfo(`listItemNames(count=115): JSON.stringify(actual.slice(111,...${JSON.stringify(actual.slice(111, 115))}`);
      expect(JSON.stringify(actual.slice(111, 115))).assertEqual('["Item112","Item113","Item114","Item115"]');
      logInfo(`${BUNDLE}ListItemNames_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0028
     * @tc.name      DragAndExchange_ListItemNames_0028
     * @tc.desc      listItemNames(count=120) returns ["Item117","Item118","Item119","Item120"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0028 begin`);
      const actual: string[] = listItemNames(120);
      logInfo(`listItemNames(count=120): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(120);
      logInfo(`listItemNames(count=120): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=120): JSON.stringify(actual.slice(60, 66))=${JSON.stringify(actual.slice(60, 66))}`);
      expect(JSON.stringify(actual.slice(60, 66)))
        .assertEqual('["Item61","Item62","Item63","Item64","Item65","Item66"]');
      logInfo(`listItemNames(count=120): JSON.stringify(actual.slice(116,...${JSON.stringify(actual.slice(116, 120))}`);
      expect(JSON.stringify(actual.slice(116, 120))).assertEqual('["Item117","Item118","Item119","Item120"]');
      logInfo(`${BUNDLE}ListItemNames_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0029
     * @tc.name      DragAndExchange_ListItemNames_0029
     * @tc.desc      listItemNames(count=125) returns ["Item122","Item123","Item124","Item125"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0029 begin`);
      const actual: string[] = listItemNames(125);
      logInfo(`listItemNames(count=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(125);
      logInfo(`listItemNames(count=125): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=125): JSON.stringify(actual.slice(66, 72))=${JSON.stringify(actual.slice(66, 72))}`);
      expect(JSON.stringify(actual.slice(66, 72)))
        .assertEqual('["Item67","Item68","Item69","Item70","Item71","Item72"]');
      logInfo(`listItemNames(count=125): JSON.stringify(actual.slice(121,...${JSON.stringify(actual.slice(121, 125))}`);
      expect(JSON.stringify(actual.slice(121, 125))).assertEqual('["Item122","Item123","Item124","Item125"]');
      logInfo(`${BUNDLE}ListItemNames_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0030
     * @tc.name      DragAndExchange_ListItemNames_0030
     * @tc.desc      listItemNames(count=130) returns ["Item127","Item128","Item129","Item130"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0030 begin`);
      const actual: string[] = listItemNames(130);
      logInfo(`listItemNames(count=130): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(130);
      logInfo(`listItemNames(count=130): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=130): JSON.stringify(actual.slice(66, 72))=${JSON.stringify(actual.slice(66, 72))}`);
      expect(JSON.stringify(actual.slice(66, 72)))
        .assertEqual('["Item67","Item68","Item69","Item70","Item71","Item72"]');
      logInfo(`listItemNames(count=130): JSON.stringify(actual.slice(126,...${JSON.stringify(actual.slice(126, 130))}`);
      expect(JSON.stringify(actual.slice(126, 130))).assertEqual('["Item127","Item128","Item129","Item130"]');
      logInfo(`${BUNDLE}ListItemNames_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0031
     * @tc.name      DragAndExchange_ListItemNames_0031
     * @tc.desc      listItemNames(count=135) returns ["Item132","Item133","Item134","Item135"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0031 begin`);
      const actual: string[] = listItemNames(135);
      logInfo(`listItemNames(count=135): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`listItemNames(count=135): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=135): JSON.stringify(actual.slice(72, 78))=${JSON.stringify(actual.slice(72, 78))}`);
      expect(JSON.stringify(actual.slice(72, 78)))
        .assertEqual('["Item73","Item74","Item75","Item76","Item77","Item78"]');
      logInfo(`listItemNames(count=135): JSON.stringify(actual.slice(131,...${JSON.stringify(actual.slice(131, 135))}`);
      expect(JSON.stringify(actual.slice(131, 135))).assertEqual('["Item132","Item133","Item134","Item135"]');
      logInfo(`${BUNDLE}ListItemNames_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0032
     * @tc.name      DragAndExchange_ListItemNames_0032
     * @tc.desc      listItemNames(count=140) returns ["Item137","Item138","Item139","Item140"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0032 begin`);
      const actual: string[] = listItemNames(140);
      logInfo(`listItemNames(count=140): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(140);
      logInfo(`listItemNames(count=140): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=140): JSON.stringify(actual.slice(72, 78))=${JSON.stringify(actual.slice(72, 78))}`);
      expect(JSON.stringify(actual.slice(72, 78)))
        .assertEqual('["Item73","Item74","Item75","Item76","Item77","Item78"]');
      logInfo(`listItemNames(count=140): JSON.stringify(actual.slice(136,...${JSON.stringify(actual.slice(136, 140))}`);
      expect(JSON.stringify(actual.slice(136, 140))).assertEqual('["Item137","Item138","Item139","Item140"]');
      logInfo(`${BUNDLE}ListItemNames_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0033
     * @tc.name      DragAndExchange_ListItemNames_0033
     * @tc.desc      listItemNames(count=145) returns ["Item142","Item143","Item144","Item145"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0033 begin`);
      const actual: string[] = listItemNames(145);
      logInfo(`listItemNames(count=145): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(145);
      logInfo(`listItemNames(count=145): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=145): JSON.stringify(actual.slice(78, 84))=${JSON.stringify(actual.slice(78, 84))}`);
      expect(JSON.stringify(actual.slice(78, 84)))
        .assertEqual('["Item79","Item80","Item81","Item82","Item83","Item84"]');
      logInfo(`listItemNames(count=145): JSON.stringify(actual.slice(141,...${JSON.stringify(actual.slice(141, 145))}`);
      expect(JSON.stringify(actual.slice(141, 145))).assertEqual('["Item142","Item143","Item144","Item145"]');
      logInfo(`${BUNDLE}ListItemNames_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0034
     * @tc.name      DragAndExchange_ListItemNames_0034
     * @tc.desc      listItemNames(count=150) returns ["Item147","Item148","Item149","Item150"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0034 begin`);
      const actual: string[] = listItemNames(150);
      logInfo(`listItemNames(count=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(150);
      logInfo(`listItemNames(count=150): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=150): JSON.stringify(actual.slice(78, 84))=${JSON.stringify(actual.slice(78, 84))}`);
      expect(JSON.stringify(actual.slice(78, 84)))
        .assertEqual('["Item79","Item80","Item81","Item82","Item83","Item84"]');
      logInfo(`listItemNames(count=150): JSON.stringify(actual.slice(146,...${JSON.stringify(actual.slice(146, 150))}`);
      expect(JSON.stringify(actual.slice(146, 150))).assertEqual('["Item147","Item148","Item149","Item150"]');
      logInfo(`${BUNDLE}ListItemNames_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0035
     * @tc.name      DragAndExchange_ListItemNames_0035
     * @tc.desc      listItemNames(count=155) returns ["Item152","Item153","Item154","Item155"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0035 begin`);
      const actual: string[] = listItemNames(155);
      logInfo(`listItemNames(count=155): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(155);
      logInfo(`listItemNames(count=155): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=155): JSON.stringify(actual.slice(84, 90))=${JSON.stringify(actual.slice(84, 90))}`);
      expect(JSON.stringify(actual.slice(84, 90)))
        .assertEqual('["Item85","Item86","Item87","Item88","Item89","Item90"]');
      logInfo(`listItemNames(count=155): JSON.stringify(actual.slice(151,...${JSON.stringify(actual.slice(151, 155))}`);
      expect(JSON.stringify(actual.slice(151, 155))).assertEqual('["Item152","Item153","Item154","Item155"]');
      logInfo(`${BUNDLE}ListItemNames_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0036
     * @tc.name      DragAndExchange_ListItemNames_0036
     * @tc.desc      listItemNames(count=160) returns ["Item157","Item158","Item159","Item160"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0036 begin`);
      const actual: string[] = listItemNames(160);
      logInfo(`listItemNames(count=160): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(160);
      logInfo(`listItemNames(count=160): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=160): JSON.stringify(actual.slice(84, 90))=${JSON.stringify(actual.slice(84, 90))}`);
      expect(JSON.stringify(actual.slice(84, 90)))
        .assertEqual('["Item85","Item86","Item87","Item88","Item89","Item90"]');
      logInfo(`listItemNames(count=160): JSON.stringify(actual.slice(156,...${JSON.stringify(actual.slice(156, 160))}`);
      expect(JSON.stringify(actual.slice(156, 160))).assertEqual('["Item157","Item158","Item159","Item160"]');
      logInfo(`${BUNDLE}ListItemNames_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0037
     * @tc.name      DragAndExchange_ListItemNames_0037
     * @tc.desc      listItemNames(count=165) returns ["Item162","Item163","Item164","Item165"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0037 begin`);
      const actual: string[] = listItemNames(165);
      logInfo(`listItemNames(count=165): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(165);
      logInfo(`listItemNames(count=165): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=165): JSON.stringify(actual.slice(90, 96))=${JSON.stringify(actual.slice(90, 96))}`);
      expect(JSON.stringify(actual.slice(90, 96)))
        .assertEqual('["Item91","Item92","Item93","Item94","Item95","Item96"]');
      logInfo(`listItemNames(count=165): JSON.stringify(actual.slice(161,...${JSON.stringify(actual.slice(161, 165))}`);
      expect(JSON.stringify(actual.slice(161, 165))).assertEqual('["Item162","Item163","Item164","Item165"]');
      logInfo(`${BUNDLE}ListItemNames_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0038
     * @tc.name      DragAndExchange_ListItemNames_0038
     * @tc.desc      listItemNames(count=170) returns ["Item167","Item168","Item169","Item170"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0038 begin`);
      const actual: string[] = listItemNames(170);
      logInfo(`listItemNames(count=170): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`listItemNames(count=170): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=170): JSON.stringify(actual.slice(90, 96))=${JSON.stringify(actual.slice(90, 96))}`);
      expect(JSON.stringify(actual.slice(90, 96)))
        .assertEqual('["Item91","Item92","Item93","Item94","Item95","Item96"]');
      logInfo(`listItemNames(count=170): JSON.stringify(actual.slice(166,...${JSON.stringify(actual.slice(166, 170))}`);
      expect(JSON.stringify(actual.slice(166, 170))).assertEqual('["Item167","Item168","Item169","Item170"]');
      logInfo(`${BUNDLE}ListItemNames_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0039
     * @tc.name      DragAndExchange_ListItemNames_0039
     * @tc.desc      listItemNames(count=175) returns ["Item172","Item173","Item174","Item175"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0039 begin`);
      const actual: string[] = listItemNames(175);
      logInfo(`listItemNames(count=175): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`listItemNames(count=175): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=175): JSON.stringify(actual.slice(96, 1...${JSON.stringify(actual.slice(96, 101))}`);
      expect(JSON.stringify(actual.slice(96, 101))).assertEqual('["Item97","Item98","Item99","Item100","Item101"]');
      logInfo(`listItemNames(count=175): JSON.stringify(actual.slice(171,...${JSON.stringify(actual.slice(171, 175))}`);
      expect(JSON.stringify(actual.slice(171, 175))).assertEqual('["Item172","Item173","Item174","Item175"]');
      logInfo(`${BUNDLE}ListItemNames_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0040
     * @tc.name      DragAndExchange_ListItemNames_0040
     * @tc.desc      listItemNames(count=180) returns ["Item177","Item178","Item179","Item180"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0040 begin`);
      const actual: string[] = listItemNames(180);
      logInfo(`listItemNames(count=180): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`listItemNames(count=180): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=180): JSON.stringify(actual.slice(96, 1...${JSON.stringify(actual.slice(96, 101))}`);
      expect(JSON.stringify(actual.slice(96, 101))).assertEqual('["Item97","Item98","Item99","Item100","Item101"]');
      logInfo(`listItemNames(count=180): JSON.stringify(actual.slice(176,...${JSON.stringify(actual.slice(176, 180))}`);
      expect(JSON.stringify(actual.slice(176, 180))).assertEqual('["Item177","Item178","Item179","Item180"]');
      logInfo(`${BUNDLE}ListItemNames_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0041
     * @tc.name      DragAndExchange_ListItemNames_0041
     * @tc.desc      listItemNames(count=185) returns ["Item182","Item183","Item184","Item185"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0041 begin`);
      const actual: string[] = listItemNames(185);
      logInfo(`listItemNames(count=185): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(185);
      logInfo(`listItemNames(count=185): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=185): JSON.stringify(actual.slice(101,...${JSON.stringify(actual.slice(101, 106))}`);
      expect(JSON.stringify(actual.slice(101, 106))).assertEqual('["Item102","Item103","Item104","Item105","Item106"]');
      logInfo(`listItemNames(count=185): JSON.stringify(actual.slice(181,...${JSON.stringify(actual.slice(181, 185))}`);
      expect(JSON.stringify(actual.slice(181, 185))).assertEqual('["Item182","Item183","Item184","Item185"]');
      logInfo(`${BUNDLE}ListItemNames_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0042
     * @tc.name      DragAndExchange_ListItemNames_0042
     * @tc.desc      listItemNames(count=190) returns ["Item187","Item188","Item189","Item190"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0042 begin`);
      const actual: string[] = listItemNames(190);
      logInfo(`listItemNames(count=190): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(190);
      logInfo(`listItemNames(count=190): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=190): JSON.stringify(actual.slice(101,...${JSON.stringify(actual.slice(101, 106))}`);
      expect(JSON.stringify(actual.slice(101, 106))).assertEqual('["Item102","Item103","Item104","Item105","Item106"]');
      logInfo(`listItemNames(count=190): JSON.stringify(actual.slice(186,...${JSON.stringify(actual.slice(186, 190))}`);
      expect(JSON.stringify(actual.slice(186, 190))).assertEqual('["Item187","Item188","Item189","Item190"]');
      logInfo(`${BUNDLE}ListItemNames_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0043
     * @tc.name      DragAndExchange_ListItemNames_0043
     * @tc.desc      listItemNames(count=195) returns ["Item192","Item193","Item194","Item195"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0043 begin`);
      const actual: string[] = listItemNames(195);
      logInfo(`listItemNames(count=195): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(195);
      logInfo(`listItemNames(count=195): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=195): JSON.stringify(actual.slice(106,...${JSON.stringify(actual.slice(106, 111))}`);
      expect(JSON.stringify(actual.slice(106, 111))).assertEqual('["Item107","Item108","Item109","Item110","Item111"]');
      logInfo(`listItemNames(count=195): JSON.stringify(actual.slice(191,...${JSON.stringify(actual.slice(191, 195))}`);
      expect(JSON.stringify(actual.slice(191, 195))).assertEqual('["Item192","Item193","Item194","Item195"]');
      logInfo(`${BUNDLE}ListItemNames_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0044
     * @tc.name      DragAndExchange_ListItemNames_0044
     * @tc.desc      listItemNames(count=200) returns ["Item197","Item198","Item199","Item200"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0044 begin`);
      const actual: string[] = listItemNames(200);
      logInfo(`listItemNames(count=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(200);
      logInfo(`listItemNames(count=200): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=200): JSON.stringify(actual.slice(106,...${JSON.stringify(actual.slice(106, 111))}`);
      expect(JSON.stringify(actual.slice(106, 111))).assertEqual('["Item107","Item108","Item109","Item110","Item111"]');
      logInfo(`listItemNames(count=200): JSON.stringify(actual.slice(196,...${JSON.stringify(actual.slice(196, 200))}`);
      expect(JSON.stringify(actual.slice(196, 200))).assertEqual('["Item197","Item198","Item199","Item200"]');
      logInfo(`${BUNDLE}ListItemNames_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0045
     * @tc.name      DragAndExchange_ListItemNames_0045
     * @tc.desc      listItemNames(count=41.29) returns ["Item37","Item38","Item39","Item40","Item41","Item42"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0045 begin`);
      const actual: string[] = listItemNames(41.29);
      logInfo(`listItemNames(count=41.29): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(42);
      logInfo(`listItemNames(count=41.29): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=41.29): JSON.stringify(actual.slice(18, ...${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=41.29): JSON.stringify(actual.slice(36, ...${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`${BUNDLE}ListItemNames_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0046
     * @tc.name      DragAndExchange_ListItemNames_0046
     * @tc.desc      listItemNames(count=174) returns ["Item172","Item173","Item174"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0046 begin`);
      const actual: string[] = listItemNames(174);
      logInfo(`listItemNames(count=174): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`listItemNames(count=174): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=174): JSON.stringify(actual.slice(96, 1...${JSON.stringify(actual.slice(96, 101))}`);
      expect(JSON.stringify(actual.slice(96, 101))).assertEqual('["Item97","Item98","Item99","Item100","Item101"]');
      logInfo(`listItemNames(count=174): JSON.stringify(actual.slice(171,...${JSON.stringify(actual.slice(171, 174))}`);
      expect(JSON.stringify(actual.slice(171, 174))).assertEqual('["Item172","Item173","Item174"]');
      logInfo(`${BUNDLE}ListItemNames_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0047
     * @tc.name      DragAndExchange_ListItemNames_0047
     * @tc.desc      listItemNames(count=173) returns ["Item172","Item173"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0047 begin`);
      const actual: string[] = listItemNames(173);
      logInfo(`listItemNames(count=173): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`listItemNames(count=173): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=173): JSON.stringify(actual.slice(96, 1...${JSON.stringify(actual.slice(96, 101))}`);
      expect(JSON.stringify(actual.slice(96, 101))).assertEqual('["Item97","Item98","Item99","Item100","Item101"]');
      logInfo(`listItemNames(count=173): JSON.stringify(actual.slice(171,...${JSON.stringify(actual.slice(171, 173))}`);
      expect(JSON.stringify(actual.slice(171, 173))).assertEqual('["Item172","Item173"]');
      logInfo(`${BUNDLE}ListItemNames_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0048
     * @tc.name      DragAndExchange_ListItemNames_0048
     * @tc.desc      listItemNames(count=21) returns ["Item19","Item20","Item21"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0048 begin`);
      const actual: string[] = listItemNames(21);
      logInfo(`listItemNames(count=21): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(21);
      logInfo(`listItemNames(count=21): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=21): JSON.stringify(actual.slice(12, 18))=${JSON.stringify(actual.slice(12, 18))}`);
      expect(JSON.stringify(actual.slice(12, 18)))
        .assertEqual('["Item13","Item14","Item15","Item16","Item17","Item18"]');
      logInfo(`listItemNames(count=21): JSON.stringify(actual.slice(18, 21))=${JSON.stringify(actual.slice(18, 21))}`);
      expect(JSON.stringify(actual.slice(18, 21))).assertEqual('["Item19","Item20","Item21"]');
      logInfo(`${BUNDLE}ListItemNames_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0049
     * @tc.name      DragAndExchange_ListItemNames_0049
     * @tc.desc      listItemNames(count=11.93) returns ["Item7","Item8","Item9","Item10","Item11","Item12"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0049 begin`);
      const actual: string[] = listItemNames(11.93);
      logInfo(`listItemNames(count=11.93): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`listItemNames(count=11.93): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=11.93): JSON.stringify(actual.slice(6, 12))=${JSON.stringify(actual.slice(6, 12))}`);
      expect(JSON.stringify(actual.slice(6, 12))).assertEqual('["Item7","Item8","Item9","Item10","Item11","Item12"]');
      logInfo(`${BUNDLE}ListItemNames_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0050
     * @tc.name      DragAndExchange_ListItemNames_0050
     * @tc.desc      listItemNames(count=77) returns ["Item73","Item74","Item75","Item76","Item77"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0050 begin`);
      const actual: string[] = listItemNames(77);
      logInfo(`listItemNames(count=77): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`listItemNames(count=77): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=77): JSON.stringify(actual.slice(36, 42))=${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`listItemNames(count=77): JSON.stringify(actual.slice(72, 77))=${JSON.stringify(actual.slice(72, 77))}`);
      expect(JSON.stringify(actual.slice(72, 77))).assertEqual('["Item73","Item74","Item75","Item76","Item77"]');
      logInfo(`${BUNDLE}ListItemNames_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0051
     * @tc.name      DragAndExchange_ListItemNames_0051
     * @tc.desc      listItemNames(count=79) returns ["Item79"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0051 begin`);
      const actual: string[] = listItemNames(79);
      logInfo(`listItemNames(count=79): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`listItemNames(count=79): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=79): JSON.stringify(actual.slice(42, 48))=${JSON.stringify(actual.slice(42, 48))}`);
      expect(JSON.stringify(actual.slice(42, 48)))
        .assertEqual('["Item43","Item44","Item45","Item46","Item47","Item48"]');
      logInfo(`listItemNames(count=79): JSON.stringify(actual.slice(78, 79))=${JSON.stringify(actual.slice(78, 79))}`);
      expect(JSON.stringify(actual.slice(78, 79))).assertEqual('["Item79"]');
      logInfo(`${BUNDLE}ListItemNames_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0052
     * @tc.name      DragAndExchange_ListItemNames_0052
     * @tc.desc      listItemNames(count=143) returns ["Item142","Item143"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0052 begin`);
      const actual: string[] = listItemNames(143);
      logInfo(`listItemNames(count=143): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(143);
      logInfo(`listItemNames(count=143): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=143): JSON.stringify(actual.slice(78, 84))=${JSON.stringify(actual.slice(78, 84))}`);
      expect(JSON.stringify(actual.slice(78, 84)))
        .assertEqual('["Item79","Item80","Item81","Item82","Item83","Item84"]');
      logInfo(`listItemNames(count=143): JSON.stringify(actual.slice(141,...${JSON.stringify(actual.slice(141, 143))}`);
      expect(JSON.stringify(actual.slice(141, 143))).assertEqual('["Item142","Item143"]');
      logInfo(`${BUNDLE}ListItemNames_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0053
     * @tc.name      DragAndExchange_ListItemNames_0053
     * @tc.desc      listItemNames(count=53.44) returns ["Item49","Item50","Item51","Item52","Item53","Item54"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0053 begin`);
      const actual: string[] = listItemNames(53.44);
      logInfo(`listItemNames(count=53.44): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(54);
      logInfo(`listItemNames(count=53.44): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=53.44): JSON.stringify(actual.slice(24, ...${JSON.stringify(actual.slice(24, 30))}`);
      expect(JSON.stringify(actual.slice(24, 30)))
        .assertEqual('["Item25","Item26","Item27","Item28","Item29","Item30"]');
      logInfo(`listItemNames(count=53.44): JSON.stringify(actual.slice(48, ...${JSON.stringify(actual.slice(48, 54))}`);
      expect(JSON.stringify(actual.slice(48, 54)))
        .assertEqual('["Item49","Item50","Item51","Item52","Item53","Item54"]');
      logInfo(`${BUNDLE}ListItemNames_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0054
     * @tc.name      DragAndExchange_ListItemNames_0054
     * @tc.desc      listItemNames(count=119) returns ["Item117","Item118","Item119"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0054 begin`);
      const actual: string[] = listItemNames(119);
      logInfo(`listItemNames(count=119): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(119);
      logInfo(`listItemNames(count=119): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=119): JSON.stringify(actual.slice(60, 66))=${JSON.stringify(actual.slice(60, 66))}`);
      expect(JSON.stringify(actual.slice(60, 66)))
        .assertEqual('["Item61","Item62","Item63","Item64","Item65","Item66"]');
      logInfo(`listItemNames(count=119): JSON.stringify(actual.slice(116,...${JSON.stringify(actual.slice(116, 119))}`);
      expect(JSON.stringify(actual.slice(116, 119))).assertEqual('["Item117","Item118","Item119"]');
      logInfo(`${BUNDLE}ListItemNames_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0055
     * @tc.name      DragAndExchange_ListItemNames_0055
     * @tc.desc      listItemNames(count=139) returns ["Item137","Item138","Item139"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0055 begin`);
      const actual: string[] = listItemNames(139);
      logInfo(`listItemNames(count=139): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`listItemNames(count=139): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=139): JSON.stringify(actual.slice(72, 78))=${JSON.stringify(actual.slice(72, 78))}`);
      expect(JSON.stringify(actual.slice(72, 78)))
        .assertEqual('["Item73","Item74","Item75","Item76","Item77","Item78"]');
      logInfo(`listItemNames(count=139): JSON.stringify(actual.slice(136,...${JSON.stringify(actual.slice(136, 139))}`);
      expect(JSON.stringify(actual.slice(136, 139))).assertEqual('["Item137","Item138","Item139"]');
      logInfo(`${BUNDLE}ListItemNames_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0056
     * @tc.name      DragAndExchange_ListItemNames_0056
     * @tc.desc      listItemNames(count=16) returns ["Item13","Item14","Item15","Item16"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0056 begin`);
      const actual: string[] = listItemNames(16);
      logInfo(`listItemNames(count=16): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`listItemNames(count=16): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=16): JSON.stringify(actual.slice(6, 12))=${JSON.stringify(actual.slice(6, 12))}`);
      expect(JSON.stringify(actual.slice(6, 12))).assertEqual('["Item7","Item8","Item9","Item10","Item11","Item12"]');
      logInfo(`listItemNames(count=16): JSON.stringify(actual.slice(12, 16))=${JSON.stringify(actual.slice(12, 16))}`);
      expect(JSON.stringify(actual.slice(12, 16))).assertEqual('["Item13","Item14","Item15","Item16"]');
      logInfo(`${BUNDLE}ListItemNames_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0057
     * @tc.name      DragAndExchange_ListItemNames_0057
     * @tc.desc      listItemNames(count=17) returns ["Item13","Item14","Item15","Item16","Item17"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0057 begin`);
      const actual: string[] = listItemNames(17);
      logInfo(`listItemNames(count=17): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(17);
      logInfo(`listItemNames(count=17): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=17): JSON.stringify(actual.slice(6, 12))=${JSON.stringify(actual.slice(6, 12))}`);
      expect(JSON.stringify(actual.slice(6, 12))).assertEqual('["Item7","Item8","Item9","Item10","Item11","Item12"]');
      logInfo(`listItemNames(count=17): JSON.stringify(actual.slice(12, 17))=${JSON.stringify(actual.slice(12, 17))}`);
      expect(JSON.stringify(actual.slice(12, 17))).assertEqual('["Item13","Item14","Item15","Item16","Item17"]');
      logInfo(`${BUNDLE}ListItemNames_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0058
     * @tc.name      DragAndExchange_ListItemNames_0058
     * @tc.desc      listItemNames(count=87) returns ["Item85","Item86","Item87"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0058 begin`);
      const actual: string[] = listItemNames(87);
      logInfo(`listItemNames(count=87): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`listItemNames(count=87): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=87): JSON.stringify(actual.slice(42, 48))=${JSON.stringify(actual.slice(42, 48))}`);
      expect(JSON.stringify(actual.slice(42, 48)))
        .assertEqual('["Item43","Item44","Item45","Item46","Item47","Item48"]');
      logInfo(`listItemNames(count=87): JSON.stringify(actual.slice(84, 87))=${JSON.stringify(actual.slice(84, 87))}`);
      expect(JSON.stringify(actual.slice(84, 87))).assertEqual('["Item85","Item86","Item87"]');
      logInfo(`${BUNDLE}ListItemNames_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0059
     * @tc.name      DragAndExchange_ListItemNames_0059
     * @tc.desc      listItemNames(count=72.58) returns ["Item73"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0059 begin`);
      const actual: string[] = listItemNames(72.58);
      logInfo(`listItemNames(count=72.58): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`listItemNames(count=72.58): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=72.58): JSON.stringify(actual.slice(36, ...${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`listItemNames(count=72.58): JSON.stringify(actual.slice(72, ...${JSON.stringify(actual.slice(72, 73))}`);
      expect(JSON.stringify(actual.slice(72, 73))).assertEqual('["Item73"]');
      logInfo(`${BUNDLE}ListItemNames_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0060
     * @tc.name      DragAndExchange_ListItemNames_0060
     * @tc.desc      listItemNames(count=8.51) returns ["Item7","Item8","Item9"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0060 begin`);
      const actual: string[] = listItemNames(8.51);
      logInfo(`listItemNames(count=8.51): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`listItemNames(count=8.51): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=8.51): JSON.stringify(actual.slice(6, 9))=${JSON.stringify(actual.slice(6, 9))}`);
      expect(JSON.stringify(actual.slice(6, 9))).assertEqual('["Item7","Item8","Item9"]');
      logInfo(`${BUNDLE}ListItemNames_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0061
     * @tc.name      DragAndExchange_ListItemNames_0061
     * @tc.desc      listItemNames(count=144) returns ["Item142","Item143","Item144"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0061 begin`);
      const actual: string[] = listItemNames(144);
      logInfo(`listItemNames(count=144): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(144);
      logInfo(`listItemNames(count=144): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=144): JSON.stringify(actual.slice(78, 84))=${JSON.stringify(actual.slice(78, 84))}`);
      expect(JSON.stringify(actual.slice(78, 84)))
        .assertEqual('["Item79","Item80","Item81","Item82","Item83","Item84"]');
      logInfo(`listItemNames(count=144): JSON.stringify(actual.slice(141,...${JSON.stringify(actual.slice(141, 144))}`);
      expect(JSON.stringify(actual.slice(141, 144))).assertEqual('["Item142","Item143","Item144"]');
      logInfo(`${BUNDLE}ListItemNames_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0062
     * @tc.name      DragAndExchange_ListItemNames_0062
     * @tc.desc      listItemNames(count=136) returns ["Item132","Item133","Item134","Item135","Item136"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0062 begin`);
      const actual: string[] = listItemNames(136);
      logInfo(`listItemNames(count=136): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(136);
      logInfo(`listItemNames(count=136): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=136): JSON.stringify(actual.slice(72, 78))=${JSON.stringify(actual.slice(72, 78))}`);
      expect(JSON.stringify(actual.slice(72, 78)))
        .assertEqual('["Item73","Item74","Item75","Item76","Item77","Item78"]');
      logInfo(`listItemNames(count=136): JSON.stringify(actual.slice(131,...${JSON.stringify(actual.slice(131, 136))}`);
      expect(JSON.stringify(actual.slice(131, 136))).assertEqual('["Item132","Item133","Item134","Item135","Item136"]');
      logInfo(`${BUNDLE}ListItemNames_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0063
     * @tc.name      DragAndExchange_ListItemNames_0063
     * @tc.desc      listItemNames(count=159) returns ["Item157","Item158","Item159"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0063 begin`);
      const actual: string[] = listItemNames(159);
      logInfo(`listItemNames(count=159): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(159);
      logInfo(`listItemNames(count=159): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=159): JSON.stringify(actual.slice(84, 90))=${JSON.stringify(actual.slice(84, 90))}`);
      expect(JSON.stringify(actual.slice(84, 90)))
        .assertEqual('["Item85","Item86","Item87","Item88","Item89","Item90"]');
      logInfo(`listItemNames(count=159): JSON.stringify(actual.slice(156,...${JSON.stringify(actual.slice(156, 159))}`);
      expect(JSON.stringify(actual.slice(156, 159))).assertEqual('["Item157","Item158","Item159"]');
      logInfo(`${BUNDLE}ListItemNames_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0064
     * @tc.name      DragAndExchange_ListItemNames_0064
     * @tc.desc      listItemNames(count=18) returns ["Item13","Item14","Item15","Item16","Item17","Item18"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0064 begin`);
      const actual: string[] = listItemNames(18);
      logInfo(`listItemNames(count=18): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(18);
      logInfo(`listItemNames(count=18): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=18): JSON.stringify(actual.slice(6, 12))=${JSON.stringify(actual.slice(6, 12))}`);
      expect(JSON.stringify(actual.slice(6, 12))).assertEqual('["Item7","Item8","Item9","Item10","Item11","Item12"]');
      logInfo(`listItemNames(count=18): JSON.stringify(actual.slice(12, 18))=${JSON.stringify(actual.slice(12, 18))}`);
      expect(JSON.stringify(actual.slice(12, 18)))
        .assertEqual('["Item13","Item14","Item15","Item16","Item17","Item18"]');
      logInfo(`${BUNDLE}ListItemNames_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0065
     * @tc.name      DragAndExchange_ListItemNames_0065
     * @tc.desc      listItemNames(count=109) returns ["Item107","Item108","Item109"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0065 begin`);
      const actual: string[] = listItemNames(109);
      logInfo(`listItemNames(count=109): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(109);
      logInfo(`listItemNames(count=109): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=109): JSON.stringify(actual.slice(54, 60))=${JSON.stringify(actual.slice(54, 60))}`);
      expect(JSON.stringify(actual.slice(54, 60)))
        .assertEqual('["Item55","Item56","Item57","Item58","Item59","Item60"]');
      logInfo(`listItemNames(count=109): JSON.stringify(actual.slice(106,...${JSON.stringify(actual.slice(106, 109))}`);
      expect(JSON.stringify(actual.slice(106, 109))).assertEqual('["Item107","Item108","Item109"]');
      logInfo(`${BUNDLE}ListItemNames_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0066
     * @tc.name      DragAndExchange_ListItemNames_0066
     * @tc.desc      listItemNames(count=74) returns ["Item73","Item74"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0066 begin`);
      const actual: string[] = listItemNames(74);
      logInfo(`listItemNames(count=74): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`listItemNames(count=74): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=74): JSON.stringify(actual.slice(36, 42))=${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`listItemNames(count=74): JSON.stringify(actual.slice(72, 74))=${JSON.stringify(actual.slice(72, 74))}`);
      expect(JSON.stringify(actual.slice(72, 74))).assertEqual('["Item73","Item74"]');
      logInfo(`${BUNDLE}ListItemNames_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0067
     * @tc.name      DragAndExchange_ListItemNames_0067
     * @tc.desc      listItemNames(count=146) returns ["Item142","Item143","Item144","Item145","Item146"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0067 begin`);
      const actual: string[] = listItemNames(146);
      logInfo(`listItemNames(count=146): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(146);
      logInfo(`listItemNames(count=146): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=146): JSON.stringify(actual.slice(78, 84))=${JSON.stringify(actual.slice(78, 84))}`);
      expect(JSON.stringify(actual.slice(78, 84)))
        .assertEqual('["Item79","Item80","Item81","Item82","Item83","Item84"]');
      logInfo(`listItemNames(count=146): JSON.stringify(actual.slice(141,...${JSON.stringify(actual.slice(141, 146))}`);
      expect(JSON.stringify(actual.slice(141, 146))).assertEqual('["Item142","Item143","Item144","Item145","Item146"]');
      logInfo(`${BUNDLE}ListItemNames_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0068
     * @tc.name      DragAndExchange_ListItemNames_0068
     * @tc.desc      listItemNames(count=198) returns ["Item197","Item198"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0068 begin`);
      const actual: string[] = listItemNames(198);
      logInfo(`listItemNames(count=198): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(198);
      logInfo(`listItemNames(count=198): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=198): JSON.stringify(actual.slice(106,...${JSON.stringify(actual.slice(106, 111))}`);
      expect(JSON.stringify(actual.slice(106, 111))).assertEqual('["Item107","Item108","Item109","Item110","Item111"]');
      logInfo(`listItemNames(count=198): JSON.stringify(actual.slice(196,...${JSON.stringify(actual.slice(196, 198))}`);
      expect(JSON.stringify(actual.slice(196, 198))).assertEqual('["Item197","Item198"]');
      logInfo(`${BUNDLE}ListItemNames_0068 end`);
    });
  });
}
