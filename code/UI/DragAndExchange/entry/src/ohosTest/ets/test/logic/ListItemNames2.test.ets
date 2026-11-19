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

/** Logic checks for listItemNames (52 cases). */
export default function listItemNames2Test(): void {
  describe('ListItemNames2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0069
     * @tc.name      DragAndExchange_ListItemNames_0069
     * @tc.desc      listItemNames(count=51.83) returns ["Item49","Item50","Item51","Item52"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0069 begin`);
      const actual: string[] = listItemNames(51.83);
      logInfo(`listItemNames(count=51.83): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(52);
      logInfo(`listItemNames(count=51.83): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=51.83): JSON.stringify(actual.slice(24, ...${JSON.stringify(actual.slice(24, 30))}`);
      expect(JSON.stringify(actual.slice(24, 30)))
        .assertEqual('["Item25","Item26","Item27","Item28","Item29","Item30"]');
      logInfo(`listItemNames(count=51.83): JSON.stringify(actual.slice(48, ...${JSON.stringify(actual.slice(48, 52))}`);
      expect(JSON.stringify(actual.slice(48, 52))).assertEqual('["Item49","Item50","Item51","Item52"]');
      logInfo(`${BUNDLE}ListItemNames_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0070
     * @tc.name      DragAndExchange_ListItemNames_0070
     * @tc.desc      listItemNames(count=167) returns ["Item167"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0070 begin`);
      const actual: string[] = listItemNames(167);
      logInfo(`listItemNames(count=167): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(167);
      logInfo(`listItemNames(count=167): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=167): JSON.stringify(actual.slice(90, 96))=${JSON.stringify(actual.slice(90, 96))}`);
      expect(JSON.stringify(actual.slice(90, 96)))
        .assertEqual('["Item91","Item92","Item93","Item94","Item95","Item96"]');
      logInfo(`listItemNames(count=167): JSON.stringify(actual.slice(166,...${JSON.stringify(actual.slice(166, 167))}`);
      expect(JSON.stringify(actual.slice(166, 167))).assertEqual('["Item167"]');
      logInfo(`${BUNDLE}ListItemNames_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0071
     * @tc.name      DragAndExchange_ListItemNames_0071
     * @tc.desc      listItemNames(count=3.59) returns ["Item1","Item2","Item3","Item4"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0071 begin`);
      const actual: string[] = listItemNames(3.59);
      logInfo(`listItemNames(count=3.59): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`listItemNames(count=3.59): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Item1","Item2","Item3","Item4"]');
      logInfo(`${BUNDLE}ListItemNames_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0072
     * @tc.name      DragAndExchange_ListItemNames_0072
     * @tc.desc      listItemNames(count=42.39) returns ["Item43"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0072 begin`);
      const actual: string[] = listItemNames(42.39);
      logInfo(`listItemNames(count=42.39): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(43);
      logInfo(`listItemNames(count=42.39): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=42.39): JSON.stringify(actual.slice(24, ...${JSON.stringify(actual.slice(24, 30))}`);
      expect(JSON.stringify(actual.slice(24, 30)))
        .assertEqual('["Item25","Item26","Item27","Item28","Item29","Item30"]');
      logInfo(`listItemNames(count=42.39): JSON.stringify(actual.slice(42, ...${JSON.stringify(actual.slice(42, 43))}`);
      expect(JSON.stringify(actual.slice(42, 43))).assertEqual('["Item43"]');
      logInfo(`${BUNDLE}ListItemNames_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0073
     * @tc.name      DragAndExchange_ListItemNames_0073
     * @tc.desc      listItemNames(count=161) returns ["Item157","Item158","Item159","Item160","Item161"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0073 begin`);
      const actual: string[] = listItemNames(161);
      logInfo(`listItemNames(count=161): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(161);
      logInfo(`listItemNames(count=161): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=161): JSON.stringify(actual.slice(84, 90))=${JSON.stringify(actual.slice(84, 90))}`);
      expect(JSON.stringify(actual.slice(84, 90)))
        .assertEqual('["Item85","Item86","Item87","Item88","Item89","Item90"]');
      logInfo(`listItemNames(count=161): JSON.stringify(actual.slice(156,...${JSON.stringify(actual.slice(156, 161))}`);
      expect(JSON.stringify(actual.slice(156, 161))).assertEqual('["Item157","Item158","Item159","Item160","Item161"]');
      logInfo(`${BUNDLE}ListItemNames_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0074
     * @tc.name      DragAndExchange_ListItemNames_0074
     * @tc.desc      listItemNames(count=118) returns ["Item117","Item118"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0074 begin`);
      const actual: string[] = listItemNames(118);
      logInfo(`listItemNames(count=118): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(118);
      logInfo(`listItemNames(count=118): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=118): JSON.stringify(actual.slice(60, 66))=${JSON.stringify(actual.slice(60, 66))}`);
      expect(JSON.stringify(actual.slice(60, 66)))
        .assertEqual('["Item61","Item62","Item63","Item64","Item65","Item66"]');
      logInfo(`listItemNames(count=118): JSON.stringify(actual.slice(116,...${JSON.stringify(actual.slice(116, 118))}`);
      expect(JSON.stringify(actual.slice(116, 118))).assertEqual('["Item117","Item118"]');
      logInfo(`${BUNDLE}ListItemNames_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0075
     * @tc.name      DragAndExchange_ListItemNames_0075
     * @tc.desc      listItemNames(count=60.36) returns ["Item61"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0075 begin`);
      const actual: string[] = listItemNames(60.36);
      logInfo(`listItemNames(count=60.36): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(61);
      logInfo(`listItemNames(count=60.36): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=60.36): JSON.stringify(actual.slice(30, ...${JSON.stringify(actual.slice(30, 36))}`);
      expect(JSON.stringify(actual.slice(30, 36)))
        .assertEqual('["Item31","Item32","Item33","Item34","Item35","Item36"]');
      logInfo(`listItemNames(count=60.36): JSON.stringify(actual.slice(60, ...${JSON.stringify(actual.slice(60, 61))}`);
      expect(JSON.stringify(actual.slice(60, 61))).assertEqual('["Item61"]');
      logInfo(`${BUNDLE}ListItemNames_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0076
     * @tc.name      DragAndExchange_ListItemNames_0076
     * @tc.desc      listItemNames(count=30.89) returns ["Item31"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0076 begin`);
      const actual: string[] = listItemNames(30.89);
      logInfo(`listItemNames(count=30.89): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`listItemNames(count=30.89): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=30.89): JSON.stringify(actual.slice(18, ...${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=30.89): JSON.stringify(actual.slice(30, ...${JSON.stringify(actual.slice(30, 31))}`);
      expect(JSON.stringify(actual.slice(30, 31))).assertEqual('["Item31"]');
      logInfo(`${BUNDLE}ListItemNames_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0077
     * @tc.name      DragAndExchange_ListItemNames_0077
     * @tc.desc      listItemNames(count=83) returns ["Item79","Item80","Item81","Item82","Item83"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0077 begin`);
      const actual: string[] = listItemNames(83);
      logInfo(`listItemNames(count=83): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`listItemNames(count=83): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=83): JSON.stringify(actual.slice(42, 48))=${JSON.stringify(actual.slice(42, 48))}`);
      expect(JSON.stringify(actual.slice(42, 48)))
        .assertEqual('["Item43","Item44","Item45","Item46","Item47","Item48"]');
      logInfo(`listItemNames(count=83): JSON.stringify(actual.slice(78, 83))=${JSON.stringify(actual.slice(78, 83))}`);
      expect(JSON.stringify(actual.slice(78, 83))).assertEqual('["Item79","Item80","Item81","Item82","Item83"]');
      logInfo(`${BUNDLE}ListItemNames_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0078
     * @tc.name      DragAndExchange_ListItemNames_0078
     * @tc.desc      listItemNames(count=22.82) returns ["Item19","Item20","Item21","Item22","Item23"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0078 begin`);
      const actual: string[] = listItemNames(22.82);
      logInfo(`listItemNames(count=22.82): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(23);
      logInfo(`listItemNames(count=22.82): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=22.82): JSON.stringify(actual.slice(12, ...${JSON.stringify(actual.slice(12, 18))}`);
      expect(JSON.stringify(actual.slice(12, 18)))
        .assertEqual('["Item13","Item14","Item15","Item16","Item17","Item18"]');
      logInfo(`listItemNames(count=22.82): JSON.stringify(actual.slice(18, ...${JSON.stringify(actual.slice(18, 23))}`);
      expect(JSON.stringify(actual.slice(18, 23))).assertEqual('["Item19","Item20","Item21","Item22","Item23"]');
      logInfo(`${BUNDLE}ListItemNames_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0079
     * @tc.name      DragAndExchange_ListItemNames_0079
     * @tc.desc      listItemNames(count=66) returns ["Item61","Item62","Item63","Item64","Item65","Item66"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0079 begin`);
      const actual: string[] = listItemNames(66);
      logInfo(`listItemNames(count=66): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`listItemNames(count=66): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=66): JSON.stringify(actual.slice(30, 36))=${JSON.stringify(actual.slice(30, 36))}`);
      expect(JSON.stringify(actual.slice(30, 36)))
        .assertEqual('["Item31","Item32","Item33","Item34","Item35","Item36"]');
      logInfo(`listItemNames(count=66): JSON.stringify(actual.slice(60, 66))=${JSON.stringify(actual.slice(60, 66))}`);
      expect(JSON.stringify(actual.slice(60, 66)))
        .assertEqual('["Item61","Item62","Item63","Item64","Item65","Item66"]');
      logInfo(`${BUNDLE}ListItemNames_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0080
     * @tc.name      DragAndExchange_ListItemNames_0080
     * @tc.desc      listItemNames(count=32.42) returns ["Item31","Item32","Item33"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0080 begin`);
      const actual: string[] = listItemNames(32.42);
      logInfo(`listItemNames(count=32.42): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(33);
      logInfo(`listItemNames(count=32.42): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=32.42): JSON.stringify(actual.slice(18, ...${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=32.42): JSON.stringify(actual.slice(30, ...${JSON.stringify(actual.slice(30, 33))}`);
      expect(JSON.stringify(actual.slice(30, 33))).assertEqual('["Item31","Item32","Item33"]');
      logInfo(`${BUNDLE}ListItemNames_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0081
     * @tc.name      DragAndExchange_ListItemNames_0081
     * @tc.desc      listItemNames(count=70.77) returns ["Item67","Item68","Item69","Item70","Item71"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0081 begin`);
      const actual: string[] = listItemNames(70.77);
      logInfo(`listItemNames(count=70.77): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`listItemNames(count=70.77): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=70.77): JSON.stringify(actual.slice(36, ...${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`listItemNames(count=70.77): JSON.stringify(actual.slice(66, ...${JSON.stringify(actual.slice(66, 71))}`);
      expect(JSON.stringify(actual.slice(66, 71))).assertEqual('["Item67","Item68","Item69","Item70","Item71"]');
      logInfo(`${BUNDLE}ListItemNames_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0082
     * @tc.name      DragAndExchange_ListItemNames_0082
     * @tc.desc      listItemNames(count=37) returns ["Item37"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0082 begin`);
      const actual: string[] = listItemNames(37);
      logInfo(`listItemNames(count=37): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(37);
      logInfo(`listItemNames(count=37): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=37): JSON.stringify(actual.slice(18, 24))=${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=37): JSON.stringify(actual.slice(36, 37))=${JSON.stringify(actual.slice(36, 37))}`);
      expect(JSON.stringify(actual.slice(36, 37))).assertEqual('["Item37"]');
      logInfo(`${BUNDLE}ListItemNames_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0083
     * @tc.name      DragAndExchange_ListItemNames_0083
     * @tc.desc      listItemNames(count=157) returns ["Item157"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0083 begin`);
      const actual: string[] = listItemNames(157);
      logInfo(`listItemNames(count=157): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(157);
      logInfo(`listItemNames(count=157): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=157): JSON.stringify(actual.slice(84, 90))=${JSON.stringify(actual.slice(84, 90))}`);
      expect(JSON.stringify(actual.slice(84, 90)))
        .assertEqual('["Item85","Item86","Item87","Item88","Item89","Item90"]');
      logInfo(`listItemNames(count=157): JSON.stringify(actual.slice(156,...${JSON.stringify(actual.slice(156, 157))}`);
      expect(JSON.stringify(actual.slice(156, 157))).assertEqual('["Item157"]');
      logInfo(`${BUNDLE}ListItemNames_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0084
     * @tc.name      DragAndExchange_ListItemNames_0084
     * @tc.desc      listItemNames(count=112) returns ["Item112"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0084 begin`);
      const actual: string[] = listItemNames(112);
      logInfo(`listItemNames(count=112): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(112);
      logInfo(`listItemNames(count=112): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=112): JSON.stringify(actual.slice(60, 66))=${JSON.stringify(actual.slice(60, 66))}`);
      expect(JSON.stringify(actual.slice(60, 66)))
        .assertEqual('["Item61","Item62","Item63","Item64","Item65","Item66"]');
      logInfo(`listItemNames(count=112): JSON.stringify(actual.slice(111,...${JSON.stringify(actual.slice(111, 112))}`);
      expect(JSON.stringify(actual.slice(111, 112))).assertEqual('["Item112"]');
      logInfo(`${BUNDLE}ListItemNames_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0085
     * @tc.name      DragAndExchange_ListItemNames_0085
     * @tc.desc      listItemNames(count=41) returns ["Item37","Item38","Item39","Item40","Item41"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0085 begin`);
      const actual: string[] = listItemNames(41);
      logInfo(`listItemNames(count=41): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(41);
      logInfo(`listItemNames(count=41): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=41): JSON.stringify(actual.slice(18, 24))=${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=41): JSON.stringify(actual.slice(36, 41))=${JSON.stringify(actual.slice(36, 41))}`);
      expect(JSON.stringify(actual.slice(36, 41))).assertEqual('["Item37","Item38","Item39","Item40","Item41"]');
      logInfo(`${BUNDLE}ListItemNames_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0086
     * @tc.name      DragAndExchange_ListItemNames_0086
     * @tc.desc      listItemNames(count=184) returns ["Item182","Item183","Item184"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0086 begin`);
      const actual: string[] = listItemNames(184);
      logInfo(`listItemNames(count=184): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(184);
      logInfo(`listItemNames(count=184): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=184): JSON.stringify(actual.slice(101,...${JSON.stringify(actual.slice(101, 106))}`);
      expect(JSON.stringify(actual.slice(101, 106))).assertEqual('["Item102","Item103","Item104","Item105","Item106"]');
      logInfo(`listItemNames(count=184): JSON.stringify(actual.slice(181,...${JSON.stringify(actual.slice(181, 184))}`);
      expect(JSON.stringify(actual.slice(181, 184))).assertEqual('["Item182","Item183","Item184"]');
      logInfo(`${BUNDLE}ListItemNames_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0087
     * @tc.name      DragAndExchange_ListItemNames_0087
     * @tc.desc      listItemNames(count=11) returns ["Item7","Item8","Item9","Item10","Item11"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0087 begin`);
      const actual: string[] = listItemNames(11);
      logInfo(`listItemNames(count=11): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`listItemNames(count=11): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=11): JSON.stringify(actual.slice(6, 11))=${JSON.stringify(actual.slice(6, 11))}`);
      expect(JSON.stringify(actual.slice(6, 11))).assertEqual('["Item7","Item8","Item9","Item10","Item11"]');
      logInfo(`${BUNDLE}ListItemNames_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0088
     * @tc.name      DragAndExchange_ListItemNames_0088
     * @tc.desc      listItemNames(count=147) returns ["Item147"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0088 begin`);
      const actual: string[] = listItemNames(147);
      logInfo(`listItemNames(count=147): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(147);
      logInfo(`listItemNames(count=147): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=147): JSON.stringify(actual.slice(78, 84))=${JSON.stringify(actual.slice(78, 84))}`);
      expect(JSON.stringify(actual.slice(78, 84)))
        .assertEqual('["Item79","Item80","Item81","Item82","Item83","Item84"]');
      logInfo(`listItemNames(count=147): JSON.stringify(actual.slice(146,...${JSON.stringify(actual.slice(146, 147))}`);
      expect(JSON.stringify(actual.slice(146, 147))).assertEqual('["Item147"]');
      logInfo(`${BUNDLE}ListItemNames_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0089
     * @tc.name      DragAndExchange_ListItemNames_0089
     * @tc.desc      listItemNames(count=134) returns ["Item132","Item133","Item134"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0089 begin`);
      const actual: string[] = listItemNames(134);
      logInfo(`listItemNames(count=134): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(134);
      logInfo(`listItemNames(count=134): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=134): JSON.stringify(actual.slice(72, 78))=${JSON.stringify(actual.slice(72, 78))}`);
      expect(JSON.stringify(actual.slice(72, 78)))
        .assertEqual('["Item73","Item74","Item75","Item76","Item77","Item78"]');
      logInfo(`listItemNames(count=134): JSON.stringify(actual.slice(131,...${JSON.stringify(actual.slice(131, 134))}`);
      expect(JSON.stringify(actual.slice(131, 134))).assertEqual('["Item132","Item133","Item134"]');
      logInfo(`${BUNDLE}ListItemNames_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0090
     * @tc.name      DragAndExchange_ListItemNames_0090
     * @tc.desc      listItemNames(count=178) returns ["Item177","Item178"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0090 begin`);
      const actual: string[] = listItemNames(178);
      logInfo(`listItemNames(count=178): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(178);
      logInfo(`listItemNames(count=178): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=178): JSON.stringify(actual.slice(96, 1...${JSON.stringify(actual.slice(96, 101))}`);
      expect(JSON.stringify(actual.slice(96, 101))).assertEqual('["Item97","Item98","Item99","Item100","Item101"]');
      logInfo(`listItemNames(count=178): JSON.stringify(actual.slice(176,...${JSON.stringify(actual.slice(176, 178))}`);
      expect(JSON.stringify(actual.slice(176, 178))).assertEqual('["Item177","Item178"]');
      logInfo(`${BUNDLE}ListItemNames_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0091
     * @tc.name      DragAndExchange_ListItemNames_0091
     * @tc.desc      listItemNames(count=35.16) returns ["Item31","Item32","Item33","Item34","Item35","Item36"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0091 begin`);
      const actual: string[] = listItemNames(35.16);
      logInfo(`listItemNames(count=35.16): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(36);
      logInfo(`listItemNames(count=35.16): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=35.16): JSON.stringify(actual.slice(18, ...${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=35.16): JSON.stringify(actual.slice(30, ...${JSON.stringify(actual.slice(30, 36))}`);
      expect(JSON.stringify(actual.slice(30, 36)))
        .assertEqual('["Item31","Item32","Item33","Item34","Item35","Item36"]');
      logInfo(`${BUNDLE}ListItemNames_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0092
     * @tc.name      DragAndExchange_ListItemNames_0092
     * @tc.desc      listItemNames(count=176) returns ["Item172","Item173","Item174","Item175","Item176"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0092 begin`);
      const actual: string[] = listItemNames(176);
      logInfo(`listItemNames(count=176): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(176);
      logInfo(`listItemNames(count=176): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=176): JSON.stringify(actual.slice(96, 1...${JSON.stringify(actual.slice(96, 101))}`);
      expect(JSON.stringify(actual.slice(96, 101))).assertEqual('["Item97","Item98","Item99","Item100","Item101"]');
      logInfo(`listItemNames(count=176): JSON.stringify(actual.slice(171,...${JSON.stringify(actual.slice(171, 176))}`);
      expect(JSON.stringify(actual.slice(171, 176))).assertEqual('["Item172","Item173","Item174","Item175","Item176"]');
      logInfo(`${BUNDLE}ListItemNames_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0093
     * @tc.name      DragAndExchange_ListItemNames_0093
     * @tc.desc      listItemNames(count=29) returns ["Item25","Item26","Item27","Item28","Item29"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0093 begin`);
      const actual: string[] = listItemNames(29);
      logInfo(`listItemNames(count=29): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(29);
      logInfo(`listItemNames(count=29): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=29): JSON.stringify(actual.slice(12, 18))=${JSON.stringify(actual.slice(12, 18))}`);
      expect(JSON.stringify(actual.slice(12, 18)))
        .assertEqual('["Item13","Item14","Item15","Item16","Item17","Item18"]');
      logInfo(`listItemNames(count=29): JSON.stringify(actual.slice(24, 29))=${JSON.stringify(actual.slice(24, 29))}`);
      expect(JSON.stringify(actual.slice(24, 29))).assertEqual('["Item25","Item26","Item27","Item28","Item29"]');
      logInfo(`${BUNDLE}ListItemNames_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0094
     * @tc.name      DragAndExchange_ListItemNames_0094
     * @tc.desc      listItemNames(count=47) returns ["Item43","Item44","Item45","Item46","Item47"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0094 begin`);
      const actual: string[] = listItemNames(47);
      logInfo(`listItemNames(count=47): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(47);
      logInfo(`listItemNames(count=47): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=47): JSON.stringify(actual.slice(24, 30))=${JSON.stringify(actual.slice(24, 30))}`);
      expect(JSON.stringify(actual.slice(24, 30)))
        .assertEqual('["Item25","Item26","Item27","Item28","Item29","Item30"]');
      logInfo(`listItemNames(count=47): JSON.stringify(actual.slice(42, 47))=${JSON.stringify(actual.slice(42, 47))}`);
      expect(JSON.stringify(actual.slice(42, 47))).assertEqual('["Item43","Item44","Item45","Item46","Item47"]');
      logInfo(`${BUNDLE}ListItemNames_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0095
     * @tc.name      DragAndExchange_ListItemNames_0095
     * @tc.desc      listItemNames(count=171) returns ["Item167","Item168","Item169","Item170","Item171"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0095 begin`);
      const actual: string[] = listItemNames(171);
      logInfo(`listItemNames(count=171): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`listItemNames(count=171): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=171): JSON.stringify(actual.slice(90, 96))=${JSON.stringify(actual.slice(90, 96))}`);
      expect(JSON.stringify(actual.slice(90, 96)))
        .assertEqual('["Item91","Item92","Item93","Item94","Item95","Item96"]');
      logInfo(`listItemNames(count=171): JSON.stringify(actual.slice(166,...${JSON.stringify(actual.slice(166, 171))}`);
      expect(JSON.stringify(actual.slice(166, 171))).assertEqual('["Item167","Item168","Item169","Item170","Item171"]');
      logInfo(`${BUNDLE}ListItemNames_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0096
     * @tc.name      DragAndExchange_ListItemNames_0096
     * @tc.desc      listItemNames(count=68) returns ["Item67","Item68"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0096 begin`);
      const actual: string[] = listItemNames(68);
      logInfo(`listItemNames(count=68): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`listItemNames(count=68): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=68): JSON.stringify(actual.slice(36, 42))=${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`listItemNames(count=68): JSON.stringify(actual.slice(66, 68))=${JSON.stringify(actual.slice(66, 68))}`);
      expect(JSON.stringify(actual.slice(66, 68))).assertEqual('["Item67","Item68"]');
      logInfo(`${BUNDLE}ListItemNames_0096 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0097
     * @tc.name      DragAndExchange_ListItemNames_0097
     * @tc.desc      listItemNames(count=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_ListItemNames_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0097 begin`);
      const actual: string[] = listItemNames(-1);
      logInfo(`listItemNames(count=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0098
     * @tc.name      DragAndExchange_ListItemNames_0098
     * @tc.desc      listItemNames(count=-100) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0098 begin`);
      const actual: string[] = listItemNames(-100);
      logInfo(`listItemNames(count=-100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0099
     * @tc.name      DragAndExchange_ListItemNames_0099
     * @tc.desc      listItemNames(count=42) returns ["Item37","Item38","Item39","Item40","Item41","Item42"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0099 begin`);
      const actual: string[] = listItemNames(42);
      logInfo(`listItemNames(count=42): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(42);
      logInfo(`listItemNames(count=42): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=42): JSON.stringify(actual.slice(18, 24))=${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=42): JSON.stringify(actual.slice(36, 42))=${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`${BUNDLE}ListItemNames_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0100
     * @tc.name      DragAndExchange_ListItemNames_0100
     * @tc.desc      listItemNames(count=-57) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0100 begin`);
      const actual: string[] = listItemNames(-57);
      logInfo(`listItemNames(count=-57): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0101
     * @tc.name      DragAndExchange_ListItemNames_0101
     * @tc.desc      listItemNames(count=-34) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0101 begin`);
      const actual: string[] = listItemNames(-34);
      logInfo(`listItemNames(count=-34): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0102
     * @tc.name      DragAndExchange_ListItemNames_0102
     * @tc.desc      listItemNames(count=44.14) returns ["Item43","Item44","Item45"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0102 begin`);
      const actual: string[] = listItemNames(44.14);
      logInfo(`listItemNames(count=44.14): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(45);
      logInfo(`listItemNames(count=44.14): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=44.14): JSON.stringify(actual.slice(24, ...${JSON.stringify(actual.slice(24, 30))}`);
      expect(JSON.stringify(actual.slice(24, 30)))
        .assertEqual('["Item25","Item26","Item27","Item28","Item29","Item30"]');
      logInfo(`listItemNames(count=44.14): JSON.stringify(actual.slice(42, ...${JSON.stringify(actual.slice(42, 45))}`);
      expect(JSON.stringify(actual.slice(42, 45))).assertEqual('["Item43","Item44","Item45"]');
      logInfo(`${BUNDLE}ListItemNames_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0103
     * @tc.name      DragAndExchange_ListItemNames_0103
     * @tc.desc      listItemNames(count=-78) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0103 begin`);
      const actual: string[] = listItemNames(-78);
      logInfo(`listItemNames(count=-78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0104
     * @tc.name      DragAndExchange_ListItemNames_0104
     * @tc.desc      listItemNames(count=19.61) returns ["Item19","Item20"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0104 begin`);
      const actual: string[] = listItemNames(19.61);
      logInfo(`listItemNames(count=19.61): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(20);
      logInfo(`listItemNames(count=19.61): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=19.61): JSON.stringify(actual.slice(12, ...${JSON.stringify(actual.slice(12, 18))}`);
      expect(JSON.stringify(actual.slice(12, 18)))
        .assertEqual('["Item13","Item14","Item15","Item16","Item17","Item18"]');
      logInfo(`listItemNames(count=19.61): JSON.stringify(actual.slice(18, ...${JSON.stringify(actual.slice(18, 20))}`);
      expect(JSON.stringify(actual.slice(18, 20))).assertEqual('["Item19","Item20"]');
      logInfo(`${BUNDLE}ListItemNames_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0105
     * @tc.name      DragAndExchange_ListItemNames_0105
     * @tc.desc      listItemNames(count=72.16) returns ["Item73"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0105 begin`);
      const actual: string[] = listItemNames(72.16);
      logInfo(`listItemNames(count=72.16): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`listItemNames(count=72.16): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=72.16): JSON.stringify(actual.slice(36, ...${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`listItemNames(count=72.16): JSON.stringify(actual.slice(72, ...${JSON.stringify(actual.slice(72, 73))}`);
      expect(JSON.stringify(actual.slice(72, 73))).assertEqual('["Item73"]');
      logInfo(`${BUNDLE}ListItemNames_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0106
     * @tc.name      DragAndExchange_ListItemNames_0106
     * @tc.desc      listItemNames(count=-74) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0106 begin`);
      const actual: string[] = listItemNames(-74);
      logInfo(`listItemNames(count=-74): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0107
     * @tc.name      DragAndExchange_ListItemNames_0107
     * @tc.desc      listItemNames(count=-50) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0107 begin`);
      const actual: string[] = listItemNames(-50);
      logInfo(`listItemNames(count=-50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0108
     * @tc.name      DragAndExchange_ListItemNames_0108
     * @tc.desc      listItemNames(count=-76) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0108 begin`);
      const actual: string[] = listItemNames(-76);
      logInfo(`listItemNames(count=-76): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0109
     * @tc.name      DragAndExchange_ListItemNames_0109
     * @tc.desc      listItemNames(count=-9) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0109 begin`);
      const actual: string[] = listItemNames(-9);
      logInfo(`listItemNames(count=-9): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0110
     * @tc.name      DragAndExchange_ListItemNames_0110
     * @tc.desc      listItemNames(count=-73) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0110 begin`);
      const actual: string[] = listItemNames(-73);
      logInfo(`listItemNames(count=-73): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0111
     * @tc.name      DragAndExchange_ListItemNames_0111
     * @tc.desc      listItemNames(count=-38) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0111 begin`);
      const actual: string[] = listItemNames(-38);
      logInfo(`listItemNames(count=-38): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0112
     * @tc.name      DragAndExchange_ListItemNames_0112
     * @tc.desc      listItemNames(count=2.75) returns ["Item1","Item2","Item3"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0112 begin`);
      const actual: string[] = listItemNames(2.75);
      logInfo(`listItemNames(count=2.75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`listItemNames(count=2.75): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Item1","Item2","Item3"]');
      logInfo(`${BUNDLE}ListItemNames_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0113
     * @tc.name      DragAndExchange_ListItemNames_0113
     * @tc.desc      listItemNames(count=-75) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0113 begin`);
      const actual: string[] = listItemNames(-75);
      logInfo(`listItemNames(count=-75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0114
     * @tc.name      DragAndExchange_ListItemNames_0114
     * @tc.desc      listItemNames(count=-12) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0114 begin`);
      const actual: string[] = listItemNames(-12);
      logInfo(`listItemNames(count=-12): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0115
     * @tc.name      DragAndExchange_ListItemNames_0115
     * @tc.desc      listItemNames(count=-7) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0115 begin`);
      const actual: string[] = listItemNames(-7);
      logInfo(`listItemNames(count=-7): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0116
     * @tc.name      DragAndExchange_ListItemNames_0116
     * @tc.desc      listItemNames(count=-42) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListItemNames_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0116 begin`);
      const actual: string[] = listItemNames(-42);
      logInfo(`listItemNames(count=-42): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}ListItemNames_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0117
     * @tc.name      DragAndExchange_ListItemNames_0117
     * @tc.desc      listItemNames(count=8.43) returns ["Item7","Item8","Item9"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0117 begin`);
      const actual: string[] = listItemNames(8.43);
      logInfo(`listItemNames(count=8.43): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`listItemNames(count=8.43): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=8.43): JSON.stringify(actual.slice(6, 9))=${JSON.stringify(actual.slice(6, 9))}`);
      expect(JSON.stringify(actual.slice(6, 9))).assertEqual('["Item7","Item8","Item9"]');
      logInfo(`${BUNDLE}ListItemNames_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0118
     * @tc.name      DragAndExchange_ListItemNames_0118
     * @tc.desc      listItemNames(count=70.35) returns ["Item67","Item68","Item69","Item70","Item71"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0118 begin`);
      const actual: string[] = listItemNames(70.35);
      logInfo(`listItemNames(count=70.35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`listItemNames(count=70.35): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=70.35): JSON.stringify(actual.slice(36, ...${JSON.stringify(actual.slice(36, 42))}`);
      expect(JSON.stringify(actual.slice(36, 42)))
        .assertEqual('["Item37","Item38","Item39","Item40","Item41","Item42"]');
      logInfo(`listItemNames(count=70.35): JSON.stringify(actual.slice(66, ...${JSON.stringify(actual.slice(66, 71))}`);
      expect(JSON.stringify(actual.slice(66, 71))).assertEqual('["Item67","Item68","Item69","Item70","Item71"]');
      logInfo(`${BUNDLE}ListItemNames_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0119
     * @tc.name      DragAndExchange_ListItemNames_0119
     * @tc.desc      listItemNames(count=32.46) returns ["Item31","Item32","Item33"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0119 begin`);
      const actual: string[] = listItemNames(32.46);
      logInfo(`listItemNames(count=32.46): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(33);
      logInfo(`listItemNames(count=32.46): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=32.46): JSON.stringify(actual.slice(18, ...${JSON.stringify(actual.slice(18, 24))}`);
      expect(JSON.stringify(actual.slice(18, 24)))
        .assertEqual('["Item19","Item20","Item21","Item22","Item23","Item24"]');
      logInfo(`listItemNames(count=32.46): JSON.stringify(actual.slice(30, ...${JSON.stringify(actual.slice(30, 33))}`);
      expect(JSON.stringify(actual.slice(30, 33))).assertEqual('["Item31","Item32","Item33"]');
      logInfo(`${BUNDLE}ListItemNames_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_ITEM_NAMES_0120
     * @tc.name      DragAndExchange_ListItemNames_0120
     * @tc.desc      listItemNames(count=46.55) returns ["Item43","Item44","Item45","Item46","Item47"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListItemNames_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListItemNames_0120 begin`);
      const actual: string[] = listItemNames(46.55);
      logInfo(`listItemNames(count=46.55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(47);
      logInfo(`listItemNames(count=46.55): JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["Item1","Item2","Item3","Item4","Item5","Item6"]');
      logInfo(`listItemNames(count=46.55): JSON.stringify(actual.slice(24, ...${JSON.stringify(actual.slice(24, 30))}`);
      expect(JSON.stringify(actual.slice(24, 30)))
        .assertEqual('["Item25","Item26","Item27","Item28","Item29","Item30"]');
      logInfo(`listItemNames(count=46.55): JSON.stringify(actual.slice(42, ...${JSON.stringify(actual.slice(42, 47))}`);
      expect(JSON.stringify(actual.slice(42, 47))).assertEqual('["Item43","Item44","Item45","Item46","Item47"]');
      logInfo(`${BUNDLE}ListItemNames_0120 end`);
    });
  });
}
