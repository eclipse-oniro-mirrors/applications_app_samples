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
import { gridAppNames } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridAppNames (50 cases). */
export default function gridAppNames2Test(): void {
  describe('GridAppNames2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0071
     * @tc.name      DragAndExchange_GridAppNames_0071
     * @tc.desc      gridAppNames(count=63) returns ["App63"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0071 begin`);
      const actual: string[] = gridAppNames(63);
      logInfo(`gridAppNames(count=63): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(63);
      logInfo(`gridAppNames(count=63): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=63): JSON.stringify(actual.slice(32, 38))=${JSON.stringify(actual.slice(32, 38))}`);
      expect(JSON.stringify(actual.slice(32, 38))).assertEqual('["App33","App34","App35","App36","App37","App38"]');
      logInfo(`gridAppNames(count=63): JSON.stringify(actual.slice(62, 63))=${JSON.stringify(actual.slice(62, 63))}`);
      expect(JSON.stringify(actual.slice(62, 63))).assertEqual('["App63"]');
      logInfo(`${BUNDLE}GridAppNames_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0072
     * @tc.name      DragAndExchange_GridAppNames_0072
     * @tc.desc      gridAppNames(count=46.67) returns ["App45","App46"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0072 begin`);
      const actual: string[] = gridAppNames(46.67);
      logInfo(`gridAppNames(count=46.67): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(46);
      logInfo(`gridAppNames(count=46.67): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=46.67): JSON.stringify(actual.slice(26, 3...${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=46.67): JSON.stringify(actual.slice(44, 4...${JSON.stringify(actual.slice(44, 46))}`);
      expect(JSON.stringify(actual.slice(44, 46))).assertEqual('["App45","App46"]');
      logInfo(`${BUNDLE}GridAppNames_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0073
     * @tc.name      DragAndExchange_GridAppNames_0073
     * @tc.desc      gridAppNames(count=71) returns ["App69","App70","App71"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0073 begin`);
      const actual: string[] = gridAppNames(71);
      logInfo(`gridAppNames(count=71): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`gridAppNames(count=71): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=71): JSON.stringify(actual.slice(38, 44))=${JSON.stringify(actual.slice(38, 44))}`);
      expect(JSON.stringify(actual.slice(38, 44))).assertEqual('["App39","App40","App41","App42","App43","App44"]');
      logInfo(`gridAppNames(count=71): JSON.stringify(actual.slice(68, 71))=${JSON.stringify(actual.slice(68, 71))}`);
      expect(JSON.stringify(actual.slice(68, 71))).assertEqual('["App69","App70","App71"]');
      logInfo(`${BUNDLE}GridAppNames_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0074
     * @tc.name      DragAndExchange_GridAppNames_0074
     * @tc.desc      gridAppNames(count=19) returns ["App15","App16","App17","App18","App19"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0074 begin`);
      const actual: string[] = gridAppNames(19);
      logInfo(`gridAppNames(count=19): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(19);
      logInfo(`gridAppNames(count=19): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=19): JSON.stringify(actual.slice(7, 14))=${JSON.stringify(actual.slice(7, 14))}`);
      expect(JSON.stringify(actual.slice(7, 14)))
        .assertEqual('["App8","App9","App10","App11","App12","App13","App14"]');
      logInfo(`gridAppNames(count=19): JSON.stringify(actual.slice(14, 19))=${JSON.stringify(actual.slice(14, 19))}`);
      expect(JSON.stringify(actual.slice(14, 19))).assertEqual('["App15","App16","App17","App18","App19"]');
      logInfo(`${BUNDLE}GridAppNames_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0075
     * @tc.name      DragAndExchange_GridAppNames_0075
     * @tc.desc      gridAppNames(count=23.88) returns ["App21","App22","App23"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0075 begin`);
      const actual: string[] = gridAppNames(23.88);
      logInfo(`gridAppNames(count=23.88): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(23);
      logInfo(`gridAppNames(count=23.88): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=23.88): JSON.stringify(actual.slice(14, 2...${JSON.stringify(actual.slice(14, 20))}`);
      expect(JSON.stringify(actual.slice(14, 20))).assertEqual('["App15","App16","App17","App18","App19","App20"]');
      logInfo(`gridAppNames(count=23.88): JSON.stringify(actual.slice(20, 2...${JSON.stringify(actual.slice(20, 23))}`);
      expect(JSON.stringify(actual.slice(20, 23))).assertEqual('["App21","App22","App23"]');
      logInfo(`${BUNDLE}GridAppNames_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0076
     * @tc.name      DragAndExchange_GridAppNames_0076
     * @tc.desc      gridAppNames(count=166) returns ["App165","App166"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0076 begin`);
      const actual: string[] = gridAppNames(166);
      logInfo(`gridAppNames(count=166): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(166);
      logInfo(`gridAppNames(count=166): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=166): JSON.stringify(actual.slice(86, 92))=${JSON.stringify(actual.slice(86, 92))}`);
      expect(JSON.stringify(actual.slice(86, 92))).assertEqual('["App87","App88","App89","App90","App91","App92"]');
      logInfo(`gridAppNames(count=166): JSON.stringify(actual.slice(164, ...${JSON.stringify(actual.slice(164, 166))}`);
      expect(JSON.stringify(actual.slice(164, 166))).assertEqual('["App165","App166"]');
      logInfo(`${BUNDLE}GridAppNames_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0077
     * @tc.name      DragAndExchange_GridAppNames_0077
     * @tc.desc      gridAppNames(count=74) returns ["App69","App70","App71","App72","App73","App74"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0077 begin`);
      const actual: string[] = gridAppNames(74);
      logInfo(`gridAppNames(count=74): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`gridAppNames(count=74): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=74): JSON.stringify(actual.slice(38, 44))=${JSON.stringify(actual.slice(38, 44))}`);
      expect(JSON.stringify(actual.slice(38, 44))).assertEqual('["App39","App40","App41","App42","App43","App44"]');
      logInfo(`gridAppNames(count=74): JSON.stringify(actual.slice(68, 74))=${JSON.stringify(actual.slice(68, 74))}`);
      expect(JSON.stringify(actual.slice(68, 74))).assertEqual('["App69","App70","App71","App72","App73","App74"]');
      logInfo(`${BUNDLE}GridAppNames_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0078
     * @tc.name      DragAndExchange_GridAppNames_0078
     * @tc.desc      gridAppNames(count=43) returns ["App39","App40","App41","App42","App43"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0078 begin`);
      const actual: string[] = gridAppNames(43);
      logInfo(`gridAppNames(count=43): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(43);
      logInfo(`gridAppNames(count=43): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=43): JSON.stringify(actual.slice(20, 26))=${JSON.stringify(actual.slice(20, 26))}`);
      expect(JSON.stringify(actual.slice(20, 26))).assertEqual('["App21","App22","App23","App24","App25","App26"]');
      logInfo(`gridAppNames(count=43): JSON.stringify(actual.slice(38, 43))=${JSON.stringify(actual.slice(38, 43))}`);
      expect(JSON.stringify(actual.slice(38, 43))).assertEqual('["App39","App40","App41","App42","App43"]');
      logInfo(`${BUNDLE}GridAppNames_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0079
     * @tc.name      DragAndExchange_GridAppNames_0079
     * @tc.desc      gridAppNames(count=48.45) returns ["App45","App46","App47","App48"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0079 begin`);
      const actual: string[] = gridAppNames(48.45);
      logInfo(`gridAppNames(count=48.45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(48);
      logInfo(`gridAppNames(count=48.45): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=48.45): JSON.stringify(actual.slice(26, 3...${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=48.45): JSON.stringify(actual.slice(44, 4...${JSON.stringify(actual.slice(44, 48))}`);
      expect(JSON.stringify(actual.slice(44, 48))).assertEqual('["App45","App46","App47","App48"]');
      logInfo(`${BUNDLE}GridAppNames_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0080
     * @tc.name      DragAndExchange_GridAppNames_0080
     * @tc.desc      gridAppNames(count=162) returns ["App159","App160","App161","App162"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0080 begin`);
      const actual: string[] = gridAppNames(162);
      logInfo(`gridAppNames(count=162): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(162);
      logInfo(`gridAppNames(count=162): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=162): JSON.stringify(actual.slice(80, 86))=${JSON.stringify(actual.slice(80, 86))}`);
      expect(JSON.stringify(actual.slice(80, 86))).assertEqual('["App81","App82","App83","App84","App85","App86"]');
      logInfo(`gridAppNames(count=162): JSON.stringify(actual.slice(158, ...${JSON.stringify(actual.slice(158, 162))}`);
      expect(JSON.stringify(actual.slice(158, 162))).assertEqual('["App159","App160","App161","App162"]');
      logInfo(`${BUNDLE}GridAppNames_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0081
     * @tc.name      DragAndExchange_GridAppNames_0081
     * @tc.desc      gridAppNames(count=148) returns ["App147","App148"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0081 begin`);
      const actual: string[] = gridAppNames(148);
      logInfo(`gridAppNames(count=148): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(148);
      logInfo(`gridAppNames(count=148): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=148): JSON.stringify(actual.slice(74, 80))=${JSON.stringify(actual.slice(74, 80))}`);
      expect(JSON.stringify(actual.slice(74, 80))).assertEqual('["App75","App76","App77","App78","App79","App80"]');
      logInfo(`gridAppNames(count=148): JSON.stringify(actual.slice(146, ...${JSON.stringify(actual.slice(146, 148))}`);
      expect(JSON.stringify(actual.slice(146, 148))).assertEqual('["App147","App148"]');
      logInfo(`${BUNDLE}GridAppNames_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0082
     * @tc.name      DragAndExchange_GridAppNames_0082
     * @tc.desc      gridAppNames(count=157) returns ["App153","App154","App155","App156","App157"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0082 begin`);
      const actual: string[] = gridAppNames(157);
      logInfo(`gridAppNames(count=157): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(157);
      logInfo(`gridAppNames(count=157): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=157): JSON.stringify(actual.slice(80, 86))=${JSON.stringify(actual.slice(80, 86))}`);
      expect(JSON.stringify(actual.slice(80, 86))).assertEqual('["App81","App82","App83","App84","App85","App86"]');
      logInfo(`gridAppNames(count=157): JSON.stringify(actual.slice(152, ...${JSON.stringify(actual.slice(152, 157))}`);
      expect(JSON.stringify(actual.slice(152, 157))).assertEqual('["App153","App154","App155","App156","App157"]');
      logInfo(`${BUNDLE}GridAppNames_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0083
     * @tc.name      DragAndExchange_GridAppNames_0083
     * @tc.desc      gridAppNames(count=8) returns ["App1","App2","App3","App4","App5","App6","App7","App8"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0083 begin`);
      const actual: string[] = gridAppNames(8);
      logInfo(`gridAppNames(count=8): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`gridAppNames(count=8): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["App1","App2","App3","App4","App5","App6","App7","App8"]');
      logInfo(`${BUNDLE}GridAppNames_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0084
     * @tc.name      DragAndExchange_GridAppNames_0084
     * @tc.desc      gridAppNames(count=24.66) returns ["App21","App22","App23","App24"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0084 begin`);
      const actual: string[] = gridAppNames(24.66);
      logInfo(`gridAppNames(count=24.66): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(24);
      logInfo(`gridAppNames(count=24.66): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=24.66): JSON.stringify(actual.slice(14, 2...${JSON.stringify(actual.slice(14, 20))}`);
      expect(JSON.stringify(actual.slice(14, 20))).assertEqual('["App15","App16","App17","App18","App19","App20"]');
      logInfo(`gridAppNames(count=24.66): JSON.stringify(actual.slice(20, 2...${JSON.stringify(actual.slice(20, 24))}`);
      expect(JSON.stringify(actual.slice(20, 24))).assertEqual('["App21","App22","App23","App24"]');
      logInfo(`${BUNDLE}GridAppNames_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0085
     * @tc.name      DragAndExchange_GridAppNames_0085
     * @tc.desc      gridAppNames(count=53) returns ["App51","App52","App53"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0085 begin`);
      const actual: string[] = gridAppNames(53);
      logInfo(`gridAppNames(count=53): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(53);
      logInfo(`gridAppNames(count=53): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=53): JSON.stringify(actual.slice(26, 32))=${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=53): JSON.stringify(actual.slice(50, 53))=${JSON.stringify(actual.slice(50, 53))}`);
      expect(JSON.stringify(actual.slice(50, 53))).assertEqual('["App51","App52","App53"]');
      logInfo(`${BUNDLE}GridAppNames_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0086
     * @tc.name      DragAndExchange_GridAppNames_0086
     * @tc.desc      gridAppNames(count=122) returns ["App117","App118","App119","App120","App121","App122"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0086 begin`);
      const actual: string[] = gridAppNames(122);
      logInfo(`gridAppNames(count=122): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(122);
      logInfo(`gridAppNames(count=122): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=122): JSON.stringify(actual.slice(62, 68))=${JSON.stringify(actual.slice(62, 68))}`);
      expect(JSON.stringify(actual.slice(62, 68))).assertEqual('["App63","App64","App65","App66","App67","App68"]');
      logInfo(`gridAppNames(count=122): JSON.stringify(actual.slice(116, ...${JSON.stringify(actual.slice(116, 122))}`);
      expect(JSON.stringify(actual.slice(116, 122)))
        .assertEqual('["App117","App118","App119","App120","App121","App122"]');
      logInfo(`${BUNDLE}GridAppNames_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0087
     * @tc.name      DragAndExchange_GridAppNames_0087
     * @tc.desc      gridAppNames(count=66) returns ["App63","App64","App65","App66"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0087 begin`);
      const actual: string[] = gridAppNames(66);
      logInfo(`gridAppNames(count=66): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`gridAppNames(count=66): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=66): JSON.stringify(actual.slice(32, 38))=${JSON.stringify(actual.slice(32, 38))}`);
      expect(JSON.stringify(actual.slice(32, 38))).assertEqual('["App33","App34","App35","App36","App37","App38"]');
      logInfo(`gridAppNames(count=66): JSON.stringify(actual.slice(62, 66))=${JSON.stringify(actual.slice(62, 66))}`);
      expect(JSON.stringify(actual.slice(62, 66))).assertEqual('["App63","App64","App65","App66"]');
      logInfo(`${BUNDLE}GridAppNames_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0088
     * @tc.name      DragAndExchange_GridAppNames_0088
     * @tc.desc      gridAppNames(count=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0088 begin`);
      const actual: string[] = gridAppNames(-1);
      logInfo(`gridAppNames(count=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0089
     * @tc.name      DragAndExchange_GridAppNames_0089
     * @tc.desc      gridAppNames(count=-68) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0089 begin`);
      const actual: string[] = gridAppNames(-68);
      logInfo(`gridAppNames(count=-68): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0090
     * @tc.name      DragAndExchange_GridAppNames_0090
     * @tc.desc      gridAppNames(count=-56) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0090 begin`);
      const actual: string[] = gridAppNames(-56);
      logInfo(`gridAppNames(count=-56): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0091
     * @tc.name      DragAndExchange_GridAppNames_0091
     * @tc.desc      gridAppNames(count=-31) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0091 begin`);
      const actual: string[] = gridAppNames(-31);
      logInfo(`gridAppNames(count=-31): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0092
     * @tc.name      DragAndExchange_GridAppNames_0092
     * @tc.desc      gridAppNames(count=-54) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0092 begin`);
      const actual: string[] = gridAppNames(-54);
      logInfo(`gridAppNames(count=-54): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0093
     * @tc.name      DragAndExchange_GridAppNames_0093
     * @tc.desc      gridAppNames(count=-4) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0093 begin`);
      const actual: string[] = gridAppNames(-4);
      logInfo(`gridAppNames(count=-4): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0094
     * @tc.name      DragAndExchange_GridAppNames_0094
     * @tc.desc      gridAppNames(count=-26) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0094 begin`);
      const actual: string[] = gridAppNames(-26);
      logInfo(`gridAppNames(count=-26): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0095
     * @tc.name      DragAndExchange_GridAppNames_0095
     * @tc.desc      gridAppNames(count=-97) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0095 begin`);
      const actual: string[] = gridAppNames(-97);
      logInfo(`gridAppNames(count=-97): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0096
     * @tc.name      DragAndExchange_GridAppNames_0096
     * @tc.desc      gridAppNames(count=-19) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0096 begin`);
      const actual: string[] = gridAppNames(-19);
      logInfo(`gridAppNames(count=-19): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0096 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0097
     * @tc.name      DragAndExchange_GridAppNames_0097
     * @tc.desc      gridAppNames(count=-38) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0097 begin`);
      const actual: string[] = gridAppNames(-38);
      logInfo(`gridAppNames(count=-38): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0098
     * @tc.name      DragAndExchange_GridAppNames_0098
     * @tc.desc      gridAppNames(count=64.04) returns ["App63","App64"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0098 begin`);
      const actual: string[] = gridAppNames(64.04);
      logInfo(`gridAppNames(count=64.04): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(64);
      logInfo(`gridAppNames(count=64.04): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=64.04): JSON.stringify(actual.slice(32, 3...${JSON.stringify(actual.slice(32, 38))}`);
      expect(JSON.stringify(actual.slice(32, 38))).assertEqual('["App33","App34","App35","App36","App37","App38"]');
      logInfo(`gridAppNames(count=64.04): JSON.stringify(actual.slice(62, 6...${JSON.stringify(actual.slice(62, 64))}`);
      expect(JSON.stringify(actual.slice(62, 64))).assertEqual('["App63","App64"]');
      logInfo(`${BUNDLE}GridAppNames_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0099
     * @tc.name      DragAndExchange_GridAppNames_0099
     * @tc.desc      gridAppNames(count=-95) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0099 begin`);
      const actual: string[] = gridAppNames(-95);
      logInfo(`gridAppNames(count=-95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0100
     * @tc.name      DragAndExchange_GridAppNames_0100
     * @tc.desc      gridAppNames(count=45.76) returns ["App45"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0100 begin`);
      const actual: string[] = gridAppNames(45.76);
      logInfo(`gridAppNames(count=45.76): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(45);
      logInfo(`gridAppNames(count=45.76): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=45.76): JSON.stringify(actual.slice(26, 3...${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=45.76): JSON.stringify(actual.slice(44, 4...${JSON.stringify(actual.slice(44, 45))}`);
      expect(JSON.stringify(actual.slice(44, 45))).assertEqual('["App45"]');
      logInfo(`${BUNDLE}GridAppNames_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0101
     * @tc.name      DragAndExchange_GridAppNames_0101
     * @tc.desc      gridAppNames(count=35.89) returns ["App33","App34","App35"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0101 begin`);
      const actual: string[] = gridAppNames(35.89);
      logInfo(`gridAppNames(count=35.89): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(35);
      logInfo(`gridAppNames(count=35.89): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=35.89): JSON.stringify(actual.slice(20, 2...${JSON.stringify(actual.slice(20, 26))}`);
      expect(JSON.stringify(actual.slice(20, 26))).assertEqual('["App21","App22","App23","App24","App25","App26"]');
      logInfo(`gridAppNames(count=35.89): JSON.stringify(actual.slice(32, 3...${JSON.stringify(actual.slice(32, 35))}`);
      expect(JSON.stringify(actual.slice(32, 35))).assertEqual('["App33","App34","App35"]');
      logInfo(`${BUNDLE}GridAppNames_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0102
     * @tc.name      DragAndExchange_GridAppNames_0102
     * @tc.desc      gridAppNames(count=-20) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0102 begin`);
      const actual: string[] = gridAppNames(-20);
      logInfo(`gridAppNames(count=-20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0103
     * @tc.name      DragAndExchange_GridAppNames_0103
     * @tc.desc      gridAppNames(count=-35) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0103 begin`);
      const actual: string[] = gridAppNames(-35);
      logInfo(`gridAppNames(count=-35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0104
     * @tc.name      DragAndExchange_GridAppNames_0104
     * @tc.desc      gridAppNames(count=-14) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0104 begin`);
      const actual: string[] = gridAppNames(-14);
      logInfo(`gridAppNames(count=-14): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0105
     * @tc.name      DragAndExchange_GridAppNames_0105
     * @tc.desc      gridAppNames(count=-45) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0105 begin`);
      const actual: string[] = gridAppNames(-45);
      logInfo(`gridAppNames(count=-45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0106
     * @tc.name      DragAndExchange_GridAppNames_0106
     * @tc.desc      gridAppNames(count=71.2) returns ["App69","App70","App71"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0106 begin`);
      const actual: string[] = gridAppNames(71.2);
      logInfo(`gridAppNames(count=71.2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`gridAppNames(count=71.2): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=71.2): JSON.stringify(actual.slice(38, 44))=${JSON.stringify(actual.slice(38, 44))}`);
      expect(JSON.stringify(actual.slice(38, 44))).assertEqual('["App39","App40","App41","App42","App43","App44"]');
      logInfo(`gridAppNames(count=71.2): JSON.stringify(actual.slice(68, 71))=${JSON.stringify(actual.slice(68, 71))}`);
      expect(JSON.stringify(actual.slice(68, 71))).assertEqual('["App69","App70","App71"]');
      logInfo(`${BUNDLE}GridAppNames_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0107
     * @tc.name      DragAndExchange_GridAppNames_0107
     * @tc.desc      gridAppNames(count=-65) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0107 begin`);
      const actual: string[] = gridAppNames(-65);
      logInfo(`gridAppNames(count=-65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0108
     * @tc.name      DragAndExchange_GridAppNames_0108
     * @tc.desc      gridAppNames(count=-50) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0108 begin`);
      const actual: string[] = gridAppNames(-50);
      logInfo(`gridAppNames(count=-50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0109
     * @tc.name      DragAndExchange_GridAppNames_0109
     * @tc.desc      gridAppNames(count=-91) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0109 begin`);
      const actual: string[] = gridAppNames(-91);
      logInfo(`gridAppNames(count=-91): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0110
     * @tc.name      DragAndExchange_GridAppNames_0110
     * @tc.desc      gridAppNames(count=10.43) returns ["App1","App2","App3","App4","App5","App6","App7","App8","App9...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0110 begin`);
      const actual: string[] = gridAppNames(10.43);
      logInfo(`gridAppNames(count=10.43): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`gridAppNames(count=10.43): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual))
        .assertEqual('["App1","App2","App3","App4","App5","App6","App7","App8","App9","App10"]');
      logInfo(`${BUNDLE}GridAppNames_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0111
     * @tc.name      DragAndExchange_GridAppNames_0111
     * @tc.desc      gridAppNames(count=-29) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0111 begin`);
      const actual: string[] = gridAppNames(-29);
      logInfo(`gridAppNames(count=-29): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0112
     * @tc.name      DragAndExchange_GridAppNames_0112
     * @tc.desc      gridAppNames(count=64) returns ["App63","App64"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0112 begin`);
      const actual: string[] = gridAppNames(64);
      logInfo(`gridAppNames(count=64): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(64);
      logInfo(`gridAppNames(count=64): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=64): JSON.stringify(actual.slice(32, 38))=${JSON.stringify(actual.slice(32, 38))}`);
      expect(JSON.stringify(actual.slice(32, 38))).assertEqual('["App33","App34","App35","App36","App37","App38"]');
      logInfo(`gridAppNames(count=64): JSON.stringify(actual.slice(62, 64))=${JSON.stringify(actual.slice(62, 64))}`);
      expect(JSON.stringify(actual.slice(62, 64))).assertEqual('["App63","App64"]');
      logInfo(`${BUNDLE}GridAppNames_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0113
     * @tc.name      DragAndExchange_GridAppNames_0113
     * @tc.desc      gridAppNames(count=-10) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0113 begin`);
      const actual: string[] = gridAppNames(-10);
      logInfo(`gridAppNames(count=-10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0114
     * @tc.name      DragAndExchange_GridAppNames_0114
     * @tc.desc      gridAppNames(count=-79) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0114 begin`);
      const actual: string[] = gridAppNames(-79);
      logInfo(`gridAppNames(count=-79): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0115
     * @tc.name      DragAndExchange_GridAppNames_0115
     * @tc.desc      gridAppNames(count=80.28) returns ["App75","App76","App77","App78","App79","App80"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0115 begin`);
      const actual: string[] = gridAppNames(80.28);
      logInfo(`gridAppNames(count=80.28): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`gridAppNames(count=80.28): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=80.28): JSON.stringify(actual.slice(38, 4...${JSON.stringify(actual.slice(38, 44))}`);
      expect(JSON.stringify(actual.slice(38, 44))).assertEqual('["App39","App40","App41","App42","App43","App44"]');
      logInfo(`gridAppNames(count=80.28): JSON.stringify(actual.slice(74, 8...${JSON.stringify(actual.slice(74, 80))}`);
      expect(JSON.stringify(actual.slice(74, 80))).assertEqual('["App75","App76","App77","App78","App79","App80"]');
      logInfo(`${BUNDLE}GridAppNames_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0116
     * @tc.name      DragAndExchange_GridAppNames_0116
     * @tc.desc      gridAppNames(count=-23) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0116 begin`);
      const actual: string[] = gridAppNames(-23);
      logInfo(`gridAppNames(count=-23): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0117
     * @tc.name      DragAndExchange_GridAppNames_0117
     * @tc.desc      gridAppNames(count=36.65) returns ["App33","App34","App35","App36"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0117 begin`);
      const actual: string[] = gridAppNames(36.65);
      logInfo(`gridAppNames(count=36.65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(36);
      logInfo(`gridAppNames(count=36.65): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=36.65): JSON.stringify(actual.slice(20, 2...${JSON.stringify(actual.slice(20, 26))}`);
      expect(JSON.stringify(actual.slice(20, 26))).assertEqual('["App21","App22","App23","App24","App25","App26"]');
      logInfo(`gridAppNames(count=36.65): JSON.stringify(actual.slice(32, 3...${JSON.stringify(actual.slice(32, 36))}`);
      expect(JSON.stringify(actual.slice(32, 36))).assertEqual('["App33","App34","App35","App36"]');
      logInfo(`${BUNDLE}GridAppNames_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0118
     * @tc.name      DragAndExchange_GridAppNames_0118
     * @tc.desc      gridAppNames(count=-39) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridAppNames_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0118 begin`);
      const actual: string[] = gridAppNames(-39);
      logInfo(`gridAppNames(count=-39): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0119
     * @tc.name      DragAndExchange_GridAppNames_0119
     * @tc.desc      gridAppNames(count=47.31) returns ["App45","App46","App47"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0119 begin`);
      const actual: string[] = gridAppNames(47.31);
      logInfo(`gridAppNames(count=47.31): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(47);
      logInfo(`gridAppNames(count=47.31): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=47.31): JSON.stringify(actual.slice(26, 3...${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=47.31): JSON.stringify(actual.slice(44, 4...${JSON.stringify(actual.slice(44, 47))}`);
      expect(JSON.stringify(actual.slice(44, 47))).assertEqual('["App45","App46","App47"]');
      logInfo(`${BUNDLE}GridAppNames_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0120
     * @tc.name      DragAndExchange_GridAppNames_0120
     * @tc.desc      gridAppNames(count=70.61) returns ["App69","App70"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0120 begin`);
      const actual: string[] = gridAppNames(70.61);
      logInfo(`gridAppNames(count=70.61): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`gridAppNames(count=70.61): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=70.61): JSON.stringify(actual.slice(38, 4...${JSON.stringify(actual.slice(38, 44))}`);
      expect(JSON.stringify(actual.slice(38, 44))).assertEqual('["App39","App40","App41","App42","App43","App44"]');
      logInfo(`gridAppNames(count=70.61): JSON.stringify(actual.slice(68, 7...${JSON.stringify(actual.slice(68, 70))}`);
      expect(JSON.stringify(actual.slice(68, 70))).assertEqual('["App69","App70"]');
      logInfo(`${BUNDLE}GridAppNames_0120 end`);
    });
  });
}
