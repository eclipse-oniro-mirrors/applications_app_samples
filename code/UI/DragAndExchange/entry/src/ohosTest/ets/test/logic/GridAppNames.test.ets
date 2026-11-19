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

/** Logic checks for gridAppNames (70 cases). */
export default function gridAppNamesTest(): void {
  describe('GridAppNamesTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0001
     * @tc.name      DragAndExchange_GridAppNames_0001
     * @tc.desc      gridAppNames(count=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridAppNames_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0001 begin`);
      const actual: string[] = gridAppNames(0);
      logInfo(`gridAppNames(count=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}GridAppNames_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0002
     * @tc.name      DragAndExchange_GridAppNames_0002
     * @tc.desc      gridAppNames(count=1) returns ["App1"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridAppNames_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0002 begin`);
      const actual: string[] = gridAppNames(1);
      logInfo(`gridAppNames(count=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`gridAppNames(count=1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridAppNames_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0003
     * @tc.name      DragAndExchange_GridAppNames_0003
     * @tc.desc      gridAppNames(count=2) returns ["App1","App2"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DragAndExchange_GridAppNames_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0003 begin`);
      const actual: string[] = gridAppNames(2);
      logInfo(`gridAppNames(count=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`gridAppNames(count=2): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["App1","App2"]');
      logInfo(`${BUNDLE}GridAppNames_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0004
     * @tc.name      DragAndExchange_GridAppNames_0004
     * @tc.desc      gridAppNames(count=5) returns ["App1","App2","App3","App4","App5"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0004 begin`);
      const actual: string[] = gridAppNames(5);
      logInfo(`gridAppNames(count=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`gridAppNames(count=5): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["App1","App2","App3","App4","App5"]');
      logInfo(`${BUNDLE}GridAppNames_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0005
     * @tc.name      DragAndExchange_GridAppNames_0005
     * @tc.desc      gridAppNames(count=10) returns ["App1","App2","App3","App4","App5","App6","App7","App8","App9","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0005 begin`);
      const actual: string[] = gridAppNames(10);
      logInfo(`gridAppNames(count=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`gridAppNames(count=10): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual))
        .assertEqual('["App1","App2","App3","App4","App5","App6","App7","App8","App9","App10"]');
      logInfo(`${BUNDLE}GridAppNames_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0006
     * @tc.name      DragAndExchange_GridAppNames_0006
     * @tc.desc      gridAppNames(count=100) returns ["App99","App100"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0006 begin`);
      const actual: string[] = gridAppNames(100);
      logInfo(`gridAppNames(count=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`gridAppNames(count=100): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=100): JSON.stringify(actual.slice(50, 56))=${JSON.stringify(actual.slice(50, 56))}`);
      expect(JSON.stringify(actual.slice(50, 56))).assertEqual('["App51","App52","App53","App54","App55","App56"]');
      logInfo(`gridAppNames(count=100): JSON.stringify(actual.slice(98, 10...${JSON.stringify(actual.slice(98, 100))}`);
      expect(JSON.stringify(actual.slice(98, 100))).assertEqual('["App99","App100"]');
      logInfo(`${BUNDLE}GridAppNames_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0007
     * @tc.name      DragAndExchange_GridAppNames_0007
     * @tc.desc      gridAppNames(count=3) returns ["App1","App2","App3"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0007 begin`);
      const actual: string[] = gridAppNames(3);
      logInfo(`gridAppNames(count=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`gridAppNames(count=3): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["App1","App2","App3"]');
      logInfo(`${BUNDLE}GridAppNames_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0008
     * @tc.name      DragAndExchange_GridAppNames_0008
     * @tc.desc      gridAppNames(count=15) returns ["App15"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0008 begin`);
      const actual: string[] = gridAppNames(15);
      logInfo(`gridAppNames(count=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`gridAppNames(count=15): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=15): JSON.stringify(actual.slice(7, 14))=${JSON.stringify(actual.slice(7, 14))}`);
      expect(JSON.stringify(actual.slice(7, 14)))
        .assertEqual('["App8","App9","App10","App11","App12","App13","App14"]');
      logInfo(`gridAppNames(count=15): JSON.stringify(actual.slice(14, 15))=${JSON.stringify(actual.slice(14, 15))}`);
      expect(JSON.stringify(actual.slice(14, 15))).assertEqual('["App15"]');
      logInfo(`${BUNDLE}GridAppNames_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0009
     * @tc.name      DragAndExchange_GridAppNames_0009
     * @tc.desc      gridAppNames(count=20) returns ["App15","App16","App17","App18","App19","App20"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0009 begin`);
      const actual: string[] = gridAppNames(20);
      logInfo(`gridAppNames(count=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(20);
      logInfo(`gridAppNames(count=20): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=20): JSON.stringify(actual.slice(7, 14))=${JSON.stringify(actual.slice(7, 14))}`);
      expect(JSON.stringify(actual.slice(7, 14)))
        .assertEqual('["App8","App9","App10","App11","App12","App13","App14"]');
      logInfo(`gridAppNames(count=20): JSON.stringify(actual.slice(14, 20))=${JSON.stringify(actual.slice(14, 20))}`);
      expect(JSON.stringify(actual.slice(14, 20))).assertEqual('["App15","App16","App17","App18","App19","App20"]');
      logInfo(`${BUNDLE}GridAppNames_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0010
     * @tc.name      DragAndExchange_GridAppNames_0010
     * @tc.desc      gridAppNames(count=25) returns ["App21","App22","App23","App24","App25"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0010 begin`);
      const actual: string[] = gridAppNames(25);
      logInfo(`gridAppNames(count=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(25);
      logInfo(`gridAppNames(count=25): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=25): JSON.stringify(actual.slice(14, 20))=${JSON.stringify(actual.slice(14, 20))}`);
      expect(JSON.stringify(actual.slice(14, 20))).assertEqual('["App15","App16","App17","App18","App19","App20"]');
      logInfo(`gridAppNames(count=25): JSON.stringify(actual.slice(20, 25))=${JSON.stringify(actual.slice(20, 25))}`);
      expect(JSON.stringify(actual.slice(20, 25))).assertEqual('["App21","App22","App23","App24","App25"]');
      logInfo(`${BUNDLE}GridAppNames_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0011
     * @tc.name      DragAndExchange_GridAppNames_0011
     * @tc.desc      gridAppNames(count=30) returns ["App27","App28","App29","App30"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0011 begin`);
      const actual: string[] = gridAppNames(30);
      logInfo(`gridAppNames(count=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`gridAppNames(count=30): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=30): JSON.stringify(actual.slice(14, 20))=${JSON.stringify(actual.slice(14, 20))}`);
      expect(JSON.stringify(actual.slice(14, 20))).assertEqual('["App15","App16","App17","App18","App19","App20"]');
      logInfo(`gridAppNames(count=30): JSON.stringify(actual.slice(26, 30))=${JSON.stringify(actual.slice(26, 30))}`);
      expect(JSON.stringify(actual.slice(26, 30))).assertEqual('["App27","App28","App29","App30"]');
      logInfo(`${BUNDLE}GridAppNames_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0012
     * @tc.name      DragAndExchange_GridAppNames_0012
     * @tc.desc      gridAppNames(count=35) returns ["App33","App34","App35"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0012 begin`);
      const actual: string[] = gridAppNames(35);
      logInfo(`gridAppNames(count=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(35);
      logInfo(`gridAppNames(count=35): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=35): JSON.stringify(actual.slice(20, 26))=${JSON.stringify(actual.slice(20, 26))}`);
      expect(JSON.stringify(actual.slice(20, 26))).assertEqual('["App21","App22","App23","App24","App25","App26"]');
      logInfo(`gridAppNames(count=35): JSON.stringify(actual.slice(32, 35))=${JSON.stringify(actual.slice(32, 35))}`);
      expect(JSON.stringify(actual.slice(32, 35))).assertEqual('["App33","App34","App35"]');
      logInfo(`${BUNDLE}GridAppNames_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0013
     * @tc.name      DragAndExchange_GridAppNames_0013
     * @tc.desc      gridAppNames(count=40) returns ["App39","App40"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0013 begin`);
      const actual: string[] = gridAppNames(40);
      logInfo(`gridAppNames(count=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(40);
      logInfo(`gridAppNames(count=40): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=40): JSON.stringify(actual.slice(20, 26))=${JSON.stringify(actual.slice(20, 26))}`);
      expect(JSON.stringify(actual.slice(20, 26))).assertEqual('["App21","App22","App23","App24","App25","App26"]');
      logInfo(`gridAppNames(count=40): JSON.stringify(actual.slice(38, 40))=${JSON.stringify(actual.slice(38, 40))}`);
      expect(JSON.stringify(actual.slice(38, 40))).assertEqual('["App39","App40"]');
      logInfo(`${BUNDLE}GridAppNames_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0014
     * @tc.name      DragAndExchange_GridAppNames_0014
     * @tc.desc      gridAppNames(count=45) returns ["App45"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0014 begin`);
      const actual: string[] = gridAppNames(45);
      logInfo(`gridAppNames(count=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(45);
      logInfo(`gridAppNames(count=45): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=45): JSON.stringify(actual.slice(26, 32))=${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=45): JSON.stringify(actual.slice(44, 45))=${JSON.stringify(actual.slice(44, 45))}`);
      expect(JSON.stringify(actual.slice(44, 45))).assertEqual('["App45"]');
      logInfo(`${BUNDLE}GridAppNames_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0015
     * @tc.name      DragAndExchange_GridAppNames_0015
     * @tc.desc      gridAppNames(count=50) returns ["App45","App46","App47","App48","App49","App50"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0015 begin`);
      const actual: string[] = gridAppNames(50);
      logInfo(`gridAppNames(count=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(50);
      logInfo(`gridAppNames(count=50): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=50): JSON.stringify(actual.slice(26, 32))=${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=50): JSON.stringify(actual.slice(44, 50))=${JSON.stringify(actual.slice(44, 50))}`);
      expect(JSON.stringify(actual.slice(44, 50))).assertEqual('["App45","App46","App47","App48","App49","App50"]');
      logInfo(`${BUNDLE}GridAppNames_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0016
     * @tc.name      DragAndExchange_GridAppNames_0016
     * @tc.desc      gridAppNames(count=55) returns ["App51","App52","App53","App54","App55"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0016 begin`);
      const actual: string[] = gridAppNames(55);
      logInfo(`gridAppNames(count=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(55);
      logInfo(`gridAppNames(count=55): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=55): JSON.stringify(actual.slice(26, 32))=${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=55): JSON.stringify(actual.slice(50, 55))=${JSON.stringify(actual.slice(50, 55))}`);
      expect(JSON.stringify(actual.slice(50, 55))).assertEqual('["App51","App52","App53","App54","App55"]');
      logInfo(`${BUNDLE}GridAppNames_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0017
     * @tc.name      DragAndExchange_GridAppNames_0017
     * @tc.desc      gridAppNames(count=60) returns ["App57","App58","App59","App60"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0017 begin`);
      const actual: string[] = gridAppNames(60);
      logInfo(`gridAppNames(count=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(60);
      logInfo(`gridAppNames(count=60): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=60): JSON.stringify(actual.slice(32, 38))=${JSON.stringify(actual.slice(32, 38))}`);
      expect(JSON.stringify(actual.slice(32, 38))).assertEqual('["App33","App34","App35","App36","App37","App38"]');
      logInfo(`gridAppNames(count=60): JSON.stringify(actual.slice(56, 60))=${JSON.stringify(actual.slice(56, 60))}`);
      expect(JSON.stringify(actual.slice(56, 60))).assertEqual('["App57","App58","App59","App60"]');
      logInfo(`${BUNDLE}GridAppNames_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0018
     * @tc.name      DragAndExchange_GridAppNames_0018
     * @tc.desc      gridAppNames(count=65) returns ["App63","App64","App65"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0018 begin`);
      const actual: string[] = gridAppNames(65);
      logInfo(`gridAppNames(count=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`gridAppNames(count=65): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=65): JSON.stringify(actual.slice(32, 38))=${JSON.stringify(actual.slice(32, 38))}`);
      expect(JSON.stringify(actual.slice(32, 38))).assertEqual('["App33","App34","App35","App36","App37","App38"]');
      logInfo(`gridAppNames(count=65): JSON.stringify(actual.slice(62, 65))=${JSON.stringify(actual.slice(62, 65))}`);
      expect(JSON.stringify(actual.slice(62, 65))).assertEqual('["App63","App64","App65"]');
      logInfo(`${BUNDLE}GridAppNames_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0019
     * @tc.name      DragAndExchange_GridAppNames_0019
     * @tc.desc      gridAppNames(count=70) returns ["App69","App70"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0019 begin`);
      const actual: string[] = gridAppNames(70);
      logInfo(`gridAppNames(count=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`gridAppNames(count=70): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=70): JSON.stringify(actual.slice(38, 44))=${JSON.stringify(actual.slice(38, 44))}`);
      expect(JSON.stringify(actual.slice(38, 44))).assertEqual('["App39","App40","App41","App42","App43","App44"]');
      logInfo(`gridAppNames(count=70): JSON.stringify(actual.slice(68, 70))=${JSON.stringify(actual.slice(68, 70))}`);
      expect(JSON.stringify(actual.slice(68, 70))).assertEqual('["App69","App70"]');
      logInfo(`${BUNDLE}GridAppNames_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0020
     * @tc.name      DragAndExchange_GridAppNames_0020
     * @tc.desc      gridAppNames(count=75) returns ["App75"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0020 begin`);
      const actual: string[] = gridAppNames(75);
      logInfo(`gridAppNames(count=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`gridAppNames(count=75): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=75): JSON.stringify(actual.slice(38, 44))=${JSON.stringify(actual.slice(38, 44))}`);
      expect(JSON.stringify(actual.slice(38, 44))).assertEqual('["App39","App40","App41","App42","App43","App44"]');
      logInfo(`gridAppNames(count=75): JSON.stringify(actual.slice(74, 75))=${JSON.stringify(actual.slice(74, 75))}`);
      expect(JSON.stringify(actual.slice(74, 75))).assertEqual('["App75"]');
      logInfo(`${BUNDLE}GridAppNames_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0021
     * @tc.name      DragAndExchange_GridAppNames_0021
     * @tc.desc      gridAppNames(count=80) returns ["App75","App76","App77","App78","App79","App80"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0021 begin`);
      const actual: string[] = gridAppNames(80);
      logInfo(`gridAppNames(count=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`gridAppNames(count=80): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=80): JSON.stringify(actual.slice(38, 44))=${JSON.stringify(actual.slice(38, 44))}`);
      expect(JSON.stringify(actual.slice(38, 44))).assertEqual('["App39","App40","App41","App42","App43","App44"]');
      logInfo(`gridAppNames(count=80): JSON.stringify(actual.slice(74, 80))=${JSON.stringify(actual.slice(74, 80))}`);
      expect(JSON.stringify(actual.slice(74, 80))).assertEqual('["App75","App76","App77","App78","App79","App80"]');
      logInfo(`${BUNDLE}GridAppNames_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0022
     * @tc.name      DragAndExchange_GridAppNames_0022
     * @tc.desc      gridAppNames(count=85) returns ["App81","App82","App83","App84","App85"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0022 begin`);
      const actual: string[] = gridAppNames(85);
      logInfo(`gridAppNames(count=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`gridAppNames(count=85): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=85): JSON.stringify(actual.slice(44, 50))=${JSON.stringify(actual.slice(44, 50))}`);
      expect(JSON.stringify(actual.slice(44, 50))).assertEqual('["App45","App46","App47","App48","App49","App50"]');
      logInfo(`gridAppNames(count=85): JSON.stringify(actual.slice(80, 85))=${JSON.stringify(actual.slice(80, 85))}`);
      expect(JSON.stringify(actual.slice(80, 85))).assertEqual('["App81","App82","App83","App84","App85"]');
      logInfo(`${BUNDLE}GridAppNames_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0023
     * @tc.name      DragAndExchange_GridAppNames_0023
     * @tc.desc      gridAppNames(count=90) returns ["App87","App88","App89","App90"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0023 begin`);
      const actual: string[] = gridAppNames(90);
      logInfo(`gridAppNames(count=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(90);
      logInfo(`gridAppNames(count=90): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=90): JSON.stringify(actual.slice(44, 50))=${JSON.stringify(actual.slice(44, 50))}`);
      expect(JSON.stringify(actual.slice(44, 50))).assertEqual('["App45","App46","App47","App48","App49","App50"]');
      logInfo(`gridAppNames(count=90): JSON.stringify(actual.slice(86, 90))=${JSON.stringify(actual.slice(86, 90))}`);
      expect(JSON.stringify(actual.slice(86, 90))).assertEqual('["App87","App88","App89","App90"]');
      logInfo(`${BUNDLE}GridAppNames_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0024
     * @tc.name      DragAndExchange_GridAppNames_0024
     * @tc.desc      gridAppNames(count=95) returns ["App93","App94","App95"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0024 begin`);
      const actual: string[] = gridAppNames(95);
      logInfo(`gridAppNames(count=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`gridAppNames(count=95): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=95): JSON.stringify(actual.slice(50, 56))=${JSON.stringify(actual.slice(50, 56))}`);
      expect(JSON.stringify(actual.slice(50, 56))).assertEqual('["App51","App52","App53","App54","App55","App56"]');
      logInfo(`gridAppNames(count=95): JSON.stringify(actual.slice(92, 95))=${JSON.stringify(actual.slice(92, 95))}`);
      expect(JSON.stringify(actual.slice(92, 95))).assertEqual('["App93","App94","App95"]');
      logInfo(`${BUNDLE}GridAppNames_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0025
     * @tc.name      DragAndExchange_GridAppNames_0025
     * @tc.desc      gridAppNames(count=105) returns ["App105"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0025 begin`);
      const actual: string[] = gridAppNames(105);
      logInfo(`gridAppNames(count=105): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`gridAppNames(count=105): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=105): JSON.stringify(actual.slice(56, 62))=${JSON.stringify(actual.slice(56, 62))}`);
      expect(JSON.stringify(actual.slice(56, 62))).assertEqual('["App57","App58","App59","App60","App61","App62"]');
      logInfo(`gridAppNames(count=105): JSON.stringify(actual.slice(104, ...${JSON.stringify(actual.slice(104, 105))}`);
      expect(JSON.stringify(actual.slice(104, 105))).assertEqual('["App105"]');
      logInfo(`${BUNDLE}GridAppNames_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0026
     * @tc.name      DragAndExchange_GridAppNames_0026
     * @tc.desc      gridAppNames(count=110) returns ["App105","App106","App107","App108","App109","App110"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0026 begin`);
      const actual: string[] = gridAppNames(110);
      logInfo(`gridAppNames(count=110): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(110);
      logInfo(`gridAppNames(count=110): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=110): JSON.stringify(actual.slice(56, 62))=${JSON.stringify(actual.slice(56, 62))}`);
      expect(JSON.stringify(actual.slice(56, 62))).assertEqual('["App57","App58","App59","App60","App61","App62"]');
      logInfo(`gridAppNames(count=110): JSON.stringify(actual.slice(104, ...${JSON.stringify(actual.slice(104, 110))}`);
      expect(JSON.stringify(actual.slice(104, 110)))
        .assertEqual('["App105","App106","App107","App108","App109","App110"]');
      logInfo(`${BUNDLE}GridAppNames_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0027
     * @tc.name      DragAndExchange_GridAppNames_0027
     * @tc.desc      gridAppNames(count=115) returns ["App111","App112","App113","App114","App115"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0027 begin`);
      const actual: string[] = gridAppNames(115);
      logInfo(`gridAppNames(count=115): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(115);
      logInfo(`gridAppNames(count=115): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=115): JSON.stringify(actual.slice(56, 62))=${JSON.stringify(actual.slice(56, 62))}`);
      expect(JSON.stringify(actual.slice(56, 62))).assertEqual('["App57","App58","App59","App60","App61","App62"]');
      logInfo(`gridAppNames(count=115): JSON.stringify(actual.slice(110, ...${JSON.stringify(actual.slice(110, 115))}`);
      expect(JSON.stringify(actual.slice(110, 115))).assertEqual('["App111","App112","App113","App114","App115"]');
      logInfo(`${BUNDLE}GridAppNames_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0028
     * @tc.name      DragAndExchange_GridAppNames_0028
     * @tc.desc      gridAppNames(count=120) returns ["App117","App118","App119","App120"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0028 begin`);
      const actual: string[] = gridAppNames(120);
      logInfo(`gridAppNames(count=120): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(120);
      logInfo(`gridAppNames(count=120): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=120): JSON.stringify(actual.slice(62, 68))=${JSON.stringify(actual.slice(62, 68))}`);
      expect(JSON.stringify(actual.slice(62, 68))).assertEqual('["App63","App64","App65","App66","App67","App68"]');
      logInfo(`gridAppNames(count=120): JSON.stringify(actual.slice(116, ...${JSON.stringify(actual.slice(116, 120))}`);
      expect(JSON.stringify(actual.slice(116, 120))).assertEqual('["App117","App118","App119","App120"]');
      logInfo(`${BUNDLE}GridAppNames_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0029
     * @tc.name      DragAndExchange_GridAppNames_0029
     * @tc.desc      gridAppNames(count=125) returns ["App123","App124","App125"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0029 begin`);
      const actual: string[] = gridAppNames(125);
      logInfo(`gridAppNames(count=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(125);
      logInfo(`gridAppNames(count=125): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=125): JSON.stringify(actual.slice(62, 68))=${JSON.stringify(actual.slice(62, 68))}`);
      expect(JSON.stringify(actual.slice(62, 68))).assertEqual('["App63","App64","App65","App66","App67","App68"]');
      logInfo(`gridAppNames(count=125): JSON.stringify(actual.slice(122, ...${JSON.stringify(actual.slice(122, 125))}`);
      expect(JSON.stringify(actual.slice(122, 125))).assertEqual('["App123","App124","App125"]');
      logInfo(`${BUNDLE}GridAppNames_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0030
     * @tc.name      DragAndExchange_GridAppNames_0030
     * @tc.desc      gridAppNames(count=130) returns ["App129","App130"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0030 begin`);
      const actual: string[] = gridAppNames(130);
      logInfo(`gridAppNames(count=130): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(130);
      logInfo(`gridAppNames(count=130): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=130): JSON.stringify(actual.slice(68, 74))=${JSON.stringify(actual.slice(68, 74))}`);
      expect(JSON.stringify(actual.slice(68, 74))).assertEqual('["App69","App70","App71","App72","App73","App74"]');
      logInfo(`gridAppNames(count=130): JSON.stringify(actual.slice(128, ...${JSON.stringify(actual.slice(128, 130))}`);
      expect(JSON.stringify(actual.slice(128, 130))).assertEqual('["App129","App130"]');
      logInfo(`${BUNDLE}GridAppNames_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0031
     * @tc.name      DragAndExchange_GridAppNames_0031
     * @tc.desc      gridAppNames(count=135) returns ["App135"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0031 begin`);
      const actual: string[] = gridAppNames(135);
      logInfo(`gridAppNames(count=135): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`gridAppNames(count=135): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=135): JSON.stringify(actual.slice(68, 74))=${JSON.stringify(actual.slice(68, 74))}`);
      expect(JSON.stringify(actual.slice(68, 74))).assertEqual('["App69","App70","App71","App72","App73","App74"]');
      logInfo(`gridAppNames(count=135): JSON.stringify(actual.slice(134, ...${JSON.stringify(actual.slice(134, 135))}`);
      expect(JSON.stringify(actual.slice(134, 135))).assertEqual('["App135"]');
      logInfo(`${BUNDLE}GridAppNames_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0032
     * @tc.name      DragAndExchange_GridAppNames_0032
     * @tc.desc      gridAppNames(count=140) returns ["App135","App136","App137","App138","App139","App140"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0032 begin`);
      const actual: string[] = gridAppNames(140);
      logInfo(`gridAppNames(count=140): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(140);
      logInfo(`gridAppNames(count=140): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=140): JSON.stringify(actual.slice(68, 74))=${JSON.stringify(actual.slice(68, 74))}`);
      expect(JSON.stringify(actual.slice(68, 74))).assertEqual('["App69","App70","App71","App72","App73","App74"]');
      logInfo(`gridAppNames(count=140): JSON.stringify(actual.slice(134, ...${JSON.stringify(actual.slice(134, 140))}`);
      expect(JSON.stringify(actual.slice(134, 140)))
        .assertEqual('["App135","App136","App137","App138","App139","App140"]');
      logInfo(`${BUNDLE}GridAppNames_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0033
     * @tc.name      DragAndExchange_GridAppNames_0033
     * @tc.desc      gridAppNames(count=145) returns ["App141","App142","App143","App144","App145"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0033 begin`);
      const actual: string[] = gridAppNames(145);
      logInfo(`gridAppNames(count=145): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(145);
      logInfo(`gridAppNames(count=145): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=145): JSON.stringify(actual.slice(74, 80))=${JSON.stringify(actual.slice(74, 80))}`);
      expect(JSON.stringify(actual.slice(74, 80))).assertEqual('["App75","App76","App77","App78","App79","App80"]');
      logInfo(`gridAppNames(count=145): JSON.stringify(actual.slice(140, ...${JSON.stringify(actual.slice(140, 145))}`);
      expect(JSON.stringify(actual.slice(140, 145))).assertEqual('["App141","App142","App143","App144","App145"]');
      logInfo(`${BUNDLE}GridAppNames_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0034
     * @tc.name      DragAndExchange_GridAppNames_0034
     * @tc.desc      gridAppNames(count=150) returns ["App147","App148","App149","App150"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0034 begin`);
      const actual: string[] = gridAppNames(150);
      logInfo(`gridAppNames(count=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(150);
      logInfo(`gridAppNames(count=150): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=150): JSON.stringify(actual.slice(74, 80))=${JSON.stringify(actual.slice(74, 80))}`);
      expect(JSON.stringify(actual.slice(74, 80))).assertEqual('["App75","App76","App77","App78","App79","App80"]');
      logInfo(`gridAppNames(count=150): JSON.stringify(actual.slice(146, ...${JSON.stringify(actual.slice(146, 150))}`);
      expect(JSON.stringify(actual.slice(146, 150))).assertEqual('["App147","App148","App149","App150"]');
      logInfo(`${BUNDLE}GridAppNames_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0035
     * @tc.name      DragAndExchange_GridAppNames_0035
     * @tc.desc      gridAppNames(count=155) returns ["App153","App154","App155"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0035 begin`);
      const actual: string[] = gridAppNames(155);
      logInfo(`gridAppNames(count=155): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(155);
      logInfo(`gridAppNames(count=155): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=155): JSON.stringify(actual.slice(80, 86))=${JSON.stringify(actual.slice(80, 86))}`);
      expect(JSON.stringify(actual.slice(80, 86))).assertEqual('["App81","App82","App83","App84","App85","App86"]');
      logInfo(`gridAppNames(count=155): JSON.stringify(actual.slice(152, ...${JSON.stringify(actual.slice(152, 155))}`);
      expect(JSON.stringify(actual.slice(152, 155))).assertEqual('["App153","App154","App155"]');
      logInfo(`${BUNDLE}GridAppNames_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0036
     * @tc.name      DragAndExchange_GridAppNames_0036
     * @tc.desc      gridAppNames(count=160) returns ["App159","App160"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0036 begin`);
      const actual: string[] = gridAppNames(160);
      logInfo(`gridAppNames(count=160): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(160);
      logInfo(`gridAppNames(count=160): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=160): JSON.stringify(actual.slice(80, 86))=${JSON.stringify(actual.slice(80, 86))}`);
      expect(JSON.stringify(actual.slice(80, 86))).assertEqual('["App81","App82","App83","App84","App85","App86"]');
      logInfo(`gridAppNames(count=160): JSON.stringify(actual.slice(158, ...${JSON.stringify(actual.slice(158, 160))}`);
      expect(JSON.stringify(actual.slice(158, 160))).assertEqual('["App159","App160"]');
      logInfo(`${BUNDLE}GridAppNames_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0037
     * @tc.name      DragAndExchange_GridAppNames_0037
     * @tc.desc      gridAppNames(count=165) returns ["App165"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0037 begin`);
      const actual: string[] = gridAppNames(165);
      logInfo(`gridAppNames(count=165): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(165);
      logInfo(`gridAppNames(count=165): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=165): JSON.stringify(actual.slice(86, 92))=${JSON.stringify(actual.slice(86, 92))}`);
      expect(JSON.stringify(actual.slice(86, 92))).assertEqual('["App87","App88","App89","App90","App91","App92"]');
      logInfo(`gridAppNames(count=165): JSON.stringify(actual.slice(164, ...${JSON.stringify(actual.slice(164, 165))}`);
      expect(JSON.stringify(actual.slice(164, 165))).assertEqual('["App165"]');
      logInfo(`${BUNDLE}GridAppNames_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0038
     * @tc.name      DragAndExchange_GridAppNames_0038
     * @tc.desc      gridAppNames(count=170) returns ["App165","App166","App167","App168","App169","App170"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0038 begin`);
      const actual: string[] = gridAppNames(170);
      logInfo(`gridAppNames(count=170): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`gridAppNames(count=170): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=170): JSON.stringify(actual.slice(86, 92))=${JSON.stringify(actual.slice(86, 92))}`);
      expect(JSON.stringify(actual.slice(86, 92))).assertEqual('["App87","App88","App89","App90","App91","App92"]');
      logInfo(`gridAppNames(count=170): JSON.stringify(actual.slice(164, ...${JSON.stringify(actual.slice(164, 170))}`);
      expect(JSON.stringify(actual.slice(164, 170)))
        .assertEqual('["App165","App166","App167","App168","App169","App170"]');
      logInfo(`${BUNDLE}GridAppNames_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0039
     * @tc.name      DragAndExchange_GridAppNames_0039
     * @tc.desc      gridAppNames(count=175) returns ["App171","App172","App173","App174","App175"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0039 begin`);
      const actual: string[] = gridAppNames(175);
      logInfo(`gridAppNames(count=175): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`gridAppNames(count=175): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=175): JSON.stringify(actual.slice(86, 92))=${JSON.stringify(actual.slice(86, 92))}`);
      expect(JSON.stringify(actual.slice(86, 92))).assertEqual('["App87","App88","App89","App90","App91","App92"]');
      logInfo(`gridAppNames(count=175): JSON.stringify(actual.slice(170, ...${JSON.stringify(actual.slice(170, 175))}`);
      expect(JSON.stringify(actual.slice(170, 175))).assertEqual('["App171","App172","App173","App174","App175"]');
      logInfo(`${BUNDLE}GridAppNames_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0040
     * @tc.name      DragAndExchange_GridAppNames_0040
     * @tc.desc      gridAppNames(count=180) returns ["App177","App178","App179","App180"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0040 begin`);
      const actual: string[] = gridAppNames(180);
      logInfo(`gridAppNames(count=180): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`gridAppNames(count=180): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=180): JSON.stringify(actual.slice(92, 98))=${JSON.stringify(actual.slice(92, 98))}`);
      expect(JSON.stringify(actual.slice(92, 98))).assertEqual('["App93","App94","App95","App96","App97","App98"]');
      logInfo(`gridAppNames(count=180): JSON.stringify(actual.slice(176, ...${JSON.stringify(actual.slice(176, 180))}`);
      expect(JSON.stringify(actual.slice(176, 180))).assertEqual('["App177","App178","App179","App180"]');
      logInfo(`${BUNDLE}GridAppNames_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0041
     * @tc.name      DragAndExchange_GridAppNames_0041
     * @tc.desc      gridAppNames(count=185) returns ["App183","App184","App185"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0041 begin`);
      const actual: string[] = gridAppNames(185);
      logInfo(`gridAppNames(count=185): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(185);
      logInfo(`gridAppNames(count=185): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=185): JSON.stringify(actual.slice(92, 98))=${JSON.stringify(actual.slice(92, 98))}`);
      expect(JSON.stringify(actual.slice(92, 98))).assertEqual('["App93","App94","App95","App96","App97","App98"]');
      logInfo(`gridAppNames(count=185): JSON.stringify(actual.slice(182, ...${JSON.stringify(actual.slice(182, 185))}`);
      expect(JSON.stringify(actual.slice(182, 185))).assertEqual('["App183","App184","App185"]');
      logInfo(`${BUNDLE}GridAppNames_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0042
     * @tc.name      DragAndExchange_GridAppNames_0042
     * @tc.desc      gridAppNames(count=190) returns ["App189","App190"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0042 begin`);
      const actual: string[] = gridAppNames(190);
      logInfo(`gridAppNames(count=190): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(190);
      logInfo(`gridAppNames(count=190): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=190): JSON.stringify(actual.slice(98, 10...${JSON.stringify(actual.slice(98, 104))}`);
      expect(JSON.stringify(actual.slice(98, 104)))
        .assertEqual('["App99","App100","App101","App102","App103","App104"]');
      logInfo(`gridAppNames(count=190): JSON.stringify(actual.slice(188, ...${JSON.stringify(actual.slice(188, 190))}`);
      expect(JSON.stringify(actual.slice(188, 190))).assertEqual('["App189","App190"]');
      logInfo(`${BUNDLE}GridAppNames_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0043
     * @tc.name      DragAndExchange_GridAppNames_0043
     * @tc.desc      gridAppNames(count=195) returns ["App195"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0043 begin`);
      const actual: string[] = gridAppNames(195);
      logInfo(`gridAppNames(count=195): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(195);
      logInfo(`gridAppNames(count=195): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=195): JSON.stringify(actual.slice(98, 10...${JSON.stringify(actual.slice(98, 104))}`);
      expect(JSON.stringify(actual.slice(98, 104)))
        .assertEqual('["App99","App100","App101","App102","App103","App104"]');
      logInfo(`gridAppNames(count=195): JSON.stringify(actual.slice(194, ...${JSON.stringify(actual.slice(194, 195))}`);
      expect(JSON.stringify(actual.slice(194, 195))).assertEqual('["App195"]');
      logInfo(`${BUNDLE}GridAppNames_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0044
     * @tc.name      DragAndExchange_GridAppNames_0044
     * @tc.desc      gridAppNames(count=200) returns ["App195","App196","App197","App198","App199","App200"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0044 begin`);
      const actual: string[] = gridAppNames(200);
      logInfo(`gridAppNames(count=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(200);
      logInfo(`gridAppNames(count=200): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=200): JSON.stringify(actual.slice(98, 10...${JSON.stringify(actual.slice(98, 104))}`);
      expect(JSON.stringify(actual.slice(98, 104)))
        .assertEqual('["App99","App100","App101","App102","App103","App104"]');
      logInfo(`gridAppNames(count=200): JSON.stringify(actual.slice(194, ...${JSON.stringify(actual.slice(194, 200))}`);
      expect(JSON.stringify(actual.slice(194, 200)))
        .assertEqual('["App195","App196","App197","App198","App199","App200"]');
      logInfo(`${BUNDLE}GridAppNames_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0045
     * @tc.name      DragAndExchange_GridAppNames_0045
     * @tc.desc      gridAppNames(count=152) returns ["App147","App148","App149","App150","App151","App152"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0045 begin`);
      const actual: string[] = gridAppNames(152);
      logInfo(`gridAppNames(count=152): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(152);
      logInfo(`gridAppNames(count=152): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=152): JSON.stringify(actual.slice(74, 80))=${JSON.stringify(actual.slice(74, 80))}`);
      expect(JSON.stringify(actual.slice(74, 80))).assertEqual('["App75","App76","App77","App78","App79","App80"]');
      logInfo(`gridAppNames(count=152): JSON.stringify(actual.slice(146, ...${JSON.stringify(actual.slice(146, 152))}`);
      expect(JSON.stringify(actual.slice(146, 152)))
        .assertEqual('["App147","App148","App149","App150","App151","App152"]');
      logInfo(`${BUNDLE}GridAppNames_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0046
     * @tc.name      DragAndExchange_GridAppNames_0046
     * @tc.desc      gridAppNames(count=67) returns ["App63","App64","App65","App66","App67"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0046 begin`);
      const actual: string[] = gridAppNames(67);
      logInfo(`gridAppNames(count=67): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`gridAppNames(count=67): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=67): JSON.stringify(actual.slice(32, 38))=${JSON.stringify(actual.slice(32, 38))}`);
      expect(JSON.stringify(actual.slice(32, 38))).assertEqual('["App33","App34","App35","App36","App37","App38"]');
      logInfo(`gridAppNames(count=67): JSON.stringify(actual.slice(62, 67))=${JSON.stringify(actual.slice(62, 67))}`);
      expect(JSON.stringify(actual.slice(62, 67))).assertEqual('["App63","App64","App65","App66","App67"]');
      logInfo(`${BUNDLE}GridAppNames_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0047
     * @tc.name      DragAndExchange_GridAppNames_0047
     * @tc.desc      gridAppNames(count=128) returns ["App123","App124","App125","App126","App127","App128"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0047 begin`);
      const actual: string[] = gridAppNames(128);
      logInfo(`gridAppNames(count=128): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`gridAppNames(count=128): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=128): JSON.stringify(actual.slice(62, 68))=${JSON.stringify(actual.slice(62, 68))}`);
      expect(JSON.stringify(actual.slice(62, 68))).assertEqual('["App63","App64","App65","App66","App67","App68"]');
      logInfo(`gridAppNames(count=128): JSON.stringify(actual.slice(122, ...${JSON.stringify(actual.slice(122, 128))}`);
      expect(JSON.stringify(actual.slice(122, 128)))
        .assertEqual('["App123","App124","App125","App126","App127","App128"]');
      logInfo(`${BUNDLE}GridAppNames_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0048
     * @tc.name      DragAndExchange_GridAppNames_0048
     * @tc.desc      gridAppNames(count=94) returns ["App93","App94"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0048 begin`);
      const actual: string[] = gridAppNames(94);
      logInfo(`gridAppNames(count=94): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`gridAppNames(count=94): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=94): JSON.stringify(actual.slice(50, 56))=${JSON.stringify(actual.slice(50, 56))}`);
      expect(JSON.stringify(actual.slice(50, 56))).assertEqual('["App51","App52","App53","App54","App55","App56"]');
      logInfo(`gridAppNames(count=94): JSON.stringify(actual.slice(92, 94))=${JSON.stringify(actual.slice(92, 94))}`);
      expect(JSON.stringify(actual.slice(92, 94))).assertEqual('["App93","App94"]');
      logInfo(`${BUNDLE}GridAppNames_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0049
     * @tc.name      DragAndExchange_GridAppNames_0049
     * @tc.desc      gridAppNames(count=64.68) returns ["App63","App64"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0049 begin`);
      const actual: string[] = gridAppNames(64.68);
      logInfo(`gridAppNames(count=64.68): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(64);
      logInfo(`gridAppNames(count=64.68): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=64.68): JSON.stringify(actual.slice(32, 3...${JSON.stringify(actual.slice(32, 38))}`);
      expect(JSON.stringify(actual.slice(32, 38))).assertEqual('["App33","App34","App35","App36","App37","App38"]');
      logInfo(`gridAppNames(count=64.68): JSON.stringify(actual.slice(62, 6...${JSON.stringify(actual.slice(62, 64))}`);
      expect(JSON.stringify(actual.slice(62, 64))).assertEqual('["App63","App64"]');
      logInfo(`${BUNDLE}GridAppNames_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0050
     * @tc.name      DragAndExchange_GridAppNames_0050
     * @tc.desc      gridAppNames(count=147) returns ["App147"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0050 begin`);
      const actual: string[] = gridAppNames(147);
      logInfo(`gridAppNames(count=147): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(147);
      logInfo(`gridAppNames(count=147): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=147): JSON.stringify(actual.slice(74, 80))=${JSON.stringify(actual.slice(74, 80))}`);
      expect(JSON.stringify(actual.slice(74, 80))).assertEqual('["App75","App76","App77","App78","App79","App80"]');
      logInfo(`gridAppNames(count=147): JSON.stringify(actual.slice(146, ...${JSON.stringify(actual.slice(146, 147))}`);
      expect(JSON.stringify(actual.slice(146, 147))).assertEqual('["App147"]');
      logInfo(`${BUNDLE}GridAppNames_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0051
     * @tc.name      DragAndExchange_GridAppNames_0051
     * @tc.desc      gridAppNames(count=38) returns ["App33","App34","App35","App36","App37","App38"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0051 begin`);
      const actual: string[] = gridAppNames(38);
      logInfo(`gridAppNames(count=38): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(38);
      logInfo(`gridAppNames(count=38): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=38): JSON.stringify(actual.slice(20, 26))=${JSON.stringify(actual.slice(20, 26))}`);
      expect(JSON.stringify(actual.slice(20, 26))).assertEqual('["App21","App22","App23","App24","App25","App26"]');
      logInfo(`gridAppNames(count=38): JSON.stringify(actual.slice(32, 38))=${JSON.stringify(actual.slice(32, 38))}`);
      expect(JSON.stringify(actual.slice(32, 38))).assertEqual('["App33","App34","App35","App36","App37","App38"]');
      logInfo(`${BUNDLE}GridAppNames_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0052
     * @tc.name      DragAndExchange_GridAppNames_0052
     * @tc.desc      gridAppNames(count=4.13) returns ["App1","App2","App3","App4"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0052 begin`);
      const actual: string[] = gridAppNames(4.13);
      logInfo(`gridAppNames(count=4.13): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`gridAppNames(count=4.13): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["App1","App2","App3","App4"]');
      logInfo(`${BUNDLE}GridAppNames_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0053
     * @tc.name      DragAndExchange_GridAppNames_0053
     * @tc.desc      gridAppNames(count=76.87) returns ["App75","App76"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0053 begin`);
      const actual: string[] = gridAppNames(76.87);
      logInfo(`gridAppNames(count=76.87): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`gridAppNames(count=76.87): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=76.87): JSON.stringify(actual.slice(38, 4...${JSON.stringify(actual.slice(38, 44))}`);
      expect(JSON.stringify(actual.slice(38, 44))).assertEqual('["App39","App40","App41","App42","App43","App44"]');
      logInfo(`gridAppNames(count=76.87): JSON.stringify(actual.slice(74, 7...${JSON.stringify(actual.slice(74, 76))}`);
      expect(JSON.stringify(actual.slice(74, 76))).assertEqual('["App75","App76"]');
      logInfo(`${BUNDLE}GridAppNames_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0054
     * @tc.name      DragAndExchange_GridAppNames_0054
     * @tc.desc      gridAppNames(count=106) returns ["App105","App106"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0054 begin`);
      const actual: string[] = gridAppNames(106);
      logInfo(`gridAppNames(count=106): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`gridAppNames(count=106): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=106): JSON.stringify(actual.slice(56, 62))=${JSON.stringify(actual.slice(56, 62))}`);
      expect(JSON.stringify(actual.slice(56, 62))).assertEqual('["App57","App58","App59","App60","App61","App62"]');
      logInfo(`gridAppNames(count=106): JSON.stringify(actual.slice(104, ...${JSON.stringify(actual.slice(104, 106))}`);
      expect(JSON.stringify(actual.slice(104, 106))).assertEqual('["App105","App106"]');
      logInfo(`${BUNDLE}GridAppNames_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0055
     * @tc.name      DragAndExchange_GridAppNames_0055
     * @tc.desc      gridAppNames(count=13) returns ["App8","App9","App10","App11","App12","App13"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0055 begin`);
      const actual: string[] = gridAppNames(13);
      logInfo(`gridAppNames(count=13): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`gridAppNames(count=13): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=13): JSON.stringify(actual.slice(7, 13))=${JSON.stringify(actual.slice(7, 13))}`);
      expect(JSON.stringify(actual.slice(7, 13))).assertEqual('["App8","App9","App10","App11","App12","App13"]');
      logInfo(`${BUNDLE}GridAppNames_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0056
     * @tc.name      DragAndExchange_GridAppNames_0056
     * @tc.desc      gridAppNames(count=87) returns ["App87"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0056 begin`);
      const actual: string[] = gridAppNames(87);
      logInfo(`gridAppNames(count=87): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`gridAppNames(count=87): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=87): JSON.stringify(actual.slice(44, 50))=${JSON.stringify(actual.slice(44, 50))}`);
      expect(JSON.stringify(actual.slice(44, 50))).assertEqual('["App45","App46","App47","App48","App49","App50"]');
      logInfo(`gridAppNames(count=87): JSON.stringify(actual.slice(86, 87))=${JSON.stringify(actual.slice(86, 87))}`);
      expect(JSON.stringify(actual.slice(86, 87))).assertEqual('["App87"]');
      logInfo(`${BUNDLE}GridAppNames_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0057
     * @tc.name      DragAndExchange_GridAppNames_0057
     * @tc.desc      gridAppNames(count=41.49) returns ["App39","App40","App41"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0057 begin`);
      const actual: string[] = gridAppNames(41.49);
      logInfo(`gridAppNames(count=41.49): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(41);
      logInfo(`gridAppNames(count=41.49): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=41.49): JSON.stringify(actual.slice(20, 2...${JSON.stringify(actual.slice(20, 26))}`);
      expect(JSON.stringify(actual.slice(20, 26))).assertEqual('["App21","App22","App23","App24","App25","App26"]');
      logInfo(`gridAppNames(count=41.49): JSON.stringify(actual.slice(38, 4...${JSON.stringify(actual.slice(38, 41))}`);
      expect(JSON.stringify(actual.slice(38, 41))).assertEqual('["App39","App40","App41"]');
      logInfo(`${BUNDLE}GridAppNames_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0058
     * @tc.name      DragAndExchange_GridAppNames_0058
     * @tc.desc      gridAppNames(count=18) returns ["App15","App16","App17","App18"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0058 begin`);
      const actual: string[] = gridAppNames(18);
      logInfo(`gridAppNames(count=18): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(18);
      logInfo(`gridAppNames(count=18): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=18): JSON.stringify(actual.slice(7, 14))=${JSON.stringify(actual.slice(7, 14))}`);
      expect(JSON.stringify(actual.slice(7, 14)))
        .assertEqual('["App8","App9","App10","App11","App12","App13","App14"]');
      logInfo(`gridAppNames(count=18): JSON.stringify(actual.slice(14, 18))=${JSON.stringify(actual.slice(14, 18))}`);
      expect(JSON.stringify(actual.slice(14, 18))).assertEqual('["App15","App16","App17","App18"]');
      logInfo(`${BUNDLE}GridAppNames_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0059
     * @tc.name      DragAndExchange_GridAppNames_0059
     * @tc.desc      gridAppNames(count=54) returns ["App51","App52","App53","App54"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0059 begin`);
      const actual: string[] = gridAppNames(54);
      logInfo(`gridAppNames(count=54): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(54);
      logInfo(`gridAppNames(count=54): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=54): JSON.stringify(actual.slice(26, 32))=${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=54): JSON.stringify(actual.slice(50, 54))=${JSON.stringify(actual.slice(50, 54))}`);
      expect(JSON.stringify(actual.slice(50, 54))).assertEqual('["App51","App52","App53","App54"]');
      logInfo(`${BUNDLE}GridAppNames_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0060
     * @tc.name      DragAndExchange_GridAppNames_0060
     * @tc.desc      gridAppNames(count=93.28) returns ["App93"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0060 begin`);
      const actual: string[] = gridAppNames(93.28);
      logInfo(`gridAppNames(count=93.28): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`gridAppNames(count=93.28): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=93.28): JSON.stringify(actual.slice(50, 5...${JSON.stringify(actual.slice(50, 56))}`);
      expect(JSON.stringify(actual.slice(50, 56))).assertEqual('["App51","App52","App53","App54","App55","App56"]');
      logInfo(`gridAppNames(count=93.28): JSON.stringify(actual.slice(92, 9...${JSON.stringify(actual.slice(92, 93))}`);
      expect(JSON.stringify(actual.slice(92, 93))).assertEqual('["App93"]');
      logInfo(`${BUNDLE}GridAppNames_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0061
     * @tc.name      DragAndExchange_GridAppNames_0061
     * @tc.desc      gridAppNames(count=133) returns ["App129","App130","App131","App132","App133"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0061 begin`);
      const actual: string[] = gridAppNames(133);
      logInfo(`gridAppNames(count=133): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`gridAppNames(count=133): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=133): JSON.stringify(actual.slice(68, 74))=${JSON.stringify(actual.slice(68, 74))}`);
      expect(JSON.stringify(actual.slice(68, 74))).assertEqual('["App69","App70","App71","App72","App73","App74"]');
      logInfo(`gridAppNames(count=133): JSON.stringify(actual.slice(128, ...${JSON.stringify(actual.slice(128, 133))}`);
      expect(JSON.stringify(actual.slice(128, 133))).assertEqual('["App129","App130","App131","App132","App133"]');
      logInfo(`${BUNDLE}GridAppNames_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0062
     * @tc.name      DragAndExchange_GridAppNames_0062
     * @tc.desc      gridAppNames(count=167) returns ["App165","App166","App167"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0062 begin`);
      const actual: string[] = gridAppNames(167);
      logInfo(`gridAppNames(count=167): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(167);
      logInfo(`gridAppNames(count=167): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=167): JSON.stringify(actual.slice(86, 92))=${JSON.stringify(actual.slice(86, 92))}`);
      expect(JSON.stringify(actual.slice(86, 92))).assertEqual('["App87","App88","App89","App90","App91","App92"]');
      logInfo(`gridAppNames(count=167): JSON.stringify(actual.slice(164, ...${JSON.stringify(actual.slice(164, 167))}`);
      expect(JSON.stringify(actual.slice(164, 167))).assertEqual('["App165","App166","App167"]');
      logInfo(`${BUNDLE}GridAppNames_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0063
     * @tc.name      DragAndExchange_GridAppNames_0063
     * @tc.desc      gridAppNames(count=194) returns ["App189","App190","App191","App192","App193","App194"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0063 begin`);
      const actual: string[] = gridAppNames(194);
      logInfo(`gridAppNames(count=194): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(194);
      logInfo(`gridAppNames(count=194): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=194): JSON.stringify(actual.slice(98, 10...${JSON.stringify(actual.slice(98, 104))}`);
      expect(JSON.stringify(actual.slice(98, 104)))
        .assertEqual('["App99","App100","App101","App102","App103","App104"]');
      logInfo(`gridAppNames(count=194): JSON.stringify(actual.slice(188, ...${JSON.stringify(actual.slice(188, 194))}`);
      expect(JSON.stringify(actual.slice(188, 194)))
        .assertEqual('["App189","App190","App191","App192","App193","App194"]');
      logInfo(`${BUNDLE}GridAppNames_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0064
     * @tc.name      DragAndExchange_GridAppNames_0064
     * @tc.desc      gridAppNames(count=36) returns ["App33","App34","App35","App36"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0064 begin`);
      const actual: string[] = gridAppNames(36);
      logInfo(`gridAppNames(count=36): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(36);
      logInfo(`gridAppNames(count=36): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=36): JSON.stringify(actual.slice(20, 26))=${JSON.stringify(actual.slice(20, 26))}`);
      expect(JSON.stringify(actual.slice(20, 26))).assertEqual('["App21","App22","App23","App24","App25","App26"]');
      logInfo(`gridAppNames(count=36): JSON.stringify(actual.slice(32, 36))=${JSON.stringify(actual.slice(32, 36))}`);
      expect(JSON.stringify(actual.slice(32, 36))).assertEqual('["App33","App34","App35","App36"]');
      logInfo(`${BUNDLE}GridAppNames_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0065
     * @tc.name      DragAndExchange_GridAppNames_0065
     * @tc.desc      gridAppNames(count=116) returns ["App111","App112","App113","App114","App115","App116"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0065 begin`);
      const actual: string[] = gridAppNames(116);
      logInfo(`gridAppNames(count=116): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(116);
      logInfo(`gridAppNames(count=116): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=116): JSON.stringify(actual.slice(56, 62))=${JSON.stringify(actual.slice(56, 62))}`);
      expect(JSON.stringify(actual.slice(56, 62))).assertEqual('["App57","App58","App59","App60","App61","App62"]');
      logInfo(`gridAppNames(count=116): JSON.stringify(actual.slice(110, ...${JSON.stringify(actual.slice(110, 116))}`);
      expect(JSON.stringify(actual.slice(110, 116)))
        .assertEqual('["App111","App112","App113","App114","App115","App116"]');
      logInfo(`${BUNDLE}GridAppNames_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0066
     * @tc.name      DragAndExchange_GridAppNames_0066
     * @tc.desc      gridAppNames(count=47) returns ["App45","App46","App47"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0066 begin`);
      const actual: string[] = gridAppNames(47);
      logInfo(`gridAppNames(count=47): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(47);
      logInfo(`gridAppNames(count=47): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=47): JSON.stringify(actual.slice(26, 32))=${JSON.stringify(actual.slice(26, 32))}`);
      expect(JSON.stringify(actual.slice(26, 32))).assertEqual('["App27","App28","App29","App30","App31","App32"]');
      logInfo(`gridAppNames(count=47): JSON.stringify(actual.slice(44, 47))=${JSON.stringify(actual.slice(44, 47))}`);
      expect(JSON.stringify(actual.slice(44, 47))).assertEqual('["App45","App46","App47"]');
      logInfo(`${BUNDLE}GridAppNames_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0067
     * @tc.name      DragAndExchange_GridAppNames_0067
     * @tc.desc      gridAppNames(count=96) returns ["App93","App94","App95","App96"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0067 begin`);
      const actual: string[] = gridAppNames(96);
      logInfo(`gridAppNames(count=96): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`gridAppNames(count=96): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=96): JSON.stringify(actual.slice(50, 56))=${JSON.stringify(actual.slice(50, 56))}`);
      expect(JSON.stringify(actual.slice(50, 56))).assertEqual('["App51","App52","App53","App54","App55","App56"]');
      logInfo(`gridAppNames(count=96): JSON.stringify(actual.slice(92, 96))=${JSON.stringify(actual.slice(92, 96))}`);
      expect(JSON.stringify(actual.slice(92, 96))).assertEqual('["App93","App94","App95","App96"]');
      logInfo(`${BUNDLE}GridAppNames_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0068
     * @tc.name      DragAndExchange_GridAppNames_0068
     * @tc.desc      gridAppNames(count=179) returns ["App177","App178","App179"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0068 begin`);
      const actual: string[] = gridAppNames(179);
      logInfo(`gridAppNames(count=179): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(179);
      logInfo(`gridAppNames(count=179): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=179): JSON.stringify(actual.slice(92, 98))=${JSON.stringify(actual.slice(92, 98))}`);
      expect(JSON.stringify(actual.slice(92, 98))).assertEqual('["App93","App94","App95","App96","App97","App98"]');
      logInfo(`gridAppNames(count=179): JSON.stringify(actual.slice(176, ...${JSON.stringify(actual.slice(176, 179))}`);
      expect(JSON.stringify(actual.slice(176, 179))).assertEqual('["App177","App178","App179"]');
      logInfo(`${BUNDLE}GridAppNames_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0069
     * @tc.name      DragAndExchange_GridAppNames_0069
     * @tc.desc      gridAppNames(count=81) returns ["App81"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0069 begin`);
      const actual: string[] = gridAppNames(81);
      logInfo(`gridAppNames(count=81): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`gridAppNames(count=81): JSON.stringify(actual.slice(0, 7))=${JSON.stringify(actual.slice(0, 7))}`);
      expect(JSON.stringify(actual.slice(0, 7))).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`gridAppNames(count=81): JSON.stringify(actual.slice(44, 50))=${JSON.stringify(actual.slice(44, 50))}`);
      expect(JSON.stringify(actual.slice(44, 50))).assertEqual('["App45","App46","App47","App48","App49","App50"]');
      logInfo(`gridAppNames(count=81): JSON.stringify(actual.slice(80, 81))=${JSON.stringify(actual.slice(80, 81))}`);
      expect(JSON.stringify(actual.slice(80, 81))).assertEqual('["App81"]');
      logInfo(`${BUNDLE}GridAppNames_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_APP_NAMES_0070
     * @tc.name      DragAndExchange_GridAppNames_0070
     * @tc.desc      gridAppNames(count=7) returns ["App1","App2","App3","App4","App5","App6","App7"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridAppNames_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridAppNames_0070 begin`);
      const actual: string[] = gridAppNames(7);
      logInfo(`gridAppNames(count=7): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`gridAppNames(count=7): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["App1","App2","App3","App4","App5","App6","App7"]');
      logInfo(`${BUNDLE}GridAppNames_0070 end`);
    });
  });
}
